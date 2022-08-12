//%attributes = {}
If (False:C215)
	//Project Method Name:      Text_ExpandL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2010 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	C_BOOLEAN:C305($n)
	C_LONGINT:C283(eALInvII; eALOrdII; vALLevels)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Text_ExpandL")

//If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table(->[ORDER ITEMS]))
Menu_Record("Text_ExpandL"; "Expand Text")
$_ptr_FocusObject:=Focus object:C278
If (Type:C295($_ptr_FocusObject->)=2)
	Text_Expand($_ptr_FocusObject; "")
Else 
	$n:=False:C215
	Case of 
		: ($_ptr_FocusObject=->ORD_r_SubSelection)
			//TRACE
			If (vALLevels>0)
				$_ptr_FocusObject:=->[ORDER_ITEMS:25]Description:44
				Text_Expand($_ptr_FocusObject; "")
			Else 
				$_ptr_FocusObject:=->[ORDER_ITEMS:25]Description:44
				Text_Expand($_ptr_FocusObject; "")
				GOTO OBJECT:C206([ORDERS:24]Your_Order_Number:10)
			End if 
		: ($_ptr_FocusObject=(->eALOrdII))
			//  If (Field($_ptr_FocusObject)=44)
			If (vALLevels>0)
				If (LBi_FindLine(->ORD_aPtr_OrderItemsSetup))
					$_ptr_FocusObject:=->[ORDER_ITEMS:25]Description:44
					Text_Expand($_ptr_FocusObject; "")
					LBi_ModUpifAl(->ORD_aPtr_OrderItemsSetup)
				End if 
			Else 
				$_ptr_FocusObject:=->[ORDER_ITEMS:25]Description:44
				Text_Expand($_ptr_FocusObject; "")
				GOTO OBJECT:C206([ORDERS:24]Your_Order_Number:10)
			End if 
			//  Else
			//`   If ((Field($_ptr_FocusObject)=12) & (vProcaMod=9) & (Layout page=1))
			//    $_ptr_FocusObject:=»[DIARY]Action Desc
			//    Text_Expand ($_ptr_FocusObject;"")
			//    GOTO AREA([ORDERS]Your Order No)
			//  Else
			//    $n:=True
			//   End if
			//  End if
		: ($_ptr_FocusObject=(->eALInvII))
			If (vALLevels>0)
				If (LBi_FindLine(->INV_aptr_ListboxSetup))
					$_ptr_FocusObject:=->[INVOICES_ITEMS:161]Description:13
					Text_Expand($_ptr_FocusObject; "")
					LBi_ModUpifAl(->INV_aptr_ListboxSetup)
				End if 
			Else 
				$_ptr_FocusObject:=->[INVOICES_ITEMS:161]Description:13
				Text_Expand($_ptr_FocusObject; "")
				GOTO OBJECT:C206([INVOICES:39]Your_Order_Number:14)
			End if 
		Else 
			$n:=True:C214
	End case 
	If ($n)
		Gen_Alert("This Function can only be used for Text fields"; "")
	End if 
End if 
//Else
//Gen_Alert ("This function can only be used when viewing order items")

//End if
ERR_MethodTrackerReturn("Text_ExpandL"; $_t_oldMethodName)