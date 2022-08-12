//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_WaitForState
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
	C_BOOLEAN:C305(SCPT_bo_NoStop)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_WaitForState")
Record_PlayWfS(SCPT_bo_NoStop; $1)
ERR_MethodTrackerReturn("Macro_WaitForState"; $_t_oldMethodName)