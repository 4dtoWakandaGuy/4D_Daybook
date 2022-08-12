//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPTot
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPTot")
If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	Jobs_InLPTot3
	[JOBS:26]JC_Budget_Cost_Amount:34:=Gen_Round((Sum:C1([JOB_STAGES:47]JC_Budget_Cost_Amount:34)); 2; 2)
	
	[JOBS:26]JC_Budget_Sales_ Amount:33:=Gen_Round((Sum:C1([JOB_STAGES:47]JC_Budget_Sales_Amount:33)); 2; 2)
	
	[JOBS:26]JT_Budget_Units:20:=Gen_Round((Sum:C1([JOB_STAGES:47]JT_Budget_Units:4)); 2; 2)
	[JOBS:26]AT_Actual_Units:16:=Gen_Round((Sum:C1([JOB_STAGES:47]AT_Actual_Units:5)); 2; 2)
	[JOBS:26]JT_Bud_Sales_Amount:23:=Gen_Round((Sum:C1([JOB_STAGES:47]AT_Budget_Sales_Amount:8)); 2; 2)
	[JOBS:26]J_ Actual_Sales_Amount:17:=Gen_Round((Sum:C1([JOB_STAGES:47]JT_Actual_Sales_Amount:6)); 2; 2)
	[JOBS:26]JT_Budget_Cost_Amount:30:=Gen_Round((Sum:C1([JOB_STAGES:47]JT_Budget_Cost_Amount:30)); 2; 2)
	[JOBS:26]JT_Actual_Cost_Amount:31:=Gen_Round((Sum:C1([JOB_STAGES:47]JT_Actual_Cost_Amount:29)); 2; 2)
	[JOBS:26]AS_Quoted_Amount:11:=Gen_Round((Sum:C1([JOB_STAGES:47]AS_Quoted_Amount:7)); 2; 2)
	[JOBS:26]AS_Invoice_Excluding_Tax:12:=Gen_Round((Sum:C1([JOB_STAGES:47]AS_Invoice_Excluding_Tax:9)); 2; 2)
	[JOBS:26]AS_Invoice_Including_Tax:13:=Gen_Round((Sum:C1([JOB_STAGES:47]AS_Invoice_Including_Tax:28)); 2; 2)
	Jobs_InLPTot2
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
ERR_MethodTrackerReturn("Jobs_InLPTot"; $_t_oldMethodName)