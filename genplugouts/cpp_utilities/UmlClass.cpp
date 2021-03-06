
#include "UmlClass.h"

#include "ConstrDestrCopyDialog.h"
#include "UmlParameter.h"
#include "UmlOperation.h"
#include "CppSettings.h"
#include "UmlCom.h"
//Added by qt3to4:
#include <Q3CString>
#include <Q3ValueList>

void UmlClass::utilities() {
  const Q3PtrVector<UmlItem> ch = children();
  bool have_constructor = FALSE;
  bool have_destructor = FALSE;
  Q3CString destr = "~" + name();
  bool have_copy = FALSE;
  bool have_const_copy = FALSE;
  bool have_assignment = FALSE;
  bool have_const_assignment = FALSE;
  
  for (unsigned i = 0; i != ch.size(); i += 1) {
    if (ch[i]->kind() == anOperation) { //[rageek] literal comparison
      Q3CString s = ch[i]->name(); //[rageek]

      
      if (s == name()) {
	// may be a constructor or a copy constructor
	const Q3ValueList<UmlParameter> params = 
	  ((UmlOperation *) ch[i])->params();
	
	if (params.count() == 1) {
	  const UmlParameter & param = *(params.at(0));
	  
	  if (param.type.type == this) {
	    if (param.dir == InputDirection)
	      have_const_copy = TRUE;
	    else
	      have_copy = TRUE;
	  }
	  else
	    have_constructor = TRUE;
	}
	else
	  have_constructor = TRUE;
      }
      else if (s == destr)
	have_destructor = TRUE;
      else if (s == "operator=") {
	const Q3ValueList<UmlParameter> params = 
	  ((UmlOperation *) ch[i])->params();
	
	if (params.count() == 1) {
	  if ((*(params.at(0))).dir == InputDirection)
	    have_const_assignment = TRUE;
	  else
	    have_assignment = TRUE;
	}
      }
    }
  }

  ConstrDestrCopyDialog d(this, have_constructor, have_destructor,
			  have_copy, have_const_copy, 
			  have_assignment, have_const_assignment);
  
  d.exec();


}

void UmlClass::addContructor(bool expl) {
  UmlOperation * op = UmlOperation::create(this, name());
  
  if (op == 0)
    UmlCom::trace("can't add contructor");
  else {
    Q3CString s;
    int index;
    
    // remove the useless "${type} " mainly to remove the space
    
    s = op->cppDecl();
    if (s.isEmpty())
      s = CppSettings::operationDecl();
    if ((index = s.find("${type} ")) != -1)
      s.remove(index, 8);
    if (expl && ((index = s.find("${name}")) != -1))
      s.insert(index, "explicit ");
    op->set_CppDecl(s);
    
    s = op->cppDef();
    if (s.isEmpty())
      s = CppSettings::operationDef();
    if ((index = s.find("${type} ")) != -1)
      s.remove(index, 8);
    op->set_CppDef(s);
  }
}

void UmlClass::addDestructor(bool virt) {
  UmlOperation * op = UmlOperation::create(this, "~" + name());
  
  if (op == 0)
    UmlCom::trace("can't add destructor");
  else {
    if (virt)
      op->set_isCppVirtual(TRUE);
    
    Q3CString s;
    int index;
    
    // remove the useless "${type} " mainly to remove the space
    
    s = op->cppDecl();
    if (s.isEmpty())
      s = CppSettings::operationDecl();
    if ((index = s.find("${type} ")) != -1) {
      s.remove(index, 8);
      op->set_CppDecl(s);
    }
    
    s = op->cppDef();
    if (s.isEmpty())
      s = CppSettings::operationDef();
    if ((index = s.find("${type} ")) != -1) {
      s.remove(index, 8);
      op->set_CppDef(s);
    }
  }
}

void UmlClass::addCopy(bool cte) {
  UmlOperation * op = UmlOperation::create(this, name());
  
  if (op == 0)
    UmlCom::trace("can't add copy contructor");
  else {
    // to see that it is a copy constructor
    op->set_Stereotype("copy");
    
    // add 'source' parameter
    
    UmlParameter param;
    
    param.name = "source";
    param.dir = (cte) ? InputDirection : InputOutputDirection;
    param.type.type = this;
    
    op->addParameter(0, param);
    
    // add the parameter profile, and 
    // remove the useless "${type} " mainly to remove the space
    
    Q3CString p = (cte) ? "const ${t0} & ${p0}" : "${t0} & ${p0}";
    Q3CString s;
    int index;
    
    s = op->cppDecl();
    if (s.isEmpty())
      s = CppSettings::operationDecl();
    if ((index = s.find("${(}")) != -1)
      s.insert(index + 4, (const char*)p); //[rageek] cast because Q3CString 
    if ((index = s.find("${type} ")) != -1)
      s.remove(index, 8);
    op->set_CppDecl(s);
    
    s = op->cppDef();
    if (s.isEmpty())
      s = CppSettings::operationDef();
    if ((index = s.find("${(}")) != -1)
      s.insert(index + 4, (const char*)p); //[rageek] cast because Q3CString 
    if ((index = s.find("${type} ")) != -1)
      s.remove(index, 8);
    op->set_CppDef(s);
  }
}

void UmlClass::addAssign(bool cte) {
  UmlOperation * op = UmlOperation::create(this, "operator=");
  
  if (op == 0)
    UmlCom::trace("can't add assignment contructor");
  else {
    // add 'source' parameter
    
    UmlParameter param;
    
    param.name = "source";
    param.dir = (cte) ? InputDirection : InputOutputDirection;
    param.type.type = this;
    
    op->addParameter(0, param);
    
    // set return type, add the parameter profile
    
    UmlTypeSpec t;
    
    t.type = this;
    
    op->set_ReturnType(t);
    
    Q3CString p = (cte) ? "const ${t0} & ${p0}" : "${t0} & ${p0}";
    Q3CString s;
    int index;
    
    s = op->cppDecl();
    if (s.isEmpty())
      s = CppSettings::operationDecl();
    if ((index = s.find("${(}")) != -1)
      s.insert(index + 4,(const char*)p); //[rageek] cast because Q3CString 

    if ((index = s.find("${type}")) != -1)
      s.insert(index + 7, " &");
    op->set_CppDecl(s);
    
    s = op->cppDef();
    if (s.isEmpty())
      s = CppSettings::operationDef();
    if ((index = s.find("${(}")) != -1)
      s.insert(index + 4,(const char*)p); //[rageek] cast because Q3CString 

    if ((index = s.find("${type}")) != -1)
      s.insert(index + 7, " &");
    op->set_CppDef(s);
  }
}

