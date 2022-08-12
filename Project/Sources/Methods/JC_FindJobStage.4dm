//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJobStage
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

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobStage")

//JC_FindJobStage

//Added 26/02/07 -kmw

//Finds current Job Personnel's record's Job Stage record


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobStage")


QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=[JOB PERSONNEL:48]Job_stage_Code:17)

If (Records in selection:C76([JOB_STAGES:47])=0)
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[JOB PERSONNEL:48]Stage_Code:2)
End if 
ERR_MethodTrackerReturn("JC_FindJobStage"; $_t_oldMethodName)