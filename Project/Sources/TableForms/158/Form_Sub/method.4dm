If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICE_ITEMS]Form_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 12:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>dataSize; $_l_event)
	C_REAL:C285(Vamount; Vprice; vRate)
	C_TEXT:C284($_t_oldMethodName; Vdesc; vQtyT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICE_ITEMS].Form_Sub"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		SetFontsByPointerParameter(<>dataSize; ""; 0; ->Vdesc; ->VPrice; ->vQtyT; ->vRate; ->vAmount)
		Vprice:=[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3
		vQtyT:=String:C10([PURCHASE_INVOICE_ITEMS:158]Quantity:2)
		RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
		vRate:=[TAX_CODES:35]Tax_Rate:3
		Vdesc:=[PURCHASE_INVOICE_ITEMS:158]Product_Code:1+" "+[PURCHASE_INVOICE_ITEMS:158]Description:13
		Vamount:=[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4
		//PurchOrd_FrmILP
		//Purchases itemsFrmLP
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICE_ITEMS].Form_Sub"; $_t_oldMethodName)
