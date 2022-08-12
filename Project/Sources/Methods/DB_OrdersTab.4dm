//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OrdersTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/03/2011 11:33 v7.0.0/B45
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
	C_LONGINT:C283($_l_Number; $_l_TableRow)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListBoxSetup)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $_t_SubItemName; vButtDisOrd)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_OrdersTab")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	If ($_l_Number>0)
		ORD_at_OrdersTab:=$_l_Number
	End if 
End if 
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
	//TRACE
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
ERR_MethodTrackerReturn("DB_OrdersTab"; $_t_oldMethodName)