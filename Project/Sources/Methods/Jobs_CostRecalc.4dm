//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_CostRecalc
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_CostRecalc")
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
[JOBS:26]AC_Actual_Cost_Amount:10:=Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
ERR_MethodTrackerReturn("Jobs_CostRecalc"; $_t_oldMethodName)