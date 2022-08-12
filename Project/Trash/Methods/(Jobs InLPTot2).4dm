//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InLPTot2
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPTot2")
If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	
	[JOBS:26]JS_Actual_Sales_Amount:35:=Gen_Round(([JOBS:26]J_ Actual_Sales_Amount:17+[JOBS:26]JC_Actual_Sales_Amount:32); 2; 2)
	[JOBS:26]JS_Actual_Cost_Amount:36:=Gen_Round(([JOBS:26]JT_Actual_Cost_Amount:31+[JOBS:26]AC_Actual_Cost_Amount:10); 2; 2)
	[JOBS:26]JS_Budget_Sales_Amount:37:=Gen_Round(([JOBS:26]JT_Bud_Sales_Amount:23+[JOBS:26]JC_Budget_Sales_ Amount:33); 2; 2)
	[JOBS:26]JS_Budget_Cost_Amount:38:=Gen_Round(([JOBS:26]JT_Budget_Cost_Amount:30+[JOBS:26]JC_Budget_Cost_Amount:34); 2; 2)
	
	[JOBS:26]JS_Actual_Margin:39:=Gen_Round(([JOBS:26]JS_Actual_Sales_Amount:35-[JOBS:26]JS_Actual_Cost_Amount:36); 2; 2)
	If ([JOBS:26]JS_Actual_Sales_Amount:35#0)
		[JOBS:26]JS_Actual_Margin_PC:40:=Gen_Round((([JOBS:26]JS_Actual_Margin:39/[JOBS:26]JS_Actual_Sales_Amount:35)*100); 2; 4)
	Else 
		[JOBS:26]JS_Actual_Margin_PC:40:=0
	End if 
	[JOBS:26]JS_Budget_Margin:41:=Gen_Round(([JOBS:26]JS_Budget_Sales_Amount:37-[JOBS:26]JS_Budget_Cost_Amount:38); 2; 2)
	If ([JOBS:26]JS_Budget_Sales_Amount:37#0)
		[JOBS:26]JS_Bud_Margin_PC:42:=Gen_Round((([JOBS:26]JS_Budget_Margin:41/[JOBS:26]JS_Budget_Sales_Amount:37)*100); 2; 4)
	Else 
		[JOBS:26]JS_Bud_Margin_PC:42:=0
	End if 
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
ERR_MethodTrackerReturn("Jobs_InLPTot2"; $_t_oldMethodName)