//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Tab
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

$_t_oldMethodName:=ERR_MethodTracker("Macro_Tab")
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Key Tab")
End if 
Gen_PostKey(0; 9; 0)
ERR_MethodTrackerReturn("Macro_Tab"; $_t_oldMethodName)