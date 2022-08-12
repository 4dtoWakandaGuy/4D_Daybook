If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.ORefresh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_OrderItems;0)
	ARRAY LONGINT:C221($_al_GotTables; 0)
	ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_RecordIDs; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_TablesLoaded; 0)
	//ARRAY LONGINT(SD_al_OtherFilterColumns;0)
	//ARRAY LONGINT(SD2_Al_OrderItemNumbers;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	//ARRAY REAL(SD2_ar_OrderItemQuantity;0)
	ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	//ARRAY TEXT(SD_at_otherFilters;0)
	//ARRAY TEXT(SD_At_otherFilterValues;0)
	//ARRAY TEXT(SD2_at_BookingPerson;0)
	//ARRAY TEXT(SD2_at_BookingStage;0)
	//ARRAY TEXT(SD2_at_BookingStageName;0)
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
	C_BOOLEAN:C305($_bo_AddNUL; $_bo_BooleanValue; $_bo_Load; $_bo_NewLevel)
	C_DATE:C307($_d_DateValue)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_CharacterPosition; $_l_Column; $_l_ColumnNumber; $_l_FieldNumber; $_l_FilterValuesRow; $_l_GotTableRow; $_l_Index; $_l_KeyColumn; $_l_OneTableIndex; $_l_OrderStatusRow)
	C_LONGINT:C283($_l_OtherFilterRow; $_l_PersonRows; $_l_ReuseLevel; $_l_RowsIndex; $_l_SortChangeAlert; $_l_SortDirection; $_l_StageRow; $_l_TableNumber; $_l_TablesIndex; $_l_ThisTableNumber; $_l_Width)
	C_LONGINT:C283(INVOICED_Exclude; INVOICED_INCLUDE; INVOICED_ONLY; PDT_l_BookingsCount)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnArray2; $_Ptr_ThisColumnField)
	C_REAL:C285($_r_DenominatorNum; $_r_NominatorNUM; $_r_Size; $_r_Value; SD2_R_AverageTotal; SD2_R_OrdersCostTotal; SD2_R_OrdersSalesTotal; SD2_R_PageTotal)
	C_TEXT:C284($_t_AreaOptions; $_t_CurrenBookingStageFilter; $_t_CurrentDefinitionsName; $_t_CurrentOtherFIlter; $_t_CurrentPersonsFilter; $_t_Denominator; $_t_Nominator; $_t_oldMethodName; $_t_OrderStatus; $_t_OrderStatusFilter; $_t_Person)
	C_TEXT:C284($_t_Stage; $_t_ThisValue; $_t_Title; $_t_Value; $_t_ValueSTRING; SD2_t_PublicationName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.ORefresh"; Form event code:C388)
$_t_CurrentPersonsFilter:=SD2_at_OrdersPersons{SD2_at_OrdersPersons}
$_t_CurrenBookingStageFilter:=SD2_at_BookingStageName{SD2_at_BookingStageName}
$_t_OrderStatusFilter:=SD2_at_OrderStatusName{SD2_at_OrderStatusName}
$_t_CurrentOtherFIlter:=SD_At_otherFilterValues{SD_At_otherFilterValues}


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
	$_l_ThisTableNumber:=0
	ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
	ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
	ARRAY LONGINT:C221($_al_TablesLoaded; 0)
	
	For ($_l_TablesIndex; 1; Size of array:C274($_al_TableNumbers))
		$_l_ThisTableNumber:=0
		If (Find in array:C230($_al_TablesLoaded; $_al_TableNumbers{$_l_TablesIndex})<0)
			ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
			ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
			APPEND TO ARRAY:C911($_al_TablesLoaded; $_al_TableNumbers{$_l_TablesIndex})
			For ($_l_Index; 1; Size of array:C274($_al_TableNumbers))
				$_l_TableNumber:=$_al_TableNumbers{$_l_Index}
				$_l_GotTableRow:=Find in array:C230($_al_GotTables; $_l_TableNumber)
				If ($_l_GotTableRow<0)
					APPEND TO ARRAY:C911($_al_GotTables; $_l_TableNumber)
				End if 
				If ($_l_ThisTableNumber=0)
					$_l_ThisTableNumber:=$_l_TableNumber
				End if 
				If ($_l_TableNumber=$_l_ThisTableNumber)
					APPEND TO ARRAY:C911($_al_OneTableRecordIDS; $_al_RecordIDs{$_l_Index})
					APPEND TO ARRAY:C911($_at_OneTableRecordCodes; $_at_RecordCodes{$_l_Index})
				End if 
				
			End for 
			Case of   //At the moment these are only going to be products
				: ($_l_TableNumber=9)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_OneTableRecordCodes)
					CREATE SET:C116([PRODUCTS:9]; "Todisplay")
					For ($_l_OneTableIndex; 1; Size of array:C274($_at_OneTableRecordCodes))
						USE SET:C118("ToDisplay")
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_OneTableRecordCodes{$_l_OneTableIndex})
						APPEND TO ARRAY:C911(SD2_al_RelatedTableNum; Table:C252(->[PRODUCTS:9]))
						APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)
						APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [PRODUCTS:9]Product_Code:1)
						APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [PRODUCTS:9]Product_Name:2)
					End for 
					
			End case 
		End if 
	End for 
	
	USE SET:C118("ORDERS")
	SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_TableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RecordIDs)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ID:58; $_al_RecordIDs)
	CREATE SET:C116([ORDER_ITEMS:25]; "BOOKING")
	
Else 
	CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
	CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "BOOKING")
End if 

//ORDER BY([ORDER ITEMS];[ORDER ITEMS]Product Code;>(

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
$_ptr_ArrayofColumnWIdths:=SD2_aptr_LBOrderItemsSetup{13}
$_ptr_ArrayofColumnLabels:=SD2_aptr_LBOrderItemsSetup{12}
$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
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
		$_l_Width:=$_ptr_ArrayofColumnWIdths->{$_l_Index}
		If ($_l_Width>0)
			$_t_Title:=$_ptr_ArrayofColumnLabels->{$_l_Index}
			APPEND TO ARRAY:C911(SD_at_otherFilters; $_t_Title)
			APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; $_l_Index)  //note this is the COLUMN number and nothin more
		End if 
	End if 
	
End for 
APPEND TO ARRAY:C911(SD_at_otherFilters; "-")
APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; 0)  //note this is the COLUMN number and nothin more
APPEND TO ARRAY:C911(SD_at_otherFilters; "Clear")
APPEND TO ARRAY:C911(SD_al_OtherFilterColumns; -1)  //note this is the COLUMN number and nothin more

OBJECT SET VISIBLE:C603(SD_At_otherFilterValues; False:C215)

LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B")

CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredPersons")
CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredStages")
CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredStatus")
CREATE SET:C116([ORDER_ITEMS:25]; "UnfilteredInvoices")
CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")



//now reload the filters in other
If (SD_at_otherFilters>0)
	ARRAY TEXT:C222(SD_At_otherFilterValues; 0)
	$_l_Column:=SD_al_OtherFilterColumns{SD_at_OtherFilters}
	$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
	$_bo_AddNUL:=False:C215
	For ($_l_Index; 1; Size of array:C274($_Ptr_ThisColumnArray->))
		$_t_Value:=""
		Case of 
			: (Type:C295($_Ptr_ThisColumnArray->)=Text array:K8:16) | (Type:C295($_Ptr_ThisColumnArray->)=String array:K8:15)
				$_t_Value:=$_Ptr_ThisColumnArray->{$_l_Index}
				If ($_t_Value="")
					$_bo_AddNUL:=True:C214
				End if 
			: (Type:C295($_Ptr_ThisColumnArray->)=Real array:K8:17) | (Type:C295($_Ptr_ThisColumnArray->)=Integer array:K8:18) | (Type:C295($_Ptr_ThisColumnArray->)=LongInt array:K8:19)
				$_r_Value:=$_Ptr_ThisColumnArray->{$_l_Index}
				$_t_Value:=String:C10($_r_Value)
			: (Type:C295($_Ptr_ThisColumnArray->)=Date array:K8:20)
				$_d_DateValue:=$_Ptr_ThisColumnArray->{$_l_Index}
				$_t_Value:=String:C10($_d_DateValue)
			: (Type:C295($_Ptr_ThisColumnArray->)=Boolean array:K8:21)
				$_bo_BooleanValue:=$_Ptr_ThisColumnArray->{$_l_Index}
				If ($_bo_BooleanValue)
					$_t_Value:="TRUE"
				Else 
					$_t_Value:="FALSE"
				End if 
		End case 
		If ($_t_Value#"")
			$_l_FilterValuesRow:=Find in array:C230(SD_At_otherFilterValues; $_t_Value)
			If ($_l_FilterValuesRow<0)
				APPEND TO ARRAY:C911(SD_At_otherFilterValues; $_t_Value)
			End if 
		End if 
	End for 
	SORT ARRAY:C229(SD_At_otherFilterValues)
	If ($_bo_AddNUL)
		APPEND TO ARRAY:C911(SD_At_otherFilterValues; "-")
		APPEND TO ARRAY:C911(SD_At_otherFilterValues; "BLANKS")
	End if 
	OBJECT SET VISIBLE:C603(SD_At_otherFilterValues; True:C214)
Else 
	OBJECT SET VISIBLE:C603(SD_At_otherFilterValues; False:C215)
	$_t_CurrentOtherFIlter:=""
End if 


If ($_t_CurrentPersonsFilter#"")
	$_l_PersonRows:=Find in array:C230(SD2_at_OrdersPersons; $_t_CurrentPersonsFilter)
	If ($_l_PersonRows>0)
		SD2_at_BookingPerson:=$_l_PersonRows
		SD2_at_OrdersPersons:=$_l_PersonRows
	Else 
		SD2_at_OrdersPersons:=0
		SD2_at_BookingPerson:=0
		
	End if 
Else 
	SD2_at_OrdersPersons:=0
	SD2_at_BookingPerson:=0
End if 
If ($_t_CurrenBookingStageFilter#"")
	$_l_StageRow:=Find in array:C230(SD2_at_BookingStageName; $_t_CurrenBookingStageFilter)
	If ($_l_StageRow>0)
		SD2_at_BookingStageName:=$_l_StageRow
		SD2_at_BookingStage:=$_l_StageRow
	Else 
		SD2_at_BookingStageName:=0
		SD2_at_BookingStage:=0
	End if 
Else 
	SD2_at_BookingStageName:=0
	SD2_at_BookingStage:=0
	
End if 
If ($_t_OrderStatusFilter#"")
	$_l_OrderStatusRow:=Find in array:C230(SD2_at_OrderStatusName; $_t_OrderStatusFilter)
	If ($_l_OrderStatusRow>0)
		SD2_at_OrderStatus:=$_l_OrderStatusRow
		SD2_at_OrderStatusName:=$_l_OrderStatusRow
	Else 
		SD2_at_OrderStatus:=0
		SD2_at_OrderStatusName:=0
	End if 
Else 
	SD2_at_OrderStatus:=0
	SD2_at_OrderStatusName:=0
End if 
If ($_t_CurrentOtherFIlter#"")
	$_l_OtherFilterRow:=Find in array:C230(SD_At_otherFilterValues; $_l_OtherFilterRow)
	If ($_l_OtherFilterRow>0)
		SD_At_otherFilterValues:=$_l_OtherFilterRow
	Else 
		SD_At_otherFilterValues:=0
	End if 
Else 
	SD_At_otherFilterValues:=0
End if 
//now apply the filters
If (SD_at_OtherFIlterValues>0) | (SD2_at_OrderStatusName>0) | (SD2_at_BookingStageName>0) | (SD2_at_OrdersPersons>0)
	If (SD_at_OtherFIlterValues>0)
		$_l_ColumnNumber:=SD_al_OtherFilterColumns{SD_at_OtherFilters}
		$_l_KeyColumn:=LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Item_Number:27; ->SD2_aptr_LBOrderItemsSetup)
		$_t_Value:=SD_at_OtherFIlterValues{SD_at_OtherFIlterValues}
		$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
		$_Ptr_ThisColumnArray2:=$_ptr_ArrayofArrayPointers->{$_l_KeyColumn}
		ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
		For ($_l_RowsIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
			//(Type($_Ptr_ThisColumnArray->)=Text array ) | (Type($_Ptr_ThisColumnArray->)=String array )
			Case of 
				: (Type:C295($_Ptr_ThisColumnArray->)=Text array:K8:16) | (Type:C295($_Ptr_ThisColumnArray->)=String array:K8:15)
					If ($_Ptr_ThisColumnArray->{$_l_RowsIndex}=$_t_Value)
						APPEND TO ARRAY:C911($_al_OrderItemNumbers; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
						
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Real array:K8:17) | (Type:C295($_Ptr_ThisColumnArray->)=Integer array:K8:18) | (Type:C295($_Ptr_ThisColumnArray->)=LongInt array:K8:19)
					$_r_Value:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					$_t_ValueSTRING:=String:C10($_r_Value)
					
					If ($_t_Value=$_t_ValueSTRING)
						APPEND TO ARRAY:C911($_al_OrderItemNumbers; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
						
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Date array:K8:20)
					$_d_DateValue:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					$_t_ValueSTRING:=String:C10($_d_DateValue)
					If ($_t_Value=$_t_ValueSTRING)
						APPEND TO ARRAY:C911($_al_OrderItemNumbers; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Boolean array:K8:21)
					$_bo_BooleanValue:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					If ($_bo_BooleanValue)
						$_t_ValueSTRING:="TRUE"
					Else 
						$_t_ValueSTRING:="FALSE"
					End if 
					If ($_t_ValueSTRING=$_t_Value)
						APPEND TO ARRAY:C911($_al_OrderItemNumbers; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
					End if 
			End case 
			
		End for 
		//now we have the range of values that match.. by definition these are in the current selection..
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
	End if 
	If (SD2_at_OrderStatusName>0)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; SD2_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; SD2_at_OrderCodes)
		$_t_OrderStatus:=SD2_at_OrderStatus{SD2_at_OrderStatusName}
		If ("~ALL"#$_t_OrderStatus)  //Slighty more complex than the others
			QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_OrderStatus)
			SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
			CREATE SET:C116([ORDER_ITEMS:25]; "CS")
			INTERSECTION:C121("SelectedBookings"; "CS"; "SelectedBookings")
			USE SET:C118("SelectedBookings")
			
		End if 
	End if 
	If (SD2_at_BookingStageName>0)
		$_t_Stage:=SD2_at_BookingStage{SD2_at_BookingStageName}
		If ("~ALL"#$_t_Stage)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35=$_t_Stage)
		End if 
	End if 
	If (SD2_at_OrdersPersons>0)
		$_t_Person:=SD2_at_BookingPerson{SD2_at_OrdersPersons}
		If ("~ALL"#$_t_Person)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Person:14=$_t_Person)
		End if 
	End if 
	$_bo_NewLevel:=False:C215
	
	
	If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0)
		$_t_AreaOptions:="411111000"
		LBi_ArrDefFill(->SD2_aptr_LBOrderItemsSetup; ->SD2_lb_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; $_t_AreaOptions; "Items_in"; 22; "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
		//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
		$_ptr_ArrayReferences:=SD2_aptr_LBOrderItemsSetup{9}
		$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
		$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
		$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
		<>l_FS_FieldSortChangedAlert:=1
		FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
		<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
		
	Else 
		
		OK:=1
		
		
		LBi_Prefs11(->SD2_aptr_LBOrderItemsSetup)
		$_ptr_ArrayReferences:=SD2_aptr_LBOrderItemsSetup{9}
		$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
		$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
		
		
		$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
		<>l_FS_FieldSortChangedAlert:=1
		FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
		<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
		
	End if 
	PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])
	
	LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B")
	SD2_R_OrdersCostTotal:=Sum:C1([ORDER_ITEMS:25]Cost_Price:5)
	SD2_R_OrdersSalesTotal:=Sum:C1([ORDER_ITEMS:25]Sales_Price:4)
	SD2_R_PageTotal:=0
	$_l_Column:=LB_GetColumnNumFromField(->[PRODUCTS:9]Size:39; ->SD2_aptr_LBOrderItemsSetup)
	
	If ($_l_Column>0)
		$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
		For ($_l_RowsIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
			$_t_ThisValue:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
			$_l_CharacterPosition:=Position:C15("/"; $_t_ThisValue)
			If ($_l_CharacterPosition=0)
				$_r_Size:=Num:C11($_Ptr_ThisColumnArray->{$_l_RowsIndex})
			Else 
				$_t_Denominator:=Substring:C12($_t_ThisValue; 1; $_l_CharacterPosition-1)
				$_t_Nominator:=Substring:C12($_t_ThisValue; $_l_CharacterPosition+1)
				$_r_DenominatorNum:=Num:C11($_t_Denominator)
				$_r_NominatorNUM:=Num:C11($_t_Nominator)
				$_r_Size:=$_r_DenominatorNum/$_r_NominatorNUM
			End if 
			SD2_R_PageTotal:=SD2_R_PageTotal+$_r_Size
		End for 
	End if 
	SD2_R_PageTotal:=Round:C94(SD2_R_PageTotal; 2)
	
	If (SD2_R_PageTotal>0) & (SD2_R_OrdersSalesTotal#0)
		SD2_R_AverageTotal:=Round:C94((SD2_R_OrdersSalesTotal/SD2_R_PageTotal); 2)
	Else 
		SD2_R_AverageTotal:=0
	End if 
	CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
End if 
PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])

SD2_R_OrdersCostTotal:=Sum:C1([ORDER_ITEMS:25]Cost_Price:5)
SD2_R_OrdersSalesTotal:=Sum:C1([ORDER_ITEMS:25]Sales_Price:4)
SD2_R_PageTotal:=0
$_l_Column:=LB_GetColumnNumFromField(->[PRODUCTS:9]Size:39; ->SD2_aptr_LBOrderItemsSetup)

If ($_l_Column>0)
	$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
	For ($_l_RowsIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
		$_t_ThisValue:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
		$_l_CharacterPosition:=Position:C15("/"; $_t_ThisValue)
		If ($_l_CharacterPosition=0)
			$_r_Size:=Num:C11($_Ptr_ThisColumnArray->{$_l_RowsIndex})
		Else 
			$_t_Denominator:=Substring:C12($_t_ThisValue; 1; $_l_CharacterPosition-1)
			$_t_Nominator:=Substring:C12($_t_ThisValue; $_l_CharacterPosition+1)
			$_r_DenominatorNum:=Num:C11($_t_Denominator)
			$_r_NominatorNUM:=Num:C11($_t_Nominator)
			$_r_Size:=$_r_DenominatorNum/$_r_NominatorNUM
		End if 
		SD2_R_PageTotal:=SD2_R_PageTotal+$_r_Size
	End for 
End if 
SD2_R_PageTotal:=Round:C94(SD2_R_PageTotal; 2)

If (SD2_R_PageTotal>0) & (SD2_R_OrdersSalesTotal#0)
	SD2_R_AverageTotal:=Round:C94((SD2_R_OrdersSalesTotal/SD2_R_PageTotal); 2)
Else 
	SD2_R_AverageTotal:=0
End if 
CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.ORefresh"; $_t_oldMethodName)
