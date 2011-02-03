TEMPLATE	= app
TARGET		= ghtml
CONFIG		+= release warn_on qt
DEFINES		= WITHCPP WITHJAVA WITHIDL WITHPHP WITHPYTHON
HEADERS		= ./UmlBaseRelation.h \
		  ./UmlFormalParameter.h \
		  ./UmlCollaborationMessage.h \
		  ./UmlOnSignalAction.h \
		  ./UmlBaseDeployment.h \
		  ./UmlTerminatePseudoState.h \
		  ./UmlActivityNode.h \
		  ./UmlBaseNcRelation.h \
		  ./UmlBaseTransition.h \
		  ./UmlSettingsCmd.h \
		  ./UmlBaseView.h \
		  ./UmlExpansionNode.h \
		  ./UmlBaseUseCaseAssociation.h \
		  ./UmlBaseAttribute.h \
		  ./UmlBaseActivityControlNode.h \
		  ./UmlActivityParameter.h \
		  ./UmlActivityControlNode.h \
		  ./UmlBaseCollaborationDiagram.h \
		  ./UmlActivityObject.h \
		  ./UmlPseudoState.h \
		  ./UmlBaseClassView.h \
		  ./UmlActivity.h \
		  ./UmlItem.h \
		  ./UmlClassItem.h \
		  ./UmlBaseClassMember.h \
		  ./UmlRelation.h \
		  ./UmlActualParameter.h \
		  ./UmlSequenceMessage.h \
		  ./UmlDiagram.h \
		  ./UmlActivityPin.h \
		  ./UmlActivityPartition.h \
		  ./UmlJunctionPseudoState.h \
		  ./CppSettingsCmd.h \
		  ./aVisibility.h \
		  ./UmlBaseExtraClassMember.h \
		  ./Vector.h \
		  ./UmlBaseActivityActionClasses.h \
		  ./UmlBaseActivity.h \
		  ./UmlCollaborationDiagramDefinition.h \
		  ./UmlFragmentCompartment.h \
		  ./UmlChoicePseudoState.h \
		  ./anOrdering.h \
		  ./UmlSequenceDiagram.h \
		  ./aParameterEffectKind.h \
		  ./aRelationKind.h \
		  ./UmlBaseSequenceMessage.h \
		  ./UmlBaseCollaborationMessage.h \
		  ./UmlBaseSequenceDiagramDefinition.h \
		  ./UmlBaseFinalState.h \
		  ./UmlBaseTerminatePseudoState.h \
		  ./IdlSettingsCmd.h \
		  ./OnInstanceCmd.h \
		  ./UmlBaseComponentDiagram.h \
		  ./UmlClassMember.h \
		  ./UmlBaseJoinPseudoState.h \
		  ./aMessageKind.h \
		  ./UmlClassInstanceReference.h \
		  ./UmlActivityRegion.h \
		  ./UmlUseCase.h \
		  ./UmlFinalState.h \
		  ./UmlExpansionRegion.h \
		  ./UmlView.h \
		  ./UmlBaseFragmentCompartment.h \
		  ./UmlRegion.h \
		  ./UmlBaseChoicePseudoState.h \
		  ./UmlState.h \
		  ./UmlPackage.h \
		  ./aLanguage.h \
		  ./anItemKind.h \
		  ./UmlBuiltin.h \
		  ./UmlBaseState.h \
		  ./UmlBaseItem.h \
		  ./UmlBaseActivityPartition.h \
		  ./UmlBaseExitPointPseudoState.h \
		  ./PhpSettings.h \
		  ./UmlUseCaseAssociation.h \
		  ./UmlEntryPointPseudoState.h \
		  ./UmlBaseUseCaseDiagram.h \
		  ./UmlBaseComponent.h \
		  ./UmlBaseClassInstance.h \
		  ./UmlBaseInterruptibleActivityRegion.h \
		  ./UmlTypeSpec.h \
		  ./UmlMessage.h \
		  ./JavaSettingsCmd.h \
		  ./UmlBaseInitialPseudoState.h \
		  ./PythonSettings.h \
		  ./UmlUseCaseReference.h \
		  ./UmlCom.h \
		  ./anExpansionKind.h \
		  ./UmlComponentDiagram.h \
		  ./ClassGlobalCmd.h \
		  ./UmlCollaborationDiagram.h \
		  ./UmlBaseDeploymentDiagram.h \
		  ./UmlActivityAction.h \
		  ./UmlInterruptibleActivityRegion.h \
		  ./TransitionBehavior.h \
		  ./IdlSettings.h \
		  ./UmlBaseActivityObject.h \
		  ./UmlBaseActivityRegion.h \
		  ./UmlBaseActivityPin.h \
		  ./UmlObjectDiagram.h \
		  ./UmlBaseDeploymentView.h \
		  ./UmlBaseActivityParameter.h \
		  ./UmlBaseParameterSet.h \
		  ./UmlBaseStateDiagram.h \
		  ./UmlStereotype.h \
		  ./UmlBaseComponentView.h \
		  ./UmlSettings.h \
		  ./UmlUseCaseDiagram.h \
		  ./UmlBaseClassInstanceReference.h \
		  ./UmlBaseSubject.h \
		  ./UmlBaseExpansionNode.h \
		  ./UmlActivityDiagram.h \
		  ./UmlBaseRegion.h \
		  ./UmlNode.h \
		  ./UmlBaseFlow.h \
		  ./UmlForkPseudoState.h \
		  ./PackageGlobalCmd.h \
		  ./UmlBaseAccessVariableValueAction.h \
		  ./SlotAttribute.h \
		  ./UmlClassView.h \
		  ./UmlBaseObjectDiagram.h \
		  ./UmlBaseUseCaseView.h \
		  ./UmlActivityActionClasses.h \
		  ./UmlBaseParameter.h \
		  ./UmlBaseActivityAction.h \
		  ./CmdFamily.h \
		  ./UmlBaseEntryPointPseudoState.h \
		  ./PhpSettingsCmd.h \
		  ./UmlBaseStateAction.h \
		  ./UmlBaseForkPseudoState.h \
		  ./UmlBaseShallowHistoryPseudoState.h \
		  ./UmlDeploymentDiagram.h \
		  ./UmlBaseOnSignalAction.h \
		  ./UmlInitialPseudoState.h \
		  ./UmlComponentView.h \
		  ./UmlJoinPseudoState.h \
		  ./FlowBehavior.h \
		  ./UmlBaseDeepHistoryPseudoState.h \
		  ./UmlBaseJunctionPseudoState.h \
		  ./UmlNcRelation.h \
		  ./UmlBaseActivityControlNodeClasses.h \
		  ./UmlBaseClassItem.h \
		  ./UmlBaseSequenceDiagram.h \
		  ./UmlDeploymentView.h \
		  ./UmlArtifact.h \
		  ./UmlFragment.h \
		  ./UmlUseCaseDiagramDefinition.h \
		  ./UmlBaseArtifact.h \
		  ./UmlBaseFragment.h \
		  ./SlotRelation.h \
		  ./UmlSubject.h \
		  ./UmlBaseActualParameter.h \
		  ./UmlBasePackage.h \
		  ./JavaSettings.h \
		  ./UmlSequenceDiagramDefinition.h \
		  ./MiscGlobalCmd.h \
		  ./UmlActivityControlNodeClasses.h \
		  ./UmlBaseUseCase.h \
		  ./UmlBaseCollaborationDiagramDefinition.h \
		  ./UmlActivityItem.h \
		  ./UmlBaseTypeSpec.h \
		  ./UmlBaseFormalParameter.h \
		  ./UmlStateItem.h \
		  ./UmlBaseNode.h \
		  ./UmlPinParameter.h \
		  ./UmlComponent.h \
		  ./UmlBaseClassDiagram.h \
		  ./aDirection.h \
		  ./PythonSettingsCmd.h \
		  ./UmlStateAction.h \
		  ./UmlBaseActivityDiagram.h \
		  ./UmlParameterSet.h \
		  ./UmlBaseExpansionRegion.h \
		  ./UmlBaseUseCaseReference.h \
		  ./UmlBaseMessage.h \
		  ./UmlStateDiagram.h \
		  ./UmlShallowHistoryPseudoState.h \
		  ./UmlAttribute.h \
		  ./UmlClass.h \
		  ./CppSettings.h \
		  ./UmlBaseUseCaseDiagramDefinition.h \
		  ./StateBehavior.h \
		  ./UmlExitPointPseudoState.h \
		  ./UmlBaseClass.h \
		  ./UmlBaseDiagram.h \
		  ./UmlOperation.h \
		  ./UmlClassInstance.h \
		  ./UmlParameter.h \
		  ./UmlUseCaseView.h \
		  ./FileWriter.h \
		  ./UmlBasePinParameter.h \
		  ./UmlFlow.h \
		  ./UmlClassDiagram.h \
		  ./UmlBaseOperation.h \
		  ./UmlExtraClassMember.h \
		  ./UmlAccessVariableValueAction.h \
		  ./UmlDeepHistoryPseudoState.h \
		  ./UmlBaseActivityNode.h \
		  ./UmlTransition.h
SOURCES		= ./UmlBaseRelation.cpp \
		  ./UmlFormalParameter.cpp \
		  ./UmlCollaborationMessage.cpp \
		  ./UmlOnSignalAction.cpp \
		  ./UmlBaseDeployment.cpp \
		  ./UmlTerminatePseudoState.cpp \
		  ./UmlActivityNode.cpp \
		  ./UmlBaseNcRelation.cpp \
		  ./UmlBaseTransition.cpp \
		  ./UmlSettingsCmd.cpp \
		  ./UmlBaseView.cpp \
		  ./UmlExpansionNode.cpp \
		  ./UmlBaseUseCaseAssociation.cpp \
		  ./UmlBaseAttribute.cpp \
		  ./UmlBaseActivityControlNode.cpp \
		  ./UmlActivityParameter.cpp \
		  ./UmlActivityControlNode.cpp \
		  ./UmlBaseCollaborationDiagram.cpp \
		  ./UmlActivityObject.cpp \
		  ./UmlPseudoState.cpp \
		  ./UmlBaseClassView.cpp \
		  ./UmlActivity.cpp \
		  ./UmlItem.cpp \
		  ./UmlClassItem.cpp \
		  ./UmlBaseClassMember.cpp \
		  ./UmlRelation.cpp \
		  ./UmlActualParameter.cpp \
		  ./UmlSequenceMessage.cpp \
		  ./UmlDiagram.cpp \
		  ./UmlActivityPin.cpp \
		  ./UmlActivityPartition.cpp \
		  ./UmlJunctionPseudoState.cpp \
		  ./CppSettingsCmd.cpp \
		  ./aVisibility.cpp \
		  ./UmlBaseExtraClassMember.cpp \
		  ./Vector.cpp \
		  ./UmlBaseActivityActionClasses.cpp \
		  ./UmlBaseActivity.cpp \
		  ./UmlCollaborationDiagramDefinition.cpp \
		  ./UmlFragmentCompartment.cpp \
		  ./UmlChoicePseudoState.cpp \
		  ./anOrdering.cpp \
		  ./UmlSequenceDiagram.cpp \
		  ./aParameterEffectKind.cpp \
		  ./aRelationKind.cpp \
		  ./UmlBaseSequenceMessage.cpp \
		  ./UmlBaseCollaborationMessage.cpp \
		  ./UmlBaseSequenceDiagramDefinition.cpp \
		  ./UmlBaseFinalState.cpp \
		  ./UmlBaseTerminatePseudoState.cpp \
		  ./IdlSettingsCmd.cpp \
		  ./OnInstanceCmd.cpp \
		  ./UmlBaseComponentDiagram.cpp \
		  ./UmlClassMember.cpp \
		  ./UmlBaseJoinPseudoState.cpp \
		  ./aMessageKind.cpp \
		  ./UmlClassInstanceReference.cpp \
		  ./UmlActivityRegion.cpp \
		  ./UmlUseCase.cpp \
		  ./UmlFinalState.cpp \
		  ./UmlExpansionRegion.cpp \
		  ./UmlView.cpp \
		  ./UmlBaseFragmentCompartment.cpp \
		  ./UmlRegion.cpp \
		  ./UmlBaseChoicePseudoState.cpp \
		  ./UmlState.cpp \
		  ./UmlPackage.cpp \
		  ./aLanguage.cpp \
		  ./anItemKind.cpp \
		  ./UmlBuiltin.cpp \
		  ./UmlBaseState.cpp \
		  ./UmlBaseItem.cpp \
		  ./UmlBaseActivityPartition.cpp \
		  ./UmlBaseExitPointPseudoState.cpp \
		  ./PhpSettings.cpp \
		  ./UmlUseCaseAssociation.cpp \
		  ./UmlEntryPointPseudoState.cpp \
		  ./UmlBaseUseCaseDiagram.cpp \
		  ./UmlBaseComponent.cpp \
		  ./UmlBaseClassInstance.cpp \
		  ./UmlBaseInterruptibleActivityRegion.cpp \
		  ./UmlTypeSpec.cpp \
		  ./UmlMessage.cpp \
		  ./JavaSettingsCmd.cpp \
		  ./UmlBaseInitialPseudoState.cpp \
		  ./PythonSettings.cpp \
		  ./UmlUseCaseReference.cpp \
		  ./UmlCom.cpp \
		  ./anExpansionKind.cpp \
		  ./UmlComponentDiagram.cpp \
		  ./ClassGlobalCmd.cpp \
		  ./UmlCollaborationDiagram.cpp \
		  ./UmlBaseDeploymentDiagram.cpp \
		  ./UmlActivityAction.cpp \
		  ./UmlInterruptibleActivityRegion.cpp \
		  ./TransitionBehavior.cpp \
		  ./IdlSettings.cpp \
		  ./UmlBaseActivityObject.cpp \
		  ./UmlBaseActivityRegion.cpp \
		  ./UmlBaseActivityPin.cpp \
		  ./UmlObjectDiagram.cpp \
		  ./UmlBaseDeploymentView.cpp \
		  ./UmlBaseActivityParameter.cpp \
		  ./UmlBaseParameterSet.cpp \
		  ./UmlBaseStateDiagram.cpp \
		  ./UmlStereotype.cpp \
		  ./UmlBaseComponentView.cpp \
		  ./UmlSettings.cpp \
		  ./UmlUseCaseDiagram.cpp \
		  ./UmlBaseClassInstanceReference.cpp \
		  ./UmlBaseSubject.cpp \
		  ./UmlBaseExpansionNode.cpp \
		  ./UmlActivityDiagram.cpp \
		  ./UmlBaseRegion.cpp \
		  ./Main.cpp \
		  ./UmlNode.cpp \
		  ./UmlBaseFlow.cpp \
		  ./UmlForkPseudoState.cpp \
		  ./PackageGlobalCmd.cpp \
		  ./UmlBaseAccessVariableValueAction.cpp \
		  ./SlotAttribute.cpp \
		  ./UmlClassView.cpp \
		  ./UmlBaseObjectDiagram.cpp \
		  ./UmlBaseUseCaseView.cpp \
		  ./UmlActivityActionClasses.cpp \
		  ./UmlBaseParameter.cpp \
		  ./UmlBaseActivityAction.cpp \
		  ./CmdFamily.cpp \
		  ./UmlBaseEntryPointPseudoState.cpp \
		  ./PhpSettingsCmd.cpp \
		  ./UmlBaseStateAction.cpp \
		  ./UmlBaseForkPseudoState.cpp \
		  ./UmlBaseShallowHistoryPseudoState.cpp \
		  ./UmlDeploymentDiagram.cpp \
		  ./UmlBaseOnSignalAction.cpp \
		  ./UmlInitialPseudoState.cpp \
		  ./UmlComponentView.cpp \
		  ./UmlJoinPseudoState.cpp \
		  ./FlowBehavior.cpp \
		  ./UmlBaseDeepHistoryPseudoState.cpp \
		  ./UmlBaseJunctionPseudoState.cpp \
		  ./UmlNcRelation.cpp \
		  ./UmlBaseActivityControlNodeClasses.cpp \
		  ./UmlBaseClassItem.cpp \
		  ./UmlBaseSequenceDiagram.cpp \
		  ./UmlDeploymentView.cpp \
		  ./UmlArtifact.cpp \
		  ./UmlFragment.cpp \
		  ./UmlUseCaseDiagramDefinition.cpp \
		  ./UmlBaseArtifact.cpp \
		  ./UmlBaseFragment.cpp \
		  ./SlotRelation.cpp \
		  ./UmlSubject.cpp \
		  ./UmlBaseActualParameter.cpp \
		  ./UmlBasePackage.cpp \
		  ./JavaSettings.cpp \
		  ./UmlSequenceDiagramDefinition.cpp \
		  ./MiscGlobalCmd.cpp \
		  ./UmlActivityControlNodeClasses.cpp \
		  ./UmlBaseUseCase.cpp \
		  ./UmlBaseCollaborationDiagramDefinition.cpp \
		  ./UmlActivityItem.cpp \
		  ./UmlBaseTypeSpec.cpp \
		  ./UmlBaseFormalParameter.cpp \
		  ./UmlStateItem.cpp \
		  ./UmlBaseNode.cpp \
		  ./UmlPinParameter.cpp \
		  ./UmlComponent.cpp \
		  ./UmlBaseClassDiagram.cpp \
		  ./aDirection.cpp \
		  ./PythonSettingsCmd.cpp \
		  ./UmlStateAction.cpp \
		  ./UmlBaseActivityDiagram.cpp \
		  ./UmlParameterSet.cpp \
		  ./UmlBaseExpansionRegion.cpp \
		  ./UmlBaseUseCaseReference.cpp \
		  ./UmlBaseMessage.cpp \
		  ./UmlStateDiagram.cpp \
		  ./UmlShallowHistoryPseudoState.cpp \
		  ./UmlAttribute.cpp \
		  ./UmlClass.cpp \
		  ./CppSettings.cpp \
		  ./UmlBaseUseCaseDiagramDefinition.cpp \
		  ./StateBehavior.cpp \
		  ./UmlExitPointPseudoState.cpp \
		  ./UmlBaseClass.cpp \
		  ./UmlBaseDiagram.cpp \
		  ./UmlOperation.cpp \
		  ./UmlClassInstance.cpp \
		  ./UmlParameter.cpp \
		  ./UmlUseCaseView.cpp \
		  ./FileWriter.cpp \
		  ./UmlBasePinParameter.cpp \
		  ./UmlFlow.cpp \
		  ./UmlClassDiagram.cpp \
		  ./UmlBaseOperation.cpp \
		  ./UmlExtraClassMember.cpp \
		  ./UmlAccessVariableValueAction.cpp \
		  ./UmlDeepHistoryPseudoState.cpp \
		  ./UmlBaseActivityNode.cpp \
		  ./UmlTransition.cpp

#The following line was inserted by qt3to4
QT += network  qt3support 
