//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJob")

//JC_FindJob

//Added 26/02/07 -kmw

//Finds current Job Stage record's Job record



QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
ERR_MethodTrackerReturn("JC_FindJob"; $_t_oldMethodName)