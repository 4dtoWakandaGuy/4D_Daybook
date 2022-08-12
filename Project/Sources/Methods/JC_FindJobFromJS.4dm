//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJobFromJS
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
	C_LONGINT:C283($_l_StageID; $1)
	C_TEXT:C284($_t_JobCode; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobFromJS")

//JC_FindJobFromJS

//Added 28/02/07 -kmw

//Finds current Job Stage record's Job record (or uses passed parameters to find Job record)

//Simply queries jobs based on current Job Stage's job Code or else uses passed parameters


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobFromJS")


//
If (Count parameters:C259>0)
	$_l_StageID:=$1
Else 
	$_l_StageID:=[JOB_STAGES:47]x_ID:54
End if 
//
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=$_l_StageID)
//
If (Count parameters:C259>1)
	$_t_JobCode:=$2
Else 
	$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
End if 
//
If ($_t_JobCode#"")
	QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
Else 
	REDUCE SELECTION:C351([JOBS:26]; 0)
End if 
//

//
ERR_MethodTrackerReturn("JC_FindJobFromJS"; $_t_oldMethodName)