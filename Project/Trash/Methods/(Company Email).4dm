//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Company Email
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company Email")
$0:=[COMPANIES:2]Email_Before_At:58+"@"+[COMPANIES:2]EMail_After_At:55
ERR_MethodTrackerReturn("Company Email"; $_t_oldMethodName)