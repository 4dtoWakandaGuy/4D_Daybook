//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobBudgetTC
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

//ADDED KMW
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobBudgetTC")
[JOBS:26]JS_Budget_Sales_Amount:37:=[JOBS:26]JT_Bud_Sales_Amount:23+[JOBS:26]JC_Budget_Sales_ Amount:33
[JOBS:26]JS_Budget_Cost_Amount:38:=[JOBS:26]JT_Budget_Cost_Amount:30+[JOBS:26]JC_Budget_Cost_Amount:34


[JOBS:26]JS_Budget_Margin:41:=[JOBS:26]JS_Budget_Sales_Amount:37-[JOBS:26]JS_Budget_Cost_Amount:38

If ([JOBS:26]JS_Budget_Sales_Amount:37>0)
	[JOBS:26]JS_Bud_Margin_PC:42:=([JOBS:26]JS_Budget_Margin:41/[JOBS:26]JS_Budget_Sales_Amount:37)*100
Else 
	[JOBS:26]JS_Bud_Margin_PC:42:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJobBudgetTC"; $_t_oldMethodName)