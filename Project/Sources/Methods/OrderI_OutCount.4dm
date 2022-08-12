//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_OutCount
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
	C_REAL:C285($_r_Amount; $_r_CostPrice; $_r_Margin; $_r_MarginPC; $_r_SalesQuantity; $_r_TaxAmount; $_r_Total)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_OutCount")
$_r_SalesQuantity:=Sum:C1([ORDER_ITEMS:25]Quantity:3)
$_r_Amount:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
$_r_TaxAmount:=Sum:C1([ORDER_ITEMS:25]TAX_Amount:8)
$_r_Total:=Sum:C1([ORDER_ITEMS:25]Total_Amount:9)
$_r_CostPrice:=Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
//$_r_Margin:=Sum([ORDER ITEMS]Margin)
$_r_Margin:=$_r_Amount-$_r_CostPrice
$_r_MarginPC:=Round:C94(($_r_Margin/$_r_Amount*100); 2)
vText:=vText+"Quantity: "+String:C10($_r_SalesQuantity)+vRec
vText:=vText+"Amount: "+String:C10($_r_Amount; "|Accounts")+vRec+"VAT: "+String:C10($_r_TaxAmount; "|Accounts")+vRec
vText:=vText+"Total: "+String:C10($_r_Total; "|Accounts")+vRec+"Cost: "+String:C10($_r_CostPrice; "|Accounts")+vRec
vText:=vText+"Margin: "+String:C10($_r_Margin; "|Accounts")+"  ("+String:C10($_r_MarginPC; "|Percent")+")"
ERR_MethodTrackerReturn("OrderI_OutCount"; $_t_oldMethodName)
