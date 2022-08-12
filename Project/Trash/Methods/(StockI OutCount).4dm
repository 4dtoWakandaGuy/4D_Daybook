//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI OutCount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2012 20:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_CostPrice; $_r_ResidualQuantity; $QTY)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI OutCount")
$_r_ResidualQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
$_r_CostPrice:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
vText:=vText+"Quantity Remaining:"+String:C10($_r_ResidualQuantity)+vRec+"Cost: "+String:C10($_r_CostPrice; "|Accounts")+vRec
ERR_MethodTrackerReturn("StockI OutCount"; $_t_oldMethodName)
