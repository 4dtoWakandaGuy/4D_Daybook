If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_in.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PUR_at_PurchasesTab;0)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_oldMethodName; $_t_SubItemName; vButtDisPI)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_in.Variable2"; Form event code:C388)
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
								In_ButtChkDis(->vButtDisPI; "Purchase")
							: (PUR_at_PurchasesTab=1)
								
								If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
									In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
								Else 
									In_ButtChkDis(->vButtDisPI; "Purchase")
								End if 
						End case 
					End if 
					
				End if 
			: (PUR_at_PurchasesTab=1)
				
				FORM GOTO PAGE:C247(1)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Purchases_In13,PUR_at_PurchasesTab"; $_t_oldMethodName)
