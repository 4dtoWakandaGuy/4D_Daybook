//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(VJ)
	C_TEXT:C284($_t_JobPersCodeFind; $_t_JobStageCodeFind; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_Mod")

If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_JobPersCodeFind:=$1
End if 

Gen_Mod("View Job Stages"; "JobStages_File"; "Master"; ->[JOB_STAGES:47]; ->vJ; "JobStages_Sel"; "Job Stages"; $_bo_AutoFind; $_t_JobPersCodeFind)
ERR_MethodTrackerReturn("JobStages_Mod"; $_t_oldMethodName)