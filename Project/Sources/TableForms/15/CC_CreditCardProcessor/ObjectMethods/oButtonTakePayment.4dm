If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsOK; $_bo_OK; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; CCM_bo_isCredit; CCM_bo_PaymentTaken)
	C_LONGINT:C283($_l_AuthTransID; $_l_AuthTransIDOLD; $_l_Delay; $_l_Repeats; CC_l_AuthTransID; CCM_l_cardIDtoAuth; CCM_l_CCAuditID; CCM_l_CurrentOwnerID; CCM_l_OrderID; CCM_l_PreAuthID; CCM_l_RejectedID)
	C_REAL:C285(CCM_R_AuthAmount)
	C_TEXT:C284($_t_AuthCode; $_t_oldMethodName; $_t_oldMethodName2; CC_t_AuthCode; CC_T_CardNumber; CCM_t_CurrencyCode; CCM_t_InvoiceNumber)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]CC_CreditCardProcessor.Variable17"; Form event code:C388)

//This will take a payment(deposit or receipt)
If (Not:C34(CCM_bo_PaymentTaken))
	If (CC_T_CardNumber#"")
		
		
		If (CCM_R_AuthAmount>0)  //& Not(CCM_bo_isCredit))
			
			
			
			If (CC_t_AuthCode#"")
				If (CC_t_AuthCode#"000000")
					If (CCM_l_PreAuthID>0) & (CCM_l_CCAuditID=0)
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=CCM_l_PreAuthID)
						
						CCM_l_CCAuditID:=[CC_OrderAuths:133]TransactionID:10
					End if 
					$_l_AuthTransIDOLD:=CCM_l_CCAuditID
					$_t_AuthCode:=CC_t_AuthCode
					//we got an auth on the screen we now take a payment
					//we have not created however an auth record
					//actually here this could have an avs failure so check that before we process
					Gen_Confirm("Take full payment of "+String:C10(CCM_R_AuthAmount)+"?"; "Yes"; "No")
					If (OK=0)
						CCM_R_AuthAmount:=Gen_RequestAmount("Payment to take"; Is real:K8:4; CCM_R_AuthAmount)
					Else 
						CCM_R_AuthAmount:=CCM_R_AuthAmount
					End if 
					OK:=1
					CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth; CC_t_AuthCode; $_l_AuthTransIDOLD)
					If (CCM_l_CCAuditID>0)
						
						
						$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_IsOK)
							CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
							If (CC_t_AuthCode#"")
								OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
								CCM_bo_PaymentTaken:=True:C214
								READ WRITE:C146([CCM_PSPTransaction:136])
								QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
								//
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
								//
								[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
								[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
								DB_SaveRecord(->[CCM_PSPTransaction:136])
							End if 
						End if 
					Else 
						//````
						Case of 
							: (CCM_l_CCAuditID=0)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								CCM_l_CCAuditID:=0
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_RejectedID:=0
								CCM_l_CCAuditID:=$_l_AuthTransIDOLD
								CC_t_AuthCode:=$_t_AuthCode
								CCM_bo_PaymentTaken:=False:C215
							: (CCM_l_CCAuditID=-909)
								//here because this was already an auth no need to store a NEW auth(we used the same auth code) but for some reason AVS has now failed
								//if it had failed the first time the user would probably have selected to continue with AVS off...
								//we now re-use the same auth with AVS switched off
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								CCM_l_CCAuditID:=0
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								
								//``
								//
								//```
								//AVS rejection
								//record the FAILED  but the amount was authd'
								
								
								CCM_l_RejectedID:=0
								CCM_bo_DisableAVSTEMP:=True:C214
								CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth; $_t_AuthCode; $_l_AuthTransIDOLD)
								If (CCM_l_CCAuditID>0)
									
									$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
										If (CC_t_AuthCode#"")
											OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
											CCM_bo_PaymentTaken:=True:C214
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
											[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											DB_SaveRecord(->[CCM_PSPTransaction:136])
										End if 
									Else 
										CC_t_AuthCode:=$_t_AuthCode
									End if 
								Else 
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
									CCM_l_CCAuditID:=0
									READ WRITE:C146([CC_OrderAuths:133])
									CREATE RECORD:C68([CC_OrderAuths:133])
									[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
									[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
									[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
									[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
									[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
									[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
									[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ ONLY:C145([CC_OrderAuths:133])
									CCM_l_RejectedID:=0
									CCM_l_CCAuditID:=$_l_AuthTransIDOLD
									CC_t_AuthCode:=$_t_AuthCode
									CCM_bo_PaymentTaken:=False:C215
									
								End if 
								CCM_bo_DisableAVSTEMP:=False:C215
							: (CCM_l_CCAuditID=-907)  // reject AVS
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_RejectedID:=0
								
							: (CCM_l_CCAuditID=-908)
								//CVV2 Failure
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=6  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_CCAuditID:=0
								CCM_bo_CV2Retry:=True:C214
								//don't record this as an auth.
								CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth; CC_t_AuthCode; $_l_AuthTransIDOLD)
								If (CCM_l_CCAuditID>0)
									
									$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
										If (CC_t_AuthCode#"")
											OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
											CCM_bo_PaymentTaken:=True:C214
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
											[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											DB_SaveRecord(->[CCM_PSPTransaction:136])
										End if 
									Else 
										CC_t_AuthCode:=""
									End if 
									
								Else 
									Gen_Alert("You may not retry a CVV2 again")
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
									CCM_l_CCAuditID:=0
									READ WRITE:C146([CC_OrderAuths:133])
									CREATE RECORD:C68([CC_OrderAuths:133])
									[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
									[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
									[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
									[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
									[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
									[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
									[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ ONLY:C145([CC_OrderAuths:133])
									CCM_l_RejectedID:=0
									CCM_l_CCAuditID:=$_l_AuthTransIDOLD
									CC_t_AuthCode:=$_t_AuthCode
									CCM_bo_PaymentTaken:=False:C215
									
									
								End if 
								CCM_bo_CV2Retry:=True:C214
						End case 
						
						//````
					End if 
				Else 
					Gen_Alert("The Auth code is not valid-(a fail) so payment cannot be taken")
				End if 
			Else 
				$_l_AuthTransIDOLD:=0
				$_t_AuthCode:=""
				
				//we get an auth and payment
				//if successfull create a deposit
				If (CCM_bo_isCredit)
					CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; -CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth)
					If (CCM_l_CCAuditID>0)
						//``
						$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_IsOK)
							
							CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
							
							If (CC_t_AuthCode#"")
								OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
								CCM_bo_PaymentTaken:=True:C214
								READ WRITE:C146([CCM_PSPTransaction:136])
								QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
								[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
								[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
								DB_SaveRecord(->[CCM_PSPTransaction:136])
							End if 
						End if 
						
						//`
					Else 
						
					End if 
					
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("Getting payment "+String:C10(CCM_R_AuthAmount))
					
					CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth)
					If (CCM_l_CCAuditID>0)
						
						$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						
						If ($_bo_IsOK)
							CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
							If (CC_t_AuthCode#"")
								OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
								CCM_bo_PaymentTaken:=True:C214
								READ WRITE:C146([CCM_PSPTransaction:136])
								QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
								If ([INVOICES:39]Invoice_Number:1="*D@")
									[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
								Else 
									[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
								End if 
								[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
								DB_SaveRecord(->[CCM_PSPTransaction:136])
							End if 
						End if 
						
					Else 
						//the processing failed..this was a new get so if we did get an auth code
						Case of 
							: (CCM_l_CCAuditID=0)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								CCM_l_CCAuditID:=0
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_RejectedID:=0
								CCM_l_CCAuditID:=$_l_AuthTransIDOLD
								CC_t_AuthCode:=$_t_AuthCode
								CCM_bo_PaymentTaken:=False:C215
								
							: (CCM_l_CCAuditID=-909)
								//Gen_Alert ("This received a 909. The daybook CCM record for the Rejected tranaction is "+String(CCM_l_RejectedID))
								$_t_oldMethodName2:=ERR_MethodTracker("Returned a -909")
								
								$_l_AuthTransID:=CCM_l_RejectedID
								$_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								$_t_oldMethodName2:=ERR_MethodTracker("Auth Code was"+$_t_AuthCode+" Rejected ID was "+String:C10($_l_AuthTransID))
								
								
								//here because this was a new auth need to store a NEW auth because a second AUTH will happen which will be recorded
								CCM_l_CCAuditID:=0
								//AVS rejection
								//record the FAILED  but the amount was authd' so need to record the auth(there will be a second)
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=$_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								$_t_oldMethodName2:=ERR_MethodTracker("Created  order auth for  order ID"+String:C10(CCM_l_OrderID))
								
								
								
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								
								CCM_l_RejectedID:=0
								CCM_bo_DisableAVSTEMP:=True:C214
								//If ($_t_AuthCode#"00000@")
								//CCM_l_CCAuditID:=CCM_ProcessCard (CCM_t_CurrencyCode;CCM_R_AuthAmount;0;Table(->[CONTACTS]);CCM_l_CurrentOwnerID;CCM_l_cardIDtoAuth;$_t_AuthCode;$_l_AuthTransID)
								//Else
								$_t_oldMethodName2:=ERR_MethodTracker("About to re-process card")
								
								CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth)
								$_t_oldMethodName2:=ERR_MethodTracker("Card reprossed"+" Audit ID="+String:C10(CCM_l_CCAuditID))
								
								If (CCM_l_CCAuditID>0)
									
									$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
									If ($_bo_IsOK)
										$_t_oldMethodName2:=ERR_MethodTracker("Response is valid")
										
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
										$_t_oldMethodName2:=ERR_MethodTracker("auth code="+CC_t_AuthCode)
										
										If (CC_t_AuthCode#"")
											OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
											CCM_bo_PaymentTaken:=True:C214
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
											[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
											$_t_oldMethodName2:=ERR_MethodTracker("audit record being set to status or -1")
											
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											DB_SaveRecord(->[CCM_PSPTransaction:136])
										End if 
									Else 
										CC_t_AuthCode:=""
									End if 
								Else 
									$_t_oldMethodName2:=ERR_MethodTracker("Reprosses did not create a valid auth")
									
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
									CCM_l_CCAuditID:=0
									READ WRITE:C146([CC_OrderAuths:133])
									CREATE RECORD:C68([CC_OrderAuths:133])
									[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
									[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
									[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
									[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
									[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
									[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
									[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ ONLY:C145([CC_OrderAuths:133])
									CCM_l_RejectedID:=0
									CCM_l_CCAuditID:=$_l_AuthTransIDOLD
									CC_t_AuthCode:=$_t_AuthCode
									CCM_bo_PaymentTaken:=False:C215
									
								End if 
								CCM_bo_DisableAVSTEMP:=False:C215
							: (CCM_l_CCAuditID=-907)  // reject AVS
								Gen_Alert("This received a 907. The daybook CCM record for the Rejected tranaction is "+String:C10(CCM_l_RejectedID)+". No retry will happen automatically")
								
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_RejectedID:=0
								
								
								
							: (CCM_l_CCAuditID=-908)
								//CVV2 Failure
								CCM_l_CCAuditID:=0
								CCM_bo_CV2Retry:=True:C214
								//don't record this as an auth.
								CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
								[CC_OrderAuths:133]xAuthStatus:7:=6  //awaiting payment(`and always will be!)
								[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								CCM_l_CCAuditID:=0
								CCM_bo_CV2Retry:=True:C214
								//don't record this as an auth.
								CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuth; CC_t_AuthCode; $_l_AuthTransIDOLD)
								If (CCM_l_CCAuditID>0)
									
									$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
									If ($_bo_IsOK)
										$_t_oldMethodName2:=ERR_MethodTracker("Response is ok")
										
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
										$_t_oldMethodName2:=ERR_MethodTracker("Response is ok")
										
										If (CC_t_AuthCode#"")
											OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
											CCM_bo_PaymentTaken:=True:C214
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
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
											[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											DB_SaveRecord(->[CCM_PSPTransaction:136])
											
										End if 
									Else 
										$_t_oldMethodName2:=ERR_MethodTracker("Respone is not ok")
										
										CC_t_AuthCode:=""
									End if 
									
								Else 
									Gen_Alert("You may not retry a CVV2 again")
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
									CCM_l_CCAuditID:=0
									READ WRITE:C146([CC_OrderAuths:133])
									CREATE RECORD:C68([CC_OrderAuths:133])
									[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
									[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
									[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
									[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
									[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
									[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
									[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ ONLY:C145([CC_OrderAuths:133])
									CCM_l_RejectedID:=0
									CC_l_AuthTransID:=$_l_AuthTransIDOLD
									CC_t_AuthCode:=$_t_AuthCode
									CCM_bo_PaymentTaken:=False:C215
									
									
								End if 
								
								CCM_bo_CV2Retry:=True:C214
						End case 
						
						
					End if 
					
				End if 
			End if 
		Else 
			Gen_Alert("No amount has been entered")
		End if 
	Else 
		Gen_Alert("You must select a card first")
	End if 
Else 
	Gen_Alert("You have already taken payment, you must exit this screen and re-enter to take ad"+"ditional  payments")
End if 
ERR_MethodTrackerReturn("OBJ:CC_CreditCardProcessor,Bpay"; $_t_oldMethodName)
