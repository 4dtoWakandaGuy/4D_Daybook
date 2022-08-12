If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oListboxOutputArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2013 20:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(PRD_abo_Expanded;0)
	ARRAY DATE:C224($_ad_StockMovementDates; 0)
	//ARRAY DATE(PRD_ad_STKHistoryDates;0)
	ARRAY LONGINT:C221($_al_MovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_MovementItemNumber; 0)
	ARRAY LONGINT:C221($_al_MovementPItemNumber; 0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(PRD_al_STK_HistoryItem;0)
	//ARRAY LONGINT(PRD_al_STKHistoryOrderItem;0)
	//ARRAY PICTURE(PRD_aPic_Expanded;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	ARRAY REAL:C219($_ar_MovementItemCost; 0)
	ARRAY REAL:C219($_ar_MovementItemQuantities; 0)
	//ARRAY REAL(PRD_ar_STKHistoryCosts;0)
	//ARRAY REAL(PRD_ar_STKHistoryQuantities;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_MoveItemStockOrderCodes; 0)
	ARRAY TEXT:C222($_at_MovementItemCodes; 0)
	ARRAY TEXT:C222($_at_MovementItemCoTo; 0)
	ARRAY TEXT:C222($_at_MovementItemLocation; 0)
	ARRAY TEXT:C222($_at_MovementItemPOrder; 0)
	ARRAY TEXT:C222($_at_MovementTypeNames; 0)
	ARRAY TEXT:C222($_at_MovementTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	ARRAY TEXT:C222($_at_StockMovementCoFrom; 0)
	ARRAY TEXT:C222($_at_StockMovementTypeNumber; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	//ARRAY TEXT(PRD_at_STKHistoryCodes;0)
	//ARRAY TEXT(PRD_at_STKHistoryProducts;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypeNames;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypeNos;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypes;0)
	//ARRAY TEXT(PRD_at_StockHistoryCustomer;0)
	//ARRAY TEXT(PRD_at_StockHistoryLocation;0)
	//ARRAY TEXT(PRD_at_StockHistoryOrders;0)
	C_BOOLEAN:C305($_bo_CheckedAccountCode; DB_bo_AutorelationsTemp; STK_bo_HistoryArraysDeclared; STK_bo_StockItemsIncluded)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Column; $_l_ColumnIndex; $_l_ColumnWIdth; $_l_event; $_l_FieldNumber; $_l_IgnoreColumns; $_l_Index; $_l_ItemCodeIndex; $_l_LayoutColumnNumber; $_l_MovementsIndex; $_l_MovementTypeRow)
	C_LONGINT:C283($_l_NewRow; $_l_offset; $_l_position; $_l_RecordsFound; $_l_Row; $_l_StockItemID; $_l_TableNumber; $_l_TableRow; DB_l_CurrentDisplayedForm)
	C_PICTURE:C286($_pic_Expanded)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfColumnFormulas; $_ptr_ArrayofColumnWIdths; $_Ptr_ArrayPointer; $_ptr_ArrayReferences; $_ptr_ListBoxSetup; $_ptr_ThisArray)
	C_TEXT:C284($_t_AccountCode; $_t_ColumVarName; $_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName; $_t_DeleteRecordName; $_t_GroupCode; $_t_MovementTypeName; $_t_MovementTypeNumber; $_t_NewRecordName; $_t_oldMethodName; $_t_RecordsMenuName)
	C_TEXT:C284($_t_StockMovementType; $_t_VariableName; $_t_ViewRecordName; DB_t_CUrrentMenuReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oListboxOutputArrays"; Form event code:C388)








$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header Click:K2:40)  //Column sort
		
		
		//get sort column and store it
		$_l_TableRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_TableRow>0)  //it shoud be!
			
			
		End if 
	: ($_l_event=On Double Clicked:K2:5)
		
		
		//edit record.
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
		LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		Case of 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
				//here we want to do something special. The on screen balance is the sum of balances. What i want to show is the list of balances-as we do on the ACCOUNTS screen. But with the currency and a converted value
				//from their the user can double click to open a single balance.
				//so lets call this balance INTERSTERCIAL
				//TRACE
				$_Ptr_ArrayPointer:=$_aptr_ColumnVariables{$_l_Column}
				RESOLVE POINTER:C394($_Ptr_ArrayPointer; $_t_ColumVarName; $_l_TableNumber; $_l_FieldNumber)
				$_l_offset:=1
				$_l_position:=Position:C15("Totals"; $_t_ColumVarName)
				If ($_l_position>0)
					$_l_offset:=2
				Else 
					$_l_position:=Position:C15("Codes"; $_t_ColumVarName)
					If ($_l_position>0)
						$_l_offset:=0
					End if 
				End if 
				$_Ptr_ArrayPointer:=$_aptr_ColumnVariables{$_l_Column-$_l_offset}
				$_t_AccountCode:=$_Ptr_ArrayPointer->{$_l_Row}
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordsFound)
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_t_AccountCode)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_RecordsFound=1)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_t_AccountCode)
					DB_OutEditRecord(Table:C252(->[ACCOUNTS:32]); DB_l_CurrentDisplayedForm)
				Else 
					QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_AccountCode)
					If (Records in selection:C76([HEADINGS:84])=1)
						DB_OutEditRecord(Table:C252(->[HEADINGS:84]))
						
					End if 
				End if 
				
				//this might be an account code or a heading (group) code
				
				
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
				//TRACE
				DB_OutEditRecord(DB_l_CurrentDisplayedForm)
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				If ($_l_Row>0)
					If (STK_bo_HistoryArraysDeclared)
						If ($_l_Row<Size of array:C274(PRD_al_STK_HistoryItem))
							$_l_StockItemID:=PRD_al_STK_HistoryItem{$_l_Row}
							If ($_l_StockItemID>0)
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID)
								DB_OutEditRecord(DB_l_CurrentDisplayedForm)
								USE NAMED SELECTION:C332("$Temp")
								
							End if 
						End if 
					End if 
				End if 
		End case 
		
		
		
	: ($_l_event=On Clicked:K2:4)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		Case of 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
				//we are looking at a list of accounts enable disable the correct menu items
				ARRAY TEXT:C222($_at_ColumnNames; 0)
				ARRAY TEXT:C222($_at_HeaderNames; 0)
				ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
				ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
				ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
				ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
				LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
				LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				$_bo_CheckedAccountCode:=False:C215
				$_t_AccountCode:=""
				$_t_GroupCode:=""
				$_t_RecordsMenuName:=Get localized string:C991("Menu_Records")
				//USE SET("ListboxSet0")
				If ($_l_Row>0)
					
					For ($_l_Index; Size of array:C274($_aptr_ColumnVariables); 1; -1)
						RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						If (Position:C15("Group"; $_t_VariableName)>0)
							If (Position:C15("Codes"; $_t_VariableName)>0)
								$_ptr_ThisArray:=$_aptr_ColumnVariables{$_l_Index}
								If (Not:C34($_bo_CheckedAccountCode))
									$_t_AccountCode:=$_ptr_ThisArray->{$_l_Row}
									$_bo_CheckedAccountCode:=True:C214
								Else 
									$_t_GroupCode:=$_ptr_ThisArray->{$_l_Row}
								End if 
								If ($_t_AccountCode#"") | ($_t_GroupCode#"")
									$_l_Index:=1
								End if 
							End if 
						End if 
					End for 
					If ($_t_AccountCode#"")
						$_t_ViewRecordName:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Account")
						$_t_NewRecordName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Account")
						$_t_DeleteRecordName:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Account")
						DB_MenuAction($_t_RecordsMenuName; $_t_ViewRecordName; 2; $_t_ViewRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						//DB_MenuAction ($_t_RecordsMenuName;$_t_NewRecordName;2;$_t_NewRecordName;Current process;False;DB_t_CUrrentMenuReference)
						DB_MenuAction($_t_RecordsMenuName; $_t_DeleteRecordName; 2; $_t_DeleteRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						$_t_ViewRecordName:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Heading")
						$_t_NewRecordName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Heading")
						$_t_DeleteRecordName:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Heading")
						
						DB_MenuAction($_t_RecordsMenuName; $_t_ViewRecordName; 3; $_t_ViewRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						//DB_MenuAction ($_t_RecordsMenuName;$_t_NewRecordName;3;$_t_NewRecordName;Current process;False;DB_t_CUrrentMenuReference)
						DB_MenuAction($_t_RecordsMenuName; $_t_DeleteRecordName; 3; $_t_DeleteRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						
					Else 
						$_t_ViewRecordName:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Account")
						$_t_NewRecordName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Account")
						$_t_DeleteRecordName:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Account")
						DB_MenuAction($_t_RecordsMenuName; $_t_ViewRecordName; 3; $_t_ViewRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						//DB_MenuAction ($_t_RecordsMenuName;$_t_NewRecordName;3;$_t_NewRecordName;Current process;False;DB_t_CUrrentMenuReference)
						DB_MenuAction($_t_RecordsMenuName; $_t_DeleteRecordName; 3; $_t_DeleteRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						$_t_ViewRecordName:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Heading")
						$_t_NewRecordName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Heading")
						$_t_DeleteRecordName:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Heading")
						DB_MenuAction($_t_RecordsMenuName; $_t_ViewRecordName; 2; $_t_ViewRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
						//DB_MenuAction ($_t_RecordsMenuName;$_t_NewRecordName;2;$_t_NewRecordName;Current process;False;DB_t_CUrrentMenuReference)
						DB_MenuAction($_t_RecordsMenuName; $_t_DeleteRecordName; 2; $_t_DeleteRecordName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
					End if 
				End if 
			: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				ARRAY TEXT:C222($_at_ColumnNames; 0)
				ARRAY TEXT:C222($_at_HeaderNames; 0)
				ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
				ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
				ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
				ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
				LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
				LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				If ($_l_Row>0) & ($_l_Column=1)
					If (PRD_at_STKHistoryProducts{$_l_Row}#"")
						Case of 
							: (PRD_abo_Expanded{$_l_Row}=False:C215)
								//expand the lines
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=PRD_at_STKHistoryProducts{$_l_Row})
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementItemCodes; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_MovementItemQuantities; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13; $_ar_MovementItemCost; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; $_at_MovementItemCoTo; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_MovementItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_MovementPItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_MovementItemPOrder; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_MovementItemLocation; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3; $_at_MoveItemStockOrderCodes)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementItemCodes)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes; [STOCK_MOVEMENTS:40]Movement_Date:5; $_ad_StockMovementDates; [STOCK_MOVEMENTS:40]Movement_Type:6; $_at_StockMovementTypes; [STOCK_MOVEMENTS:40]Type_Number:4; $_at_StockMovementTypeNumber; [STOCK_MOVEMENTS:40]Company_From:2; $_at_StockMovementCoFrom)
								
								
								If (Not:C34(STK_bo_StockItemsIncluded))
									ARRAY TEXT:C222(PRD_at_STKHistoryTypes; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_STKHistoryTypeNames; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_STKHistoryTypeNos; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY DATE:C224(PRD_ad_STKHistoryDates; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_STKHistoryCodes; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY REAL:C219(PRD_ar_STKHistoryQuantities; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY REAL:C219(PRD_ar_STKHistoryCosts; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_StockHistoryCustomer; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_StockHistoryOrders; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY LONGINT:C221(PRD_al_STKHistoryOrderItem; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY TEXT:C222(PRD_at_StockHistoryLocation; Size of array:C274(PRD_at_STKHistoryProducts))
									ARRAY LONGINT:C221(PRD_al_STK_HistoryItem; Size of array:C274(PRD_at_STKHistoryProducts))
									STK_bo_HistoryArraysDeclared:=True:C214
									LB_SetupListbox(->DB_lb_OutputArrays; "oPRD"; "PRD_L"; 6; ->PRD_at_STKHistoryTypes; ->PRD_at_STKHistoryTypeNames; ->PRD_at_STKHistoryTypeNos; ->PRD_ad_STKHistoryDates; ->PRD_at_STKHistoryCodes; ->PRD_ar_STKHistoryQuantities; ->PRD_ar_STKHistoryCosts; ->PRD_at_StockHistoryCustomer; ->PRD_at_StockHistoryOrders; ->PRD_al_STKHistoryOrderItem; ->PRD_at_StockHistoryLocation; ->PRD_al_STK_HistoryItem)
									
									
									
									LB_SetColumnHeaders(->DB_lb_OutputArrays; "PRD_L"; 6; "Type"; "Name"; "Number"; "Date"; "Movement Code"; "Quantity"; "Costs"; "Customer/Supplier"; "Order No"; "Order Item"; "Location")
									LB_SetColumnWidths(->DB_lb_OutputArrays; "oPRD"; 6; 40; 140; 80; 40; 40; 60; 60; 120; 80; 80; 80)
									LB_StyleSettings(->DB_lb_OutputArrays; "Black"; 9; "PRD_S55"; ->[STOCK_MOVEMENTS:40])
									
									STK_bo_StockItemsIncluded:=True:C214
								End if 
								SORT ARRAY:C229($_ad_StockMovementDates; $_at_StockMovementCodes; $_at_StockMovementTypes; $_at_StockMovementTypeNumber)
								PRD_abo_Expanded{$_l_Row}:=True:C214
								//GET PICTURE FROM LIBRARY(410; $_pic_Expanded)  //410 for expanded
								$_pic_Expanded:=Get_Picture(410)
								
								PRD_aPic_Expanded{$_l_Row}:=$_pic_Expanded
								LISTBOX INSERT ROWS:C913(DB_lb_OutputArrays; $_l_Row+1)
								$_l_NewRow:=$_l_Row+1
								
								ARRAY TEXT:C222($_at_MovementTypes; 0)
								ARRAY TEXT:C222($_at_MovementTypeNames; 0)
								For ($_l_MovementsIndex; 1; Size of array:C274($_ad_StockMovementDates))
									$_t_StockMovementType:=$_at_StockMovementTypes{$_l_MovementsIndex}
									$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; $_at_StockMovementTypes{$_l_MovementsIndex})
									If ($_l_MovementTypeRow<0)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_at_StockMovementTypes{$_l_MovementsIndex})
										APPEND TO ARRAY:C911($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
										APPEND TO ARRAY:C911($_at_MovementTypeNames; [MOVEMENT_TYPES:60]Type_Name:2)
										$_l_MovementTypeRow:=Size of array:C274($_at_MovementTypeNames)
									End if 
									$_t_MovementTypeName:=$_at_MovementTypeNames{$_l_MovementTypeRow}
									$_t_MovementTypeNumber:=$_at_StockMovementTypeNumber{$_l_MovementsIndex}
									$_d_Date:=$_ad_StockMovementDates{$_l_MovementsIndex}
									
									For ($_l_ItemCodeIndex; 1; Size of array:C274($_at_MovementItemCodes))
										If ($_at_MovementItemCodes{$_l_ItemCodeIndex}=$_at_StockMovementCodes{$_l_MovementsIndex})
											LISTBOX INSERT ROWS:C913(DB_lb_OutputArrays; $_l_NewRow+1)
											$_l_NewRow:=$_l_NewRow+1
											PRD_al_STK_HistoryItem{$_l_NewRow}:=$_al_MovementItemIDS{$_l_ItemCodeIndex}
											PRD_at_STKHistoryTypes{$_l_NewRow}:=$_t_StockMovementType
											PRD_at_STKHistoryTypeNames{$_l_NewRow}:=$_t_MovementTypeName
											PRD_at_STKHistoryTypeNos{$_l_NewRow}:=$_t_MovementTypeNumber
											PRD_ad_STKHistoryDates{$_l_NewRow}:=$_d_Date
											PRD_at_STKHistoryCodes{$_l_NewRow}:=$_at_MovementItemCodes{$_l_ItemCodeIndex}
											PRD_ar_STKHistoryQuantities{$_l_NewRow}:=$_ar_MovementItemQuantities{$_l_ItemCodeIndex}
											PRD_ar_STKHistoryCosts{$_l_NewRow}:=$_ar_MovementItemCost{$_l_ItemCodeIndex}
											PRD_at_StockHistoryCustomer{$_l_NewRow}:=$_at_MovementItemCoTo{$_l_ItemCodeIndex}
											If (PRD_at_StockHistoryCustomer{$_l_NewRow}="") & (($_at_StockMovementCoFrom{$_l_MovementTypeRow}#"") | ($_at_MovementItemPOrder{$_l_ItemCodeIndex}#""))
												If ($_at_StockMovementCoFrom{$_l_MovementTypeRow}#"")
													PRD_at_StockHistoryCustomer{$_l_NewRow}:=$_at_StockMovementCoFrom{$_l_MovementTypeRow}
												Else 
													QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Print_Comments:18=$_at_MovementItemPOrder{$_l_ItemCodeIndex})
													
													PRD_at_StockHistoryCustomer{$_l_NewRow}:=[PURCHASE_ORDERS:57]Company_Code:1
													
													
												End if 
											End if 
											
											If ($_at_MoveItemStockOrderCodes{$_l_ItemCodeIndex}#"")
												PRD_at_StockHistoryOrders{$_l_NewRow}:=$_at_MoveItemStockOrderCodes{$_l_ItemCodeIndex}
												PRD_al_STKHistoryOrderItem{$_l_NewRow}:=$_al_MovementItemNumber{$_l_ItemCodeIndex}
											Else 
												PRD_at_StockHistoryOrders{$_l_NewRow}:=$_at_MovementItemPOrder{$_l_ItemCodeIndex}
												PRD_al_STKHistoryOrderItem{$_l_NewRow}:=$_al_MovementPItemNumber{$_l_ItemCodeIndex}
											End if 
											PRD_at_StockHistoryLocation{$_l_NewRow}:=$_at_MovementItemLocation{$_l_ItemCodeIndex}
											//ARRAY REAL(PRD_at_StockHistoryOrders;Size of array(PRD_at_STKHistoryProducts))
											//ARRAY REAL(PRD_al_STKHistoryOrderItem;Size of array(PRD_at_STKHistoryProducts))
											//ARRAY REAL(PRD_at_StockHistoryLocation;Size of array(PRD_at_STKHistoryProducts))
											
										End if 
									End for 
								End for 
								
							Else 
								//expanded so collapse
						End case 
					End if 
					
				End if 
		End case 
	: ($_l_event=On Column Resize:K2:31)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		
		LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TableRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_TableRow>0)  //it shoud be!
			
			
			READ WRITE:C146([LIST_LAYOUTS:96])
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TableRow}
			LBi_Resize($_ptr_ListBoxSetup)
			$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_t_CurrentUserDefinitionsName:=$_ptr_ArrayReferences->{7}
			LBi_ListFindDup($_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName)
			$_ptr_ArrayofColumnWIdths:=$_ptr_ListBoxSetup->{13}
			
			$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
			$_ptr_ArrayOfColumnFormulas:=$_ptr_ListBoxSetup->{6}
			//$s:=Size of array($_ptr_ArrayofColumnWIdths->)
			//The column number displayed may not match the sort order on the list layouts..
			
			FIRST RECORD:C50([LIST_LAYOUTS:96])
			COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$TempSelection")
			For ($_l_ColumnIndex; 1; Size of array:C274($_ptr_ArrayofColumnWIdths->))
				If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_ColumnIndex})=0) & ($_ptr_ArrayofColumnWIdths->{$_l_ColumnIndex}#0)
					$_l_IgnoreColumns:=0
					$_l_Column:=$_l_ColumnIndex
					For ($_l_Index; 1; $_l_Column)
						If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_Index})#0)
							$_l_IgnoreColumns:=$_l_IgnoreColumns+1
						End if 
						If ($_ptr_ArrayofColumnWIdths->{$_l_Index}=0)  // Zero width columns are invisible so dont get counted
							
							
							//$_l_IgnoreColumns:=$_l_IgnoreColumns-1
						End if 
					End for 
					$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Column})
					$_l_LayoutColumnNumber:=$_l_Column-$_l_IgnoreColumns
					USE NAMED SELECTION:C332("$TempSelection")
					QUERY SELECTION:C341([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7=$_l_LayoutColumnNumber)
					If ([LIST_LAYOUTS:96]Width:5#$_ptr_ArrayofColumnWIdths->{$_l_Column})
						[LIST_LAYOUTS:96]Width:5:=$_ptr_ArrayofColumnWIdths->{$_l_Column}
						SAVE RECORD:C53([LIST_LAYOUTS:96])
					End if 
				End if 
			End for 
			UNLOAD RECORD:C212([LIST_LAYOUTS:96])
			READ ONLY:C145([LIST_LAYOUTS:96])
			
			//And write that back to the data
			
		End if 
		//And write that back to the data
		
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oListboxOutputArrays"; $_t_oldMethodName)
