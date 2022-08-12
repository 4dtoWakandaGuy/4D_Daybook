//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 12:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_TEXT($_t_PalletButtonName)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event; $I)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI SubLP")
//OrderI SubLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([ORDER_ITEMS:25]Order_Code:1))
				OrderI_InLPX(->[ORDER_ITEMS:25]Order_Code:1)
			: (Modified:C32([ORDER_ITEMS:25]Product_Code:2))
				OrderI_InLPX(->[ORDER_ITEMS:25]Product_Code:2)
			: (Modified:C32([ORDER_ITEMS:25]Product_Name:13))
				OrderI_InLPX(->[ORDER_ITEMS:25]Product_Name:13)
			: (Modified:C32([ORDER_ITEMS:25]Description:44))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([ORDER_ITEMS:25]Print_Description:45))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([ORDER_ITEMS:25]Sort_Order:26))
				OrderI_InLPX(->[ORDER_ITEMS:25]Sort_Order:26)
			: (Modified:C32([ORDER_ITEMS:25]Price_Code:36))
				OrderI_InLPX(->[ORDER_ITEMS:25]Price_Code:36)
			: (Modified:C32([ORDER_ITEMS:25]Discount:37))
				OrderI_InLPX(->[ORDER_ITEMS:25]Discount:37)
			: (Modified:C32([ORDER_ITEMS:25]Quantity:3))
				OrderI_InLPX(->[ORDER_ITEMS:25]Quantity:3)
			: (Modified:C32([ORDER_ITEMS:25]Price_Per:50))
				OrderI_InLPX(->[ORDER_ITEMS:25]Price_Per:50)
			: (Modified:C32([ORDER_ITEMS:25]Tax_Code:12))
				OrderI_InLPX(->[ORDER_ITEMS:25]Tax_Code:12)
			: (Modified:C32([ORDER_ITEMS:25]Sales_Price:4))
				OrderI_InLPX(->[ORDER_ITEMS:25]Sales_Price:4)
			: (Modified:C32([ORDER_ITEMS:25]Retail_Price:38))
				OrderI_InLPX(->[ORDER_ITEMS:25]Retail_Price:38)
			: (Modified:C32([ORDER_ITEMS:25]Cost_Price:5))
				OrderI_InLPX(->[ORDER_ITEMS:25]Cost_Price:5)
			: (Modified:C32([ORDER_ITEMS:25]Margin:6))
				OrderI_InLPX(->[ORDER_ITEMS:25]Margin:6)
			: (Modified:C32([ORDER_ITEMS:25]Sales_Amount:7))
				OrderI_InLPX(->[ORDER_ITEMS:25]Sales_Amount:7)
			: (Modified:C32([ORDER_ITEMS:25]TAX_Amount:8))
				OrderI_InLPX(->[ORDER_ITEMS:25]TAX_Amount:8)
			: (Modified:C32([ORDER_ITEMS:25]Total_Amount:9))
				OrderI_InLPX(->[ORDER_ITEMS:25]Total_Amount:9)
			: (Modified:C32([ORDER_ITEMS:25]Delivery_Date:11))
				OrderI_InLPX(->[ORDER_ITEMS:25]Delivery_Date:11)
			: (Modified:C32([ORDER_ITEMS:25]Serial_Number:24))
				OrderI_InLPX(->[ORDER_ITEMS:25]Serial_Number:24)
			: (Modified:C32([ORDER_ITEMS:25]Person:14))
				OrderI_InLPX(->[ORDER_ITEMS:25]Person:14)
			: (Modified:C32([ORDER_ITEMS:25]Supplier_Code:20))
				OrderI_InLPX(->[ORDER_ITEMS:25]Supplier_Code:20)
			: (Modified:C32([ORDER_ITEMS:25]Purchase_Order_Number:18))
				OrderI_InLPX(->[ORDER_ITEMS:25]Purchase_Order_Number:18)
			: (Modified:C32([ORDER_ITEMS:25]Purchase_Order_Date:19))
				OrderI_InLPX(->[ORDER_ITEMS:25]Purchase_Order_Date:19)
			: (Modified:C32([ORDER_ITEMS:25]Received_Date:21))
				OrderI_InLPX(->[ORDER_ITEMS:25]Received_Date:21)
			: (Modified:C32([ORDER_ITEMS:25]Invoice_Number:17))
				OrderI_InLPX(->[ORDER_ITEMS:25]Invoice_Number:17)
			: (Modified:C32([ORDER_ITEMS:25]Invoice_Date:25))
				OrderI_InLPX(->[ORDER_ITEMS:25]Invoice_Date:25)
			: (Modified:C32([ORDER_ITEMS:25]Contract_Code:29))
				OrderI_InLPX(->[ORDER_ITEMS:25]Contract_Code:29)
			: (Modified:C32([ORDER_ITEMS:25]Job_Code:34))
				OrderI_InLPX(->[ORDER_ITEMS:25]Job_Code:34)
			: (Modified:C32([ORDER_ITEMS:25]Job_Stage:35))
				OrderI_InLPX(->[ORDER_ITEMS:25]Job_Stage:35)
			: (Modified:C32([ORDER_ITEMS:25]State:46))
				OrderI_InLPX(->[ORDER_ITEMS:25]State:46)
			: (Modified:C32([ORDER_ITEMS:25]Supply_by_Date:31))
				OrderI_InLPX(->[ORDER_ITEMS:25]Supply_by_Date:31)
			: (Modified:C32([ORDER_ITEMS:25]Received_Date:21))
				OrderI_InLPX(->[ORDER_ITEMS:25]Received_Date:21)
			: (Modified:C32([ORDER_ITEMS:25]Supplier_Invoice_Number:22))
				OrderI_InLPX(->[ORDER_ITEMS:25]Supplier_Invoice_Number:22)
			: (Modified:C32([ORDER_ITEMS:25]Supplier_Reference:33))
				OrderI_InLPX(->[ORDER_ITEMS:25]Supplier_Reference:33)
			: (Modified:C32([ORDER_ITEMS:25]Supplier_Delivery_Number:23))
				OrderI_InLPX(->[ORDER_ITEMS:25]Supplier_Delivery_Number:23)
			: (Modified:C32([ORDER_ITEMS:25]Level_Up_Item_Number:48))
				OrderI_InLPX(->[ORDER_ITEMS:25]Level_Up_Item_Number:48)
			: (Modified:C32([ORDER_ITEMS:25]Component_Level:47))
				OrderI_InLPX(->[ORDER_ITEMS:25]Component_Level:47)
			: (Modified:C32([ORDER_ITEMS:25]Finance_Method:32))
				OrderI_InLPX(->[ORDER_ITEMS:25]Finance_Method:32)
			: (Modified:C32([ORDER_ITEMS:25]Required_Date:10))
				OrderI_InLPX(->[ORDER_ITEMS:25]Required_Date:10)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OrderI_SubLPB
End case 
ERR_MethodTrackerReturn("OrderI SubLP"; $_t_oldMethodName)