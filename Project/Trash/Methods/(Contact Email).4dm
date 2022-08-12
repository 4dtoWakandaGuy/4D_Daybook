//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contact Email
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
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

$_t_oldMethodName:=ERR_MethodTracker("Contact Email")
If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
	
	$0:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Contact Email"; $_t_oldMethodName)