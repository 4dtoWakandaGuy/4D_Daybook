If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Form Sub
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; $_l_event; r1)
	C_REAL:C285(<>DateSize; vAmount; vPrice; vQuantity; vTotal)
	C_TEXT:C284($_t_oldMethodName; vComments)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Form Sub"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		If ((r1=1) | ([ORDERS:24]Print_Comments:44=False:C215))
			vComments:=""
		Else 
			SetFontsByPointerParameter(<>DateSize; ""; 0; ->VComments)
			
			//Set_Fonts ("vComments";◊DataSize)
			r1:=1
		End if 
		SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->[ORDER_ITEMS:25]Product_Name:13; ->vPrice; ->vQuantity; ->vAmount)
		//Set_Fonts ("vT";◊DataSize-1)
		//Set_Fonts ("[ORDER ITEMS]Product Name+vPrice+vQuantity+vAmount";◊DataSize)
		vPrice:=[ORDER_ITEMS:25]Sales_Price:4
		vQuantity:=[ORDER_ITEMS:25]Quantity:3
		vAmount:=[ORDER_ITEMS:25]Sales_Amount:7
		If (Int:C8(vQuantity)=vQuantity)
			OBJECT SET FORMAT:C236(vQuantity; "|QuantityNZ")
		Else 
			OBJECT SET FORMAT:C236(vQuantity; "|AccountsNZ")
		End if 
		If (vTotal<0)
			OBJECT SET FORMAT:C236(vPrice; "|InvAccNZ")
			OBJECT SET FORMAT:C236(vAmount; "|InvAccNZ")
		End if 
		Form_vT([ORDER_ITEMS:25]Print_Description:45; [ORDER_ITEMS:25]Description:44)
		
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Form Sub"; $_t_oldMethodName)
