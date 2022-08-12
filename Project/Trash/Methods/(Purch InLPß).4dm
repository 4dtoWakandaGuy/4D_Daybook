//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_LB_PurchaseInvoiceItems;0)
	//ARRAY LONGINT(PI_al_DocIncludes;0)
	//ARRAY LONGINT(PI_al_Levels;0)
	//ARRAY LONGINT(PI_al_TabIncludes;0)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PI_al_ViewTabsSettings;0)
	//ARRAY LONGINT(PUR_al_ItemsMode;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	ARRAY TEXT:C222($_at_PurchaseOrderNos; 0)
	//ARRAY TEXT(PI_at_TabNames;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PUR_at_ItemMode;0)
	C_BOOLEAN:C305($_bo_Editable; $_bo_NewLevel; PI_bo_NoListbox)
	C_LONGINT:C283($_l_ActionGroupRow; $_l_ActionID; $_l_ActionIndex; $_l_CurrentFormPage; $_l_Index; $_l_ReuseLevel; $_l_TabRow; PI_l_selectedViewTabsLabelsOLD; vALLevels)
	C_PICTURE:C286(PI_pic_EditMode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285($_r_TotalDue)
	C_TEXT:C284($_t_FlagReference; $_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; $1; vButtDisPI)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPß")
//Purch_InLPß
$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Case of 
	: ($_t_HandlerCharacter1="N")  //(($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  `use this bit if don't use Before2 method
		Purch_InLPB
	: ($_t_HandlerCharacter1="A")  //| ($_t_HandlerCharacter1="F"))  `not F cos accepts the record
		Purch_InLPA
	: ($_t_HandlerCharacter1="C")
		
	: ($_t_HandlerCharacter1="D")
		Purch_Delete
End case 
If ([PURCHASE_INVOICES:37]State:24=-3)
	FORM GOTO PAGE:C247(2)
End if 
If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			$_l_CurrentFormPage:=1
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
	End case 
	
	Case of 
		: ($_l_CurrentFormPage=1)
			If (Not:C34(PI_bo_NoListbox))
				$_bo_Editable:=(PI_al_ViewTabsSettings{PI_at_ViewTabsLabels}=0)
				If ($_bo_Editable)
					$_t_FlagReference:="411111000"
				Else 
					$_t_FlagReference:="311111000"
				End if 
				If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) & (vALLevels>0)
					$_bo_NewLevel:=True:C214
				Else 
					$_bo_NewLevel:=False:C215
				End if 
				ARRAY LONGINT:C221(PI_al_Levels; 1)
				$_l_ReuseLevel:=0
				If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) & (vALLevels>0)
					If (PI_al_Levels{1}=0)
						$_bo_NewLevel:=True:C214
						
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=PI_al_Levels{1}
					End if 
				Else 
					$_bo_NewLevel:=False:C215
				End if 
				Case of 
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))  //Purchase invoice items
						USE SET:C118("PI_FFSelection")
						//Because this does not use the definitions a definition set must be loaded-we will load the contacts
						LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[PURCHASE_INVOICE_ITEMS:158]ID:16; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "211111000"; ""; 3; "Purchase Ledger Items"; "Purchase Ledger Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						FUR_FillListBoxArea(->PI_LB_PurchaseInvoiceItems; ->[PURCHASE_INVOICES:37])
						
						
						
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37])) | (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))  //Purchase invoice items
						
						
						If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) | (PI_l_selectedViewTabsLabelsOLD#PI_at_ViewTabsLabels)
							PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
							If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
								
								QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
							Else 
								REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; 0)
								
								
							End if 
							LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[PURCHASE_INVOICE_ITEMS:158]ID:16; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "211111000"; ""; 3; "Purchase Ledger Items"; "Purchase Ledger Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									LBi_Prefs11(->PUR_aPtr_LBItemsSetup)
									// :  ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
						End if 
						LBi_LoadSetup(->PUR_aPtr_LBItemsSetup; $_t_HandlerCharacter1; PI_al_ViewTabsSettings{PI_at_ViewTabsLabels})
						If (PUR_at_ItemMode=0)  //Default should be editable on new or not posted
							PUR_at_ItemMode:=2
						End if 
						//Selectable does not mean anything here
						If ([PURCHASE_INVOICES:37]State:24>=1) | ([PURCHASE_INVOICES:37]Posted_Date:12#!00-00-00!)
							If (PUR_at_ItemMode=2)
								PUR_at_ItemMode:=1
							End if 
						Else 
							PUR_at_ItemMode:=2
						End if 
						
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
						If (Size of array:C274(PI_at_TabNames)=0)
							SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_INVOICES:37]); Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); [PURCHASE_INVOICES:37]Purchase_Code:1)
							
							If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) | (PI_l_selectedViewTabsLabelsOLD#PI_at_ViewTabsLabels)
								PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
								
								// [DIARY];"Diary_InNEW"
								LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
								
							Else 
								OK:=1
								Case of 
									: ($_t_HandlerCharacter1="B")
										
										LBi_Prefs11(->PUR_aPtr_LBItemsSetup)
										
								End case 
							End if 
							LBi_LoadSetup(->PUR_aPtr_LBItemsSetup; $_t_HandlerCharacter1; PI_al_ViewTabsSettings{PI_at_ViewTabsLabels})
						Else 
							$_l_TabRow:=Find in array:C230(PI_at_TabNames; PI_at_ViewTabsLabels{PI_at_ViewTabsLabels})
							If ($_l_TabRow>0)  //it should be
								If (Size of array:C274(PI_al_TabIncludes{$_l_TabRow})>0)
									
									CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
									
									SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_INVOICES:37]); Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); [PURCHASE_INVOICES:37]Purchase_Code:1; (PI_al_DocIncludes{$_l_TabRow}=1))
									If (Records in selection:C76([DIARY:12])>0)
										CREATE SET:C116([DIARY:12]; "OrderMatch")
									Else 
										CREATE EMPTY SET:C140([DIARY:12]; "OrderMatch")
									End if 
									
									For ($_l_Index; 1; Size of array:C274(PI_al_TabIncludes{$_l_TabRow}))
										If (PI_al_TabIncludes{$_l_TabRow}{$_l_Index}>0)
											QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=PI_al_TabIncludes{$_l_TabRow}{$_l_Index})
											If (Records in selection:C76([ACTIONS:13])>0)
												QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
												If (PI_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
													QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
												End if 
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
												
												CREATE SET:C116([DIARY:12]; "Action")
												INTERSECTION:C121("Action"; "OrderMatch"; "Action")
												UNION:C120("Action"; "ToDisplay"; "ToDisplay")
												UNLOAD RECORD:C212([ACTIONS:13])
											End if 
										Else 
											//action is a group of actions
											$_l_ActionGroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99(PI_al_TabIncludes{$_l_TabRow}{$_l_Index}))
											SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_INVOICES:37]); Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); [PURCHASE_INVOICES:37]Purchase_Code:1; (PI_al_DocIncludes{$_l_TabRow}=1))
											If (Records in selection:C76([DIARY:12])>0)
												CREATE SET:C116([DIARY:12]; "OrderMatch")
											Else 
												CREATE EMPTY SET:C140([DIARY:12]; "OrderMatch")
											End if 
											
											
											If ($_l_ActionGroupRow>0)
												For ($_l_ActionIndex; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionGroupRow}))
													$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_ActionGroupRow}{$_l_ActionIndex}
													If ($_l_ActionID>0)
														QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
														If (Records in selection:C76([ACTIONS:13])>0)
															QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
															If (PI_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
															End if 
															QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
															CREATE SET:C116([DIARY:12]; "Action")
															INTERSECTION:C121("Action"; "OrderMatch"; "Action")
															
															UNION:C120("Action"; "ToDisplay"; "ToDisplay")
															UNLOAD RECORD:C212([ACTIONS:13])
														End if 
														
													End if 
													
												End for 
												
											End if 
											
										End if 
										
									End for 
									USE SET:C118("ToDisplay")
								Else 
									SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_INVOICES:37]); Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); [PURCHASE_INVOICES:37]Purchase_Code:1)
									
								End if 
								If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) | (PI_l_selectedViewTabsLabelsOLD#PI_at_ViewTabsLabels)
									PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
									If (Size of array:C274(PI_al_TabIncludes{$_l_TabRow})>0)
										
										LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
									Else 
										PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
										
										// [DIARY];"Diary_InNEW"
										LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
										
									End if 
									
								Else 
									OK:=1
									Case of 
										: ($_t_HandlerCharacter1="B")
											
											LBi_Prefs11(->PUR_aPtr_LBItemsSetup)
											
									End case 
									
									
								End if 
								LBi_LoadSetup(->PUR_aPtr_LBItemsSetup; $_t_HandlerCharacter1; PI_al_ViewTabsSettings{PI_at_ViewTabsLabels})
							End if 
							
						End if 
						
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
						SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_INVOICES:37]); Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); [PURCHASE_INVOICES:37]Purchase_Code:1; True:C214)
						
						If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) | (PI_l_selectedViewTabsLabelsOLD#PI_at_ViewTabsLabels)
							
							PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
							
							//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
							//see _inProcess(it may be one of several forms
							
							LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
									LBi_Prefs11(->PUR_aPtr_LBItemsSetup)
									
							End case 
						End if 
						LBi_LoadSetup(->PUR_aPtr_LBItemsSetup; $_t_HandlerCharacter1; PI_al_ViewTabsSettings{PI_at_ViewTabsLabels})
						
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //Purchase orders
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
						SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderNos)
						QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNos)
						
						If (Size of array:C274(PUR_aPtr_LBItemsSetup)=0) | (PI_l_selectedViewTabsLabelsOLD#PI_at_ViewTabsLabels)
							PI_l_selectedViewTabsLabelsOLD:=PI_at_ViewTabsLabels
							LBi_ArrDefFill(->PUR_aPtr_LBItemsSetup; ->PI_LB_PurchaseInvoiceItems; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_FlagReference; "Purch Ord In13"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
									LBi_Prefs11(->PUR_aPtr_LBItemsSetup)
									
									
							End case 
						End if 
						LBi_LoadSetup(->PUR_aPtr_LBItemsSetup; $_t_HandlerCharacter1; PI_al_ViewTabsSettings{PI_at_ViewTabsLabels})
						
				End case 
				If (PI_al_Levels{1}=0)
					PI_al_Levels{1}:=vALLevels
				End if 
				PUR_at_ItemMode:=1
				
				Case of 
					: (PI_al_ViewTabsSettings{PI_at_ViewTabsLabels}=0)
						If ([PURCHASE_INVOICES:37]Posted_Date:12#!00-00-00!)
							PUR_al_ItemsMode{1}:=-1
							PUR_at_ItemMode{1}:="No Edit"  //This prevents it being changed to edit
						Else 
							PUR_al_ItemsMode{1}:=2
							PUR_at_ItemMode{1}:="No Edit"
						End if 
						
					: (PI_al_ViewTabsSettings{PI_at_ViewTabsLabels}=3)
						PUR_al_ItemsMode{1}:=-1
						PUR_at_ItemMode{1}:="Edit"
						
				End case 
				LBi_EditListLay(->PUR_aPtr_LBItemsSetup; ->PUR_at_ItemMode; ->PI_pic_EditMode; ->PUR_al_ItemsMode)
			End if 
		: ($_l_CurrentFormPage=2)
			//If ($_t_HandlerCharacter1="P")
			//  ALSetScroll0 (»PUR_aPtr_LBItemsSetup)`enable this once set up allocations
			//  End if
			//Allocations
			
			
	End case 
	
	If (Not:C34(PI_bo_NoListbox))
		
		If (Size of array:C274(PUR_aPtr_LBItemsSetup)>=9)
			
			$_ptr_ArrayReferences:=PUR_aPtr_LBItemsSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: ($_l_CurrentFormPage=2)
						In_ButtChkDis(->vButtDisPI; "Purchase")
					: ($_l_CurrentFormPage=1)
						
						If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //if and when we make other  items removable then we can enable other items
							In_ButtChkDis(->vButtDisPI; "Purchases"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisPI; "Purchase")
						End if 
				End case 
			End if 
		End if 
	End if 
	$_r_TotalDue:=PUR_SetDueAmount
	If ($_r_TotalDue#[PURCHASE_INVOICES:37]Total_Due:9)
		If ([PURCHASE_INVOICES:37]Total_Due:9=0) & ($_r_TotalDue<0)
			//ignore
		Else 
			If ([PURCHASE_INVOICES:37]State:24=2)  //receipt
				Gen_Confirm("This invoice has a total of "+String:C10([PURCHASE_INVOICES:37]Total_Invoiced:7)+" and  has a total due of "+String:C10([PURCHASE_INVOICES:37]Total_Due:9)+" However the allocations show the total paid = "+String:C10([PURCHASE_INVOICES:37]Total_Invoiced:7-$_r_TotalDue)+"Leaving a due amount of "+String:C10($_r_TotalDue)+Char:C90(13)+" Do you want it corrected?"; "No"; "Yes")
				
				If (OK=0)
					QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
					
					[PURCHASE_INVOICES:37]Total_Paid:8:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
					[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
				End if 
			End if 
			OK:=1
		End if 
	End if 
	
Else 
	If ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))
		If (Not:C34(PI_bo_NoListbox))
			
			LBi_pRefs4upd(->PUR_aPtr_LBItemsSetup)
		End if 
	End if 
	//no ALpRefs4Sort
End if 
ERR_MethodTrackerReturn("Purch_InLPß"; $_t_oldMethodName)
