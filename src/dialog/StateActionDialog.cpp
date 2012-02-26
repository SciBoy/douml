// *************************************************************************
//
// Copyright 2004-2010 Bruno PAGES  .
//
// This file is part of the BOUML Uml Toolkit.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
//
// e-mail : bouml@free.fr
// home   : http://bouml.free.fr
//
// *************************************************************************





#include <q3grid.h> 
#include <q3vbox.h>
#include <qlabel.h>
#include <q3combobox.h> 
#include <qpushbutton.h> 

#include "StateActionDialog.h"
#include "StateActionData.h"
#include "BrowserStateAction.h"
#include "KeyValueTable.h"
#include "UmlWindow.h"
#include "DialogUtil.h"
#include "strutil.h"
#include "UmlDesktop.h"
#include "BodyDialog.h"
#include "GenerationSettings.h"
#include "ProfiledStereotypes.h"
#include "translate.h"

QSize StateActionDialog::previous_size;

StateActionDialog::StateActionDialog(StateActionData * d)
    : Q3TabDialog(0, 0, FALSE, Qt::WDestructiveClose), action(d) {
  d->browser_node->edit_start();
  
  if (d->browser_node->is_writable()) {
    setOkButton(TR("OK"));
    setCancelButton(TR("Cancel"));
  }
  else {
    setOkButton(QString::null);
    setCancelButton(TR("Close"));
  }

  setCaption(TR("State Action dialog"));
  visit = !hasOkButton();  

  BrowserNode * bn = action->browser_node;
  
  
  //
  // general tab
  //
  
  QWidget * grid = GridConverter::InitNewGrid(this, 2);
  
  
  
  GridController::PlaceWidget(new QLabel(TR("stereotype : "), grid),grid);
  edstereotype = new Q3ComboBox(!visit, grid);
  edstereotype->insertItem(toUnicode(action->get_stereotype()));
  if (!visit) {
    edstereotype->insertStringList(BrowserStateAction::default_stereotypes());
    edstereotype->insertStringList(ProfiledStereotypes::defaults(UmlStateAction));
    edstereotype->setAutoCompletion(completion());
  }
  edstereotype->setCurrentItem(0);
  QSizePolicy sp = edstereotype->sizePolicy();
  sp.setHorData(QSizePolicy::Expanding);
  edstereotype->setSizePolicy(sp);
  
  QWidget * vtab = GridController::PlaceVertical(grid);
  new QLabel(TR("description :"), vtab);
  if (! visit)
    connect(new SmallPushButton(TR("Editor"), vtab), SIGNAL(clicked()),
	    this, SLOT(edit_description()));
  comment = new MultiLineEdit(grid);
  comment->setReadOnly(visit);
  comment->setText(bn->get_comment());
  //comment->setFont(font);
  
  addTab(grid, "Uml");

  // OCL
  QWidget * grid = GridConverter::InitNewGrid(this, 2);
  umltab = grid;
  
  
  
  GridController::PlaceWidget(new QLabel(TR("behavior"), grid),grid);
  uml = new MultiLineEdit(grid);
  uml->setText(action->uml);
  if (visit)
    uml->setReadOnly(TRUE);
  
  addTab(grid, "Ocl");

  // CPP
  QWidget * grid = GridConverter::InitNewGrid(this, 2);
  cpptab = grid;
  
  
  
  GridController::PlaceWidget(new QLabel(TR("behavior"), grid),grid);
  cpp = new MultiLineEdit(grid);
  cpp->setText(action->cpp);
  if (visit)
    cpp->setReadOnly(TRUE);
  
  addTab(grid, "C++");
  
  if (! GenerationSettings::cpp_get_default_defs())
    removePage(grid);
  
  // Java
  QWidget * grid = GridConverter::InitNewGrid(this, 2);
  javatab = grid;
  
  
  
  GridController::PlaceWidget(new QLabel(TR("behavior"), grid),grid);
  java = new MultiLineEdit(grid);
  java->setText(action->java);
  if (visit)
    java->setReadOnly(TRUE);
  
  addTab(grid, "Java");
  
  if (! GenerationSettings::java_get_default_defs())
    removePage(grid);

  // USER : list key - value
  
  QWidget * grid = GridConverter::InitNewGrid(this, 2);
  
  
  
  kvtable =	GridController::PlaceWidget(new KeyValuesTable(bn, grid, visit), grid);
  addTab(grid, TR("Properties"));
  
  //
    
  connect(this, SIGNAL(currentChanged(QWidget *)),
	  this, SLOT(change_tabs(QWidget *)));
  
  open_dialog(this);
}

StateActionDialog::~StateActionDialog() {
  action->browser_node->edit_end();
  previous_size = size();
  
  while (!edits.isEmpty())
    edits.take(0)->close();
  
  close_dialog(this);
}

void StateActionDialog::change_tabs(QWidget * w) {
  if (!visit) {
    if (w == umltab)
      uml->setFocus();
    else if (w == cpptab)
      cpp->setFocus();
    else if (w == javatab)
      java->setFocus();
  }
}

void StateActionDialog::polish() {
  Q3TabDialog::polish();
  UmlDesktop::limitsize_center(this, previous_size, 0.8, 0.8);
}

void StateActionDialog::edit_description() {
  edit(comment->text(), "state_description", action, TxtEdit,
       this, (post_edit) post_edit_description, edits);
}

void StateActionDialog::post_edit_description(StateActionDialog * d, QString s)
{
  d->comment->setText(s);
}

void StateActionDialog::accept() {
  if (!check_edits(edits) || !kvtable->check_unique())
    return;
    
  BrowserNode * bn = action->browser_node;
  bool newst = action->set_stereotype(fromUnicode(edstereotype->currentText().stripWhiteSpace()));
  
  action->uml = uml->text();
  action->cpp = cpp->text();
  action->java = java->text();
  
  bn->set_comment(comment->text());
  UmlWindow::update_comment_if_needed(bn);
  
  kvtable->update(bn);
  
  ProfiledStereotypes::modified(bn, newst);
  
  bn->modified();
  bn->package_modified();
  action->modified();
  
  Q3TabDialog::accept();
}
