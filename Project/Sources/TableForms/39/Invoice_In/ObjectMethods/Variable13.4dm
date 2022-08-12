If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(INV_ad_CCAuthDate;0)
	ARRAY LONGINT:C221($_al_AuthIDS; 0)
	ARRAY LONGINT:C221($_al_AuthIDS2; 0)
	ARRAY LONGINT:C221($_al_TransactionRecordIDS; 0)
	ARRAY LONGINT:C221($_al_TransactionRecordIDS2; 0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(INV_al_AuthRecord;0)
	//ARRAY LONGINT(INV_al_AuthStatus;0)
	//ARRAY LONGINT(INV_al_StatusIDs;0)
	ARRAY REAL:C219($_ar_Amounts; 0)
	ARRAY REAL:C219($_ar_Amounts2; 0)
	//ARRAY REAL(INV_ar_CCAmount;0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_ReceiptNums; 0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(INV_at_AuthStatus;0)
	//ARRAY TEXT(INV_at_CCAuth;0)
	//ARRAY TEXT(INV_at_InvoiceCode;0)
	//ARRAY TEXT(INV_at_ReceiptNum;0)
	//ARRAY TEXT(INV_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK; $_bo_Print; $_bo_SetDefault; CCM_bo_IsLicenced; CCM_bo_OfflineHandling; GEN_Bo_ShowCreate; INV_bo_AutoPrint; INV_bo_inTransaction)
	C_LONGINT:C283($_l_AllocationIndex; $_l_AuthIDRow; $_l_AuthIndex; $_l_authRow; $_l_Cancel; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delay; $_l_DepositCount; $_l_OK; $_l_OrderRow)
	C_LONGINT:C283($_l_PaymentsReceived; $_l_Process; $_l_PSPID; $_l_PSPRow; $_l_ReceiptIndex; $_l_ReceiptRow; $_l_Repeats; $_l_Retries; $_l_Void; $_l_xNext; INV_l_CCID)
	C_LONGINT:C283(INV_l_GetDepositProcess; INV_l_PSPID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_DefaultValue; xCancel; xnext; xOK)
	C_REAL:C285($_r_Amount; $_r_Amount3; $_r_CCDeposit; $_r_TotalDeposit; $_r_TotalPreAuthd; INV_R_CCDeposit; INV_R_totalDeposit)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; INV_S20_LoadRecord; vText)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES]Invoices_In.Variable13"; Form event code:C388)

//This button allows an allocation to be made direct from the invoice
//note that when doing this the max amount of the allocation is the DUE amount of the invoice
If (INV_R_totalDeposit=0) & (INV_R_CCDeposit=0)
	//when viewing an invoice these figures are not set..only when coming into it from a sales order
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	
	FIRST RECORD:C50([INVOICES_ITEMS:161])
	For ($_l_AuthIndex; 1; Records in selection:C76([INVOICES_ITEMS:161]))
		If ([INVOICES_ITEMS:161]Order_Code:11#"")
			$_l_OrderRow:=Find in array:C230($_at_OrderCodes; [INVOICES_ITEMS:161]Order_Code:11)
			If ($_l_OrderRow<0)
				APPEND TO ARRAY:C911($_at_OrderCodes; [INVOICES_ITEMS:161]Order_Code:11)
			End if 
		End if 
		NEXT RECORD:C51([INVOICES_ITEMS:161])
	End for 
	If (Size of array:C274($_at_OrderCodes)>0)
		If ([ORDERS:24]Order_Code:3#$_at_OrderCodes{1})
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_at_OrderCodes{1})
		End if 
	End if 
	If (Size of array:C274($_at_OrderCodes)>0)
		For ($_l_AuthIndex; 1; Size of array:C274($_at_OrderCodes))  //this should only be on elemenent
			$_r_TotalDeposit:=INV_R_totalDeposit
			$_r_CCDeposit:=INV_R_CCDeposit
			INV_l_GetDepositProcess:=New process:C317("INV_GetDepositamounts"; 128000; "GetDepositValues"; $_at_OrderCodes{$_l_AuthIndex}; Current process:C322)
			$_l_Retries:=0
			While (INV_l_GetDepositProcess>0) & (Process state:C330(INV_l_GetDepositProcess)>=0)
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			INV_R_totalDeposit:=INV_R_totalDeposit+$_r_TotalDeposit
			INV_R_CCDeposit:=INV_R_CCDeposit+$_r_CCDeposit
		End for 
	End if 
	
End if 

If ([INVOICES:39]Total_Due:7>0) | ([INVOICES:39]Total_Due:7<0)  // do not process blank invoices!
	
	INV_bo_AutoPrint:=False:C215
	$_bo_Print:=False:C215
	If ([INVOICES:39]State:10#-2) & ([INVOICES:39]State:10#-3)  //not a deposit or receipt(just for safety as the button should be hidden anyway!
		Invoices_PostTx
		$_bo_Continue:=True:C214
		If ([INVOICES:39]State:10=0)
			Gen_Confirm("Payment cannot be made against this "+vText+" until it is posted"; "Post"; "Cancel")
			//Gen_Confirm ("Payment cannot be made against this "+vText+" until it is printed";"Print";"Cancel")
			If (Ok=1)
				$_bo_Print:=True:C214
				Invoices_PPrint(False:C215; False:C215)
				$_bo_Continue:=True:C214
			Else 
				$_bo_Continue:=False:C215
			End if 
		End if 
		If ($_bo_Continue)
			Case of 
				: ([INVOICES:39]Total_Due:7>0)
					If (INV_R_CCDeposit<=[INVOICES:39]Total_Due:7)
						//cannot make CC payment if payment is already made
						CCM_LoadServiceProvidersV11(True:C214)
						ARRAY TEXT:C222(GEN_at_DropDownMenu; 2)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 2)
						GEN_at_DropDownMenu{1}:="Allocate an existing Deposit"
						GEN_at_DropDownMenu{2}:="Create a Receipt"
						If (CCM_bo_IsLicenced) | (CCM_bo_OfflineHandling)
							
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 3)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 3)
							GEN_at_DropDownMenu{3}:="Credit Card Payment"
						End if 
						GEN_al_DropDownMenuID{1}:=1
						GEN_al_DropDownMenuID{2}:=2
						If (CCM_bo_IsLicenced) | (CCM_bo_OfflineHandling)
							GEN_al_DropDownMenuID{3}:=3
						End if 
						$_bo_SetDefault:=True:C214
					Else 
						$_bo_SetDefault:=False:C215
						If (INV_R_totalDeposit<=[INVOICES:39]Total_Due:7)
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 2)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 2)
							GEN_at_DropDownMenu{1}:="Allocate an existing Deposit"
							GEN_at_DropDownMenu{2}:="Create a Receipt"
							GEN_al_DropDownMenuID{1}:=1
							GEN_al_DropDownMenuID{2}:=2
							
						Else 
							//deposit only.
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 1)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 1)
							GEN_at_DropDownMenu{1}:="Allocate an existing Deposit"
							GEN_al_DropDownMenuID{1}:=1
							
						End if 
					End if 
					
					
					
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
					DB_t_WindowTitle:="Allocation Type"
					GEN_Bo_ShowCreate:=False:C215
					GEN_t_CancelText:="Cancel"
					GEN_t_OKText:="Continue"
					WS_l_DefaultValue:=0
					If ($_bo_SetDefault)
						If ([INVOICES:39]Terms:11="Credit Card")
							WS_l_DefaultValue:=Find in array:C230(GEN_at_DropDownMenu; "Credit Card Payment")
							If (WS_l_DefaultValue<0)
								WS_l_DefaultValue:=0
							End if 
						End if 
					End if 
					DIALOG:C40([USER:15]; "Gen_PopUpChoice")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					If (GEN_at_DropDownMenu>0)
						//First choose whether we are allocating from a deposit or
						
						Case of 
							: (GEN_at_DropDownMenu=1)
								//deposit
								If ([ORDERS:24]x_ID:58>0)
									// dont forget to put the invoice number on the original Auth and on the transaction
									ARRAY LONGINT:C221($_al_TransactionRecordIDS; 0)
									ARRAY LONGINT:C221($_al_TransactionRecordIDS2; 0)
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=[INVOICES:39]Invoice_Number:1)
									SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_ID:1; $_al_TransactionRecordIDS)
									ARRAY TEXT:C222($_at_ReceiptNums; 0)
									COPY ARRAY:C226(INV_at_ReceiptNum; $_at_ReceiptNums)  //Note the existing receipt nos
									INV_AllocateDeposit([ORDERS:24]x_ID:58)
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=[INVOICES:39]Invoice_Number:1)
									SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_ID:1; $_al_TransactionRecordIDS2)
									$_l_PSPID:=0
									For ($_l_AllocationIndex; 1; Size of array:C274($_al_TransactionRecordIDS2))
										$_l_PSPRow:=Find in array:C230($_al_TransactionRecordIDS; $_al_TransactionRecordIDS2{$_l_AllocationIndex})
										If ($_l_PSPRow<0)
											$_l_PSPID:=$_al_TransactionRecordIDS2{$_l_AllocationIndex}
											$_l_AllocationIndex:=Size of array:C274($_al_TransactionRecordIDS2)
										End if 
									End for 
									If ($_l_PSPID>0)
										For ($_l_ReceiptIndex; 1; Size of array:C274(INV_at_ReceiptNum))
											If (INV_at_ReceiptNum{$_l_ReceiptIndex}#"")
												
												$_l_ReceiptRow:=Find in array:C230($_at_ReceiptNums; INV_at_ReceiptNum{$_l_ReceiptIndex})
												If ($_l_ReceiptRow<0)
													//This is the receipt that was added
													READ WRITE:C146([CCM_PSPTransaction:136])
													QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_PSPID)
													[CCM_PSPTransaction:136]xReceiptID:13:=INV_at_ReceiptNum{$_l_ReceiptIndex}
													DB_SaveRecord(->[CCM_PSPTransaction:136])
													UNLOAD RECORD:C212([CCM_PSPTransaction:136])
													$_l_ReceiptIndex:=Size of array:C274(INV_at_ReceiptNum)
												End if 
											End if 
										End for 
									End if 
								Else 
									// dont forget to put the invoice number on the original Auth and on the transaction
									ARRAY LONGINT:C221($_al_TransactionRecordIDS; 0)
									ARRAY LONGINT:C221($_al_TransactionRecordIDS2; 0)
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=[INVOICES:39]Invoice_Number:1)
									SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_ID:1; $_al_TransactionRecordIDS)
									ARRAY TEXT:C222($_at_ReceiptNums; 0)
									COPY ARRAY:C226(INV_at_ReceiptNum; $_at_ReceiptNums)  //Note the existing receipt nos
									INV_AllocateDeposit
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=[INVOICES:39]Invoice_Number:1)
									SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_ID:1; $_al_TransactionRecordIDS2)
									$_l_PSPID:=0
									If (Size of array:C274($_al_TransactionRecordIDS2)>0)
										For ($_l_AllocationIndex; 1; Size of array:C274($_al_TransactionRecordIDS2))
											$_l_PSPRow:=Find in array:C230($_al_TransactionRecordIDS; $_al_TransactionRecordIDS2{$_l_AllocationIndex})
											If ($_l_PSPRow<0)
												$_l_PSPID:=$_al_TransactionRecordIDS2{$_l_AllocationIndex}
												$_l_AllocationIndex:=Size of array:C274($_al_TransactionRecordIDS2)
											End if 
										End for 
										
										If ($_l_PSPID>0)
											For ($_l_ReceiptIndex; 1; Size of array:C274(INV_at_ReceiptNum))
												If (INV_at_ReceiptNum{$_l_ReceiptIndex}#"")
													
													$_l_ReceiptRow:=Find in array:C230($_at_ReceiptNums; INV_at_ReceiptNum{$_l_ReceiptIndex})
													If ($_l_ReceiptRow<0)
														//This is the receipt that was added
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_PSPID)
														[CCM_PSPTransaction:136]xReceiptID:13:=INV_at_ReceiptNum{$_l_ReceiptIndex}
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														$_l_ReceiptIndex:=Size of array:C274(INV_at_ReceiptNum)
													End if 
												End if 
											End for 
										End if 
									End if 
								End if 
								
								If ([ORDERS:24]x_ID:58>0)
									ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
								End if 
								If ($_bo_Print)
									
									
									INV_DisplayAllocations
									If ([ORDERS:24]x_ID:58>0)
										ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
									End if 
									
									
									Invoices_PPrint(False:C215; True:C214)
								End if 
								
							: (GEN_at_DropDownMenu=2)
								
								INV_CreatePayment
								If ([ORDERS:24]x_ID:58>0)
									ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
								End if 
								If ($_bo_Print)
									INV_DisplayAllocations
									If ([ORDERS:24]x_ID:58>0)
										ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
									End if 
									
									
									Invoices_PPrint(False:C215; True:C214)
								End if 
								
							: (GEN_at_DropDownMenu=3)
								//Authorize card payment....
								//Need to test we are in an order here!
								//```
								
								//are there any deposits..they should be done first
								$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100000")
								If (INV_R_totalDeposit>0)
									$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100001")
									If (True:C214)
										SET QUERY DESTINATION:C396(3; $_l_DepositCount)
										QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[INVOICES:39]Company_Code:2; *)
										QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10=-2; *)
										QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7<0)
										$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100002")
										If ([ORDERS:24]x_ID:58>0)
											QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]X_DepositRelatedRecordID:45=[ORDERS:24]x_ID:58; *)
											QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]X_DepositRelatedRecordID:45=0)
										End if 
										$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100003")
										SET QUERY DESTINATION:C396(0)
										If ($_l_DepositCount>0)
											$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100004")
											Gen_Confirm("There are deposits that should be allocated to this invoice first. Would you like"+" to do that?"; "Yes"; "No")
											If (OK=1)
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100005")
												If ([ORDERS:24]x_ID:58>0)
													$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100006")
													INV_AllocateDeposit([ORDERS:24]x_ID:58)
												Else 
													$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100007")
													INV_AllocateDeposit
												End if 
												If ([ORDERS:24]x_ID:58>0)
													$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100008")
													ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
												End if 
											End if 
											OK:=1
										End if 
									End if 
								End if 
								//first find auths less than the amount....
								$_r_TotalPreAuthd:=0
								
								$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100009")
								If (Size of array:C274(INV_at_AuthStatus)>0)
									$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100010")
									ARRAY LONGINT:C221($_al_AuthIDS; Size of array:C274(INV_at_AuthStatus))
									ARRAY REAL:C219($_ar_Amounts; Size of array:C274(INV_at_AuthStatus))
									$_r_Amount:=[INVOICES:39]Total_Due:7-INV_R_totalDeposit
									$_l_CurrentRow:=0
									$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100011")
									For ($_l_AuthIndex; 1; Size of array:C274(INV_al_AuthStatus))
										$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100012_"+String:C10($_l_AuthIndex))
										
										If ((INV_al_AuthStatus{$_l_AuthIndex}=0) | (INV_al_AuthStatus{$_l_AuthIndex}=1)) & (INV_ad_CCAuthDate{$_l_AuthIndex}>(Current date:C33-30))
											$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100013_"+String:C10($_l_AuthIndex))
											
											If (INV_at_CCAuth{$_l_AuthIndex}#"000000")
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100014_"+String:C10($_l_AuthIndex))
												
												If ($_r_TotalPreAuthd+INV_ar_CCAmount{$_l_AuthIndex}<=$_r_Amount)
													$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100015_"+String:C10($_l_AuthIndex))
													
													$_r_TotalPreAuthd:=$_r_TotalPreAuthd+INV_ar_CCAmount{$_l_AuthIndex}
													$_l_CurrentRow:=$_l_CurrentRow+1
													$_al_AuthIDS{$_l_CurrentRow}:=INV_al_AuthRecord{$_l_AuthIndex}
													$_ar_Amounts{$_l_CurrentRow}:=INV_ar_CCAmount{$_l_AuthIndex}
												Else 
													$_l_AuthIndex:=9999999
													//Order authorizations
												End if 
											End if 
											
										End if 
									End for 
									ARRAY LONGINT:C221($_al_AuthIDS; $_l_CurrentRow)
									If ($_r_TotalPreAuthd>0)
										//There are some auths we can get here
										$_l_xNext:=xnext
										$_l_OK:=xOK
										$_l_Cancel:=xCancel
										xCancel:=0
										xOK:=0
										xNext:=0
										$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100016")
										
										Gen_Confirm3("There is a sum of "+[INVOICES:39]Currency_Code:27+" "+String:C10($_r_TotalPreAuthd)+" Already authorized. Do you wish to get that now?"; "Yes"; "No"; "Void")
										Case of 
											: (xnext=1)
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100017")
												
												//Void the transactions
												For ($_l_AuthIndex; 1; Size of array:C274($_al_AuthIDS))
													$_l_OrderRow:=Find in array:C230(INV_al_AuthRecord; $_al_AuthIDS{$_l_AuthIndex})
													If (INV_al_AuthStatus{$_l_OrderRow}=1) | (INV_al_AuthStatus{$_l_OrderRow}=0)  // Awating invoicing or only authd on the invoice
														$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_OrderRow}; [INVOICES:39]Currency_Code:27)
														If ($_l_Void>0)
															//the transaction is voided so set the record
															READ WRITE:C146([CC_OrderAuths:133])
															QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{$_l_OrderRow})
															
															[CC_OrderAuths:133]xAuthStatus:7:=2
															[CC_OrderAuths:133]xinvoiceCode:9:=[INVOICES:39]Invoice_Number:1
															INV_al_AuthStatus{$_l_OrderRow}:=2
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
															[CCM_PSPTransaction:136]XTransactionStatus:15:=-13  //This was -1 but that was already used to indicate an auth had already been used
															If ([INVOICES:39]Invoice_Number:1#"")
																[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
															End if 
															DB_SaveRecord(->[CCM_PSPTransaction:136])
															INV_at_AuthStatus{$_l_OrderRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_OrderRow})}
															UNLOAD RECORD:C212([CC_OrderAuths:133])
															UNLOAD RECORD:C212([CCM_PSPTransaction:136])
															READ ONLY:C145([CCM_PSPTransaction:136])
															READ ONLY:C145([CC_OrderAuths:133])
															
														End if 
													End if 
												End for 
												
											: (xOK=1)
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100018")
												
												$_l_PaymentsReceived:=0
												
												For ($_l_AuthIndex; 1; Size of array:C274($_al_AuthIDS))
													$_l_PaymentsReceived:=CCM_CreatePayment([INVOICES:39]Currency_Code:27; [INVOICES:39]Invoice_Number:1; $_al_AuthIDS{$_l_AuthIndex}; $_ar_Amounts{$_l_AuthIndex})
													If ($_l_PaymentsReceived>0)
														//And update the array
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_al_AuthIDS{$_l_AuthIndex})
														$_l_OrderRow:=Find in array:C230(INV_al_AuthRecord; $_al_AuthIDS{$_l_AuthIndex})
														INV_al_AuthStatus{$_l_OrderRow}:=[CC_OrderAuths:133]xAuthStatus:7
														[CC_OrderAuths:133]xinvoiceCode:9:=[INVOICES:39]Invoice_Number:1
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
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  //NG this was marking it as -1 but that was already used to indicate an auth had already been used
														[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														INV_at_AuthStatus{$_l_OrderRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_OrderRow})}
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														READ ONLY:C145([CC_OrderAuths:133])
														If (INV_al_AuthStatus{$_l_OrderRow}>0)
															INV_at_AuthStatus{$_l_OrderRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_OrderRow})}
															
														Else 
															Case of 
																: (INV_at_InvoiceCode{$_l_OrderRow}#"")
																	//Assigned to an invoice
																	INV_at_AuthStatus{$_l_OrderRow}:="Authorised awaiting payment"  //has to be assigned to this invoice!
																: (INV_ad_CCAuthDate{$_l_OrderRow}<=(Current date:C33-30))
																	INV_at_AuthStatus{$_l_OrderRow}:="Out of Date"
															End case 
														End if 
													End if 
												End for 
												
										End case 
										xnext:=$_l_xNext
										xOK:=$_l_OK
										xCancel:=$_l_Cancel
										
									End if 
								End if 
								//```
								//now get auths.more than the amount..but ignore the ones we got above
								
								$_r_TotalPreAuthd:=0
								
								If (Size of array:C274(INV_at_AuthStatus)>0)
									$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100019")
									
									ARRAY LONGINT:C221($_al_AuthIDS2; Size of array:C274(INV_at_AuthStatus))
									ARRAY REAL:C219($_ar_Amounts2; Size of array:C274(INV_at_AuthStatus))
									$_r_Amount:=[INVOICES:39]Total_Due:7-INV_R_totalDeposit
									$_l_CurrentRow:=0
									For ($_l_AuthIndex; 1; Size of array:C274(INV_al_AuthStatus))
										
										If ((INV_al_AuthStatus{$_l_AuthIndex}=0) | (INV_al_AuthStatus{$_l_AuthIndex}=1)) & (INV_ad_CCAuthDate{$_l_AuthIndex}>(Current date:C33-30))
											If ($_r_TotalPreAuthd+INV_ar_CCAmount{$_l_AuthIndex}>$_r_Amount)
												$_l_OrderRow:=Find in array:C230($_al_AuthIDS; INV_al_AuthRecord{$_l_AuthIndex})
												If ($_l_OrderRow<0)
													$_r_TotalPreAuthd:=$_r_TotalPreAuthd+INV_ar_CCAmount{$_l_AuthIndex}
													$_l_CurrentRow:=$_l_CurrentRow+1
													$_al_AuthIDS2{$_l_CurrentRow}:=INV_al_AuthRecord{$_l_AuthIndex}
													$_ar_Amounts2{$_l_CurrentRow}:=INV_ar_CCAmount{$_l_AuthIndex}
													$_l_AuthIndex:=9999999
													//skip out at the first amount
												End if 
												
											Else 
												//$_l_AuthIndex:=9999999
												//Order authorizations
											End if 
										End if 
									End for 
									$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100020")
									
									ARRAY LONGINT:C221($_al_AuthIDS2; $_l_CurrentRow)
									If ($_r_TotalPreAuthd>0)
										//There are some auths we can get here
										$_l_xNext:=xnext
										$_l_OK:=xOK
										$_l_Cancel:=xCancel
										xCancel:=0
										xOK:=0
										xNext:=0
										Gen_Confirm3("There is a sum of "+[INVOICES:39]Currency_Code:27+" "+String:C10($_r_TotalPreAuthd)+" Already authorized. Do you wish to get the balance of the invoice using that now"+"?"; "Yes"; "No"; "Void")
										Case of 
											: (xnext=1)
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100021")
												
												//Void the transactions
												For ($_l_AuthIndex; 1; Size of array:C274($_al_AuthIDS2))
													$_l_AuthIDRow:=Find in array:C230(INV_al_AuthRecord; $_al_AuthIDS2{$_l_AuthIndex})
													If (INV_al_AuthStatus{$_l_PSPRow}=1) | (INV_al_AuthStatus{$_l_PSPRow}=0)  // Awating invoicing or only authd on the invoice
														$_l_Void:=CCM_VoidTransaction(INV_al_AuthRecord{$_l_PSPRow}; [INVOICES:39]Currency_Code:27)
														If ($_l_Void>0)
															//the transaction is voided so set the record
															READ WRITE:C146([CC_OrderAuths:133])
															QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INV_al_AuthRecord{$_l_PSPRow})
															[CC_OrderAuths:133]xAuthStatus:7:=2
															[CC_OrderAuths:133]xinvoiceCode:9:=[INVOICES:39]Invoice_Number:1
															INV_al_AuthStatus{$_l_PSPRow}:=2
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
															[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
															DB_SaveRecord(->[CCM_PSPTransaction:136])
															INV_at_AuthStatus{$_l_PSPRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_PSPRow})}
															UNLOAD RECORD:C212([CCM_PSPTransaction:136])
															READ ONLY:C145([CCM_PSPTransaction:136])
															UNLOAD RECORD:C212([CC_OrderAuths:133])
															READ ONLY:C145([CC_OrderAuths:133])
															
															
														End if 
													End if 
												End for 
												
											: (xOK=1)
												$_t_oldMethodName2:=ERR_MethodTracker("CC Payment Phase 100022")
												$_l_PaymentsReceived:=0
												
												For ($_l_AuthIndex; 1; Size of array:C274($_al_AuthIDS2))
													If ($_r_Amount>$_ar_Amounts2{$_l_AuthIndex})  //$_r_Amount is the residual amount of the invoice
														$_r_Amount3:=$_ar_Amounts2{$_l_AuthIndex}
														$_l_PaymentsReceived:=CCM_CreatePayment([INVOICES:39]Currency_Code:27; [INVOICES:39]Invoice_Number:1; $_al_AuthIDS2{$_l_AuthIndex}; $_ar_Amounts2{$_l_AuthIndex})
														$_r_Amount:=$_r_Amount-$_l_PaymentsReceived
													Else 
														//get the residual amount
														$_r_Amount3:=$_r_Amount
														$_l_PaymentsReceived:=CCM_CreatePayment([INVOICES:39]Currency_Code:27; [INVOICES:39]Invoice_Number:1; $_al_AuthIDS2{$_l_AuthIndex}; $_r_Amount)
														$_r_Amount:=$_r_Amount-$_l_PaymentsReceived
													End if 
													
													//And update the array
													//```
													//And update the array
													If ($_l_PaymentsReceived>0)
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_al_AuthIDS2{$_l_AuthIndex})
														$_l_authRow:=Find in array:C230(INV_al_AuthRecord; $_al_AuthIDS2{$_l_AuthIndex})
														INV_al_AuthStatus{$_l_authRow}:=[CC_OrderAuths:133]xAuthStatus:7
														[CC_OrderAuths:133]xinvoiceCode:9:=[INVOICES:39]Invoice_Number:1
														[CC_OrderAuths:133]AuthorizationAmount:5:=$_r_Amount3  //THE AMOUNT CHANGES
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
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
														[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														INV_at_AuthStatus{$_l_OrderRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_OrderRow})}
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														READ ONLY:C145([CC_OrderAuths:133])
														If (INV_al_AuthStatus{$_l_OrderRow}>0)
															INV_at_AuthStatus{$_l_OrderRow}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_OrderRow})}
															
														Else 
															Case of 
																: (INV_at_InvoiceCode{$_l_OrderRow}#"")
																	//Assigned to an invoice
																	INV_at_AuthStatus{$_l_OrderRow}:="Authorised awaiting payment"  //has to be assigned to this invoice!
																: (INV_ad_CCAuthDate{$_l_OrderRow}<=(Current date:C33-30))
																	INV_at_AuthStatus{$_l_OrderRow}:="Out of Date"
															End case 
														End if 
													End if 
													
													
													//``
													
												End for 
												
										End case 
										xnext:=$_l_xNext
										xOK:=$_l_OK
										xCancel:=$_l_Cancel
										
									End if 
								End if 
								
								//```
								
								
								$_r_Amount:=[INVOICES:39]Total_Due:7-(INV_R_totalDeposit)
								If ($_r_Amount>0)
									$_l_Process:=New process:C317("CCM_InvoiceAuthorize"; 64000; "Authorize"+[INVOICES:39]Invoice_Number:1; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; $_r_Amount; [INVOICES:39]Currency_Code:27; Current process:C322; *)
									HIDE PROCESS:C324($_l_Process)
									If (In transaction:C397)
										INV_bo_inTransaction:=True:C214
										Transact_End(True:C214)
									End if 
									HIDE PROCESS:C324(Current process:C322)
									INV_S20_LoadRecord:=[INVOICES:39]Invoice_Number:1
									UNLOAD RECORD:C212([INVOICES:39])
									SHOW PROCESS:C325($_l_Process)
									BRING TO FRONT:C326($_l_Process)
									If ($_bo_Print)
										INV_bo_AutoPrint:=True:C214
									End if 
									PAUSE PROCESS:C319(Current process:C322)
									If (INV_l_PSPID>0)
										INV_l_CCID:=-INV_l_PSPID
									End if 
									
								Else 
									If ($_bo_Print)
										
										
										INV_DisplayAllocations
										If ([ORDERS:24]x_ID:58>0)
											ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
										End if 
										
										
										Invoices_PPrint(False:C215; True:C214)
									End if 
									
								End if 
								
						End case 
					End if 
					
				: ([INVOICES:39]Total_Due:7<0)
					CCM_LoadServiceProvidersV11(True:C214)
					ARRAY TEXT:C222(GEN_at_DropDownMenu; 2)
					ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 2)
					GEN_at_DropDownMenu{1}:="Pay Credit Note"  // Create a receipt
					GEN_at_DropDownMenu{2}:="Allocate to an invoice"  // like paying a deposit
					If (CCM_bo_IsLicenced) | (CCM_bo_OfflineHandling)
						ARRAY TEXT:C222(GEN_at_DropDownMenu; 3)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 3)
						ARRAY TEXT:C222(GEN_at_DropDownMenu; 4)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 4)
						
						GEN_at_DropDownMenu{3}:="Credit Card Refund"
						GEN_al_DropDownMenuID{3}:=3
						GEN_at_DropDownMenu{3}:="Credit Card VOID"
						GEN_al_DropDownMenuID{3}:=4
					End if 
					GEN_al_DropDownMenuID{1}:=1
					GEN_al_DropDownMenuID{1}:=2
					If (Size of array:C274(GEN_at_DropDownMenu)>1)
						Open window:C153(20; 20; 20; 20; -1986)
						DB_t_WindowTitle:="Allocation Type"
						GEN_Bo_ShowCreate:=False:C215
						GEN_t_CancelText:="Cancel"
						GEN_t_OKText:="Continue"
						WS_l_DefaultValue:=0
						
						DIALOG:C40([USER:15]; "Gen_PopUpChoice")
						CLOSE WINDOW:C154
					End if 
					If (GEN_at_DropDownMenu>0)
						Case of 
							: (GEN_at_DropDownMenu=1)
								INV_CreatePayment
								If ($_bo_Print)
									
									
									INV_DisplayAllocations
									If ([ORDERS:24]x_ID:58>0)
										ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
									End if 
									
									
									Invoices_PPrint(False:C215; True:C214)
								End if 
							: (GEN_at_DropDownMenu=2)
								INV_AllocateInvoice
								If ($_bo_Print)
									
									
									INV_DisplayAllocations
									If ([ORDERS:24]x_ID:58>0)
										ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
									End if 
									
									
									Invoices_PPrint(False:C215; True:C214)
								End if 
								
							: (GEN_at_DropDownMenu=3)
								HIDE PROCESS:C324(Current process:C322)
								$_l_Process:=New process:C317("CCM_InvoiceAuthorize"; 64000; "Authorize"+[INVOICES:39]Invoice_Number:1; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; [INVOICES:39]Total_Due:7; [INVOICES:39]Currency_Code:27; Current process:C322; *)
								HIDE PROCESS:C324($_l_Process)
								If (In transaction:C397)
									INV_bo_inTransaction:=True:C214
									Transact_End(True:C214)
								End if 
								INV_S20_LoadRecord:=[INVOICES:39]Invoice_Number:1
								UNLOAD RECORD:C212([INVOICES:39])
								SHOW PROCESS:C325($_l_Process)
								BRING TO FRONT:C326($_l_Process)
								PAUSE PROCESS:C319(Current process:C322)
								If (INV_l_PSPID>0)
									INV_l_CCID:=-INV_l_PSPID
								End if 
								If ($_bo_Print)
									INV_bo_AutoPrint:=True:C214
								End if 
							: (GEN_at_DropDownMenu=4)
								//First select the invoice being voided.
								
						End case 
						
					End if 
					
					
				Else 
					Gen_Alert("Sorry there is no DUE amount on this invoice"+Vtext+" cannot be allocated to it."; "OK")
					
					If ($_bo_Print)
						
						
						INV_DisplayAllocations
						If ([ORDERS:24]x_ID:58>0)
							ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
						End if 
						
						
						Invoices_PPrint(False:C215; True:C214)
					End if 
					
					
					
			End case 
		End if 
	Else 
		
	End if 
Else 
	Gen_Alert("Sorry there is no DUE amount on this invoice no allocation is possible."; "OK")
	
End if 
ERR_MethodTrackerReturn("OBJ:Invoices_In,Ballocate"; $_t_oldMethodName)
