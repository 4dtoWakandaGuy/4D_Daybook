//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages InDis
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages InDis")
If ([JOBS:26]Budget_TR:28)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]JT_Budget_Units:4; False:C215)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]AT_Budget_Sales_Amount:8; False:C215)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]JT_Budget_Cost_Amount:30; False:C215)
End if 
If ([JOBS:26]Actual_TR:29)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]AT_Actual_Units:5; False:C215)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]JT_Actual_Sales_Amount:6; False:C215)
	OBJECT SET ENTERABLE:C238([JOB_STAGES:47]JT_Actual_Cost_Amount:29; False:C215)
End if 
ERR_MethodTrackerReturn("JobStages InDis"; $_t_oldMethodName)