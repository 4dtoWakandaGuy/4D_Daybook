If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oListboxOutputArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/08/2012 08:07
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
	ARRAY DATE:C224($_ad_SMDates; 0)
	//ARRAY DATE(PRD_ad_STKHistoryDates;0)
	ARRAY LONGINT:C221($_al_SMIIDS; 0)
	ARRAY LONGINT:C221($_al_SMIMoveItemNo; 0)
	ARRAY LONGINT:C221($_al_SMIPurchItemNumber; 0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(PRD_al_STK_HistoryItem;0)
	//ARRAY LONGINT(PRD_al_STKHistoryOrderItem;0)
	//ARRAY PICTURE(PRD_aPic_Expanded;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	ARRAY REAL:C219($_ar_SMIMovementCosts; 0)
	ARRAY REAL:C219($_ar_SMIMovementQuanties; 0)
	//ARRAY REAL(PRD_ar_STKHistoryCosts;0)
	//ARRAY REAL(PRD_ar_STKHistoryQuantities;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_MovementTypeCodes; 0)
	ARRAY TEXT:C222($_at_MovementTypeNames; 0)
	ARRAY TEXT:C222($_at_SMCodes; 0)
	ARRAY TEXT:C222($_at_SMICompaniesTo; 0)
	ARRAY TEXT:C222($_at_SMILocations; 0)
	ARRAY TEXT:C222($_at_SMIMovementCodes; 0)
	ARRAY TEXT:C222($_at_SMIOrderCodes; 0)
	ARRAY TEXT:C222($_at_SMIPurchOrderCode; 0)
	ARRAY TEXT:C222($_at_SMTypeNos; 0)
	ARRAY TEXT:C222($_at_SMTypes; 0)
	//ARRAY TEXT(PRD_at_STKHistoryCodes;0)
	//ARRAY TEXT(PRD_at_STKHistoryProducts;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypeNames;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypeNos;0)
	//ARRAY TEXT(PRD_at_STKHistoryTypes;0)
	//ARRAY TEXT(PRD_at_StockHistoryCustomer;0)
	//ARRAY TEXT(PRD_at_StockHistoryLocation;0)
	//ARRAY TEXT(PRD_at_StockHistoryOrders;0)
	C_BOOLEAN:C305($_bo_CheckedAccountCode; DB_bo_AutorelationsTemp; STK_bo_StockItemsIncluded)
	C_DATE:C307($_d_StockMovementDate)
	C_LONGINT:C283($_l_Column; $_l_ColumnIndex; $_l_ColumnsIndex; $_l_ColumnWIdth; $_l_Event; $_l_FieldNumber; $_l_IgnoreColumns; $_l_InsertIndex; $_l_LayoutColumnNumber; $_l_NewRow; $_l_NumberofColumns)
	C_LONGINT:C283($_l_Row; $_l_StockMovementIndex; $_l_TableNumber; $_l_TableRow; DB_l_CurrentDisplayedForm)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_ptr_Formulas; $_ptr_ListboxSetup; $_ptr_ThisArray)
	C_TEXT:C284($_t_AccountCode; $_t_CurrentDefinitionsName; $_t_DeleteRecordName; $_t_GroupCode; $_t_MovementType; $_t_NewRecordName; $_t_oldMethodName; $_t_RecordsMenuName; $_t_StockMovementNo; $_t_TypeName; $_t_VariableName)
	C_TEXT:C284($_t_ViewRecordName; $LAY_t_CurrentUserDefs; DB_t_CUrrentMenuReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oListboxOutputArrays"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Header Click:K2:40)  //Column sort
		//get sort column and store it
		$_l_TableRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_TableRow>0)  //it shoud be!
		End if 
	: ($_l_Event=On Double Clicked:K2:5)
		//edit record.
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		DB_OutEditRecord(DB_l_CurrentDisplayedForm)
		
		
	: ($_l_Event=On Clicked:K2:4)
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
					
					For ($_l_ColumnsIndex; Size of array:C274($_aptr_ColumnVariables); 1; -1)
						RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ColumnsIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						If (Position:C15("Group"; $_t_VariableName)>0)
							If (Position:C15("Codes"; $_t_VariableName)>0)
								$_ptr_ThisArray:=$_aptr_ColumnVariables{$_l_ColumnsIndex}
								If (Not:C34($_bo_CheckedAccountCode))
									$_t_AccountCode:=$_ptr_ThisArray->{$_l_Row}
									$_bo_CheckedAccountCode:=True:C214
								Else 
									$_t_GroupCode:=$_ptr_ThisArray->{$_l_Row}
								End if 
								If ($_t_AccountCode#"") | ($_t_GroupCode#"")
									$_l_ColumnsIndex:=1
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
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_SMIMovementCodes; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_SMIMovementQuanties; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13; $_ar_SMIMovementCosts; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; $_at_SMICompaniesTo; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIMoveItemNo; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_SMIPurchItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_SMIPurchOrderCode; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocations; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SMIIDS; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3; $_at_SMIOrderCodes)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_SMIMovementCodes)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_SMCodes; [STOCK_MOVEMENTS:40]Movement_Date:5; $_ad_SMDates; [STOCK_MOVEMENTS:40]Movement_Type:6; $_at_SMTypes; [STOCK_MOVEMENTS:40]Type_Number:4; $_at_SMTypeNos)
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
									LB_SetupListbox(->DB_lb_OutputArrays; "oPRD"; "PRD_L"; 6; ->PRD_at_STKHistoryTypes; ->PRD_at_STKHistoryTypeNames; ->PRD_at_STKHistoryTypeNos; ->PRD_ad_STKHistoryDates; ->PRD_at_STKHistoryCodes; ->PRD_ar_STKHistoryQuantities; ->PRD_ar_STKHistoryCosts; ->PRD_at_StockHistoryCustomer; ->PRD_at_StockHistoryOrders; ->PRD_al_STKHistoryOrderItem; ->PRD_at_StockHistoryLocation; ->PRD_al_STK_HistoryItem)
									
									
									LB_SetColumnHeaders(->DB_lb_OutputArrays; "PRD_L"; 6; "Type"; "Name"; "Number"; "Date"; "Movement Code"; "Quantity"; "Costs"; "Customer/Supplier"; "Order No"; "Order Item"; "Location")
									LB_SetColumnWidths(->DB_lb_OutputArrays; "oPRD"; 6; 40; 140; 80; 40; 40; 60; 60; 120; 80; 80; 80)
									LB_StyleSettings(->DB_lb_OutputArrays; "Black"; 9; "PRD_S55"; ->[STOCK_MOVEMENTS:40])
									
									STK_bo_StockItemsIncluded:=True:C214
								End if 
								SORT ARRAY:C229($_ad_SMDates; $_at_SMCodes; $_at_SMTypes; $_at_SMTypeNos)
								PRD_abo_Expanded{$_l_Row}:=True:C214
								//GET PICTURE FROM LIBRARY(410; $_pic_Picture)  //410 for expanded
								$_pic_Picture:=Get_Picture(410)
								PRD_aPic_Expanded{$_l_Row}:=$_pic_Picture
								LISTBOX INSERT ROWS:C913(DB_lb_OutputArrays; $_l_Row+1)
								$_l_NewRow:=$_l_Row+1
								
								ARRAY TEXT:C222($_at_MovementTypeCodes; 0)
								ARRAY TEXT:C222($_at_MovementTypeNames; 0)
								For ($_l_InsertIndex; 1; Size of array:C274($_ad_SMDates))
									$_t_MovementType:=$_at_SMTypes{$_l_InsertIndex}
									$_l_TableRow:=Find in array:C230($_at_MovementTypeCodes; $_at_SMTypes{$_l_InsertIndex})
									If ($_l_TableRow<0)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_at_SMTypes{$_l_InsertIndex})
										APPEND TO ARRAY:C911($_at_MovementTypeCodes; [MOVEMENT_TYPES:60]Type_Code:1)
										APPEND TO ARRAY:C911($_at_MovementTypeNames; [MOVEMENT_TYPES:60]Type_Name:2)
										$_l_TableRow:=Size of array:C274($_at_MovementTypeNames)
									End if 
									$_t_TypeName:=$_at_MovementTypeNames{$_l_TableRow}
									$_t_StockMovementNo:=$_at_SMTypeNos{$_l_InsertIndex}
									$_d_StockMovementDate:=$_ad_SMDates{$_l_InsertIndex}
									
									For ($_l_StockMovementIndex; 1; Size of array:C274($_at_SMIMovementCodes))
										If ($_at_SMIMovementCodes{$_l_StockMovementIndex}=$_at_SMCodes{$_l_InsertIndex})
											LISTBOX INSERT ROWS:C913(DB_lb_OutputArrays; $_l_NewRow+1)
											$_l_NewRow:=$_l_NewRow+1
											PRD_at_STKHistoryTypes{$_l_NewRow}:=$_t_MovementType
											PRD_at_STKHistoryTypeNames{$_l_NewRow}:=$_t_TypeName
											PRD_at_STKHistoryTypeNos{$_l_NewRow}:=$_t_StockMovementNo
											PRD_ad_STKHistoryDates{$_l_NewRow}:=$_d_StockMovementDate
											PRD_at_STKHistoryCodes{$_l_NewRow}:=$_at_SMIMovementCodes{$_l_StockMovementIndex}
											PRD_ar_STKHistoryQuantities{$_l_NewRow}:=$_ar_SMIMovementQuanties{$_l_StockMovementIndex}
											PRD_ar_STKHistoryCosts{$_l_NewRow}:=$_ar_SMIMovementCosts{$_l_StockMovementIndex}
											PRD_at_StockHistoryCustomer{$_l_NewRow}:=$_at_SMICompaniesTo{$_l_StockMovementIndex}
											If ($_at_SMIOrderCodes{$_l_StockMovementIndex}#"")
												PRD_at_StockHistoryOrders{$_l_NewRow}:=$_at_SMIOrderCodes{$_l_StockMovementIndex}
												PRD_al_STKHistoryOrderItem{$_l_NewRow}:=$_al_SMIMoveItemNo{$_l_StockMovementIndex}
											Else 
												PRD_at_StockHistoryOrders{$_l_NewRow}:=$_at_SMIPurchOrderCode{$_l_StockMovementIndex}
												PRD_al_STKHistoryOrderItem{$_l_NewRow}:=$_al_SMIPurchItemNumber{$_l_StockMovementIndex}
											End if 
											PRD_at_StockHistoryLocation{$_l_NewRow}:=$_at_SMILocations{$_l_StockMovementIndex}
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
	: ($_l_Event=On Column Resize:K2:31)
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
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_TableRow}
			LBi_Resize($_ptr_ListboxSetup)
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$LAY_t_CurrentUserDefs:=$_ptr_ArrayReferences->{7}
			LBi_ListFindDup($_t_CurrentDefinitionsName; $LAY_t_CurrentUserDefs)
			$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
			
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_ptr_Formulas:=$_ptr_ListboxSetup->{6}
			$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayofColumnWIdths->)
			//The column number displayed may not match the sort order on the list layouts..
			
			FIRST RECORD:C50([LIST_LAYOUTS:96])
			COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$TempSelection")
			For ($_l_ColumnIndex; 1; Size of array:C274($_ptr_ArrayofColumnWIdths->))
				If (Position:C15("LB_GetRelation"; $_ptr_Formulas->{$_l_ColumnIndex})=0) & ($_ptr_ArrayofColumnWIdths->{$_l_ColumnIndex}#0)
					$_l_IgnoreColumns:=0
					$_l_Column:=$_l_ColumnIndex
					For ($_l_ColumnsIndex; 1; $_l_Column)
						If (Position:C15("LB_GetRelation"; $_ptr_Formulas->{$_l_ColumnsIndex})#0)
							$_l_IgnoreColumns:=$_l_IgnoreColumns+1
						End if 
						If ($_ptr_ArrayofColumnWIdths->{$_l_ColumnsIndex}=0)  // Zero width columns are invisible so dont get counted
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
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oListboxOutputArrays"; $_t_oldMethodName)
