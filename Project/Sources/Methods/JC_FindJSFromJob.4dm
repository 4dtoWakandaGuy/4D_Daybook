//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJSFromJob
	//------------------ Method Notes ------------------
	//JC_FindJSFromJob
	
	//Added 28/02/07 -kmw
	
	//Finds current Job record's Job Stage records (or uses passed parameters to find Job Stage records)
	
	//Simply queries Job Stages based on current Job's Job Code or else uses passed parameters
	
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_JobID; $1)
	C_TEXT:C284($_t_JobCode; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSFromJob")



//
If (Count parameters:C259>0)
	$_l_JobID:=$1
Else 
	$_l_JobID:=[JOBS:26]x_ID:49
End if 
//
If (Count parameters:C259>1)
	$_t_JobCode:=$2
Else 
	$_t_JobCode:=[JOBS:26]Job_Code:1
End if 
//
If (Records in selection:C76([JOBS:26])=0)
	QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$_l_JobID)
	If (Records in selection:C76([JOBS:26])=0)
		QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$_t_JobCode)
	End if 
End if 

If (Records in selection:C76([JOBS:26])>0)  //should only be 1 record found!
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_JobCode)
	
Else 
	REDUCE SELECTION:C351([JOB_STAGES:47]; 0)
End if 
//
ERR_MethodTrackerReturn("JC_FindJSFromJob"; $_t_oldMethodName)