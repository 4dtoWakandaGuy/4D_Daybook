If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Del Note Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_OrderItemPartDelivery)
	C_DATE:C307(vDoDateF)
	C_LONGINT:C283(<>DataSize; $_l_event; r1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vComments; vProdName; vSerialNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Del Note Sub"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Display Detail:K2:22)
	
	If ((r1=1) | ([ORDERS:24]Print_Comments:44=False:C215))
		vComments:=""
	Else 
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vComments)
		
		
		r1:=1
	End if 
	SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->vProdName; ->vPrice; ->vQuantity; ->vSerialNo)
	//Set_Fonts ("vT";◊DataSize-1)
	//Set_Fonts ("vProdName+vPrice+vQuantity+vSerialNo";◊DataSize)
	vProdName:=[ORDER_ITEMS:25]Product_Name:13
	If (<>SYS_bo_OrderItemPartDelivery)
		If (vDoDateF=!00-00-00!)
			If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			End if 
			If ([PRODUCTS:9]Maintain_Stock:14)
				vQuantity:=Gen_Round(([ORDER_ITEMS:25]Allocated:28-[ORDER_ITEMS:25]Delivered:51); 2; 6)
			Else 
				vQuantity:=[ORDER_ITEMS:25]Quantity:3
			End if 
		Else 
			vQuantity:=[ORDER_ITEMS:25]Delivered:51
		End if 
	Else 
		vQuantity:=[ORDER_ITEMS:25]Quantity:3
	End if 
	
	vSerialNo:=[ORDER_ITEMS:25]Serial_Number:24
	If (Int:C8(vQuantity)=vQuantity)
		OBJECT SET FORMAT:C236(vQuantity; "|QuantityNZ")
	Else 
		OBJECT SET FORMAT:C236(vQuantity; "|AccountsNZ")
	End if 
	Form_vT([ORDER_ITEMS:25]Print_Description:45; [ORDER_ITEMS:25]Description:44)
End if 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Del Note Sub"; $_t_oldMethodName)
