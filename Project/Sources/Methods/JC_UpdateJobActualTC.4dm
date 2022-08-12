//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobActualTC
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

//Added KMW
$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobActualTC")
[JOBS:26]JS_Actual_Sales_Amount:35:=[JOBS:26]J_ Actual_Sales_Amount:17+[JOBS:26]JC_Actual_Sales_Amount:32
[JOBS:26]JS_Actual_Cost_Amount:36:=[JOBS:26]JT_Actual_Cost_Amount:31+[JOBS:26]AC_Actual_Cost_Amount:10

[JOBS:26]JS_Actual_Margin:39:=[JOBS:26]JS_Actual_Sales_Amount:35-[JOBS:26]JS_Actual_Cost_Amount:36

If ([JOBS:26]JS_Actual_Sales_Amount:35>0)
	[JOBS:26]JS_Actual_Margin_PC:40:=([JOBS:26]JS_Actual_Margin:39/[JOBS:26]JS_Actual_Sales_Amount:35)*100
Else 
	[JOBS:26]JS_Actual_Margin_PC:40:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJobActualTC"; $_t_oldMethodName)