//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_ProcessCard
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	//ARRAY LONGINT(CCM_al_ActiveServiceIDs;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CCM_at_ActiveServices;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BLOB:C604(CCM_bl_SentData; CCM_Bl_TransRecord; CCM_Bl_TransResponse)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; <>ViewLists; $_bo_AVSReprocess; $_bo_Continue; $_bo_Failed; $_bo_GIveUp; $_bo_InTest; $_bo_NGTestAVS; $_bo_NoCVSError; $_bo_NoError)
	C_BOOLEAN:C305($_bo_Reject; $_bo_Retry; $_bo_TaxExempt; $_bo_TestMode; $_bo_Unload; $_bo_ViewLists; $CCM_bo_DisableAVSTEMP; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; CCM_bo_DisableTEMP; CCM_bo_IsLicenced)
	C_BOOLEAN:C305(CCM_bo_OfflineHandling; CCM_bo_useAVS; CCM_bo_useCV2; GEN_Bo_ShowCreate)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($_l_CCAuthTransactionID; $_l_CCID; $_l_CharacterPosition; $_l_ContactID; $_l_Element; $_l_Index; $_l_inTest; $_l_MonthExpires; $_l_MonthNumber; $_l_offset; $_l_OK)
	C_LONGINT:C283($_l_OrderID; $_l_ResponseCode; $_l_Retries; $_l_ServiceID; $_l_ServiceRow; $_l_TempAVSOff; $_l_UseAVS; $_l_YearExpires; $_l_YearNUM; $0; $3)
	C_LONGINT:C283($4; $5; $6; $8; $9; $_l_CurrentWinRefOLD; AAofflineID; CCM_l_cardIDtoAuth; CCM_l_OrderID; CCM_l_RejectedID; CCM_l_RunTest)
	C_LONGINT:C283(CCM_l_TransrecordID; PER_l_Context; vP; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301(CCM_p_TransRecordRETPTR)
	C_REAL:C285($_r_PaymentAmount; $2)
	C_TEXT:C284($_t_ANTransID; $_t_AVSResult; $_t_CardExpires; $_t_CardType; $_t_CCAuthCode; $_t_CCMAVSResult; $_t_CCMCompanyCode; $_t_CCMText; $_t_CCTransID; $_t_CompanyName; $_t_CV2Response)
	C_TEXT:C284($_t_CVV2; $_t_DepositID; $_t_EmailAddress; $_t_ExtractedResponseText; $_t_InvoiceID; $_t_ModuleUsed; $_t_MonthExpiresSTR; $_t_MonthNumber; $_t_NameOnCard; $_t_oldMethodName; $_t_oldMethodName2)
	C_TEXT:C284($_t_PPAmount; $_t_PPTransID; $_t_ReceiptID; $_t_RefundType; $_t_RequestModule; $_t_ResponseCodeSTR; $_t_ResponseData; $_t_ResponseReasonCodeSTR; $_t_ResponseText; $_t_TaxAmount; $_t_TestExpires)
	C_TEXT:C284($_t_TestTransID; $_t_TransactionDetails; $_t_TransactionType; $_t_TransID; $_t_TRTransID; $_t_Year; $_t_YearExpiresSTR; $1; $10; $11; $12)
	C_TEXT:C284($7; $CC_T_CCX99999999999; $CCM_T_Response; $_t_CurrentInputForm; $_t_CurrentOutputform; CC_t_AuthCode; CC_T_CCX99999999999; CCM_t_LastName; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_t_AuthorizationLogin)
	C_TEXT:C284(CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AVSResult; CCM_t_CompanyCode; CCM_t_Country; CCM_t_CountryISO; CCM_t_County; CCM_t_CurrencyCode; CCM_t_CV2Response; CCM_t_DepositNumber)
	C_TEXT:C284(CCM_t_FAILCode; CCM_t_FirstName; CCM_t_InvoiceNumber; CCM_t_ISOCurrencyCode; CCM_t_PostalCode; CCM_t_Title; CCM_t_Town; CCM_T_xxxNameOnCard; DB_t_WindowTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_ProcessCard")


//this method will obtain money from the CC company

$_bo_InTest:=False:C215
$0:=0
$_bo_NGTestAVS:=False:C215
//``
If (Not:C34(<>CCM_bo_Inited))
	CCM_InitCreditCardModule
End if 

If (Count parameters:C259>=9)
	$_l_ContactID:=$9
	If (Count parameters:C259>=10)
		$_t_InvoiceID:=$10
		If (Count parameters:C259>=11)
			$_t_DepositID:=$11
			If (Count parameters:C259>=12)
				$_t_ReceiptID:=$12
			Else 
				$_t_ReceiptID:=""
			End if 
			
		Else 
			$_t_ReceiptID:=""
			$_t_DepositID:=""
		End if 
	Else 
		$_t_ReceiptID:=""
		$_t_InvoiceID:=""
		$_t_DepositID:=""
	End if 
Else 
	$_t_ReceiptID:=""
	$_l_OrderID:=0
	$_t_InvoiceID:=""
	$_t_DepositID:=""
End if 
If (CCM_t_InvoiceNumber#"")
	$_t_InvoiceID:=CCM_t_InvoiceNumber
End if 
If (CCM_t_DepositNumber#"")
	$_t_DepositID:=CCM_t_DepositNumber
End if 
//``
$0:=-1
If (Count parameters:C259>=3)
	Case of 
		: ($3>0)
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$3)
			$_l_CCID:=[CC_OrderAuths:133]CC_RecordID:3
			$_t_CCAuthCode:=[CC_OrderAuths:133]AuthorizationCode:6
			$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
			//this is a prior auth capture so we need the ID
			CCM_LoadServiceProvidersV11(True:C214)
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //our reference
			$_l_ServiceID:=[CCM_PSPTransaction:136]XPSPID:14
			$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
			If ($_l_ServiceRow>0)
				CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
			Else 
				CCM_t_AuthorizationProvider:="Authorize Net"
			End if 
			
			
			If (CCM_bo_useAVS) & (Not:C34(CCM_bo_DisableAVSTEMP))
				$_t_ExtractedResponseText:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
				//Note this is extracting from a previous auth
				Case of 
					: (CCM_t_AuthorizationProvider="Transax")
						$_t_AVSResult:=CCM_ExtractField("Transax"; "AVS_CODE"; $_t_ExtractedResponseText; "|"; 1; ->[CCM_PSPTransaction:136]RESPONSEDATA:7)
						$_bo_NoError:=False:C215
						Case of 
							: ($_t_AVSResult="A")
								CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
								//$_bo_NoError:=True
							: ($_t_AVSResult="B")
								//CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
								//: ($_t_AVSResult="O")
								//CCM_t_AVSResult:="AVS error "
							: ($_t_AVSResult="G") | ($_t_AVSResult="I")
								CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
								$_bo_NoError:=True:C214
								
							: ($_t_AVSResult="N") | ($_t_AVSResult="C")
								CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
								
								
							: ($_t_AVSResult="O")
								CCM_t_AVSResult:="AVS not applicable for this transaction "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="R")
								CCM_t_AVSResult:="Retry – System unavailable or timed out "
								
							: ($_t_AVSResult="S")
								CCM_t_AVSResult:="Service not supported by issuer"
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="U")
								CCM_t_AVSResult:="Address information is unavailable "
							: ($_t_AVSResult="W")
								CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="X")
								CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Y")
								CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Z") | ($_t_AVSResult="P") | ($_t_AVSResult="L")
								CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
								$_bo_NoError:=True:C214
							Else 
								CCM_t_AVSResult:=$_t_AVSResult
						End case 
						If (Not:C34($_bo_NoError))
							Gen_Confirm("This authorization  address  verification failed for the follow"+"ing reason"+Char:C90(13)+CCM_t_AVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
							$_l_OK:=OK
							If ($_l_OK=1)
								CCM_bo_DisableAVSTEMP:=True:C214
								If ($_bo_NGTestAVS)
									Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 128")
								End if 
							End if 
							OK:=1
						Else 
							$_l_OK:=1
						End if 
					: (CCM_t_AuthorizationProvider="Authorize Net")
						
						If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
							$_t_AVSResult:=CCM_ExtractField("Authorize Net"; "AVS Result Code"; $_t_ExtractedResponseText)
						Else 
							$_t_AVSResult:="X"
						End if 
						$_bo_NoError:=False:C215
						Case of 
							: ($_t_AVSResult="A")
								$_t_CCMAVSResult:="Address (Street) matches, ZIP does not"
								//$_bo_NoError:=True
							: ($_t_AVSResult="B")
								$_t_CCMAVSResult:="Address information not provided for AVS check "
							: ($_t_AVSResult="E")
								$_t_CCMAVSResult:="AVS error "
							: ($_t_AVSResult="G")
								$_t_CCMAVSResult:="Non-U.S. Card Issuing Bank "
								
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="N")
								$_t_CCMAVSResult:="No Match on Address (Street) or ZIP "
								
								
							: ($_t_AVSResult="P")
								$_t_CCMAVSResult:="AVS not applicable for this transaction "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="R")
								$_t_CCMAVSResult:="Retry – System unavailable or timed out "
								
							: ($_t_AVSResult="S")
								$_t_CCMAVSResult:="Service not supported by issuer"
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="U")
								$_t_CCMAVSResult:="Address information is unavailable "
							: ($_t_AVSResult="W")
								$_t_CCMAVSResult:="9 digit ZIP matches, Address (Street) does not "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="X")
								$_t_CCMAVSResult:="Address (Street) and 9 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Y")
								$_t_CCMAVSResult:="Address (Street) and 5 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Z")
								$_t_CCMAVSResult:="5 digit ZIP matches, Address (Street) does not"
								$_bo_NoError:=True:C214
							Else 
								$_t_CCMAVSResult:=$_t_AVSResult
						End case 
						If (Not:C34($_bo_NoError))
							Gen_Confirm("This  address verification verification failed for the follow"+"ing reason"+Char:C90(13)+$_t_CCMAVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
							$_l_OK:=OK
							If ($_l_OK=1)
								CCM_bo_DisableAVSTEMP:=True:C214
								If ($_bo_NGTestAVS)
									Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 128")
								End if 
							End if 
							OK:=1
						Else 
							$_l_OK:=1
						End if 
					: (CCM_t_AuthorizationProvider="Paypal")
						$CCM_T_Response:=$_t_ExtractedResponseText
						$_l_CharacterPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
						$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
						$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharacterPosition+Length:C16("END REQUEST TYPE"))
						$_l_CharacterPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
						$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
						$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharacterPosition+Length:C16("END REQUEST RESPONSE"))
						$_l_CharacterPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
						$_t_TransactionDetails:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
						$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $_t_ResponseText; $_t_RequestModule)
						$_t_PPAmount:=CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText; $_t_RequestModule)
						$_t_AVSResult:=CCM_ExtractField("Paypal"; "AVSCode"; $_t_ResponseText; $_t_RequestModule)
						$_bo_NoError:=False:C215
						Case of 
							: ($_t_AVSResult="A")
								CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
								// $_bo_NoError:=True
							: ($_t_AVSResult="B")
								CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
							: ($_t_AVSResult="C")
								CCM_t_AVSResult:="No "
							: ($_t_AVSResult="D")
								CCM_t_AVSResult:="Exact match"
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="E")
								CCM_t_AVSResult:="Not allowed for MOTO"
							: ($_t_AVSResult="F")
								CCM_t_AVSResult:="UK Address (Street) and 9 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="G")
								CCM_t_AVSResult:="(global)Non-U.S. Card Issuing Bank "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="I")
								CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="M")
								CCM_t_AVSResult:="Address "
								
							: ($_t_AVSResult="N")
								CCM_t_AVSResult:="No "
								
							: ($_t_AVSResult="P")
								CCM_t_AVSResult:="Postal "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="R")
								CCM_t_AVSResult:="Retry – System unavailable or timed out "
								
							: ($_t_AVSResult="S")
								CCM_t_AVSResult:="Service not supported by issuer"
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="U")
								CCM_t_AVSResult:="Address information is unavailable "
							: ($_t_AVSResult="W")
								CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="X")
								CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Y")
								CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
								$_bo_NoError:=True:C214
							: ($_t_AVSResult="Z")
								CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
								$_bo_NoError:=True:C214
							Else 
								CCM_t_AVSResult:=$_t_AVSResult
						End case 
						If (Not:C34($_bo_NoError))
							Gen_Confirm("This  address verification verification failed for the follow"+"ing reason"+Char:C90(13)+$_t_CCMAVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
							$_l_OK:=OK
							If ($_l_OK=1)
								CCM_bo_DisableAVSTEMP:=True:C214
								If ($_bo_NGTestAVS)
									Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 128")
								End if 
							End if 
							OK:=1
						Else 
							$_l_OK:=1
						End if 
						
						
				End case 
				
			End if 
			
			$_t_CCTransID:=[CCM_PSPTransaction:136]xPSPTransID:16
			
			$_t_TransactionType:="PRIOR_AUTH_CAPTURE"
			If ($_t_CCTransID="0")
				$_t_TransactionType:="AUTH_CAPTURE"
			End if 
			
		: ($3<0)
			//Not relating to an order so no order auth
			$_t_TransactionType:="AUTH_CAPTURE"
			
		Else 
			//no card has been authorized so need to select a card
			Case of 
				: (Count parameters:C259>=8)
					Case of 
						: ($7#"")
							//An authorizatio code -the record is probably not in existance yet
							//we are probably in the auth screen
							$_t_TransactionType:="PRIOR_AUTH_CAPTURE"
							$_l_CCID:=$6
							$_t_CCAuthCode:=$7
							$_l_CCAuthTransactionID:=$8
							If ($_l_CCAuthTransactionID#0)
								QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)
								//here we check the avs status of that transaction
								CCM_LoadServiceProvidersV11(True:C214)
								$_l_ServiceID:=[CCM_PSPTransaction:136]XPSPID:14
								$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
								CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
								If (CCM_bo_useAVS) & (Not:C34(CCM_bo_DisableAVSTEMP))
									$_t_ExtractedResponseText:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
									Case of 
										: (CCM_t_AuthorizationProvider="Transax")
											$_t_AVSResult:=CCM_ExtractField("Transax"; "AVS_CODE"; $_t_ExtractedResponseText; "|"; 1; ->[CCM_PSPTransaction:136]RESPONSEDATA:7)
											$_bo_NoError:=False:C215
											Case of 
												: ($_t_AVSResult="A")
													CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
													//$_bo_NoError:=True
												: ($_t_AVSResult="B")
													//CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
													//: ($_t_AVSResult="O")
													//CCM_t_AVSResult:="AVS error "
												: ($_t_AVSResult="G") | ($_t_AVSResult="I")
													CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
													$_bo_NoError:=True:C214
													
												: ($_t_AVSResult="N") | ($_t_AVSResult="C")
													CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
													
													
												: ($_t_AVSResult="O")
													CCM_t_AVSResult:="AVS not applicable for this transaction "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="R")
													CCM_t_AVSResult:="Retry – System unavailable or timed out "
													
												: ($_t_AVSResult="S")
													CCM_t_AVSResult:="Service not supported by issuer"
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="U")
													CCM_t_AVSResult:="Address information is unavailable "
												: ($_t_AVSResult="W")
													CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="X")
													CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Y")
													CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Z") | ($_t_AVSResult="P") | ($_t_AVSResult="L")
													CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
													$_bo_NoError:=True:C214
												Else 
													CCM_t_AVSResult:=$_t_AVSResult
											End case 
											If (Not:C34($_bo_NoError))
												Gen_Confirm("This address verification verification failed for the follow"+"ing reason"+Char:C90(13)+$_t_CCMAVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
												$_l_OK:=OK
												If ($_l_OK=1)
													CCM_bo_DisableAVSTEMP:=True:C214
													If ($_bo_NGTestAVS)
														Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 220")
													End if 
												End if 
												OK:=1
											Else 
												$_l_OK:=1
											End if 
										: (CCM_t_AuthorizationProvider="Authorize Net")
											If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
												$_t_AVSResult:=CCM_ExtractField("Authorize Net"; "AVS Result Code"; $_t_ExtractedResponseText)
											Else 
												$_t_AVSResult:="X"
											End if 
											$_bo_NoError:=False:C215
											Case of 
												: ($_t_AVSResult="A")
													$_t_CCMAVSResult:="Address (Street) matches, ZIP does not"
													//$_bo_NoError:=True  `this is actually an error
												: ($_t_AVSResult="B")
													$_t_CCMAVSResult:="Address information not provided for AVS check "
												: ($_t_AVSResult="E")
													$_t_CCMAVSResult:="AVS error "
												: ($_t_AVSResult="G")
													$_t_CCMAVSResult:="Non-U.S. Card Issuing Bank "
													$_bo_NoError:=True:C214
													
												: ($_t_AVSResult="N")
													$_t_CCMAVSResult:="No Match on Address (Street) or ZIP "
													
													
												: ($_t_AVSResult="P")
													$_t_CCMAVSResult:="AVS not applicable for this transaction "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="R")
													$_t_CCMAVSResult:="Retry – System unavailable or timed out "
													
												: ($_t_AVSResult="S")
													$_t_CCMAVSResult:="Service not supported by issuer"
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="U")
													$_t_CCMAVSResult:="Address information is unavailable "
												: ($_t_AVSResult="W")
													$_t_CCMAVSResult:="9 digit ZIP matches, Address (Street) does not "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="X")
													$_t_CCMAVSResult:="Address (Street) and 9 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Y")
													$_t_CCMAVSResult:="Address (Street) and 5 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Z")
													$_t_CCMAVSResult:="5 digit ZIP matches, Address (Street) does not"
													$_bo_NoError:=True:C214
												Else 
													$_t_CCMAVSResult:=$_t_AVSResult
											End case 
											If (Not:C34($_bo_NoError))
												Gen_Confirm("This  address verification verification failed for the follow"+"ing reason"+Char:C90(13)+$_t_CCMAVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
												$_l_OK:=OK
												If ($_l_OK=1)
													CCM_bo_DisableAVSTEMP:=True:C214
													If ($_bo_NGTestAVS)
														Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 220")
													End if 
												End if 
												OK:=1
											Else 
												$_l_OK:=1
											End if 
										: (CCM_t_AuthorizationProvider="Paypal")
											//TRACE
											$CCM_T_Response:=$_t_ExtractedResponseText
											$_l_CharacterPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
											$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
											$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharacterPosition+Length:C16("END REQUEST TYPE"))
											$_l_CharacterPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
											$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
											$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharacterPosition+Length:C16("END REQUEST RESPONSE"))
											$_l_CharacterPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
											$_t_TransactionDetails:=Substring:C12($CCM_T_Response; 1; $_l_CharacterPosition-1)
											$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $_t_ResponseText; $_t_RequestModule)
											$_t_PPAmount:=CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText; $_t_RequestModule)
											$_t_AVSResult:=CCM_ExtractField("Paypal"; "AVSCode"; $_t_ResponseText; $_t_RequestModule)
											$_bo_NoError:=False:C215
											Case of 
												: ($_t_AVSResult="A")
													CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
													// $_bo_NoError:=True
												: ($_t_AVSResult="B")
													CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
												: ($_t_AVSResult="C")
													CCM_t_AVSResult:="No "
												: ($_t_AVSResult="D")
													CCM_t_AVSResult:="Exact match"
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="E")
													CCM_t_AVSResult:="Not allowed for MOTO"
												: ($_t_AVSResult="F")
													CCM_t_AVSResult:="UK Address (Street) and 9 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="G")
													CCM_t_AVSResult:="(global)Non-U.S. Card Issuing Bank "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="I")
													CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="M")
													CCM_t_AVSResult:="Address "
													
												: ($_t_AVSResult="N")
													CCM_t_AVSResult:="No "
													
												: ($_t_AVSResult="P")
													CCM_t_AVSResult:="Postal "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="R")
													CCM_t_AVSResult:="Retry – System unavailable or timed out "
													
												: ($_t_AVSResult="S")
													CCM_t_AVSResult:="Service not supported by issuer"
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="U")
													CCM_t_AVSResult:="Address information is unavailable "
												: ($_t_AVSResult="W")
													CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="X")
													CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Y")
													CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
													$_bo_NoError:=True:C214
												: ($_t_AVSResult="Z")
													CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
													$_bo_NoError:=True:C214
												Else 
													CCM_t_AVSResult:=$_t_AVSResult
											End case 
											If (Not:C34($_bo_NoError))
												Gen_Confirm("This  address verification verification failed for the follow"+"ing reason"+Char:C90(13)+$_t_CCMAVSResult+"Do you wish to capture funds"; "Capture"; "Reject")
												$_l_OK:=OK
												If ($_l_OK=1)
													CCM_bo_DisableAVSTEMP:=True:C214
													If ($_bo_NGTestAVS)
														Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 128")
													End if 
												End if 
												OK:=1
											Else 
												$_l_OK:=1
											End if 
											
									End case 
									
								End if 
								
								$_t_CCTransID:=[CCM_PSPTransaction:136]xPSPTransID:16
								If ($_t_CCTransID="0")
									$_t_TransactionType:="AUTH_CAPTURE"
								End if 
							Else 
								$_t_CCTransID:="0"
								$_t_TransactionType:="AUTH_CAPTURE"
							End if 
							
						: ($4=Table:C252(->[CONTACTS:1])) | ($4=Table:C252(->[COMPANIES:2]))
							If ($6=0)
								If (CCM_t_CompanyCode#"") & (<>CCM_bo_CompanyCards)
									$_t_CCMCompanyCode:=CCM_t_CompanyCode
									CCM_t_CompanyCode:=""
									If ([CONTACTS:1]x_ID:33#$5)
										QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$5)
									End if 
									If ($_t_CCMCompanyCode#[COMPANIES:2]Company_Code:1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CCMCompanyCode)
									End if 
									$_l_CCID:=CCM_CardSelection($4; $5; [CONTACTS:1]Contact_Code:2; "Select Card for payment"; [COMPANIES:2]x_ID:63)
									//If ($_l_CCID>0)  `added kmw 22/08/08
									//C_DATE(CCM_D_SelectedCardExpiryDate)  `added kmw 22/08/08
									//If (CCM_D_SelectedCardExpiryDate<Current date(*))  `added kmw 22/08/08
									//$_l_CCID:=0
									//Gen_Alert ("Selected card is expired. Cannot process.")  `added kmw 22/08/08
									//End if   `added kmw 22/08/08
									//End if   `added kmw 22/08/08
									CCM_l_cardIDtoAuth:=$_l_CCID
									
								Else 
									If (<>CCM_bo_CompanyCards)
										If ([CONTACTS:1]x_ID:33#$5)
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$5)
										End if 
										$_t_CCMCompanyCode:=CCM_t_CompanyCode
										CCM_t_CompanyCode:=""
										
										If ($_t_CCMCompanyCode#[COMPANIES:2]Company_Code:1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CCMCompanyCode)
										End if 
										$_l_CCID:=CCM_CardSelection($4; $5; [CONTACTS:1]Contact_Code:2; "Select Card for payment"; [COMPANIES:2]x_ID:63)
										//If ($_l_CCID>0)  `added kmw 22/08/08
										//C_DATE(CCM_D_SelectedCardExpiryDate)  `added kmw 22/08/08
										//If (CCM_D_SelectedCardExpiryDate<Current date(*))  `added kmw 22/08/08
										//$_l_CCID:=0
										//Gen_Alert ("Selected card is expired. Cannot process.")  `added kmw 22/08/08
										//End if   `added kmw 22/08/08
										//End if   `added kmw 22/08/08
									Else 
										
										$_l_CCID:=CCM_CardSelection($4; $5)
										//If ($_l_CCID>0)  `added kmw 22/08/08
										//C_DATE(CCM_D_SelectedCardExpiryDate)  `added kmw 22/08/08
										//If (CCM_D_SelectedCardExpiryDate<Current date(*))  `added kmw 22/08/08
										//$_l_CCID:=0
										//Gen_Alert ("Selected card is expired. Cannot process.")  `added kmw 22/08/08
										//End if   `added kmw 22/08/08
										//End if   `added kmw 22/08/08
									End if 
									
								End if 
								
							Else 
								$_l_CCID:=$6
							End if 
							$_l_CCAuthTransactionID:=0
							$_t_TransactionType:="AUTH_CAPTURE"
							$_t_CCAuthCode:=""
					End case 
					
				: (Count parameters:C259>=5)
					Case of 
						: ($4=Table:C252(->[CONTACTS:1])) | ($4=Table:C252(->[COMPANIES:2]))
							If (Count parameters:C259>=6)
								If ($6=0)
									If (CCM_t_CompanyCode#"") & (<>CCM_bo_CompanyCards)
										$_t_CCMCompanyCode:=CCM_t_CompanyCode
										CCM_t_CompanyCode:=""
										If ([CONTACTS:1]x_ID:33#$5)
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$5)
										End if 
										If ($_t_CCMCompanyCode#[COMPANIES:2]Company_Code:1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CCMCompanyCode)
										End if 
										$_l_CCID:=CCM_CardSelection($4; $5; [CONTACTS:1]Contact_Code:2; "Select Card for payment"; [COMPANIES:2]x_ID:63)
										
									Else 
										If ($_t_CCMCompanyCode#[COMPANIES:2]Company_Code:1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CCMCompanyCode)
										End if 
										$_l_CCID:=CCM_CardSelection($4; $5; [CONTACTS:1]Contact_Code:2; "Select Card for payment"; [COMPANIES:2]x_ID:63)
										
									End if 
								Else 
									$_l_CCID:=$6
								End if 
							Else 
								$_t_CCMCompanyCode:=CCM_t_CompanyCode
								CCM_t_CompanyCode:=""
								
								If ($_t_CCMCompanyCode#[COMPANIES:2]Company_Code:1)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CCMCompanyCode)
								End if 
								$_l_CCID:=CCM_CardSelection($4; $5; [CONTACTS:1]Contact_Code:2; "Select Card for payment"; [COMPANIES:2]x_ID:63)
								
							End if 
							
							$_l_CCAuthTransactionID:=0
							$_t_TransactionType:="AUTH_CAPTURE"
							$_t_CCAuthCode:=""
					End case 
					
					
			End case 
			
			
	End case 
	If ($2<0)
		$_r_PaymentAmount:=Abs:C99($2)
		$_t_TransactionType:="CREDIT"
		//WELL ACTUALLY THIS CAN BE A VOID..IF THE PAYMENT WAS TAKEN TODAY AND IT IS BEFORE RECONCILE TIME!
		//````
	Else 
		$_r_PaymentAmount:=$2
	End if 
	If ($_l_CCID>0)
		CCM_LoadServiceProvidersV11(True:C214)
		
		If ($_l_CCAuthTransactionID>0)
			READ WRITE:C146([CCM_PSPTransaction:136])
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)
			[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
			DB_SaveRecord(->[CCM_PSPTransaction:136])
			
			$_l_ServiceID:=[CCM_PSPTransaction:136]XPSPID:14
			$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
			
			CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
			CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_ServiceRow}
			CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_ServiceRow}
			CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_ServiceRow}
			CCM_l_RunTest:=CCM_al_TestMode{$_l_ServiceRow}
			CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
			
		Else 
			ARRAY TEXT:C222(CCM_at_ActiveServices; 0)
			ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; 0)
			ARRAY TEXT:C222(CCM_at_ActiveServices; Size of array:C274(CCM_al_Services))
			ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; Size of array:C274(CCM_al_Services))
			$_l_Element:=0
			$0:=0
			
			
			For ($_l_Index; 1; Size of array:C274(CCM_al_Services))
				If (CCM_abo_AuthActive{$_l_Index})
					$_l_Element:=$_l_Element+1
					CCM_at_ActiveServices{$_l_Element}:=CCM_at_AuthNames{$_l_Index}
					CCM_al_ActiveServiceIDs{$_l_Element}:=CCM_al_Services{$_l_Index}
				End if 
				
			End for 
			ARRAY TEXT:C222(CCM_at_ActiveServices; $_l_Element)
			
			ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; $_l_Element)
			
			Case of 
				: (Size of array:C274(CCM_al_ActiveServiceIDs)=1)
					$_l_ServiceID:=CCM_al_ActiveServiceIDs{1}
					
				: (Size of array:C274(CCM_al_ActiveServiceIDs)>1)
					//ask which to use
					$_l_ServiceID:=CCM_al_ActiveServiceIDs{1}
					ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
					ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
					
					COPY ARRAY:C226(CCM_at_ActiveServices; GEN_at_DropDownMenu)
					COPY ARRAY:C226(CCM_al_ActiveServiceIDs; GEN_al_DropDownMenuID)
					DB_t_WindowTitle:="Select service to use"
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
					GEN_Bo_ShowCreate:=False:C215
					DIALOG:C40([USER:15]; "Gen_PopUpChoice")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					If (GEN_at_DropDownMenu>0)
						$_l_ServiceID:=GEN_al_DropDownMenuID{GEN_at_DropDownMenu}
					End if 
					
					
				Else 
					$_l_ServiceID:=0
					Gen_Alert("You must set up a service first. Check with you administrator")
					
					
			End case 
			If ($_l_ServiceID>0)
				$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
				CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
				CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_ServiceRow}
				CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_ServiceRow}
				CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_ServiceRow}
				CCM_l_RunTest:=CCM_al_TestMode{$_l_ServiceRow}
				CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
			End if 
		End if 
		If ($_t_TransactionType="CREDIT")
			If ((Current time:C178(*)*1)<((CCM_ti_ReconcileTime*1)-30))
				//the time is before reconcile time...but was the amount taken today
				
			End if 
		End if 
		
		If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
			QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
			$_l_ContactID:=[xCreditCardDetails:132]RelatedRecordIdent:13
		Else 
			$_l_ContactID:=[xCreditCardDetails:132]RelatedRecordIdent:13
		End if 
		$CCM_bo_DisableAVSTEMP:=False:C215
		If ($_bo_NGTestAVS)
			Gen_Alert("TEST+ AVS  Temp Disable is false")
		End if 
		
		
		If (CCM_bo_useAVS) & (Not:C34(CCM_bo_DisableAVSTEMP))
			
			$_bo_Continue:=CCM_GetAddress([xCreditCardDetails:132]x_ID:1; ->CCM_t_AddressLine1; ->CCM_t_Town; ->CCM_t_County; ->CCM_t_PostalCode; ->CCM_t_CountryISO)
			If (CCM_t_CountryISO#"")
				$_bo_Unload:=(Records in selection:C76([USER:15])=0)
				READ ONLY:C145([USER:15])
				ALL RECORDS:C47([USER:15])
				//only one record
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[USER:15]Country:7)
				If ($_bo_Unload)
					UNLOAD RECORD:C212([USER:15])
				End if 
				If ([COUNTRIES:73]ISO_Code:6#CCM_t_CountryISO)
					//address is not in the default format country so not point trying avs
					$CCM_bo_DisableAVSTEMP:=True:C214
					If ($_bo_NGTestAVS)
						Gen_Alert("TEST+ AVS  Temp Disable is on (at line 437)")
					End if 
				End if 
			End if 
			
			If ([xCreditCardDetails:132]xAVSStatus:19#"") & (Not:C34($CCM_bo_DisableAVSTEMP))
				//There is an AVS problem
				If ([xCreditCardDetails:132]xAVSStatus:19[[1]]="-")
					Gen_Confirm("There was a previous overridden Address Verification Falure on this card. Do you "+"wish to"+" continue without Address V"+"erification for this Authorization?"; "Yes"; "No")
					If (OK=1)
						CCM_bo_DisableAVSTEMP:=True:C214
						If ($_bo_NGTestAVS)
							Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 455")
						End if 
						$_bo_Continue:=True:C214
					Else 
						$_bo_Continue:=False:C215
					End if 
				Else 
					//the previous problem caused the user to reject
					Gen_Confirm("There was a previous Address Verification Falure on this card leading to a rejec"+"tion. Do you "+"wish to continue without Address verification for this Authorization?"; "No"; "Yes")
					If (OK=0)
						CCM_bo_DisableAVSTEMP:=True:C214
						If ($_bo_NGTestAVS)
							Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is true at line 467")
						End if 
						$_bo_Continue:=True:C214
						OK:=1
					Else 
						$_bo_Continue:=False:C215
					End if 
				End if 
			Else 
				$_bo_Continue:=True:C214
			End if 
		Else 
			$_bo_Continue:=True:C214
		End if 
		If ($_bo_Continue)
			CCM_DecryptCardNumber
			$_t_NameOnCard:=CCM_DecryptCardName
			$_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
			$_t_Year:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
			If (Length:C16($_t_Year)=4)
				$_t_Year:=Substring:C12($_t_Year; 3; 2)
			End if 
			$_t_MonthNumber:=String:C10(Month of:C24([xCreditCardDetails:132]EndDate:8))
			If (Length:C16($_t_MonthNumber)=1)
				$_t_MonthNumber:="0"+$_t_MonthNumber
			End if 
			$_t_CardExpires:=$_t_MonthNumber+"/"+$_t_Year
			$CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; " "; "")
			CCM_t_CurrencyCode:=$1
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
						$_t_CVV2:=""
						$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
						If (Not:C34(CCM_t_ISOCurrencyCode="USD"))
						End if 
						If ($_t_TransactionType#"capture")  //if it s a capture we have already done this on the auth
							If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  //no point in CVV2 on a test trans
								Repeat 
									$_t_CVV2:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
									
									If (Length:C16($_t_CVV2)#3)
										If (Length:C16($_t_CVV2)#4)
											Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
										End if 
									End if 
								Until (Length:C16($_t_CVV2)=3) | (Length:C16($_t_CVV2)=4)
								If (Not:C34(CCM_bo_OfflineHandling))
									
								End if 
							End if 
							CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
							CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
							CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
							CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
							CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
							AA_LoadNameArrays
							CCM_T_xxxNameOnCard:=$_t_NameOnCard
							CCM_t_FirstName:=""
							CCM_t_LastName:=""
							CCM_t_Title:=""
							AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
							CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
							CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
							//```
							If ($_l_ContactID>0)
								If ($_l_ContactID#[CONTACTS:1]x_ID:33)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
								End if 
								If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
									
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								End if 
								If ([CONTACTS:1]Email_Address:35#"")
									If (Length:C16([CONTACTS:1]Email_Address:35)>3)
										$_l_CharacterPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
										If ($_l_CharacterPosition>0)
											If (Not:C34(CCM_bo_OfflineHandling))
												$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
												
											End if 
										End if 
									End if 
								End if 
								
								If ([COMPANIES:2]Private:37=False:C215)
									If ([COMPANIES:2]Company_Name:2#"")
										$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
										
									End if 
									
								End if 
							End if 
							If ($_t_InvoiceID#"")
								//we have an invoice number so we can check tax
								If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceID)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceID)
									
								End if 
								
								If ([INVOICES:39]Total_Tax:35#0)
									$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
									
									$_bo_TaxExempt:=False:C215
									
								Else 
									//no tax
									$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
									$_bo_TaxExempt:=True:C214
								End if 
							Else 
								If ($_t_DepositID#"")  //entering a deposit payment
									If ([INVOICES:39]Invoice_Number:1#$_t_DepositID)
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositID)
										
									End if 
									If ([INVOICES:39]Total_Tax:35#0)
										$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
										$_bo_TaxExempt:=False:C215
									Else 
										//no tax
										$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
										$_bo_TaxExempt:=True:C214
									End if 
								Else 
									//not an invoice or a deposit. is it an order
									If (CCM_l_OrderID>0)
										//this is an order
										If ([ORDERS:24]x_ID:58#CCM_l_OrderID)
											QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=CCM_l_OrderID)
										End if 
										
										If ([ORDERS:24]Total_TAX:7#0)
											$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
											$_bo_TaxExempt:=False:C215
										Else 
											//no tax
											$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
											$_bo_TaxExempt:=True:C214
											
										End if 
										
										
									End if 
								End if 
							End if 
							//````
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="transaxdemo") | (CCM_l_RunTest=1)
								$_d_CurrentDate:=Current date:C33(*)
								$_l_YearNUM:=Year of:C25($_d_CurrentDate)
								$_l_YearNUM:=$_l_YearNUM+1
								
								$_l_MonthNumber:=Month of:C24(Current date:C33(*))
								$_t_TestExpires:=String:C10($_l_MonthNumber)+Substring:C12(String:C10($_l_YearNUM); 3; 2)
								
								$_t_TestTransID:=CCM_transaxsubmit($_t_TransactionType; CCM_t_AuthorizationLogin; "nelix123"; $_r_PaymentAmount; ""; CCM_t_FirstName; CCM_t_LastName; "4111111111111111"; $_t_TestExpires)
								
								
							Else 
								$_t_CardExpires:=Replace string:C233($_t_CardExpires; "/"; "")
								If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
									$_t_TransID:=CCM_transaxsubmit($_t_TransactionType; CCM_t_AuthorizationLogin; CCM_t_AuthorizationLogin; $_r_PaymentAmount; ""; CCM_t_FirstName; CCM_t_LastName; $CC_T_CCX99999999999; $_t_CardExpires; $_t_CVV2; $_t_EmailAddress; $_t_CompanyName; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_t_Town; CCM_t_County; CCM_t_PostalCode; CCM_t_Country)
									
								Else 
									$_t_TransID:=CCM_transaxsubmit($_t_TransactionType; CCM_t_AuthorizationLogin; CCM_t_AuthorizationLogin; $_r_PaymentAmount; ""; CCM_t_FirstName; CCM_t_LastName; $CC_T_CCX99999999999; $_t_CardExpires; $_t_CVV2; $_t_EmailAddress)
									
								End if 
							End if 
						Else 
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="transaxdemo") | (CCM_l_RunTest=1)
							Else 
								
								$_t_TransID:=CCM_transaxsubmit($_t_TransactionType; CCM_t_AuthorizationLogin; CCM_t_AuthorizationLogin; $_r_PaymentAmount; $_t_CCTransID)
							End if 
							
						End if 
					: (CCM_t_AuthorizationProvider="Authorize Net")
						If (CCM_t_ISOCurrencyCode="USD") | (True:C214)
							$_bo_InTest:=False:C215
							If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="92KgL2uD") | (CCM_l_RunTest=1)
								//use a dummy card number here
								$_bo_InTest:=True:C214
								If (Not:C34(CCM_bo_OfflineHandling))
									
									CCM_l_TransrecordID:=CCM_AN_Initiate
									
									Case of 
										: (CCM_t_AuthorizationLogin="92KgL2uD")
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; "4007000000027"; "x_exp_date"; $_t_CardExpires)
											
											
										Else 
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpires)
									End case 
								End if 
							Else 
								If (Not:C34(CCM_bo_OfflineHandling))
									CCM_l_TransrecordID:=CCM_AN_Initiate
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpires)
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
								If (Not:C34(CCM_bo_OfflineHandling))
									If (CCM_l_RunTest=1)
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_test_request"; "TRUE")
									End if 
								End if 
								
							End if 
							$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
							If ($_t_TransactionType#"PRIOR_AUTH_CAPTURE")  //only needed with auth capture and capture
								
								//if we did not do a prior auth
								If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  //no point in CVV2 on a test trans
									Repeat 
										$_t_CVV2:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
										
										If (Length:C16($_t_CVV2)#3)
											If (Length:C16($_t_CVV2)#4)
												Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
											End if 
										End if 
									Until (Length:C16($_t_CVV2)=3) | (Length:C16($_t_CVV2)=4)
									If (Not:C34(CCM_bo_OfflineHandling))
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_code"; $_t_CVV2)
										
									End if 
								End if 
								
							End if 
							//``
							If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
								If ($_bo_NGTestAVS)
									Gen_Alert("TEST+ AVS  Temp Disable is off so getting AVS (at line 566)")
								End if 
								If ($_bo_NGTestAVS)
									Gen_Alert("TEST+ AVS  CCM_bo_DisableAVSTEMP is off so getting AVS at line 580")
									
								End if 
								CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
								CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
								CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
								CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
								CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
								If (Not:C34(CCM_bo_OfflineHandling))
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_address"; CCM_t_AddressLine1)
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_city"; CCM_t_Town)
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_state"; CCM_t_County)
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_zip"; CCM_t_PostalCode)
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_country"; CCM_t_CountryISO)
									
								End if 
							End if 
							
							//``
							If (Not:C34(CCM_bo_OfflineHandling))
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_type"; $_t_TransactionType)
								
								If ($_t_CCAuthCode#"")
									If ($_t_TransactionType="CAPTURE_ONLY")
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_auth_code"; $_t_CCAuthCode)
									End if 
									
								End if 
								If ($_t_CCTransID#"")
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_trans_ID"; $_t_CCTransID)
								End if 
							End if 
							AA_LoadNameArrays
							CCM_T_xxxNameOnCard:=$_t_NameOnCard
							CCM_t_FirstName:=""
							CCM_t_LastName:=""
							CCM_t_Title:=""
							AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
							CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
							CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
							If (Not:C34(CCM_bo_OfflineHandling))
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_first_name"; CCM_t_FirstName)
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_last_name"; CCM_t_LastName)
							End if 
							If ($_l_ContactID>0)
								If ($_l_ContactID#[CONTACTS:1]x_ID:33)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
								End if 
								If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
									
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								End if 
								If ([CONTACTS:1]Email_Address:35#"")
									If (Length:C16([CONTACTS:1]Email_Address:35)>3)
										$_l_CharacterPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
										If ($_l_CharacterPosition>0)
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_email"; [CONTACTS:1]Email_Address:35)
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_email_customer"; "TRUE")
											End if 
										End if 
									End if 
								End if 
								
								If ([COMPANIES:2]Private:37=False:C215)
									If ([COMPANIES:2]Company_Name:2#"")
										$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_company"; $_t_CompanyName)
										End if 
									End if 
									
								End if 
							End if 
							If ($_t_InvoiceID#"")
								//we have an invoice number so we can check tax
								If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceID)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceID)
									
								End if 
								If (Not:C34(CCM_bo_OfflineHandling))
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_invoice_num"; $_t_InvoiceID)
								End if 
								If ([INVOICES:39]Total_Tax:35#0)
									$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
									If (Not:C34(CCM_bo_OfflineHandling))
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
										
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "FALSE")
										
										
									End if 
								Else 
									//no tax
									$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
									If (Not:C34(CCM_bo_OfflineHandling))
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "TRUE")
									End if 
								End if 
							Else 
								If ($_t_DepositID#"")  //entering a deposit payment
									If ([INVOICES:39]Invoice_Number:1#$_t_DepositID)
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositID)
										
									End if 
									If (Not:C34(CCM_bo_OfflineHandling))
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_invoice_num"; $_t_DepositID)
									End if 
									If ([INVOICES:39]Total_Tax:35#0)
										$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "FALSE")
										End if 
									Else 
										//no tax
										$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "TRUE")
											
										End if 
										
									End if 
								Else 
									//not an invoice or a deposit. is it an order
									If (CCM_l_OrderID>0)
										//this is an order
										If ([ORDERS:24]x_ID:58#CCM_l_OrderID)
											QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=CCM_l_OrderID)
										End if 
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_invoice_num"; [ORDERS:24]Order_Code:3)
											
										End if 
										If ([ORDERS:24]Total_TAX:7#0)
											$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
												
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "FALSE")
											End if 
										Else 
											//no tax
											$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_Tax"; $_t_TaxAmount)
												CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_taxExempt"; "TRUE")
											End if 
											
										End if 
										
										
									End if 
								End if 
							End if 
						Else 
							CCM_t_AuthorizationProvider:="Worldpay"
						End if 
						SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
						CCM_p_TransRecordRETPTR:=->CCM_Bl_TransResponse
					: (CCM_t_AuthorizationProvider="Paypal")
						
						$_t_TransactionType:=CCM_GetSendString(CCM_t_AuthorizationProvider; $_t_TransactionType)
						Case of 
							: ($_t_TransactionType="Sale")
								$_bo_InTest:=False:C215
								$_l_MonthExpires:=Num:C11($_t_MonthNumber)
								$_l_YearExpires:=Num:C11($_t_Year)
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
												CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($2); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; "4822963516524409 "; "ExpMonth"; "04"; "ExpYear"; "2017"; "CreditCardType"; "Visa")
											Else 
												CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($2); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; $CC_T_CCX99999999999; "ExpMonth"; $_t_MonthExpiresSTR; "ExpYear"; $_t_YearExpiresSTR; "CreditCardType"; $_t_CardType)
										End case 
										
									End if 
								Else 
									
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
										CCM_l_TransrecordID:=CCM_PP_Initiate
										CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($2); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; $CC_T_CCX99999999999; "ExpMonth"; $_t_MonthExpiresSTR; "ExpYear"; $_t_YearExpiresSTR; "CreditCardType"; $_t_CardType)
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
											CCM_PP_InsertData(CCM_l_TransrecordID; "TransactionPath"; "1")
										End if 
										
									End if 
									
								End if 
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "TransactionTYPE"; $_t_TransactionType)
									
								End if 
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "Password"; CCM_t_AuthorizationPass)
								End if 
								If ($_t_TransactionType#"PRIOR_AUTH_CAPTURE")  //this is not a paypal value its a hangover from AN..but it the functions
									If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  // no point in CVV2 on a test trans
										Repeat 
											$_t_CVV2:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
											If (Length:C16($_t_CVV2)#3)
												If (Length:C16($_t_CVV2)#4)
													Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
												End if 
											End if 
										Until (Length:C16($_t_CVV2)=3) | (Length:C16($_t_CVV2)=4)
										If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
											CCM_PP_InsertData(CCM_l_TransrecordID; "CVV2"; $_t_CVV2)
										End if 
									End if 
								End if 
								If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
									CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
									CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
									CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
									CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
									CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
									// $Temp2:=ERR_MethodTracker ("Send Street address")
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStreet1"; CCM_t_AddressLine1)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStreet2"; CCM_t_AddressLine2)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCityName"; CCM_t_Town)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStateOrProvince"; CCM_t_County)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerPostalCode"; CCM_t_PostalCode)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCountry"; CCM_t_CountryISO)
										CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCCCountry"; CCM_t_CountryISO)
									End if 
								End if 
								AA_LoadNameArrays
								CCM_T_xxxNameOnCard:=$_t_NameOnCard
								CCM_t_FirstName:=""
								CCM_t_LastName:=""
								CCM_t_Title:=""
								AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
								CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
								CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "Salutation"; CCM_t_Title)
								End if 
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "FirstName"; CCM_t_FirstName)
									CCM_PP_InsertData(CCM_l_TransrecordID; "PayerNameFirstName"; CCM_t_FirstName)
								End if 
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "LastName"; CCM_t_LastName)
									CCM_PP_InsertData(CCM_l_TransrecordID; "PayerNameLastName"; CCM_t_LastName)
								End if 
								If ($_l_ContactID>0)
									If ($_l_ContactID#[CONTACTS:1]x_ID:33)
										QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
									End if 
									If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
									End if 
									If ([CONTACTS:1]Email_Address:35#"")
										If (Length:C16([CONTACTS:1]Email_Address:35)>3)
											$_l_CharacterPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
											If ($_l_CharacterPosition>0)
												// $Temp2:=ERR_MethodTracker ("Send Email"+[CONTACTS]EmailAddress)
												If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
													CCM_PP_InsertData(CCM_l_TransrecordID; "Payer"; [CONTACTS:1]Email_Address:35)
													// CCM_PP_InsertData (CCM_l_TransrecordID;"x_email_customer";"TRUE")
													
												End if 
											End if 
										End if 
									End if 
									
									If ([COMPANIES:2]Private:37=False:C215)
										If ([COMPANIES:2]Company_Name:2#"")
											$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
											// $Temp2:=ERR_MethodTracker ("Send company name"+$_t_CompanyName)
											If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
												CCM_PP_InsertData(CCM_l_TransrecordID; "PayerBusiness"; $_t_CompanyName)
												
											End if 
										End if 
										
									End if 
								End if 
								//```TAX
								If (True:C214)
									If ($_t_InvoiceID#"")
										//we have an invoice number so we can check tax
										If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceID)
											QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceID)
											
										End if 
										If (Not:C34(CCM_bo_OfflineHandling))
											CCM_PP_InsertData(CCM_l_TransrecordID; "InvoiceID"; $_t_InvoiceID)
										End if 
										If ([INVOICES:39]Total_Tax:35#0)
											$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
												
												
												
												
											End if 
										Else 
											//no tax
											$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
												
											End if 
										End if 
									Else 
										If ($_t_DepositID#"")  //entering a deposit payment
											If ([INVOICES:39]Invoice_Number:1#$_t_DepositID)
												QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositID)
												
											End if 
											If (Not:C34(CCM_bo_OfflineHandling))
												CCM_PP_InsertData(CCM_l_TransrecordID; "InvoiceID"; $_t_DepositID)
											End if 
											If ([INVOICES:39]Total_Tax:35#0)
												$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
												If (Not:C34(CCM_bo_OfflineHandling))
													CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
													
												End if 
											Else 
												//no tax
												$_t_TaxAmount:=String:C10([INVOICES:39]Total_Tax:35; "####.##")
												If (Not:C34(CCM_bo_OfflineHandling))
													CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
													
													
												End if 
												
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
												If ([ORDERS:24]Total_TAX:7#0)
													$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
													If (Not:C34(CCM_bo_OfflineHandling))
														CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
														
														
													End if 
												Else 
													//no tax
													$_t_TaxAmount:=String:C10([ORDERS:24]Total_TAX:7; "####.##")
													If (Not:C34(CCM_bo_OfflineHandling))
														CCM_PP_InsertData(CCM_l_TransrecordID; "TaxTotal"; $_t_TaxAmount)
														
													End if 
													
												End if 
												
												
											End if 
										End if 
									End if 
								End if 
							: ($_t_TransactionType="Capture")  //capture an already authd amount
								$_bo_InTest:=False:C215
								$_l_MonthExpires:=Num:C11($_t_MonthNumber)
								$_l_YearExpires:=Num:C11($_t_Year)
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
												CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "AuthorizationID"; $_t_PPTransID; "CompleteType"; "Complete")
											Else 
												CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "AuthorizationID"; $_t_PPTransID; "CompleteType"; "Complete")
												
										End case 
										
									End if 
								Else 
									
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
										CCM_l_TransrecordID:=CCM_PP_Initiate
										CCM_PP_InsertData(CCM_l_TransrecordID; "Amount"; String:C10($_r_PaymentAmount); "AuthorizationID"; $_t_PPTransID; "CompleteType"; "Complete")
										
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
							: ($_t_TransactionType="Refund")  //Refund
								$_bo_InTest:=False:C215
								$_l_MonthExpires:=Num:C11($_t_MonthNumber)
								$_l_YearExpires:=Num:C11($_t_Year)
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
												If (Num:C11($_t_PPAmount)>$_r_PaymentAmount)
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
										If (Num:C11($_t_PPAmount)>$_r_PaymentAmount)
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
								
							: ($_t_TransactionType="Void")  //capture an already authd amount
								//``actually i dont think this is called here.
								
								
						End case 
						
						SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
						CCM_p_TransRecordRETPTR:=->CCM_Bl_TransResponse
						
						
						
				End case 
				
				If (Not:C34(CCM_bo_OfflineHandling))
					Case of 
						: (CCM_t_AuthorizationProvider="Transax")
							$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
							$_l_ResponseCode:=Num:C11(CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse))
							
						: (CCM_t_AuthorizationProvider="Authorize Net")
							$_t_oldMethodName2:=ERR_MethodTracker("Submitting Transaction to AN")
							
							$_l_ResponseCode:=CCM_AuthorizeNetSubmit(CCM_l_TransrecordID; ->CCM_Bl_TransResponse)
							$_t_oldMethodName2:=ERR_MethodTracker("Response Code="+String:C10($_l_ResponseCode))
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
				If ($_l_ResponseCode#-1) & ($_l_ResponseCode#10)
					$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
					//$_t_ExtractedResponseText:=BLOB to text(CCM_Bl_TransResponse;3)
					Case of 
						: (CCM_t_AuthorizationProvider="Transax")
							If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
								$_t_TRTransID:=CCM_ExtractField("Transax"; "TRANS_ID"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
							Else 
								AAofflineID:=0
								$_t_TRTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
							End if 
							$_bo_Reject:=False:C215
							If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))
								// ADDRESS VERIFICATION
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_AVSResult:=CCM_ExtractField("Transax"; "AVS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								Else 
									$_t_AVSResult:="X"
								End if 
								$_bo_NoError:=False:C215
								Case of 
									: ($_t_AVSResult="A")
										CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
										//$_bo_NoError:=True
									: ($_t_AVSResult="B")
										//CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
										//: ($_t_AVSResult="O")
										//CCM_t_AVSResult:="AVS error "
									: ($_t_AVSResult="G") | ($_t_AVSResult="I")
										CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
										$_bo_NoError:=True:C214
										
									: ($_t_AVSResult="N") | ($_t_AVSResult="C")
										CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
										
										
									: ($_t_AVSResult="O")
										CCM_t_AVSResult:="AVS not applicable for this transaction "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="R")
										CCM_t_AVSResult:="Retry – System unavailable or timed out "
										
									: ($_t_AVSResult="S")
										CCM_t_AVSResult:="Service not supported by issuer"
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="U")
										CCM_t_AVSResult:="Address information is unavailable "
									: ($_t_AVSResult="W")
										CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="X")
										CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Y")
										CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Z") | ($_t_AVSResult="P") | ($_t_AVSResult="L")
										CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
										$_bo_NoError:=True:C214
									Else 
										CCM_t_AVSResult:=$_t_AVSResult
								End case 
								If (Not:C34($_bo_NoError))
									Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+Char:C90(13)+"Retry without AVS?"; "Retry"; "Reject")
									If (OK=0)
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
										
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=False:C215
									Else 
										//reprosess with AVS off
										//``but first save the auth.
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										
										
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=True:C214
										//````
									End if 
								End if 
								
							End if 
							If (Not:C34($_bo_Reject))
								//``
								$_bo_NoCVSError:=True:C214
								If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										
										$_t_CV2Response:=CCM_ExtractField("Transax"; "CVV2_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
										
										
									Else 
										$_t_CV2Response:="M"
									End if 
									Case of 
										: ($_t_CV2Response="M")
											CCM_t_CV2Response:="Match"
											
										: ($_t_CV2Response="N")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="No Match"
										: ($_t_CV2Response="P")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Not Processed"
										: ($_t_CV2Response="S")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Should have been present"
										: ($_t_CV2Response="U")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Issuer unable to process"
										Else 
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Unknown response"
									End case 
								End if 
								//```
								If ($_bo_NoCVSError)
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
										$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Transax"; "STATUS_MSG"; "|"; $CCM_T_Response; 1; ->CCM_Bl_TransResponse)
									Else 
										$_t_ResponseCodeSTR:="1"
										$_t_ResponseReasonCodeSTR:=""
									End if 
									$_bo_Failed:=False:C215
									Case of 
										: ($_t_ResponseCodeSTR="1")  // card is accepted
											Gen_Message("Authorization obtained")
											$_bo_Failed:=False:C215
										: ($_t_ResponseCodeSTR="2")  // card is declined
											//If ($_t_ResponseReasonCodeSTR="27")
											Gen_Alert("Authorization DECLINED "+$_t_ResponseData)
											
											$_bo_Failed:=True:C214
											//End if
										: ($_t_ResponseCodeSTR="10")  //error in card handling
											Gen_Alert("An error occurred  "+$_t_ResponseData+" Authorization has not been obtained")
											$_bo_Failed:=True:C214
										: ($_t_ResponseCodeSTR="20")  //transaction being held for review
											Gen_Alert("Transaction being held"+$_t_ResponseData)
											$_bo_Failed:=True:C214
											
									End case 
									If (Not:C34(CCM_bo_OfflineHandling))
										$0:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; ->CCM_bl_SentData; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_TRTransID)
									Else 
										CREATE RECORD:C68([CCM_PSPTransaction:136])
										[CCM_PSPTransaction:136]PSPUSED:4:="Transax"
										[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
										[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseData
										[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
										[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
										[CCM_PSPTransaction:136]x_CCID:8:=$_l_CCID
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
										[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
										[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
										[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
										[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
										[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
										[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)  //new field added NG November 2009
										
										[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
										DB_SaveRecord(->[CCM_PSPTransaction:136])
										$0:=[CCM_PSPTransaction:136]x_ID:1
										UNLOAD RECORD:C212([CCM_PSPTransaction:136])
										READ ONLY:C145([CCM_PSPTransaction:136])
										
									End if 
									If ($_bo_Failed)
										CCM_l_RejectedID:=$0
										$0:=0
										
										CC_t_AuthCode:=""
									End if 
									If ($_t_ResponseCodeSTR="1")  // card is accepted
										CLOSE WINDOW:C154
									End if 
								Else 
									$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
									//$Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
									
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Transax"; "STATUS_MSG"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
									$_t_ResponseData:=$_t_ResponseReasonCodeSTR
									
									If (CCM_bo_CV2Retry)
										Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
										
										$_bo_Retry:=False:C215
									Else 
										Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
										$_bo_Retry:=(OK=1)
									End if 
									$0:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; ->CCM_bl_SentData; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_TRTransID)
									If ($_bo_Retry)
										$0:=-907
									Else 
										$0:=0
									End if 
									
								End if 
							Else 
								//still create the transactionrecord
								$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								
								$_t_ResponseData:="Rejected by user due to AVS problem"
								CCM_l_RejectedID:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; ->CCM_bl_SentData; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_TRTransID)
								If ($_bo_AVSReprocess)
									$0:=-909
								Else 
									$0:=-907
								End if 
								
							End if 
							
						: (CCM_t_AuthorizationProvider="Authorize Net")
							
							$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
							If (Not:C34(CCM_bo_OfflineHandling))
								$_t_ANTransID:=CCM_ExtractField("Authorize Net"; "Transaction ID"; $CCM_T_Response)
							Else 
								AAofflineID:=0
								$_t_ANTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
								
							End if 
							$_bo_Reject:=False:C215
							If (False:C215)
								$_l_UseAVS:=Num:C11(CCM_bo_useAVS)
								If ($_l_UseAVS=1)
									Gen_Alert("AVS IS ON")
								Else 
									Gen_Alert("AVS IS OFF")
								End if 
								$_l_inTest:=Num:C11($_bo_InTest)
								If ($_l_inTest=1)
									Gen_Alert("Is in TEST no AVS")
								End if 
								$_l_TempAVSOff:=Num:C11(CCM_bo_DisableAVSTEMP)
								If ($_l_TempAVSOff=1)
									Gen_Alert("Previous Fail causing  AVS To be disabled")
								End if 
								$_l_TempAVSOff:=Num:C11($CCM_bo_DisableAVSTEMP)
								If ($_l_TempAVSOff=1)
									Gen_Alert("Previous Fail ON THIS CARD causing  AVS To be disabled")
								End if 
							End if 
							
							If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))
								$_t_oldMethodName2:=ERR_MethodTracker("AVS was used")
								
								// ADDRESS VERIFICATION
								If (Not:C34(CCM_bo_OfflineHandling))
									$_t_AVSResult:=CCM_ExtractField("Authorize Net"; "AVS Result Code"; $CCM_T_Response)
								Else 
									$_t_AVSResult:="X"
								End if 
								$_t_oldMethodName2:=ERR_MethodTracker("AVS result was"+$_t_AVSResult)
								
								$_bo_NoError:=False:C215
								
								Case of 
									: ($_t_AVSResult="A")
										CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
										//$_bo_NoError:=True
									: ($_t_AVSResult="B")
										CCM_t_AVSResult:="Address information not provided for AVS check "
									: ($_t_AVSResult="E")
										CCM_t_AVSResult:="AVS error "
									: ($_t_AVSResult="G")
										CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
										
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="N")
										CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
										
										
									: ($_t_AVSResult="P")
										CCM_t_AVSResult:="AVS not applicable for this transaction "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="R")
										CCM_t_AVSResult:="Retry – System unavailable or timed out "
										
									: ($_t_AVSResult="S")
										CCM_t_AVSResult:="Service not supported by issuer"
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="U")
										CCM_t_AVSResult:="Address information is unavailable "
									: ($_t_AVSResult="W")
										CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="X")
										CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Y")
										CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Z")
										CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
										$_bo_NoError:=True:C214
									Else 
										CCM_t_AVSResult:=$_t_AVSResult
								End case 
								If (Not:C34($_bo_NoError))
									Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+Char:C90(13)+"Retry without AVS?"; "Retry"; "Reject")
									If (OK=0)
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
										
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=False:C215
									Else 
										//reprosess with AVS off
										//``but first save the auth.
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										
										
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=True:C214
										//````
									End if 
								End if 
								
							End if 
							If (Not:C34($_bo_Reject))
								//``
								$_bo_NoCVSError:=True:C214
								If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
									If (Not:C34(CCM_bo_OfflineHandling))
										$_t_CV2Response:=CCM_ExtractField("Authorize Net"; "CVV2 Response Code"; $CCM_T_Response)
									Else 
										$_t_CV2Response:="M"
									End if 
									Case of 
										: ($_t_CV2Response="M")
											CCM_t_CV2Response:="Match"
											
										: ($_t_CV2Response="N")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="No Match"
										: ($_t_CV2Response="O")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Not Processed"
										: ($_t_CV2Response="S")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Should have been present"
										: ($_t_CV2Response="U")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Issuer unable to process"
										Else 
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Unknown response"
									End case 
								End if 
								//```
								If ($_bo_NoCVSError)
									If (Not:C34(CCM_bo_OfflineHandling))
										$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
										$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
										
										$_t_ResponseData:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
									Else 
										$_t_ResponseCodeSTR:="1"
										$_t_ResponseReasonCodeSTR:=""
										$_t_ResponseData:=""
									End if 
									$_bo_Failed:=False:C215
									Case of 
										: ($_t_ResponseCodeSTR="1")  // card is accepted
											$_t_oldMethodName2:=ERR_MethodTracker("Authorization obtained")
											
											
											Gen_Message("Authorization obtained")
											$_bo_Failed:=False:C215
										: ($_t_ResponseCodeSTR="2")  // card is declined
											$_t_oldMethodName2:=ERR_MethodTracker("Authorization DECLINED "+$_t_ResponseData)
											
											//If ($_t_ResponseReasonCodeSTR#"27")
											Gen_Alert("Authorization DECLINED "+$_t_ResponseData)
											$_bo_Failed:=True:C214
											//End if
										: ($_t_ResponseCodeSTR="3")  //error in card handling
											$_t_oldMethodName2:=ERR_MethodTracker("An error occurred "+$_t_ResponseData+" Authorization has not been obtained")
											
											Gen_Alert("An error occurred "+$_t_ResponseData+" Authorization has not been obtained")
											$_bo_Failed:=True:C214
										: ($_t_ResponseCodeSTR="4")  //transaction being held for review
											$_t_oldMethodName2:=ERR_MethodTracker("Transaction being held"+$_t_ResponseData)
											
											Gen_Alert("Transaction being held"+$_t_ResponseData)
											$_bo_Failed:=True:C214
										: ($_t_ResponseCodeSTR="-1")
											$_t_oldMethodName2:=ERR_MethodTracker("An error occurred the Gateway could not be contacted")
											
											Gen_Alert("An error occurred the Gateway could not be contacted")
											$_bo_Failed:=True:C214
										Else 
											$_t_oldMethodName2:=ERR_MethodTracker($_t_ResponseCodeSTR+"UNKNOWN!")
											
											
									End case 
									If (Not:C34(CCM_bo_OfflineHandling))
										$0:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
									Else 
										CREATE RECORD:C68([CCM_PSPTransaction:136])
										[CCM_PSPTransaction:136]PSPUSED:4:="Authorize Net"
										[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
										[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseData
										[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
										[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
										[CCM_PSPTransaction:136]x_CCID:8:=$_l_CCID
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
										[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
										[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
										[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
										[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
										[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
										[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)  //new field added NG November 2009
										
										[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
										DB_SaveRecord(->[CCM_PSPTransaction:136])
										$0:=[CCM_PSPTransaction:136]x_ID:1
										UNLOAD RECORD:C212([CCM_PSPTransaction:136])
										READ ONLY:C145([CCM_PSPTransaction:136])
										
									End if 
									If ($_bo_Failed)
										CCM_l_RejectedID:=$0
										$0:=0
										
										CC_t_AuthCode:=""
									End if 
									If ($_t_ResponseCodeSTR="1")  // card is accepted
										CLOSE WINDOW:C154
									End if 
								Else 
									$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
									$_t_ResponseData:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
									
									If (CCM_bo_CV2Retry)
										Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
										
										$_bo_Retry:=False:C215
									Else 
										Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
										$_bo_Retry:=(OK=1)
									End if 
									$0:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; "AUTH_ONLY"; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
									If ($_bo_Retry)
										$0:=-907
									Else 
										$0:=0
									End if 
									
								End if 
							Else 
								//still create the transactionrecord
								$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
								$_t_ResponseData:="Rejected by user due to AVS problem"
								CCM_l_RejectedID:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; "AUTH_ONLY"; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
								If ($_bo_AVSReprocess)
									$0:=-909
									$_t_oldMethodName2:=ERR_MethodTracker("-909")
									
								Else 
									$0:=-907
									$_t_oldMethodName2:=ERR_MethodTracker("-907")
									
								End if 
								
							End if 
							
						: (CCM_t_AuthorizationProvider="Paypal")
							//TRACE
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $CCM_T_Response; $_t_ModuleUsed)
								//The Do Direct response has the following 'fields'
								//Transaction ID
								//Amount
								//AVSCode
								//CVV2Code
								//FMFDetails<=fraudFilter
								//PaymentAdviceCode<-only on recurring
								// CCM_PP_InsertData ($INDEX;"Username";CCM_t_AuthorizationLogin;"Password";CCM_t_AuthorizationLogin)
								//TRACE
								//DelayTicks (60*10)  //this is crude
								$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
								$_t_TransactionDetails:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
								//GetTransactionResponse"
								//The transactionDetailsRespons has
								//ShippingCalculationMode
								//InsuranceOptionSelected
							Else 
								AAofflineID:=0
								$_t_PPTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
							End if 
							
							//
							$_bo_Reject:=False:C215
							If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($CCM_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_AVSResult:=CCM_ExtractField("Paypal"; "AVSCode"; $CCM_T_Response; $_t_ModuleUsed)
								Else 
									$_t_AVSResult:="X"
								End if 
								$_bo_NoError:=False:C215
								Case of 
									: ($_t_AVSResult="A")
										CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
										// $_bo_NoError:=True
									: ($_t_AVSResult="B")
										CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
									: ($_t_AVSResult="C")
										CCM_t_AVSResult:="No "
									: ($_t_AVSResult="D")
										CCM_t_AVSResult:="Exact match"
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="E")
										CCM_t_AVSResult:="Not allowed for MOTO"
									: ($_t_AVSResult="F")
										CCM_t_AVSResult:="UK Address (Street) and 9 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="G")
										CCM_t_AVSResult:="(global)Non-U.S. Card Issuing Bank "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="I")
										CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="M")
										CCM_t_AVSResult:="Address "
										
									: ($_t_AVSResult="N")
										CCM_t_AVSResult:="No "
										
									: ($_t_AVSResult="P")
										CCM_t_AVSResult:="Postal "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="R")
										CCM_t_AVSResult:="Retry – System unavailable or timed out "
										
									: ($_t_AVSResult="S")
										CCM_t_AVSResult:="Service not supported by issuer"
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="U")
										CCM_t_AVSResult:="Address information is unavailable "
									: ($_t_AVSResult="W")
										CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="X")
										CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Y")
										CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
										$_bo_NoError:=True:C214
									: ($_t_AVSResult="Z")
										CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
										$_bo_NoError:=True:C214
									Else 
										CCM_t_AVSResult:=$_t_AVSResult
								End case 
								If (Not:C34($_bo_NoError))
									Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+"Do you wish to process this without AVS?"; "Process"; "Reject")
									If (OK=0)
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=False:C215
									Else 
										READ WRITE:C146([xCreditCardDetails:132])
										If ([xCreditCardDetails:132]x_ID:1#$_l_CCID)
											QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										Else 
											LOAD RECORD:C52([xCreditCardDetails:132])
											
										End if 
										[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
										DB_SaveRecord(->[xCreditCardDetails:132])
										UNLOAD RECORD:C212([xCreditCardDetails:132])
										READ ONLY:C145([xCreditCardDetails:132])
										LOAD RECORD:C52([xCreditCardDetails:132])
										$_bo_Reject:=True:C214
										$_bo_AVSReprocess:=True:C214
									End if 
								End if 
							End if 
							
							If (Not:C34($_bo_Reject))
								$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
								//Gen_Alert ($_t_ResponseCodeSTR)
								
								If ($_t_ResponseCodeSTR="Pending")
									$_l_Retries:=0
									$_bo_GIveUp:=False:C215
									Repeat 
										$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
										$_t_TransactionDetails:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
										$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
										If ($_t_ResponseCodeSTR="Pending")
											DelayTicks(10*60)
											$_l_Retries:=$_l_Retries+1
											If ($_l_Retries>2)
												Gen_Confirm("The Transaction with Paypal is still showing as pending. There may be a problem with the payment or your account may be set to require a manual payment review?"; "Yes"; "Give up")
												If (OK=0)
													$_bo_GIveUp:=True:C214
												End if 
												OK:=1
											End if 
										End if 
										
									Until ($_t_ResponseCodeSTR#"Pending") | ($_bo_GIveUp)
								End if 
								
								// NG PAYPAL IMPORTANT-HERE  call GetTransactionDetails to get the transaction response<=not actually sure i am correct now
								//   actually it is where the payment status are.``
								$_bo_NoCVSError:=True:C214
								If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										$_t_CV2Response:=CCM_ExtractField("Paypal"; "CVV2Code"; $CCM_T_Response; $_t_ModuleUsed)
									Else 
										$_t_CV2Response:="M"
									End if 
									
									Case of 
										: ($_t_CV2Response="M")
											CCM_t_CV2Response:="Match"
											
										: ($_t_CV2Response="N")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="No Match"
										: ($_t_CV2Response="P")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Not Processed"
										: ($_t_CV2Response="S")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Service not supported"
										: ($_t_CV2Response="U")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Issuer unable to process"
										: ($_t_CV2Response="X")
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="No Response"
										Else 
											$_bo_NoCVSError:=False:C215
											CCM_t_CV2Response:="Unknown response"
									End case 
								End if 
								//   ```
								If ($_bo_NoCVSError)
									
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "Transaction")
									Else 
										$_t_ResponseCodeSTR:="Completed"
									End if 
									//Response code pending means it was authorized and pending reason should
									// $Temp2:=ERR_MethodTracker ("Response"+$_t_ResponseCodeSTR)
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										
										$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TransactionDetails; "Transaction")
									Else 
										$_t_ResponseReasonCodeSTR:=""
									End if 
									// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										
										$_t_ResponseData:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "Transaction")
									Else 
										$_t_ResponseData:="Note- this is an immitation transaction"
									End if 
									$_bo_Failed:=False:C215
									Case of 
										: (($_t_ResponseCodeSTR="Processed") | ($_t_ResponseCodeSTR="Completed")) & ($_t_ResponseReasonCodeSTR="None")  // card is accepted
											Gen_Message("Payment Approved")
											$_bo_Failed:=False:C215
										Else 
											
											
											Case of 
												: ($_t_ResponseCodeSTR="2")  // card is declined
													// If ($_t_ResponseReasonCodeSTR="27")
													Gen_Alert("Authorization DECLINED "+$_t_ResponseData)
													
													$_bo_Failed:=True:C214
													// End if
												: ($_t_ResponseCodeSTR="3")  // error in card handling
													Gen_Alert("An error occurred  "+$_t_ResponseData+" Authorization has not been obtained")
													$_bo_Failed:=True:C214
												: ($_t_ResponseCodeSTR="4")  // transaction being held for review
													Gen_Alert("Transaction being held"+$_t_ResponseData)
													$_bo_Failed:=True:C214
												: ($_t_ResponseCodeSTR="-1")
													Gen_Alert("An error occurred  the Gateway could not be contacted")
													$_bo_Failed:=True:C214
											End case 
											
									End case 
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										$0:=0
										//TRACE
										//Here we need to conjoin the $_t_TransactionDetails onto $CCM_T_Response and replace CCM_Bl_TransRecord with the contantanacted text
										$_t_CCMText:=$_t_ModuleUsed+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
										SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
										TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
										
										
										$0:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
										If (CCM_bo_DisableAVSTEMP)
											// Gen_Alert ("The created CCM record for the approved transaction is "+String($0))
										End if 
									Else 
										CREATE RECORD:C68([CCM_PSPTransaction:136])
										[CCM_PSPTransaction:136]PSPUSED:4:="Paypal"
										[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
										[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseData
										[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
										[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$_t_TransactionType
										[CCM_PSPTransaction:136]x_CCID:8:=$_l_CCID
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CCID)
										[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
										[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
										[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
										[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
										[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
										[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
										[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
										[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
										DB_SaveRecord(->[CCM_PSPTransaction:136])
										$0:=[CCM_PSPTransaction:136]x_ID:1
										UNLOAD RECORD:C212([CCM_PSPTransaction:136])
										READ ONLY:C145([CCM_PSPTransaction:136])
										
									End if 
									// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
									
									If ($_bo_Failed)
										
										$0:=0
										CC_t_AuthCode:=""
									End if 
									
									If ($_t_ResponseCodeSTR="Processed")  // card is accepted-showed  message now close it
										CLOSE WINDOW:C154
									End if 
									
								Else 
									
									$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
									// $Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
									
									$_t_ResponseData:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "TRANSACTION")
									// $Temp2:=ERR_MethodTracker ("Response Code Reason"+$_t_ResponseData)
									
									If (CCM_bo_CV2Retry)
										Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
										
										$_bo_Retry:=False:C215
									Else 
										Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
										$_bo_Retry:=(OK=1)
									End if 
									//TRACE
									$_t_CCMText:=$_t_ModuleUsed+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
									SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
									TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
									
									
									$0:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
									
									
									If ($_bo_Retry)
										$0:=-907
										
									Else 
										
										$0:=0
										
									End if 
									
								End if 
							Else 
								$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
								
								
								If ($_t_ResponseCodeSTR="Pending")
									$_l_Retries:=0
									$_bo_GIveUp:=False:C215
									Repeat 
										$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
										$_t_TransactionDetails:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
										$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
										If ($_t_ResponseCodeSTR="Pending")
											DelayTicks(10*60)
											$_l_Retries:=$_l_Retries+1
											If ($_l_Retries>2)
												Gen_Confirm("The Transaction with Paypal is still showing as pending. Do you wish to wait till the paypal transaction is completed?"; "Yes"; "Give up")
												If (OK=0)
													$_bo_GIveUp:=True:C214
												End if 
												OK:=1
											End if 
										End if 
										
									Until ($_t_ResponseCodeSTR#"Pending") | ($_bo_GIveUp)
								End if 
								
								$_t_ResponseData:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "TRANSACTION")
								$_t_ResponseData:="Rejected by user due to AVS problem"
								//TRACE
								$_t_CCMText:=$_t_ModuleUsed+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
								SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
								TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
								
								CCM_l_RejectedID:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseData; $_t_TransactionType; $_l_CCID; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
								CCM_t_FAILCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
								
								// $Temp2:=ERR_MethodTracker ("Reject DB transrecordID"+String(CCM_l_RejectedID))
								// NG 22/9/06 Another change..despite the previous change--in which i was told that an AVS failure on an auth was not a decline
								// it is a decline--so i have changed again to reject the transaction
								// NG 5/4/2006. Changed the process again.. do not reprosses an auth because of AVS fail.
								// there is a change to the process getting money so that if the auth had an AVS fa(after warning)
								// will not use the avs
								// if we are here we are rejecting....(but will still save the auth code)..that cannot be use subsequently
								If ($_bo_AVSReprocess)
									$0:=-909
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								Else 
									$0:=-907
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								End if 
							End if 
					End case 
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("The Transaction could not be created")
					
					
					Gen_Alert("The Transaction could not be created")
					$0:=0
				End if 
				
			End if 
			
			//Get the card and get the money
			//Create a record with it
		Else 
			$0:=0
		End if 
	Else 
		$0:=0
	End if 
Else 
	$0:=0
End if 
CCM_bo_DisableAVSTEMP:=False:C215  // always turn it off here
ERR_MethodTrackerReturn("CCM_ProcessCard"; $_t_oldMethodName)