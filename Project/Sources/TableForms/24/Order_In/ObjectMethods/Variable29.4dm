If (False:C215)
	//object Name: [ORDERS]Orders_In.Variable29
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:18
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
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_Nul; $_l_TableRow)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListBoxSetup)
	C_TEXT:C284($_t_oldMethodName; $_t_SubItemName; vButtDisOrd)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Variable29"; Form event code:C388)
If (ORD_at_OrdersTab#FORM Get current page:C276)
	Case of 
		: (ORD_at_OrdersTab=2)
			Orders_InLPß("P2")
			FORM GOTO PAGE:C247(2)
			//force a redraw
			ORD_SetFormObjects(201)
			
			
			
			
			
			
			
			
		: (ORD_at_OrdersTab=1)
			Orders_InLPß("P1")
			FORM GOTO PAGE:C247(1)
			
	End case 
	If (ORD_at_ViewTabsLabels>0)
		$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
		If ($_l_TableRow>0)
			$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
			If (Size of array:C274($_ptr_ListBoxSetup->)>=9)
				
				$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
				If (Size of array:C274($_ptr_ArrayReferences->)>=10)
					$_t_SubItemName:=$_ptr_ArrayReferences->{10}
					Case of 
						: (ORD_at_OrdersTab=1)
							If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //if and when we make other  items removable then we can enable other items
								In_ButtChkDis(->vButtDisOrd; "Order"; $_t_SubItemName)
							Else 
								In_ButtChkDis(->vButtDisOrd; "Order")
							End if 
						: (ORD_at_OrdersTab=2)
							In_ButtChkDis(->vButtDisOrd; "Order")
					End case 
				End if 
			Else 
				
				
				In_ButtChkDis(->vButtDisOrd; "Order")
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.Variable29"; $_t_oldMethodName)
