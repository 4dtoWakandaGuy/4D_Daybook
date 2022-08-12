//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_SbLPB
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_REAL:C285(vTot2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_SbLPB")
If ([JOB_STAGES:47]Job_Code:1="")
	[JOB_STAGES:47]Job_Code:1:=[JOBS:26]Job_Code:1
	DB_bo_RecordModified:=True:C214
End if 
vTot2:=0
If ([JOB_STAGES:47]TAX_Code:14="")
	RELATE ONE:C42([JOBS:26]Company_Code:3)
	[JOB_STAGES:47]TAX_Code:14:=Gen_LPTax
End if 
If ([JOB_STAGES:47]JS_Quoted_Qty:46=0)
	[JOB_STAGES:47]JS_Quoted_Qty:46:=1
End if 
If ([JOB_STAGES:47]Required_Date:50=!00-00-00!)
	[JOB_STAGES:47]Required_Date:50:=[JOBS:26]Required_Date:8
End if 
ERR_MethodTrackerReturn("JobStages_SbLPB"; $_t_oldMethodName)