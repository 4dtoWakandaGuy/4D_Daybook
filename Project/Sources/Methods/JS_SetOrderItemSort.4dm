//%attributes = {}
If (False:C215)
	//Project Method Name:      JS_SetOrderItemSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	C_LONGINT:C283($_l_Index; $_l_KeyFieldColumn; $_l_RecordIDColumn; $_l_SortFieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JS_SetOrderItemSort")
//NG this method should be called when switching between budget and actual items and when closing a job staghe
If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(JST_aPtr_OrderItemsSetup)))
	If (Size of array:C274(JST_aPtr_OrderItemsSetup)>0)
		$_ptr_ArrayReferences:=JST_aPtr_OrderItemsSetup{9}
		$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
		$_ptr_ArrayFieldPointers:=JST_aPtr_OrderItemsSetup{2}
		$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
		$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
		
		//$_l_SortFieldNumber:=ALAreaSort ($_t_CurrentDefinitionsName;$_l_TableNumber;->JST_aPtr_OrderItemsSetup;False)
		
		$_l_SortFieldNumber:=LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; ->JST_aPtr_OrderItemsSetup; False:C215)  //Changed to use LBi_AreaSort replacement method 20/03/07 -kmw
		
		If ($_l_SortFieldNumber=0) | ($_l_SortFieldNumber=Field:C253(->[ORDER_ITEMS:25]Sort_Order:26))
			FIRST RECORD:C50([ORDER_ITEMS:25])
			$_ptr_ArrayFieldPointers:=JST_aPtr_OrderItemsSetup{2}
			$_Ptr_KeyField:=JST_aPtr_OrderItemsSetup{8}
			$_ptr_ArrayofArrayPointers:=JST_aPtr_OrderItemsSetup{3}
			$_l_KeyFieldColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyFieldColumn}
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				$_l_RecordIDColumn:=Find in array:C230($_Ptr_ThisColumnArray->; [ORDER_ITEMS:25]Item_Number:27)
				If ($_l_RecordIDColumn>0)
					[ORDER_ITEMS:25]Sort_Order:26:=$_l_RecordIDColumn
				Else 
					[ORDER_ITEMS:25]Sort_Order:26:=$_l_Index
				End if 
				DB_SaveRecord(->[ORDER_ITEMS:25])
				NEXT RECORD:C51([ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End for 
		Else 
			For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
				If ([ORDER_ITEMS:25]Sort_Order:26=0)
					[ORDER_ITEMS:25]Sort_Order:26:=$_l_Index
					DB_SaveRecord(->[ORDER_ITEMS:25])
				End if 
				NEXT RECORD:C51([ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End for 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("JS_SetOrderItemSort"; $_t_oldMethodName)