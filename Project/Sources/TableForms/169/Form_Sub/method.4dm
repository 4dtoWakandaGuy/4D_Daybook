If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS_ITEMS]Form_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize; r1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vComments)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS_ITEMS].Form_Sub"; Form event code:C388)

If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->vProdName; ->vPrice; ->vQuantity; ->vAmount)
	//Set_Fonts ("vProdName+vPrice+vQuantity+vAmount";◊DataSize)
	If ((r1=1) | ([PURCHASE_ORDERS:57]Print_Comments:18=False:C215))
		vComments:=""
	Else 
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vComments)
		//Set_Fonts ("vComments";◊DataSize)
		r1:=1
	End if 
	SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT)
	//Set_Fonts ("vT";◊DataSize-1)
	PurchOrd_FrmILP
	If (Int:C8(vQuantity)=vQuantity)
		OBJECT SET FORMAT:C236(vQuantity; "|QuantityNZ")
	Else 
		OBJECT SET FORMAT:C236(vQuantity; "|AccountsNZ")
	End if 
	SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT)
	//Set_Fonts ("vT";◊DataSize-1)
	Form_vT([PURCHASE_ORDERS_ITEMS:169]Print_Description:14; [PURCHASE_ORDERS_ITEMS:169]Description:13)
End if 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS_ITEMS].Form_Sub"; $_t_oldMethodName)
