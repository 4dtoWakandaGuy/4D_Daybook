//%attributes = {"publishedSoap":true,"publishedWsdl":true}
If (False:C215)
	//Project Method Name:      SSI_FunctionGetCardAuth
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/06/2012 00:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isOK; $4; CCM_bo_OfflineHandling; CCM_bo_PaymentTaken)
	C_LONGINT:C283($_l_CardID; $_l_CharacterPosition; $1; CC_l_AuthTransID; CCM_l_cardIDtoAuthtoAuth; CCM_l_CCAuditID; CCM_l_CurrentOwnerID)
	C_REAL:C285($3; CCM_R_AuthAmount)
	C_TEXT:C284($_t_CCMRequestModule; $_t_CCMResponse; $_t_CCMResponseText; $_t_oldMethodName; $_t_TransactionDetails; $2; $5; $6; CC_t_AuthCode; CCM_t_AuthorizationProvider; CCM_t_CurrencyCode)
	C_TEXT:C284(CCT_CardResponse)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_FunctionGetCardAuth")

//This method will handle a call to the CC AUTH functionality
//The inputs to this method are
//1) The Credit Card ID..a Valid Daybook Card ID if unknown send the Credit card data in $4
//2) The currency`3) The Amount to authorize
//4) Boolean(True to take the funds. False to just get auth code)
//5 prior auth code(if getting funds from a previous auth)
//`6)  The Credit card details if the card ID=0)

SOAP DECLARATION:C782($1; Is longint:K8:6; SOAP input:K46:1; "DBCardID")
SOAP DECLARATION:C782($2; Is text:K8:3; SOAP input:K46:1; "ISOCurrencyCode")
SOAP DECLARATION:C782($3; Is real:K8:4; SOAP input:K46:1; "AuthAmount")
SOAP DECLARATION:C782($4; Is boolean:K8:9; SOAP input:K46:1; "TakeFunds")
SOAP DECLARATION:C782($5; Is text:K8:3; SOAP input:K46:1; "PriorAuthCode")
SOAP DECLARATION:C782($6; Is text:K8:3; SOAP input:K46:1; "CreditCardDataXML")

SOAP DECLARATION:C782(CC_t_AuthCode; Is text:K8:3; SOAP output:K46:2; "AuthCode")
SOAP DECLARATION:C782(CCT_CardResponse; Is text:K8:3; SOAP output:K46:2; "ResponseString")
SOAP DECLARATION:C782(CCM_l_cardIDtoAuthtoAuth; Is longint:K8:6; SOAP output:K46:2; "CardID")
If (Count parameters:C259>=4)
	If ($1=0)
		If (Count parameters:C259<6)
			SSI_SoapFault(1; 2; "SSI_FunctionGetCardAuth"; "6")
		Else 
			//The Card data is stored in the 6th parameter.
			//create the card record(have to use the config)
			$_l_CardID:=0
		End if 
	Else 
		$_l_CardID:=$1
	End if 
	QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_l_CardID)
	If (Records in selection:C76([xCreditCardDetails:132])>0)
		//``Here populate the variables
		CCM_R_AuthAmount:=$3
		CCM_t_CurrencyCode:=$2
		If ($4)  // Get money
			If ($5#"")  // prior auth
				CC_t_AuthCode:=$5
				CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuthtoAuth; CC_t_AuthCode)
				If (CCM_l_CCAuditID>0)
					
					$_bo_isOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
					If ($_bo_isOK)
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
						If (CC_t_AuthCode#"")
							OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
							CCM_bo_PaymentTaken:=True:C214
							READ WRITE:C146([CCM_PSPTransaction:136])
							QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
							[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
							[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
							DB_SaveRecord(->[CCM_PSPTransaction:136])
							
						End if 
					End if 
					
				End if 
				
			Else 
				CCM_l_CCAuditID:=CCM_ProcessCard(CCM_t_CurrencyCode; CCM_R_AuthAmount; 0; Table:C252(->[CONTACTS:1]); CCM_l_CurrentOwnerID; CCM_l_cardIDtoAuthtoAuth)
				If (CCM_l_CCAuditID>0)
					CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CC_l_AuthTransID)
					If (CC_t_AuthCode#"")
						OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
						CCM_bo_PaymentTaken:=True:C214
						READ WRITE:C146([CCM_PSPTransaction:136])
						QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
						[CCM_PSPTransaction:136]xDepositCode:12:=[INVOICES:39]Invoice_Number:1
						[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
						
						
					End if 
				End if 
				
			End if 
			//And create a deposit!
			
		Else 
			//``````The following code is derived from the auth screen.as called on the card processing screen
			If (CCM_R_AuthAmount>0)
				CC_l_AuthTransID:=CCMGetAuth(CCM_R_AuthAmount; CCM_t_CurrencyCode; CCM_l_cardIDtoAuthtoAuth; CCM_l_CurrentOwnerID)
				If (CC_l_AuthTransID>0)
					$_bo_isOK:=CCM_GetResponseValidFromTrans(CC_l_AuthTransID)
					If ($_bo_isOK)
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CC_l_AuthTransID)
						If (CC_t_AuthCode#"")
							Case of 
								: (CCM_t_AuthorizationProvider="Authorize Net")
									If ([CCM_PSPTransaction:136]x_ID:1#$1)
										QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$1)
									End if 
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										
										$_t_CCMResponse:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
										CCT_CardResponse:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $_t_CCMResponse)
									Else 
										CCT_CardResponse:=""
									End if 
								: (CCM_t_AuthorizationProvider="Paypal")
									If ([CCM_PSPTransaction:136]x_ID:1#$1)
										QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$1)
									End if 
									If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
										$_l_CharacterPosition:=Position:C15("END REQUEST TYPE"; $_t_CCMResponse)
										$_t_CCMRequestModule:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
										$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST TYPE"))
										$_l_CharacterPosition:=Position:C15("END REQUEST RESPONSE"; $_t_CCMResponse)
										$_t_CCMResponseText:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
										$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST RESPONSE"))
										$_l_CharacterPosition:=Position:C15("END TRANSACTION DETAILS"; $_t_CCMResponse)
										$_t_TransactionDetails:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
										CCT_CardResponse:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TransactionDetails; "TRANSACTION")
										
										
									Else 
										CCT_CardResponse:=""
									End if 
									
							End case 
						End if 
					Else 
						
						CC_t_AuthCode:=""
						Case of 
							: (CCM_t_AuthorizationProvider="Authorize Net")
								
								If ([CCM_PSPTransaction:136]x_ID:1#$1)
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$1)
								End if 
								$_t_CCMResponse:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
								CCT_CardResponse:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $_t_CCMResponse)
							: (CCM_t_AuthorizationProvider="Paypal")
								If ([CCM_PSPTransaction:136]x_ID:1#$1)
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$1)
								End if 
								If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
									$_t_CCMResponse:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
									$_l_CharacterPosition:=Position:C15("END REQUEST TYPE"; $_t_CCMResponse)
									$_t_CCMRequestModule:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
									$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST TYPE"))
									$_l_CharacterPosition:=Position:C15("END REQUEST RESPONSE"; $_t_CCMResponse)
									$_t_CCMResponseText:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
									$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST RESPONSE"))
									$_l_CharacterPosition:=Position:C15("END TRANSACTION DETAILS"; $_t_CCMResponse)
									$_t_TransactionDetails:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
									CCT_CardResponse:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TransactionDetails; "TRANSACTION")
									
									
								Else 
									CCT_CardResponse:=""
								End if 
								
								
						End case 
						
						//send the string
					End if 
					
				End if 
				
			Else 
				SSI_SoapFault(1; 4; "SSI_FunctionGetCardAuth"; "You must enter an amount to authorize!")
				
				
			End if 
			
			
			
			
			
			//```
		End if 
		
	Else 
		SSI_SoapFault(1; 3; "SSI_FunctionGetCardAuth"; "Credit Card")
	End if 
	
Else 
	SSI_SoapFault(1; 1; "SSI_FunctionGetCardAuth")
	
	
End if 
ERR_MethodTrackerReturn("SSI_FunctionGetCardAuth"; $_t_oldMethodName)
