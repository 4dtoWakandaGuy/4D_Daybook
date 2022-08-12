//%attributes = {}
If (False:C215)
	//Project Method Name:      AAAM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vMModified)
	C_LONGINT:C283(vMPage)
	C_TEXT:C284(SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5; vMT; vMTitle2; vMTitle3; vMTitle4; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAAM")
//Macros only!
ERR_MethodTrackerReturn("AAAM"; $_t_oldMethodName)
