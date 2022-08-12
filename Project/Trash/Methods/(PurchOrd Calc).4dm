//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd Calc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(VEUROSUBTOTAL; VEUROTOTAL; VEUROVAT; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd Calc")
//PurchOrd Calc
vSubtotal:=0
vEuroSubTotal:=0
vVAT:=0
vEuroVAT:=0
vTotal:=0
vEuroTotal:=0
QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)

FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
While (Not:C34(End selection:C36([PURCHASE_ORDERS_ITEMS:169])))
	vSubtotal:=Round:C94((vSubtotal+[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2)
	vEuroSubtotal:=WS_EuroConvertor(vSubtotal; [PURCHASE_ORDERS:57]Currency_Code:16)
	RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
	vVAT:=Round:C94((vVAT+([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5*([TAX_CODES:35]Tax_Rate:3/100))); 2)
	vEuroVAT:=WS_EuroConvertor(vVAT; [PURCHASE_ORDERS:57]Currency_Code:16)
	NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
End while 
vTotal:=Round:C94((vSubtotal+vVAT); 2)
vEuroTotal:=WS_EuroConvertor(vTotal; [PURCHASE_ORDERS:57]Currency_Code:16)
ERR_MethodTrackerReturn("PurchOrd Calc"; $_t_oldMethodName)