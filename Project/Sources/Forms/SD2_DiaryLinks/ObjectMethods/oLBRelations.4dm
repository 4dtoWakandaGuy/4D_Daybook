If (False:C215)
	//object Name: Object Name:      SD2_DiaryLinks.oLBRelations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Relations;0)
	ARRAY LONGINT:C221($_al_ProblemTypesIDS; 0)
	ARRAY LONGINT:C221($_al_SIInvoiceStates; 0)
	//ARRAY LONGINT(SD2_al_DisplayRelationTable;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ProblemCodes; 0)
	ARRAY TEXT:C222($_at_ProblemNames; 0)
	ARRAY TEXT:C222($_at_SIInvoiceStates; 0)
	//ARRAY TEXT(SD2_at_DisplayrecordCode;0)
	//ARRAY TEXT(SD2_at_DisplayRelations;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	//ARRAY TEXT(SD2_at_RelationName;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_AddNewRow)
	C_LONGINT:C283($_l_Column; $_l_CompanyCount; $_l_ContactsCount; $_l_event; $_l_Index; $_l_InvoicesCount; $_l_JobsCount; $_l_LastCompanyRow; $_l_LastContactRow; $_l_LastInvoiceRow; $_l_LastJobRow)
	C_LONGINT:C283($_l_LastOrderRow; $_l_LastPIRow; $_l_LastPORow; $_l_LastProdRow; $_l_LastSMRow; $_l_LastSVSRow; $_l_MaxRecords; $_l_OrdersCount; $_l_PICount; $_l_POCount; $_l_ProblemTypeRow)
	C_LONGINT:C283($_l_ProductsCount; $_l_RelationRow; $_l_Row; $_l_SCSCount; $_l_SMCount)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_oldMethodName; $_t_ProblemName; $_t_State; $_t_Status_)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/SD2_DiaryLinks/oLBRelations"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(SD_lb_Relations; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=2)
					//entering a record code
					Case of 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[COMPANIES:2]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_ContactCode:=""
								Check_Company(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_ContactCode; ->[DIARY:12])
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									SD2_at_RelationName{$_l_Row}:=[COMPANIES:2]Company_Name:2
									$_l_LastCompanyRow:=0
									$_l_MaxRecords:=0
									$_l_CompanyCount:=0
									$_bo_AddNewRow:=True:C214
									For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
										If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[COMPANIES:2]))
											If (SD2_at_DisplayrecordCode{$_l_Index}#"")
												$_l_CompanyCount:=$_l_CompanyCount+1
												$_l_LastCompanyRow:=$_l_Index
											Else 
												$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
											End if 
										End if 
									End for 
									$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[COMPANIES:2]))
									If ($_l_RelationRow>0)
										If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
											$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
										End if 
									End if 
									If ($_l_MaxRecords>0)
										If ($_l_CompanyCount>=$_l_MaxRecords)
											$_bo_AddNewRow:=False:C215
										End if 
									End if 
									If ($_bo_AddNewRow)
										LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastCompanyRow+1)
										SD2_at_DisplayRelations{$_l_LastCompanyRow+1}:=SD2_at_DisplayRelations{$_l_Row}
										SD2_al_DisplayRelationTable{$_l_LastCompanyRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank companies row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[CONTACTS:1]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_Contact(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode; ->[DIARY:12])
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									SD2_at_RelationName{$_l_Row}:=[CONTACTS:1]Contact_Name:31
									$_l_LastContactRow:=0
									$_l_MaxRecords:=0
									$_l_ContactsCount:=0
									$_bo_AddNewRow:=True:C214
									For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
										If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[CONTACTS:1]))
											If (SD2_at_DisplayrecordCode{$_l_Index}#"")
												$_l_ContactsCount:=$_l_ContactsCount+1
												$_l_LastContactRow:=$_l_Index
											Else 
												$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
											End if 
										End if 
									End for 
									$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[CONTACTS:1]))
									If ($_l_RelationRow>0)
										If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
											$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
										End if 
									End if 
									If ($_l_MaxRecords>0)
										If ($_l_ContactsCount>=$_l_MaxRecords)
											$_bo_AddNewRow:=False:C215
										End if 
									End if 
									If ($_bo_AddNewRow)
										LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastContactRow+1)
										SD2_at_DisplayRelations{$_l_LastContactRow+1}:=SD2_at_DisplayRelations{$_l_Row}
										SD2_al_DisplayRelationTable{$_l_LastContactRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank contacts row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[ORDERS:24]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_SalesOrder(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode; True:C214)
								If (Not:C34(<>StatesLoaded))
									States_Load
								End if 
								RELATE ONE:C42([ORDERS:24]State:15)
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([ORDERS:24]Order_Code:3#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									Case of 
										: ([ORDERS:24]State:15=("024"+<>SYS_at_RecStateCodes{24}{1}))
											
											SD2_at_RelationName{$_l_Row}:=Uppers2(Lowercase:C14([TABLE_RECORD_STATES:90]Entry_Name:5))+" "+String:C10([ORDERS:24]Enquiry_Date:25)
											
										: ([ORDERS:24]State:15=("024"+<>SYS_at_RecStateCodes{24}{2}))
											
											SD2_at_RelationName{$_l_Row}:=Uppers2(Lowercase:C14([TABLE_RECORD_STATES:90]Entry_Name:5))+" "+String:C10([ORDERS:24]Quotation_Date:26)
										Else 
											SD2_at_RelationName{$_l_Row}:=Uppers2(Lowercase:C14([TABLE_RECORD_STATES:90]Entry_Name:5))+" "+String:C10([ORDERS:24]Quotation_Date:26)
											
									End case 
									
									If (True:C214)
										$_l_LastOrderRow:=0
										$_l_MaxRecords:=0
										$_l_OrdersCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[ORDERS:24]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_OrdersCount:=$_l_OrdersCount+1
													$_l_LastOrderRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[ORDERS:24]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_OrdersCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastOrderRow+1)
											SD2_at_DisplayRelations{$_l_LastOrderRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastOrderRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
							
							
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[INVOICES:39]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_SalesInvoice(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode; True:C214)
								ARRAY TEXT:C222($_at_SIInvoiceStates; 8)
								ARRAY LONGINT:C221($_al_SIInvoiceStates; 8)
								$_at_SIInvoiceStates{1}:="Receipt"
								$_al_SIInvoiceStates{1}:=-3
								$_at_SIInvoiceStates{2}:="Deposit"
								$_al_SIInvoiceStates{2}:=-2
								$_at_SIInvoiceStates{3}:="Proforma"
								$_al_SIInvoiceStates{3}:=-1
								$_at_SIInvoiceStates{4}:="Credit Note"
								$_al_SIInvoiceStates{4}:=-0
								$_at_SIInvoiceStates{5}:="Unposted Invoice"
								$_al_SIInvoiceStates{5}:=4
								$_at_SIInvoiceStates{6}:="Batched Invoice"
								$_al_SIInvoiceStates{6}:=1
								$_at_SIInvoiceStates{7}:="Posted Invoice"
								$_al_SIInvoiceStates{7}:=2
								$_at_SIInvoiceStates{8}:="imported Invoice"
								$_al_SIInvoiceStates{8}:=3
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([INVOICES:39]Invoice_Number:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									If ([INVOICES:39]State:10=0)
										If ([INVOICES:39]Total_Invoiced:5>=0)
											SD2_at_RelationName{$_l_Row}:="Invoice"+" "+String:C10([INVOICES:39]Invoice_Date:4)
										Else 
											SD2_at_RelationName{$_l_Row}:="Credit Note"+" "+String:C10([INVOICES:39]Invoice_Date:4)
										End if 
									Else 
										$_l_RelationRow:=Find in array:C230($_al_SIInvoiceStates; [INVOICES:39]State:10)
										If ($_l_RelationRow>0)
											$_t_State:=$_at_SIInvoiceStates{$_l_RelationRow}
										Else 
											$_t_State:="Unknown Invoice Type"
										End if 
										SD2_at_RelationName{$_l_Row}:=$_t_State+" "+String:C10([INVOICES:39]Invoice_Date:4)
									End if 
									
									If (True:C214)
										$_l_LastInvoiceRow:=0
										$_l_MaxRecords:=0
										$_l_InvoicesCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[INVOICES:39]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_InvoicesCount:=$_l_InvoicesCount+1
													$_l_LastInvoiceRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[INVOICES:39]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_InvoicesCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastInvoiceRow+1)
											SD2_at_DisplayRelations{$_l_LastInvoiceRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastInvoiceRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//
							End if 
							
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[PURCHASE_ORDERS:57]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_Purchaseorder(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode; True:C214)
								If (Not:C34(<>StatesLoaded))
									States_Load
								End if 
								$_t_State:=PUR_GetFileState
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									SD2_at_RelationName{$_l_Row}:=$_t_State+" "+String:C10([PURCHASE_ORDERS:57]Purchase_Order_Date:3)
									
									If (True:C214)
										$_l_LastPORow:=0
										$_l_MaxRecords:=0
										$_l_POCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_POCount:=$_l_POCount+1
													$_l_LastPORow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PURCHASE_ORDERS:57]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_POCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastPORow+1)
											SD2_at_DisplayRelations{$_l_LastPORow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastPORow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[PURCHASE_INVOICES:37]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_PurchaseInvoices(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode; True:C214)
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([PURCHASE_INVOICES:37]Purchase_Code:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									Case of 
										: ([PURCHASE_INVOICES:37]State:24=-3)
											$_t_Status_:="Payment"
										: ([PURCHASE_INVOICES:37]State:24=-2)
											$_t_Status_:="Pre-Payment"
										: ([PURCHASE_INVOICES:37]State:24=-1)
											$_t_Status_:=""
										: ([PURCHASE_INVOICES:37]State:24=0)
											$_t_Status_:="Not Posted"
										: ([PURCHASE_INVOICES:37]State:24=1)
											$_t_Status_:="Batched"
										: ([PURCHASE_INVOICES:37]State:24=2)
											$_t_Status_:="Posted"
										: ([PURCHASE_INVOICES:37]State:24=3)
											$_t_Status_:="PL Only"
									End case 
									SD2_at_RelationName{$_l_Row}:=$_t_Status_+" "+String:C10([PURCHASE_INVOICES:37]Invoice_Date:5)
									
									If (True:C214)
										$_l_LastPIRow:=0
										$_l_MaxRecords:=0
										$_l_PICount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_PICount:=$_l_PICount+1
													$_l_LastPIRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PURCHASE_INVOICES:37]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_PICount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastPIRow+1)
											SD2_at_DisplayRelations{$_l_LastPIRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastPIRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
							
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[PRODUCTS:9]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_ProductNC(->SD2_at_DisplayrecordCode{$_l_Row}; "")
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([PRODUCTS:9]Product_Code:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									SD2_at_RelationName{$_l_Row}:=[PRODUCTS:9]Product_Name:2
									
									If (True:C214)
										$_l_LastProdRow:=0
										$_l_MaxRecords:=0
										$_l_ProductsCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[PRODUCTS:9]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_ProductsCount:=$_l_ProductsCount+1
													$_l_LastProdRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PRODUCTS:9]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_ProductsCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastProdRow+1)
											SD2_at_DisplayRelations{$_l_LastProdRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastProdRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[STOCK_MOVEMENTS:40]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_StockMovements(->SD2_at_DisplayrecordCode{$_l_Row}; ->$_t_CompanyCode)
								
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([STOCK_MOVEMENTS:40]Movement_Code:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									SD2_at_RelationName{$_l_Row}:=[STOCK_MOVEMENTS:40]Type_Number:4+" Date: "+String:C10([STOCK_MOVEMENTS:40]Posted_Date:7)
									
									If (True:C214)
										$_l_LastSMRow:=0
										$_l_MaxRecords:=0
										$_l_SMCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_SMCount:=$_l_SMCount+1
													$_l_LastSMRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[STOCK_MOVEMENTS:40]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_SMCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastSMRow+1)
											SD2_at_DisplayRelations{$_l_LastSMRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastSMRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
							
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[SERVICE_CALLS:20]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_MinorNC(->SD2_at_DisplayrecordCode{$_l_Row}; ""; ->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Company_Code:1; "Service Call")
								SVS_LoadproblemTypes
								ALL RECORDS:C47([PROBLEMS:22])
								SELECTION TO ARRAY:C260([PROBLEMS:22]Problem_Code:1; $_at_ProblemCodes; [PROBLEMS:22]Problem_Name:2; $_at_ProblemNames; [PROBLEMS:22]ProblemTypeID:3; $_al_ProblemTypesIDS)
								
								
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([SERVICE_CALLS:20]Call_Code:4#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									$_l_RelationRow:=Find in array:C230($_at_ProblemCodes; [SERVICE_CALLS:20]Problem_Code:14)
									If ($_l_RelationRow>0)
										$_t_ProblemName:=$_at_ProblemNames{$_l_RelationRow}
										If ($_al_ProblemTypesIDS{$_l_RelationRow}>0)
											$_l_ProblemTypeRow:=Find in array:C230(SD2_al_ProblemTypeIDs; $_al_ProblemTypesIDS{$_l_RelationRow})
											If ($_l_ProblemTypeRow>0)
												$_t_ProblemName:=SD2_at_ProblemTypeNames{$_l_ProblemTypeRow}+" "+$_t_ProblemName
											End if 
										End if 
									Else 
										$_t_ProblemName:="Service Call "
									End if 
									SD2_at_RelationName{$_l_Row}:=$_t_ProblemName+"Date "+String:C10([SERVICE_CALLS:20]Call_Date:5)
									
									If (True:C214)
										$_l_LastSVSRow:=0
										$_l_MaxRecords:=0
										$_l_SCSCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_SCSCount:=$_l_SCSCount+1
													$_l_LastSVSRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[SERVICE_CALLS:20]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_SCSCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastSVSRow+1)
											SD2_at_DisplayRelations{$_l_LastSVSRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastSVSRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[JOBS:26]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"")
								$_t_CompanyCode:=""
								Check_MinorNC(->SD2_at_DisplayrecordCode{$_l_Row}; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Company_Code:3; "Job")
								
								
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([JOBS:26]Job_Code:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									
									SD2_at_RelationName{$_l_Row}:=[JOBS:26]Job_Name:2+"Date "+String:C10([JOBS:26]Required_Date:8)
									
									If (True:C214)
										$_l_LastJobRow:=0
										$_l_MaxRecords:=0
										$_l_JobsCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[JOBS:26]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_JobsCount:=$_l_JobsCount+1
													$_l_LastJobRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[JOBS:26]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_JobsCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastJobRow+1)
											SD2_at_DisplayRelations{$_l_LastJobRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastJobRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[JOB_STAGES:47]))
							If (SD2_at_DisplayrecordCode{$_l_Row}#"") | (False:C215)
								$_t_CompanyCode:=""
								//Check_MinorNC (->SD2_at_DisplayrecordCode{$_l_Row};"";->[JOB STAGES];->[JOB STAGES]Job stage code;->[JOB stages]Company Code;"Job")
								
								
								
								If (SD2_at_DisplayrecordCode{$_l_Row}#"")
									If ([JOBS:26]Job_Code:1#SD2_at_DisplayrecordCode{$_l_Row})
										QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=SD2_at_DisplayrecordCode{$_l_Row})
									End if 
									
									SD2_at_RelationName{$_l_Row}:=[JOBS:26]Job_Name:2+"Date "+String:C10([JOBS:26]Required_Date:8)
									
									If (True:C214)
										$_l_LastJobRow:=0
										$_l_MaxRecords:=0
										$_l_JobsCount:=0
										$_bo_AddNewRow:=True:C214
										For ($_l_Index; 1; Size of array:C274(SD2_al_DisplayRelationTable))
											If (SD2_al_DisplayRelationTable{$_l_Index}=Table:C252(->[JOBS:26]))
												If (SD2_at_DisplayrecordCode{$_l_Index}#"")
													$_l_JobsCount:=$_l_JobsCount+1
													$_l_LastJobRow:=$_l_Index
												Else 
													$_bo_AddNewRow:=False:C215  //there is a blank one dont add a new row
												End if 
											End if 
										End for 
										$_l_RelationRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[JOBS:26]))
										If ($_l_RelationRow>0)
											If (SD2_al_RelationTypesS{$_l_RelationRow}<2)  //allow or not set which mean allow anyway
												$_l_MaxRecords:=SD2_al_RelationRestS{$_l_RelationRow}
											End if 
										End if 
										If ($_l_MaxRecords>0)
											If ($_l_JobsCount>=$_l_MaxRecords)
												$_bo_AddNewRow:=False:C215
											End if 
										End if 
										If ($_bo_AddNewRow)
											LISTBOX INSERT ROWS:C913(SD_lb_Relations; $_l_LastJobRow+1)
											SD2_at_DisplayRelations{$_l_LastJobRow+1}:=SD2_at_DisplayRelations{$_l_Row}
											SD2_al_DisplayRelationTable{$_l_LastJobRow+1}:=SD2_al_DisplayRelationTable{$_l_Row}
										End if 
									End if 
								End if 
							Else 
								//if the value is cleared and there is another blank orders row then delete this row
							End if 
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[JOB PERSONNEL:48]))
						: (SD2_al_DisplayRelationTable{$_l_Row}=Table:C252(->[SUBSCRIPTIONS:93]))
							
							
					End case 
			End case 
		End if 
	Else 
		MESSAGE:C88(String:C10($_l_event))
		
End case 
ERR_MethodTrackerReturn("OBJ SD2_DiaryLinks.oLBRelations"; $_t_oldMethodName)
