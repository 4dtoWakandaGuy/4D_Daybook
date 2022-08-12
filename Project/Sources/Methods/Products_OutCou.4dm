//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_OutCou
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
	C_REAL:C285($_r_OfferPrice; $_r_TotalSalesPrice)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_OutCou")
$_r_TotalSalesPrice:=Sum:C1([PRODUCTS:9]Sales_Price:9)
$_r_OfferPrice:=Sum:C1([PRODUCTS:9]Standard_Price:16)
vText:=vText+"Total Sales Price: "+String:C10($_r_TotalSalesPrice; "|Accounts")+vRec+"Total Offer Price: "+String:C10($_r_OfferPrice; "|Accounts")
ERR_MethodTrackerReturn("Products_OutCou"; $_t_oldMethodName)
