//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_BkMVC
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
	C_REAL:C285(vT4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_BkMVC")
If ([TAX_CODES:35]Tax_Rate:3>0)
	RELATE ONE:C42([JOB_STAGES:47]TAX_Code:14)
	[JOB_STAGES:47]B_Client_Tax_Amount:22:=Round:C94(([JOB_STAGES:47]AS_Quoted_Amount:7*([TAX_CODES:35]Tax_Rate:3/100)); 2)
Else 
	RELATE ONE:C42([JOB_STAGES:47]TAX_Code:14)
	[JOB_STAGES:47]B_Client_Tax_Amount:22:=Round:C94(([JOB_STAGES:47]B_Agency_Total_Amount:24*([TAX_CODES:35]Tax_Rate:3/100)); 2)
	
End if 
[JOB_STAGES:47]B_Client_Total_Amount:25:=Round:C94(([JOB_STAGES:47]AS_Quoted_Amount:7+[JOB_STAGES:47]B_Client_Tax_Amount:22); 2)
[JOB_STAGES:47]B_Agency_TAX_Amount:27:=Round:C94(([JOB_STAGES:47]B_Agency_Total_Amount:24*([TAX_CODES:35]Tax_Rate:3/100)); 2)

vT4:=1
ERR_MethodTrackerReturn("JobStages_BkMVC"; $_t_oldMethodName)