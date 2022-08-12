//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_ISetSortOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 16:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_LONGINT:C283($_l_Column; $_l_FieldNumber; $_l_KeyPosition; $_l_offset; $_l_OrderItemsIndex; $_l_OrderItemsRow; $_l_SortColumn; $_l_SortFieldNumber; $_l_TableNumber; LB_l_CurrentSortColumn)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_ListBoxSetup)
	C_REAL:C285($_l_OrderSortNumber)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_ISetSortOrder")

If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
	$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
	
	If ($_l_OrderItemsRow>0)
		$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
		If (Size of array:C274($_ptr_ListBoxSetup->)>0)
			
			$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
			//FieldsRef=Point to fields columns
			//This gets the column with the sort field in
			$_l_SortColumn:=0
			For ($_l_Column; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
				$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Column})
				If ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Sort_Order:26))
					$_l_SortColumn:=$_l_Column
					$_l_Column:=Size of array:C274($_ptr_ArrayFieldPointers->)
				End if 
			End for 
			
			
			$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
			$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
			
			$_l_SortFieldNumber:=LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup; False:C215)
			If ($_l_SortFieldNumber=0) | ($_l_SortFieldNumber=Field:C253(->[ORDER_ITEMS:25]Sort_Order:26))
				//LB_GetSort(eALOrdII;$CurrentColumn)
				//Stored in the var LB_l_CurrentSortColumn when we click on the area header
				If (Abs:C99(LB_l_CurrentSortColumn)#$_l_SortColumn)
					//although the default sort IS the sort field the columns are sorted by something else
					//so the sort order gets messed up..therefore before we go anyfurther re-sort by the correct column
					//note we do not do this is the sort column is correct because the user MAy had re-ordered things manually)
					$_l_SortFieldNumber:=LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup; True:C214)
				End if 
				FIRST RECORD:C50([ORDER_ITEMS:25])
				$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
				$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
				
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				
				For ($_l_OrderItemsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
					If ([ORDER_ITEMS:25]Sort_Order:26=0)
						
						[ORDER_ITEMS:25]Sort_Order:26:=$_l_OrderItemsIndex
					End if 
					DB_SaveRecord(->[ORDER_ITEMS:25])
					NEXT RECORD:C51([ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				End for 
			Else 
				FIRST RECORD:C50([ORDER_ITEMS:25])
				For ($_l_OrderItemsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
					If ([ORDER_ITEMS:25]Sort_Order:26=0)
						$_l_offset:=0
						Repeat 
							SET QUERY DESTINATION:C396(3; $_l_OrderSortNumber)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_OrderItemsIndex+$_l_offset; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							SET QUERY DESTINATION:C396(0)
							If ($_l_OrderSortNumber=0)
								[ORDER_ITEMS:25]Sort_Order:26:=$_l_OrderItemsIndex+$_l_offset
							Else 
								$_l_offset:=$_l_offset+1
							End if 
							DB_SaveRecord(->[ORDER_ITEMS:25])
						Until ($_l_OrderSortNumber=0)
					End if 
					NEXT RECORD:C51([ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				End for 
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ORD_ISetSortOrder"; $_t_oldMethodName)