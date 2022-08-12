//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JSTotalListBoxSetup
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
	//Array BOOLEAN(JST_lb_LBJSTots;0)
	//Array TEXT(JS_at_TotActualCost;0)
	//Array TEXT(JS_at_TotActualTC;0)
	//Array TEXT(JS_at_TotActualTime;0)
	//Array TEXT(JS_at_TotBudgetCost;0)
	//Array TEXT(JS_at_TotBudgetTC;0)
	//Array TEXT(JS_at_TotBudgetTime;0)
	//Array TEXT(JS_at_TotInvExclTC;0)
	//Array TEXT(JS_at_TotInvInclTC;0)
	//Array TEXT(JS_at_TotLeftHandLabel;0)
	//Array TEXT(JS_at_TotQuotedTime;0)
	//Array TEXT(JS_at_TotWIPCost;0)
	//Array TEXT(JS_at_TotWIPTC;0)
	//Array TEXT(JS_at_TotWIPTime;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalListBoxSetup")

//
//added 14/03/07 -kmw
//
//ARRAY BOOLEAN(ORD_lb_LBAuths;0)

$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalListBoxSetup")






LB_SetupListbox(->JST_lb_LBJSTots; "oJSTot"; "JSTota_L"; 1; ->JS_at_TotLeftHandLabel; ->JS_at_TotQuotedTime; ->JS_at_TotBudgetTime; ->JS_at_TotActualTime; ->JS_at_TotWIPTime; ->JS_at_TotBudgetCost; ->JS_at_TotActualCost; ->JS_at_TotWIPCost; ->JS_at_TotBudgetTC; ->JS_at_TotActualTC; ->JS_at_TotWIPTC; ->JS_at_TotInvExclTC; ->JS_at_TotInvInclTC)

OBJECT SET ENTERABLE:C238(JS_at_TotLeftHandLabel; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotQuotedTime; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotBudgetTime; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotActualTime; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotWIPTime; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotBudgetCost; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotActualCost; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotWIPCost; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotBudgetTC; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotActualTC; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotWIPTC; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotInvExclTC; False:C215)
OBJECT SET ENTERABLE:C238(JS_at_TotInvInclTC; False:C215)

LB_SetColumnHeaders(->JST_lb_LBJSTots; "JSTota_L"; 1; ""; "Quoted TR"; "Budget TR"; "Actual TR"; "WIP TR"; "Budget Cost"; "Actual Cost"; "WIP Cost"; "Budget TR+Cost"; "Actual TR+Cost"; "WIP TR+Cost"; "Inv Excl Tax TR+Cost"; "Inv Incl Tax TR+Cost")
LB_SetColumnWidths(->JST_lb_LBJSTots; "oJSTot"; 1; 60; 60; 60; 60; 60; 60; 60; 85; 85; 85; 85; 100; 100)
LB_SetScroll(->JST_lb_LBJSTots; -2; -2)  //show vertical an horizontal scroll bars
LB_SetFormat(->JST_lb_LBJSTots; 2; ""; 2; 13; 4)
LB_StyleSettings(->JST_lb_LBJSTots; "Black"; 9; "oJobTot"; ->[JOBS:26])
ERR_MethodTrackerReturn("JC_JSTotalListBoxSetup"; $_t_oldMethodName)