If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2010 11:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(INV_at_InvoicesTab;0)
	C_BOOLEAN:C305($_bo_ShowP1FIelds)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_oldMethodName; $_t_SubEntityName; vButtDisInv)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Variable1"; Form event code:C388)
If (INV_at_InvoicesTab<Size of array:C274(INV_at_InvoicesTab))
	INV_at_InvoicesTab:=INV_at_InvoicesTab+1
End if 
If (INV_at_InvoicesTab#FORM Get current page:C276)
	Case of 
		: (INV_at_InvoicesTab=2)
			Invoices_InLPDC
			FORM GOTO PAGE:C247(2)
			Invoices_InLPß("P2")
			$_bo_ShowP1FIelds:=False:C215
			Case of 
				: ([INVOICES:39]State:10>=0)
					Case of 
							
						: ([INVOICES:39]State:10=0)
							$_bo_ShowP1FIelds:=False:C215
						: ([INVOICES:39]State:10=1)  //Batched
							
							$_bo_ShowP1FIelds:=False:C215
						: ([INVOICES:39]State:10=2)  //"Posted"
							If ([INVOICES:39]x_DeliveryAddressID:48=0)
								$_bo_ShowP1FIelds:=True:C214
							Else 
								$_bo_ShowP1FIelds:=False:C215
							End if 
						: ([INVOICES:39]State:10=3)
							If ([INVOICES:39]x_DeliveryAddressID:48=0)
								$_bo_ShowP1FIelds:=True:C214
							Else 
								$_bo_ShowP1FIelds:=False:C215
							End if 
					End case 
				Else 
					Case of 
						: ([INVOICES:39]State:10=-3)  //Receipt
							$_bo_ShowP1FIelds:=True:C214
						: ([INVOICES:39]State:10=-1)  //:="Proforma"
							$_bo_ShowP1FIelds:=False:C215
					End case 
			End case 
			If ($_bo_ShowP1FIelds)
				OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oP2Labe@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDeliveryAdLabel@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oStdAddressField"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oStdAddressModButton"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDeliveryDetails"; False:C215)
				//SET VISIBLE(*;"oInvoicePersonLabel";False)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryCoCode"; False:C215)
				//SET VISIBLE(*;"oFieldInvoicePerson";False)
				OBJECT SET VISIBLE:C603(*; "oP1Field@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oP1Label@"; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(*; "oP2Label@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oP2Labe@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oP2Label@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDeliveryAdLabel@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oStdAddressField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oStdAddressModButton"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDeliveryDetails"; True:C214)
				//SET VISIBLE(*;"oInvoicePersonLabel";False)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oFieldDeliveryCoCode"; True:C214)
				//SET VISIBLE(*;"oFieldInvoicePerson";False)
				OBJECT SET VISIBLE:C603(*; "oP1Field@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oP1Label@"; False:C215)
			End if 
		: (INV_at_InvoicesTab=1)
			Invoices_InLPß("P1")
			FORM GOTO PAGE:C247(1)
			OBJECT SET VISIBLE:C603(*; "oP1Field@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oP1Label@"; True:C214)
	End case 
	If (Size of array:C274(INV_aptr_ListboxSetup)>=9)
		$_ptr_ArrayReferences:=INV_aptr_ListboxSetup{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			$_t_SubEntityName:=$_ptr_ArrayReferences->{10}
			Case of 
				: (INV_at_InvoicesTab=1)
					If (INV_al_ViewTableToTable{INV_al_ViewTableToTable}=Table:C252(->[INVOICES:39]))  //if and when we make other  items removable then we can enable other items
						In_ButtChkDis(->vButtDisInv; "Invoice"; $_t_SubEntityName)
					Else 
						In_ButtChkDis(->vButtDisInv; "Invoice")
					End if 
				: (INV_at_InvoicesTab=2)
					In_ButtChkDis(->vButtDisInv; "Invoice")
			End case 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Invoices_In,Bright"; $_t_oldMethodName)
