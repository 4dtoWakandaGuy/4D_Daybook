//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_TransfertoPI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: PO_TransfertoPI
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY LONGINT(PI_al_AlreadyCopied;0)
	//ARRAY LONGINT(PI_al_CopyItemNo;0)
	//ARRAY LONGINT(PI_al_dCopyItem;0)
	//ARRAY LONGINT(PI_al_DisplayItem;0)
	//ARRAY LONGINT(PI_al_dMarkItem;0)
	//ARRAY LONGINT(PI_al_ItemNumbers;0)
	//ARRAY LONGINT(PI_al_MarkItemNumbers;0)
	//ARRAY LONGINT(PO_al_TransferItemIDs;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY REAL(PI_ar_dProductQTY;0)
	//ARRAY TEXT(PI_at_DProductCode;0)
	//ARRAY TEXT(PI_at_dProductDes;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Open; $_bo_PeriodSet; $_bo_Restart; $_bo_Select)
	C_DATE:C307($_d_EnterInvoiceDate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Element; $_l_FindRow; $_l_IDColumnNumber; $_l_Index; $_l_ModuleAccess; $_l_PeriodID; $_l_PIProcessID; $_l_RecordsinSelection; MOD_l_CurrentModuleAccess; PI_l_Copy)
	C_LONGINT:C283(SD_l_ProcID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_ptr_ThisColumnArray)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_EnterPurchaseInvoiceLabel; $_t_oldMethodName; $_t_PurchaseCode; $_t_PurchaseOrderLabel; $_t_PurchaseOrderNumber; $_t_SetPeriodCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_TransfertoPI")

//This method is called from the menu of a purchase order to create a purchase invoice.
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)

$_t_EnterPurchaseInvoiceLabel:=Term_SLPLWT("Enter Purchase Invoices")
If ((MOD_l_CurrentModuleAccess<2) | (MOD_l_CurrentModuleAccess=3))
	Gen_Alert("You do not have access rights to "+$_t_EnterPurchaseInvoiceLabel; "Cancel")
Else 
	//I want to test that the PO is printed-is it a confirmed PO..
	If ([PURCHASE_ORDERS:57]State:14<0)
		$_t_PurchaseOrderLabel:=Term_SLPLWT("Purchases")
		Gen_Alert("Sorry you may not transfer a Purchase Order to "+$_t_PurchaseOrderLabel+"until it is confirmed")
	Else 
		$_ptr_ListboxSetup:=->POI_aptr_LBSetup
		$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
		$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		If (Table:C252($_ptr_LBTable)=Table:C252(->[PURCHASE_ORDERS:57]))
			
			$_l_IDColumnNumber:=LB_GetColumnNumFromField(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_ptr_ListboxSetup)
			$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_IDColumnNumber}
			If (Size of array:C274($_ptr_ThisColumnArray->)>0)
				ARRAY LONGINT:C221($_al_Lines; 0)
				LB_GetSelect($_ptr_ListboxArea; ->$_al_Lines)
				If (Size of array:C274($_al_Lines)=0)
					If (Size of array:C274($_ptr_ThisColumnArray->)>1)
						Gen_Confirm("Copy All Purchase order items to a Purchase invoice?"; "Yes"; "Select")
						$_bo_Select:=(OK=0)
						$_bo_Continue:=True:C214
						If ($_bo_Select=False:C215)
							ARRAY LONGINT:C221($_al_Lines; Size of array:C274($_ptr_ThisColumnArray->))
							For ($_l_Index; 1; Size of array:C274($_al_Lines))
								$_al_Lines{$_l_Index}:=$_l_Index
							End for 
						End if 
					Else 
						//There is only one line
						ARRAY LONGINT:C221($_al_Lines; 1)
						$_al_Lines{1}:=1
						$_bo_Select:=False:C215
						$_bo_Continue:=True:C214
					End if 
				Else 
					Gen_Confirm("Copy selected Purchase order items to a Purchase invoice?"; "Yes"; "No")
					$_bo_Continue:=(OK=1)
					$_bo_Select:=False:C215
				End if 
				OK:=1
				If ($_bo_Continue)
					$_ptr_ListboxSetup:=->POI_aptr_LBSetup
					$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
					$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
					$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
					$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
					$_l_IDColumnNumber:=LB_GetColumnNumFromField(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_ptr_ListboxSetup)
					If ($_l_IDColumnNumber>0)
						$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_IDColumnNumber}
						If ($_bo_Select)  //Get all items into a selection and display-this is the same as done in the Purchase_PO method
							ARRAY LONGINT:C221(PI_al_ItemNumbers; 0)
							ARRAY LONGINT:C221(PI_al_AlreadyCopied; 0)
							ARRAY LONGINT:C221(PI_al_CopyItemNo; 0)
							ARRAY LONGINT:C221(PI_al_MarkItemNumbers; 0)
							ARRAY LONGINT:C221(PI_al_DisplayItem; 0)
							ARRAY TEXT:C222(PI_at_DProductCode; 0)
							ARRAY TEXT:C222(PI_at_dProductDes; 0)
							ARRAY REAL:C219(PI_ar_dProductQTY; 0)
							ARRAY LONGINT:C221(PI_al_dCopyItem; 0)
							ARRAY LONGINT:C221(PI_al_dMarkItem; 0)
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
							$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
							ARRAY LONGINT:C221(PI_al_ItemNumbers; $_l_RecordsinSelection)
							ARRAY LONGINT:C221(PI_al_AlreadyCopied; $_l_RecordsinSelection)
							ARRAY LONGINT:C221(PI_al_CopyItemNo; $_l_RecordsinSelection)
							ARRAY LONGINT:C221(PI_al_MarkItemNumbers; $_l_RecordsinSelection)
							
							
							FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
							For ($_l_Index; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
								INSERT IN ARRAY:C227(PI_al_DisplayItem; Size of array:C274(PI_al_DisplayItem)+1; 1)
								INSERT IN ARRAY:C227(PI_at_DProductCode; Size of array:C274(PI_at_DProductCode)+1; 1)
								INSERT IN ARRAY:C227(PI_at_dProductDes; Size of array:C274(PI_at_dProductDes)+1; 1)
								INSERT IN ARRAY:C227(PI_ar_dProductQTY; Size of array:C274(PI_ar_dProductQTY)+1; 1)
								INSERT IN ARRAY:C227(PI_al_dCopyItem; Size of array:C274(PI_al_dCopyItem)+1; 1)
								INSERT IN ARRAY:C227(PI_al_dMarkItem; Size of array:C274(PI_al_dMarkItem)+1; 1)
								$_l_Element:=Size of array:C274(PI_al_DisplayItem)
								PI_al_DisplayItem{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]POitemID:16
								PI_at_DProductCode{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
								PI_at_dProductDes{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
								PI_ar_dProductQTY{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
								PI_al_dCopyItem{$_l_Element}:=PI_al_CopyItemNo{$_l_Index}
								PI_al_dMarkItem{$_l_Element}:=PI_al_MarkItemNumbers{$_l_Index}
								
								
								NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
							End for 
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							
							WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); 60; (Screen width:C187/2); 60; -1984)
							
							DIALOG:C40([USER:15]; "PURCH_ItemSelector")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							If (PI_l_Copy>0)
								ARRAY LONGINT:C221($_al_Lines; 0)
								For ($_l_Index; 1; Size of array:C274(PI_al_dMarkItem))
									If (PI_al_dCopyItem{$_l_Index}=1)
										$_l_FindRow:=Find in array:C230($_ptr_ThisColumnArray->; PI_al_DisplayItem{$_l_Index})
										If ($_l_FindRow>0)
											APPEND TO ARRAY:C911($_al_Lines; $_l_FindRow)
										End if 
									End if 
								End for 
							End if 
						End if 
						ARRAY LONGINT:C221(PO_al_TransferItemIDs; 0)
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						
						FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
						For ($_l_Index; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
							If ([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8="")
								$_l_FindRow:=Find in array:C230($_ptr_ThisColumnArray->; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
								If ($_l_FindRow>0)  //it should be
									If (Find in array:C230($_al_Lines; $_l_FindRow)>0)  //This line is included
										APPEND TO ARRAY:C911(PO_al_TransferItemIDs; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
									End if 
								End if 
							End if 
							NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
							
						End for 
						If (Size of array:C274(PO_al_TransferItemIDs)>0)
							Repeat 
								$_l_PeriodID:=Check_Period(Current date:C33(*))
								Check_PerCloseI
								$_bo_PeriodSet:=True:C214
								$_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
								If ($_t_SetPeriodCode="")
									Gen_Alert("You cannot enter an invoice with no accounting period")
								End if 
							Until ($_t_SetPeriodCode#"")
							If ($_t_SetPeriodCode#"")
								CREATE RECORD:C68([PURCHASE_INVOICES:37])
								Purch_Code
								[PURCHASE_INVOICES:37]Company_Code:2:=[PURCHASE_ORDERS:57]Company_Code:1
								If ([COMPANIES:2]Company_Code:1#[PURCHASE_INVOICES:37]Company_Code:2)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
								End if 
								[PURCHASE_INVOICES:37]Layer_Code:28:=[PURCHASE_ORDERS:57]Layer_Code:17
								[PURCHASE_INVOICES:37]Currency_Code:23:=[PURCHASE_ORDERS:57]Currency_Code:16
								//Purchase period code to go in here
								[PURCHASE_INVOICES:37]Period_Code:3:=$_t_SetPeriodCode
								[PURCHASE_INVOICES:37]Layer_Code:28:=[PURCHASE_ORDERS:57]Layer_Code:17
								$_d_EnterInvoiceDate:=Date:C102(Gen_Request("What date is the Purchase invoice"; String:C10(Current date:C33(*))))
								[PURCHASE_INVOICES:37]Invoice_Date:5:=$_d_EnterInvoiceDate
								[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=Gen_Request("What is the purchase invoice no"; "")
								If (([COMPANIES:2]TAX_Prefix:38#"") & ([COMPANIES:2]TAX_Prefix:38#DB_GetOrganisationVATPrefix))
									[PURCHASE_INVOICES:37]UK_EC:18:="E"
								Else 
									[PURCHASE_INVOICES:37]UK_EC:18:="U"
								End if 
								If ([PURCHASE_INVOICES:37]Currency_Code:23="")
									[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
								End if 
								If ((DB_GetLedgerisCashVAT) & (DB_GetLedgerCashvatACC#"") & ([PURCHASE_INVOICES:37]State:24#-2))
									[PURCHASE_INVOICES:37]Cash_TAX:33:=True:C214
								End if 
								If ([COMPANIES:2]PL_Terms:53#"")
									[PURCHASE_INVOICES:37]Terms:31:=[COMPANIES:2]PL_Terms:53
								End if 
								Purchases_DueDt
								$_t_PurchaseOrderNumber:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
								Macro_AccType("Load "+String:C10(Table:C252(->[PURCHASE_INVOICES:37])))  // This could upset things if the macro changes the Purchase order no
								If ($_t_PurchaseOrderNumber#[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_PurchaseOrderNumber)
								End if 
								Purchase_PO([PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->PO_al_TransferItemIDs)
								QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
								
								[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2)
								[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
								[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
								DB_SaveRecord(->[PURCHASE_INVOICES:37])
								Gen_Confirm("Do you wish to view the Purchase invoice?"; "Yes"; "No")
								$_bo_Open:=(OK=1)
								OK:=1
								$_l_PIProcessID:=0
								$_t_PurchaseCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
								UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
								
								If ($_bo_Open)
									$_bo_Restart:=False:C215
									If (In transaction:C397)
										Transact_End
										$_bo_Restart:=True:C214
									End if 
									SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 128000; "Purchase Invoice"; Current process:C322; Table:C252(->[PURCHASE_INVOICES:37]); ""; $_t_PurchaseCode)
									
									//ZPurchases_Mod ($_t_PurchaseCode;"True";->$_l_PIProcessID)
									If ($_bo_Restart)
										StartTransaction
									End if 
									
								End if 
								//and reload the items to update the
								PurchOrd_InLPß("B")
							End if 
						Else 
							Gen_Alert("Sorry,  there are no items to transfer")
						End if 
					End if 
				End if 
				
			End if 
		Else 
			Gen_Alert("Sorry you may only transfer the purchase order items whilst viewing the items")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PO_TransfertoPI"; $_t_oldMethodName)
