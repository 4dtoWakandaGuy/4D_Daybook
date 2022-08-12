//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSProcess")
//Mail_MSProcess


Mail_MSProcess_NEW($1)
ERR_MethodTrackerReturn("Mail_MSProcess"; $_t_oldMethodName)
