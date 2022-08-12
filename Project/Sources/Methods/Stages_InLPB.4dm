//%attributes = {}
If (False:C215)
	//Project Method Name:      Stages_InLPB
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
	//ARRAY TEXT(JOB_at_JobTypeCodes;0)
	//ARRAY TEXT(JOB_at_JobTypeIncludes;0)
	//ARRAY TEXT(JOB_at_TypeName;0)
	C_TEXT:C284($_t_oldMethodName; vAccount; vAnalysis)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stages_InLPB")
RELATE ONE:C42([STAGES:45]Sales_Account:3)
vAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([STAGES:45]Analysis_Code:4)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
ERR_MethodTrackerReturn("Stages_InLPB"; $_t_oldMethodName)
ALL RECORDS:C47([JOB_TYPES:65])
SELECTION TO ARRAY:C260([JOB_TYPES:65]Type_Code:1; JOB_at_JobTypeCodes; [JOB_TYPES:65]Type_Name:2; JOB_at_TypeName)
ARRAY TEXT:C222(JOB_at_JobTypeIncludes; 0)
ERR_MethodTrackerReturn("Stages_InLPB"; $_t_oldMethodName)
