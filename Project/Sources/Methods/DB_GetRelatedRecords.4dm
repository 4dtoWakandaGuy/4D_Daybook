//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetRelatedRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       10/06/2010 23:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY LONGINT:C221($_al_ActionIDs; 0)
	ARRAY LONGINT:C221($_al_CatalogueIDS; 0)
	ARRAY LONGINT:C221($_al_ContactIDS; 0)
	ARRAY LONGINT:C221($_al_CSIDS; 0)
	ARRAY LONGINT:C221($_al_CurrentStockID; 0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_POItemIDs; 0)
	//ARRAY LONGINT(COM_al_TabIncludes;0)
	//ARRAY LONGINT(DB_al_DocIncludes;0)
	//ARRAY LONGINT(DB_al_TabIncludes;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_AnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CreditAccounts; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_DebitAccounts; 0)
	ARRAY TEXT:C222($_at_JobStageCodes; 0)
	ARRAY TEXT:C222($_at_LayerCodes; 0)
	ARRAY TEXT:C222($_at_POCodes; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	ARRAY TEXT:C222($_at_UniqueValues; 0)
	//ARRAY TEXT(COM_at_TabNames;0)
	//ARRAY TEXT(DB_at_TabNames;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305($_bo_UseCUrrentSelection; $3; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_BlankRow; $_l_GroupRow; $_l_Index; $_l_Index2; $_l_TabIncludes; $_l_TabNumber)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetRelatedRecords")
If (Count parameters:C259>=3)
	//TRACE
	$_bo_UseCUrrentSelection:=$3
End if 
If (DB_bo_ShowArrayBased)
	//DB_SetFormSize (DB_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
Else 
	If (Records in set:C195("ListboxSet0")>0)
		Gen_Confirm("Use Higlighted selection?"; "Yes"; "No")
		If (OK=1)
			USE SET:C118("ListboxSet0")
		End if 
	End if 
End if 

Case of 
	: ($1=Table:C252(->[COMPANIES:2]))  //contact, companies, diary(by type!) Orders_Purchase Orders_InVoices, purchase invoices, service calls , jobs
		
		//This tab should also have products and potentially batches and transactions
		Case of 
			: ($2=Table:C252(->[CONTACTS:1]))
				SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				RELATE ONE SELECTION:C349([CONTACTS_COMPANIES:145]; [CONTACTS:1])
				CREATE SET:C116([CONTACTS:1]; "$Set1")
				RELATE MANY SELECTION:C340([CONTACTS:1]Company_Code:1)
				CREATE SET:C116([CONTACTS:1]; "$Set2")
				UNION:C120("$set1"; "$Set2"; "$Set1")
				USE SET:C118("$set1")
				
			: ($2=Table:C252(->[CONTACTS_COMPANIES:145]))
				SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
			: ($2=Table:C252(->[DIARY:12]))  //Companies, diary(by type), orders, purchase orders, invoiices, purchases service calls jaobs
				
				RELATE MANY SELECTION:C340([DIARY:12]Company_Code:1)
				If (Size of array:C274(DB_at_TabNames)>0)
					$_l_TabNumber:=Find in array:C230(COM_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
					If ($_l_TabNumber>0)
						If (Size of array:C274(DB_al_TabIncludes{$_l_TabNumber})>0)
							ARRAY LONGINT:C221($_al_ActionIDs; 0)
							For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabNumber}))
								If (COM_al_TabIncludes{$_l_TabNumber}{$_l_Index}>0)
									APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabNumber}{$_l_Index})
								Else 
									$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabNumber}{$_l_Index}
									$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
									If ($_l_GroupRow>0)
										For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
											APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
										End for 
									End if 
								End if 
							End for 
							QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_ActionCodes)
							If (DB_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
							End if 
							
							
							
							
						End if 
					End if 
					
				End if 
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS:57]Company_Code:1)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Company_Code:1)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([INVOICES:39]Company_Code:2)
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICES:37]Company_Code:2)
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([SERVICE_CALLS:20]Company_Code:1)
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([JOBS:26]Company_Code:3)
		End case 
	: ($1=Table:C252(->[CONTACTS:1]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([CONTACTS_COMPANIES:145]Contact_Code:4)
				
				SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
				QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				CREATE SET:C116([COMPANIES:2]; "$Set1")
				RELATE ONE SELECTION:C349([CONTACTS:1]; [COMPANIES:2])
				CREATE SET:C116([COMPANIES:2]; "$Set2")
				UNION:C120("$Set1"; "$Set2"; "$Set1")
				USE SET:C118("$Set1")
				
			: ($2=Table:C252(->[DIARY:12]))
				RELATE MANY SELECTION:C340([DIARY:12]Contact_Code:2)
				If (Size of array:C274(DB_at_TabNames)>0)
					$_l_TabNumber:=Find in array:C230(COM_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
					If ($_l_TabNumber>0)
						If (Size of array:C274(DB_al_TabIncludes{$_l_TabNumber})>0)
							ARRAY LONGINT:C221($_al_ActionIDs; 0)
							For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabNumber}))
								If (COM_al_TabIncludes{$_l_TabNumber}{$_l_Index}>0)
									APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabNumber}{$_l_Index})
								Else 
									$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabNumber}{$_l_Index}
									$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
									If ($_l_GroupRow>0)
										For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
											APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
										End for 
									End if 
								End if 
							End for 
							QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_ActionCodes)
							If (DB_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
							End if 
							
							
							
							
						End if 
					End if 
					
				End if 
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Contact_Code:2)
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS:57]Contact_Code:5)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([INVOICES:39]Contact_Code:3)
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([SERVICE_CALLS:20]Contact_Code:2)
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([JOBS:26]Contact_Code:4)
		End case 
	: ($1=Table:C252(->[PRODUCTS:9]))  //DB_AddTab ($3;$4;->[PRODUCTS];->[COMPANIES];->[ORDERS];->[ORDER ITEMS];->[PURCHASE ORDERS];->[PURCHASE ORDERS_ITEMS];->[INVOICES];->[INVOICES_ITEMS];->[PURCHASES];->[PURCHASES_ITEMS];->[PRICE TABLE])
		
		//Diarybytype
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([PRODUCTS_SUPPLIERS:148]Product_Code:8)
				RELATE ONE SELECTION:C349([PRODUCTS_SUPPLIERS:148]; [COMPANIES:2])
				
				
				//DB_AddTab ($3;$4;->[BRANDS];->[GROUPS];->[STOCK MOVEMENTS];->[STOCK ITEMS];->[CURRENT STOCK];->[STOCK LEVELS];->[COMPONENTS];->[SERVICE CALLS];->[SERVICE CALLS_PRODUCTS])
				
			: ($2=Table:C252(->[ORDERS:24]))  //order items `diary by type
				
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Product_Code:2)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				
			: ($2=Table:C252(->[ORDER_ITEMS:25]))  //order items `diary by type
				
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Product_Code:2)
				
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS:57])
				
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]Product_Code:1)
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]Product_Code:1)
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
				RELATE ONE SELECTION:C349([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICES:37])
				
			: ($2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
				
			: ($2=Table:C252(->[PRICE_TABLE:28]))
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Product_Code:1)
			: ($2=Table:C252(->[DIARY:12]))
				RELATE MANY SELECTION:C340([DIARY:12]Product_Code:13)
				If (Size of array:C274(DB_at_TabNames)>0)
					$_l_TabNumber:=Find in array:C230(COM_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
					If ($_l_TabNumber>0)
						If (Size of array:C274(DB_al_TabIncludes{$_l_TabNumber})>0)
							ARRAY LONGINT:C221($_al_ActionIDs; 0)
							For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabNumber}))
								If (COM_al_TabIncludes{$_l_TabNumber}{$_l_Index}>0)
									APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabNumber}{$_l_Index})
								Else 
									$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabNumber}{$_l_Index}
									$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
									If ($_l_GroupRow>0)
										For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
											APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
										End for 
									End if 
								End if 
							End for 
							QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_ActionCodes)
							If (DB_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
							End if 
							
							
							
							
						End if 
					End if 
					
				End if 
			: ($2=Table:C252(->[PRODUCT_BRANDS:8]))
				RELATE MANY SELECTION:C340([PRODUCT_BRANDS:8]Brand_Code:1)
			: ($2=Table:C252(->[PRODUCT_GROUPS:10]))
				RELATE MANY SELECTION:C340([PRODUCT_GROUPS:10]Group_Code:1)
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				RELATE MANY SELECTION:C340([CURRENT_STOCK:62]Product_Code:1)
			: ($2=Table:C252(->[STOCK_LEVELS:58]))
				RELATE MANY SELECTION:C340([STOCK_LEVELS:58]Product_Code:1)
			: ($2=Table:C252(->[COMPONENTS:86]))
				RELATE MANY SELECTION:C340([COMPONENTS:86]Product_Code:1)
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
				RELATE ONE SELECTION:C349([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS:20])
		End case 
		
	: ($1=Table:C252(->[ORDERS:24]))
		Case of 
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
			: ($2=Table:C252(->[DIARY:12]))
				
				RELATE MANY SELECTION:C340([DIARY:12]Order_Code:26)
				If (Size of array:C274(DB_at_TabNames)>0)
					$_l_TabNumber:=Find in array:C230(COM_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
					If ($_l_TabNumber>0)
						If (Size of array:C274(DB_al_TabIncludes{$_l_TabNumber})>0)
							ARRAY LONGINT:C221($_al_ActionIDs; 0)
							For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabNumber}))
								If (COM_al_TabIncludes{$_l_TabNumber}{$_l_Index}>0)
									APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabNumber}{$_l_Index})
								Else 
									$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabNumber}{$_l_Index}
									$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
									If ($_l_GroupRow>0)
										For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
											APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
										End for 
									End if 
								End if 
							End for 
							QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_ActionCodes)
							If (DB_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
							End if 
							
							
							
							
						End if 
					End if 
					
				End if 
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)
				$_l_BlankRow:=Find in array:C230($_at_PONumbers; "")
				If ($_l_BlankRow>0)
					DELETE FROM ARRAY:C228($_at_PONumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [INVOICES:39])
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]Item_Number:12)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([ORDERS:24]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([ORDERS:24]; [CONTACTS:1])
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [PRODUCTS:9])
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [SERVICE_CALLS:20])
				
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [JOBS:26])
		End case 
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		Case of 
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[DIARY:12]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				RELATE MANY SELECTION:C340([DIARY:12]Order_Code:26)
				If (Size of array:C274(DB_at_TabNames)>0)
					$_l_TabNumber:=Find in array:C230(COM_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
					If ($_l_TabNumber>0)
						If (Size of array:C274(DB_al_TabIncludes{$_l_TabNumber})>0)
							ARRAY LONGINT:C221($_al_ActionIDs; 0)
							For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabNumber}))
								If (COM_al_TabIncludes{$_l_TabNumber}{$_l_Index}>0)
									APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabNumber}{$_l_Index})
								Else 
									$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabNumber}{$_l_Index}
									$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
									If ($_l_GroupRow>0)
										For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
											APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
										End for 
									End if 
								End if 
							End for 
							QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
							QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_ActionCodes)
							If (DB_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
							End if 
							
							
							
							
						End if 
					End if 
					
				End if 
				
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				
				DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)
				$_l_BlankRow:=Find in array:C230($_at_PONumbers; "")
				If ($_l_BlankRow>0)
					DELETE FROM ARRAY:C228($_at_PONumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [INVOICES:39])
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]Item_Number:12)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				RELATE ONE SELECTION:C349([ORDERS:24]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				RELATE ONE SELECTION:C349([ORDERS:24]; [CONTACTS:1])
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [PRODUCTS:9])
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [SERVICE_CALLS:20])
				
			: ($2=Table:C252(->[JOBS:26]))
				
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [JOBS:26])
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OrderItemNumbers)
				
		End case 
		
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		
		
	: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))
		
		
		
	: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
		
	: ($1=Table:C252(->[ACTIONS:13]))
		Case of 
			: ($2=Table:C252(->[DIARY:12]))
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
				
				QUERY WITH ARRAY:C644([DIARY:12]Action_Code:9; $_at_ActionCodes)
			: ($2=Table:C252(->[WORKFLOW_CONTROL:51]))
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
				QUERY WITH ARRAY:C644([WORKFLOW_CONTROL:51]Action_Code:1; $_at_ActionCodes)
		End case 
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		Case of 
			: ($2=Table:C252(->[COUNTRIES:73]))
				RELATE MANY SELECTION:C340([COUNTRIES:73]Address_Format:2)
				
		End case 
		
		
		
	: ($1=Table:C252(->[ANALYSES:36]))
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				RELATE MANY SELECTION:C340([ACCOUNTS_ANALYSES:157]Analysis_Code:1)
				RELATE ONE SELECTION:C349([ACCOUNTS_ANALYSES:157]; [ACCOUNTS:32])
				
		End case 
		//analysies
		
		
	: ($1=Table:C252(->[AREAS:3]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([COMPANIES:2]Area:11)
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE MANY SELECTION:C340([COMPANIES:2]Area:11)
				SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				RELATE ONE SELECTION:C349([CONTACTS_COMPANIES:145]; [CONTACTS:1])
				
		End case 
		
		
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		Case of 
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([PRODUCT_BRANDS:8]; [PRODUCTS:9])
			: ($2=Table:C252(->[PRICE_TABLE:28]))
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Brand_Code:7)
				
		End case 
		
		
		
	: ($1=Table:C252(->[X_URL_LInks:101]))
		//dont show this table
	: ($1=Table:C252(->[CATALOGUE:108]))
		Case of 
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE MANY SELECTION:C340([Catalogue_ProductLink:109]X_CatalogueID:2)
				RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
				
			: ($2=Table:C252(->[PRICE_TABLE:28]))
				SELECTION TO ARRAY:C260([CATALOGUE:108]x_ID:1; $_al_CatalogueIDS)
				QUERY WITH ARRAY:C644([PRICE_TABLE:28]x_CatalogueID:14; $_al_CatalogueIDS)
		End case 
		
		
		
	: ($1=Table:C252(->[Catalogue_Availability:110]))
		
		
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		Case of 
			: ($2=Table:C252(->[PERSONNEL:11]))
				RELATE MANY SELECTION:C340([PERSONNEL:11]Category_Code:6)
				
		End case 
		
		
	: ($1=Table:C252(->[CC_OrderAuths:133]))
	: ($1=Table:C252(->[CCM_PSPTransaction:136]))
	: ($1=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
	: ($1=Table:C252(->[CODE_USES:91]))
	: ($1=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
		
	: ($1=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
		
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		Case of 
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([CONTRACTS:17]Contract_Type_Code:4)
				RELATE ONE SELECTION:C349([CONTRACTS:17]; [SERVICE_CALLS:20])
			: ($2=Table:C252(->[CONTRACTS:17]))
				RELATE MANY SELECTION:C340([CONTRACTS:17]Contract_Type_Code:4)
				
				
		End case 
		//contracts
		
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([CONTRACTS:17]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([CONTRACTS:17]; [CONTACTS:1])
			: ($2=Table:C252(->[CONTRACT_TYPES:19]))
				RELATE ONE SELECTION:C349([CONTRACTS:17]; [CONTRACT_TYPES:19])
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE ONE SELECTION:C349([CONTRACTS:17]; [SERVICE_CALLS:20])
				
		End case 
		
		
		//service calls
		
		
	: ($1=Table:C252(->[CONTRACTS_CONTACTS:151]))
		
	: ($1=Table:C252(->[COUNTRIES:73]))
		
		Case of 
			: ($2=Table:C252(->[TAX_CODES:35]))
				RELATE ONE SELECTION:C349([COUNTRIES:73]; [TAX_CODES:35])
				
		End case 
		
		
		//address formats
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		
		Case of 
			: ($2=Table:C252(->[DOCUMENTS:7]))
				RELATE ONE SELECTION:C349([CREDIT_STAGES:54]; [DOCUMENTS:7])
		End case 
		
		
	: ($1=Table:C252(->[CURRENCIES:71]))
		Case of 
			: ($2=Table:C252(->[CURRENCY_RATES:72]))
				RELATE MANY SELECTION:C340([CURRENCY_RATES:72]Currency_From:1)
				
				
		End case 
		
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		Case of 
			: ($2=Table:C252(->[CURRENCIES:71]))
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_From:1; $_at_CurrencyCodes)
				QUERY WITH ARRAY:C644([CURRENCIES:71]Currency_Code:1; $_at_CurrencyCodes)
				
				
		End case 
		
		
		
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		Case of 
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([CURRENT_STOCK:62]; [PRODUCTS:9])
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes; [CURRENT_STOCK:62]Serial_Number:2; $_at_SerialNumbers; [CURRENT_STOCK:62]Layer_Code:12; $_at_LayerCodes; [CURRENT_STOCK:62]Analysis_Code:10; $_at_AnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CurrencyCodes; [CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$SET1")
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CSIDS)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$SET2")
				UNION:C120("$SET1"; "$SET2"; "$SET1")
				USE SET:C118("$SET1")
				
				If (False:C215)
					SORT ARRAY:C229($_at_SerialNumbers; <)
					$_l_BlankRow:=Find in array:C230($_at_SerialNumbers; "")
					If ($_l_BlankRow>0)
						ARRAY TEXT:C222($_at_SerialNumbers; $_l_BlankRow-1)
					End if 
					If (Size of array:C274($_at_SerialNumbers)>0)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
					End if 
					SORT ARRAY:C229($_at_LayerCodes; <)
					$_l_BlankRow:=Find in array:C230($_at_LayerCodes; "")
					If ($_l_BlankRow>0)
						ARRAY TEXT:C222($_at_LayerCodes; $_l_BlankRow-1)
					End if 
					RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
					If (Size of array:C274($_at_LayerCodes)>0)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_LayerCodes)
					End if 
					SORT ARRAY:C229($_at_AnalysisCodes; <)
					$_l_BlankRow:=Find in array:C230($_at_AnalysisCodes; "")
					If ($_l_BlankRow>0)
						ARRAY TEXT:C222($_at_AnalysisCodes; $_l_BlankRow-1)
					End if 
					If (Size of array:C274($_at_AnalysisCodes)>0)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_AnalysisCodes)
					End if 
					SORT ARRAY:C229($_at_CurrencyCodes; <)
					$_l_BlankRow:=Find in array:C230($_at_CurrencyCodes; "")
					If ($_l_BlankRow>0)
						ARRAY TEXT:C222($_at_CurrencyCodes; $_l_BlankRow-1)
					End if 
					If (Size of array:C274($_at_CurrencyCodes)>0)
						QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Currency_Code:10; $_at_CurrencyCodes)
					End if 
					RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				End if 
				
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes; [CURRENT_STOCK:62]Serial_Number:2; $_at_SerialNumbers; [CURRENT_STOCK:62]Layer_Code:12; $_at_LayerCodes; [CURRENT_STOCK:62]Analysis_Code:10; $_at_AnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CurrencyCodes)
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
				SORT ARRAY:C229($_at_SerialNumbers; <)
				$_l_BlankRow:=Find in array:C230($_at_SerialNumbers; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_SerialNumbers; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_SerialNumbers)>0)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
				End if 
				SORT ARRAY:C229($_at_LayerCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_LayerCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_LayerCodes; $_l_BlankRow-1)
				End if 
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
				If (Size of array:C274($_at_LayerCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_LayerCodes)
				End if 
				SORT ARRAY:C229($_at_AnalysisCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_AnalysisCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_AnalysisCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_AnalysisCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_AnalysisCodes)
				End if 
				SORT ARRAY:C229($_at_CurrencyCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_CurrencyCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_CurrencyCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_CurrencyCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Currency_Code:10; $_at_CurrencyCodes)
				End if 
			: ($2=Table:C252(->[STOCK_LEVELS:58]))
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]UniqueConstruct:14; $_at_UniqueValues)
				QUERY WITH ARRAY:C644([STOCK_LEVELS:58]UniqueConstruct:11; $_at_UniqueValues)
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes; [CURRENT_STOCK:62]Serial_Number:2; $_at_SerialNumbers; [CURRENT_STOCK:62]Layer_Code:12; $_at_LayerCodes; [CURRENT_STOCK:62]Analysis_Code:10; $_at_AnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CurrencyCodes)
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]Product_Code:1; $_at_ProductCodes)
				SORT ARRAY:C229($_at_LayerCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_LayerCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_LayerCodes; $_l_BlankRow-1)
				End if 
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS:57])
				If (Size of array:C274($_at_LayerCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Layer_Code:17; $_at_LayerCodes)
				End if 
				SORT ARRAY:C229($_at_AnalysisCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_AnalysisCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_AnalysisCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_AnalysisCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Analysis_Code:15; $_at_AnalysisCodes)
				End if 
				SORT ARRAY:C229($_at_CurrencyCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_CurrencyCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_CurrencyCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_CurrencyCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([PURCHASE_ORDERS:57]Currency_Code:16; $_at_CurrencyCodes)
				End if 
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Item_Number:5; $_al_OrderItemNumbers)
				SORT ARRAY:C229($_al_OrderItemNumbers; <)
				$_l_BlankRow:=Find in array:C230($_al_OrderItemNumbers; 0)
				If ($_l_BlankRow>0)
					ARRAY LONGINT:C221($_al_OrderItemNumbers; $_l_BlankRow-1)
				End if 
				QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
		End case 
		
	: ($1=Table:C252(->[DATA_AUDITS:102]))
		
	: ($1=Table:C252(->[DELETIONS:66]))
	: ($1=Table:C252(->[DIARY:12]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([DIARY:12]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([DIARY:12]; [CONTACTS:1])
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE ONE SELECTION:C349([DIARY:12]; [ORDERS:24])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE ONE SELECTION:C349([DIARY:12]; [ORDERS:24])
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([DIARY:12]; [PRODUCTS:9])
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([xDiaryRelations:137]xDiaryID:1)
				QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[PURCHASE_ORDERS:57]))
				SELECTION TO ARRAY:C260([xDiaryRelations:137]XRecord_Code:5; $_at_POCodes)
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_POCodes)
			: ($2=Table:C252(->[JOBS:26]))
				RELATE ONE SELECTION:C349([DIARY:12]; [JOBS:26])
				
		End case 
		
		
	: ($1=Table:C252(->[DIARY_ITEMOWNERS:106]))
	: ($1=Table:C252(->[DOCUMENTS:7]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([DIARY:12]Document_Code:15)
				RELATE ONE SELECTION:C349([DIARY:12]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE MANY SELECTION:C340([DIARY:12]Document_Code:15)
				RELATE ONE SELECTION:C349([DIARY:12]; [CONTACTS:1])
				
				
		End case 
		//
	: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
	: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
		
	: ($1=Table:C252(->[EW_BK_FieldMap:121]))
	: ($1=Table:C252(->[EW_BKFields:122]))
	: ($1=Table:C252(->[EW_ExportProjects:117]))
	: ($1=Table:C252(->[EW_ExportSteps:118]))
	: ($1=Table:C252(->[EW_ExportTables:120]))
	: ($1=Table:C252(->[EW_StepActions:119]))
	: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
	: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
	: ($1=Table:C252(->[IDENTIFIERS:16]))
	: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
	: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY:C262([COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1)
				RELATE ONE SELECTION:C349([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES:2])
				
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY:C262([COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1)
				RELATE ONE SELECTION:C349([COMPANIES_RECORD_ANALYSIS:146]; [CONTACTS:1])
				
		End case 
		
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		Case of 
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE MANY SELECTION:C340([PRODUCTS:9]Group_Code:3)
				
			: ($2=Table:C252(->[PRICE_TABLE:28]))
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Group_Code:6)
				
		End case 
		
	: ($1=Table:C252(->[HEADINGS:84]))
		//accounts
		
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				RELATE MANY SELECTION:C340([ACCOUNTS:32]Report_Heading:1)
				
		End case 
		
		
	: ($1=Table:C252(->[INFORMATION:55]))
	: ($1=Table:C252(->[INVOICES:39]))
		Case of 
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]INVOICES_CODE:18)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([INVOICES:39]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([INVOICES:39]; [CONTACTS:1])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Invoice_Number:17)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Invoice_Number:17)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Invoice_Number:4)
		End case 
		//invoice items
		
	: ($1=Table:C252(->[INVOICES_ALLOCATIONS:162]))
	: ($1=Table:C252(->[INVOICES_ITEMS:161]))
		Case of 
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE ONE SELECTION:C349([INVOICES:39]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE ONE SELECTION:C349([INVOICES:39]; [CONTACTS:1])
				
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Invoice_Number:17)
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE ONE SELECTION:C349([INVOICES_ITEMS:161]; [INVOICES:39])
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Invoice_Number:4)
		End case 
		
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		Case of 
			: ($2=Table:C252(->[JOBS:26]))
				RELATE ONE SELECTION:C349([JOB PERSONNEL:48]; [JOBS:26])
			: ($2=Table:C252(->[JOB_STAGES:47]))
				SELECTION TO ARRAY:C260([JOB PERSONNEL:48]Job_stage_Code:17; $_at_JobStageCodes)
				QUERY WITH ARRAY:C644([JOB_STAGES:47]Stage_Code:2; $_at_JobStageCodes)
				
				
			: ($2=Table:C252(->[CONTACTS:1]))
				SELECTION TO ARRAY:C260([JOB PERSONNEL:48]X_JobPersonnelContactID:13; $_al_ContactIDS)
				SORT ARRAY:C229($_al_ContactIDS; <)
				$_l_BlankRow:=Find in array:C230($_al_ContactIDS; 0)
				If ($_l_BlankRow>0)
					ARRAY LONGINT:C221($_al_ContactIDS; $_l_BlankRow-1)
				End if 
				QUERY WITH ARRAY:C644([CONTACTS:1]x_ID:33; $_al_ContactIDS)
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([JOB PERSONNEL:48]; [PERSONNEL:11])
		End case 
		
		
		
		
		//Contacts
		
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		Case of 
			: ($2=Table:C252(->[JOBS:26]))
				RELATE ONE SELECTION:C349([JOB_STAGES:47]; [JOBS:26])
			: ($2=Table:C252(->[PROJECTS:89]))
				RELATE ONE SELECTION:C349([JOB_STAGES:47]; [JOBS:26])
				RELATE ONE SELECTION:C349([JOBS:26]; [PROJECTS:89])
				
		End case 
		//Jobs
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		Case of 
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([JOBS:26]Job_Type:21)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Order_Type:43)
				
		End case 
		
		
	: ($1=Table:C252(->[JOBS:26]))
		Case of 
			: ($2=Table:C252(->[PROJECTS:89]))
				RELATE ONE SELECTION:C349([JOBS:26]; [PROJECTS:89])
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([JOBS:26]; [COMPANIES:2])
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Job_Code:34)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Job_Code:34)
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Job_Code:23)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Job_Code:23)
		End case 
		
		
	: ($1=Table:C252(->[LAYERS:76]))
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				RELATE MANY SELECTION:C340([ACCOUNTS_LAYERS:156]Layer_Code:1)
				RELATE ONE SELECTION:C349([ACCOUNTS_LAYERS:156]; [ACCOUNTS:32])
			: ($2=Table:C252(->[ACCOUNT_BALANCES:34]))
				RELATE MANY SELECTION:C340([ACCOUNT_BALANCES:34]Layer_Code:5)
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Layer_Code:23)
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
			: ($2=Table:C252(->[INVOICES_ITEMS:161]))
				RELATE MANY SELECTION:C340([INVOICES:39]Layer_Code:38)
				RELATE MANY SELECTION:C340([INVOICES_ITEMS:161]INVOICES_CODE:18)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([INVOICES:39]Layer_Code:38)
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICES:37]Layer_Code:28)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Layer_Code:47)
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS:57]Layer_Code:17)
		End case 
		//Accounts
		//transacitons
		
		//companies(where posting is to layer)
		
	: ($1=Table:C252(->[LICENCE_UPDATES:97]))
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		
	: ($1=Table:C252(->[LIST_ITEMS:95]))
		
	: ($1=Table:C252(->[LOCATIONS:61]))
		Case of 
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				RELATE MANY SELECTION:C340([CURRENT_STOCK:62]Location:8)
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Location:7)
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Location:7)
		End case 
		
		
	: ($1=Table:C252(->[SCRIPTS:80]))
	: ($1=Table:C252(->[MAILSORT_A:77]))
	: ($1=Table:C252(->[MAILSORT_B:78]))
	: ($1=Table:C252(->[MAILSORT_C:79]))
	: ($1=Table:C252(->[MAILSORT_D5:81]))
	: ($1=Table:C252(->[MAILSORT_D6:82]))
	: ($1=Table:C252(->[MAILSORT_MAIL:83]))
		
	: ($1=Table:C252(->[MODULES:63]))
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		Case of 
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENTS:40]Movement_Type:6)
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENTS:40]Movement_Type:6)
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		End case 
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		//see earlier
	: ($1=Table:C252(->[ORDERS:24]))
		//order see earlier
	: ($1=Table:C252(->[PERIODS:33]))
		Case of 
			: ($2=Table:C252(->[ACCOUNT_BALANCES:34]))
				RELATE MANY SELECTION:C340([ACCOUNT_BALANCES:34]Period_Code:4)
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Period_Code:12)
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([INVOICES:39]Period_Code:13)
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICES:37]Period_Code:3)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Order_Period:42)
				
				
		End case 
		
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		Case of 
			: ($2=Table:C252(->[PERSONNEL:11]))
				RELATE MANY SELECTION:C340([PERSONNEL:11]Group_Code:28)
				
		End case 
		//personnel
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		Case of 
			: ($2=Table:C252(->[PERSONNEL_GROUPS:92]))
				RELATE ONE SELECTION:C349([PERSONNEL:11]; [PERSONNEL_GROUPS:92])
		End case 
		
		
		
		//Personel groups
		
	: ($1=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
		
	: ($1=Table:C252(->[PICTURES:85]))
	: ($1=Table:C252(->[POSTAL_CODES:50]))
	: ($1=Table:C252(->[PREFERENCES:116]))
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		Case of 
			: ($2=Table:C252(->[PRICE_TABLE:28]))
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Group_Code:6)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([COMPANIES:2]SO_Price_Group:44)
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Group_Code:6)
				RELATE ONE SELECTION:C349([PRICE_TABLE:28]; [PRODUCTS:9])
				
		End case 
		
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([PRICE_TABLE:28]; [COMPANIES:2])
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([PRICE_TABLE:28]; [PRODUCTS:9])
				
		End case 
		
		//products
		
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		
		Case of 
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([SERVICE_CALLS:20]Problem_Code:14)
				
		End case 
	: ($1=Table:C252(->[PROCESSES_TO_HANDLE:115]))
	: ($1=Table:C252(->[PRODUCTS:9]))
		//see earlier
		
	: ($1=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
	: ($1=Table:C252(->[PROJECTS:89]))
		Case of 
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([JOBS:26]Project_Code:27)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([PROJECTS:89]; [COMPANIES:2])
		End case 
		
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		Case of 
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDs)
				If (Find in array:C230($_al_POItemIDs; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_POItemIDs; 0)
					DELETE FROM ARRAY:C228($_al_POItemIDs; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDs)
				
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDs)
				If (Find in array:C230($_al_POItemIDs; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_POItemIDs; 0)
					DELETE FROM ARRAY:C228($_al_POItemIDs; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDs)
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
			: ($2=Table:C252(->[ORDERS:24]))
				SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
				QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_INVOICE_ITEMS:158])
				RELATE ONE SELECTION:C349([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICES:37])
			: ($2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_INVOICE_ITEMS:158])
				
				
				
				
				
				
				
		End case 
		
		
		//purchase order items
		//stock movements
		//sales orders and items
		//purchase invoices and items
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		Case of 
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS:57])
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDs)
				If (Find in array:C230($_al_POItemIDs; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_POItemIDs; 0)
					DELETE FROM ARRAY:C228($_al_POItemIDs; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDs)
				
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDs)
				If (Find in array:C230($_al_POItemIDs; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_POItemIDs; 0)
					DELETE FROM ARRAY:C228($_al_POItemIDs; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDs)
				
			: ($2=Table:C252(->[ORDERS:24]))
				SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [ORDER_ITEMS:25])
				
				QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)  //just to be sure
				
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [ORDER_ITEMS:25])
				
				QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)  //just to be sure
				
				
				
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_INVOICE_ITEMS:158])
				RELATE ONE SELECTION:C349([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICES:37])
			: ($2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_INVOICE_ITEMS:158])
				
				
				
				
				
				
				
		End case 
		
		
		//purchase orders
		//stock movements
		//sales orders and items
		//purchase invoices and items
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		Case of 
			: ($2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				RELATE MANY SELECTION:C340([PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17)
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS:57])
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([PURCHASE_INVOICES:37]; [COMPANIES:2])
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Purchase_Code:24)
				
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				
		End case 
		//Purchase Invoice items
		//Purchase orders and items
		//companies
	: ($1=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
	: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		Case of 
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE ONE SELECTION:C349([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICES:37])
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PurchaseInvoiceItemID:20)
				RELATE ONE SELECTION:C349([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS:57])
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				RELATE MANY SELECTION:C340([PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICES:37])
				RELATE ONE SELECTION:C349([PURCHASE_INVOICES:37]; [COMPANIES:2])
				
		End case 
		
		
		//Purchase Invoices
		//Purchase orders and items
		//companies
		
	: ($1=Table:C252(->[QUALITY_GROUPS:56]))
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		
		Case of 
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
		End case 
		
		//transaction batches
		//transactions
		//accounts
		
	: ($1=Table:C252(->[REC_JOURNALS_DATES:160]))
	: ($1=Table:C252(->[RESULTS:14]))
		
		Case of 
			: ($2=Table:C252(->[WORKFLOW_CONTROL:51]))
				RELATE MANY SELECTION:C340([WORKFLOW_CONTROL:51]Result_Code:2)
			: ($2=Table:C252(->[DIARY:12]))
				RELATE MANY SELECTION:C340([DIARY:12]Result_Code:11)
		End case 
		
		//workflow
		//diary
	: ($1=Table:C252(->[ROLES:87]))
		//contacts
		
		
		Case of 
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE MANY SELECTION:C340([CONTACTS:1]Role:11)
		End case 
	: ($1=Table:C252(->[SALES_PROJECTION:113]))
	: ($1=Table:C252(->[SALES_ProjectionLinks:114]))
	: ($1=Table:C252(->[SD_Settings:107]))
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		//sales orders
		Case of 
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]x_ServiceCallCODE:61)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[CONTRACTS:17]))
				RELATE ONE SELECTION:C349([SERVICE_CALLS:20]; [CONTRACTS:17])
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE ONE SELECTION:C349([SERVICE_CALLS:20]; [COMPANIES:2])
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE ONE SELECTION:C349([SERVICE_CALLS:20]; [CONTACTS:1])
			: ($2=Table:C252(->[DIARY:12]))
				RELATE MANY SELECTION:C340([DIARY:12]Call_Code:25)
		End case 
		//companies
		//contacts
		//diary
	: ($1=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
	: ($1=Table:C252(->[SMS_Log:124]))
	: ($1=Table:C252(->[SOLUTIONS:23]))
		//service calls
		
		Case of 
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				RELATE MANY SELECTION:C340([SERVICE_CALLS:20]Solution_Code:16)
				
		End case 
	: ($1=Table:C252(->[SOURCES:6]))
		Case of 
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE MANY SELECTION:C340([CONTACTS:1]Source:16)
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([COMPANIES:2]Source:14)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDERS:24]Source:18)
		End case 
		//contacts
		//companies
		//orders
	: ($1=Table:C252(->[STAGES:45]))
		
		Case of 
			: ($2=Table:C252(->[JOB_STAGES:47]))
				RELATE MANY SELECTION:C340([JOB_STAGES:47]Stage_Code:2)
			: ($2=Table:C252(->[JOBS:26]))
				RELATE MANY SELECTION:C340([JOBS:26]Stage_Code:18)
			: ($2=Table:C252(->[JOB PERSONNEL:48]))
				RELATE MANY SELECTION:C340([JOB PERSONNEL:48]Stage_Code:2)
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Job_Stage:35)
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Job_Stage:35)
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				
		End case 
	: ($1=Table:C252(->[STATUS:4]))
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		Case of 
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockID)
				If (Find in array:C230($_al_CurrentStockID; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_CurrentStockID; 0)
					DELETE FROM ARRAY:C228($_al_CurrentStockID; $_l_BlankRow)
				End if 
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockID)
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_OrderItemNumbers)
				If (Find in array:C230($_al_OrderItemNumbers; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_OrderItemNumbers; 0)
					DELETE FROM ARRAY:C228($_al_OrderItemNumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_OrderItemNumbers)
				DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
				If (Find in array:C230($_at_PONumbers; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_PONumbers; 0)
					DELETE FROM ARRAY:C228($_at_PONumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
				
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_OrderItemNumbers)
				If (Find in array:C230($_al_OrderItemNumbers; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_OrderItemNumbers; 0)
					DELETE FROM ARRAY:C228($_al_OrderItemNumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_OrderItemNumbers)
				
				//RELATE ONE SELECTION([STOCK ITEMS];[PURCHASE ORDERS_ITEMS])
			: ($2=Table:C252(->[ORDERS:24]))
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OrderItemNumbers)
				If (Find in array:C230($_al_OrderItemNumbers; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_OrderItemNumbers; 0)
					DELETE FROM ARRAY:C228($_al_OrderItemNumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
				
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_OrderItemNumbers)
				If (Find in array:C230($_al_OrderItemNumbers; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_OrderItemNumbers; 0)
					DELETE FROM ARRAY:C228($_al_OrderItemNumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
				
				//RELATE ONE SELECTION([STOCK ITEMS];[ORDER ITEMS])
				
		End case 
		//current stock
		//purchase orders and items
		//sales orders and items
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		
		Case of 
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				SELECTION TO ARRAY:C260([STOCK_LEVELS:58]UniqueConstruct:11; $_at_UniqueValues)
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]UniqueConstruct:14; $_at_UniqueValues)
		End case 
		//current stock
		//stock movements
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		Case of 
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_LayerCodes; [STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_AnalysisCodes; [STOCK_MOVEMENTS:40]Currency_Code:10; $_at_CurrencyCodes)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes)
				SORT ARRAY:C229($_at_SerialNumbers; <)
				$_l_BlankRow:=Find in array:C230($_at_SerialNumbers; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_SerialNumbers; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_SerialNumbers)>0)
					QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Serial_Number:2; $_at_SerialNumbers)
				End if 
				SORT ARRAY:C229($_at_LayerCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_LayerCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_LayerCodes; $_l_BlankRow-1)
				End if 
				
				If (Size of array:C274($_at_LayerCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Layer_Code:12; $_at_LayerCodes)
				End if 
				SORT ARRAY:C229($_at_AnalysisCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_AnalysisCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_AnalysisCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_AnalysisCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Analysis_Code:10; $_at_AnalysisCodes)
				End if 
				SORT ARRAY:C229($_at_CurrencyCodes; <)
				$_l_BlankRow:=Find in array:C230($_at_CurrencyCodes; "")
				If ($_l_BlankRow>0)
					ARRAY TEXT:C222($_at_CurrencyCodes; $_l_BlankRow-1)
				End if 
				If (Size of array:C274($_at_CurrencyCodes)>0)
					QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Currency_Code:11; $_at_CurrencyCodes)
				End if 
				
			: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_PONumbers)
				If (Find in array:C230($_at_PONumbers; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_PONumbers; "")
					DELETE FROM ARRAY:C228($_at_PONumbers; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
			: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemIDs)
				If (Find in array:C230($_al_POItemIDs; 0)>0)
					$_l_BlankRow:=Find in array:C230($_al_POItemIDs; 0)
					DELETE FROM ARRAY:C228($_al_POItemIDs; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemIDs)
				
			: ($2=Table:C252(->[ORDERS:24]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [ORDER_ITEMS:25])
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [ORDER_ITEMS:25])
				
		End case 
		//stock items
		//current stock
		//purchase orders and items
		//sales orders and items
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		
		Case of 
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				RELATE MANY SELECTION:C340([CURRENT_STOCK:62]Stock_Type:3)
			: ($2=Table:C252(->[STOCK_LEVELS:58]))
				
				RELATE MANY SELECTION:C340([STOCK_LEVELS:58]Stock_Type:2)
				
				
		End case 
		
	: ($1=Table:C252(->[Stock_Thread:143]))
	: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
		
		Case of 
			: ($2=Table:C252(->[PRODUCTS:9]))
				RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [PRODUCTS:9])
				
		End case 
	: ($1=Table:C252(->[SYS_LISTS:167]))
	: ($1=Table:C252(->[TAX_CODES:35]))
		Case of 
			: ($2=Table:C252(->[COUNTRIES:73]))
				RELATE MANY:C262([COUNTRIES:73]Default_TAX:4)
				
		End case 
		//areas
		//countries
	: ($1=Table:C252(->[TERMINOLOGY:75]))
	: ($1=Table:C252(->[TIME_BUDGETS:49]))
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31)
				DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; $_at_DebitAccounts)
				If (Find in array:C230($_at_DebitAccounts; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_DebitAccounts; "")
					DELETE FROM ARRAY:C228($_at_DebitAccounts; $_l_BlankRow)
				End if 
				DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; $_at_CreditAccounts)
				If (Find in array:C230($_at_CreditAccounts; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_CreditAccounts; "")
					DELETE FROM ARRAY:C228($_at_CreditAccounts; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_DebitAccounts)
				CREATE SET:C116([ACCOUNTS:32]; "$set1")
				QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_CreditAccounts)
				CREATE SET:C116([ACCOUNTS:32]; "$set2")
				UNION:C120("$Set1"; "$Set2"; "$set1")
				USE SET:C118("$Set1")
				CLEAR SET:C117("$Set1")
				CLEAR SET:C117("$Set2")
			: ($2=Table:C252(->[INVOICES:39]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [INVOICES:39])
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [PURCHASE_INVOICES:37])
				
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Batch_Number:7)
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				//???
				
		End case 
		
		
		//accounts
		//invoices
		//stock movements
		//purchase invoices
		//transacitons
	: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				DISTINCT VALUES:C339([TRANSACTION_TYPES:31]Debit_Account:4; $_at_DebitAccounts)
				If (Find in array:C230($_at_DebitAccounts; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_DebitAccounts; "")
					DELETE FROM ARRAY:C228($_at_DebitAccounts; $_l_BlankRow)
				End if 
				DISTINCT VALUES:C339([TRANSACTION_TYPES:31]Credit_Account:5; $_at_CreditAccounts)
				If (Find in array:C230($_at_CreditAccounts; "")>0)
					$_l_BlankRow:=Find in array:C230($_at_CreditAccounts; "")
					DELETE FROM ARRAY:C228($_at_CreditAccounts; $_l_BlankRow)
				End if 
				QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_DebitAccounts)
				CREATE SET:C116([ACCOUNTS:32]; "$set1")
				QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_CreditAccounts)
				CREATE SET:C116([ACCOUNTS:32]; "$set2")
				UNION:C120("$Set1"; "$Set2"; "$set1")
				USE SET:C118("$Set1")
				CLEAR SET:C117("$Set1")
				CLEAR SET:C117("$Set2")
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE MANY SELECTION:C340([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
				RELATE ONE SELECTION:C349([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				
				RELATE MANY SELECTION:C340([TRANSACTIONS:29]Transaction_Type_Code:1)
				
		End case 
		//accounts
	: ($1=Table:C252(->[TRANS_MULTI:128]))
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		Case of 
			: ($2=Table:C252(->[ACCOUNTS:32]))
				RELATE ONE SELECTION:C349([TRANSACTIONS:29]; [ACCOUNTS:32])
			: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))
				RELATE ONE SELECTION:C349([TRANSACTIONS:29]; [TRANSACTION_BATCHES:30])
			: ($2=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				RELATE ONE SELECTION:C349([TRANSACTIONS:29]; [TRANSACTION_BATCH_ITEMS:155])
				
		End case 
		//accounts
		//transaction batches
	: ($1=Table:C252(->[TYPES:5]))  //
		
		Case of 
			: ($2=Table:C252(->[COMPANIES:2]))
				RELATE MANY SELECTION:C340([COMPANIES:2]Company_Type:13)
			: ($2=Table:C252(->[CONTACTS:1]))
				RELATE MANY SELECTION:C340([CONTACTS:1]Contact_Type:15)
				
		End case 
		
		
		//orders
		
	: ($1=Table:C252(->[USER_SETS:105]))
		//not shown
	: ($1=Table:C252(->[WEB_ACCESS:130]))
		
		//not shown
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		
		Case of 
			: ($2=Table:C252(->[ACTIONS:13]))
				RELATE ONE SELECTION:C349([WORKFLOW_CONTROL:51]; [ACTIONS:13])
			: ($2=Table:C252(->[RESULTS:14]))
				RELATE ONE SELECTION:C349([WORKFLOW_CONTROL:51]; [RESULTS:14])
				
				
				
				//actions
				//results
		End case 
		
End case 
Case of 
	: ($2=Table:C252(->[COMPANIES:2]))
		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
	: ($2=Table:C252(->[CONTACTS:1]))
		QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
	: ($2=Table:C252(->[PERSONNEL:11]))
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
	: ($2=Table:C252(->[DIARY:12]))
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
	: ($2=Table:C252(->[CUSTOM_FIELDS:98]))
		QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8=0)
		
		
End case 
ERR_MethodTrackerReturn("DB_GetRelatedRecords"; $_t_oldMethodName)
