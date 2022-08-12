If (False:C215)
	//object Name: [ORDERS]Orders_In.oVoidAuths
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
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(ORD_al_AuthRecord;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY LONGINT(ORD_al_CCID;0)
	//ARRAY LONGINT(ORD_al_StatusIDs;0)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	//ARRAY TEXT(ORD_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_CancelRefund; $_bo_Continue; $_bo_DoVoid; $_bo_NotReconciled; $_bo_OK; $_bo_Posted; $_bo_Rebill)
	C_LONGINT:C283($_l_AddMode; $_l_AuthSelectedRow; $_l_CCAuthTransactionID; $_l_CCID; $_l_CharactersPosition; $_l_Delay; $_l_PSPServiceID; $_l_Repeats; $_l_ServiceRow; $_l_VoidID; Vadd)
	C_REAL:C285($_r_AuthedAmount; $_r_RebillAmount; $_r_RefundAmount)
	C_TEXT:C284($_t_AmountString; $_t_DepositToRefund; $_t_NewDepositNumber; $_t_oldMethodName; $_t_RequestModule; $_t_ResponseText; $_t_TransactionDetails; $CCM_T_Response; DB_t_CurrentFormUsage2)
	C_TIME:C306($_ti_PSPTime; CCM_ti_ReconcileTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oVoidAuths"; Form event code:C388)
If (ORD_at_CCAUTH>0)
	Case of 
		: (ORD_al_AuthStatus{ORD_at_CCAUTH}=4)  // Money  already refunded.
			Gen_Alert("This auth has already been refunded so cannot be refunded again")
		: (ORD_al_AuthStatus{ORD_at_CCAUTH}=1) | (ORD_al_AuthStatus{ORD_at_CCAUTH}>4)  //
			//NG check if it it an auth only or a deposit.
			$_l_AuthSelectedRow:=ORD_at_CCAUTH
			
			READ WRITE:C146([CC_OrderAuths:133])
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_AuthSelectedRow})
			
			If ([CC_OrderAuths:133]Order_ID:2=[ORDERS:24]x_ID:58) & ([CC_OrderAuths:133]xDepositCode:8="") & ([CC_OrderAuths:133]xinvoiceCode:9="")
				Gen_Alert("Note. This only voids the Authorization within Daybook. You must contact the Cred"+"it Card Company to release the authorization on the customers account"; "OK")
				If (True:C214)
					//this is required because VOID DOES NOT EXIST. VOID ACTUALLY IS A CREDIT PRIOR TO RECONCILLIATION BY THE PSP!!!
					
					$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{ORD_at_CCAUTH}; [ORDERS:24]Currency_Code:32)
				End if 
				//$_l_VoidID:=909
				If ($_l_VoidID>0)
					//the transaction is voided so set the record
					READ WRITE:C146([CC_OrderAuths:133])
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{ORD_at_CCAUTH})
					[CC_OrderAuths:133]xAuthStatus:7:=2
					ORD_al_AuthStatus{ORD_at_CCAUTH}:=2
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
					ORD_al_AuthStatus{ORD_at_CCAUTH}:=2
					ORD_at_AuthStatus{ORD_at_CCAUTH}:=ORD_at_StatusNames{Find in array:C230(ORD_al_StatusIDs; ORD_al_AuthStatus{ORD_at_CCAUTH})}
					
					DB_SaveRecord(->[CCM_PSPTransaction:136])
					UNLOAD RECORD:C212([CC_OrderAuths:133])
					UNLOAD RECORD:C212([CCM_PSPTransaction:136])
					READ ONLY:C145([CCM_PSPTransaction:136])
					READ ONLY:C145([CC_OrderAuths:133])
					
					
					
				End if 
			Else 
				Case of 
					: ([CC_OrderAuths:133]xDepositCode:8#"") & ([CC_OrderAuths:133]xinvoiceCode:9="")
						$_l_CCID:=[CC_OrderAuths:133]CC_RecordID:3
						QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
						$_bo_Continue:=True:C214
						If (Records in selection:C76([xCreditCardDetails:132])=0)
							$_bo_Continue:=False:C215
							Gen_Alert("The credit card record for this payment seems to be missing, no refund can be mad"+"e")
						Else 
							If ([xCreditCardDetails:132]EndDate:8<Current date:C33(*))
								$_bo_Continue:=False:C215
								Gen_Alert("This credit card has expired, the refund  may not be made on this card")
							End if 
						End if 
						If ($_bo_Continue)
							
							$_t_DepositToRefund:=[CC_OrderAuths:133]xDepositCode:8
							Gen_Confirm("Are you sure you wish to refund a deposit"; "Yes"; "No")
							If (OK=1)
								$_bo_DoVoid:=False:C215
								$_bo_Rebill:=False:C215
								$_r_RefundAmount:=0
								Gen_Confirm("Refund Whole Amount"; "Yes"; "No")
								If (OK=1)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
									//few lines just to make sure
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
									QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
									QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
									QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
									If (Records in selection:C76([INVOICES:39])>0)
										$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
										If ($_l_VoidID>0)
											CREATE SET:C116([INVOICES:39]; "Userset")
											INV_RefundSel(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5)
											$_bo_DoVoid:=True:C214
										Else 
											$_bo_DoVoid:=False:C215
											Gen_Alert("The Void could not be done so the refund has been cancelled")
										End if 
									Else 
										Gen_Alert("Sorry that deposit cannot be refunded")
									End if 
									
								Else 
									CCM_LoadServiceProvidersV11(True:C214)
									$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
									$_r_AuthedAmount:=[CC_OrderAuths:133]AuthorizationAmount:5
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //²
									$_l_PSPServiceID:=[CCM_PSPTransaction:136]XPSPID:14  //²
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_PSPServiceID)
									If ($_l_ServiceRow>0)
										CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
										Case of 
											: ((Current time:C178(*)*1)>((CCM_ti_ReconcileTime*1)-30)) & ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)+30)) & (Current date:C33(*)=[CC_OrderAuths:133]AuthorizationDate:4)
												Gen_Alert("This transaction cannot be refunded at this time,please try again in a few minute"+"s"; "Stop")
												
											: ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30)) & (Current date:C33(*)=[CC_OrderAuths:133]AuthorizationDate:4)
												Gen_Confirm("You may not do a partial refund on this as it has not been settled, you may only "+"do a total refund. You should then obtain the new amount in a seperate transactio"+"n"; "Refund"; "Stop")
												If (OK=1)
													QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
													//few lines just to make sure
													QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
													If (Records in selection:C76([INVOICES:39])>0)
														$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
														If ($_l_VoidID>0)
															CREATE SET:C116([INVOICES:39]; "Userset")
															INV_DepositRefund2(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5; 0; True:C214)
															//INV_RefundSel (False;[CC_OrderAuths]AuthorizationAmount)
															$_bo_DoVoid:=True:C214
														Else 
															Gen_Alert("The refund was not done and has been cancelled")
															$_bo_DoVoid:=False:C215
														End if 
													Else 
														Gen_Alert("Sorry that deposit cannot be refunded")
													End if 
													
												Else 
													$_bo_CancelRefund:=True:C214
												End if 
											Else 
												Repeat 
													$_r_RefundAmount:=Gen_RequestAmount("Enter amount to refund"; Is real:K8:4; [CC_OrderAuths:133]AuthorizationAmount:5)
													If (OK=1)
														Case of 
															: ($_r_RefundAmount=0)
																Gen_Confirm("The amount entered is 0. Cancel Refund?"; "Yes"; "No")
																If (OK=1)
																	$_bo_CancelRefund:=True:C214
																End if 
															: ($_r_RefundAmount>[CC_OrderAuths:133]AuthorizationAmount:5)
																Gen_Alert("You cannot refund more than the original payment")
														End case 
													Else 
														$_bo_CancelRefund:=True:C214
													End if 
												Until ($_r_RefundAmount>0) & ($_r_RefundAmount<[CC_OrderAuths:133]AuthorizationAmount:5) | ($_bo_CancelRefund)
												If (Not:C34($_bo_CancelRefund))
													//here we still refund the whole amount..and then auto create an invoice for the new amount
													$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
													QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
													//few lines just to make sure
													QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
													If (Records in selection:C76([INVOICES:39])>0)
														$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow}; $_r_RefundAmount)
														If ($_l_VoidID>0)
															QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_VoidID)
															//Amount
															$CCM_T_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
															Case of 
																: ([CCM_PSPTransaction:136]PSPUSED:4="DUMMY")
																	
																: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
																	
																	
																: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
																	$_t_AmountString:=CCM_ExtractField("Authorize Net"; "Amount"; $CCM_T_Response)
																	$_r_RefundAmount:=Num:C11($_t_AmountString)
																	$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
																	CREATE SET:C116([INVOICES:39]; "Userset")
																	INV_DepositRefund2(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5; 0; True:C214)
																	//INV_RefundSel (False;[CC_OrderAuths]AuthorizationAmount)
																	$_bo_DoVoid:=True:C214
																: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
																	$_l_CharactersPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
																	$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																	$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharactersPosition+Length:C16("END REQUEST TYPE"))
																	$_l_CharactersPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
																	$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																	$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharactersPosition+Length:C16("END REQUEST RESPONSE"))
																	$_l_CharactersPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
																	$_t_TransactionDetails:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																	$_t_AmountString:=CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText)
																	$_r_RefundAmount:=Num:C11($_t_AmountString)
																	$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
																	CREATE SET:C116([INVOICES:39]; "Userset")
																	INV_DepositRefund2(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5; 0; True:C214)
																	//INV_RefundSel (False;[CC_OrderAuths]AuthorizationAmount)
																	$_bo_DoVoid:=True:C214
															End case 
														Else 
															$_bo_DoVoid:=False:C215
															Gen_Alert("The amount could not be refunded so the deposit is not can"+"celled in Daybook")
															$_r_RebillAmount:=0
														End if 
													Else 
														$_r_RebillAmount:=0
														Gen_Alert("Sorry that deposit cannot be refunded")
													End if 
													
													$_bo_Rebill:=($_r_RebillAmount#0)  //The amount entered may be the whole amount
													//Void or credit the transaction with AN
													
												Else 
													$_r_RebillAmount:=0
													$_bo_Rebill:=False:C215
												End if 
										End case 
									Else 
										$_bo_Rebill:=False:C215
										$_bo_DoVoid:=False:C215
										Gen_Alert("The payment provider details are not found on the system. This refund cannot be processed")
									End if 
								End if 
								If ($_bo_Rebill)
									If ($_r_RebillAmount>0)
										//only create one(normally there is only one deposit amount anyway
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
										DUPLICATE RECORD:C225([INVOICES:39])
										[INVOICES:39]Invoice_Number:1:=""  //We did not refund the whole amount. create a replacement deposit for the new amount..dont forget that you did this when you create the receipt
										InvP_No
										$_l_AddMode:=Vadd
										DB_t_CurrentFormUsage2:=""
										Vadd:=1
										[INVOICES:39]Total_Paid:6:=$_r_RebillAmount
										DB_SaveRecord(->[INVOICES:39])
										Vadd:=$_l_AddMode
										If ((OK=1) & ([INVOICES:39]Posted_Date:8=!00-00-00!) & ([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Period_Code:13#"") & ([INVOICES:39]Total_Paid:6#0))
											$_bo_Posted:=Inv_DepPost
											If (Not:C34($_bo_Posted))
												OK:=0
											End if 
										Else 
											OK:=0
										End if 
										$_t_NewDepositNumber:=[INVOICES:39]Invoice_Number:1
										UNLOAD RECORD:C212([INVOICES:39])
										
										//````
										
									End if 
									
								End if 
								If ($_bo_DoVoid)
									If ($_r_RefundAmount>0)
										//$_l_VoidID:=CCM_VoidTransaction (ORD_al_AuthRecord{$_l_AuthSelectedRow};[ORDERS]Currency Code;ORD_ad_CCAuthDate{$_l_AuthSelectedRow};$_r_RefundAmount)
									Else 
										//$_l_VoidID:=CCM_VoidTransaction (ORD_al_AuthRecord{$_l_AuthSelectedRow};[ORDERS]Currency Code;ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
									End if 
									If ($_l_VoidID>0)
										//the transaction is voided so set the record
										
										READ WRITE:C146([CC_OrderAuths:133])
										QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_AuthSelectedRow})
										[CC_OrderAuths:133]xAuthStatus:7:=4
										ORD_al_AuthStatus{$_l_AuthSelectedRow}:=4
										If ($_r_RefundAmount>0) & ($_r_AuthedAmount#$_r_RefundAmount)
											[CC_OrderAuths:133]RefundedAmount:11:=$_r_RefundAmount
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
										ORD_at_AuthStatus{$_l_AuthSelectedRow}:="Voided"
										UNLOAD RECORD:C212([CC_OrderAuths:133])
										UNLOAD RECORD:C212([CCM_PSPTransaction:136])
										READ ONLY:C145([CCM_PSPTransaction:136])
										READ ONLY:C145([CC_OrderAuths:133])
										
									End if 
									CCM_LoadOrderAuths([ORDERS:24]x_ID:58)
									
									
								End if 
								
								
								
							End if 
						End if   //card expired or not found
					Else 
						Gen_Alert("This Auth has been invoiced please refund from the invoice")
				End case 
			End if 
		: (ORD_al_AuthStatus{ORD_at_CCAUTH}=3)  //payment taken
			//Gen_Alert ("This is a payment that has been taken. The auth record ID is"+ORD_al_AuthRecord{$_l_AuthSelectedRow})
			
			$_l_AuthSelectedRow:=ORD_at_CCAUTH
			$_l_CCID:=ORD_al_CCID{ORD_at_CCAUTH}
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
				
				READ WRITE:C146([CC_OrderAuths:133])
				QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_AuthSelectedRow})
				If ([CC_OrderAuths:133]TransactionID:10#0)
					QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
					If (Records in selection:C76([CCM_PSPTransaction:136])>0)
						$_r_AuthedAmount:=[CC_OrderAuths:133]AuthorizationAmount:5
						If ([CCM_PSPTransaction:136]XTransactionStatus:15#-13)
							If ((Current date:C33(*)-120)<ORD_ad_CCAuthDate{$_l_AuthSelectedRow})  //Added NG November 2009 to prevent refund if over 120 days
								Case of 
									: ([CC_OrderAuths:133]xDepositCode:8#"") & ([CC_OrderAuths:133]xinvoiceCode:9="")
										Gen_Confirm("The Transaction id you are about to refund is "+[CCM_PSPTransaction:136]xPSPTransID:16+" Auth ID= "+ORD_at_CCAUTH{ORD_at_CCAUTH}+".  Please confirm this is the correct transaction to refund"; "Correct"; "Stop")
										If (OK=1)
											$_t_DepositToRefund:=[CC_OrderAuths:133]xDepositCode:8
											Gen_Confirm("Are you sure you wish to refund a deposit"; "Yes"; "No")
											If (OK=1)
												$_bo_DoVoid:=False:C215
												$_bo_Rebill:=False:C215
												$_r_RefundAmount:=0
												Gen_Confirm("Refund Whole Amount"; "Yes"; "No")
												If (OK=1)
													QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)  //few lines just to make sure
													QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
													QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
													If (Records in selection:C76([INVOICES:39])>0)
														CREATE SET:C116([INVOICES:39]; "Userset")
														//``
														
														//``
														$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
														If ($_l_VoidID>0)
															QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_VoidID)
															Gen_Alert(" The void id  "+[CCM_PSPTransaction:136]xPSPTransID:16)
															INV_RefundSel(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5)
															$_bo_DoVoid:=True:C214
														Else 
															Gen_Alert("Sorry the refund could not be done so the deposit has not been"+" cancelled")
															$_bo_DoVoid:=False:C215
														End if 
													Else 
														Gen_Alert("Sorry that deposit cannot be refunded")
													End if 
													
												Else 
													CCM_LoadServiceProvidersV11(True:C214)
													$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
													//UNLOAD RECORD([CC_OrderAuths])
													QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //²
													$_l_PSPServiceID:=[CCM_PSPTransaction:136]XPSPID:14  //²
													$_ti_PSPTime:=[CCM_PSPTransaction:136]xCreatedTime:17  //Note that this time is not accurate to the second..because we created it on the record it is not synched with AN
													UNLOAD RECORD:C212([CCM_PSPTransaction:136])
													$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_PSPServiceID)
													CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
													$_bo_NotReconciled:=False:C215
													If ($_ti_PSPTime>CCM_ti_ReconcileTime)  //THis transaction was created AFTER the reconcile time
														If ((Current date:C33(*)-1)=[CC_OrderAuths:133]AuthorizationDate:4)  //NG added November 2009. Used new time field to test if the transaction happened yesterday after the reconcile time
															If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30))  // uless we are after reconcile time today
																$_bo_NotReconciled:=True:C214
															End if 
														End if 
													End if 
													Case of 
														: ((Current time:C178(*)*1)>((CCM_ti_ReconcileTime*1)-30)) & ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)+30)) & (Current date:C33(*)=[CC_OrderAuths:133]AuthorizationDate:4)
															Gen_Alert("This transaction cannot be refunded at this time,please try again in a few minute"+"s"; "Stop")
														: (((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30)) & (Current date:C33(*)=[CC_OrderAuths:133]AuthorizationDate:4)) | ($_bo_NotReconciled)  //$_bo_NotReconciled is set if the transaction happended yesterday after reconcile time
															
															Gen_Confirm("You may not do a partial refund on this as it has not been settled, you may only "+"do a total refund. You should then obtain the new amount in a seperate transactio"+"n"; "Refund"; "Stop")
															If (OK=1)
																QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
																//few lines just to make sure
																QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
																If (Records in selection:C76([INVOICES:39])>0)
																	CREATE SET:C116([INVOICES:39]; "Userset")
																	$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
																	If ($_l_VoidID>0)
																		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_VoidID)
																		Gen_Alert(" The void id  "+[CCM_PSPTransaction:136]xPSPTransID:16)
																		INV_RefundSel(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5)
																		$_bo_DoVoid:=True:C214
																	Else 
																		Gen_Alert("Sorry the refund could not be done so the deposit has not been"+" cancelled")
																		
																		$_bo_DoVoid:=False:C215
																		
																	End if 
																Else 
																	Gen_Alert("Sorry that deposit cannot be refunded")
																End if 
																
															Else 
																$_bo_CancelRefund:=True:C214
															End if 
														Else 
															$_bo_CancelRefund:=False:C215
															Repeat 
																$_r_RefundAmount:=Gen_RequestAmount("Enter amount to refund"; Is real:K8:4; [CC_OrderAuths:133]AuthorizationAmount:5)
																If (OK=1)
																	Case of 
																		: ($_r_RefundAmount=0)
																			Gen_Confirm("The amount entered is 0. Cancel Refund?"; "Yes"; "No")
																			If (OK=1)
																				$_bo_CancelRefund:=True:C214
																			End if 
																		: ($_r_RefundAmount>[CC_OrderAuths:133]AuthorizationAmount:5)
																			Gen_Alert("You cannot refund more than the original payment")
																	End case 
																Else 
																	$_bo_CancelRefund:=True:C214
																End if 
															Until ($_r_RefundAmount>0) & ($_r_RefundAmount<[CC_OrderAuths:133]AuthorizationAmount:5) | ($_bo_CancelRefund)
															If (Not:C34($_bo_CancelRefund))
																//here we still refund the whole amount..and then auto create an invoice for the new amount
																$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
																QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
																//few lines just to make sure
																QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
																QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
																If (Records in selection:C76([INVOICES:39])>0)
																	CREATE SET:C116([INVOICES:39]; "Userset")
																	$_l_VoidID:=CCM_VoidTransaction(ORD_al_AuthRecord{$_l_AuthSelectedRow}; [ORDERS:24]Currency_Code:32; ORD_ad_CCAuthDate{$_l_AuthSelectedRow}; $_r_RefundAmount)
																	If ($_l_VoidID>0)
																		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_VoidID)
																		//Amount
																		$CCM_T_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
																		Case of 
																			: ([CCM_PSPTransaction:136]PSPUSED:4="DUMMY")
																				
																			: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
																				
																				
																			: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
																				$_t_AmountString:=CCM_ExtractField("Authorize Net"; "Amount"; $CCM_T_Response)
																				
																				$_r_RefundAmount:=Num:C11($_t_AmountString)
																				$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
																				//Gen_Alert (" The void id  "+[CCM_PSPTransaction]xPSPTransID)
																				INV_RefundSel(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5; False:C215)
																				$_bo_DoVoid:=True:C214
																			: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
																				$_l_CharactersPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
																				$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																				$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharactersPosition+Length:C16("END REQUEST TYPE"))
																				$_l_CharactersPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
																				$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																				$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharactersPosition+Length:C16("END REQUEST RESPONSE"))
																				$_l_CharactersPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
																				$_t_TransactionDetails:=Substring:C12($CCM_T_Response; 1; $_l_CharactersPosition-1)
																				
																				$_t_AmountString:=CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText; $_t_RequestModule)
																				$_r_RefundAmount:=Num:C11($_t_AmountString)
																				$_r_RebillAmount:=[CC_OrderAuths:133]AuthorizationAmount:5-$_r_RefundAmount
																				INV_RefundSel(False:C215; [CC_OrderAuths:133]AuthorizationAmount:5; False:C215)  //INV_RefundSel (False;[CC_OrderAuths]AuthorizationAmount)
																				$_bo_DoVoid:=True:C214
																		End case 
																	Else 
																		$_bo_DoVoid:=False:C215
																		Gen_Alert("Sorry the Credit could not be done so the deposit has not been "+"cancelled")
																	End if 
																Else 
																	$_bo_DoVoid:=False:C215
																	$_r_RebillAmount:=0
																	Gen_Alert("Sorry that deposit cannot be refunded")
																End if 
																
																$_bo_Rebill:=($_r_RebillAmount#0)  //The amount entered may be the whole amount
																//Void or credit the transaction with AN
																
															Else 
																$_r_RebillAmount:=0
																$_bo_Rebill:=False:C215
															End if 
													End case 
													
												End if 
												If ($_bo_Rebill)
													If ($_r_RebillAmount>0)
														//only create one(normally there is only one deposit amount anyway
														QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositToRefund)
														DUPLICATE RECORD:C225([INVOICES:39])
														[INVOICES:39]Invoice_Number:1:=""  //We did not refund the whole amount. create a replacement deposit for the new amount..dont forget that you did this when you create the receipt
														InvP_No
														$_l_AddMode:=Vadd
														DB_t_CurrentFormUsage2:=""
														Vadd:=1
														[INVOICES:39]Total_Paid:6:=$_r_RebillAmount
														[INVOICES:39]Posted_Date:8:=!00-00-00!
														DB_SaveRecord(->[INVOICES:39])
														Vadd:=$_l_AddMode
														If ((OK=1) & ([INVOICES:39]Posted_Date:8=!00-00-00!) & ([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Period_Code:13#"") & ([INVOICES:39]Total_Paid:6#0))
															$_bo_Posted:=Inv_DepPost
															If (Not:C34($_bo_Posted))
																OK:=0
															End if 
														Else 
															OK:=0
														End if 
														$_t_NewDepositNumber:=[INVOICES:39]Invoice_Number:1
														UNLOAD RECORD:C212([INVOICES:39])
														
														//````
														
													End if 
													
												End if 
												If ($_bo_DoVoid)
													If ($_r_RefundAmount>0)  //partial refund
														//$`VoidID:=CCM_VoidTransaction (ORD_al_AuthRecord{$_l_AuthSelectedRow};[ORDERS]Currency Code;ORD_ad_CCAuthDate{$_l_AuthSelectedRow};$_r_RefundAmount)
													Else   //total refund
														//$_l_VoidID:=CCM_VoidTransaction (ORD_al_AuthRecord{$_l_AuthSelectedRow};[ORDERS]Currency Code;ORD_ad_CCAuthDate{$_l_AuthSelectedRow})
													End if 
													If ($_l_VoidID>0)
														//the transaction is voided so set the record
														
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_AuthSelectedRow})
														[CC_OrderAuths:133]xAuthStatus:7:=4
														ORD_al_AuthStatus{$_l_AuthSelectedRow}:=4
														If ($_r_RefundAmount>0) & ($_r_RefundAmount<$_r_AuthedAmount)
															[CC_OrderAuths:133]RefundedAmount:11:=$_r_RefundAmount
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
														ORD_at_AuthStatus{$_l_AuthSelectedRow}:="Voided"
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														READ ONLY:C145([CC_OrderAuths:133])
														
													End if 
													CCM_LoadOrderAuths([ORDERS:24]x_ID:58)
													
													
												End if 
												
												
												
											End if 
										End if 
									Else 
										Gen_Alert("This Auth has been invoiced please refund from the invoice")
								End case 
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
			End if   //CC not found
		Else 
			Gen_Alert("This authorization may not be voided")
			
			
	End case 
Else 
	Gen_Alert("You must select an authorization to void")
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,bVoid"; $_t_oldMethodName)
