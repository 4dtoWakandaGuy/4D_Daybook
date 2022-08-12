//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSPAllTotals
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
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $_bo_PostWIP; JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSPAllTotals")

//JC_UpdateJSPAllTotals

//added 23/03/07 kmw

//updates all of current job stage personnel's totals

//relies on job stage personnel that is to be updated to be loaded

//
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSPAllTotals")
//
//
QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)  //so we know if the job this job stage belongs to allows posting actual or budget figures
If (Records in selection:C76([JOBS:26])>0)
	$_bo_PostActual:=[JOBS:26]Actual_TR:29
	$_bo_PostBudget:=[JOBS:26]Budget_TR:28
	$_bo_PostWIP:=[JOBS:26]Use_WIP:47
Else   //SHOULDN'T HAPPEN!! (that no job yet exists for this Job Stage Personnel) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be decided on the automatically created job that is to come
	JC_LoadPrefs
	$_bo_PostActual:=JC_bo_PostActualTime
	$_bo_PostBudget:=JC_bo_PostBudgetTime
	$_bo_PostWIP:=JC_bo_PostWIP
End if 
//`
JC_FindTimeDiaryFromJSP  //get all diary records that are related to current job stage personnel record (even if newly created it might be possible that there are somehow other diary records that should be associated with it)

If ($_bo_PostActual)
	JC_UpdateJSPActualTime  //use current selection of diary records to update actual totals on job personnel
End if 
If ($_bo_PostBudget)
	JC_UpdateJSPBudgetTime  //use current selection of diary records to update budget totals on job personnel
End if 
If ($_bo_PostWIP)  //added 07/03/07 -kmw
	JC_UpdateJSPWIPTime  //use current selection of diary records to update WIP totals on job personnel
End if 
//
ERR_MethodTrackerReturn("JC_UpdateJSPAllTotals"; $_t_oldMethodName)