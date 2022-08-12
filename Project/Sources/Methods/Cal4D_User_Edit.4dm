//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_User_Edit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_User_Edit")
ERR_MethodTrackerReturn("Cal4D_User_Edit"; $_t_oldMethodName)