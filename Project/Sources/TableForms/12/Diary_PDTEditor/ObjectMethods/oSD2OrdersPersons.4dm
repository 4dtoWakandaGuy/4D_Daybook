If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.oSD2OrdersPersons
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
	//ARRAY BOOLEAN(SD2_lb_OrderItems;0)
	ARRAY LONGINT:C221($_al_OrderItemNos; 0)
	//ARRAY LONGINT(SD_al_OtherFilterColumns;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(SD_at_OtherFilters;0)
	//ARRAY TEXT(SD_At_otherFilterValues;0)
	//ARRAY TEXT(SD2_at_BookingPerson;0)
	//ARRAY TEXT(SD2_at_BookingStage;0)
	//ARRAY TEXT(SD2_at_BookingStageName;0)
	//ARRAY TEXT(SD2_at_OrderCodes;0)
	//ARRAY TEXT(SD2_at_OrdersPersons;0)
	//ARRAY TEXT(SD2_at_OrderStatus;0)
	//ARRAY TEXT(SD2_at_OrderStatusName;0)
	C_BOOLEAN:C305($_bo_newLevel; $_bo_ValueBOOL)
	C_DATE:C307($_d_ValueDate)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_CharacterPosition; $_l_Column; $_l_ColumnIndex; $_l_ColumnNumber; $_l_Denominator; $_l_KeyColumn; $_l_Nominator; $_l_ReuseLevel; $_l_Size; $_l_SortChangeAlert)
	C_LONGINT:C283($_l_SortDirection; INVOICED_Exclude; INVOICED_ONLY; PDT_l_BookingsCount; SD2_l_ColumnIndex)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_ColumArray; $_Ptr_ColumArray2; $_Ptr_ThisColumnArray)
	C_REAL:C285($_r_ValueNUM; SD2_R_AverageTotal; SD2_R_OrdersCostTotal; SD2_R_OrdersSalesTotal; SD2_R_PageTotal)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_Denominator; $_t_Nominator; $_t_oldMethodName; $_t_OrderStatus; $_t_Person; $_t_Reference; $_t_Stage; $_t_ThisColumnValue; $_t_Value; $_t_ValueSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.oSD2OrdersPersons"; Form event code:C388)
USE SET:C118("BOOKING")
//Use the current filltered selection but unfilter persons

If (SD2_at_OrdersPersons>0)
	$_t_Person:=SD2_at_BookingPerson{SD2_at_OrdersPersons}
	
	
	If (SD_At_otherFilterValues>0)
		LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B"; 3)
		//
		$_l_ColumnNumber:=SD_al_OtherFilterColumns{SD_at_OtherFilters}
		$_l_KeyColumn:=LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Item_Number:27; ->SD2_aptr_LBOrderItemsSetup)
		$_t_Value:=SD_at_OtherFIlterValues{SD_at_OtherFIlterValues}
		$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
		$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
		$_Ptr_ColumArray2:=$_ptr_ArrayofArrayPointers->{$_l_KeyColumn}
		ARRAY LONGINT:C221($_al_OrderItemNos; 0)
		For (SD2_l_ColumnIndex; 1; Size of array:C274($_Ptr_ColumArray->))
			//(Type($ValuesArrayPtr->)=Text array )??|??(Type($ValuesArrayPtr->)=String array )
			Case of 
				: (Type:C295($_Ptr_ColumArray->)=Text array:K8:16) | (Type:C295($_Ptr_ColumArray->)=String array:K8:15)
					If ($_Ptr_ColumArray->{SD2_l_ColumnIndex}=$_t_Value)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ColumArray2->{SD2_l_ColumnIndex})
						
					End if 
				: (Type:C295($_Ptr_ColumArray->)=Real array:K8:17) | (Type:C295($_Ptr_ColumArray->)=Integer array:K8:18) | (Type:C295($_Ptr_ColumArray->)=LongInt array:K8:19)
					$_r_ValueNUM:=$_Ptr_ColumArray->{SD2_l_ColumnIndex}
					$_t_ValueSTR:=String:C10($_r_ValueNUM)
					
					If ($_t_Value=$_t_ValueSTR)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ColumArray2->{SD2_l_ColumnIndex})
						
					End if 
				: (Type:C295($_Ptr_ColumArray->)=Date array:K8:20)
					$_d_ValueDate:=$_Ptr_ColumArray->{SD2_l_ColumnIndex}
					$_t_ValueSTR:=String:C10($_d_ValueDate)
					If ($_t_Value=$_t_ValueSTR)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ColumArray2->{SD2_l_ColumnIndex})
					End if 
				: (Type:C295($_Ptr_ColumArray->)=Boolean array:K8:21)
					$_bo_ValueBOOL:=$_Ptr_ColumArray->{SD2_l_ColumnIndex}
					If ($_bo_ValueBOOL)
						$_t_ValueSTR:="TRUE"
					Else 
						$_t_ValueSTR:="FALSE"
					End if 
					If ($_t_ValueSTR=$_t_Value)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ColumArray2->{SD2_l_ColumnIndex})
					End if 
			End case 
			
		End for 
		//now we have the range of values that match.. by definition these are in the current selection..
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNos)
		CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
	End if 
	
	//``
	//``
	If ("~ALL"#$_t_Person)
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Person:14=$_t_Person)
	End if 
	
	If (SD2_at_BookingStageName>0)
		$_t_Stage:=SD2_at_BookingStage{SD2_at_BookingStageName}
		If ("~ALL"#$_t_Stage)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35=$_t_Stage)
		End if 
	End if 
	CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
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
	Case of 
		: (INVOICED_ONLY=1)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17#"")
		: (INVOICED_Exclude=1)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
	End case 
	
	
	
	$_bo_newLevel:=False:C215
	
	
	If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0)
		LBi_ArrDefFill(->SD2_aptr_LBOrderItemsSetup; ->SD2_lb_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; $_t_Reference; "Items_in"; 22; "Order Items"; "Order Item"; ""; $_bo_newLevel; $_l_ReuseLevel)
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
	LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B"; 3)
	//TRACE
	PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])
	
	SD2_R_OrdersCostTotal:=Sum:C1([ORDER_ITEMS:25]Cost_Price:5)
	SD2_R_OrdersSalesTotal:=Sum:C1([ORDER_ITEMS:25]Sales_Price:4)
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
	Else 
		SD2_R_AverageTotal:=0
	End if 
	CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.oSD2OrdersPersons"; $_t_oldMethodName)
