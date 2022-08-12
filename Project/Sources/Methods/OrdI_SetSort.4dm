//%attributes = {}

If (False:C215)
	//Project Method Name:      OrdI_SetSort
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
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283($_l_index; $_l_KeyPosition; $_l_SortFieldNumber; $_l_TableNumber; $_l_TableRow)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OrdI_SetSort")



//This method sorts the order items on screen based on the current viewed sequence
//NG April 2007
$_t_oldMethodName:=ERR_MethodTracker("OrdI_SetSort")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
		If ($_l_TableRow>0)
			$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
			If (Size of array:C274($_ptr_ListBoxSetup->)>0)
				$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
				$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
				$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				If (False:C215)
					FIRST RECORD:C50([ORDER_ITEMS:25])
					For ($_l_index; 1; Records in selection:C76([ORDER_ITEMS:25]))
						$_l_TableRow:=Find in array:C230($_Ptr_ThisColumnArray->; [ORDER_ITEMS:25]Item_Number:27)
						If ($_l_TableRow>0)
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_TableRow
						Else 
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_index
						End if 
						DB_SaveRecord(->[ORDER_ITEMS:25])
						NEXT RECORD:C51([ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End for 
				Else 
					FIRST RECORD:C50([ORDER_ITEMS:25])
					For ($_l_index; 1; Records in selection:C76([ORDER_ITEMS:25]))
						//$_l_TableRow:=Find in array($_Ptr_ThisColumnArray->;[ORDER ITEMS]Item Number)
						//If ([ORDER_ITEMS]Sort_Order=0)
						[ORDER_ITEMS:25]Sort_Order:26:=$_l_index
						//End if
						DB_SaveRecord(->[ORDER_ITEMS:25])
						NEXT RECORD:C51([ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End for 
				End if 
				//Orders_InLPß ("P1") here we only need to refresh the seleciton of order items
				$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
				$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
				$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
				//ALAreaSort
				//If (False)
				LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup)
				
				
			End if 
		End if 
	Else 
		Gen_Alert("This function can only be used with  order items")
	End if 
End if 
ERR_MethodTrackerReturn("OrdI_SetSort"; $_t_oldMethodName)
