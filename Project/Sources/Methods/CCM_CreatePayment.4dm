//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_CreatePayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 12:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($i)
	ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
	ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
	//ARRAY REAL(INC_ar_PriorAmounts;0)
	C_BOOLEAN:C305($_bo_isOK; $_bo_OK; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP)
	C_LONGINT:C283($_l_AllocationRow; $_l_CCAuthID; $_l_CCAuthTransactionID; $_l_Delay; $_l_FindAllocation; $_l_Repeats; $3; CCM_l_CCAuditID; CCM_l_RejectedID; vIn)
	C_REAL:C285($_r_Amount; $0; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_ReceiptNumberCreated; $1; $2; ACC_t_CurrencyCode; CC_t_AuthCode; CCM_t_DepositNumber; CCM_t_InvoiceNumber; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_CreatePayment")
//This method will get money from the CC company
//log that in the CC receipt table

//link any authorizations to the invoice
//set the status of the Authorization
//Create the Receipt-with link to the authorization
$0:=0
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		CCM_t_InvoiceNumber:=$2
	End if 
	If (Count parameters:C259>=3)
		$_r_Amount:=$4
		$_l_CCAuthID:=$3
	Else 
		$_r_Amount:=0
		$_l_CCAuthID:=0
	End if 
	If ($_l_CCAuthID=0)
		//Create an auth here
	End if 
	If ($_l_CCAuthID>0)
		//CCM_t_DepositNumber:=[INVOICES]Invoice No
		CCM_l_CCAuditID:=CCM_ProcessCard($1; $_r_Amount; $_l_CCAuthID)
		If (CCM_l_CCAuditID>0)
			$_bo_isOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
			If ($_bo_isOK)
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
					
					[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
					If ($2="*D@")
						[CCM_PSPTransaction:136]xDepositCode:12:=$2
					Else 
						[CCM_PSPTransaction:136]xInvoiceID:11:=$2
					End if 
					DB_SaveRecord(->[CCM_PSPTransaction:136])
					
					
					READ WRITE:C146([CC_OrderAuths:133])
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_CCAuthID)
					If ($2="*D@")
						[CC_OrderAuths:133]xDepositCode:8:=$2
					Else 
						[CC_OrderAuths:133]xinvoiceCode:9:=$2
					End if 
					[CC_OrderAuths:133]TransactionID:10:=[CCM_PSPTransaction:136]x_ID:1
					[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
					DB_SaveRecord(->[CC_OrderAuths:133])
					
					$0:=$3
					If ($2#"")  //if $1="" this is a deposit
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
						//````````
						If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							vIn:=1
							While (vIn=1)
								//IDLE  ` 03/04/03 pb
								DB_t_CurrentFormUsage:="Pay"
								If ([INVOICES:39]Invoice_Number:1#$2)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
								End if 
								If ($2="*D@")
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
								Else 
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
								End if 
								ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
								
								SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations)
								
								If (vIn=1)
									Invoices_Pay2(False:C215; $_r_Amount; CCM_l_CCAuditID; True:C214)
									If ($1="*D@")
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
									Else 
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
									End if 
									ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
									SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations2)
									For ($_l_FindAllocation; Size of array:C274($_al_ExistingAllocations2); 1; -1)
										$_l_AllocationRow:=Find in array:C230($_al_ExistingAllocations; $_al_ExistingAllocations2{$_l_FindAllocation})
										If ($_l_AllocationRow<0)
											QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_ExistingAllocations2{$_l_FindAllocation})
											$_t_ReceiptNumberCreated:=[XInvoiceAllocation:126]xReceiptNumber:4
											$_l_FindAllocation:=0
										End if 
									End for 
									QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_CCAuthID)
									$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
									If ($_t_ReceiptNumberCreated#"")
										QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //our reference
										[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptNumberCreated
										DB_SaveRecord(->[CCM_PSPTransaction:136])
										UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									End if 
									
									vIn:=0
								End if 
							End while 
							
						Else 
							Gen_Alert("Required Setups have not been completed"; "")
						End if 
						//``````````
					End if 
					
					
				Else 
					$0:=-1
				End if 
			Else 
				Gen_Alert("Sorry the payment could not be processed")
				$0:=-1
				
			End if 
			
		Else 
			//nothing happened?
			Case of 
				: (CCM_l_CCAuditID=-909)
					CCM_l_CCAuditID:=0
					//AVS rejection
					//record the FAILED  but the amount was authd'
					CCM_l_RejectedID:=0
					CCM_bo_DisableAVSTEMP:=True:C214
					//??? $I
					CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$i}; $_l_CCAuthID)
					If (CCM_l_CCAuditID>0)
						$_bo_isOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_isOK)
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
								[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
								If ($2="*D@")
									[CCM_PSPTransaction:136]xDepositCode:12:=$2
								Else 
									[CCM_PSPTransaction:136]xInvoiceID:11:=$2
								End if 
								DB_SaveRecord(->[CCM_PSPTransaction:136])
								READ WRITE:C146([CC_OrderAuths:133])
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_CCAuthID)
								If ($2="*D@")
									[CC_OrderAuths:133]xDepositCode:8:=$2
								Else 
									[CC_OrderAuths:133]xinvoiceCode:9:=$2
								End if 
								[CC_OrderAuths:133]TransactionID:10:=[CCM_PSPTransaction:136]x_ID:1
								[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
								DB_SaveRecord(->[CC_OrderAuths:133])
								
								$0:=$3
								If ($2#"")  //if $1="" this is a deposit
									QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
									//````````
									If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
										vIn:=1
										While (vIn=1)
											//IDLE  ` 03/04/03 pb
											DB_t_CurrentFormUsage:="Pay"
											If ([INVOICES:39]Invoice_Number:1#$1)
												QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
											End if 
											If ($2="*D@")
												QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
											Else 
												QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
											End if 
											ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
											
											SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations)
											
											If (vIn=1)
												Invoices_Pay2(False:C215; $_r_Amount; CCM_l_CCAuditID; True:C214)
												If ($1="*D@")
													QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
												Else 
													QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
												End if 
												ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
												SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations2)
												For ($_l_FindAllocation; Size of array:C274($_al_ExistingAllocations2); 1; -1)
													$_l_AllocationRow:=Find in array:C230($_al_ExistingAllocations; $_al_ExistingAllocations2{$_l_FindAllocation})
													If ($_l_AllocationRow<0)
														QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_ExistingAllocations2{$_l_FindAllocation})
														$_t_ReceiptNumberCreated:=[XInvoiceAllocation:126]xReceiptNumber:4
														$_l_FindAllocation:=0
													End if 
												End for 
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_CCAuthID)
												$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
												If ($_t_ReceiptNumberCreated#"")
													QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //our reference
													[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptNumberCreated
													DB_SaveRecord(->[CCM_PSPTransaction:136])
													UNLOAD RECORD:C212([CCM_PSPTransaction:136])
												End if 
												
												
												vIn:=0
											End if 
										End while 
										
									Else 
										Gen_Alert("Required Setups have not been completed"; "")
									End if 
									//``````````
								End if 
								
								
							Else 
								$0:=-1
							End if 
						Else 
							Gen_Alert("Sorry the payment could not be processed")
							$0:=-1
							
						End if 
					Else 
						$0:=-1
					End if 
					CCM_bo_DisableAVSTEMP:=False:C215
				: (CCM_l_CCAuditID=-907)  // reject AVS
					CCM_l_RejectedID:=0
					$0:=-1
				: (CCM_l_CCAuditID=-908)
					//CVV2 Failure
					CCM_l_CCAuditID:=0
					CCM_bo_CV2Retry:=True:C214
					//don't record this as an auth.
					
					
					CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$i}; $_l_CCAuthID)
					If (CCM_l_CCAuditID>0)
						$_bo_isOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
						If ($_bo_isOK)
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
								[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
								If ($2="*D@")
									[CCM_PSPTransaction:136]xDepositCode:12:=$2
								Else 
									[CCM_PSPTransaction:136]xInvoiceID:11:=$2
								End if 
								DB_SaveRecord(->[CCM_PSPTransaction:136])
								
								
								READ WRITE:C146([CC_OrderAuths:133])
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]AuthorizationCode:6=CC_t_AuthCode)
								If ($2="*D@")
									[CC_OrderAuths:133]xDepositCode:8:=$2
								Else 
									[CC_OrderAuths:133]xinvoiceCode:9:=$2
								End if 
								[CC_OrderAuths:133]TransactionID:10:=[CCM_PSPTransaction:136]x_ID:1
								
								[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
								DB_SaveRecord(->[CC_OrderAuths:133])
								
								$0:=$3
								If ($2#"")  //if $1="" this is a deposit
									QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
									//````````
									If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
										vIn:=1
										While (vIn=1)
											// 03/04/03 pb
											DB_t_CurrentFormUsage:="Pay"
											If ([INVOICES:39]Invoice_Number:1#$1)
												QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
											End if 
											If ($2="*D@")
												QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
											Else 
												QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
											End if 
											ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
											SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations)
											
											If (vIn=1)
												Invoices_Pay2(False:C215; $_r_Amount; CCM_l_CCAuditID; True:C214)
												If ($1="*D@")
													QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$2)
												Else 
													QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2)
												End if 
												ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
												SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations2)
												For ($_l_FindAllocation; Size of array:C274($_al_ExistingAllocations2); 1; -1)
													$_l_AllocationRow:=Find in array:C230($_al_ExistingAllocations; $_al_ExistingAllocations2{$_l_FindAllocation})
													If ($_l_AllocationRow<0)
														QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_ExistingAllocations2{$_l_FindAllocation})
														$_t_ReceiptNumberCreated:=[XInvoiceAllocation:126]xReceiptNumber:4
														$_l_FindAllocation:=0
													End if 
												End for 
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_CCAuthID)
												$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
												If ($_t_ReceiptNumberCreated#"")
													QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //our reference
													[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptNumberCreated
													DB_SaveRecord(->[CCM_PSPTransaction:136])
													UNLOAD RECORD:C212([CCM_PSPTransaction:136])
												End if 
												
												
												vIn:=0
											End if 
										End while 
										
									Else 
										Gen_Alert("Required Setups have not been completed"; "")
									End if 
									//``````````
								End if 
								
								
							Else 
								$0:=-1
							End if 
						Else 
							Gen_Alert("Sorry the payment could not be processed")
							$0:=-1
							
						End if 
						
						
					Else 
						Gen_Alert("You may not retry a CVV2 again")
						
					End if 
					CCM_bo_CV2Retry:=True:C214
				Else 
					Gen_Alert("No Authorization has been obtained the monies cannot be received from the CC Comp"+"any")
			End case 
			
			
			
			
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("CCM_CreatePayment"; $_t_oldMethodName)