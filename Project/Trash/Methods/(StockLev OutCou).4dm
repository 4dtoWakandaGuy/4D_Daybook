//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev OutCou
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
	C_REAL:C285($_r_CostPrice; $_r_FreeQuantity)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev OutCou")
$_r_FreeQuantity:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
$_r_CostPrice:=Sum:C1([STOCK_LEVELS:58]Allocated_Level:4)
vText:=vText+"Free: "+String:C10($_r_FreeQuantity)+vRec+"Alloc: "+String:C10($_r_CostPrice)+vRec
ERR_MethodTrackerReturn("StockLev OutCou"; $_t_oldMethodName)
