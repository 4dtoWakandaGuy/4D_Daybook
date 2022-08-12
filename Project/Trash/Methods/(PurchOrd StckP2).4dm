//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd StckP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2010 15:20
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PO_al_NSMItemNumer;0)
	//ARRAY REAL(PO_ar_NSM_CostPrice;0)
	//ARRAY REAL(PO_ar_NSM_Quantity;0)
	//ARRAY REAL(PO_ar_NSM_TotalCost;0)
	//ARRAY TEXT(PO_aS20_NSMSoCode;0)
	//ARRAY TEXT(PO_aS20_NSMSoCompanyCode;0)
	//ARRAY TEXT(PO_at_NSMProdCode;0)
	//ARRAY TEXT(PO_at_NSMSOCode;0)
	//ARRAY TEXT(PO_at_NSMSOCompanyCode;0)
	C_BOOLEAN:C305(<>PersAnOver; <>TrackStockposting; $_bo_Edits; $_bo_ReadOnlyState; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_RecordsInSelection)
	C_REAL:C285($_r_CostPrice)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd StckP2")
READ WRITE:C146([STOCK_MOVEMENTS:40])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_LEVELS:58])
READ WRITE:C146([CURRENT_STOCK:62])
$_r_CostPrice:=0
OK:=1
<>TrackStockposting:=False:C215
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
	Gen_Alert("Please create a Stock Movement Type suitable for Purchase Orders before using th"+"is function"; "Cancel")
	OK:=0
Else 
	//Create a Movement
	//  RELATE ONE([ORDER ITEMS]Order Code)
	CREATE RECORD:C68([STOCK_MOVEMENTS:40])
	Movement_Code
	[STOCK_MOVEMENTS:40]Company_From:2:=[PURCHASE_ORDERS:57]Company_Code:1
	[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
	RELATE ONE:C42([MOVEMENT_TYPES:60]Stock_Plus:3)
	If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([STOCK_TYPES:59]Type_Code:1#""))
		[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
		[STOCK_MOVEMENTS:40]MovementSourceReference:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
		[STOCK_MOVEMENTS:40]MovementSourceField:17:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[PURCHASE_ORDERS:57])
		// [STOCK MOVEMENTS]Type No:=String(MoveTypes_No )
		//  [STOCK MOVEMENTS]Posted Date:=◊CDate
		[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
		If ([PURCHASE_ORDERS:57]Currency_Code:16#"")
			[STOCK_MOVEMENTS:40]Currency_Code:10:=[PURCHASE_ORDERS:57]Currency_Code:16
		Else 
			[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
		End if 
		If (([PURCHASE_ORDERS:57]Analysis_Code:15="") & (<>PersAnOver))
			[STOCK_MOVEMENTS:40]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
		Else 
			[STOCK_MOVEMENTS:40]Analysis_Code:9:=[PURCHASE_ORDERS:57]Analysis_Code:15
		End if 
		If ([PURCHASE_ORDERS:57]Layer_Code:17#"")
			[STOCK_MOVEMENTS:40]Layer_Code:11:=[PURCHASE_ORDERS:57]Layer_Code:17
		Else 
			[STOCK_MOVEMENTS:40]Layer_Code:11:=DB_GetLedgerActualLayer
		End if 
		
		//Add the Stock Items
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		ARRAY TEXT:C222(PO_at_NSMProdCode; 0)
		
		ARRAY LONGINT:C221(PO_al_NSMItemNumer; 0)
		ARRAY TEXT:C222(PO_at_NSMSOCompanyCode; 0)
		ARRAY TEXT:C222(PO_at_NSMSOCode; 0)
		ARRAY REAL:C219(PO_ar_NSM_Quantity; 0)
		ARRAY REAL:C219(PO_ar_NSM_CostPrice; 0)
		ARRAY REAL:C219(PO_ar_NSM_TotalCost; 0)
		$_l_RecordsInSelection:=Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
		While ((Not:C34(End selection:C36([PURCHASE_ORDERS_ITEMS:169]))) & (OK=1))
			RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			If ([PRODUCTS:9]Maintain_Stock:14)
				If ([PURCHASE_ORDERS_ITEMS:169]Quantity:3>0)
					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
					
					[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
					If ([STOCK_TYPES:59]Allocation_Allowed:8)
						If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6>0)
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[PURCHASE_ORDERS_ITEMS:169]Item_Number:6
							If ([ORDER_ITEMS:25]Item_Number:27#[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
								
								RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
							End if 
							If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
								RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
							End if 
							[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
							[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
							$_bo_ReadOnlyState:=Read only state:C362([ORDER_ITEMS:25])
							READ WRITE:C146([ORDER_ITEMS:25])
							[ORDER_ITEMS:25]Allocated:28:=[ORDER_ITEMS:25]Allocated:28+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							SAVE RECORD:C53([ORDER_ITEMS:25])
							If ($_bo_ReadOnlyState)
								UNLOAD RECORD:C212([ORDER_ITEMS:25])
								READ ONLY:C145([ORDER_ITEMS:25])
							End if 
							
						End if 
					End if 
					[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
					[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=[PURCHASE_ORDERS_ITEMS:169]POitemID:16
					
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Abs:C99([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)  //4.0.035/6
					$_r_CostPrice:=$_r_CostPrice+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
					$_bo_Edits:=STK_SetHeaderInfo
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				Else 
					APPEND TO ARRAY:C911(PO_at_NSMProdCode; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
					
					If ([STOCK_TYPES:59]Allocation_Allowed:8)
						APPEND TO ARRAY:C911(PO_al_NSMItemNumer; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[PURCHASE_ORDERS_ITEMS:169]Item_Number:6
						RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
						RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
						APPEND TO ARRAY:C911(PO_at_NSMSOCompanyCode; [ORDERS:24]Company_Code:1)
						APPEND TO ARRAY:C911(PO_at_NSMSOCode; [ORDER_ITEMS:25]Order_Code:1)
						
					Else 
						APPEND TO ARRAY:C911(PO_al_NSMItemNumer; 0)
						APPEND TO ARRAY:C911(PO_at_NSMSOCode; "")
						APPEND TO ARRAY:C911(PO_at_NSMSOCompanyCode; "")
					End if 
					APPEND TO ARRAY:C911(PO_ar_NSM_Quantity; [PURCHASE_ORDERS_ITEMS:169]Quantity:3)
					APPEND TO ARRAY:C911(PO_ar_NSM_CostPrice; [PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
					APPEND TO ARRAY:C911(PO_ar_NSM_TotalCost; Abs:C99([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5))
					
					If (<>TrackStockposting)
						STK_PostTracker("Purch order"+[PURCHASE_ORDERS:57]Purchase_Order_Number:2+"Stock movement"+[STOCK_MOVEMENTS:40]Movement_Code:1+"Product "+[PURCHASE_ORDERS_ITEMS:169]Product_Code:1+" has a 0 quantity")
						
					End if 
				End if 
			Else 
				If (<>TrackStockposting)
					STK_PostTracker("Purch order"+[PURCHASE_ORDERS:57]Purchase_Order_Number:2+"Stock movement"+[STOCK_MOVEMENTS:40]Movement_Code:1+"Product "+[PURCHASE_ORDERS_ITEMS:169]Product_Code:1+" does not maintain stock")
				End if 
				
				
			End if 
			NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
		End while 
		If (Size of array:C274(PO_at_NSMProdCode)>0)
			
		End if 
		[STOCK_MOVEMENTS:40]Total_Cost:8:=$_r_CostPrice
		DB_SaveRecord(->[STOCK_MOVEMENTS:40])
		//NG-2010 STOCK-HERE we need to find any 'pre-allocations for the items and 'call them off' now(allocated stcok with no source. so it is 'copied from' these  stockm moevement items)
		//how are we going to deal with reconcilling that called of quantity when we are receiving stock to know that it has not already been received even though it is already called off
		If (OK=1)
			Gen_Confirm("Do you want to view the Stock Movement before posting?"; "View"; "Post now")
			If (OK=1)
				FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_In13")  //NG April 2004 Removed ◊Screen
				WIN_t_CurrentInputForm:="Movements_In13"
				Open_Pro_Window("Purchase Order Stock Movement"; 0; 2; ->[STOCK_MOVEMENTS:40]; WIN_t_CurrentInputForm)
				MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
				Close_ProWin(Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+WIN_t_CurrentInputForm)
				If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
					Gen_Confirm("Do you want to post the stock movement Now?"; "Yes"; "No")
					If (OK=1)
						[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
						RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
						Move_InPost
					Else 
						Gen_Alert("The stock movement will remain unposted until you review it")
						
					End if 
					
				End if 
				
				
			Else 
				[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
				Move_InPost
			End if 
			If (OK=1)
				[PURCHASE_ORDERS:57]Posted_Date:13:=<>DB_d_CurrentDate
				If ([PURCHASE_ORDERS:57]State:14=-1)
					PUR_SetFileState(1)
				End if 
				[PURCHASE_ORDERS:57]State:14:=0
				
				DB_SaveRecord(->[PURCHASE_ORDERS:57])
			End if 
		End if 
	Else 
		OK:=0
	End if 
	If (OK=1)
		DB_bo_RecordModified:=True:C214
		DB_t_CallOnCloseorSave:="File"
	Else 
		Gen_Alert("The Posting has been Cancelled"; "")
		OK:=0
	End if 
End if 
READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([STOCK_LEVELS:58])
READ ONLY:C145([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
UNLOAD RECORD:C212([CURRENT_STOCK:62])
UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
<>TrackStockposting:=False:C215
ERR_MethodTrackerReturn("PurchOrd StckP2"; $_t_oldMethodName)
