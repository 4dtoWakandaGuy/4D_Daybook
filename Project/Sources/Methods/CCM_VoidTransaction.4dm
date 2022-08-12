//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_VoidTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 17:09`Method: CCM_VoidTransaction
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	ARRAY TEXT:C222($_at_AuthorizationProvider; 0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_BLOB:C604(CCM_Bl_TransRecord; CCM_Bl_TransResponse)
	C_BOOLEAN:C305(<>CCM_bo_Inited; <>EtransInited; <>ViewLists; $_bo_CloseWindow; $_bo_Continue; $_bo_CouldBeVoid; $_bo_Failed; $_bo_IgnoreFailonReturn; $_bo_InTest; $_bo_IsaVoid; $_bo_isVoid)
	C_BOOLEAN:C305($_bo_Reject; $_bo_TestMode; $_bo_ViewLists; CCM_bo_DONTTRYCREDIT; CCM_bo_IsLicenced; CCM_bo_OfflineHandling; CCM_bo_useAVS)
	C_DATE:C307($_d_AuthDate; $3)
	C_LONGINT:C283($_l_CCAuthTransactionID; $_l_CreditCardID; $_l_MonthExpires; $_l_offset; $_l_OrderID; $_l_ResponseCode; $_l_ServiceID; $_l_ServiceRow; $_l_VoidID; $_l_YearExpires; AAofflineID)
	C_LONGINT:C283(CCM_l_OrderID; CCM_l_PreAuthID; CCM_l_RunTest; CCM_l_TransrecordID; PER_l_Context; vP)
	C_POINTER:C301(CCM_p_TransRecordRETPTR)
	C_REAL:C285($_r_Milliseconds; $_r_PaymentAmount; $_r_PPAmount; $_r_RefundAmount; $0; $1; $4; CCM_R_AuthAmount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnTransID; $_t_CardExpiresSTR; $_t_CCAuthCode; $_t_CCMText; $_t_CCTransID; $_t_DepositID; $_t_ExpiresMonthSTR; $_t_ExpiresYearSTR; $_t_InvoiceID; $_t_ModuleUsed)
	C_TEXT:C284($_t_MonthExpiresSTR; $_t_NameOnCard; $_t_oldMethodName; $_t_PPTransID; $_t_ReceiptID; $_t_RefundType; $_t_ResponseCodeSTR; $_t_ResponseReasonCodeSTR; $_t_ResponseString; $_t_TransactionDetails; $_t_TransactionID)
	C_TEXT:C284($_t_TransactionType; $_t_YearExpiresSTR; $2; $CC_T_CCX99999999999; $CCM_t_AuthorizationProvider; $CCM_T_Response; $_t_CurrentInputForm; $_t_CurrentOutputform; CC_t_AuthCode; CC_T_CCX99999999999; CCM_t_AddressLine1)
	C_TEXT:C284(CCM_t_AddressLine2; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_Country; CCM_t_CountryISO; CCM_t_County; CCM_t_CurrencyCode; CCM_t_ISOCurrencyCode; CCM_t_PostalCode)
	C_TEXT:C284(CCM_t_Town; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
	C_TIME:C306($_ti_Time; CCM_ti_ReconcileTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_VoidTransaction")
//this method will VOID a transaction
$_bo_CloseWindow:=False:C215
If (Not:C34(<>EtransInited))
	
	//INIT_BashWrapper   `Supposed to get around the 2004 version problem..we will see! Removed August 2009
	//INIT_TCPd (TCPd_ITK_v25x_Plugin ;"ITKP06118058100000014A";"";"oordQIPaojwssX3gEspn0jjED+GtKC5n";1) Removed August 2009
	//INIT_HTTPcd  Removed August 2009
	//INIT_ETRANS ("c7jSgr0fMi+Kgwt/fxMXF0QzJochrtty") Removed August 2009
End if 
If (Not:C34(<>CCM_bo_Inited))
	CCM_InitCreditCardModule
End if 

$0:=0


$0:=0
$_r_Milliseconds:=Milliseconds:C459


$_bo_isVoid:=False:C215
If (Count parameters:C259>=2)
	If (Count parameters:C259>=4)
		$_r_RefundAmount:=$4
	End if 
	CCM_l_PreAuthID:=$1
	QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=CCM_l_PreAuthID)
	$_d_AuthDate:=!00-00-00!
	$_bo_CouldBeVoid:=False:C215
	If (Records in selection:C76([CC_OrderAuths:133])>0)
		$_d_AuthDate:=[CC_OrderAuths:133]AuthorizationDate:4
		
		CC_t_AuthCode:=[CC_OrderAuths:133]AuthorizationCode:6
		CCM_R_AuthAmount:=[CC_OrderAuths:133]AuthorizationAmount:5
		$_r_PPAmount:=CCM_R_AuthAmount
		
		If ($_r_RefundAmount>0)
			If (CCM_R_AuthAmount=$_r_RefundAmount) & ($_d_AuthDate=Current date:C33(*))
				$_r_PaymentAmount:=$_r_RefundAmount
				Case of 
					: (CCM_R_AuthAmount=$_r_RefundAmount) & ($_d_AuthDate=Current date:C33(*))
						$_bo_CouldBeVoid:=True:C214
						$_t_TransactionType:="CREDIT"
					Else 
						$_t_TransactionType:="CREDIT"
				End case 
			Else 
				$_r_PaymentAmount:=$_r_RefundAmount
				$_t_TransactionType:="CREDIT"
			End if 
		Else 
			$_r_PaymentAmount:=CCM_R_AuthAmount
			$_t_TransactionType:="VOID"
		End if 
		
		$_l_CreditCardID:=[CC_OrderAuths:133]CC_RecordID:3
		$_t_CCAuthCode:=[CC_OrderAuths:133]AuthorizationCode:6
		$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
		
		If ($_l_CreditCardID>0)
			CCM_LoadServiceProvidersV11(True:C214)
			
			If ($_l_CCAuthTransactionID>0)  //²
				READ WRITE:C146([CCM_PSPTransaction:136])  //²
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //²
				[CCM_PSPTransaction:136]XTransactionStatus:15:=-2  // mark the auth so it does not get used again
				DB_SaveRecord(->[CCM_PSPTransaction:136])
				$_l_ServiceID:=[CCM_PSPTransaction:136]XPSPID:14  //²
				$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
				If ($_l_ServiceRow>0)
					CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
					CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_ServiceRow}
					CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_ServiceRow}
					CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_ServiceRow}
					CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
					CCM_l_RunTest:=CCM_al_TestMode{$_l_ServiceRow}
					$_t_CCTransID:=[CCM_PSPTransaction:136]xPSPTransID:16
					$_t_DepositID:=[CCM_PSPTransaction:136]xDepositCode:12
					$_t_InvoiceID:=[CCM_PSPTransaction:136]xInvoiceID:11
					$_l_OrderID:=[CCM_PSPTransaction:136]xOrderID:10
					$_t_ReceiptID:=[CCM_PSPTransaction:136]xReceiptID:13
					
					If ($_bo_CouldBeVoid)
						If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30))
							$_t_TransactionType:="VOID"
							$_bo_IsaVoid:=True:C214
							
						Else 
							
						End if 
					End if 
				Else 
					Gen_Alert("The Payment provider details are not on the system, this refund can not be processed")
					$_l_CreditCardID:=0
				End if 
			Else 
				If ($_bo_CouldBeVoid)
					//
				End if 
			End if 
			If ($_l_CreditCardID>0)
				If ([xCreditCardDetails:132]x_ID:1#$_l_CreditCardID)
					QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CreditCardID)
				End if 
				If (CCM_bo_useAVS)  //& False)
					$_bo_Continue:=CCM_GetAddress([xCreditCardDetails:132]x_ID:1; ->CCM_t_AddressLine1; ->CCM_t_Town; ->CCM_t_County; ->CCM_t_PostalCode; ->CCM_t_CountryISO)
				End if 
				CCM_DecryptCardNumber
				$_t_NameOnCard:=CCM_DecryptCardName
				$_t_ExpiresYearSTR:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
				If (Length:C16($_t_ExpiresYearSTR)=4)
					$_t_ExpiresYearSTR:=Substring:C12($_t_ExpiresYearSTR; 3; 2)
				End if 
				$_t_ExpiresMonthSTR:=String:C10(Month of:C24([xCreditCardDetails:132]EndDate:8))
				If (Length:C16($_t_ExpiresMonthSTR)=1)
					$_t_ExpiresMonthSTR:="0"+$_t_ExpiresMonthSTR
				End if 
				$_t_CardExpiresSTR:=$_t_ExpiresMonthSTR+"/"+$_t_ExpiresYearSTR
				$CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; " "; "")
				If ($2="")
					CCM_t_CurrencyCode:=<>SYS_t_BaseCurrency
				Else 
					CCM_t_CurrencyCode:=$2
				End if 
				
				If ([CURRENCIES:71]Currency_Code:1#CCM_t_CurrencyCode)
					
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CCM_t_CurrencyCode)
				End if 
				
				If ([CURRENCIES:71]ISO_Currency_Code:8="")
					Gen_Alert("The ISO currency code is not known for "+CCM_t_CurrencyCode+Char:C90(13)+" This must be set to process a credit card authorization"+Char:C90(13)+" It will only need to be"+" set once")
					Repeat 
						//$CurrentDefault:=Current default table
						$_t_CurrentInputForm:=WIN_t_CurrentInputForm
						$_t_CurrentOutputform:=WIN_t_CurrentOutputform
						
						READ WRITE:C146([CURRENCIES:71])
						LOAD RECORD:C52([CURRENCIES:71])
						$_bo_ViewLists:=<>ViewLists  // Disable so we always get an input form
						PER_l_Context:=1
						<>ViewLists:=False:C215
						Gen_Mod("Edit Currency"; "Currency_File"; "MasterCur"; ->[CURRENCIES:71]; ->vP; ""; "Currency Modify")
						<>ViewLists:=$_bo_ViewLists
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CCM_t_CurrencyCode)
						If ([CURRENCIES:71]ISO_Currency_Code:8="")
							Gen_Confirm("Sorry you must set this to continue"; "Try Again"; "Stop")
							If (OK=0)
								CCM_t_ISOCurrencyCode:="NUL"
							End if 
						Else 
							CCM_t_ISOCurrencyCode:=[CURRENCIES:71]ISO_Currency_Code:8
						End if 
					Until (CCM_t_ISOCurrencyCode#"")
				Else 
					CCM_t_ISOCurrencyCode:=[CURRENCIES:71]ISO_Currency_Code:8
				End if 
				
				If (CCM_t_ISOCurrencyCode#"NUL")
					
					Case of 
						: (CCM_t_AuthorizationProvider="Transax")
							If (CCM_t_ISOCurrencyCode#"USD")
							End if 
							$_bo_InTest:=False:C215
							
							If (Count parameters:C259>=3)
								If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30)) & (Current date:C33(*)=$3) | (CCM_bo_DONTTRYCREDIT)
									$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
								Else 
									If (Current date:C33(*)=$3)  //if whole amount is being refunded this var wont have been set but we are about to switch it from void to credit
										$_bo_CouldBeVoid:=True:C214
									End if 
									$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; "Credit")
								End if 
							Else 
								$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
							End if 
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="transaxdemo") | (CCM_l_RunTest=1)
								Gen_Alert("The credit card module is not licenced, you may not process a void")
								
							Else 
								$_t_TransactionID:=CCM_transaxsubmit($_t_TransactionType; CCM_t_AuthorizationLogin; CCM_t_AuthorizationLogin; $_r_PaymentAmount; $_t_CCTransID)
							End if 
						: (CCM_t_AuthorizationProvider="Authorize Net")
							If (CCM_t_ISOCurrencyCode="USD")
								$_bo_InTest:=False:C215
								If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="92KgL2uD") | (CCM_l_RunTest=1)
									//use a dummy card number here
									$_bo_InTest:=True:C214
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										CCM_l_TransrecordID:=CCM_AN_Initiate
										Case of 
											: (CCM_t_AuthorizationLogin="92KgL2uD")
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; "4007000000027"; "x_exp_date"; $_t_CardExpiresSTR)
												
												
												
											Else 
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpiresSTR)
										End case 
										
									End if 
									
								Else 
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										CCM_l_TransrecordID:=CCM_AN_Initiate
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpiresSTR)
										
									End if 
								End if 
								If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="92KgL2uD") | (CCM_l_RunTest=1)
									If (Current user:C182#"Designer") & Not:C34((CCM_l_RunTest=1))
										$_bo_InTest:=True:C214
										Gen_Alert("WARNING:"+" The credit card module is not licenced, this will operate in test mode")
									Else 
										$_bo_InTest:=True:C214
										If (CCM_l_RunTest=1)
											
											Gen_Alert("WARNING:"+" The credit card module is set to operate in test mode")
										End if 
										
									End if 
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										If (CCM_l_RunTest=1)
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_test_request"; "TRUE")
										End if 
										
									End if 
								End if 
								If (Count parameters:C259>=3)
									If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30)) & (Current date:C33(*)=$3) | (CCM_bo_DONTTRYCREDIT)
										
										$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
									Else 
										If (Current date:C33(*)=$3)  //if whole amount is being refunded this var wont have been set but we are about to switch it from void to credit
											$_bo_CouldBeVoid:=True:C214
										End if 
										$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; "Credit")
									End if 
									
								Else 
									$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
								End if 
								
								//``
								
								
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_type"; $_t_TransactionType)
									
								End if 
								
								If ($_t_CCTransID#"")
									
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_trans_ID"; $_t_CCTransID)
										
									End if 
								End if 
								
								
								
								//it is an option to use the 3 digit security code from the back of the card
								//we will not store that for security reasons
								SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
								CCM_p_TransRecordRETPTR:=->CCM_Bl_TransResponse
							Else 
								//if it is not dollars it goes through world pay which is the same company
								CCM_t_AuthorizationProvider:="Worldpay"
							End if 
							
						: (CCM_t_AuthorizationProvider="Paypal")
							//$_t_TransactionType
							$_t_PPTransID:=$_t_CCTransID
							$_t_TransactionType:="Refund"
							$_bo_InTest:=False:C215
							$_l_MonthExpires:=Num:C11($_t_ExpiresMonthSTR)
							$_l_YearExpires:=Num:C11($_t_ExpiresYearSTR)
							If ($_l_YearExpires<2000)
								$_l_YearExpires:=$_l_YearExpires+2000
							End if 
							If ($_l_MonthExpires<10)
								$_t_MonthExpiresSTR:="0"+String:C10($_l_MonthExpires)
							Else 
								$_t_MonthExpiresSTR:=String:C10($_l_MonthExpires)
							End if 
							$_t_YearExpiresSTR:=String:C10($_l_YearExpires)
							
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="timx_1334746876_biz_api1.me.com") | (CCM_l_RunTest=1)
								$_bo_InTest:=True:C214
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_l_TransrecordID:=CCM_PP_Initiate
									
									Case of 
										: (CCM_t_AuthorizationLogin="nigelx_1334600399_biz@me.com")
											CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "TransactionID"; $_t_PPTransID; "RefundType"; "Full")
										Else 
											//have to calculate if this is a full refund?(Full or Partial)
											If (Num:C11($_r_PPAmount)>$_r_PaymentAmount)
												$_t_RefundType:="Partial"
											Else 
												$_t_RefundType:="Full"
											End if 
											CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "TransactionID"; $_t_PPTransID; "RefundType"; $_t_RefundType)
											
									End case 
									
								End if 
							Else 
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									//have to calculate if this is a full refund?(Full or Partial)
									If (Num:C11($_r_PPAmount)>$_r_PaymentAmount)
										$_t_RefundType:="Partial"
									Else 
										$_t_RefundType:="Full"
									End if 
									CCM_l_TransrecordID:=CCM_PP_Initiate
									CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "TransactionID"; $_t_PPTransID; "RefundType"; $_t_RefundType)
									
								End if 
							End if 
							
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="2222nigel.greenlee_1332436768_biz_api1.me.com") | (CCM_l_RunTest=1)
								If (Current user:C182#"Designer") & (Not:C34(CCM_l_RunTest=1))
									Gen_Alert("WARNING:"+" The credit card module is not licenced, this will operate in test mode")
									$_bo_InTest:=True:C214
								Else 
									$_bo_InTest:=True:C214
									If (CCM_l_RunTest=1)
										Gen_Alert("WARNING:"+" The credit card module is set to operate in test mode")
									End if 
									
								End if 
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									If (CCM_l_RunTest=1)
										
									End if 
									
								End if 
								
							End if 
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
								CCM_PP_InsertData(CCM_l_TransrecordID; "Password"; CCM_t_AuthorizationPass)
							End if 
							
							If ($_t_InvoiceID#"")
								//we have an invoice number so we can check tax
								If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceID)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceID)
									
								End if 
								If (Not:C34(CCM_bo_OfflineHandling))
									CCM_PP_InsertData(CCM_l_TransrecordID; "InvoiceID"; $_t_InvoiceID)
								End if 
								
							Else 
								If ($_t_DepositID#"")  //entering a deposit payment
									If ([INVOICES:39]Invoice_Number:1#$_t_DepositID)
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositID)
										
									End if 
									If (Not:C34(CCM_bo_OfflineHandling))
										CCM_PP_InsertData(CCM_l_TransrecordID; "InvoiceID"; $_t_DepositID)
									End if 
									
								Else 
									//not an invoice or a deposit. is it an order
									If (CCM_l_OrderID>0)
										//this is an order
										If ([ORDERS:24]x_ID:58#CCM_l_OrderID)
											QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=CCM_l_OrderID)
										End if 
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_PP_InsertData(CCM_l_TransrecordID; "InvoiceID"; [ORDERS:24]Order_Code:3)
											
										End if 
										
										
										
									End if 
								End if 
							End if 
							
					End case 
					
					If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
						Case of 
							: (CCM_t_AuthorizationProvider="Transax")
								$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
								CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								//the respone code 1 is the same as for an 2=declined,10=error , 20=sys error
							: (CCM_t_AuthorizationProvider="Authorize Net")
								$_l_ResponseCode:=CCM_AuthorizeNetSubmit(CCM_l_TransrecordID; ->CCM_Bl_TransResponse)
							: (CCM_t_AuthorizationProvider="Paypal")
								$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
								Case of 
									: ($_t_TransactionType="Sale")
										$_t_ModuleUsed:="DoDirect"
										$_l_ResponseCode:=CCM_PaypalRequest($_bo_TestMode; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; "Sale"; CCM_l_TransrecordID; "DoDirectPayment")
									: ($_t_TransactionType="Capture")
										$_t_ModuleUsed:="DoCapture"
										$_l_ResponseCode:=CCM_PaypalRequest($_bo_TestMode; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; "Capture"; CCM_l_TransrecordID; "DoCapture")
									: ($_t_TransactionType="Refund")
										$_t_ModuleUsed:="DoRefund"
										$_l_ResponseCode:=CCM_PaypalRequest($_bo_TestMode; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; "Refund"; CCM_l_TransrecordID; "DoRefund")
									: ($_t_TransactionType="Void")
										$_t_ModuleUsed:="DoVoid"
										//not sure this happens here
										$_l_ResponseCode:=CCM_PaypalRequest($_bo_TestMode; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; "Void"; CCM_l_TransrecordID; "DoVoid")
										
								End case 
								
						End case 
					Else 
						$_l_ResponseCode:=1
					End if 
					
					$_l_offset:=0
					If ($_l_ResponseCode#-1)
						$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
						
						Case of 
							: (CCM_t_AuthorizationProvider="Transax")
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_AnTransID:=CCM_ExtractField("Transax"; "TRANS_ID"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								Else 
									AAofflineID:=0
									$_t_AnTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
								End if 
								$_bo_Reject:=False:C215
								
								
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
									//$_t_ResponseReasonCodeSTR:=CCM_ExtractField ("Transax";"STATUS_MSG";$CCM_T_Response)
									$_t_ResponseString:=CCM_ExtractField("Transax"; "STATUS_MSG"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								Else 
									$_t_ResponseCodeSTR:="1"
									$_t_ResponseReasonCodeSTR:=""
									$_t_ResponseString:=""
								End if 
								$_bo_Failed:=False:C215
								$_bo_IgnoreFailonReturn:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="1")  // card is accepted
										$_bo_CloseWindow:=True:C214
										$_ti_Time:=Current time:C178(*)
										
										Gen_Message("Amount Voided")
										$_bo_Failed:=False:C215
									: ($_t_ResponseCodeSTR="2")  // card is declined
										Gen_Alert("Void DECLINED "+$_t_ResponseString)
										//this cannot be a 27 because we turn off avs for voids
										
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="10")  //error in card handling
										If ($_t_TransactionType="VOID")
											Gen_Alert("An error occurred  "+$_t_ResponseString+" void has not been obtained")
										Else 
											If ($_bo_CouldBeVoid)
												Gen_Confirm("The credit (refund) has not been obtained, however this may be because the transa"+"ction has not been settled"+". Would you like to try to void it(This will be for whole amount)?"; "Yes"; "No")
												If (OK=1)
													CCM_bo_DONTTRYCREDIT:=True:C214
													$_l_VoidID:=CCM_VoidTransaction($1; $2; $3)
													CCM_bo_DONTTRYCREDIT:=False:C215
													$_bo_IgnoreFailonReturn:=True:C214
												End if 
												OK:=1
											Else 
												Gen_Alert("An error occurred  "+$_t_ResponseString+" Credit(refund) has not been obtained")
											End if 
										End if 
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="4")  //transaction being held for review
										Gen_Alert("Transaction being held"+$_t_ResponseString)
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="20")
										Gen_Alert("An error occurred  the Gateway could not be contacted")
										$_bo_Failed:=True:C214
									Else 
										Gen_Confirm("The following response was received"+" "+$_t_ResponseString+". Please confirm if this response should be accepted as a void. And advise Dayboo"+"k of this problem"; "Reject"; "Accept")
										If (OK=1)
											$_bo_Failed:=True:C214
										End if 
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									
									$0:=CCM_CreateTransactionRecord(CCM_t_AuthorizationProvider; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; $_t_TransactionType; $_l_CreditCardID; $_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_AnTransID)
									
								Else 
									
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:=$CCM_t_AuthorizationProvider
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
									[CCM_PSPTransaction:136]x_CCID:8:=$_l_CreditCardID
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CreditCardID)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=$_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_AnTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								
								If ($_bo_Failed)
									If ($_bo_IgnoreFailonReturn)
										$0:=$_l_VoidID
										
									Else 
										$0:=0
									End if 
								End if 
								
							: (CCM_t_AuthorizationProvider="Authorize Net")
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_AnTransID:=CCM_ExtractField("Authorize Net"; "Transaction ID"; $CCM_T_Response)
								Else 
									AAofflineID:=0
									$_t_AnTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
								End if 
								$_bo_Reject:=False:C215
								
								
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
									$_t_ResponseString:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
								Else 
									$_t_ResponseCodeSTR:="1"
									$_t_ResponseReasonCodeSTR:=""
									$_t_ResponseString:=""
								End if 
								$_bo_Failed:=False:C215
								$_bo_IgnoreFailonReturn:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="1")  // card is accepted
										$_bo_CloseWindow:=True:C214
										$_ti_Time:=Current time:C178(*)
										
										Gen_Message("Amount Voided")
										$_bo_Failed:=False:C215
									: ($_t_ResponseCodeSTR="2")  // card is declined
										Gen_Alert("Void DECLINED "+$_t_ResponseString)
										//this cannot be a 27 because we turn off avs for voids
										
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="3")  //error in card handling
										If ($_t_TransactionType="VOID")
											Gen_Alert("An error occurred  "+$_t_ResponseString+" void has not been obtained")
										Else 
											If ($_bo_CouldBeVoid)
												Gen_Confirm("The credit (refund) has not been obtained, however this may be because the transa"+"ction has not been settled"+". Would you like to try to void it(This will be for the whole amount)?"; "Yes"; "No")
												If (OK=1)
													CCM_bo_DONTTRYCREDIT:=True:C214
													$_l_VoidID:=CCM_VoidTransaction($1; $2; $3)
													CCM_bo_DONTTRYCREDIT:=False:C215
													$_bo_IgnoreFailonReturn:=True:C214
												End if 
												OK:=1
											Else 
												Gen_Alert("An error occurred  "+$_t_ResponseString+" Credit(refund) has not been obtained")
											End if 
										End if 
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="4")  //transaction being held for review
										Gen_Alert("Transaction being held"+$_t_ResponseString)
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="-1")
										Gen_Alert("An error occurred  the Gateway could not be contacted")
										$_bo_Failed:=True:C214
									Else 
										Gen_Confirm("The following response was received"+$_t_ResponseCodeSTR+" "+$_t_ResponseString+". Please confirm if this response should be accepted as a void. And advise Dayboo"+"k of this problem"; "Reject"; "Accept")
										If (OK=1)
											$_bo_Failed:=True:C214
										End if 
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									
									$0:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; $_t_TransactionType; $_l_CreditCardID; $_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_AnTransID)
								Else 
									
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:="Authorize Net"
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
									[CCM_PSPTransaction:136]x_CCID:8:=$_l_CreditCardID
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CreditCardID)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=$_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_AnTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								
								If ($_bo_Failed)
									If ($_bo_IgnoreFailonReturn)
										$0:=$_l_VoidID
										
									Else 
										$0:=0
									End if 
								End if 
								
								
								
							: (CCM_t_AuthorizationProvider="Paypal")
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $CCM_T_Response; $_t_ModuleUsed)
									
									
								Else 
									AAofflineID:=0
									$_t_AnTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
								End if 
								$_bo_Reject:=False:C215
								
								$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
								$_t_TransactionDetails:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
								//TRACE
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "Transaction")
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TransactionDetails; "Transaction")
									$_t_ResponseString:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "Transaction")
								Else 
									$_t_ResponseCodeSTR:="Completed"
									$_t_ResponseReasonCodeSTR:=""
									$_t_ResponseString:=""
								End if 
								
								
								$_bo_Failed:=False:C215
								$_bo_IgnoreFailonReturn:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="Completed")  // card is accepted
										$_bo_CloseWindow:=True:C214
										$_ti_Time:=Current time:C178(*)
										
										Gen_Message("Amount Voided")
										$_bo_Failed:=False:C215
										
										
									Else 
										Gen_Confirm("The following response was received"+$_t_ResponseCodeSTR+" "+$_t_ResponseString+". Please confirm if this response should be accepted as a void. And advise Dayboo"+"k of this problem"; "Reject"; "Accept")
										If (OK=1)
											$_bo_Failed:=True:C214
										End if 
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_CCMText:=$_t_ModuleUsed+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
									SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
									TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
									
									$0:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; $_t_TransactionType; $_l_CreditCardID; $_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
								Else 
									
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:="Paypal"
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
									[CCM_PSPTransaction:136]x_CCID:8:=$_l_CreditCardID
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CreditCardID)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=$_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_AnTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								
								If ($_bo_Failed)
									If ($_bo_IgnoreFailonReturn)
										$0:=$_l_VoidID
										
									Else 
										$0:=0
									End if 
								End if 
								
								
								
						End case 
					Else 
						Gen_Alert("The Transaction could not be Voided")
						$0:=0
					End if 
				Else 
					
				End if 
				
				//Get the card and get the money
				//Create a record with it
			End if 
		Else 
			
		End if 
	Else 
		Gen_Alert("This could not be a void ...no order auth")
	End if 
Else 
	Gen_Alert("This could not be a void-insufficient parameters")
End if 

If ($_bo_CloseWindow)
	Repeat 
		DELAY PROCESS:C323(Current process:C322; 30)
	Until (Current time:C178(*)>($_ti_Time+2))
	
	CLOSE WINDOW:C154
End if 
ERR_MethodTrackerReturn("CCM_VoidTransaction"; $_t_oldMethodName)