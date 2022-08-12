If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.oComponentSection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_SectionIDS;0)
	//ARRAY TEXT(PRD_at_SectionNames;0)
	C_BOOLEAN:C305(PC_bo_ComponentMod)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oComponentSection"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PRD_at_SectionNames>0)
			[COMPONENTS:86]X_Build_Code_Section_ID:18:=PRD_al_SectionIDS{PRD_at_SectionNames}
			[COMPONENTS:86]Build_Code_Section:10:=PRD_at_SectionNames{PRD_at_SectionNames}
			PC_bo_ComponentMod:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oComponentSection"; $_t_oldMethodName)
