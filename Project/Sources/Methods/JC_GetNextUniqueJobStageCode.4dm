//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_GetNextUniqueJobStageCode
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
	C_TEXT:C284($_t_JobStageCode; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_GetNextUniqueJobStageCode")



$_t_JobStageCode:=String:C10(Gen_Code((Table:C252(->[JOB_STAGES:47]))+255; ->[JOB_STAGES:47]Job_Stage_code:52))

$0:=$_t_JobStageCode
ERR_MethodTrackerReturn("JC_GetNextUniqueJobStageCode"; $_t_oldMethodName)