If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 23:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CCAuthDate; 0)
	//ARRAY DATE(INV_ad_CCAuthDate;0)
	ARRAY LONGINT:C221($_al_AuthRecord; 0)
	ARRAY LONGINT:C221($_al_AuthStatus; 0)
	ARRAY LONGINT:C221($_al_CCID; 0)
	ARRAY LONGINT:C221($_al_CurrentAuth; 0)
	ARRAY LONGINT:C221($_al_StatusIDs; 0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(INV_al_AuthRecord;0)
	//ARRAY LONGINT(INV_al_AuthStatus;0)
	//ARRAY LONGINT(INV_al_CCID;0)
	//ARRAY LONGINT(INV_al_StatusIDs;0)
	ARRAY REAL:C219($_ar_CCAmount; 0)
	//ARRAY REAL(INV_ar_ABSAllocationAmount;0)
	//ARRAY REAL(INV_ar_CCAmount;0)
	ARRAY TEXT:C222($_at_AuthStatus; 0)
	ARRAY TEXT:C222($_at_CurrentAuths; 0)
	ARRAY TEXT:C222($_at_DepositReference; 0)
	ARRAY TEXT:C222($_at_InvoiceCode; 0)
	ARRAY TEXT:C222($_at_StatusNames; 0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(INV_at_AuthStatus;0)
	//ARRAY TEXT(INV_at_CCAuth;0)
	//ARRAY TEXT(INV_at_InvoiceCode;0)
	//ARRAY TEXT(INV_at_ReceiptNos;0)
	//ARRAY TEXT(INV_at_ReceiptNum;0)
	//ARRAY TEXT(INV_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_CancelRefund; $_bo_Continue; $_bo_DepositPosted; $_bo_DepositRebilled; $_bo_DoVoid; $_bo_NotReconcilled; $_bo_OK; $_bo_Rebill; $_bo_ReceiptSelected; $_bo_VoidTest; GEN_Bo_ShowCreate)
	C_BOOLEAN:C305(INV_bo_inTransaction)
	C_LONGINT:C283($_l_AddMode; $_l_AllocationsIndex; $_l_CCAuthTransactionID; $_l_CCID; $_l_CCServiceID; $_l_CurrentAuth; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delay; $_l_ReceiptRefunded; $_l_Repeats)
	C_LONGINT:C283($_l_ServiceRow; $_l_ServiceRowundAvailable; $_l_StringPosition; $_l_SubRecordCount; $_l_Void; Vadd; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_DefaultValue)
	C_REAL:C285($_r_DepositAmount; $_r_RebillAmount; $_r_RefundAmount; $_r_Remainder; INV_R_CCDeposit; INV_R_totalDeposit)
	C_TEXT:C284($_t_AmountString; $_t_CCMResponse; $_t_CurrentInvoice; $_t_DepositReference; $_t_InvoiceCurrencyCode; $_t_invoiceNumber; $_t_NewDepositNumber; $_t_oldMethodName; $_t_ReceiptNumber; $_t_ReceiptNumberSelected; $_t_RefundText)
	C_TEXT:C284($_t_RequestModule; $_t_ResponseText; $_t_Tab; $_t_TransactionDetails; DB_t_CurrentFormUsage2; DB_t_WindowTitle; GEN_t_OKText)
	C_TIME:C306($_ti_CurrentTime1; $_ti_DocumentRef; $_ti_PSPTime; CCM_ti_ReconcileTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Variable16"; Form event code:C388)
$_t_RefundText:=""
$_t_InvoiceCurrencyCode:=[INVOICES:39]Currency_Code:27
$_t_NewDepositNumber:=""
$_bo_VoidTest:=False:C215
$_ti_CurrentTime1:=(Current time:C178*1)
If ([INVOICES:39]Invoice_Number:1#"*D@") & ([INVOICES:39]Invoice_Number:1#"*R@")
	
	
	If (INV_at_CCAuth>0)
		$_t_CurrentInvoice:=[INVOICES:39]Invoice_Number:1
		DB_SaveRecord(->[INVOICES:39])
		$_l_CurrentAuth:=INV_at_CCAuth
		Case of 
			: (INV_al_AuthStatus{INV_at_CCAuth}=4)  // Money  already refunded.
				Gen_Alert("This auth has already been refunded so cannot be refunded again")
				
			: (INV_al_AuthStatus{INV_at_CCAuth}=1) | (INV_al_AuthStatus{INV_at_CCAuth}>4)  // Awating invoicing
				//Gen_Alert ("Note. This only voids the Authorization within Daybook. You must contact the Cred"+"it Card Company to release the authorization on the customers account";"OK")
				//this is required because VOID DOES NOT EXIST. VOID ACTUALLY IS A CREDIT PRIOR TO RECONCILLIATION BY THE PSP!!!
				$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{INV_at_CCAuth}; [INVOICES:39]Currency_Code:27)
				
				//$_l_Void:=909
				
				If ($_l_Void>0)
					//the transaction is voided so set the record
					READ WRITE:C146([CC_OrderAuths:133])
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{INV_at_CCAuth})
					[CC_OrderAuths:133]xAuthStatus:7:=2
					INV_al_AuthStatus{INV_at_CCAuth}:=2
					
					DB_SaveRecord(->[CC_OrderAuths:133])
					READ WRITE:C146([CCM_PSPTransaction:136])
					QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					[CCM_PSPTransaction:136]XTransactionStatus:15:=-2
					INV_al_AuthStatus{INV_at_CCAuth}:=-2
					DB_SaveRecord(->[CCM_PSPTransaction:136])
					INV_at_AuthStatus{INV_at_CCAuth}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{INV_at_CCAuth})}
					UNLOAD RECORD:C212([CC_OrderAuths:133])
					UNLOAD RECORD:C212([CCM_PSPTransaction:136])
					READ ONLY:C145([CCM_PSPTransaction:136])
					READ ONLY:C145([CC_OrderAuths:133])
					
				End if 
				
				
				
			: (INV_al_AuthStatus{INV_at_CCAuth}=3)  // Money received.
				$_l_CCID:=INV_al_CCID{INV_at_CCAuth}
				QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
				$_bo_Continue:=True:C214
				If (Records in selection:C76([xCreditCardDetails:132])=0)
					$_bo_Continue:=False:C215
					Gen_Alert("The credit card record for this payment seems to be missing, no refund can be mad"+"e")
				Else 
					If ([xCreditCardDetails:132]EndDate:8<Current date:C33(*))
						$_bo_Continue:=False:C215
						Gen_Alert("This credit card has expired, the refund may not be made on this card")
					End if 
				End if 
				If ($_bo_Continue)
					ARRAY TEXT:C222(INV_at_ReceiptNos; Size of array:C274(INV_ar_ABSAllocationAmount))
					$_l_CurrentRow:=0
					For ($_l_AllocationsIndex; 1; Size of array:C274(INV_ar_ABSAllocationAmount))
						$_bo_ReceiptSelected:=False:C215
						If (INV_ar_ABSAllocationAmount{$_l_AllocationsIndex}=INV_ar_CCAmount{INV_at_CCAuth})
							SET QUERY DESTINATION:C396(3; $_l_ReceiptRefunded)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=INV_at_ReceiptNum{$_l_AllocationsIndex}; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
							SET QUERY DESTINATION:C396(0)
							
							If ($_l_ReceiptRefunded>0)
								$_l_CurrentRow:=$_l_CurrentRow+1
								INV_at_ReceiptNos{$_l_CurrentRow}:=INV_at_ReceiptNum{$_l_AllocationsIndex}
								//$_bo_ReceiptSelected:=True
								//$_t_ReceiptNumber:=INV_at_ReceiptNum{$_l_AllocationsIndex}
								//$_l_AllocationsIndex:=99999
							End if 
						End if 
					End for 
					
					ARRAY TEXT:C222(INV_at_ReceiptNos; $_l_CurrentRow)
					$_bo_ReceiptSelected:=False:C215
					Case of 
						: (Size of array:C274(INV_at_ReceiptNos)=1)
							$_bo_ReceiptSelected:=True:C214
							$_t_ReceiptNumber:=INV_at_ReceiptNos{1}
							If ($_bo_VoidTest)
								//Gen_Alert ("Refunding "+$_t_ReceiptNumber)
							End if 
							$_t_RefundText:=$_t_RefundText+"Refunding "+$_t_ReceiptNumber+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
							
						: (Size of array:C274(INV_at_ReceiptNos)>1)
							$_bo_ReceiptSelected:=False:C215
							If ($_bo_VoidTest)
								//Gen_Alert ("Refunding "+"Multiple Receipts-select one")
							End if 
							$_t_RefundText:=$_t_RefundText+"Refunding "+"Multiple Receipts-select one"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
						: (Size of array:C274(INV_at_ReceiptNos)=0)
							Gen_Confirm("No receipts found to refund., Do you know the receipt number?"; "No"; "Yes")
							If (OK=0)
								OK:=1
								$_t_ReceiptNumberSelected:=Gen_Request("Enter the receipt number to refund"; "")
								$_t_invoiceNumber:=[INVOICES:39]Invoice_Number:1
								DB_SaveRecord(->[INVOICES:39])
								
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ReceiptNumberSelected)
								If (Records in selection:C76([INVOICES:39])=1)
									ARRAY TEXT:C222(INV_at_ReceiptNos; 1)
									INV_at_ReceiptNos{1}:=$_t_ReceiptNumberSelected
									$_bo_ReceiptSelected:=True:C214
									$_t_ReceiptNumber:=INV_at_ReceiptNos{1}
								End if 
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
								
							End if 
							
					End case 
					If (Not:C34($_bo_ReceiptSelected))  //use select which receipt payment is against
						If (Size of array:C274(INV_at_ReceiptNos)>0)
							ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(INV_at_ReceiptNos))
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(INV_at_ReceiptNos))
							For ($_l_AllocationsIndex; 1; Size of array:C274(INV_at_ReceiptNos))
								GEN_at_DropDownMenu{$_l_AllocationsIndex}:=INV_at_ReceiptNos{$_l_AllocationsIndex}
								GEN_al_DropDownMenuID{$_l_AllocationsIndex}:=iNV_al_AuthRecord{$_l_AllocationsIndex}
							End for 
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
							DB_t_WindowTitle:="Select Receipt to refund"
							GEN_Bo_ShowCreate:=False:C215
							GEN_t_OKText:="Select"
							WS_l_DefaultValue:=1
							DIALOG:C40([USER:15]; "Gen_PopUpChoice")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							If (GEN_at_DropDownMenu>0)
								
								$_bo_ReceiptSelected:=True:C214
								$_t_ReceiptNumber:=INV_at_ReceiptNos{GEN_at_DropDownMenu}
								If ($_bo_VoidTest)
									//Gen_Alert ("Receipt Selected "+$_t_ReceiptNumber)
								End if 
								$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Receipt Selected "+$_t_ReceiptNumber+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
								
							End if 
						End if 
					End if 
					ARRAY TEXT:C222(INV_at_ReceiptNos; 0)
					
					If ($_bo_ReceiptSelected)
						READ WRITE:C146([CC_OrderAuths:133])
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{INV_at_CCAuth})
						If ([CC_OrderAuths:133]TransactionID:10#0)
							QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
							If (Records in selection:C76([CCM_PSPTransaction:136])>0)
								If ([CCM_PSPTransaction:136]XTransactionStatus:15#-13)
									If ((Current date:C33(*)-120)<INV_ad_CCAuthDate{INV_at_CCAuth})  //Added NG November 2009 to prevent refund if over 120 days
										ARRAY TEXT:C222($_at_CurrentAuths; 0)
										ARRAY DATE:C224($_ad_CCAuthDate; 0)
										ARRAY REAL:C219($_ar_CCAmount; 0)
										ARRAY LONGINT:C221($_al_CCID; 0)
										ARRAY LONGINT:C221($_al_AuthStatus; 0)
										ARRAY TEXT:C222($_at_AuthStatus; 0)
										ARRAY TEXT:C222($_at_InvoiceCode; 0)
										ARRAY LONGINT:C221($_al_AuthRecord; 0)
										ARRAY LONGINT:C221($_al_StatusIDs; 3)
										ARRAY TEXT:C222($_at_StatusNames; 3)
										
										COPY ARRAY:C226(INV_at_CCAuth; $_at_CurrentAuths)
										COPY ARRAY:C226(INV_ar_CCAmount; $_ar_CCAmount)
										COPY ARRAY:C226(INV_ad_CCauthDate; $_ad_CCauthDate)
										COPY ARRAY:C226(INV_al_CCID; $_al_CCID)
										COPY ARRAY:C226(INV_al_AuthStatus; $_al_AuthStatus)
										COPY ARRAY:C226(INV_at_AuthStatus; $_at_AuthStatus)
										COPY ARRAY:C226(INV_at_InvoiceCode; $_at_InvoiceCode)
										COPY ARRAY:C226(INV_al_AuthRecord; $_al_AuthRecord)
										COPY ARRAY:C226(INV_al_StatusIDs; $_al_StatusIDs)
										COPY ARRAY:C226(INV_at_StatusNames; $_at_StatusNames)
										If ($_bo_VoidTest)
											//Gen_Alert ("Current Auths and Payments copied ")
										End if 
										$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Current Auths and Payments copied "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
										
										//Gen_Alert ("Saving Invoice")
										DB_SaveRecord(->[INVOICES:39])
										If ($_bo_VoidTest)
											//Gen_Alert ("Current Invoice Saved ")
										End if 
										$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Current Invoice Saved "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
										//Gen_Alert ("Invoice Saved")
										$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
										If (In transaction:C397)
											INV_bo_inTransaction:=True:C214
											Transact_End(True:C214)
											If ($_bo_VoidTest)
												//Gen_Alert ("Tranaction Validated ")
											End if 
											$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Tranaction Validated "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
										End if 
										
										
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ReceiptNumber)
										
										Gen_Alert("Receipt being refunded is "+$_t_ReceiptNumber)
										
										//Here we need to know if that receipt was against a deposit because here we are returning money...if the money allocated to the invoice came from a deposit we have undo the depost as well
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumber)
										$_t_DepositReference:=""
										$_l_CurrentAuth:=INV_at_CCAuth
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											If (Records in selection:C76([XInvoiceAllocation:126])=1)
												If ([XInvoiceAllocation:126]xDepositNumber:5#"")
													$_t_DepositReference:=[XInvoiceAllocation:126]xDepositNumber:5
												End if 
											Else 
												//More than one need one for the correct amount
												QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAmount:7=INV_ar_CCAmount{$_l_CurrentAuth})
												If ([XInvoiceAllocation:126]xDepositNumber:5#"")
													$_t_DepositReference:=[XInvoiceAllocation:126]xDepositNumber:5
												End if 
											End if 
										End if 
										$_l_ServiceRow:=Find in array:C230(INV_at_ReceiptNum; $_t_ReceiptNumber)
										If ($_l_ServiceRow>0)  //it should be
											$_l_ServiceRowundAvailable:=INV_ar_ABSAllocationAmount{$_l_ServiceRow}
											If ($_l_ServiceRowundAvailable>=INV_ar_CCAmount{$_l_CurrentAuth})
												If ($_bo_VoidTest)
													//Gen_Alert ("Receipt Searched ")
												End if 
												$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Receipt Searched "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
												Gen_Confirm("Refund Whole Amount"; "Yes"; "No")
												$_bo_Rebill:=False:C215
												$_bo_CancelRefund:=False:C215
												If (OK=1)
													If ($_bo_VoidTest)
														//Gen_Alert ("Refunding whole amount ")
													End if 
													$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refunding whole amount "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
													
													$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_CurrentAuth}; $_t_InvoiceCurrencyCode; INV_ad_CCAuthDate{$_l_CurrentAuth})
													If ($_l_Void>0)
														//note that although we may be refunding the whole amount of the allocation this may not be the WHOLE amount of the receipt..in which case there could be a rebill
														If ($_l_ServiceRowundAvailable#INV_ar_CCAmount{$_l_CurrentAuth})
															//then the receipt is for more than the refund and we are rebilling the difference
															$_bo_Rebill:=True:C214
															$_r_RebillAmount:=$_l_ServiceRowundAvailable-INV_ar_CCAmount{$_l_CurrentAuth}
														End if 
														[INVOICES:39]Total_Paid:6:=INV_ar_CCAmount{$_l_CurrentAuth}
														INV_ReceiptRefund2(False:C215; INV_ar_CCAmount{$_l_CurrentAuth})
														$_bo_DoVoid:=True:C214
														If ($_bo_VoidTest)
															//Gen_Alert ("Refund Completed")
														End if 
													Else 
														Gen_Alert("The refund was not done so the refund is cancelled")
														$_bo_DoVoid:=False:C215
														$_bo_CancelRefund:=True:C214
													End if 
													$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refund Completed "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
												Else 
													CCM_LoadServiceProvidersV11(True:C214)
													QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{$_l_CurrentAuth})
													$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
													UNLOAD RECORD:C212([CC_OrderAuths:133])
													QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //²
													$_l_CCServiceID:=[CCM_PSPTransaction:136]XPSPID:14  //²
													$_ti_PSPTime:=[CCM_PSPTransaction:136]xCreatedTime:17  //Note that this time is not accurate to the second..because we created it on the record it is not synched with AN
													UNLOAD RECORD:C212([CCM_PSPTransaction:136])
													$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_CCServiceID)
													If ($_l_ServiceRow>0)
														CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
														$_bo_NotReconcilled:=False:C215
														If ($_ti_PSPTime>CCM_ti_ReconcileTime)  //THis transaction was created AFTER the reconcile time
															If ((Current date:C33(*)-1)=$_ad_CCAuthDate{$_l_CurrentAuth})  //NG added November 2009. Used new time field to test if the transaction happened yesterday after the reconcile time
																If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30))  //Unless we are past reconcile time today
																	$_bo_NotReconcilled:=True:C214
																End if 
															End if 
														Else 
															
														End if 
														Case of 
															: (((Current time:C178(*)*1)>((CCM_ti_ReconcileTime*1)-30)) & ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)+30)) & (Current date:C33(*)=$_ad_CCAuthDate{$_l_CurrentAuth}))
																Gen_Alert("This transaction cannot be refunded at this time, please try again in a few minut"+"es"; "Stop")
																$_bo_DoVoid:=False:C215
																$_bo_CancelRefund:=True:C214
																$_r_RebillAmount:=0
																$_bo_Rebill:=False:C215
															: (((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30)) & (Current date:C33(*)=$_ad_CCAuthDate{$_l_CurrentAuth})) | ($_bo_NotReconcilled)
																Gen_Confirm("You may not do a partial refund on this as it has not been settled, you may only "+"do a total refund. You should then obtain the new amount in a seperate transactio"+"n"; "Refund"; "Stop")
																If (OK=1)
																	$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_CurrentAuth}; $_t_InvoiceCurrencyCode; INV_ad_CCAuthDate{$_l_CurrentAuth})
																	If ($_l_Void>0)
																		If ($_l_ServiceRowundAvailable#INV_ar_CCAmount{$_l_CurrentAuth})
																			//then the receipt is for more than the refund and we are rebilling the difference
																			$_bo_Rebill:=True:C214
																			$_r_RebillAmount:=$_l_ServiceRowundAvailable-INV_ar_CCAmount{$_l_CurrentAuth}
																		End if 
																		
																		$_bo_DoVoid:=True:C214
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refunding whole amount "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		INV_ReceiptRefund2(False:C215; INV_ar_CCAmount{$_l_CurrentAuth})
																	Else 
																		Gen_Alert("The refund was not done on  so the refund is cancelled")
																		$_bo_DoVoid:=False:C215
																		$_bo_CancelRefund:=True:C214
																		$_r_RebillAmount:=0
																		$_bo_Rebill:=False:C215
																	End if 
																Else 
																	$_bo_DoVoid:=False:C215
																	$_bo_CancelRefund:=True:C214
																	$_r_RebillAmount:=0
																	$_bo_Rebill:=False:C215
																	
																End if 
															Else 
																QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1; *)
																QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2#""; *)
																QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumber)
																If (Records in selection:C76([XInvoiceAllocation:126])>0)
																	Gen_Confirm("You may not do a partial refund on this as the reciept is for multiple invoices, "+"you may only "+"do a total refund. You should then obtain the new amount in a seperate transactio"+"n"; "Refund"; "Stop")
																	If (OK=1)  //Do the full refund
																		$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_CurrentAuth}; $_t_InvoiceCurrencyCode; INV_ad_CCAuthDate{$_l_CurrentAuth})
																		If ($_l_Void>0)
																			If ($_l_ServiceRowundAvailable#INV_ar_CCAmount{$_l_CurrentAuth})
																				//then the receipt is for more than the refund and we are rebilling the difference
																				$_bo_Rebill:=True:C214
																				$_r_RebillAmount:=$_l_ServiceRowundAvailable-INV_ar_CCAmount{$_l_CurrentAuth}
																			End if 
																			
																			$_bo_DoVoid:=True:C214
																			$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refunding whole amount "+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																			INV_ReceiptRefund2(False:C215; INV_ar_CCAmount{$_l_CurrentAuth})
																		Else 
																			Gen_Alert("The refund was not done  so the refund is cancelled")
																			$_bo_DoVoid:=False:C215
																			$_bo_CancelRefund:=True:C214
																			$_r_RebillAmount:=0
																			$_bo_Rebill:=False:C215
																		End if 
																	Else 
																		$_bo_DoVoid:=False:C215
																		$_bo_CancelRefund:=True:C214
																		$_r_RebillAmount:=0
																		$_bo_Rebill:=False:C215
																	End if 
																Else 
																	Repeat 
																		$_r_RefundAmount:=Gen_RequestAmount("Enter amount to refund"; Is real:K8:4; INV_ar_CCAmount{$_l_CurrentAuth})
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Refund Amount set at "+String($_r_RefundAmount))
																		End if 
																		
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refund Amount set at "+String:C10($_r_RefundAmount)+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		If (OK=1)
																			Case of 
																				: ($_r_RefundAmount=0)
																					Gen_Confirm("The amount entered is 0. Cancel Refund?"; "Yes"; "No")
																					If (OK=1)
																						$_bo_CancelRefund:=True:C214
																					End if 
																				: ($_r_RefundAmount>INV_ar_CCAmount{$_l_CurrentAuth})
																					Gen_Alert("You cannot refund more than the original payment")
																			End case 
																		Else 
																			$_bo_CancelRefund:=True:C214
																		End if 
																	Until ($_r_RefundAmount>0) & ($_r_RefundAmount<INV_ar_CCAmount{$_l_CurrentAuth}) | ($_bo_CancelRefund)
																	
																	If (Not:C34($_bo_CancelRefund))
																		//here we still refund the whole amount..and then auto create an receipt for the new amount
																		$_r_RebillAmount:=INV_ar_CCAmount{$_l_CurrentAuth}-$_r_RefundAmount
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Rebill Amount set at "+String($_r_RebillAmount))
																		End if 
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Rebill Amount set at "+String:C10($_r_RebillAmount)+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refund Started"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_CurrentAuth}; $_t_InvoiceCurrencyCode; INV_ad_CCAuthDate{$_l_CurrentAuth}; $_r_RefundAmount)
																		If ($_l_Void>0)
																			If ($_l_Void#[CCM_PSPTransaction:136]x_ID:1)
																				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_Void)
																			End if 
																			$_t_CCMResponse:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
																			Case of 
																				: ([CCM_PSPTransaction:136]PSPUSED:4="DUMMY")
																					
																				: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
																					
																					
																				: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
																					$_r_RefundAmount:=Num:C11(CCM_ExtractField("Authorize Net"; "Amount"; $_t_CCMResponse))
																					$_r_RebillAmount:=INV_ar_CCAmount{$_l_CurrentAuth}-$_r_RefundAmount
																					$_bo_DoVoid:=True:C214
																					INV_ReceiptRefund2(False:C215; $_r_RefundAmount)
																				: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
																					$_l_StringPosition:=Position:C15("END REQUEST TYPE"; $_t_CCMResponse)
																					$_t_RequestModule:=Substring:C12($_t_CCMResponse; 1; $_l_StringPosition-1)
																					$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_StringPosition+Length:C16("END REQUEST TYPE"))
																					$_l_StringPosition:=Position:C15("END REQUEST RESPONSE"; $_t_CCMResponse)
																					$_t_ResponseText:=Substring:C12($_t_CCMResponse; 1; $_l_StringPosition-1)
																					$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_StringPosition+Length:C16("END REQUEST RESPONSE"))
																					$_l_StringPosition:=Position:C15("END TRANSACTION DETAILS"; $_t_CCMResponse)
																					$_t_TransactionDetails:=Substring:C12($_t_CCMResponse; 1; $_l_StringPosition-1)
																					
																					$_t_AmountString:=CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText; $_t_RequestModule)
																					$_r_RefundAmount:=Num:C11($_t_AmountString)
																					INV_ReceiptRefund2(False:C215; $_r_RefundAmount)
																			End case 
																		Else 
																			Gen_Alert("The refund was not done so the refund is cancelled")
																			$_bo_DoVoid:=False:C215
																			$_bo_CancelRefund:=True:C214
																			$_r_RebillAmount:=0
																		End if 
																		
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refund Completed"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		$_bo_Rebill:=($_r_RebillAmount#0)  //The amount entered may be the whole amount
																	Else 
																		$_bo_DoVoid:=False:C215
																		$_r_RebillAmount:=0
																		$_bo_Rebill:=False:C215
																	End if 
																End if 
														End case 
													Else 
														Gen_Alert("The payment procvider details are not found on the system. This refund cannot be processed")
														$_bo_CancelRefund:=True:C214
													End if 
												End if 
												//Gen_Alert ("Refund COmpleted")
												If (INV_bo_inTransaction)
													If (Not:C34(In transaction:C397))
														//START TRANSACTION
														StartTransaction
														If ($_bo_VoidTest)
															//Gen_Alert ("New Transaction started")
														End if 
														$_t_RefundText:=$_t_RefundText+Char:C90(9)+"New Transaction started"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
													End if 
												End if 
												//Gen_Alert ("reloading the invoice")
												If ([INVOICES:39]Invoice_Number:1#$_t_ReceiptNumber)
													If ($_bo_VoidTest)
														//Gen_Alert ("Refinding the receipt"+$_t_ReceiptNumber)
														
													End if 
													$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Refinding the receipt"+$_t_ReceiptNumber+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
													QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ReceiptNumber)
													
												End if 
												If (Not:C34($_bo_CancelRefund))
													//if the receipt was an allocation of a deposit we also need to do a deposit refund
													If ([INVOICES:39]Total_Paid:6=0)
														//the amount was 0 so probably is
														If ($_bo_VoidTest)
															//Gen_Alert ("Finding deposit allocations for this receipt")
														End if 
														$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Finding deposit allocations for this receipt"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
														QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)
														QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5#"")
														$_r_DepositAmount:=[XInvoiceAllocation:126]xAmount:7
														$_bo_DepositRebilled:=False:C215
														$_t_NewDepositNumber:=""
														If (Records in selection:C76([XInvoiceAllocation:126])>0)  //then it definetly is
															If ($_bo_VoidTest)
																//Gen_Alert ("Receipt is for a deposit")
															End if 
															$_t_RefundText:=$_t_RefundText+Char:C90(9)+" Receipt is for a deposit"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
															SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xDepositNumber:5; $_at_DepositReference)
															For ($_l_AllocationsIndex; 1; Size of array:C274($_at_DepositReference))
																//Gen_Alert ("Refunding the deposit")
																If ($_bo_VoidTest)
																	//Gen_Alert (" Finding Deposit"+$_at_DepositReference{$_l_AllocationsIndex})
																	
																	
																End if 
																$_t_RefundText:=$_t_RefundText+Char:C90(9)+" Finding Deposit"+$_at_DepositReference{$_l_AllocationsIndex}+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_DepositReference{$_l_AllocationsIndex})
																If ($_bo_VoidTest)
																	//Gen_Alert (" Starting Deposit Refund"+$_at_DepositReference{$_l_AllocationsIndex})
																End if 
																$_t_RefundText:=$_t_RefundText+Char:C90(9)+" starting  Deposit Refund"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																INV_DepositRefund2(False:C215; $_r_DepositAmount; 0; True:C214)
																If ($_bo_VoidTest)
																	//Gen_Alert (" Deposit Refund Completed"+$_at_DepositReference{$_l_AllocationsIndex})
																End if 
																$_t_RefundText:=$_t_RefundText+Char:C90(9)+" Deposit Refund Completed"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																//Gen_Alert ("Deposit refund complete")
																If ($_bo_Rebill)
																	If ($_bo_DepositRebilled=False:C215)  //only create one(normally there is only one deposit amount anyway
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Creating new deposit for"+String($_r_RebillAmount))
																		End if 
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Creating new deposit for"+String:C10($_r_RebillAmount)+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_DepositReference{$_l_AllocationsIndex})
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Duplicating Deposit")
																		End if 
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Duplicating Deposit"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		DUPLICATE RECORD:C225([INVOICES:39])
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Deposit Duplicated")
																		End if 
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+" Deposit Duplicated"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		[INVOICES:39]Invoice_Number:1:=""
																		//We did not refund the whole amount. create a replacement deposit for the new amount..dont forget that you did this when you create the receipt
																		InvP_No
																		$_l_AddMode:=Vadd
																		DB_t_CurrentFormUsage2:=""
																		Vadd:=1
																		[INVOICES:39]Posted_Date:8:=!00-00-00!
																		[INVOICES:39]Total_Paid:6:=$_r_RebillAmount
																		
																		$_r_Remainder:=$_r_RebillAmount
																		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
																		
																		$_l_SubRecordCount:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
																		
																		
																		For ($_l_AllocationsIndex; 1; $_l_SubRecordCount)
																			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
																			DELETE RECORD:C58([INVOICES_ALLOCATIONS:162])
																		End for 
																		DB_SaveRecord(->[INVOICES:39])
																		Vadd:=$_l_AddMode
																		If ((OK=1) & ([INVOICES:39]Posted_Date:8=!00-00-00!) & ([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Period_Code:13#"") & ([INVOICES:39]Total_Paid:6#0))
																			$_bo_DepositPosted:=Inv_DepPost
																			If (Not:C34($_bo_DepositPosted))
																				OK:=0
																			End if 
																		Else 
																			OK:=0
																		End if 
																		$_t_NewDepositNumber:=[INVOICES:39]Invoice_Number:1
																		UNLOAD RECORD:C212([INVOICES:39])
																		If ($_bo_VoidTest)
																			//Gen_Alert ("Duplicated Deposit Saved and posted")
																		End if 
																		
																		$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Duplicated Deposit Saved and posted"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
																		$_bo_DepositRebilled:=True:C214
																	End if 
																	//````
																End if 
																
															End for 
															
														End if 
														
													End if 
													
												End if 
												
												QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
												If (Not:C34($_bo_CancelRefund))
													If ($_bo_Rebill)
														If ($_bo_VoidTest)
															//Gen_Alert ("Creating new reciept")
														End if 
														$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Creating new reciept"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
														//Enter a new Receipt for the difference. remember if it was a deposit you are relating the deposit to the receipt
														If ($_t_NewDepositNumber#"")  //there was a deposit
															If ($_bo_VoidTest)
																//Gen_Alert ("Allocation Receipt to new deposit")
															End if 
															$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Allocation Receipt to new deposit"+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
															INV_AllocateDeposit(0; $_t_NewDepositNumber; False:C215)
															//the above Calls_Invoices_InLPBB and Invoices_InLP
														Else 
															//$_r_RebillAmount
															If ($_bo_VoidTest)
																//Gen_Alert ("Creating Payment for"+String($_r_RebillAmount))
															End if 
															$_t_RefundText:=$_t_RefundText+Char:C90(9)+"Creating Payment for"+String:C10($_r_RebillAmount)+";"+String:C10(((Current time:C178*1)-$_ti_CurrentTime1)/1000)
															INV_CreatePayment($_r_RebillAmount)
															//amount is a direct receipt
															Invoices_InLPBB
															Invoices_InLPß("B")
														End if 
													End if 
												End if 
												
												COPY ARRAY:C226($_at_CurrentAuths; INV_at_CCAuth)
												COPY ARRAY:C226($_ar_CCAmount; INV_ar_CCAmount)
												COPY ARRAY:C226($_ad_CCauthDate; INV_ad_CCauthDate)
												COPY ARRAY:C226($_al_CCID; INV_al_CCID)
												COPY ARRAY:C226($_al_AuthStatus; INV_al_AuthStatus)
												COPY ARRAY:C226($_at_AuthStatus; INV_at_AuthStatus)
												COPY ARRAY:C226($_at_InvoiceCode; INV_at_InvoiceCode)
												COPY ARRAY:C226($_al_AuthRecord; INV_al_AuthRecord)
												COPY ARRAY:C226($_al_StatusIDs; INV_al_StatusIDs)
												COPY ARRAY:C226($_at_StatusNames; INV_at_StatusNames)
												
												If ([ORDERS:24]x_ID:58>0)
													ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
												End if 
												If ($_bo_VoidTest)
													//Gen_Alert ("Refunding with AN")
												End if 
												If (Not:C34($_bo_CancelRefund))
													If ($_r_RefundAmount>0)
														
														//$_l_Void:=CCM_VoidTransaction (INV_al_AuthRecord{$_l_CurrentAuth};$_t_InvoiceCurrencyCode;INV_ad_CCAuthDate{$_l_CurrentAuth};$_r_RefundAmount)
														
													Else 
														//$_l_Void:=CCM_VoidTransaction (INV_al_AuthRecord{$_l_CurrentAuth};$_t_InvoiceCurrencyCode;INV_ad_CCAuthDate{$_l_CurrentAuth})
														
													End if 
													If ($_l_Void>0)
														//the transaction is voided so set the record
														
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{$_l_CurrentAuth})
														[CC_OrderAuths:133]xAuthStatus:7:=4
														INV_al_AuthStatus{$_l_CurrentAuth}:=4
														If ($_r_RefundAmount>0)
															
															[CC_OrderAuths:133]RefundedAmount:11:=$_r_RefundAmount
															If ([CC_OrderAuths:133]AuthorizationAmount:5>[CC_OrderAuths:133]RefundedAmount:11)
																INV_at_AuthStatus{$_l_CurrentAuth}:="Partial Refund"+String:C10($_r_RefundAmount)
															Else 
																INV_at_AuthStatus{$_l_CurrentAuth}:=" Refunded"
															End if 
															
														End if 
														DB_SaveRecord(->[CC_OrderAuths:133])
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
														$_bo_OK:=False:C215
														$_l_Repeats:=0
														$_l_Delay:=1
														Repeat 
															$_l_Repeats:=$_l_Repeats+1
															$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
															If (Not:C34($_bo_OK))
																If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
																	//only increase every 10 tries
																	$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
																End if 
																DelayTicks(2*$_l_Delay)
															End if 
														Until ($_bo_OK=True:C214)
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-13  //NG this was marking it as -1 but that was already used to indicate an auth had already been used
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														INV_at_AuthStatus{$_l_CurrentAuth}:="Voided"
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														READ ONLY:C145([CC_OrderAuths:133])
														
													End if 
												End if 
												
											Else 
												Gen_Alert("The selected receipt is for less than the value of the transaction this cannot be correct")
												
												
											End if 
										Else 
											Gen_Alert("That receipt is not associated with this invoice the refund may not be done")
											
											
										End if 
										
									Else 
										Gen_Alert("This payment may not be refunded it is over the 120 Day limit")
										
										
									End if 
									
									
								Else 
									Gen_Alert("The Transaction record is is already voided it cannot be voided again")
									
									
									
								End if 
							Else 
								Gen_Alert("The Transaction record is missing from Daybook, this authorization cannot be void"+"ed and should be investigated")
								
							End if 
						Else 
							Gen_Alert("This  Transaction ID is unknown this authorization cannot be voided and should be"+" "+"i"+"nvestigated")
						End if 
						
					End if 
				End if   // card not found or expired
			Else 
				Gen_Alert("This authorization may not be voided")
				
		End case 
		If ([INVOICES:39]Invoice_Number:1#$_t_CurrentInvoice)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_CurrentInvoice)
		End if 
		INV_DisplayAllocations
		
	Else 
		Gen_Alert("You must select an authorization to void")
	End if 
	If ($_bo_VoidTest)
		If (Test path name:C476("RefundTest.txt")#Is a document:K24:1)
			$_ti_DocumentRef:=DB_CreateDocument("RefundTest.txt")
			$_t_Tab:=Char:C90(9)
			SEND PACKET:C103($_ti_DocumentRef; $_t_RefundText+$_t_Tab)
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(10)+Char:C90(13))
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			
			If (Is macOS:C1572)
				//_O_SET DOCUMENT CREATOR("RefundTest.txt";"ttxt")
			End if 
		Else 
			
			If (Is macOS:C1572)
				//_O_SET DOCUMENT CREATOR("RefundTest.txt";"ttxt")
			End if 
			$_ti_DocumentRef:=Append document:C265("RefundTest.txt")
			$_t_Tab:=Char:C90(9)
			SEND PACKET:C103($_ti_DocumentRef; $_t_RefundText+$_t_Tab)
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(10)+Char:C90(13))
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Invoices_In,bVoid"; $_t_oldMethodName)
