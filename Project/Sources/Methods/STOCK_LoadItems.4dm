//%attributes = {}

If (False:C215)
	//Project Method Name:      STOCK_LoadItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY DATE:C224($_ad_allDeliveryDates; 0)
	//ARRAY DATE(STK_ad_DeliveryDates;0)
	//ARRAY LONGINT(AL_al_ModeStock;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_allDeliveryRefs; 0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	C_BOOLEAN:C305($_bo_NewLevel; $_bo_NoData; $_bo_ReadOnly; LBI_bo_RowDragged; STK_bo_ConsolidatedView; STK_bo_UseDeliveryReference; STK_but_WriteDown)
	C_LONGINT:C283($_l_ColumnPosition; $_l_CompanyCodeCOlumn; $_l_CompanyCodeColumnNumber; $_l_CompanyNameColumn; $_l_CompanyNameColumnNumber; $_l_DeliveryReferenceRow; $_l_FilledSIze; $_l_Index; $_l_IsUnique; $_l_LocationColumnNumber; $_l_LocationNameColumn)
	C_LONGINT:C283($_l_LocationsColumn; $_l_MovedQuantityColumn; $_l_OrderCodeColumn; $_l_OrderItemColumn; $_l_QuantityColumn; $_l_RecordsInSelection; $_l_StockCalledOffColumn; $_l_StockRemainingColumn; $_l_ThisMovementItemID; STOCK_l_Context; vALLevels)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_CompanyCodeArray; $_ptr_CompanyNameArray; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_ButtonPrefix; $_t_ButtonPrefixBase; $_t_ColumnPrefix; $_t_HeaderPrefix; $_t_InventoryLabel; $_t_LevelPrefix; $_t_ObjectPrefix; $_t_oldMethodName; $_t_StockMovementCode; $_t_SubItemName; $_t_ThisColumnArrayName)
	C_TEXT:C284($1; STK_t_DeliveryReference; STK_t_ReviewExpectedQuantities; vButtDisMov)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("STOCK_LoadItems")


//NG new method May 2004
//This new method load stock items into an area list area

$_t_oldMethodName:=ERR_MethodTracker("STOCK_LoadItems")
If (Count parameters:C259>=1)
	STK_bo_ConsolidatedView:=False:C215
	//AL_RemoveArrays (STK_PowerviewITEMS;1;256)`
	ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
	LBI_bo_RowDragged:=False:C215
	
	If ($1#"")
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		If (STOCK_l_Context<0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		End if 
		//the following lines to ensure there are no ID clashes
		$_t_StockMovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
		CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "ProblemIDs")
		For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			$_l_ThisMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			SET QUERY DESTINATION:C396(3; $_l_IsUnique)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_ThisMovementItemID)
			If ($_l_IsUnique>1)
				ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "ProblemIDs")
			End if 
			SET QUERY DESTINATION:C396(0)
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		If (Records in set:C195("ProblemIDs")>0)
			$_bo_ReadOnly:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			USE SET:C118("ProblemIDs")
			For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#$_t_StockMovementCode)
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			If ($_bo_ReadOnly)
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		End if 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		If (STOCK_l_Context<0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			If (STK_bo_UseDeliveryReference)  // if search by delivery reference then when opening the movement only show items with the reference
				If (STK_t_DeliveryReference#"")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_t_DeliveryReference)
				End if 
			End if 
			
		End if   //``
		$_bo_ReadOnly:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])
		
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
				If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#-([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
					
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
				End if 
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		If ($_bo_ReadOnly)
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		End if 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		
		
		If (STOCK_l_Context<0)
			
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			If (STK_bo_UseDeliveryReference)  // if search by delivery reference then when opening the movement only show items with the reference
				If (STK_t_DeliveryReference#"")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_t_DeliveryReference)
				End if 
			End if 
		Else 
			[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
		End if 
	Else 
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		
		[STOCK_MOVEMENTS:40]Total_Cost:8:=0
	End if 
	
	$_bo_ReadOnly:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])
	
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	//APPLY TO SELECTION([STOCK ITEMS];STK_UpdateCalledOffQuantity )
	
	STK_t_ReviewExpectedQuantities:="Review Expected Delivery Quantities ..."
	ARRAY TEXT:C222(STK_at_DeliveryReferences; 0)
	OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; False:C215)
	OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; False:C215)
	ARRAY DATE:C224(STK_ad_DeliveryDates; 0)
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; STK_at_DeliveryReferences)
	$_l_DeliveryReferenceRow:=Find in array:C230(STK_at_DeliveryReferences; "")
	If ($_l_DeliveryReferenceRow>0)
		DELETE FROM ARRAY:C228(STK_at_DeliveryReferences; $_l_DeliveryReferenceRow)
	End if 
	SORT ARRAY:C229(STK_at_DeliveryReferences)
	
	ARRAY DATE:C224(STK_ad_DeliveryDates; Size of array:C274(STK_at_DeliveryReferences))
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_at_allDeliveryRefs; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; $_ad_allDeliveryDates)
	For ($_l_Index; 1; Size of array:C274(STK_at_DeliveryReferences))
		$_l_DeliveryReferenceRow:=Find in array:C230($_at_allDeliveryRefs; STK_at_DeliveryReferences{$_l_Index})
		If ($_l_DeliveryReferenceRow>0)  //It should be
			STK_ad_DeliveryDates{$_l_Index}:=$_ad_allDeliveryDates{$_l_DeliveryReferenceRow}
			//Dont forget to append this array if a delivery reference is entered
		End if 
	End for 
	If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
		If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
		End if 
	End if 
	If (Size of array:C274(STK_at_DeliveryReferences)>0) & ([MOVEMENT_TYPES:60]Purch_Ord_Type:11) & (STOCK_l_Context>=0)
		
		OBJECT SET VISIBLE:C603(STK_t_ReviewExpectedQuantities; True:C214)
		OBJECT SET VISIBLE:C603(STK_at_DeliveryReferences; True:C214)
	End if 
	
	
	If (Size of array:C274(STK_aptr_ItemPreferences)=0) & (vALLevels>0)
		$_bo_NewLevel:=True:C214
	Else 
		$_bo_NewLevel:=False:C215
	End if 
	$_ptr_ListboxSetup:=->STK_aptr_ItemPreferences
	$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	
	//C_LONGINT(STK_PowerviewITEMS)
	//ORD_aPtr_OrderItemsSetup
	//"0"+String(2701+Abs(STOCK_l_Context))
	If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
		If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
		End if 
	Else 
		REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)
	End if 
	Case of 
		: ([STOCK_MOVEMENTS:40]Movement_Type:6="")
			
			//ALArrDefFill ($_ptr_ListboxSetup;->STK_PowerviewITEMS;->[STOCK ITEMS];->[STOCK ITEMS]x_ID;"Green";"ALModStockMovItem";"211111126";"Stock_in";"02701";◊User;"";"Items";"Item";->[STOCK MOVEMENTS];->[STOCK MOVEMENTS]Movement Code)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 1; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
			
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 2; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 3; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]Alloc_Type:10)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 4; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]Delivery_Type:12)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 5; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForAnalysisMove:30)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 6; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForLayerMove:31)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 7; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForLocationMove:29)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 8; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForCurrencyMove:32)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 9; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForValueChange:28)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 10; "Items"; "Item"; ""; $_bo_NewLevel)
		: ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 11; "Items"; "Item"; ""; $_bo_NewLevel)
			
		Else 
			//the type is not known.
			//ALArrDefFill ($_ptr_ListboxSetup;->STK_PowerviewITEMS;->[STOCK ITEMS];->[STOCK ITEMS]x_ID;"Green";"ALModStockMovItem";"211111126";"Stock_in";"02701";◊User;"";"Items";"Item";->[STOCK MOVEMENTS];->[STOCK MOVEMENTS]Movement Code)
			LBi_ArrDefFill($_ptr_ListboxSetup; ->STK_LB_StockItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "211111126"; "Stock_in"; 1; "Items"; "Item"; ""; $_bo_NewLevel)
			
	End case 
	$_ptr_ListboxSetup:=->STK_aptr_ItemPreferences
	LBi_LoadSetup($_ptr_ListboxSetup; "B")
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
	$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
	$_l_LocationsColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Location:7)
	$_l_LocationNameColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[LOCATIONS:61]Location_Name:2)
	$_l_StockCalledOffColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
	$_l_StockRemainingColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
	$_l_OrderCodeColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
	$_l_OrderItemColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
	$_l_CompanyCodeCOlumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Company_To:2)
	$_l_CompanyNameColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[COMPANIES:2]Company_Name:2)
	$_l_QuantityColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	$_l_MovedQuantityColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
	
	If (Size of array:C274($_ptr_ArrayOfArrayNames->)>0)
		$_t_ThisColumnArrayName:=$_ptr_ArrayOfArrayNames->{1}
		$_t_LevelPrefix:=Substring:C12($_t_ThisColumnArrayName; 1; 3)
		Case of 
			: ($_t_LevelPrefix="a01")
				$_t_ObjectPrefix:="o1"
				$_t_ButtonPrefixBase:="o1_L"
			: ($_t_LevelPrefix="a02")
				$_t_ObjectPrefix:="o2"
				$_t_ButtonPrefixBase:="o2_L"
				
			: ($_t_LevelPrefix="a03")
				
				$_t_ObjectPrefix:="o3"
				$_t_ButtonPrefixBase:="o3_L"
			: ($_t_LevelPrefix="a04")
				
				$_t_ObjectPrefix:="o4"
				$_t_ButtonPrefixBase:="o4_L"
			: ($_t_LevelPrefix="a05")
				$_t_ObjectPrefix:="o5"
				$_t_ButtonPrefixBase:="o5_L"
			: ($_t_LevelPrefix="a06")
				$_t_ObjectPrefix:="o6"
				$_t_ButtonPrefixBase:="o6_L"
		End case 
	Else 
		$_t_ObjectPrefix:="o1"
		$_t_ButtonPrefixBase:="o1_L"
	End if 
	$_t_ColumnPrefix:=$_t_ObjectPrefix+"_COL"
	$_t_HeaderPrefix:=$_t_ObjectPrefix+"_HED"
	$_t_ButtonPrefix:=$_t_ButtonPrefixBase+"_BUT"
	
	$_l_ColumnPosition:=0
	$_l_CompanyCodeColumnNumber:=0
	If ($_l_LocationsColumn>0) | ($_l_LocationNameColumn>0)
		If (Records in table:C83([LOCATIONS:61])=0)
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			
			
			If ($_l_LocationsColumn>0)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_LocationsColumn}
			End if 
			If ($_l_LocationNameColumn>0)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_LocationNameColumn}
			End if 
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			
			LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			If ($_l_LocationsColumn>0)
				$_l_LocationColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
				LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_LocationColumnNumber; 0)
			End if 
			If ($_l_LocationNameColumn>0)
				$_l_ColumnPosition:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
				LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_ColumnPosition; 0)
			End if 
			
		Else 
			If ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!)
				$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
				If ($_l_LocationsColumn>0)
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_LocationsColumn}
				End if 
				If ($_l_LocationNameColumn>0)
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_LocationNameColumn}
				End if 
				LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				If ($_l_LocationsColumn>0)
					$_l_LocationColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
				End if 
				If ($_l_LocationNameColumn>0)
					$_l_ColumnPosition:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
				End if 
				If ($_l_LocationColumnNumber>0)
					$_bo_NoData:=True:C214
					For ($_l_FilledSIze; 1; Size of array:C274($_Ptr_ThisColumnArray->))
						If ($_Ptr_ThisColumnArray->{$_l_FilledSIze}#"")
							$_bo_NoData:=False:C215
							$_l_FilledSIze:=Size of array:C274($_Ptr_ThisColumnArray->)
						End if 
					End for 
					If ($_bo_NoData)
						LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_LocationColumnNumber; 0)
					End if 
				End if 
				If ($_l_ColumnPosition>0)
					$_bo_NoData:=True:C214
					For ($_l_FilledSIze; 1; Size of array:C274($_Ptr_ThisColumnArray->))
						If ($_Ptr_ThisColumnArray->{$_l_FilledSIze}#"")
							$_bo_NoData:=False:C215
							$_l_FilledSIze:=Size of array:C274($_Ptr_ThisColumnArray->)
						End if 
					End for 
					If ($_bo_NoData)
						LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_ColumnPosition; 0)
					End if 
				End if 
				If ($_l_StockRemainingColumn>0)
				End if 
			End if 
			
			
		End if 
	End if 
	
	If ($_l_StockCalledOffColumn>0)
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		If ($_l_StockCalledOffColumn>0)
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_StockCalledOffColumn}
		End if 
		If ($_l_StockRemainingColumn>0)
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_StockRemainingColumn}
		End if 
		
		LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		If ($_l_StockCalledOffColumn>0)
			$_l_LocationColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
		End if 
		$_l_ColumnPosition:=0
		$_l_CompanyCodeColumnNumber:=0
		If ($_l_StockRemainingColumn>0)
			$_l_ColumnPosition:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
		End if 
		
		If ($_l_LocationColumnNumber>0)
			$_bo_NoData:=True:C214
			If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
				//CAN BE NOTHING RECEIVED
			Else 
				$_bo_NoData:=False:C215  //Request to show this always-will put a preference in as it seems mad to me
				For ($_l_FilledSIze; 1; Size of array:C274($_Ptr_ThisColumnArray->))
					If ($_Ptr_ThisColumnArray->{$_l_FilledSIze}#0)
						$_bo_NoData:=False:C215
						$_l_FilledSIze:=Size of array:C274($_Ptr_ThisColumnArray->)
					End if 
				End for 
			End if 
			If ($_bo_NoData)
				LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_LocationColumnNumber; 0)
				If ($_l_ColumnPosition>0)
					LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_ColumnPosition; 0)
				End if 
				
			End if 
			
			
		End if 
		
	End if 
	
	
	If ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!)
		If ($_l_OrderCodeColumn>0) | ($_l_OrderItemColumn>0)
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			If ($_l_OrderCodeColumn>0)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_OrderCodeColumn}
			End if 
			If ($_l_OrderItemColumn>0)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_OrderItemColumn}
			End if 
			If ($_l_CompanyNameColumn>0)
				$_ptr_CompanyNameArray:=$_ptr_ArrayofArrayPointers->{$_l_CompanyNameColumn}
			End if 
			If ($_l_CompanyCodeCOlumn>0)
				$_Ptr_CompanyCodeArray:=$_ptr_ArrayofArrayPointers->{$_l_CompanyCodeCOlumn}
			End if 
			LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			If ($_l_OrderCodeColumn>0)
				$_l_LocationColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
			End if 
			$_l_ColumnPosition:=0
			$_l_CompanyCodeColumnNumber:=0
			$_l_CompanyNameColumnNumber:=0
			If ($_l_OrderItemColumn>0)
				$_l_ColumnPosition:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
			End if 
			If ($_l_CompanyNameColumn>0)
				If ($_l_CompanyNameColumn>$_l_CompanyCodeCOlumn)
					$_l_CompanyCodeColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_ptr_CompanyNameArray)
				End if 
			End if 
			If ($_l_CompanyCodeCOlumn>0)
				$_l_CompanyNameColumnNumber:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_CompanyCodeArray)
			End if 
			
			If ($_l_LocationColumnNumber>0)
				$_bo_NoData:=True:C214
				For ($_l_FilledSIze; 1; Size of array:C274($_Ptr_ThisColumnArray->))
					If ($_Ptr_ThisColumnArray->{$_l_FilledSIze}#"")
						$_bo_NoData:=False:C215
						$_l_FilledSIze:=Size of array:C274($_Ptr_ThisColumnArray->)
					End if 
				End for 
				
				If ($_bo_NoData)
					LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_LocationColumnNumber; 0)
					If ($_l_ColumnPosition>0)
						LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_ColumnPosition; 0)
					End if 
					If ($_l_CompanyCodeColumnNumber>0)
						LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_CompanyCodeColumnNumber; 0)
					End if 
					If ($_l_CompanyNameColumnNumber>0)
						LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_CompanyNameColumnNumber; 0)
					End if 
				End if 
			Else 
				If ($_l_ColumnPosition>0)
					$_bo_NoData:=True:C214
					For ($_l_FilledSIze; 1; Size of array:C274($_Ptr_ThisColumnArray->))
						If ($_Ptr_ThisColumnArray->{$_l_FilledSIze}#0)
							$_bo_NoData:=False:C215
							$_l_FilledSIze:=Size of array:C274($_Ptr_ThisColumnArray->)
						End if 
					End for 
				End if 
				
			End if 
			
		End if 
		If ($_l_QuantityColumn>0) | ($_l_MovedQuantityColumn>0)
			If ($_l_QuantityColumn>0)
				LB_SetEnterable(->STK_LB_StockItems; False:C215; $_l_QuantityColumn)
				
			End if 
			If ($_l_MovedQuantityColumn>0)
				LB_SetEnterable(->STK_LB_StockItems; False:C215; $_l_MovedQuantityColumn)
			End if 
		End if 
	Else 
		LISTBOX GET ARRAYS:C832(STK_LB_StockItems; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		If ($_l_StockRemainingColumn>0)
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_StockRemainingColumn}
			
			$_l_ColumnPosition:=Find in array:C230($_aptr_ColumnVariables; $_Ptr_ThisColumnArray)
		End if 
		If ($_l_ColumnPosition>0)
			LB_SetColumnWidths(->STK_LB_StockItems; $_t_ObjectPrefix; $_l_ColumnPosition; 0)
		End if 
	End if 
	If ($_l_StockRemainingColumn>0)
		LB_SetEnterable(->STK_LB_StockItems; False:C215; $_l_StockRemainingColumn)
	End if 
	If (Size of array:C274($_ptr_ListboxSetup->)>=9)
		$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			In_ButtChkDis(->vButtDisMov; "Stock Movement"; $_t_SubItemName)
		End if 
	End if 
	
	If ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!) | (STOCK_l_Context<0)
		
		AL_al_ModeStock:=1
		SM_at_ModeStockMov:=1
		LBi_EditListLay($_ptr_ListboxSetup; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock; True:C214)
		AL_al_ModeStock{1}:=-1
		SM_at_ModeStockMov{1}:="No Edit"  //This prevents it being changed to edit
		
	End if 
	LBi_EditListLay($_ptr_ListboxSetup; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock)
	If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11#True:C214)
		DB_MenuAction("Functions"; "Set Expected Receipt on Selected"; 3; "")
		DB_MenuAction("Functions"; "Set expected receipt on remaining Lines"; 3; "")
		DB_MenuAction("Functions"; "Receive Stock"; 3; "")
		DB_MenuAction("Functions"; "Cancel Remainder"; 3; "")
	Else 
		DB_MenuAction("Functions"; "Set Expected Receipt on Selected"; 2; "")
		DB_MenuAction("Functions"; "Set expected receipt on remaining Lines"; 2; "")
		DB_MenuAction("Functions"; "Receive Stock"; 2; "")
		DB_MenuAction("Functions"; "Cancel Remainder"; 2; "")
	End if 
	
	DB_MenuAction("Functions"; "Copy Current Stock"; 1; Term_StoWT("Copy Current Stock"))
	$_t_InventoryLabel:=Term_StoWT("Copy Current Stock")
	
	If ([MOVEMENT_TYPES:60]UseForValueChange:28=True:C214) | ([MOVEMENT_TYPES:60]UseForCurrencyMove:32=True:C214) | ([MOVEMENT_TYPES:60]UseForAnalysisMove:30=True:C214) | ([MOVEMENT_TYPES:60]UseForLayerMove:31=True:C214) | ([MOVEMENT_TYPES:60]UseForLocationMove:29=True:C214)
		If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
			
			
			If ([MOVEMENT_TYPES:60]Serial_Unique:19)
				DB_MenuAction("Functions"; $_t_InventoryLabel; 3; "")
			Else 
				DB_MenuAction("Functions"; $_t_InventoryLabel; 2; "")
			End if 
			OBJECT SET VISIBLE:C603(STK_but_WriteDown; True:C214)
			Case of 
				: ([MOVEMENT_TYPES:60]UseForValueChange:28=True:C214)
					OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Value")
					
				: ([MOVEMENT_TYPES:60]UseForCurrencyMove:32=True:C214)
					OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Currency")
				: ([MOVEMENT_TYPES:60]UseForAnalysisMove:30=True:C214)
					OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Analysis")
				: ([MOVEMENT_TYPES:60]UseForLayerMove:31=True:C214)
					OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Layer")
				: ([MOVEMENT_TYPES:60]UseForLocationMove:29=True:C214)
					OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Location")
			End case 
		Else 
			DB_MenuAction("Functions"; $_t_InventoryLabel; 3; "")
		End if 
		DB_MenuAction("Functions"; "Copy previous Movt"; 3; "")
		
	Else 
		DB_MenuAction("Functions"; $_t_InventoryLabel; 3; "")
	End if 
	
	
End if 
ERR_MethodTrackerReturn("STOCK_LoadItems"; $_t_oldMethodName)