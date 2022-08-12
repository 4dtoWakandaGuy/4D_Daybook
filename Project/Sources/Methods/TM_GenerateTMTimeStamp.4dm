//%attributes = {}
If (False:C215)
	//Project Method Name:      TM_GenerateTMTimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2014 12:17
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

$_t_oldMethodName:=ERR_MethodTracker("TM_GenerateTMTimeStamp")
ERR_MethodTrackerReturn("TM_GenerateTMTimeStamp"; $_t_oldMethodName)