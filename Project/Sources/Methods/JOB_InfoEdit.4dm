//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_InfoEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:29
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

$_t_oldMethodName:=ERR_MethodTracker("JOB_InfoEdit")
ERR_MethodTrackerReturn("JOB_InfoEdit"; $_t_oldMethodName)