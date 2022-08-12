//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PurchasesTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/03/2011 13:05 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY TEXT(PUR_at_PurchasesTab;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_Number)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $_t_SubItemName; vButtDisPI)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PurchasesTab")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	If ($_l_Number>0)
		PUR_at_PurchasesTab:=$_l_Number
	End if 
End if 

If (PUR_at_PurchasesTab>0)
	If (PUR_at_PurchasesTab#FORM Get current page:C276)
		Case of 
			: (PUR_at_PurchasesTab=2)
				
				FORM GOTO PAGE:C247(2)
				If (Size of array:C274(PUR_aPtr_LBItemsSetup)>=9)
					
					$_ptr_ArrayReferences:=PUR_aPtr_LBItemsSetup{9}
					If (Size of array:C274($_ptr_ArrayReferences->)>=10)
						$_t_SubItemName:=$_ptr_ArrayReferences->{10}
						Case of 
							: (PUR_at_PurchasesTab=2)
								//DB_SetFormButtonOptions (vButtDisPI)
								In_ButtChkDis(->vButtDisPI; "Purchase")
							: (PUR_at_PurchasesTab=1)
								
								If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
									In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
								Else 
									In_ButtChkDis(->vButtDisPI; "Purchase")
								End if 
						End case 
					Else 
						In_ButtChkDis(->vButtDisPI)
					End if 
				Else 
					In_ButtChkDis(->vButtDisPI)
					
				End if 
			: (PUR_at_PurchasesTab=1)
				
				FORM GOTO PAGE:C247(1)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DB_PurchasesTab"; $_t_oldMethodName)