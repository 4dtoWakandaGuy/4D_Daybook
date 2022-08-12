//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_JbSbB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_JbSbB")
//New lines added NG april 2004

If ([JOB_STAGES:47]Job_Stage_code:52="")
	[JOB_STAGES:47]Job_Stage_code:52:=String:C10(Gen_Code((Table:C252(->[JOB_STAGES:47]))+255; ->[JOB_STAGES:47]Job_Stage_code:52))
End if 
If ([JOB_STAGES:47]Job_Code:1="")
	[JOB_STAGES:47]Job_Code:1:=[JOBS:26]Job_Code:1
	[JOB_STAGES:47]AT_Actual_Units:5:=1
	[JOB_STAGES:47]B_Actual_Hours:15:=Time:C179(Time string:C180([JOB_STAGES:47]AT_Actual_Units:5*<>SYS_ti_DefaultTimeUnits))
End if 
If ([JOB_STAGES:47]TAX_Code:14="")
	RELATE ONE:C42([JOBS:26]Company_Code:3)
	[JOB_STAGES:47]TAX_Code:14:=Gen_LPTax
End if 
ERR_MethodTrackerReturn("JobStages_JbSbB"; $_t_oldMethodName)