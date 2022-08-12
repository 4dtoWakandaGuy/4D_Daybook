//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobAllTotals
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
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $_bo_PostWIP; vDirectEdit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobAllTotals")

//JC_UpdateJobAllTotals

//added 28/02/07 kmw

//updates all of current job's totals

//relies on job that is to be updated to be loaded

//
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobAllTotals")



$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
$_bo_PostWIP:=[JOBS:26]Use_WIP:47  //added 07/03/07 -kmw
//
//***********get correct selection of job stages and update job actual, budget, quoted and WIP time totals ***********
JC_FindJSFromJob  //get all Job Stage records that are related to current job record (even if newly created it might be possible that there are somehow other job stage records that should be associated with it)
If ($_bo_PostActual) | (vDirectEdit)  //added vDirectEdit 05/03/07 - kmw
	JC_UpdateJobActualTime  //use current selection of job stage records to update actual totals on job
End if 
If ($_bo_PostBudget) | (vDirectEdit)  //added vDirectEdit 05/03/07 - kmw
	JC_UpdateJobBudgetTime  //use current selection of job stage records to update budget totals on job
End if 
If ($_bo_PostWIP)  //added 07/03/07 -kmw
	JC_UpdateJobWIPTime  //added 07/03/07 -kmw  (uses current selection of job stage records to update WIP time totals on job)
End if   //added 07/03/07 -kmw
JC_UpdateJobQuoted
//*********************************************************************************
//***********get correct selection of actual order items and update job actual costs ***********
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=""; *)  //added 27/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage_Code:60=""; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="A")
JC_UpdateJobActualCost
If ($_bo_PostWIP)  //added 07/03/07 -kmw
	JC_UpdateJobWIPCost  //added 07/03/07 -kmw
End if   //added 07/03/07 -kmw
//**********************************************************************
//***********get correct selection of budget order items and update job budget costs ***********
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=""; *)  //added 27/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage_Code:60=""; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="B")
JC_UpdateJobBudgetCost
//**********************************************************************
//***************update combined Time and Cost totals for invoiced job totals ****************
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)  //added 19/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=""; *)  //added 27/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage_Code:60=""; *)  //added 19/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17#""; *)  //added 19/03/07 -kmw
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17#"N")  //added 19/03/07 -kmw
JC_UpdateJobInvExclTaxTC  //added 19/03/07 -kmw
JC_UpdateJobInvInclTaxTC  //added 19/03/07 -kmw
//**********************************************************************
//***********update combined Time and Cost totals for both budget and actual job totals ***********
JC_UpdateJobActualTC
JC_UpdateJobBudgetTC
JC_UpdateJobWIPTC  //added 07/03/07 -kmw
//**********************************************************************
ERR_MethodTrackerReturn("JC_UpdateJobAllTotals"; $_t_oldMethodName)