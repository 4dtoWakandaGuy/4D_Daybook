//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_transaxsubmit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2009 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(https)
	C_BLOB:C604(CCM_bl_SentData; CCM_Bl_TransResponse)
	C_REAL:C285($4)
	C_TEXT:C284($_t_AddressLine1; $_t_AddressLine2; $_t_AmountSTR; $_t_AuthCode; $_t_AVSCode; $_t_AVSMSG; $_t_CCExpire; $_t_CCNumber; $_t_City; $_t_Company; $_t_Country)
	C_TEXT:C284($_t_CustomerVaultAction; $_t_CustomerVaultID; $_t_CVV2; $_t_CVV2Code; $_t_CVV2MSG; $_t_Email; $_t_ErrorInfo; $_t_FirstName; $_t_LastName; $_t_oldMethodName; $_t_OrderID)
	C_TEXT:C284($_t_PaymentType; $_t_PONumber; $_t_PrevTransID; $_t_Result; $_t_ResultXML; $_t_State; $_t_StatusCode; $_t_StatusMsg; $_t_TransactionType; $_t_TransaxString; $_t_TransID)
	C_TEXT:C284($_t_USERiD; $_t_UserName; $_t_XMLChild_Ref; $_t_XMLElement_Value; $_t_XMLParent_Ref; $_t_XMLValue; $_t_ZIP; $0; $1; $10; $11)
	C_TEXT:C284($12; $13; $14; $15; $16; $17; $18; $2; $3; $5; $6)
	C_TEXT:C284($7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_transaxsubmit")

//$1=Transactiontype(String)
//$2=User name
//$3=password
//$4=amount
//$5=previous transactionID or  "" is none
//$6=First name
//$7=last name
//$8=Credit card number
//$9=Expiry date
//$10=CVV2
//Optional Parameters
//$11 address line1
//$12 address line2

//$??(99)=PreviousTranactionID
//$??(100)=previous transaction type(string)
//$??(96)=order number
//$??(97)=tracking number
//$??(98)=shipper
//TRACE

If (Count parameters:C259>=5)
	$_t_TransactionType:=$1
	$_t_UserName:=$2
	$_t_USERiD:=$3
	$_t_PrevTransID:=$5
	$_t_FirstName:=""
	$_t_LastName:=""
	$_t_AmountSTR:=""
	$_t_CCNumber:=""
	$_t_CCExpire:=""
	
	$_t_Company:=""
	$_t_AddressLine1:=""
	$_t_AddressLine2:="'"
	$_t_City:=""
	$_t_State:=""
	$_t_ZIP:=""
	$_t_Country:=""
	$_t_Email:=""
	
	If (Count parameters:C259>=9)
		$_t_FirstName:=$6
		$_t_LastName:=$7
		$_t_AmountSTR:=String:C10($4)
		$_t_CCNumber:=$8
		$_t_CVV2:=""
		$_t_CCExpire:=$9
		If (Count parameters:C259>9)
			$_t_CVV2:=$10
			If (Count parameters:C259>=11)
				$_t_Email:=$11
				
				If (Count parameters:C259>=12)
					$_t_Company:=$12
					If (Count parameters:C259>=13)
						$_t_AddressLine1:=$13
						If (Count parameters:C259>=14)
							$_t_AddressLine2:=$14
							If (Count parameters:C259>=15)
								$_t_City:=$15
								If (Count parameters:C259>=16)
									$_t_State:=$16
									If (Count parameters:C259>=17)
										$_t_ZIP:=$17
										If (Count parameters:C259>=18)
											$_t_Country:=$18
											
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	$_t_PaymentType:="creditcard"  //i am checking (pun) if this means debit and credit cards or whether debit cards are 'check'
	$_t_CustomerVaultAction:=""
	$_t_CustomerVaultID:="'"
	$_t_OrderID:=""
	$_t_PONumber:=""
	
	$_t_TransaxString:="<ProcessTransaction xmlns=\"https://www.nelixtransax.com/roxapi/\">"+Char:C90(13)
	$_t_TransaxString:=$_t_TransaxString+"<objparameters>"+Char:C90(13)
	
	$_t_TransaxString:=$_t_TransaxString+"<TransactionType>"+$_t_TransactionType+"</TransactionType>"+Char:C90(13)
	$_t_TransaxString:=$_t_TransaxString+"<GatewayUserName>"+$_t_UserName+"</GatewayUserName>"+Char:C90(13)
	$_t_TransaxString:=$_t_TransaxString+"<GatewayPassword>"+$_t_USERiD+"</GatewayPassword>"+Char:C90(13)
	
	//$_t_TransaxString:=$_t_TransaxString+"<Merchant_Defined_Field_1>"+merchantdefined1+"</Merchant_Defined_Field_1>"+Char(13)
	//$_t_TransaxString:=$_t_TransaxString+"<Merchant_Defined_Field_2>"+merchantdefined2+"</Merchant_Defined_Field_2>"+Char(13)
	
	Case of 
		: ($_t_TransactionType="void")
			$_t_TransaxString:=$_t_TransaxString+"<TransactionID>"+$_t_PrevTransID+"</TransactionID>"+Char:C90(13)
			//If (paymenttype="check")
			//$_t_TransaxString:=$_t_TransaxString+"<PaymentType>"+paymenttype+"</PaymentType>"+Char(13)
			//End if
		: ($_t_TransactionType="refund")
			$_t_TransaxString:=$_t_TransaxString+"<Amount>"+$_t_AmountSTR+"</Amount>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<TransactionID>"+$_t_PrevTransID+"</TransactionID>"+Char:C90(13)
			//If (paymenttype="check")
			//$_t_TransaxString:=$_t_TransaxString+"<PaymentType>"+paymenttype+"</PaymentType>"+Char(13)
			//End if
		: ($_t_TransactionType="capture")
			$_t_TransaxString:=$_t_TransaxString+"<Amount>"+$_t_AmountSTR+"</Amount>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<TransactionID>"+$_t_PrevTransID+"</TransactionID>"+Char:C90(13)
			//$_t_TransaxString:=$_t_TransaxString+"<OrderID>"+orderid+"</OrderID>"+Char(13)
			//$_t_TransaxString:=$_t_TransaxString+"<Tracking_Number>"+tracking_number+"</Tracking_Number>"+Char(13)
			//$_t_TransaxString:=$_t_TransaxString+"<Shipping_Carrier>"+shipping_carrier+"</Shipping_Carrier>"+Char(13)
			//If (paymenttype="check")
			//$_t_TransaxString:=$_t_TransaxString+"<PaymentType>"+paymenttype+"</PaymentType>"+Char(13)
			//End if
		: ($_t_TransactionType="update")
			$_t_TransaxString:=$_t_TransaxString+"<TransactionID>"+$_t_PrevTransID+"</TransactionID>"+Char:C90(13)
			//$_t_TransaxString:=$_t_TransaxString+"<Tracking_Number>"+tracking_number+"</Tracking_Number>"+Char(13)
			//$_t_TransaxString:=$_t_TransaxString+"<Shipping_Carrier>"+shipping_carrier+"</Shipping_Carrier>"+Char(13)
			//If (paymenttype="check")
			//$_t_TransaxString:=$_t_TransaxString+"<PaymentType>"+paymenttype+"</PaymentType>"+Char(13)
			//End if
	End case 
	
	//If (customer_vault_action="delete_customer")
	//$_t_TransaxString:=$_t_TransaxString+"<Customer_Vault_Action>"+customer_vault_action+"</Customer_Vault_Action.SelectedValue"+Char(13)
	//$_t_TransaxString:=$_t_TransaxString+"<Customer_Vault_ID>"+customer_vault_id+"</Customer_Vault_ID>"+Char(13)
	//End if
	
	If ($_t_TransactionType="sale") | ($_t_TransactionType="auth") | ($_t_CustomerVaultAction="add_customer") | ($_t_CustomerVaultAction="update_customer")
		$_t_TransaxString:=$_t_TransaxString+"<PaymentType>"+$_t_PaymentType+"</PaymentType>"+Char:C90(13)
		
		If ($_t_CustomerVaultAction="add_customer") | ($_t_CustomerVaultAction="update_customer")
			$_t_TransaxString:=$_t_TransaxString+"<Customer_Vault_Action>"+$_t_CustomerVaultAction+"</Customer_Vault_Action>"+Char:C90(13)
		End if 
		//$_t_TransaxString:=$_t_TransaxString+"<Customer_Vault_ID>"+$_t_CustomerVaultID+"</Customer_Vault_ID>"+Char(13)
		
		If ($_t_PaymentType="creditcard")
			$_t_TransaxString:=$_t_TransaxString+"<CCNumber>"+$_t_CCNumber+"</CCNumber>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<CCExpDate>"+$_t_CCExpire+"</CCExpDate>"+Char:C90(13)
			If ($_t_CVV2#"")
				$_t_TransaxString:=$_t_TransaxString+"<CVV>"+$_t_CVV2+"</CVV>"+Char:C90(13)
			End if 
		End if 
		//If (paymenttype="check")
		//$_t_TransaxString:=$_t_TransaxString+"<CheckName>"+checkname+"</CheckName>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<CheckABA>"+routing+"</CheckABA>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<CheckAccount>"+account+"</CheckAccount>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<AccountHolderType>"+accountholdertype+"</AccountHolderType>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<AccountType>"+accounttype+"</AccountType>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<SecCode>"+seccode+"</SecCode>"+Char(13)
		//End if
		
		//$_t_TransaxString:=$_t_TransaxString+"<Payment_Plan_SKU>"+$payment_plan_sku+"</Payment_Plan_SKU>"+Char(13)
		
		$_t_TransaxString:=$_t_TransaxString+"<Amount>"+$_t_AmountSTR+"</Amount>"+Char:C90(13)
		//$_t_TransaxString:=$_t_TransaxString+"<Tax>"+tax+"</Tax>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<Shipping>"+shipping+"</Shipping>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<OrderDescription>"+description+"</OrderDescription>"+Char(13)
		$_t_TransaxString:=$_t_TransaxString+"<OrderID>"+$_t_OrderID+"</OrderID>"+Char:C90(13)
		$_t_TransaxString:=$_t_TransaxString+"<PONumber>"+$_t_PONumber+"</PONumber>"+Char:C90(13)
		
		$_t_TransaxString:=$_t_TransaxString+"<FirstName>"+$_t_FirstName+"</FirstName>"+Char:C90(13)
		$_t_TransaxString:=$_t_TransaxString+"<LastName>"+$_t_LastName+"</LastName>"+Char:C90(13)
		$_t_TransaxString:=$_t_TransaxString+"<Company>"+$_t_Company+"</Company>"+Char:C90(13)
		If ($_t_AddressLine1#"") & ($_t_City#"") & ($_t_State#"") & ($_t_ZIP#"")
			$_t_TransaxString:=$_t_TransaxString+"<Address1>"+$_t_AddressLine1+"</Address1>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<Address2>"+$_t_AddressLine1+"</Address2>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<City>"+$_t_City+"</City>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<State>"+$_t_State+"</State>"+Char:C90(13)
			$_t_TransaxString:=$_t_TransaxString+"<Zip>"+$_t_ZIP+"</Zip>"+Char:C90(13)
			
			$_t_TransaxString:=$_t_TransaxString+"<Country>"+$_t_Country+"</Country>"+Char:C90(13)
		End if 
		//$_t_TransaxString:=$_t_TransaxString+"<Phone>"+phone+"</Phone>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<Fax>"+fax+"</Fax>"+Char(13)
		$_t_TransaxString:=$_t_TransaxString+"<EMail>"+$_t_Email+"</EMail>"+Char:C90(13)
		//$_t_TransaxString:=$_t_TransaxString+"<Website>"+website+"</Website>"+Char(13)
		
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingFirstName>"+shipfirstname+"</ShippingFirstName>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingLastName>"+shiplastname+"</ShippingLastName>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingCompany>"+shipcompany+"</ShippingCompany>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingAddress1>"+shipaddress1+"</ShippingAddress1>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingAddress2>"+shipaddress2+"</ShippingAddress2>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingCity>"+shipcity+"</ShippingCity>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingState>"+shipstate+"</ShippingState>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingZip>"+shipzip+"</ShippingZip>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingCountry>"+shipcountry+"</ShippingCountry>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ShippingEmail>"+shipemail+"</ShippingEmail>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<ProcessorID>"+processorid+"</ProcessorID>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<Descriptor>"+descriptor+"</Descriptor>"+Char(13)
		//$_t_TransaxString:=$_t_TransaxString+"<DescriptorPhone>"+descriptorphone+"</DescriptorPhone>"+Char(13)
		
	End if 
	$_t_TransaxString:=$_t_TransaxString+"</objparameters>"+Char:C90(13)
	$_t_TransaxString:=$_t_TransaxString+"</ProcessTransaction>"
	$_t_Result:=""
	TEXT TO BLOB:C554($_t_TransaxString; CCM_bl_SentData; 3)
	WEB SERVICE SET PARAMETER:C777("MyXMLInputBlob"; CCM_bl_SentData)
	WEB SERVICE CALL:C778("https://www.nelixtransax.com/roxapi/rox.asmx"; "https://www.nelixtransax.com/roxapi/ProcessTransaction"; "ProcessTransaction"; "https://www.nelixtransax.com/roxapi/"; Web Service manual:K48:4)
	If (OK=1)
		WEB SERVICE GET RESULT:C779(CCM_Bl_TransResponse; "ProcessTransactionResult"; *)  // Memory clean-up on the final return value.
		If (BLOB size:C605(CCM_Bl_TransResponse)=0)
			$_t_ErrorInfo:=WEB SERVICE Get info:C780(Web Service error code:K48:5)
		End if 
		$_t_ResultXML:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
		
	End if 
	
	
	$_t_XMLValue:=""
	
	$_t_XMLParent_Ref:=DOM Parse XML variable:C720($_t_ResultXML)
	$_t_XMLChild_Ref:=DOM Get first child XML element:C723($_t_XMLParent_Ref)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "TRANS_ID"; 1; $_t_TransID)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "STATUS_CODE"; 1; $_t_StatusCode)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "STATUS_MSG"; 1; $_t_StatusMsg)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "AUTH_CODE"; 1; $_t_AuthCode)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "AVS_CODE"; 1; $_t_AVSCode)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "AVS_MSG"; 1; $_t_AVSMSG)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "CVV2_CODE"; 1; $_t_CVV2Code)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "CVV2_MSG"; 1; $_t_CVV2MSG)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "ORDERID"; 1; $_t_OrderID)
	$_t_XMLElement_Value:=DOM Get XML element:C725($_t_XMLChild_Ref; "CUSTOMER_VAULT_ID"; 1; $_t_CustomerVaultID)
	$0:=$_t_TransID
	DOM CLOSE XML:C722($_t_XMLParent_Ref)
End if 
ERR_MethodTrackerReturn("CCM_transaxsubmit"; $_t_oldMethodName)