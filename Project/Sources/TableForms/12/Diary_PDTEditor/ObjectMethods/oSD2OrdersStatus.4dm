If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.oSD2OrdersStatus
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
	C_BOOLEAN:C305($_bo_NewLevel; $_bo_ValueBOOL)
	C_DATE:C307($_d_ValueDate)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_CharacterPositon; $_l_Column; $_l_ColumnNumber; $_l_KeyColumn; $_l_ReuseLevel; $_l_RowsIndex; $_l_SortChangeAlert; $_l_SortDirection; PDT_l_BookingsCount)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnArray2)
	C_REAL:C285($_r_DenominatorNUM; $_r_NominatorNUM; $_r_Size; $_r_Value; SD2_R_AverageTotal; SD2_R_OrdersCostTotal; SD2_R_OrdersSalesTotal; SD2_R_PageTotal)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_Denominator; $_t_FilterValue; $_t_Nominator; $_t_oldMethodName; $_t_OrderStatus; $_t_Person; $_t_Reference; $_t_Stage; $_t_ThisValue; $_t_ValueSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.oSD2OrdersStatus"; Form event code:C388)
USE SET:C118("BOOKING")
If (SD2_at_OrderStatusName>0)
	
	If (SD_At_otherFilterValues>0)
		LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B")
		//
		$_l_ColumnNumber:=SD_al_OtherFilterColumns{SD_at_OtherFilters}
		$_l_KeyColumn:=LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Item_Number:27; ->SD2_aptr_LBOrderItemsSetup)
		$_t_FilterValue:=SD_at_OtherFIlterValues{SD_at_OtherFIlterValues}
		$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
		$_Ptr_ThisColumnArray2:=$_ptr_ArrayofArrayPointers->{$_l_KeyColumn}
		ARRAY LONGINT:C221($_al_OrderItemNos; 0)
		For ($_l_RowsIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
			//(Type($ValuesArrayPtr->)=Text array ) | (Type($ValuesArrayPtr->)=String array )
			Case of 
				: (Type:C295($_Ptr_ThisColumnArray->)=Text array:K8:16) | (Type:C295($_Ptr_ThisColumnArray->)=String array:K8:15)
					If ($_Ptr_ThisColumnArray->{$_l_RowsIndex}=$_t_FilterValue)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
						
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Real array:K8:17) | (Type:C295($_Ptr_ThisColumnArray->)=Integer array:K8:18) | (Type:C295($_Ptr_ThisColumnArray->)=LongInt array:K8:19)
					$_r_Value:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					$_t_ValueSTR:=String:C10($_r_Value)
					
					If ($_t_FilterValue=$_t_ValueSTR)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
						
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Date array:K8:20)
					$_d_ValueDate:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					$_t_ValueSTR:=String:C10($_d_ValueDate)
					If ($_t_FilterValue=$_t_ValueSTR)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
					End if 
				: (Type:C295($_Ptr_ThisColumnArray->)=Boolean array:K8:21)
					$_bo_ValueBOOL:=$_Ptr_ThisColumnArray->{$_l_RowsIndex}
					If ($_bo_ValueBOOL)
						$_t_ValueSTR:="TRUE"
					Else 
						$_t_ValueSTR:="FALSE"
					End if 
					If ($_t_ValueSTR=$_t_FilterValue)
						APPEND TO ARRAY:C911($_al_OrderItemNos; $_Ptr_ThisColumnArray2->{$_l_RowsIndex})
					End if 
			End case 
			
		End for 
		//now we have the range of values that match.. by definition these are in the current selection..
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNos)
		CREATE SET:C116([ORDER_ITEMS:25]; "SelectedBookings")
	End if 
	
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
		LBi_ArrDefFill(->SD2_aptr_LBOrderItemsSetup; ->SD2_lb_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; $_t_Reference; "Items_in"; 22; "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
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
			$_l_CharacterPositon:=Position:C15("/"; $_t_ThisValue)
			If ($_l_CharacterPositon=0)
				$_r_Size:=Num:C11($_Ptr_ThisColumnArray->{$_l_RowsIndex})
			Else 
				$_t_Denominator:=Substring:C12($_t_ThisValue; 1; $_l_CharacterPositon-1)
				$_t_Nominator:=Substring:C12($_t_ThisValue; $_l_CharacterPositon+1)
				$_r_DenominatorNUM:=Num:C11($_t_Denominator)
				$_r_NominatorNUM:=Num:C11($_t_Nominator)
				$_r_Size:=$_r_DenominatorNUM/$_r_NominatorNUM
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
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.oSD2OrdersStatus"; $_t_oldMethodName)
