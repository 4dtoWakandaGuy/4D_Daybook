If (False:C215)
	//object Name: [INVOICES]Invoice_inP.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CCAuthDate; 0)
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	ARRAY LONGINT:C221($_al_AuthRecord; 0)
	ARRAY LONGINT:C221($_al_AuthStatus; 0)
	ARRAY LONGINT:C221($_al_CCID; 0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(ORD_al_AuthRecord;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY LONGINT(ORD_al_CCID;0)
	ARRAY REAL:C219($_ar_CCAmount; 0)
	//ARRAY REAL(ORD_ar_CCAmount;0)
	ARRAY TEXT:C222($_at_AuthStatus; 0)
	ARRAY TEXT:C222($_at_CCAUTH; 0)
	ARRAY TEXT:C222($_at_InvoiceCode; 0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	//ARRAY TEXT(ORD_at_InvoiceCode;0)
	C_BOOLEAN:C305($_bo_GetMoney; $_bo_IsOK; $_bo_OK; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; CCM_bo_PaymentTaken; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_AmountRow; $_l_AuthID; $_l_AuthIndex; $_l_AuthsCount; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delay; $_l_Repeats; BCCM; CCM_l_cardIDtoAuth; CCM_l_CCAuditID)
	C_LONGINT:C283(CCM_l_OrderID; CCM_l_RejectedID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(CCM_R_AuthAmount)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode; CCM_t_CompanyCode; CCM_t_DepositNumber; CCM_t_InvoiceNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoice_inP.Variable10"; Form event code:C388)
//This button will allow that acceptance of the payment via a credit card...note that where the deposit relates to an invoice
//there may already be an authorization.
If ([INVOICES:39]Contact_Code:3#"")
	//TRACE
	QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xDepositCode:8=[INVOICES:39]Invoice_Number:1)
	If (Records in selection:C76([CC_OrderAuths:133])=0)
		If ([INVOICES:39]X_DepositRelatedRecordID:45>0) & ([INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]))
			CCM_LoadOrderAuths([INVOICES:39]X_DepositRelatedRecordID:45; False:C215)
			If (Size of array:C274(ORD_at_CCAUTH)>0)
				$_l_AuthsCount:=Size of array:C274(ORD_at_AuthStatus)
				ARRAY TEXT:C222($_at_CCAUTH; $_l_AuthsCount)
				ARRAY DATE:C224($_ad_CCAuthDate; $_l_AuthsCount)
				ARRAY REAL:C219($_ar_CCAmount; $_l_AuthsCount)
				ARRAY LONGINT:C221($_al_CCID; $_l_AuthsCount)
				ARRAY LONGINT:C221($_al_AuthStatus; $_l_AuthsCount)
				ARRAY TEXT:C222($_at_AuthStatus; $_l_AuthsCount)
				ARRAY TEXT:C222($_at_InvoiceCode; $_l_AuthsCount)
				ARRAY LONGINT:C221($_al_AuthRecord; $_l_AuthsCount)
				
				$_l_CurrentRow:=0
				For ($_l_AuthIndex; 1; Size of array:C274(ORD_at_AuthStatus))
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_AuthIndex})
					If (ORD_al_AuthStatus{$_l_AuthIndex}=1) & (ORD_ad_CCAuthDate{$_l_AuthIndex}>(Current date:C33-30)) & ([CC_OrderAuths:133]xDepositCode:8="") & ([CC_OrderAuths:133]xinvoiceCode:9="")
						//cannot take a deposit against an invoice!
						$_l_CurrentRow:=$_l_CurrentRow+1
						$_at_CCAUTH{$_l_CurrentRow}:=ORD_at_CCAUTH{$_l_AuthIndex}
						$_ad_CCAuthDate{$_l_CurrentRow}:=ORD_ad_CCAuthDate{$_l_AuthIndex}
						$_ar_CCAmount{$_l_CurrentRow}:=ORD_ar_CCAmount{$_l_AuthIndex}
						$_al_CCID{$_l_CurrentRow}:=ORD_al_CCID{$_l_AuthIndex}
						$_al_AuthStatus{$_l_CurrentRow}:=ORD_al_AuthStatus{$_l_AuthIndex}
						$_al_AuthRecord{$_l_CurrentRow}:=ORD_al_AuthRecord{$_l_AuthIndex}
					End if 
				End for 
				ARRAY TEXT:C222($_at_CCAUTH; $_l_CurrentRow)
				ARRAY DATE:C224($_ad_CCAuthDate; $_l_CurrentRow)
				ARRAY REAL:C219($_ar_CCAmount; $_l_CurrentRow)
				ARRAY LONGINT:C221($_al_CCID; $_l_CurrentRow)
				ARRAY LONGINT:C221($_al_AuthStatus; $_l_CurrentRow)
				ARRAY TEXT:C222($_at_AuthStatus; $_l_CurrentRow)
				ARRAY TEXT:C222($_at_InvoiceCode; $_l_CurrentRow)
				ARRAY LONGINT:C221($_al_AuthRecord; $_l_CurrentRow)
				If (Size of array:C274($_at_CCAUTH)>0)
					COPY ARRAY:C226($_at_CCAUTH; ORD_at_CCAUTH)
					COPY ARRAY:C226($_ad_CCAuthDate; ORD_ad_CCAuthDate)
					COPY ARRAY:C226($_ar_CCAmount; ORD_ar_CCAmount)
					COPY ARRAY:C226($_al_CCID; ORD_al_CCID)
					COPY ARRAY:C226($_al_AuthStatus; ORD_al_AuthStatus)
					COPY ARRAY:C226($_at_AuthStatus; ORD_at_AuthStatus)
					COPY ARRAY:C226($_at_InvoiceCode; ORD_at_InvoiceCode)
					COPY ARRAY:C226($_al_AuthRecord; ORD_al_AuthRecord)
					If (Size of array:C274($_at_CCAUTH)>1)
						//select one
						If ([INVOICES:39]Total_Paid:6#0)
							//try to find one for this amount
							$_l_AmountRow:=Find in array:C230($_ar_CCAmount; [INVOICES:39]Total_Paid:6)
							If ($_l_AmountRow>0)
								//use that one
								OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
								[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{$_l_AmountRow}
								$_bo_GetMoney:=True:C214
								$_l_AuthID:=ORD_al_AuthRecord{$_l_AmountRow}
							Else 
								//have to select one
								Gen_Confirm("There is no authorization for an amount of "+String:C10([INVOICES:39]Total_Paid:6; "########0.00;-########0.00;0")+"Obtain authorization for this amount or select a different amount?"; "Authorize"; "Select")
								If (OK=1)
									//authorize new
									$_bo_GetMoney:=True:C214
									$_l_AuthID:=0
								Else 
									//select and change
									ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(ORD_al_AuthRecord))
									ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(ORD_al_AuthRecord))
									For ($_l_AuthIndex; 1; Size of array:C274(ORD_al_AuthRecord))
										GEN_at_DropDownMenu{$_l_AuthIndex}:=String:C10($_ar_CCAmount{$_l_AuthIndex}; "########0.00;-########0.00;0")
										GEN_al_DropDownMenuID{$_l_AuthIndex}:=ORD_al_AuthRecord{$_l_AuthIndex}
									End for 
									$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
									WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
									GEN_Bo_ShowCreate:=False:C215
									DIALOG:C40([USER:15]; "Gen_PopUpChoice")
									CLOSE WINDOW:C154
									WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
									If (GEN_at_DropDownMenu>0)
										OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
										[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{GEN_at_DropDownMenu}
										$_bo_GetMoney:=True:C214
										$_l_AuthID:=ORD_al_AuthRecord{GEN_at_DropDownMenu}
									Else 
										$_bo_GetMoney:=False:C215
										$_l_AuthID:=0
									End if 
									
								End if 
								
							End if 
							
						Else 
							//have to select one
							
							
							ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(ORD_al_AuthRecord))
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(ORD_al_AuthRecord))
							For ($_l_AuthIndex; 1; Size of array:C274(ORD_al_AuthRecord))
								GEN_at_DropDownMenu{$_l_AuthIndex}:=String:C10($_ar_CCAmount{$_l_AuthIndex}; "########0.00;-########0.00;0")
								GEN_al_DropDownMenuID{$_l_AuthIndex}:=ORD_al_AuthRecord{$_l_AuthIndex}
							End for 
							Open window:C153(20; 20; 20; 20; -1986)
							GEN_Bo_ShowCreate:=False:C215
							DIALOG:C40([USER:15]; "Gen_PopUpChoice")
							CLOSE WINDOW:C154
							If (GEN_at_DropDownMenu>0)
								OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
								[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{GEN_at_DropDownMenu}
								$_bo_GetMoney:=True:C214
								$_l_AuthID:=ORD_al_AuthRecord{GEN_at_DropDownMenu}
							Else 
								$_bo_GetMoney:=False:C215
								$_l_AuthID:=0
							End if 
							
						End if 
						
					Else 
						If ($_ar_CCAmount{1}#[INVOICES:39]Total_Paid:6)
							If ([INVOICES:39]Total_Paid:6#0)
								Gen_Confirm("This authorization is for "+String:C10($_ar_CCAmount{1}; "########0.00;-########0.00;0")+" Do you wish to change the amount of this deposit?"; "Yes"; "No")
								If (OK=1)
									OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
									[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{1}
									$_bo_GetMoney:=True:C214
									$_l_AuthID:=ORD_al_AuthRecord{1}
								Else 
									Gen_Confirm("Take payment of "+String:C10([INVOICES:39]Total_Paid:6)+"?"; "Yes"; "No")
									
									If (OK=1)
										$_bo_GetMoney:=True:C214
										$_l_AuthID:=ORD_al_AuthRecord{1}
									Else 
										Gen_Confirm("This authorization cannot be used with this deposit. Obtain Authorization for "+String:C10([INVOICES:39]Total_Paid:6; "########0.00;-########0.00;0")+" ?"; "Yes"; "No")
										If (OK=1)
											$_bo_GetMoney:=True:C214
											$_l_AuthID:=0
										Else 
											$_bo_GetMoney:=False:C215
											$_l_AuthID:=0
										End if 
									End if 
								End if 
							Else 
								Gen_Confirm("Take full payment of "+String:C10($_ar_CCAmount{1})+"?"; "Yes"; "No")
								If (OK=0)
									OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
									[INVOICES:39]Total_Paid:6:=Gen_RequestAmount("Amount to take"; Is real:K8:4; $_ar_CCAmount{1})
									$_bo_GetMoney:=True:C214
									$_l_AuthID:=ORD_al_AuthRecord{1}
								Else 
									OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
									[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{1}
									$_bo_GetMoney:=True:C214
									$_l_AuthID:=ORD_al_AuthRecord{1}
								End if 
							End if 
							
							
						Else 
							//set the amount of the deposit
							OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
							[INVOICES:39]Total_Paid:6:=$_ar_CCAmount{1}
							$_bo_GetMoney:=True:C214
							$_l_AuthID:=ORD_al_AuthRecord{1}
						End if 
					End if 
				Else 
					//No outstanding authorizations
					$_bo_GetMoney:=True:C214
					$_l_AuthID:=0
				End if 
				
				
				
			Else 
				$_bo_GetMoney:=True:C214
				$_l_AuthID:=0
				//no prior authorizations
			End if 
			If ($_bo_GetMoney)
				If ($_l_AuthID>0)
					If ([CONTACTS:1]Contact_Code:2#[INVOICES:39]Contact_Code:3)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
					End if 
					//TRACE
					CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; $_l_AuthID)
					//```
					//TRACE
					If (CCM_l_CCAuditID>0)
						
						$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_IsOK)
							CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
							If (CC_t_AuthCode#"")
								READ WRITE:C146([CC_OrderAuths:133])
								
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_AuthID)
								[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
								[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID  //link the auth to the new PSP
								
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								READ ONLY:C145([CC_OrderAuths:133])
								
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
								//TRACE
								If ([CCM_PSPTransaction:136]xOrderID:10=0)
									[CCM_PSPTransaction:136]xOrderID:10:=[INVOICES:39]X_DepositRelatedRecordID:45
								End if 
								DB_SaveRecord(->[CCM_PSPTransaction:136])
								
							End if 
						End if 
					Else 
						//````
						Case of 
							: (CCM_l_CCAuditID=-909)
								CCM_l_CCAuditID:=0
								//AVS rejection
								//record the FAILED  but the amount was authd'
								CCM_l_RejectedID:=0
								CCM_bo_DisableAVSTEMP:=True:C214
								CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; $_l_AuthID)
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
									End if 
								End if 
								CCM_bo_DisableAVSTEMP:=False:C215
							: (CCM_l_CCAuditID=-907)  // reject AVS
								CCM_l_RejectedID:=0
								
							: (CCM_l_CCAuditID=-908)
								//CVV2 Failure
								CCM_l_CCAuditID:=0
								CCM_bo_CV2Retry:=True:C214
								//don't record this as an auth.
								CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; $_l_AuthID)
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
									End if 
									
								Else 
									Gen_Alert("You may not retry a CVV2 again")
									
								End if 
								CCM_bo_CV2Retry:=True:C214
						End case 
						
						//````
					End if 
					
					//````
					UNLOAD RECORD:C212([CONTACTS:1])
					
					//and put this deposit on the transaction
					$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
					If ($_bo_IsOK)
						If ([CCM_PSPTransaction:136]x_ID:1#CCM_l_CCAuditID)
							QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
							
						End if 
						If ([CCM_PSPTransaction:136]x_CCID:8#0)
							//Get card type
							If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
								QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_l_cardIDtoAuth)
							End if 
							[INVOICES:39]Cheque_Number:36:=[xCreditCardDetails:132]Card_TypeName:5
						End if 
						
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
						If (CC_t_AuthCode#"")
							READ WRITE:C146([CC_OrderAuths:133])
							QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_AuthID)
							[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
							DB_SaveRecord(->[CC_OrderAuths:133])
							OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
							OBJECT SET VISIBLE:C603(BCCM; False:C215)
							OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
						Else 
							OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
						End if 
					Else 
						OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
					End if 
					
				Else 
					// no existing auth BUT there is an order so create do an auth capture and record the  order authorization as well
					If ([CONTACTS:1]Contact_Code:2#[INVOICES:39]Contact_Code:3)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
					End if 
					CCM_t_CompanyCode:=[INVOICES:39]Company_Code:2
					CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
					UNLOAD RECORD:C212([CONTACTS:1])
					If (CCM_l_CCAuditID>0)
						QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
						$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_IsOK)
							CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
							If (CC_t_AuthCode#"")
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
								If ([CCM_PSPTransaction:136]xOrderID:10=0)
									[CCM_PSPTransaction:136]xOrderID:10:=[INVOICES:39]X_DepositRelatedRecordID:45
								End if 
								DB_SaveRecord(->[CCM_PSPTransaction:136])
								If ([CCM_PSPTransaction:136]x_CCID:8#0)
									//Get card type
									If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=[CCM_PSPTransaction:136]x_CCID:8)
									End if 
									CCM_l_cardIDtoAuth:=[CCM_PSPTransaction:136]x_CCID:8
									[INVOICES:39]Cheque_Number:36:=[xCreditCardDetails:132]Card_TypeName:5
								End if 
								
								READ WRITE:C146([CC_OrderAuths:133])
								CREATE RECORD:C68([CC_OrderAuths:133])
								[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
								[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
								[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
								[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
								[CC_OrderAuths:133]Order_ID:2:=[INVOICES:39]X_DepositRelatedRecordID:45
								
								[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
								
								[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
								[CC_OrderAuths:133]xAuthStatus:7:=3
								//and put it on the [CCM_PSPTransaction]
								[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
								
								DB_SaveRecord(->[CC_OrderAuths:133])
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
								OBJECT SET VISIBLE:C603(BCCM; False:C215)
								OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
							Else 
								OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
							End if 
						Else 
							CC_t_AuthCode:=""
							OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
						End if 
					Else 
						
						Case of 
							: (CCM_l_CCAuditID=-909)
								CCM_l_CCAuditID:=0
								//AVS rejection
								//record the FAILED  but the amount was authd'
								CCM_l_RejectedID:=0
								CCM_bo_DisableAVSTEMP:=True:C214
								If ([CONTACTS:1]Contact_Code:2#[INVOICES:39]Contact_Code:3)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
								End if 
								CCM_t_CompanyCode:=[INVOICES:39]Company_Code:2
								CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
								UNLOAD RECORD:C212([CONTACTS:1])
								If (CCM_l_CCAuditID>0)
									$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
										If (CC_t_AuthCode#"")
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
											If ([CCM_PSPTransaction:136]x_CCID:8#0)
												//Get card type
												If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
													QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=[CCM_PSPTransaction:136]x_CCID:8)
												End if 
												CCM_l_cardIDtoAuth:=[CCM_PSPTransaction:136]x_CCID:8
												[INVOICES:39]Cheque_Number:36:=[xCreditCardDetails:132]Card_TypeName:5
											End if 
											
											$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
											
											READ WRITE:C146([CC_OrderAuths:133])
											CREATE RECORD:C68([CC_OrderAuths:133])
											[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
											[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
											[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
											[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
											
											[CC_OrderAuths:133]Order_ID:2:=[INVOICES:39]X_DepositRelatedRecordID:45
											
											[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
											
											[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
											[CC_OrderAuths:133]xAuthStatus:7:=3
											//and put it on the [CCM_PSPTransaction]
											[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
											DB_SaveRecord(->[CC_OrderAuths:133])
											UNLOAD RECORD:C212([CC_OrderAuths:133])
											OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
											OBJECT SET VISIBLE:C603(BCCM; False:C215)
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
										Else 
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
										End if 
									Else 
										
										OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
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
									CCM_l_CCAuditID:=0
									CC_t_AuthCode:=""
								End if 
								CCM_bo_DisableAVSTEMP:=False:C215
							: (CCM_l_CCAuditID=-907)  // reject AVS
								CCM_l_RejectedID:=0
								
							: (CCM_l_CCAuditID=-908)
								//CVV2 Failure
								CCM_l_CCAuditID:=0
								CCM_bo_CV2Retry:=True:C214
								//don't record this as an auth.
								//CCM_l_CCAuditID:=CCM_ProcessCard ([INVOICES]Currency Code;[INVOICES]Total Paid;$_l_AuthID)
								If ([CONTACTS:1]Contact_Code:2#[INVOICES:39]Contact_Code:3)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
								End if 
								CCM_t_CompanyCode:=[INVOICES:39]Company_Code:2
								CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
								UNLOAD RECORD:C212([CONTACTS:1])
								If (CCM_l_CCAuditID>0)
									$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If (CC_t_AuthCode#"")
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
											If ([CCM_PSPTransaction:136]x_CCID:8#0)
												//Get card type
												If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
													QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=[CCM_PSPTransaction:136]x_CCID:8)
												End if 
												CCM_l_cardIDtoAuth:=[CCM_PSPTransaction:136]x_CCID:8
												[INVOICES:39]Cheque_Number:36:=[xCreditCardDetails:132]Card_TypeName:5
											End if 
											
											
											READ WRITE:C146([CC_OrderAuths:133])
											CREATE RECORD:C68([CC_OrderAuths:133])
											[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
											[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
											[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
											[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
											
											[CC_OrderAuths:133]Order_ID:2:=[INVOICES:39]X_DepositRelatedRecordID:45
											
											[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
											
											[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
											[CC_OrderAuths:133]xAuthStatus:7:=3
											//and put it on the [CCM_PSPTransaction]
											[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
											DB_SaveRecord(->[CC_OrderAuths:133])
											UNLOAD RECORD:C212([CC_OrderAuths:133])
											OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
											OBJECT SET VISIBLE:C603(BCCM; False:C215)
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
										Else 
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
										End if 
									Else 
										CC_t_AuthCode:=""
										OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
									End if 
								End if 
								CCM_bo_CV2Retry:=True:C214
						End case 
						
					End if 
					
				End if 
				
			End if 
			
		Else 
			//not assigned to anything
			If ([INVOICES:39]Contact_Code:3#"")
				READ ONLY:C145([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
				CCM_t_CompanyCode:=[INVOICES:39]Company_Code:2
				CCM_t_DepositNumber:=[INVOICES:39]Invoice_Number:1
				CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
				If (CCM_l_CCAuditID>0)
					//and put this deposit on the transaction
					$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
					If ($_bo_IsOK)
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
						If (CC_t_AuthCode#"")
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
							//```
							READ WRITE:C146([CC_OrderAuths:133])
							CREATE RECORD:C68([CC_OrderAuths:133])
							[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
							[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
							[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
							[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
							[CC_OrderAuths:133]Order_ID:2:=[INVOICES:39]X_DepositRelatedRecordID:45
							
							[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
							
							[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
							[CC_OrderAuths:133]xAuthStatus:7:=3
							//and put it on the [CCM_PSPTransaction]
							[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
							DB_SaveRecord(->[CC_OrderAuths:133])
							UNLOAD RECORD:C212([CC_OrderAuths:133])
							
							//```
							OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
							OBJECT SET VISIBLE:C603(BCCM; False:C215)
							OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
						Else 
							OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
						End if 
					Else 
						OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
					End if 
				Else 
					//````
					Case of 
						: (CCM_l_CCAuditID=-909)
							CCM_l_CCAuditID:=0
							//AVS rejection
							//record the FAILED  but the amount was authd'
							CCM_l_RejectedID:=0
							CCM_bo_DisableAVSTEMP:=True:C214
							CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
							If (CCM_l_CCAuditID>0)
								
								$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
								If ($_bo_IsOK)
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
									If (CC_t_AuthCode#"")
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
										$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
										If ($_bo_IsOK)
											
											READ WRITE:C146([CC_OrderAuths:133])
											CREATE RECORD:C68([CC_OrderAuths:133])
											[CC_OrderAuths:133]AuthorizationAmount:5:=[INVOICES:39]Total_Paid:6
											[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
											[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
											[CC_OrderAuths:133]CC_RecordID:3:=[xCreditCardDetails:132]x_ID:1
											[CC_OrderAuths:133]xinvoiceCode:9:=""
											[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
											[CC_OrderAuths:133]xDepositCode:8:=[INVOICES:39]Invoice_Number:1
											[CC_OrderAuths:133]xAuthStatus:7:=3  //and put it on the [CCM_PSPTransaction]
											[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
											DB_SaveRecord(->[CC_OrderAuths:133])
											UNLOAD RECORD:C212([CC_OrderAuths:133])
											READ ONLY:C145([CC_OrderAuths:133])
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
											If (CC_t_AuthCode#"")
												OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
												OBJECT SET VISIBLE:C603(BCCM; False:C215)
												OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
											Else 
												OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
											End if 
										Else 
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
										End if 
										
										
									End if 
								End if 
							End if 
							CCM_bo_DisableAVSTEMP:=False:C215
						: (CCM_l_CCAuditID=-907)  // reject AVS
							CCM_l_RejectedID:=0
							
						: (CCM_l_CCAuditID=-908)
							//CVV2 Failure
							CCM_l_CCAuditID:=0
							CCM_bo_CV2Retry:=True:C214
							//don't record this as an auth.
							CCM_l_CCAuditID:=CCM_ProcessCard([INVOICES:39]Currency_Code:27; [INVOICES:39]Total_Paid:6; 0; Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
							If (CCM_l_CCAuditID>0)
								
								$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
								If ($_bo_IsOK)
									CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
									If (CC_t_AuthCode#"")
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
										$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
										If ($_bo_IsOK)
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
											If (CC_t_AuthCode#"")
												OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
												OBJECT SET VISIBLE:C603(BCCM; False:C215)
												OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
											Else 
												OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
											End if 
										Else 
											OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
										End if 
										
										
									End if 
								End if 
								
							Else 
								Gen_Alert("You may not retry a CVV2 again")
								
							End if 
							CCM_bo_CV2Retry:=True:C214
					End case 
					
					//````
				End if 
				
				
			Else 
				Gen_Alert("You must enter a contact to collect money via credit card")
			End if 
		End if 
		
	Else 
		Gen_Alert("This deposit is is already authorized")
	End if 
	
Else 
	Gen_Alert("You must enter a contact code prior to attempting to take a payment")
End if 
CCM_l_cardIDtoAuth:=0
ERR_MethodTrackerReturn("OBJ:Invoice_inP,BCCM"; $_t_oldMethodName)
