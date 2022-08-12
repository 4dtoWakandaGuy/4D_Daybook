If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].Diary_PDTEditor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282(iCancel; iOK)
	//ARRAY BOOLEAN(SD2_lb_FeaturesList;0)
	//ARRAY BOOLEAN(SD2_lb_OrderItems;0)
	ARRAY LONGINT:C221($_al_GotTables; 0)
	ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
	ARRAY LONGINT:C221($_al_RecordIDs; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_TablesLoaded; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PDT_al_EditMode;0)
	//ARRAY LONGINT(SD_al_OtherFilterColumns;0)
	//ARRAY LONGINT(SD2_al_Levels;0)
	//ARRAY LONGINT(SD2_al_OpenChoice;0)
	//ARRAY LONGINT(SD2_Al_OrderItemNumbers;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	//ARRAY REAL(SD2_ar_OrderItemQuantity;0)
	ARRAY TEXT:C222($_at_ParentRecordCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	//ARRAY TEXT(PDT_at_editMode;0)
	//ARRAY TEXT(SD_at_otherFilters;0)
	//ARRAY TEXT(SD_At_otherFilterValues;0)
	//ARRAY TEXT(SD2_at_BookingPerson;0)
	//ARRAY TEXT(SD2_at_BookingStage;0)
	//ARRAY TEXT(SD2_at_BookingStageName;0)
	//ARRAY TEXT(SD2_at_OpenChoice;0)
	//ARRAY TEXT(SD2_at_OrderCodes;0)
	//ARRAY TEXT(SD2_At_OrderItemCompanies;0)
	//ARRAY TEXT(SD2_AT_OrderITemMacContent;0)
	//ARRAY TEXT(SD2_at_OrderItemOrderCodes;0)
	//ARRAY TEXT(SD2_at_OrderItemProductName;0)
	//ARRAY TEXT(SD2_at_OrdersPersons;0)
	//ARRAY TEXT(SD2_at_OrderStatus;0)
	//ARRAY TEXT(SD2_at_OrderStatusName;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_newLevel; $_bo_OptionKey; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_ButtonNumber; $_l_CharacterPosition; $_l_Column; $_l_ColumnIndex; $_l_ColumnWIdth; $_l_Denominator; $_l_event; $_l_FieldNumber; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_Index3; $_l_ModuleRow; $_l_Nominator; $_l_ReuseLevel; $_l_ScreenWidth; $_l_Size; $_l_SortChangeAlert; $_l_SortDirection; $_l_TableNumber; $_l_ThisTable; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(DB_l_WindowCurrentModule; INVOICED_Exclude; INVOICED_INCLUDE; INVOICED_ONLY; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; PCL_l_BUT1; PCL_l_BUT10)
	C_LONGINT:C283(PCL_l_BUT11; PCL_l_BUT12; PCL_l_BUT13; PCL_l_BUT14; PCL_l_BUT15; PCL_l_BUT16; PCL_l_BUT17; PCL_l_BUT18; PCL_l_BUT19; PCL_l_BUT2; PCL_l_BUT20)
	C_LONGINT:C283(PCL_l_BUT21; PCL_l_BUT22; PCL_l_BUT23; PCL_l_BUT24; PCL_l_BUT25; PCL_l_BUT26; PCL_l_BUT27; PCL_l_BUT3; PCL_l_BUT4; PCL_l_BUT5; PCL_l_BUT6)
	C_LONGINT:C283(PCL_l_BUT7; PCL_l_BUT8; PCL_l_BUT9; PDT_l_BookingsCount; vALLevels)
	C_PICTURE:C286(PDT_Pi_EditMode)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField)
	C_REAL:C285(PDT_BookingsCount; SD2_R_AverageTotal; SD2_R_OrdersCostTotal; SD2_R_OrdersSalesTotal; SD2_R_PageTotal)
	C_TEXT:C284($_t_AreaEditOptions; $_t_ColumnTitle; $_t_CurrentDefinitionsName; $_t_Denominator; $_t_Nominator; $_t_oldMethodName; $_t_PalletButtonName; $_t_ThisColumnValue; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(oSD3_COL1; oSD3_COL10; oSD3_COL11; oSD3_COL12; oSD3_COL13; oSD3_COL14; oSD3_COL15; oSD3_COL16; oSD3_COL17; oSD3_COL18; oSD3_COL19)
	C_TEXT:C284(oSD3_COL2; oSD3_COL20; oSD3_COL21; oSD3_COL22; oSD3_COL23; oSD3_COL24; oSD3_COL25; oSD3_COL26; oSD3_COL27; oSD3_COL3; oSD3_COL4)
	C_TEXT:C284(oSD3_COL5; oSD3_COL6; oSD3_COL7; oSD3_COL8; oSD3_COL9; oSD3_HED1; oSD3_HED10; oSD3_HED11; oSD3_HED12; oSD3_HED13; oSD3_HED14)
	C_TEXT:C284(oSD3_HED15; oSD3_HED16; oSD3_HED17; oSD3_HED18; oSD3_HED19; oSD3_HED2; oSD3_HED20; oSD3_HED21; oSD3_HED22; oSD3_HED23; oSD3_HED24)
	C_TEXT:C284(oSD3_HED25; oSD3_HED26; oSD3_HED27; oSD3_HED3; oSD3_HED4; oSD3_HED5; oSD3_HED6; oSD3_HED7; oSD3_HED8; oSD3_HED9; PAL_BUTTON)
	C_TEXT:C284(SD2_t_PublicationName; vButtDisPDT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_PDTEditor"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->SD2_lb_OrderItems)
		LBI_Scrollonresize(->SD2_lb_FeaturesList)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		//TRACE
		READ WRITE:C146([ORDER_ITEMS:25])
		
		ARRAY TEXT:C222(PDT_at_editMode; 0)
		ARRAY LONGINT:C221(PDT_al_EditMode; 0)
		
		LBi_SetListBoxOptions(->PDT_at_editMode; ->PDT_al_EditMode; ->PDT_Pi_EditMode)
		//GET PICTURE FROM LIBRARY(22542; PDT_Pi_EditMode)
		PDT_Pi_EditMode:=Get_Picture(22542)
		ARRAY TEXT:C222(SD2_at_OpenChoice; 0)
		ARRAY LONGINT:C221(SD2_al_OpenChoice; 0)
		APPEND TO ARRAY:C911(SD2_at_OpenChoice; "Orders")
		APPEND TO ARRAY:C911(SD2_at_OpenChoice; "Invoices")
		APPEND TO ARRAY:C911(SD2_al_OpenChoice; Table:C252(->[ORDERS:24]))
		APPEND TO ARRAY:C911(SD2_al_OpenChoice; Table:C252(->[INVOICES:39]))
		SD2_at_OpenChoice:=1
		
		If ([DIARY:12]Diary_Code:3="")
			DiarySetCode
		End if 
		If ([DIARY:12]x_ID:50>0)
			QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
		Else 
			REDUCE SELECTION:C351([xDiaryRelations:137]; 0)
		End if 
		ARRAY LONGINT:C221(SD2_al_RelatedTableNum; 0)
		ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)
		ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
		ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)
		ARRAY LONGINT:C221(SD2_Al_OrderItemNumbers; 0)
		ARRAY TEXT:C222(SD2_at_OrderItemOrderCodes; 0)
		ARRAY TEXT:C222(SD2_At_OrderItemCompanies; 0)
		ARRAY REAL:C219(SD2_ar_OrderItemQuantity; 0)
		ARRAY TEXT:C222(SD2_at_OrderItemProductName; 0)
		ARRAY TEXT:C222(SD2_AT_OrderITemMacContent; 0)  //macro controlled content!
		If (Records in selection:C76([xDiaryRelations:137])>0)
			CREATE SET:C116([xDiaryRelations:137]; "ALL")
			QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[ORDER_ITEMS:25]))
			If (Records in selection:C76([xDiaryRelations:137])>0)
				CREATE SET:C116([xDiaryRelations:137]; "ORDERS")
			Else 
				CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
			End if 
			USE SET:C118("ALL")
			QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3#Table:C252(->[ORDER_ITEMS:25]))
			If (Records in selection:C76([xDiaryRelations:137])>0)
				CREATE SET:C116([xDiaryRelations:137]; "OTHERS")
			Else 
				CREATE EMPTY SET:C140([xDiaryRelations:137]; "OTHERS")
			End if 
			If ([DIARY:12]Product_Code:13#"")
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[DIARY:12]Product_Code:13)
				SD2_t_PublicationName:=[PRODUCTS:9]Product_Name:2
			Else 
				SD2_t_PublicationName:=""
			End if 
			
			USE SET:C118("OTHERS")
			ARRAY LONGINT:C221(SD2_al_RelatedTableNum; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)
			
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_TableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RecordIDs)
			ARRAY LONGINT:C221($_al_GotTables; 0)
			$_l_ThisTable:=0
			ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
			ARRAY TEXT:C222($_at_ParentRecordCodes; 0)
			ARRAY LONGINT:C221($_al_TablesLoaded; 0)
			
			For ($_l_Index2; 1; Size of array:C274($_al_TableNumbers))
				$_l_ThisTable:=0
				If (Find in array:C230($_al_TablesLoaded; $_al_TableNumbers{$_l_Index2})<0)
					ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
					ARRAY TEXT:C222($_at_ParentRecordCodes; 0)
					APPEND TO ARRAY:C911($_al_TablesLoaded; $_al_TableNumbers{$_l_Index2})
					For ($_l_Index; 1; Size of array:C274($_al_TableNumbers))
						$_l_TableNumber:=$_al_TableNumbers{$_l_Index}
						$_l_ModuleRow:=Find in array:C230($_al_GotTables; $_l_TableNumber)
						If ($_l_ModuleRow<0)
							APPEND TO ARRAY:C911($_al_GotTables; $_l_TableNumber)
						End if 
						If ($_l_ThisTable=0)
							$_l_ThisTable:=$_l_TableNumber
						End if 
						If ($_l_TableNumber=$_l_ThisTable)
							APPEND TO ARRAY:C911($_al_OneTableRecordIDS; $_al_RecordIDs{$_l_Index})
							APPEND TO ARRAY:C911($_at_ParentRecordCodes; $_at_RecordCodes{$_l_Index})
						End if 
						
					End for 
					Case of   //At the moment these are only going to be products
						: ($_l_TableNumber=9)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ParentRecordCodes)
							CREATE SET:C116([PRODUCTS:9]; "Todisplay")
							For ($_l_Index3; 1; Size of array:C274($_at_ParentRecordCodes))
								If ($_at_ParentRecordCodes{$_l_Index3}#[DIARY:12]Product_Code:13)
									USE SET:C118("ToDisplay")
									QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ParentRecordCodes{$_l_Index3})
									If (Find in array:C230(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)<0)
										APPEND TO ARRAY:C911(SD2_al_RelatedTableNum; Table:C252(->[PRODUCTS:9]))
										APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)
										APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [PRODUCTS:9]Product_Code:1)
										APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [PRODUCTS:9]Product_Name:2)
									End if 
								End if 
							End for 
							
					End case 
				End if 
			End for 
			USE SET:C118("ORDERS")
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_TableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RecordIDs)
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ID:58; $_al_RecordIDs)
			CREATE SET:C116([ORDER_ITEMS:25]; "BOOKING")
			
		Else 
			REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
			CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
			CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "BOOKING")
		End if 
		
		//PRD_al_RestrictSections;[BUILT_CODE_FORMAT_SECTION]SECTION_NAME;PRD_at_RestrictSectionNames
		//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
		LB_SetupListbox(->SD2_lb_FeaturesList; "oSD3"; "PCL_L"; 1; ->SD2_al_RelatedTableNum; ->SD2_al_RelatedRecordID; ->SD2_at_RelatedRecordCode; ->SD2_at_RelatedRecordName)
		LB_SetColumnHeaders(->SD2_lb_FeaturesList; "PCL_L"; 1; "Table ID"; "RecordID"; "Record"; "Detail")
		LB_SetColumnWidths(->SD2_lb_FeaturesList; "oSD3"; 1; 0; 0; 120; 250)
		LB_SetScroll(->SD2_lb_FeaturesList; -2; -2)
		LB_SetEnterable(->SD2_lb_FeaturesList; False:C215; 0; "")
		LBi_InclSetupJustStyle(->SD2_lb_FeaturesList)
		
		//ORDER BY([ORDER ITEMS];[ORDER ITEMS]Product Code;>(
		ARRAY LONGINT:C221(SD2_al_Levels; 1)
		ARRAY POINTER:C280(SD2_aptr_LBOrderItemsSetup; 0)
		$_l_ReuseLevel:=0
		If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0) & (vALLevels>0)
			If (SD2_al_Levels{1}=0)
				$_bo_newLevel:=True:C214
				
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=SD2_al_Levels{1}
			End if 
		Else 
			$_bo_newLevel:=False:C215
		End if 
		
		If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0)
			$_t_AreaEditOptions:="411111000"
			LBi_ArrDefFill(->SD2_aptr_LBOrderItemsSetup; ->SD2_lb_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[DIARY:12]Order_Code:26; $_t_AreaEditOptions; "Items_in"; 22; "Order Items"; "Order Item"; ""; $_bo_newLevel; $_l_ReuseLevel)
			//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
			//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
			$_ptr_ListboxSetup:=->SD2_aptr_LBOrderItemsSetup
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
			<>l_FS_FieldSortChangedAlert:=1
			FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
			<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
			
		Else 
			
			OK:=1
			$_ptr_ListboxSetup:=->SD2_aptr_LBOrderItemsSetup
			
			LBi_Prefs11($_ptr_ListboxSetup)
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			
			
			$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
			<>l_FS_FieldSortChangedAlert:=1
			FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
			<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
			
		End if 
		ARRAY TEXT:C222(SD2_at_BookingPerson; 0)
		ARRAY TEXT:C222(SD2_at_OrdersPersons; 0)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Person:14; SD2_at_BookingPerson)
		QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; SD2_at_BookingPerson)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; SD2_at_BookingPerson; [PERSONNEL:11]Name:2; SD2_at_OrdersPersons)
		SORT ARRAY:C229(SD2_at_OrdersPersons; SD2_at_BookingPerson)
		APPEND TO ARRAY:C911(SD2_at_BookingPerson; "-")
		APPEND TO ARRAY:C911(SD2_at_OrdersPersons; "-")
		APPEND TO ARRAY:C911(SD2_at_BookingPerson; "~ALL")
		APPEND TO ARRAY:C911(SD2_at_OrdersPersons; "ALL")
		//``
		ARRAY TEXT:C222(SD2_at_BookingStage; 0)
		ARRAY TEXT:C222(SD2_at_BookingStageName; 0)
		//DISTINCT VALUES([ORDER ITEMS]Job Stage;SD2_at_BookingStage)
		ALL RECORDS:C47([STAGES:45])
		SELECTION TO ARRAY:C260([STAGES:45]Stage_Code:1; SD2_at_BookingStage; [STAGES:45]Stage_Name:2; SD2_at_BookingStageName)
		SORT ARRAY:C229(SD2_at_BookingStageName; SD2_at_BookingStage)
		APPEND TO ARRAY:C911(SD2_at_BookingStage; "-")
		APPEND TO ARRAY:C911(SD2_at_BookingStageName; "-")
		APPEND TO ARRAY:C911(SD2_at_BookingStage; "~ALL")
		APPEND TO ARRAY:C911(SD2_at_BookingStageName; "ALL")
		
		//``
		ARRAY TEXT:C222(SD2_at_OrderStatus; 0)
		ARRAY TEXT:C222(SD2_at_OrderStatusName; 0)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; SD2_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; SD2_at_OrderCodes)
		DISTINCT VALUES:C339([ORDERS:24]State:15; SD2_at_OrderStatus)
		
		QUERY WITH ARRAY:C644([TABLE_RECORD_STATES:90]State_Reference:4; SD2_at_OrderStatus)
		SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; SD2_at_OrderStatus; [TABLE_RECORD_STATES:90]Entry_Name:5; SD2_at_OrderStatusName)
		SORT ARRAY:C229(SD2_at_OrderStatusName; SD2_at_OrderStatus)
		APPEND TO ARRAY:C911(SD2_at_OrderStatus; "-")
		APPEND TO ARRAY:C911(SD2_at_OrderStatusName; "-")
		APPEND TO ARRAY:C911(SD2_at_OrderStatus; "~ALL")
		APPEND TO ARRAY:C911(SD2_at_OrderStatusName; "ALL")
		INVOICED_INCLUDE:=1
		INVOICED_Exclude:=0
		INVOICED_ONLY:=0
		ARRAY TEXT:C222(SD_at_otherFilters; 0)
		ARRAY LONGINT:C221(SD_al_OtherFilterColumns; 0)
		ARRAY TEXT:C222(SD_At_otherFilterValues; 0)
		$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
		$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		For ($_l_Index; 1; Size of array:C274($_ptr_ArrayofColumnLabels->))
			$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
			$_l_TableNumber:=Table:C252($_Ptr_ThisColumnField)
			$_l_FieldNumber:=Field:C253($_Ptr_ThisColumnField)
			$_bo_Load:=True:C214
			Case of 
				: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
					If ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Person:14)) | ($_l_FieldNumber=-Field:C253(->[ORDER_ITEMS:25]Job_Stage:35)) | ($_l_FieldNumber=Field:C253(->[ORDERS:24]State:15))
						$_bo_Load:=False:C215
					End if 
				: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
					If ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Invoice_Number:17))
						$_bo_Load:=False:C215
					End if 
				: ($_l_TableNumber=Table:C252(->[STAGES:45]))
					If ($_l_FieldNumber=Field:C253(->[STAGES:45]Stage_Name:2))
						$_bo_Load:=False:C215
					End if 
			End case 
			If ($_bo_Load)
				$_l_ColumnWIdth:=$_ptr_ArrayofColumnWIdths->{$_l_Index}
				If ($_l_ColumnWIdth>0)
					$_t_ColumnTitle:=$_ptr_ArrayofColumnLabels->{$_l_Index}
					APPEND TO ARRAY:C911(SD_at_otherFilters; $_t_ColumnTitle)
					APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; $_l_Index)  //note this is the COLUMN number and nothin more
				End if 
			End if 
			
		End for 
		APPEND TO ARRAY:C911(SD_at_otherFilters; "-")
		APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; 0)  //note this is the COLUMN number and nothin more
		APPEND TO ARRAY:C911(SD_at_otherFilters; "Clear")
		APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; -1)  //note this is the COLUMN number and nothin more
		
		OBJECT SET VISIBLE:C603(SD_At_otherFilterValues; False:C215)
		
		
		//``
		
		SD2_R_OrdersCostTotal:=Sum:C1([ORDER_ITEMS:25]Cost_Price:5)
		SD2_R_OrdersSalesTotal:=Sum:C1([ORDER_ITEMS:25]Sales_Price:4)
		PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])
		
		LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B")
		//Find column with [products]size
		CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
		CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredPersons")
		CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredStages")
		CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredStatus")
		CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredInvoices")
		SD2_R_PageTotal:=0
		$_l_Column:=LB_GetColumnNumFromField(->[PRODUCTS:9]Size:39; ->SD2_aptr_LBOrderItemsSetup)
		If ($_l_Column>0)
			$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
			For ($_l_ColumnIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
				$_t_ThisColumnValue:=$_Ptr_ThisColumnArray->{$_l_ColumnIndex}
				$_l_CharacterPosition:=Position:C15("/"; $_t_ThisColumnValue)
				If ($_l_CharacterPosition=0)
					$_l_Size:=Num:C11($_Ptr_ThisColumnArray->{$_l_ColumnIndex})
				Else 
					$_t_Denominator:=Substring:C12($_t_ThisColumnValue; 1; $_l_CharacterPosition-1)
					$_t_Nominator:=Substring:C12($_t_ThisColumnValue; $_l_CharacterPosition+1)
					$_l_Denominator:=Num:C11($_t_Denominator)
					$_l_Nominator:=Num:C11($_t_Nominator)
					$_l_Size:=$_l_Denominator/$_l_Nominator
				End if 
				SD2_R_PageTotal:=SD2_R_PageTotal+$_l_Size
			End for 
		End if 
		SD2_R_PageTotal:=Round:C94(SD2_R_PageTotal; 2)
		
		
		If (SD2_R_PageTotal>0) & (SD2_R_OrdersSalesTotal#0)
			SD2_R_AverageTotal:=Round:C94((SD2_R_OrdersSalesTotal/SD2_R_PageTotal); 2)
		End if 
		PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])
		
		
		INT_SetInput(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		$_l_ScreenWidth:=Screen width:C187-60
		WS_AutoscreenSize(1; 1200; $_l_ScreenWidth; Table name:C256(->[DIARY:12])+"_"+"Diary_PDTEditor")
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		//NEEDS BUTTONS SET
		vButtDisPDT:="I"
		Input_Buttons(->[PRODUCTS:9]; ->vButtDisPDT)
		In_ButtChkDis(->vButtDisPDT)
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
				
				
		End case 
		
	: ($_l_event=On Outside Call:K2:11)
		
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				//InButtSubHandle (Current form page;->[ORDERS])
				
				
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1))
				For ($_l_Index; 1; Size of array:C274(SD2_al_RelatedRecordID))
					
					If (SD2_al_RelatedRecordID{$_l_Index}<0)  //new link needs to be created
						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD2_al_RelatedTableNum{$_l_Index}; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=Abs:C99(SD2_al_RelatedRecordID{$_l_Index}))
						If (Records in selection:C76([xDiaryRelations:137])=0)
							CREATE RECORD:C68([xDiaryRelations:137])
							[xDiaryRelations:137]xTableNUM:3:=SD2_al_RelatedTableNum{$_l_Index}
							[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
							[xDiaryRelations:137]xRecordID:4:=Abs:C99(SD2_al_RelatedRecordID{$_l_Index})
							[xDiaryRelations:137]XRecord_Code:5:=SD2_at_RelatedRecordCode{$_l_Index}
							DB_SaveRecord(->[xDiaryRelations:137])
						End if 
					End if 
				End for 
				
				ACCEPT:C269
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				CANCEL:C270
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Report"))
				$_bo_OptionKey:=Gen_Option
				Gen_ListReport(->[ORDER_ITEMS:25]; ""; "SelectedBookings"; $_bo_OptionKey; True:C214; [DIARY:12]Action_Code:9)
				
				
				
				
				
		End case 
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_PDTEditor"; $_t_oldMethodName)
