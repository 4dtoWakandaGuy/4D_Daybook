//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JobTotalListBoxSetup
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
	//Array BOOLEAN(JOB_lb_JobTotals;0)
	//Array TEXT(JOB_at_TotActualCost;0)
	//Array TEXT(JOB_at_TotActualTC;0)
	//Array TEXT(JOB_at_TotActualTime;0)
	//Array TEXT(JOB_at_TotBudgetCost;0)
	//Array TEXT(JOB_at_TotBudgetTC;0)
	//Array TEXT(JOB_at_TotBudgetTime;0)
	//Array TEXT(JOB_at_TotInvExclTC;0)
	//Array TEXT(JOB_at_TotInvInclTC;0)
	//Array TEXT(JOB_at_TotLeftHandLabel;0)
	//Array TEXT(JOB_at_TotQuotedTime;0)
	//Array TEXT(JOB_at_TotWIPCost;0)
	//Array TEXT(JOB_at_TotWIPTC;0)
	//Array TEXT(JOB_at_TotWIPTime;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JobTotalListBoxSetup")

//
//added 14/03/07 -kmw
//

$_t_oldMethodName:=ERR_MethodTracker("JC_JobTotalListBoxSetup")



//ARRAY BOOLEAN(ORD_lb_LBAuths;0)




LB_SetupListbox(->JOB_lb_JobTotals; "oJobTot"; "JobTota_L"; 1; ->JOB_at_TotLeftHandLabel; ->JOB_at_TotQuotedTime; ->JOB_at_TotBudgetTime; ->JOB_at_TotActualTime; ->JOB_at_TotWIPTime; ->JOB_at_TotBudgetCost; ->JOB_at_TotActualCost; ->JOB_at_TotWIPCost; ->JOB_at_TotBudgetTC; ->JOB_at_TotActualTC; ->JOB_at_TotWIPTC; ->JOB_at_TotInvExclTC; ->JOB_at_TotInvInclTC)

OBJECT SET ENTERABLE:C238(JOB_at_TotLeftHandLabel; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotQuotedTime; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotBudgetTime; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotActualTime; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotWIPTime; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotBudgetCost; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotActualCost; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotWIPCost; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotBudgetTC; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotActualTC; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotWIPTC; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotInvExclTC; False:C215)
OBJECT SET ENTERABLE:C238(JOB_at_TotInvInclTC; False:C215)

LB_SetColumnHeaders(->JOB_lb_JobTotals; "JobTota_L"; 1; ""; "Quoted TR"; "Budget TR"; "Actual TR"; "WIP TR"; "Budget Cost"; "Actual Cost"; "WIP Cost"; "Budget TR+Cost"; "Actual TR+Cost"; "WIP TR+Cost"; "Inv Excl Tax TR+Cost"; "Inv Incl Tax TR+Cost")
//LB_SetColumnWidths (->ORD_lb_LBAuths;"INV_l_HED";1;101;80;80)
LB_SetColumnWidths(->JOB_lb_JobTotals; "oJobTot"; 1; 60; 60; 60; 60; 60; 60; 60; 85; 85; 85; 85; 100; 100)
LB_SetScroll(->JOB_lb_JobTotals; -2; -2)  //show vertical an horizontal scroll bars
LB_SetFormat(->JOB_lb_JobTotals; 2; ""; 2; 13; 4)
LB_StyleSettings(->JOB_lb_JobTotals; "Black"; 9; "oJobTot"; ->[JOBS:26])
ERR_MethodTrackerReturn("JC_JobTotalListBoxSetup"; $_t_oldMethodName)