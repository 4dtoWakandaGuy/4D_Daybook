//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_PurchCal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_CostPrice; vQuantity; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PurchCal")
//Orders_PurchCal
vSubtotal:=0
vVAT:=0
vTotal:=0
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	vQuantity:=Round:C94(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2)
	$_r_CostPrice:=Round:C94(([ORDER_ITEMS:25]Cost_Price:5*vQuantity); 2)
	vSubtotal:=Round:C94((vSubtotal+$_r_CostPrice); 2)
	RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
	vVAT:=Round:C94((vVAT+($_r_CostPrice*([TAX_CODES:35]Tax_Rate:3/100))); 2)
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
vTotal:=Round:C94((vSubtotal+vVAT); 2)
ERR_MethodTrackerReturn("Orders_PurchCal"; $_t_oldMethodName)