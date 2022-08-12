//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_MenusButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_MenusButton")
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Click"; 0)
End if 
Menus_Button
ERR_MethodTrackerReturn("Macro_MenusButton"; $_t_oldMethodName)