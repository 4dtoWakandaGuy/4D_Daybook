//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ItemNext
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2010 23:17
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
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_lineFound; $_bo_Reselect; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_FindOrdersRow; $_l_OrderLineItemNumber; vAB)
	C_POINTER:C301($_ptr_HighligtSet; $_ptr_LBArea; $_ptr_PointersArray)
	C_TEXT:C284($_t_HightlightName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ItemNext")

If (Not:C34(ORD_bo_IsRevision))
	
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
		If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
			Menu_Record("Orders_ItemNext"; "Show Next Level Items")
			//$RevertSetting:=ORD_SetSelectable (1)
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			//Ng May 2006 replaced this line AlpRefs4Sort (->ORD_aPtr_OrderItemsSetup)
			If (DB_t_CurrentFormUsage#"None")
				$_l_FindOrdersRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_FindOrdersRow>0)
					$_ptr_PointersArray:=ORD_aptr_SubAreaPointers{$_l_FindOrdersRow}
					$_ptr_HighligtSet:=$_ptr_PointersArray->{20}
					$_t_HightlightName:=$_ptr_HighligtSet->
					$_bo_Reselect:=False:C215
					If ($_t_HightlightName#"")
						If (Records in set:C195($_t_HightlightName)>0)
							USE SET:C118($_t_HightlightName)
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
			ORD_ISetSortOrder
			USE NAMED SELECTION:C332("$Temp")
			If ($_bo_Reselect)
				HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
			End if 
			
			
			$_bo_lineFound:=(LBi_FindIfAL($_ptr_PointersArray))
			If (Records in selection:C76([ORDER_ITEMS:25])>1)
				$_l_OrderLineItemNumber:=[ORDER_ITEMS:25]Item_Number:27
			Else 
				$_l_OrderLineItemNumber:=0
			End if 
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$OI")
			OrderI_LevelCr
			Orders_InLPOI(vAB+1)
			If ($_l_OrderLineItemNumber#0)
				Gen_Confirm("Do you want to show the next level items for the current item, or for all items?"; "Current"; "All")
				If (OK=1)
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$_l_OrderLineItemNumber)
					ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
				End if 
			End if 
			If (Records in selection:C76([ORDER_ITEMS:25])=0)
				Gen_Alert("No Items were found or are required at Level "+String:C10(vAB); "Cancel")
				USE NAMED SELECTION:C332("$OI")
				vAB:=vAB-1
			Else 
				Orders_InLPß("S1")
				//Do not need to reselt items here
			End if 
			CLEAR NAMED SELECTION:C333("$OI")
			//$RevertSetting:=ORD_SetSelectable ($RevertSetting)
		Else 
			Gen_Alert("This function can only be used when viewing order items")
		End if 
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_ItemNext"; $_t_oldMethodName)