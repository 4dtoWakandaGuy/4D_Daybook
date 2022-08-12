//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SumCosts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/05/2010 12:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SumCosts")
$0:=[STOCK_LEVELS:58]Free_Cost:5+[STOCK_LEVELS:58]Allocated_Cost:6
ERR_MethodTrackerReturn("STK_SumCosts"; $_t_oldMethodName)
