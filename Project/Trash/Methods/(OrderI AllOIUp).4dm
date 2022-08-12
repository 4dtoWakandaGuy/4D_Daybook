//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI AllOIUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_POMovementTypes; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI AllOIUp")
//OrderI Allocations OI Update
If (([ORDER_ITEMS:25]Purchase_Order_Number:18="") & ([ORDER_ITEMS:25]Allocated:28=[ORDER_ITEMS:25]Quantity:3))
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POMovementTypes)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POMovementTypes)
	
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#"")
			[ORDER_ITEMS:25]Purchase_Order_Number:18:=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20
			[ORDER_ITEMS:25]Purchase_Order_Date:19:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
		Else 
			[ORDER_ITEMS:25]Purchase_Order_Number:18:="PO"
			[ORDER_ITEMS:25]Purchase_Order_Date:19:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
		End if 
	Else 
		[ORDER_ITEMS:25]Purchase_Order_Number:18:="STOCK"
		[ORDER_ITEMS:25]Purchase_Order_Date:19:=<>DB_d_CurrentDate
	End if 
	If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Supplier_Code:20#"*@")
		If ([ORDER_ITEMS:25]Product_Code:2#"")
			If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
			End if 
			If ([PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
					QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[ORDER_ITEMS:25]Supplier_Code:20)
					If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
						CONFIRM:C162("This product ("+[ORDER_ITEMS:25]Product_Code:2+") is not identified as supplied by this supplier("+[ORDER_ITEMS:25]Supplier_Code:20+"), do you which to "+"Remove "+[ORDER_ITEMS:25]Supplier_Code:20+" ) from this order item?"; "Yes"; "No")
						If (OK=1)
							[ORDER_ITEMS:25]Supplier_Code:20:=""
						End if 
					End if 
					
					
				End if 
			End if 
			
		End if 
		
	End if 
	
End if 
OrderI_AllOIUp2
[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
ERR_MethodTrackerReturn("OrderI AllOIUp"; $_t_oldMethodName)
