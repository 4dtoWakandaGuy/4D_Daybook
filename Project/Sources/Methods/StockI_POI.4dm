//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_POI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_OIUpdates; 0)
	ARRAY LONGINT:C221($_al_OINumbers; 0)
	ARRAY REAL:C219($_ar_OIAllocatedQuantities; 0)
	ARRAY REAL:C219($_ar_OICostAmounts; 0)
	ARRAY REAL:C219($_ar_OIQuantities; 0)
	ARRAY TEXT:C222($_at_OIOrderCodes; 0)
	ARRAY TEXT:C222($_at_OIProductCodes; 0)
	ARRAY TEXT:C222($_at_OIPurchOrderCodes; 0)
	ARRAY TEXT:C222($_at_OISupplierCodes; 0)
	C_BOOLEAN:C305($_bo_Edits)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_PostIndex; $_l_SizeofArray; vNo)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_oldMethodName; $_t_Search; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_POI")
//StockI Purchase Order items
DB_SaveRecord(->[STOCK_MOVEMENTS:40])
AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_MOVEMENTS:40]))
If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
	[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
READ ONLY:C145([ORDER_ITEMS:25])
$_t_Search:=Substring:C12(Gen_Request("Purchase Order No:"); 1; 51)
If ((OK=1) & ($_t_Search#""))
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$_t_Search; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Purchase_Order_Number:18#"")
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		$_t_Search:=[ORDER_ITEMS:25]Purchase_Order_Number:18
		If ([STOCK_MOVEMENTS:40]Company_From:2#"")
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20=[STOCK_MOVEMENTS:40]Company_From:2; *)
			QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
		Else 
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
		End if 
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Open_Pro_Window("Select Order Items")
			FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items_Out")
			WIN_t_CurrentOutputform:="Items_Out"
			DB_t_CurrentFormUsage:="Select"
			vNo:=Records in selection:C76([ORDER_ITEMS:25])
			DISPLAY SELECTION:C59([ORDER_ITEMS:25]; *)
			If (Records in set:C195("Userset")>0)
				USE SET:C118("Userset")
			End if 
			If ((OK=1) & (Records in selection:C76([ORDER_ITEMS:25])>0))
				Gen_Confirm("Add "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" Items to the Stock Movement?"; "Yes"; "No")
				If (OK=1)
					//READ WRITE([ORDER ITEMS])
					//FIRST RECORD([ORDER ITEMS])
					[STOCK_MOVEMENTS:40]Type_Number:4:=$_t_Search
					SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Supplier_Code:20; $_at_OISupplierCodes; [ORDER_ITEMS:25]Item_Number:27; $_al_OINumbers; [ORDER_ITEMS:25]Product_Code:2; $_at_OIProductCodes; [ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_OIPurchOrderCodes; [ORDER_ITEMS:25]Cost_Amount:15; $_ar_OICostAmounts; [ORDER_ITEMS:25]Order_Code:1; $_at_OIOrderCodes; [ORDER_ITEMS:25]Quantity:3; $_ar_OIQuantities)
					ARRAY REAL:C219($_ar_OIAllocatedQuantities; 0)
					ARRAY BOOLEAN:C223($_abo_OIUpdates; 0)
					$_l_SizeofArray:=Size of array:C274($_at_OISupplierCodes)
					ARRAY BOOLEAN:C223($_abo_OIUpdates; $_l_SizeofArray)
					ARRAY REAL:C219($_ar_OIAllocatedQuantities; $_l_SizeofArray)
					For ($_l_PostIndex; 1; $_l_SizeofArray)
						//While (Not(End selection([ORDER ITEMS])))
						//LOAD RECORD([ORDER ITEMS])
						//If (Locked([ORDER ITEMS]))
						//Gen_Alert ("Cannot receive Order Item "+String([ORDER ITEMS]Item Number)+" - record in use";"Cancel")
						//Else
						If (($_at_OISupplierCodes{$_l_PostIndex}#[STOCK_MOVEMENTS:40]Company_From:2) & ([STOCK_MOVEMENTS:40]Company_From:2=""))
							[STOCK_MOVEMENTS:40]Company_From:2:=$_at_OISupplierCodes{$_l_PostIndex}
							DB_SaveRecord(->[STOCK_MOVEMENTS:40])
						End if 
						If ($_at_OISupplierCodes{$_l_PostIndex}#[STOCK_MOVEMENTS:40]Company_From:2)
							Gen_Alert("Order Item "+String:C10($_al_OINumbers{$_l_PostIndex})+" is from a different Supplier"; "Cancel")
							
						Else 
							CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
							[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
							
							[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_OIProductCodes{$_l_PostIndex}
							[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=$_at_OIPurchOrderCodes{$_l_PostIndex}
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=$_at_OIPurchOrderCodes{$_l_PostIndex}; *)
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6=$_al_OINumbers{$_l_PostIndex})
							If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])=1)
								[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=[PURCHASE_ORDERS_ITEMS:169]POitemID:16
								
							End if 
							UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=$_ar_OICostAmounts{$_l_PostIndex}
							If ([ORDERS:24]Order_Code:3#$_at_OIOrderCodes{$_l_PostIndex})
								QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_at_OIOrderCodes{$_l_PostIndex})
								
							End if 
							
							If ([ORDERS:24]Company_Code:1#<>SYS_t_StockOrderCompany)
								[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_OINumbers{$_l_PostIndex}
								$_ar_OIAllocatedQuantities{$_l_PostIndex}:=$_ar_OIQuantities{$_l_PostIndex}
								$_abo_OIUpdates{$_l_PostIndex}:=True:C214
							Else 
								[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
							End if 
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_OIQuantities{$_l_PostIndex}
							[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=<>DB_d_CurrentDate
							[ORDER_ITEMS:25]Received_Date:21:=<>DB_d_CurrentDate
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							$_bo_Edits:=STK_SetHeaderInfo
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						End if 
						//End if
						
						
						//NEXT RECORD([ORDER ITEMS])
						//End while
					End for 
					For ($_l_Index; 1; Size of array:C274($_abo_OIUpdates))
						If ($_abo_OIUpdates{$_l_Index})
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OINumbers{$_l_Index})
							
							[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
							DB_SaveRecord(->[ORDER_ITEMS:25])
						End if 
					End for 
				End if 
			End if 
			DB_t_CurrentFormUsage:=""
			Close_ProWin
		Else 
			Gen_Alert("No items found"; "Cancel")
		End if 
	Else 
		Gen_Alert("These items have already been received"; "Cancel")
	End if 
End if 
READ WRITE:C146([ORDER_ITEMS:25])
RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
vCompName:=[COMPANIES:2]Company_Name:2
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
ERR_MethodTrackerReturn("StockI_POI"; $_t_oldMethodName)
