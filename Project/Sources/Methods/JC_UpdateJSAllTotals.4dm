//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSAllTotals
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
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $_bo_PostWIP; JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP; vDirectEdit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSAllTotals")

//JC_UpdateJSAllTotals

//added 28/02/07 kmw

//updates all of current job stage's totals

//relies on job stage that is to be updated to be loaded

//
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSAllTotals")

//
QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)  //so we know if the job this job stage belongs to allows posting actual or budget figures
If (Records in selection:C76([JOBS:26])>0)  //added 07/03/07 -kmw
	$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 07/03/07 -kmw
	$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 07/03/07 -kmw
	$_bo_PostWIP:=[JOBS:26]Use_WIP:47  //added 07/03/07 -kmw
Else   //SHOULDN'T HAPPEN!! (that no job yet exists for this Job Stage) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be decided on the automatically created job that is to come
	JC_LoadPrefs  //added 07/03/07 -kmw
	$_bo_PostActual:=JC_bo_PostActualTime  //added 07/03/07 -kmw
	$_bo_PostBudget:=JC_bo_PostBudgetTime  //added 07/03/07 -kmw
	$_bo_PostWIP:=JC_bo_PostWIP  //added 07/03/07 -kmw
End if 
//`
//***********get correct selection of personnel records and update job stage actual and budget time totals ***********
JC_FindJSPFromJS  //get all Job Stage Personnel records that are related to current job stage record (even if newly created it might be possible that there are somehow other job stage personnel records that should be associated with it)
If ($_bo_PostActual) | (vDirectEdit)  //added vDirectEdit 05/03/07 - kmw
	JC_UpdateJSActualTime  //use current selection of job personnel records to update actual totals on job stage
End if 
If ($_bo_PostBudget) | (vDirectEdit)  //added vDirectEdit 05/03/07 - kmw
	JC_UpdateJSBudgetTime  //use current selection of job personnel records to update budget totals on job stage
End if 
If ($_bo_PostWIP)  //added 07/03/07 -kmw
	JC_UpdateJSWIPTime  //added 07/03/07 -kmw  (uses current selection of job stage records to update WIP time totals on job)
End if   //added 07/03/07 -kmw
//*********************************************************************************
//***********get correct selection of actual order items and update job stage actual costs ***********
JC_FindOrderItemsFromJS
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A")
JC_UpdateJSActualCost
If ($_bo_PostWIP)  //added 07/03/07 -kmw
	JC_UpdateJSWIPCost  //added 07/03/07 -kmw
End if   //added 07/03/07 -kmw
//**********************************************************************
//***********get correct selection of budget order items and update job stage budget costs ***********
JC_FindOrderItemsFromJS
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="B")
JC_UpdateJSBudgetCost
//**********************************************************************
//**********get correct selection of invoiced order items and update job stage invoiced totals **********
//JC_FindOrderItemsFromJS
//QUERY SELECTION([ORDER ITEMS];[ORDER ITEMS]Invoice No#"";*)
//QUERY SELECTION([ORDER ITEMS]; & ;[ORDER ITEMS]Invoice No#"N")
//JC_UpdateJSInvExclTaxTC
//JC_UpdateJSInvInclTaxTC

//may need to something like the above in the future if we allow invoicing at lower than job stage level...
//...but for now we don't want to re-add up any totals because with the way the system works at the moment invoiving is done at job stage level and once invoicing is done for a job stage the value should stay fixed and further entries against it can never be invoiced

//**********************************************************************
//***********update combined Time and Cost totals for both budget and actual job stage totals ***********
JC_UpdateJSActualTC
JC_UpdateJSBudgetTC
JC_UpdateJSWIPTC  //added 07/03/07 -kmw
//**************************************************************************
ERR_MethodTrackerReturn("JC_UpdateJSAllTotals"; $_t_oldMethodName)