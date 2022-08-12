//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPInv2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2010 02:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY REAL:C219($_ar_AllocationQuantities; 0)
	ARRAY REAL:C219($_ar_OrderItemQuantities; 0)
	C_BOOLEAN:C305(<>StockPostIn; <>StockPostOr; $_bo_Partials; $_bo_Reselect)
	C_DATE:C307(vDelDate; vInvDate)
	C_LONGINT:C283($_l_AddMode2; $_l_CountOrders; $_l_OrderItemsRow; $_l_PartialsCount; $_l_PartialsIndex; $_l_Records; vAdd; vNo)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_CurrentFormUsage2; $_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPInv2")
//Orders_PPInv2
$_l_AddMode2:=vAdd
If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
	
	Gen_Alert("You do not have access to the Sales Ledger"; "Cancel")
Else 
	Case of 
			
		: (BUT_p_ButtonStringPointer->="OI@")
			If (Orders_PPOut1(True:C214))
				If (Gen_PPChkSt(->[ORDERS:24]State:15; 2))
					If (Orders_PPChCo)
						If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
							If (DB_t_CurrentFormUsage2="Number")
								vInvNo:=Gen_Request("Invoice/CN/Proforma No to print:")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=vInvNo)
							Else 
								vInvNo:=""
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								OK:=1
							End if 
							If (DB_t_CurrentFormUsage2="Alloc")
								QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
							End if 
							OrderI_Level0
							If (DB_LedgerAllowZeroInvoices=False:C215)
								$_r_Sum:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
								If ($_r_Sum=0)
									REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
								End if 
							End if 
							If (Records in selection:C76([ORDER_ITEMS:25])=0)
								Gen_Alert("There are no Items to Invoice"; "Cancel")
							Else 
								vInvNo:=""
								vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
								vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
								DB_t_CurrentFormUsage:="Invoice"
								Orders_InvTrans
							End if 
						End if 
					End if 
				End if 
			End if 
			Orders_PPOut2
			
		: (BUT_p_ButtonStringPointer->="OO@")
			Gen_PPMultiCS(->[ORDERS:24])
			If (OK=1)
				If (Gen_PPChkSt(->[ORDERS:24]State:15; 2))
					If (DB_t_CurrentFormUsage2="Number")
						vInvNo:=Gen_Request("Invoice/CN/Proforma No to print:")
					Else 
						vInvNo:=""
						QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch)
						OK:=1
					End if 
					$_l_CountOrders:=Records in selection:C76([ORDERS:24])
					If ($_l_CountOrders>0)
						Gen_Confirm("Create relevant Invoice(s) for "+String:C10($_l_CountOrders)+" Order"+("s"*(Num:C11($_l_CountOrders#1)))+"?"; "Yes"; "No")
						If (OK=1)
							//  START TRANSACTION
							StartTransaction  // 13/05/02 pb
							
							CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Items")
							CREATE SET:C116([ORDERS:24]; "Orders")
							CREATE EMPTY SET:C140([INVOICES:39]; "IMaster")
							FIRST RECORD:C50([ORDERS:24])
							$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
							While (Not:C34(End selection:C36([ORDERS:24])))
								COPY NAMED SELECTION:C331([ORDERS:24]; "$or")
								DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
								If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
									If ((Orders_InvSrch) | (DB_t_CurrentFormUsage2="Number"))
										If (DB_t_CurrentFormUsage2="Number")
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
											QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=vInvNo)
										Else 
											vInvNo:=""
										End if 
										If (DB_t_CurrentFormUsage2="Alloc")
											QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
										End if 
										OrderI_Level0
										CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
										UNION:C120("Extra"; "Items"; "Items")
										Orders_InvBP2
									End if 
								End if 
								USE NAMED SELECTION:C332("$or")
								CLEAR NAMED SELECTION:C333("$or")
								NEXT RECORD:C51([ORDERS:24])
							End while 
							If (OK=1)
								Invoices_Check
								Transact_End
								
								If ((OK=1) & (DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostIn) & (<>StockPostOr))
									USE SET:C118("$Items")
									CREATE SET:C116([ORDER_ITEMS:25]; "Extra2")
									If (OrdDel_CheckNec)
										Gen_Confirm("Do you want to post the Invoices as Delivery-Type Stock Movements?"; "Yes"; "No")
										If (OK=1)
											DB_t_CurrentFormUsage2:="NC"
											USE SET:C118("$Orders")
											FIRST RECORD:C50([ORDERS:24])
											While (Not:C34(End selection:C36([ORDERS:24])))
												QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
												CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
												INTERSECTION:C121("Extra2"; "Extra"; "Extra")
												USE SET:C118("Extra")
												COPY NAMED SELECTION:C331([ORDERS:24]; "$or")
												OrdDel_StockP
												USE NAMED SELECTION:C332("$or")
												CLEAR NAMED SELECTION:C333("$or")
												NEXT RECORD:C51([ORDERS:24])
											End while 
											DB_t_CurrentFormUsage2:=""
										End if 
									End if 
								End if 
								
							Else 
								Transact_End
							End if 
							
							CLEAR SET:C117("$Items")
							CLEAR SET:C117("$Orders")
						End if 
					Else 
						Gen_Alert("No Invoices are required for these Orders"; "Cancel")
						OK:=0
					End if 
					
				End if 
			End if 
			Gen_PPMultiUS
			vNo:=Records in selection:C76([ORDERS:24])
			
		: (BUT_p_ButtonStringPointer->="IO@")
			If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
				If (Gen_PPChkStSing(->[ORDERS:24]State:15; 2))
					If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
						If (DB_t_CurrentFormUsage2="Number")
							vInvNo:=Gen_Request("Invoice/CN/Proforma No to print:")
						Else 
							vInvNo:=""
							OK:=1
						End if 
						If (OK=1)
							COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
							
							
							Orders_InLPA(False:C215)
							DB_SaveRecord(->[ORDERS:24])
							AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							ORD_ISetSortOrder
							$_t_NamedSet:=""
							$_bo_Reselect:=False:C215
							If (DB_t_CurrentFormUsage#"None")
								$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
								
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
								End if 
							Else 
								$_bo_Reselect:=False:C215
							End if 
							
							
							If (DB_t_CurrentFormUsage2="Sel")
								
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								
							Else 
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
								QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=vInvNo)
								If (DB_t_CurrentFormUsage2="Alloc")
									QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
									COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$allocatedItems")
									SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Quantity:3; $_ar_OrderItemQuantities; [ORDER_ITEMS:25]Allocated:28; $_ar_AllocationQuantities)
									$_bo_Partials:=False:C215
									$_l_PartialsCount:=0
									For ($_l_PartialsIndex; 1; Size of array:C274($_ar_OrderItemQuantities))
										If ($_ar_OrderItemQuantities{$_l_PartialsIndex}>$_ar_AllocationQuantities{$_l_PartialsIndex})
											$_bo_Partials:=True:C214
											$_l_PartialsCount:=$_l_PartialsCount+1
										End if 
									End for 
									$_l_Records:=Records in selection:C76([ORDER_ITEMS:25])
									QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_fullyAllocated)
									If (Records in selection:C76([ORDER_ITEMS:25])<$_l_Records)
										If (Records in selection:C76([ORDER_ITEMS:25])>0)
											If ($_bo_Partials)
												Gen_Confirm("Do you wish to invoice only those fully allocated from stock or to include those with partial allocations and allocated from on order as well"; "Stock"; "All")
											Else 
												Gen_Confirm("Do you wish to invoice only those fully allocated from stock or to include those allocated from on order as well"; "Stock"; "All")
											End if 
											If (OK=0)
												USE NAMED SELECTION:C332("$allocatedItems")
											End if 
										Else 
											Case of 
												: ($_l_PartialsCount=$_l_Records)
													//all allocations are partial AND all have some allocatd from on order
													Gen_Confirm("There are no items fully allocated, do you  wish to invoice partial allocations inclduing any on order"; "No"; "Yes")
													If (OK=0)
														USE NAMED SELECTION:C332("$allocatedItems")
													End if 
												: ($_bo_Partials)
													//some allocations are partial and ALL have some alllocated from on order
													Gen_Confirm("Do you wish to invoice partial allocations including any on order"; "No"; "Yes")
													If (OK=0)
														USE NAMED SELECTION:C332("$allocatedItems")
													End if 
												Else 
													//no allocations are partial but all have some allocated from on order
													Gen_Confirm("Do you wish to invoice those allocated from  on order"; "No"; "Yes")
													If (OK=0)
														USE NAMED SELECTION:C332("$allocatedItems")
													End if 
											End case 
										End if 
										OK:=1
									End if 
									
								End if 
							End if 
							OrderI_Level0
							If (DB_LedgerAllowZeroInvoices=False:C215)
								$_r_Sum:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
								If ($_r_Sum=0)
									REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
								End if 
							End if 
							If (Records in selection:C76([ORDER_ITEMS:25])=0)
								Gen_Alert("There are no Items to Invoice"; "Cancel")
							Else 
								vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
								vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
								Gen_PP1(->[ORDERS:24]; "Orders")
								DB_t_CurrentFormUsage:="Invoice"
								Orders_InvCalc
								Orders_InvTrans
								Gen_PP2("Orders")
							End if 
							Orders_PPEnd
							USE NAMED SELECTION:C332("$Temp")
							If ($_bo_Reselect)
								HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
							End if 
							
							RELATE ONE:C42([ORDERS:24]Currency_Code:32)
							ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
						End if 
					End if 
				End if 
			End if 
			
	End case 
End if 
vAdd:=$_l_AddMode2
UNLOAD RECORD:C212([INVOICES:39])
ERR_MethodTrackerReturn("Orders_PPInv2"; $_t_oldMethodName)
