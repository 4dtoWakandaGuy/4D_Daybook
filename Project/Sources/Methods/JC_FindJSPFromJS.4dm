//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJSPFromJS
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
	C_TEXT:C284($_t_JobCode; $_t_JobStageCode; $_t_oldMethodName; $_t_StageCode; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSPFromJS")

//JC_FindJSPFromJS

//Added 28/02/07 -kmw

//Finds current Job Stage record's Job Stage Personnel records (or uses passed parameters to find Job Stage Personnel records)

//Tries to find using Job Stage Code link and also via 2 field query on job and stage "composite key".


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSPFromJS")


//
If (Count parameters:C259>0)
	$_l_StageID:=$1
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=$_l_StageID)
Else 
	$_l_StageID:=[JOB_STAGES:47]x_ID:54
End if 
If (Count parameters:C259>1)
	$_t_JobCode:=$2
Else 
	$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
End if 
If (Count parameters:C259>2)
	$_t_StageCode:=$3
Else 
	$_t_StageCode:=[JOB_STAGES:47]Stage_Code:2
End if 
If (Count parameters:C259>3)
	$_t_JobStageCode:=$4
Else 
	$_t_JobStageCode:=[JOB_STAGES:47]Job_Stage_code:52
End if 
//
//******************************************************
//If (Records in selection([JOB STAGES])>0) `should only be 1 record found!
If ($_t_JobStageCode#"")  //Changed to check for blank codes -21/03/07 -kmw
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_stage_Code:17=$_t_JobStageCode)
Else 
	REDUCE SELECTION:C351([JOB PERSONNEL:48]; 0)
End if 
CREATE SET:C116([JOB PERSONNEL:48]; "JSPRecsFromJSLink")
//******************************************************

//******************************************************
//If (Records in selection([JOB STAGES])>0)  `should only be 1 record found!
If ($_t_JobCode#"") & ($_t_StageCode#"")  //Changed to check for blank codes -21/03/07 -kmw
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=$_t_JobCode; *)
	QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=$_t_StageCode)
Else 
	REDUCE SELECTION:C351([JOB PERSONNEL:48]; 0)
End if 
CREATE SET:C116([JOB PERSONNEL:48]; "JSPRecsFromJSCK")
//******************************************************

UNION:C120("JSPRecsFromJSLink"; "JSPRecsFromJSCK"; "JSPRecsFromJS")
//
USE SET:C118("JSPRecsFromJS")
ERR_MethodTrackerReturn("JC_FindJSPFromJS"; $_t_oldMethodName)