If (False:C215)
	//Table Form Method Name: [INVOICES_ITEMS]Del_Note_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vSerialNo; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES_ITEMS].Del_Note_Sub"; Form event code:C388)

If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->vText; ->vQuantity; ->vDetails; ->vSerialNo)
	SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT)
	
	
	//Set_Fonts ("vText+vQuantity+vSerialNo";◊DataSize)
	//Set_Fonts ("vT";◊DataSize-1)
	vText:=[INVOICES_ITEMS:161]Product_Name:2
	vQuantity:=[INVOICES_ITEMS:161]Quantity:3
	If ([INVOICES_ITEMS:161]Item_Number:12>0)
		RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
		vSerialNo:=[ORDER_ITEMS:25]Serial_Number:24
	Else 
		vSerialNo:=""
	End if 
	Form_vT([INVOICES_ITEMS:161]Print_Description:14; [INVOICES_ITEMS:161]Description:13)
End if 
ERR_MethodTrackerReturn("FM [INVOICES_ITEMS].Del_Note_Sub"; $_t_oldMethodName)
