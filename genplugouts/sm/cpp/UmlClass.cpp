
#include "UmlClass.h"
#include "UmlOperation.h"

#include "CppSettings.h"
#include "UmlCom.h"
#include "UmlClassView.h"
#include "UmlDeploymentView.h"
#include "UmlArtifact.h"
//Added by qt3to4:
#include <Q3CString>

void UmlClass::defaultDef() {
  if (cppDecl().isEmpty())
    set_CppDecl(CppSettings::classDecl());
  setUsed();
}

UmlOperation * UmlClass::trigger(Q3CString s, UmlClass * machine, UmlClass * anystate) {
  UmlOperation * tr;
  bool completion = (s == "_completion");
  bool create = (s == "create");

  if (!completion) {
    // the trigger for the user
    
    if (((tr = (UmlOperation *) machine->getChild(anOperation, s)) == 0) &&
	((tr = UmlBaseOperation::create(machine, s)) == 0)) {
      UmlCom::trace("Error : can't create operation '" + s + "' in class '"
		    + machine->name() + "'<br>");
      throw 0;
    }
    if (! tr->isManaged()) {
      tr->defaultDef();
      tr->setType("bool", "${type}");
      if (!create)
	tr->set_CppBody("\
  if (_current_state != 0) {\n\
#ifdef VERBOSE_STATE_MACHINE\n\
    puts(\"DEBUG : fire trigger " + s + "\");\n\
#endif\n\
    _current_state->" + s + "(*this);\n\
  }\n\
  return (_current_state != 0);\n");
      tr->managed();
      tr->setComment("the operation you call to signal the event " + s);
    }
    else
      tr->setUsed();
    
    // the bypass trigger at the anystate level
    
    if (((tr = (UmlOperation *) anystate->getChild(anOperation, s)) == 0) &&
	((tr = UmlBaseOperation::create(anystate, s)) == 0)) {
      UmlCom::trace("Error : can't create operation '" + s + "' in class '"
		    + anystate->name() + "'<br>");
      throw 0;
    }
    if (! tr->isManaged()) {
      tr->defaultDef();
      tr->set_isCppVirtual(TRUE);
      tr->setType("void", "${type}");
      if (tr->params().isEmpty())
	tr->addParam(0, InputOutputDirection, "stm", machine);
      if (create)
	tr->setParams("${t0} &");
      else {
	tr->setParams("${t0} & ${p0}");
	// the trigger is not managed, gives it at the upper level
	tr->set_CppBody("  " + anystate->name() + " * st = _upper(stm);\n\n"
			"  if (st != 0)\n"
			"    st->" + s + "(stm);\n"
			"#ifdef VERBOSE_STATE_MACHINE\n"
			"  else\n"
			"    puts(\"DEBUG : transition " + s + " not expected\");\n"
			"#endif\n");
	tr->setComment("the current state doesn't manage the event "
		       + s + ", give it to the upper state");
      }
      tr->managed();
    }
    else
      tr->setUsed();
  }

  // the trigger for the class

  if (((tr = (UmlOperation *) getChild(anOperation, s)) == 0) &&
      ((tr = UmlBaseOperation::create(this, s)) == 0)) {
    UmlCom::trace("Error : can't create operation '" + s + "' in class '"
		  + name() + "'<br>");
    throw 0;
  }
  tr->defaultDef();
  tr->set_isCppVirtual(TRUE);
  if (tr->params().isEmpty())
    tr->addParam(0, InputOutputDirection, "stm", machine);
  tr->setParams("${t0} & ${p0}");
  if (completion)
    tr->setType("bool", "${type}");
  else {
    tr->setType("void", "${type}");
    tr->setComment("to manage the event " + s);
  }

  return tr;
}

void UmlClass::addDestructor() {
  Q3CString s = "~" + name();
  UmlOperation * destr = (UmlOperation *) getChild(anOperation, s);
  
  if (destr == 0) {
    if ((destr = UmlBaseOperation::create(this, s)) == 0) {
      UmlCom::trace("Error : can't create destructor in class '"
		    + name() + "'<br>");
      return;
    }
  }
  destr->defaultDef();
  destr->setType("", "");
  destr->set_isCppVirtual(TRUE);
}

