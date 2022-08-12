//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Split
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/11/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Reselect; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_OrderItemsRow; $_l_SortFieldNumber; $_l_TableNumber; vAB)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayReferences; $_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_HighlightSetName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Split")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		Menu_Record("OrderI Split"; "Split an Item")
		
		If (Gen_PPChkStSing(->[ORDERS:24]State:15; 6))
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
			If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
				$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				ORD_ISetSortOrder
				If ($_l_OrderItemsRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
					$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
					$_t_HighlightSetName:=$_ptr_HighlightSet->
					$_bo_Reselect:=False:C215
					If ($_t_HighlightSetName#"")
						If (Records in set:C195($_t_HighlightSetName)>0)
							USE SET:C118($_t_HighlightSetName)
							CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
							$_bo_Reselect:=True:C214
						End if 
					End if 
				Else 
					$_bo_Reselect:=False:C215
				End if 
				
			Else 
				$_bo_Reselect:=False:C215
			End if 
			
			
			
			If (Records in selection:C76([ORDER_ITEMS:25])>0)
				If (Records in selection:C76([ORDER_ITEMS:25])=1)
					vQuantity:=Gen_Round(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2; 6)
					If (vQuantity>0)
						vQuantity:=Gen_Round(Num:C11(Gen_Request("Quantity to transfer to the new Item:"; String:C10(vQuantity))); 2; 6)
						If (OK=1)
							OrderI_Split2
							If (OK=1)
								Orders_InLPOI(vAB)
								Orders_InLPß("S1")
								$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
								$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
								$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
								
								$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
								$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
								$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
								$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
								LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup)
								//LBi_ArrUpd2 (->ORD_aPtr_OrderItemsSetup)
								
							End if 
						End if 
					Else 
						Gen_Alert("There is no unallocated stock on this item!")
						
					End if 
				Else 
					Gen_Alert("Please highlight a single line to Split")
				End if 
			Else 
				Gen_Alert("Please highlight a single line to Split")
			End if 
			GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentOISelection")
			REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
			USE NAMED SELECTION:C332("$CurrentOISelection")
			HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			
		End if 
		
		
		//$RevertSetting:=ORD_SetSelectable ($RevertSetting)
	Else 
		Gen_Alert("This function can only be used to split an order item")
	End if 
Else 
	Gen_Alert("This function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("OrderI Split"; $_t_oldMethodName)
