//%attributes = {}
If (False:C215)
	//Project Method Name:      Get Email Owner
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Get Email Owner")

$0:=Current system user:C484
If ($0="")
	$0:=<>PER_t_CurrentUserName
End if 
ERR_MethodTrackerReturn("Get Email Owner"; $_t_oldMethodName)