//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJSFromJSP
	//------------------ Method Notes ------------------
	
	//JC_FindJSFromJSP
	
	//Added 28/02/07 -kmw
	
	//Finds current JSP record's Job Stage record (or uses passed parameters to find Job Stage record)
	
	//Tries to find using Job Stage Code and also via the 2 field query on job and stage "composite key".
	
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_JobPerson; $1)
	C_TEXT:C284($_t_JobCode; $_t_JobStageCode; $_t_oldMethodName; $_t_StageCode; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSFromJSP")



//
If (Count parameters:C259>0)
	$_l_JobPerson:=$1
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]X_ID:14=$_l_JobPerson)
Else 
	$_l_JobPerson:=[JOB PERSONNEL:48]X_ID:14
End if 
If (Count parameters:C259>1)
	$_t_JobCode:=$2
Else 
	$_t_JobCode:=[JOB PERSONNEL:48]Job_Code:1
End if 
If (Count parameters:C259>2)
	$_t_StageCode:=$3
Else 
	$_t_StageCode:=[JOB PERSONNEL:48]Stage_Code:2
End if 
If (Count parameters:C259>3)
	$_t_JobStageCode:=$4
Else 
	$_t_JobStageCode:=[JOB PERSONNEL:48]Job_stage_Code:17
End if 
//
//******************************************************
//If (Records in selection([JOB PERSONNEL])>0)  `should only be 1 record found!
If ($_t_JobStageCode#"")  //Changed to check for blank codes -02/04/07 -kmw
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_JobStageCode)
Else 
	REDUCE SELECTION:C351([JOB_STAGES:47]; 0)
End if 
CREATE SET:C116([JOB_STAGES:47]; "JSRecsFromJSPLink")
//******************************************************

//******************************************************
//If (Records in selection([JOB PERSONNEL])>0)  `should only be 1 record found!
If ($_t_JobCode#"") & ($_t_StageCode#"")  //Changed to check for blank codes -02/04/07 -kmw
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_JobCode; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_t_StageCode)
Else 
	REDUCE SELECTION:C351([JOB_STAGES:47]; 0)
End if 
CREATE SET:C116([JOB_STAGES:47]; "JSRecsFromJSPCK")
//******************************************************

UNION:C120("JSRecsFromJSPLink"; "JSRecsFromJSPCK"; "JSRecsFromJSP")
//
USE SET:C118("JSRecsFromJSP")  //should only be one in set
ERR_MethodTrackerReturn("JC_FindJSFromJSP"; $_t_oldMethodName)