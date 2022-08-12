//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages BkMVA
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages BkMVA")
If ([TAX_CODES:35]Tax_Code:1#[JOB_STAGES:47]B_Applicant_TAX:17)
	RELATE ONE:C42([JOB_STAGES:47]B_Applicant_TAX:17)
End if 
[JOB_STAGES:47]B_Applicant_TAX_Amount:23:=Round:C94(([JOB_STAGES:47]AT_Budget_Sales_Amount:8*([TAX_CODES:35]Tax_Rate:3/100)); 2)

JobStages_BkMVC
ERR_MethodTrackerReturn("JobStages BkMVA"; $_t_oldMethodName)