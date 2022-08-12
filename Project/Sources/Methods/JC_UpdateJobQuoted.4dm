//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobQuoted
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

//ADDED KMW
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobQuoted")
[JOBS:26]AS_Quoted_Amount:11:=Sum:C1([JOB_STAGES:47]AS_Quoted_Amount:7)
ERR_MethodTrackerReturn("JC_UpdateJobQuoted"; $_t_oldMethodName)