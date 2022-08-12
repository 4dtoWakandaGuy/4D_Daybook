If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.Field5
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRD_t_MacroName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.Field5"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		Check_MinorNC(->[COMPONENTS:86]Build_Code_Macro:14; "Script"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Script")
		If ([COMPONENTS:86]Build_Code_Macro:14#"")
			If ([SCRIPTS:80]Script_Code:1#[COMPONENTS:86]Build_Code_Macro:14)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=[COMPONENTS:86]Build_Code_Macro:14)
				PRD_t_MacroName:=[SCRIPTS:80]Script_Name:2
			Else 
				PRD_t_MacroName:=""
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.Field5"; $_t_oldMethodName)
