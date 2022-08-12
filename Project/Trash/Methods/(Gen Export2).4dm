//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_Export2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 22:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Export2")
//NG June 2010 This is not called

FIRST RECORD:C50
While (Not:C34(End selection:C36))
	SEND RECORD:C78
	NEXT RECORD:C51
End while 
ERR_MethodTrackerReturn("Gen_Export2"; $_t_oldMethodName)