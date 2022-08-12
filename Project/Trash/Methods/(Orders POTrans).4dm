//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders POTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 19:27`Method: Orders POTrans
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_AllocateItems;0)
	//ARRAY LONGINT(STK_al_MovementUsages;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(STK_at_MovementUsages;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>PersAnOver; $_bo_Continue; $_bo_Locked; $_bo_PostStock; $_bo_TransactionCancel; $0)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_PurchaseOrderDate)
	C_LONGINT:C283($_l_AddMode; $_l_AllocationTypeRow; $_l_OK; $_l_POLineCount; $_l_PurchaseItemsIndex; $_l_PurchaseTypeRow; $_l_Result; vAdd; xCancel; xNext; xOK)
	C_LONGINT:C283(xOK2)
	C_REAL:C285(vSubtotal)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_OrderCode; $_t_PurchaseOrderNumber; $_t_SuppplierCompanyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders POTrans")
//Orders POTrans
StartTransaction

$_bo_Locked:=False:C215
READ WRITE:C146([PURCHASE_ORDERS:57])
READ WRITE:C146([ORDER_ITEMS:25])
//  START TRANSACTION out 13/05/02 pb

FIRST RECORD:C50([ORDER_ITEMS:25])
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20#"")
$_t_SuppplierCompanyCode:=[ORDER_ITEMS:25]Supplier_Code:20
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20=$_t_SuppplierCompanyCode)
CREATE SET:C116([ORDER_ITEMS:25]; "ToUpdate")
FIRST RECORD:C50([ORDER_ITEMS:25])
RELATE ONE:C42([ORDER_ITEMS:25]Supplier_Code:20)
If ((vNumber="N") | (vNumber=""))
	vNumber:=Gen_CodePref(16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
End if 
CREATE RECORD:C68([PURCHASE_ORDERS:57])

[PURCHASE_ORDERS:57]Purchase_Order_Number:2:=vNumber
[PURCHASE_ORDERS:57]Company_Code:1:=$_t_SuppplierCompanyCode
[PURCHASE_ORDERS:57]State:14:=-1
PUR_SetFileState
If ([ORDER_ITEMS:25]Purchase_Order_Date:19>!00-00-00!)
	[PURCHASE_ORDERS:57]Purchase_Order_Date:3:=[ORDER_ITEMS:25]Purchase_Order_Date:19
Else 
	[PURCHASE_ORDERS:57]Purchase_Order_Date:3:=<>DB_d_CurrentDate
End if 
[PURCHASE_ORDERS:57]Supply_by_Date:10:=[ORDER_ITEMS:25]Supply_by_Date:31
[PURCHASE_ORDERS:57]Finance_Method:11:=[ORDER_ITEMS:25]Finance_Method:32
[PURCHASE_ORDERS:57]Supplier_Ref:12:=[ORDER_ITEMS:25]Supplier_Reference:33

If ([ORDERS:24]Currency_Code:32#"")
	[PURCHASE_ORDERS:57]Currency_Code:16:=[ORDERS:24]Currency_Code:32
Else 
	[PURCHASE_ORDERS:57]Currency_Code:16:=<>SYS_t_BaseCurrency
End if 
If (([ORDERS:24]Analysis_Code:33="") & (<>PersAnOver))
	[PURCHASE_ORDERS:57]Analysis_Code:15:=<>Per_t_CurrentDefaultAnalCode
Else 
	[PURCHASE_ORDERS:57]Analysis_Code:15:=[ORDERS:24]Analysis_Code:33
End if 
If ([ORDERS:24]Layer_Code:47#"")
	[PURCHASE_ORDERS:57]Layer_Code:17:=[ORDERS:24]Layer_Code:47
Else 
	[PURCHASE_ORDERS:57]Layer_Code:17:=DB_GetLedgerActualLayer
End if 
If (DB_t_CurrentFormUsage="Job @")
	[PURCHASE_ORDERS:57]Comments:8:=DB_t_CurrentFormUsage
End if 
$_l_POLineCount:=0
vSubtotal:=0
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($_bo_Locked=False:C215))
	If (Locked:C147([ORDER_ITEMS:25]))
		$_bo_Locked:=True:C214
	Else 
		$_bo_Continue:=True:C214
		$_l_OK:=OK
		If (Round:C94(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2)<=0)
			Gen_Confirm("The required quantity of "+[ORDER_ITEMS:25]Product_Name:13+"on order "+[ORDER_ITEMS:25]Order_Code:1+" item "+String:C10([ORDER_ITEMS:25]Item_Number:27)+" is 0. Do you still wish to add? "; "Yes"; "No")
			$_bo_Continue:=(OK=1)
		End if 
		If ($_bo_Continue)
			OK:=$_l_OK
			$_l_POLineCount:=$_l_POLineCount+1
			CREATE RECORD:C68([PURCHASE_ORDERS_ITEMS:169])
			[PURCHASE_ORDERS_ITEMS:169]POitemID:16:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
			[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
			[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
			[PURCHASE_ORDERS_ITEMS:169]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
			[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=[ORDER_ITEMS:25]Product_Name:13
			[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=Round:C94(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2)
			[PURCHASE_ORDERS_ITEMS:169]Price_Per:12:=[ORDER_ITEMS:25]Price_Per:50
			[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[ORDER_ITEMS:25]Cost_Price:5
			[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[ORDER_ITEMS:25]Cost_Price:5
			If ([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4=0) & ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
				
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
				
				QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
					CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
					[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
					[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
					
					[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[PURCHASE_ORDERS:57]Company_Code:1
					DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
				End if 
				//If ([PURCHASE ORDERS_ITEMS]Original Cost=0)
				[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
				[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
				PurchOrd_SubCal
				//End if
				If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
					PriceT_CheckCoP
				End if 
			End if 
			
			RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)
				PriceT_CheckCoP
			End if 
			PurchOrd_SubCal
			vSubtotal:=Round:C94((vSubtotal+[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2)
			If (([ORDER_ITEMS:25]Component_Level:47=0) | ([ORDER_ITEMS:25]Invoice_Number:17#"ASS COMP"))
				[PURCHASE_ORDERS_ITEMS:169]Item_Number:6:=[ORDER_ITEMS:25]Item_Number:27
			End if 
			If ([COMPANIES:2]Default_TAX:41="")
				[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
			Else 
				[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7:=[COMPANIES:2]Default_TAX:41
			End if 
			If ([PURCHASE_ORDERS:57]Supply_by_Date:10=!00-00-00!)
				[PURCHASE_ORDERS:57]Supply_by_Date:10:=[ORDER_ITEMS:25]Supply_by_Date:31
			End if 
			If ([PURCHASE_ORDERS:57]Finance_Method:11="")
				[PURCHASE_ORDERS:57]Finance_Method:11:=[ORDER_ITEMS:25]Finance_Method:32
			End if 
			If ([PURCHASE_ORDERS:57]Supplier_Ref:12="")
				[PURCHASE_ORDERS:57]Supplier_Ref:12:=[ORDER_ITEMS:25]Supplier_Reference:33
			End if 
			[PURCHASE_ORDERS_ITEMS:169]Description:13:=[ORDER_ITEMS:25]Description:44
			[PURCHASE_ORDERS_ITEMS:169]Print_Description:14:=[ORDER_ITEMS:25]Print_Description:45
			DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
			[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
			[ORDER_ITEMS:25]Purchase_Order_Number:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
			[ORDER_ITEMS:25]Purchase_Order_Date:19:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
			DB_SaveRecord(->[ORDER_ITEMS:25])
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		End if 
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 

If ($_bo_Locked)
	USE SET:C118("ToUpdate")
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
		[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
		[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
	Transact_End(False:C215)
	Gen_Alert("One or more of the Order Items was locked by another User or Process."+"  The Purchase Order to "+[PURCHASE_ORDERS:57]Company_Code:1+" cannot be produced."; "Cancel")
	OK:=0
Else 
	If ($_l_POLineCount>0)
		If ([PURCHASE_ORDERS:57]Company_Code:1#"")
			[PURCHASE_ORDERS:57]Total_Cost:4:=vSubtotal
			Macro_AccTypeDEF("ORD_POtransAdd")
			DB_SaveRecord(->[PURCHASE_ORDERS:57])
			If (OK=1)
				//TRACE
				$_l_Result:=Gen_Confirm3_withHideOption(301; "Do you want to check the Purchase Order to "+[PURCHASE_ORDERS:57]Company_Code:1+"?"; "Check"; "Cancel"; "Continue")
				//Gen_Confirm3 ("Do you want to check the Purchase Order to "+[PURCHASE ORDERS]Company Code+"?";"Check";"Cancel";"Continue")
				$_bo_PostStock:=False:C215
				CLOSE WINDOW:C154
				Case of 
					: ($_l_Result=1)
						$_l_AddMode:=vAdd
						vAdd:=1
						$_t_PurchaseOrderNumber:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
						$_d_PurchaseOrderDate:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
						PurchOrd_FileI
						
						Open_Pro_Window("Check Purchase Order"; 0; 2; ->[PURCHASE_ORDERS:57]; WIN_t_CurrentInputForm)
						
						READ WRITE:C146([PURCHASE_ORDERS:57])
						MODIFY RECORD:C57([PURCHASE_ORDERS:57]; *)
						$_l_OK:=OK
						Close_ProWin(Table name:C256(->[PURCHASE_ORDERS:57])+"_"+WIN_t_CurrentInputForm)
						
						If (($_l_OK=1) & (($_t_PurchaseOrderNumber#[PURCHASE_ORDERS:57]Purchase_Order_Number:2) | ($_d_PurchaseOrderDate#[PURCHASE_ORDERS:57]Purchase_Order_Date:3)))
							If (($_l_OK=1) & ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!))
								xNext:=0
								xOK:=0
								xCancel:=0
								xOK2:=$_l_OK
								PurchOrd_PPrint(1; ->xOK2)
								xOK:=xOK2
								$_bo_PostStock:=True:C214
							Else 
								xOK:=$_l_OK
							End if 
							If (xNext=1) | (xOK=1)
								USE SET:C118("ToUpdate")
								FIRST RECORD:C50([ORDER_ITEMS:25])
								While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6=[ORDER_ITEMS:25]Item_Number:27; *)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
										[ORDER_ITEMS:25]Purchase_Order_Number:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
										[ORDER_ITEMS:25]Purchase_Order_Date:19:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
									Else 
										[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
										[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
										
									End if 
									[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
									NEXT RECORD:C51([ORDER_ITEMS:25])
								End while 
								Transact_End(True:C214)
								$_bo_PostStock:=True:C214
							Else 
								$_bo_PostStock:=False:C215
								USE SET:C118("ToUpdate")
								
								FIRST RECORD:C50([ORDER_ITEMS:25])
								While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
									[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
									[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
									NEXT RECORD:C51([ORDER_ITEMS:25])
								End while 
								OK:=0
								Transact_End(False:C215)
								OK:=1
							End if 
							
						Else 
							If (($_l_OK=1) & ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!))
								xNext:=0
								xOK:=1
								xCancel:=0
								xOK2:=$_l_OK
								$_t_OrderCode:=[ORDERS:24]Order_Code:3
								PurchOrd_PPrint(1; ->xOK2)
								
								xOK:=xOK2
								$_bo_PostStock:=True:C214
							Else 
								xOK:=$_l_OK
							End if 
							If (xNext=1) | (xOK=1)
								
								USE SET:C118("ToUpdate")
								FIRST RECORD:C50([ORDER_ITEMS:25])
								While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6=[ORDER_ITEMS:25]Item_Number:27; *)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
										[ORDER_ITEMS:25]Purchase_Order_Number:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
										[ORDER_ITEMS:25]Purchase_Order_Date:19:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
									Else 
										[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
										[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
									End if 
									[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
									NEXT RECORD:C51([ORDER_ITEMS:25])
								End while 
								Transact_End(True:C214)
							Else 
								$_bo_PostStock:=False:C215
								Gen_Confirm("Do you wish to delete the PO "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2+"?"; "Yes"; "No")
								If (OK=1)
									DELETE RECORD:C58([PURCHASE_ORDERS:57])
									USE SET:C118("ToUpdate")
									FIRST RECORD:C50([ORDER_ITEMS:25])
									While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
										[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
										[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
										NEXT RECORD:C51([ORDER_ITEMS:25])
									End while 
									OK:=0
									Transact_End(False:C215)
									OK:=1
								Else 
									//save it
									Transact_End(True:C214)
								End if 
								
							End if 
						End if 
						
						
						vAdd:=$_l_AddMode
						
					: ($_l_Result=2)
						OK:=1
						If ((OK=1) & ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!))
							xNext:=0
							xOK:=0
							xCancel:=0
							xOK2:=OK
							PurchOrd_PPrint(1; ->xOK2)
							xOK:=xOK2
							$_bo_PostStock:=False:C215
						Else 
							xOK:=OK
						End if 
						If (xNext=1) | (xOK=1)
							USE SET:C118("ToUpdate")
							FIRST RECORD:C50([ORDER_ITEMS:25])
							While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
								QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6=[ORDER_ITEMS:25]Item_Number:27; *)
								QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
								If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
									[ORDER_ITEMS:25]Purchase_Order_Number:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
									[ORDER_ITEMS:25]Purchase_Order_Date:19:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
								Else 
									[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
									[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
								End if 
								
								[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
								NEXT RECORD:C51([ORDER_ITEMS:25])
							End while 
							Transact_End(True:C214)
						Else 
							$_bo_PostStock:=False:C215
							USE SET:C118("ToUpdate")
							FIRST RECORD:C50([ORDER_ITEMS:25])
							While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
								[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
								[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
								NEXT RECORD:C51([ORDER_ITEMS:25])
							End while 
							OK:=0
							Transact_End(False:C215)
							OK:=1
							
							
						End if 
						OK:=1
					Else 
						USE SET:C118("ToUpdate")
						FIRST RECORD:C50([ORDER_ITEMS:25])
						While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
							[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
							[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
							[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End while 
						OK:=0
						Transact_End(False:C215)
						OK:=1
						
				End case 
				If (<>DB_bo_NewStockActive)
					//NG Modification here to create the order allocation..allocating the PO item to the SO Item.
					If ($_bo_PostStock)
						If (DB_GetModuleSettingByNUM(Module_StockControl)>0)
							//``
							//NOTE THAT THE PO POSTING SHOULD HAVE HAPPENED IN THE PRINT
							STK_LoadStockFunctions
							$_l_PurchaseTypeRow:=Find in array:C230(STK_at_MovementUsages; "Use for Purchases")
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Usage:26=STK_al_MovementUsages{$_l_PurchaseTypeRow})
							If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
								QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[PURCHASE_ORDERS:57]); *)
								QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]MovementSourceReference:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
								If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
									ARRAY TEXT:C222($_at_ProductCodes; 0)
									QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
									For ($_l_PurchaseItemsIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
										If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
											APPEND TO ARRAY:C911($_at_ProductCodes; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
										End if 
										NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
									End for 
									If (Size of array:C274($_at_ProductCodes)>0)
										QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
										QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Maintain_Stock:14=True:C214)
										If (Records in selection:C76([PRODUCTS:9])>0)
											//``
											USE SET:C118("ToUpdate")
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
											
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; STK_al_AllocateItems)
											Gen_Confirm("Do you want to post the Purchase Order as a Stock Movement?"; "Yes"; "No")
											If (OK=1)
												
												STK_EnterStockMovement(1; False:C215; [PURCHASE_ORDERS:57]x_ID:21)
												
											Else 
												OK:=1
											End if 
										Else 
											OK:=1
										End if 
									Else 
										OK:=1
									End if 
								End if 
								//DONT DO THIS UNLESS ALLOCATION MOVEMENTS HAVE BEEN SETUP
								
								$_l_AllocationTypeRow:=Find in array:C230(STK_at_MovementUsages; "Use For Allocation")
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Usage:26=STK_al_MovementUsages{$_l_AllocationTypeRow})
								
								If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
									STK_EnterStockMovement(3; False:C215; [ORDERS:24]x_ID:58; "STK_al_AllocateItems"; Current process:C322)
									UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
								End if 
							End if 
							
						End if 
					End if 
				End if 
			Else 
				USE SET:C118("ToUpdate")
				FIRST RECORD:C50([ORDER_ITEMS:25])
				While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
					[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
					[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				OK:=0
				Transact_End(False:C215)
				OK:=1
			End if 
		Else 
			USE SET:C118("ToUpdate")
			FIRST RECORD:C50([ORDER_ITEMS:25])
			While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
				[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
				[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
			OK:=0
			Transact_End(False:C215)
			OK:=1
		End if 
	Else 
		OK:=0
		Transact_End(False:C215)
		
	End if 
	
End if 

UNLOAD RECORD:C212([ORDER_ITEMS:25])
//Transact EndNF out 13/05/02 pb
ERR_MethodTrackerReturn("Orders POTrans"; $_t_oldMethodName)