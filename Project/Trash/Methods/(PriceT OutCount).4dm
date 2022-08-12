//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT OutCount
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
	C_REAL:C285($_r_PriceOrDiscount)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT OutCount")
$_r_PriceOrDiscount:=Sum:C1([PRICE_TABLE:28]Price_Discount:3)
vText:=vText+"Total Price/Discount: "+String:C10($_r_PriceOrDiscount; "|Accounts")
ERR_MethodTrackerReturn("PriceT OutCount"; $_t_oldMethodName)
