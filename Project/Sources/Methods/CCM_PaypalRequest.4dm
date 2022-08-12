//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PaypalRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2012 10:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	//ARRAY TEXT(CCM_at_PPDieldsModule;0)
	//ARRAY TEXT(CCM_at_PPFieldNames;0)
	//ARRAY TEXT(CCM_at_PPFIelds;0)
	//ARRAY TEXT(CCM_at_ppFieldValues;0)
	//ARRAY TEXT(CCM_at_SubmitData;0)
	C_BLOB:C604(CCM_Bl_TransResponse)
	C_BOOLEAN:C305($_bo_insetest; $_bo_NoSubmit; $_bo_Retry; $1)
	C_LONGINT:C283($_l_Address1Column; $_l_Address2Column; $_l_AmountRow; $_l_AuthidRow; $_l_CardTypeRow; $_l_CityColumn; $_l_CityRow; $_l_CompleteTypeRow; $_l_CountryColumn; $_l_CountryRow; $_l_CreditCardRow)
	C_LONGINT:C283($_l_CurrencyRow; $_l_CV2Row; $_l_ExpiryMonthRow; $_l_ExpiryRow; $_l_FirstNameRow; $_l_InvoiceID; $_l_InvoiceIDRow; $_l_LastNameRow; $_l_NameColumn; $_l_OrderTotalRow; $_l_PayerRow)
	C_LONGINT:C283($_l_PhoneColumn; $_l_PhoneRow; $_l_PostCodeColumn; $_l_PostCodeRow; $_l_RefundTypeRow; $_l_Row; $_l_ShippingStartRow; $_l_ShipToRow; $_l_StateColumn; $_l_StateRow; $_l_Street1Row)
	C_LONGINT:C283($_l_Street2Row; $_l_TransactionIDROw; $0; $6; CCM_l_TransrecordID)
	C_TEXT:C284($_t_AddressLine2; $_t_AuthAction; $_t_AuthResponse; $_t_AuthService; $_t_CardNumber; $_t_ElementValue; $_t_ErrorCodeSTR; $_t_LongErrorMessage; $_t_ModuleToUse; $_t_NulReference; $_t_oldMethodName)
	C_TEXT:C284($_t_Phone; $_t_RequestElementRef; $_t_RequestElementRef2; $_t_RequestRef; $_t_RootXML; $_t_RootXMLRef; $_t_SeverityCode; $_t_ShippingData; $_t_ShortMessage; $_t_Signature; $_t_SubElement)
	C_TEXT:C284($_t_SubElement2; $_t_SubElementBaseComponent; $_t_SubElementCode; $_t_SubElementDetailsRequest; $_t_SubElementIPAddress; $_t_SubElementMessage; $_t_SubElementOrderTotal; $_t_SubElementPaymentAction; $_t_SubElementShipToAddress; $_t_SubElementShipToFirstName; $_t_SubElementShipToName)
	C_TEXT:C284($_t_SubElementShipToStreet; $_t_UserName; $_t_Value; $_t_XMLReference; $_t_XMLREFERENCEName; $2; $3; $4; $5; $7; $8)
	C_TEXT:C284(CCM_t_responseText; vElemRef; vRootRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_PaypalRequest")
//C_TEXT($0)

If (Count parameters:C259>=1)
	Case of 
		: ($1=True:C214)
			$_bo_insetest:=True:C214
			$_t_AuthService:="https://api-3t.sandbox.paypal.com/2.0/"
		Else 
			$_bo_insetest:=False:C215
			$_t_AuthService:="https://api-3t.paypal.com/2.0/"
	End case 
Else 
	$_bo_insetest:=True:C214
	$_t_AuthService:="https://api-3t.sandbox.paypal.com/2.0/"
End if 
If (Count parameters:C259>=2)
	$_t_UserName:=$2
Else 
	$_t_UserName:="XMLTEST"
End if 
If (Count parameters:C259>=3)
	$_t_UserName:=$3
Else 
	$_t_UserName:="XMLTEST"
End if 
If (Count parameters:C259>=4)
	$_t_Signature:=$4
Else 
	$_t_Signature:=""
End if 
//TRACE

// Authentication
ARRAY TEXT:C222(CCM_at_PPFieldNames; 0)
ARRAY TEXT:C222(CCM_at_ppFieldValues; 0)
// first we translate to the CCM field names


// <soap:Envelope xmlns:soap='http: ` schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http: ` www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http: ` www.w3.org/2001/XMLSchema'>

$_t_RequestRef:=DOM Create XML Ref:C861("RequesterCredentials"; "urn:ebay:api:PayPalAPI")
//$_t_RequestElementRef:=DOM Create XML element($_t_RequestRef;"/RequesterCredentials/Security";"xmlns";"http://schemas.xmlsoap.org/ws/2002/12/secext")
$_t_RequestElementRef:=DOM Create XML element:C865($_t_RequestRef; "/RequesterCredentials/Credentials"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
$_t_RequestElementRef2:=DOM Create XML element:C865($_t_RequestElementRef; "Credentials/Username")
DOM SET XML ELEMENT VALUE:C868($_t_RequestElementRef2; $_t_UserName)
$_t_RequestElementRef2:=DOM Create XML element:C865($_t_RequestElementRef; "Credentials/Password")
DOM SET XML ELEMENT VALUE:C868($_t_RequestElementRef2; $_t_UserName)
If ($_t_Signature#"")
	$_t_RequestElementRef2:=DOM Create XML element:C865($_t_RequestElementRef; "Credentials/Signature")
	DOM SET XML ELEMENT VALUE:C868($_t_RequestElementRef2; $_t_Signature)
End if 
//$_t_RequestElementRef2:=DOM Create XML element($_t_RequestElementRef;"Credentials/Subject")
//DOM SET XML ELEMENT VALUE($_t_RequestElementRef2;"")
WEB SERVICE SET OPTION:C901(Web Service SOAP header:K48:10; $_t_RequestRef)
// Here we build the request
//DOM EXPORT TO FILE($_t_RequestRef;"")
If (Count parameters:C259>=7)
	$_t_ModuleToUse:=$7
Else 
	$_t_ModuleToUse:="DoDirectPayment"
End if 
If ($_t_ModuleToUse#"GetTransactionDetails")
	$_l_Row:=Find in array:C230(CCM_al_RowIndexIDS; CCM_l_TransrecordID)
	
End if 
Case of 
	: ($_t_ModuleToUse="SetExpressCheckout")
		$_t_RootXML:=DOM Create XML Ref:C861("SetExpressCheckoutReq"; "urn:ebay:api:PayPalAPI")
		$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXML; "/SetExpressCheckoutReq/SetExpressCheckoutRequest")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "SetExpressCheckoutRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "87.0")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "SetExpressCheckoutRequest/SetExpressCheckoutRequestDetails"; "xsi:type"; "SetExpressCheckoutRequestDetailsType")
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementBaseComponent; "SetExpressCheckoutRequestDetails/ReturnUrl")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; "url_to_/success.paypal.php")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementBaseComponent; "SetExpressCheckoutRequestDetails/CancelUrl")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; "url_to_/cancel.paypal.php")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementBaseComponent; "SetExpressCheckoutRequestDetails/LocaleCode")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; "US")
		
		WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXML)
		WEB SERVICE CALL:C778($_t_AuthService; ""; "SetExpressCheckout"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
	: ($_t_ModuleToUse="DoDirectPayment")
		// $5=Ty[e(auth/authpayment/priorauthpayment
		If (Count parameters:C259>=5)
			$_t_AuthAction:=$5
		Else 
			$_t_AuthAction:="AUTHORIZATION"
		End if 
		If ($_t_AuthAction="AUTHORIZATION") | ($_t_AuthAction="AUTHCAPTURE") | ($_t_AuthAction="CAPTURE") | ($_t_AuthAction="SALE")
			$_t_RootXMLRef:=DOM Create XML Ref:C861("DoDirectPaymentReq"; "urn:ebay:api:PayPalAPI")
			$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXMLRef; "/DoDirectPaymentReq/DoDirectPaymentRequest")
			$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoDirectPaymentRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "88.0")
			$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoDirectPaymentRequest/DoDirectPaymentRequestDetails"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
			$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementBaseComponent; "/DoDirectPaymentRequestDetails/PaymentAction")
			If ($_t_AuthAction="Authorization")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; "Authorization")
				// ebl:PaymentActionCodeType
			Else 
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; "Sale")
			End if 
			
			$_t_SubElementIPAddress:=DOM Create XML element:C865($_t_SubElementBaseComponent; "/DoDirectPaymentRequestDetails/PaymentDetails")
			// $_t_SubElementOrderTotal:=DOM Append XML child node($_t_SubElementOrderTotal;11;"OrderTotal")
			$_t_SubElementOrderTotal:=DOM Create XML element:C865($_t_SubElementIPAddress; "OrderTotal")
			// <OrderTotal currencyID='USD'>210.99</OrderTotal>
			// $_t_SubElementOrderTotal:=DOM Create XML element($_t_SubElementIPAddress;"/DoDirectPaymentRequestDetails/PaymentDetails/OrderTotal")
			$_l_OrderTotalRow:=Find in array:C230(CCM_at_PPFIelds; "OrderTotal")
			If ($_l_OrderTotalRow>0)
				// CurrencyCode
				$_l_CurrencyRow:=Find in array:C230(CCM_at_PPFIelds; "CurrencyCode")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementOrderTotal; CCM_at_SubmitData{$_l_Row}{$_l_OrderTotalRow})
				DOM SET XML ATTRIBUTE:C866($_t_SubElementOrderTotal; "CurrencyID"; CCM_at_SubmitData{$_l_Row}{$_l_CurrencyRow})
				// $subelem6:=DOM Create XML element($_t_SubElementOrderTotal;"/DoDirectPaymentRequestDetails/PaymentDetails/ShipToAddress")
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			
			
			$_l_ShipToRow:=Find in array:C230(CCM_at_PPFIelds; "ShipToAddress")
			// if we have a ship to address put 'true' in the ship to address field in the arrays-this value is not put into the PP submission but if it is then there
			// is shipping address information. Note that this is 'address type' data
			If ($_l_ShipToRow>0)  // Shipping information is optional
				$_t_ShippingData:=CCM_at_SubmitData{$_l_Row}{$_l_ShipToRow}
				If ($_t_ShippingData#"")
					$_l_ShippingStartRow:=Find in array:C230(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
					If ($_l_ShippingStartRow>0)
						$_l_NameColumn:=Find in array:C230(CCM_at_PPFIelds; "Name"; $_l_ShippingStartRow-1)
						$_l_Address1Column:=Find in array:C230(CCM_at_PPFIelds; "Street1"; $_l_ShippingStartRow-1)
						$_l_Address2Column:=Find in array:C230(CCM_at_PPFIelds; "Street2"; $_l_ShippingStartRow-1)
						$_l_CityColumn:=Find in array:C230(CCM_at_PPFIelds; "CityName"; $_l_ShippingStartRow-1)
						$_l_PostCodeColumn:=Find in array:C230(CCM_at_PPFIelds; "PostalCode"; $_l_ShippingStartRow-1)
						$_l_CountryColumn:=Find in array:C230(CCM_at_PPFIelds; "Country"; $_l_ShippingStartRow-1)
						$_l_StateColumn:=Find in array:C230(CCM_at_PPFIelds; "StateOrProvince"; $_l_ShippingStartRow-1)
						$_l_PhoneColumn:=Find in array:C230(CCM_at_PPFIelds; "Phone"; $_l_ShippingStartRow-1)
						
						
						
						
						
						$_t_SubElementShipToAddress:=DOM Create XML element:C865($_t_SubElementIPAddress; "ShipToAddress")
						If ($_l_NameColumn>0)
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Name")  // mandatory
							
							// $_t_SubElementShipToName:=DOM Create XML element($_t_SubElementShipToAddress;"/DoDirectPaymentRequestDetails/PaymentDetails/ShipToAddress/Name")
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_NameColumn})  // <-person whole name
							
						End if 
						If ($_l_Address1Column>0)  // mandatory
							
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Street1")
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_Address1Column})  // Max 100 chars
							
						End if 
						If ($_l_Address2Column>0)
							If (CCM_at_SubmitData{$_l_Row}{$_l_Address2Column}#"")  // optional
								$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Street2")  // max 100 chars
								DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_Address2Column})
							End if 
						End if 
						If ($_l_CityColumn>0)
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "CityName")  // max 40
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_CityColumn})
						End if 
						// StateOrProvince
						If ($_l_StateColumn>0)
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "StateOrProvince")
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_StateColumn})  // max 40
						End if 
						If ($_l_CountryColumn>0)
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Country")
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_CountryColumn})  // max 2-ISO 3166
						End if 
						If ($_l_PhoneColumn>0)
							If (CCM_at_SubmitData{$_l_Row}{$_l_PhoneColumn}#"")
								$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Phone")
								DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_PhoneColumn})
							End if 
						End if 
						If ($_l_PostCodeColumn>0)
							$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "PostalCode")
							DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_PostCodeColumn})  //
						End if 
					End if 
				End if 
			End if 
			//   ```
			$_t_SubElementIPAddress:=DOM Create XML element:C865($_t_SubElementBaseComponent; "/DoDirectPaymentRequestDetails/CreditCard")
			$_l_CardTypeRow:=Find in array:C230(CCM_at_PPFields; "CreditCardType")
			If ($_l_CardTypeRow>0)
				$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementIPAddress; "CreditCardType")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_CardTypeRow})  // <-Card Type
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			$_l_CreditCardRow:=Find in array:C230(CCM_at_PPFields; "CreditCardNumber")
			If ($_l_CreditCardRow>0)
				$_t_CardNumber:=CCM_at_SubmitData{$_l_Row}{$_l_CreditCardRow}
				$_t_CardNumber:=Replace string:C233($_t_CardNumber; " "; "")
				$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementIPAddress; "CreditCardNumber")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; $_t_CardNumber)  // <-Card number""
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			$_l_ExpiryMonthRow:=Find in array:C230(CCM_at_PPFields; "ExpMonth")
			If ($_l_ExpiryMonthRow>0)
				$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementIPAddress; "ExpMonth")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_ExpiryMonthRow})  // <-e
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			$_l_ExpiryRow:=Find in array:C230(CCM_at_PPFields; "ExpYear")
			If ($_l_ExpiryRow>0)
				$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementIPAddress; "ExpYear")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_ExpiryRow})  // <-
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			
			
			$_t_SubElementShipToAddress:=DOM Create XML element:C865($_t_SubElementIPAddress; "CardOwner")
			$_l_PayerRow:=Find in array:C230(CCM_at_PPFields; "payer")
			If ($_l_PayerRow>0)
				$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "payer")  // $_t_SubElementShipToName:=DOM Create XML element($_t_SubElementShipToAddress;"/DoDirectPaymentRequestDetails/PaymentDetails/ShipToAddress/Name")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_PayerRow})
			Else 
				$_bo_NoSubmit:=True:C214
			End if 
			
			$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "PayerName")
			$_l_FirstNameRow:=Find in array:C230(CCM_at_PPFields; "PayerNameFirstName")
			If ($_l_FirstNameRow>0)
				$_t_SubElementShipToFirstName:=DOM Create XML element:C865($_t_SubElementShipToName; "FirstName")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToFirstName; CCM_at_SubmitData{$_l_Row}{$_l_FirstNameRow})
			End if 
			$_l_LastNameRow:=Find in array:C230(CCM_at_PPFields; "PayerNameLastName")
			If ($_l_LastNameRow>0)
				$_t_SubElementShipToFirstName:=DOM Create XML element:C865($_t_SubElementShipToName; "LastName")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToFirstName; CCM_at_SubmitData{$_l_Row}{$_l_LastNameRow})
			End if 
			
			$_t_SubElementShipToFirstName:=DOM Create XML element:C865($_t_SubElementShipToAddress; "Address")
			// Street1
			$_l_Street1Row:=Find in array:C230(CCM_at_PPFields; "PayerStreet1")
			$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "Street1")
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; CCM_at_SubmitData{$_l_Row}{$_l_Street1Row})
			$_l_Street2Row:=Find in array:C230(CCM_at_PPFields; "PayerStreet2")
			If ($_l_Street2Row>0)
				$_t_AddressLine2:=CCM_at_SubmitData{$_l_Row}{$_l_Street2Row}
				If ($_t_AddressLine2#"")
					$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "Street2")  // max 100 chars
					DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; $_t_AddressLine2)
				End if 
			End if 
			$_l_CityRow:=Find in array:C230(CCM_at_PPFields; "PayerCityName")
			If ($_l_CityRow>0)
				$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "CityName")  // max 40
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; CCM_at_SubmitData{$_l_Row}{$_l_CityRow})
			End if 
			// StateOrProvince
			$_l_StateRow:=Find in array:C230(CCM_at_PPFields; "PayerStateOrProvince")
			$_l_CountryRow:=Find in array:C230(CCM_at_PPFields; "PayerCountry")
			If ($_l_StateRow>0)
				If (CCM_at_SubmitData{$_l_Row}{$_l_CountryRow}="US")
					If (Length:C16(CCM_at_SubmitData{$_l_Row}{$_l_StateRow})>2)
						CCM_at_SubmitData{$_l_Row}{$_l_StateRow}:=Get_USAstateCodes(CCM_at_SubmitData{$_l_Row}{$_l_StateRow})
					End if 
				End if 
				$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "StateOrProvince")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; CCM_at_SubmitData{$_l_Row}{$_l_StateRow})  // max 40
			End if 
			
			$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "Country")
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; CCM_at_SubmitData{$_l_Row}{$_l_CountryRow})  // max 2-ISO 3166
			$_l_PhoneRow:=Find in array:C230(CCM_at_PPFields; "PayerPhone")
			If ($_l_PhoneRow>0)
				$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "Phone")
				$_t_Phone:=Replace string:C233(CCM_at_SubmitData{$_l_Row}{$_l_PhoneRow}; " "; "")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; $_t_Phone)
			End if 
			$_l_PostCodeRow:=Find in array:C230(CCM_at_PPFields; "PayerPostalCode")
			If ($_l_PostCodeRow>0)
				$_t_SubElementShipToStreet:=DOM Create XML element:C865($_t_SubElementShipToFirstName; "PostalCode")
				DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToStreet; CCM_at_SubmitData{$_l_Row}{$_l_PostCodeRow})  //
			End if 
			$_l_CV2Row:=Find in array:C230(CCM_at_PPFields; "CVV2")
			If ($_l_CV2Row>0)
				If (CCM_at_SubmitData{$_l_Row}{$_l_CV2Row}#"")
					$_t_SubElementShipToName:=DOM Create XML element:C865($_t_SubElementIPAddress; "CVV2")
					DOM SET XML ELEMENT VALUE:C868($_t_SubElementShipToName; CCM_at_SubmitData{$_l_Row}{$_l_CV2Row})  // <-Card CVV2
				End if 
			End if 
			// IPAddress
			
			$_t_SubElementIPAddress:=DOM Create XML element:C865($_t_SubElementBaseComponent; "/DoDirectPaymentRequestDetails/IPAddress")
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementIPAddress; "0.0.0.0")
			
			// SET WEB SERVICE PARAMETER("MyInputVar";$1)
			//TRACE
			
			// $_ti_DocumentRef:=Create document("";"TEXT")
			// Close DocUMENT($_ti_DocumentRef)
			If ($_bo_insetest)
				If (False:C215)
					Gen_Confirm("Export the Request data"; "yes"; "no")
					If (OK=1)
						DOM EXPORT TO FILE:C862($_t_RootXMLRef; "")
					End if 
				End if 
			End if 
			WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXMLRef)
			WEB SERVICE CALL:C778($_t_AuthService; ""; "DoDirectPayment"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
			WEB SERVICE GET RESULT:C779($_t_AuthResponse; "/DoDirectPaymentResponse")
			// /DoDirectPaymentResponse/Amount
			// DoDirectPaymentResponse/AVSCode
			// /DoDirectPaymentResponse/TransactionID
			//$_ti_DocumentRef:=Create document("";"TEXT")
			//SEND PACKET($_ti_DocumentRef;$_t_AuthResponse)
			//Close DocUMENT($_ti_DocumentRef)
			$_t_XMLReference:=DOM Parse XML variable:C720($_t_AuthResponse)
			If ($_bo_insetest)
				If (False:C215)
					Gen_Confirm("Export the Response data"; "yes"; "no")
					If (OK=1)
						DOM EXPORT TO FILE:C862($_t_XMLReference; "")
					End if 
				End if 
			End if 
			
			If ($_t_XMLReference#"")
				$_t_SubElement:=DOM Get first child XML element:C723($_t_XMLReference; $_t_XMLREFERENCEName)
				$_t_SubElement2:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Ack")
				DOM GET XML ELEMENT VALUE:C731($_t_SubElement2; $_t_ElementValue)
				Case of 
					: ($_t_ElementValue="FAILURE")
						$_bo_Retry:=False:C215
						$_t_NulReference:="0"*16
						$_t_SubElementCode:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Errors")
						If ($_t_SubElementCode#$_t_NulReference)
							$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Errors/ShortMessage")
							DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ShortMessage)
							$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Errors/LongMessage")
							DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_LongErrorMessage)
							$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Errors/ErrorCode")
							DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ErrorCodeSTR)
							$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoDirectPaymentResponse/Errors/SeverityCode")
							DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_SeverityCode)
							Case of 
								: ($_t_ErrorCodeSTR="10002")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed")
									$0:=-1
								: ($_t_ErrorCodeSTR="10006")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to upgrade your system")
									$0:=-1
								: ($_t_ErrorCodeSTR="10008")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
									$0:=-1
								: ($_t_ErrorCodeSTR="10101") | ($_t_ErrorCodeSTR="10102")
									Gen_Confirm($_t_LongErrorMessage+". Do you want to retry this now"; "Yes"; "No")
									
									
									If (OK=0)
										$0:=-1
									Else 
										$_bo_Retry:=True:C214
									End if 
								: ($_t_ErrorCodeSTR="81@")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
									$0:=-1
								: ($_t_ErrorCodeSTR="99998")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
									$0:=-1
								: ($_t_ErrorCodeSTR="10401")
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
									$0:=-1
								Else 
									Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
									$0:=-1
							End case 
							
							
							
							
							
							
							
							
						End if 
						
						
					: ($_t_ElementValue="SUCCESS")
						$_bo_Retry:=False:C215
						SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
						
						TEXT TO BLOB:C554($_t_AuthResponse; CCM_Bl_TransResponse; 6)
						$0:=0
				End case 
			Else 
				Gen_Alert("SOAP FAILURE")
				$0:=-1
			End if 
		End if 
	: ($_t_ModuleToUse="DoCapture")  //Capture a prior auth
		//TRACE
		
		$_t_RootXMLRef:=DOM Create XML Ref:C861("DoCaptureReq"; "urn:ebay:api:PayPalAPI")
		$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXMLRef; "/DoCaptureReq/DoCaptureRequest")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "88.0")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/GetTransactionDetailsRequestDetails"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/AuthorizationID")
		$_l_AuthidRow:=Find in array:C230(CCM_at_PPFIelds; "AuthorizationID")
		If ($_l_AuthidRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_AuthidRow})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/Amount")
		$_l_AmountRow:=Find in array:C230(CCM_at_PPFIelds; "Amount")
		If ($_l_AmountRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_AmountRow})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/CompleteType")
		$_l_CompleteTypeRow:=Find in array:C230(CCM_at_PPFIelds; "CompleteType")
		If ($_l_CompleteTypeRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_CompleteTypeRow})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoCaptureRequest/InvoiceID")
		$_l_InvoiceID:=Find in array:C230(CCM_at_PPFIelds; "InvoiceID")
		If ($_l_InvoiceID>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_InvoiceID})
		End if 
		WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXMLRef)
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Request data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_RootXMLRef; "")
				End if 
			End if 
		End if 
		
		WEB SERVICE CALL:C778($_t_AuthService; ""; "DoCapture"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
		WEB SERVICE GET RESULT:C779($_t_AuthResponse; "/DoCaptureResponse")
		// /DoDirectPaymentResponse/Amount
		// DoDirectPaymentResponse/AVSCode
		// /DoDirectPaymentResponse/TransactionID
		//$_ti_DocumentRef:=Create document("";"TEXT")
		//SEND PACKET($_ti_DocumentRef;$_t_AuthResponse)
		$_t_XMLReference:=DOM Parse XML variable:C720($_t_AuthResponse)  //Close DocUMENT($_ti_DocumentRef)
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Response data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_XMLReference; "")
				End if 
			End if 
		End if 
		
		
		If ($_t_XMLReference#"")
			$_t_SubElement:=DOM Get first child XML element:C723($_t_XMLReference; $_t_XMLREFERENCEName)
			$_t_SubElement2:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Ack")
			DOM GET XML ELEMENT VALUE:C731($_t_SubElement2; $_t_ElementValue)
			Case of 
				: ($_t_ElementValue="FAILURE")
					$_bo_Retry:=False:C215
					$_t_NulReference:="0"*16
					$_t_SubElementCode:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Errors")
					If ($_t_SubElementCode#$_t_NulReference)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Errors/ShortMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ShortMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Errors/LongMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_LongErrorMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Errors/ErrorCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ErrorCodeSTR)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoCaptureResponse/Errors/SeverityCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_SeverityCode)
						Case of 
							: ($_t_ErrorCodeSTR="10002")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed")
								$0:=-1
							: ($_t_ErrorCodeSTR="10006")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to upgrade your system")
								$0:=-1
							: ($_t_ErrorCodeSTR="10008")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10101") | ($_t_ErrorCodeSTR="10102")
								Gen_Confirm($_t_LongErrorMessage+". Do you want to retry this now"; "Yes"; "No")
								
								
								If (OK=0)
									$0:=-1
								Else 
									$_bo_Retry:=True:C214
								End if 
							: ($_t_ErrorCodeSTR="81@")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="99998")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10401")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							Else 
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
						End case 
						
						
						
						
						
						
						
						
					End if 
					
					
				: ($_t_ElementValue="SUCCESS")
					$_bo_Retry:=False:C215
					SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
					
					TEXT TO BLOB:C554($_t_AuthResponse; CCM_Bl_TransResponse; 6)
					$0:=0
			End case 
		Else 
			Gen_Alert("SOAP FAILURE")
			$0:=-1
		End if 
	: ($_t_ModuleToUse="DoRefund")
		//TRACE
		$_t_RootXMLRef:=DOM Create XML Ref:C861("RefundTransactionReq"; "urn:ebay:api:PayPalAPI")
		
		$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXMLRef; "/RefundTransactionReq/RefundTransactionRequest")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "88.0")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/RefundTransactionRequestDetails"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/TransactionID")
		$_l_TransactionIDROw:=Find in array:C230(CCM_at_PPFIelds; "TransactionID")
		If ($_l_TransactionIDROw>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_TransactionIDROw})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/InvoiceID")
		$_l_InvoiceIDRow:=Find in array:C230(CCM_at_PPFIelds; "InvoiceID")
		If ($_l_InvoiceIDRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_InvoiceIDRow})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/RefundType")
		$_l_RefundTypeRow:=Find in array:C230(CCM_at_PPFIelds; "RefundType")
		If ($_l_RefundTypeRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_RefundTypeRow})
		End if 
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/RefundTransactionRequest/Amount")
		$_l_AmountRow:=Find in array:C230(CCM_at_PPFIelds; "Amount")
		If ($_l_AmountRow>0)
			DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; CCM_at_SubmitData{$_l_Row}{$_l_AmountRow})
		End if 
		//InvoiceID
		//RefundType
		//Amount
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Request data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_RootXMLRef; "")
				End if 
			End if 
		End if 
		
		WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXMLRef)
		WEB SERVICE CALL:C778($_t_AuthService; ""; "DoRefund"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
		WEB SERVICE GET RESULT:C779($_t_AuthResponse; "/DoRefundResponse")
		// /DoDirectPaymentResponse/Amount
		// DoDirectPaymentResponse/AVSCode
		// /DoDirectPaymentResponse/TransactionID
		//$_ti_DocumentRef:=Create document("";"TEXT")
		//SEND PACKET($_ti_DocumentRef;$_t_AuthResponse)
		//Close DocUMENT($_ti_DocumentRef)
		$_t_XMLReference:=DOM Parse XML variable:C720($_t_AuthResponse)
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Response data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_XMLReference; "")
				End if 
			End if 
		End if 
		If ($_t_XMLReference#"")
			$_t_SubElement:=DOM Get first child XML element:C723($_t_XMLReference; $_t_XMLREFERENCEName)
			$_t_SubElement2:=DOM Find XML element:C864($_t_XMLReference; "RefundTransactionResponse/Ack")
			DOM GET XML ELEMENT VALUE:C731($_t_SubElement2; $_t_ElementValue)
			Case of 
				: ($_t_ElementValue="FAILURE")
					$_bo_Retry:=False:C215
					
					$_t_SubElementCode:=DOM Find XML element:C864($_t_XMLReference; "DoRefundResponse/Errors")
					If ($_t_SubElementCode#"0"*16)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "RefundTransactionResponse/Errors/ShortMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ShortMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "RefundTransactionResponse/Errors/LongMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_LongErrorMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "RefundTransactionResponse/Errors/ErrorCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ErrorCodeSTR)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "RefundTransactionResponse/Errors/SeverityCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_SeverityCode)
						Case of 
							: ($_t_ErrorCodeSTR="10002")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed")
								$0:=-1
							: ($_t_ErrorCodeSTR="10006")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to upgrade your system")
								$0:=-1
							: ($_t_ErrorCodeSTR="10008")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10101") | ($_t_ErrorCodeSTR="10102")
								Gen_Confirm($_t_LongErrorMessage+". Do you want to retry this now"; "Yes"; "No")
								
								
								If (OK=0)
									$0:=-1
								Else 
									$_bo_Retry:=True:C214
								End if 
							: ($_t_ErrorCodeSTR="81@")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="99998")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10401")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							Else 
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
						End case 
						
						
						
						
						
						
						
						
					End if 
					
					
				: ($_t_ElementValue="SUCCESS")
					$_bo_Retry:=False:C215
					SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
					
					TEXT TO BLOB:C554($_t_AuthResponse; CCM_Bl_TransResponse; 6)
					$0:=0
			End case 
		Else 
			Gen_Alert("SOAP FAILURE")
			$0:=-1
		End if 
	: ($_t_ModuleToUse="DoVoid")  //note that voids are only for auths NOT for payments as there is no reconcile time
		//TRACE
		$_t_RootXMLRef:=DOM Create XML Ref:C861("DoVoidReq"; "urn:ebay:api:PayPalAPI")
		
		$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXMLRef; "/DoVoidReq/DoVoidRequest")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoVoidRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "88.0")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoVoidRequest/DoVoidRequestDetails"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/DoVoidRequest/TransactionID")
		WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXMLRef)
		WEB SERVICE CALL:C778($_t_AuthService; ""; "DoCapture"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
		WEB SERVICE GET RESULT:C779($_t_AuthResponse; "/DoVoidResponse")
		// /DoDirectPaymentResponse/Amount
		// DoDirectPaymentResponse/AVSCode
		// /DoDirectPaymentResponse/TransactionID
		//$_ti_DocumentRef:=Create document("";"TEXT")
		//SEND PACKET($_ti_DocumentRef;$_t_AuthResponse)
		//Close DocUMENT($_ti_DocumentRef)
		$_t_XMLReference:=DOM Parse XML variable:C720($_t_AuthResponse)
		If ($_t_XMLReference#"")
			$_t_SubElement:=DOM Get first child XML element:C723($_t_XMLReference; $_t_XMLREFERENCEName)
			$_t_SubElement2:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Ack")
			DOM GET XML ELEMENT VALUE:C731($_t_SubElement2; $_t_ElementValue)
			Case of 
				: ($_t_ElementValue="FAILURE")
					$_bo_Retry:=False:C215
					
					$_t_SubElementCode:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Errors")
					If ($_t_SubElementCode#"0"*16)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Errors/ShortMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ShortMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Errors/LongMessage")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_LongErrorMessage)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Errors/ErrorCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_ErrorCodeSTR)
						$_t_SubElementMessage:=DOM Find XML element:C864($_t_XMLReference; "DoVoidResponse/Errors/SeverityCode")
						DOM GET XML ELEMENT VALUE:C731($_t_SubElementMessage; $_t_SeverityCode)
						Case of 
							: ($_t_ErrorCodeSTR="10002")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed")
								$0:=-1
							: ($_t_ErrorCodeSTR="10006")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to upgrade your system")
								$0:=-1
							: ($_t_ErrorCodeSTR="10008")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10101") | ($_t_ErrorCodeSTR="10102")
								Gen_Confirm($_t_LongErrorMessage+". Do you want to retry this now"; "Yes"; "No")
								
								
								If (OK=0)
									$0:=-1
								Else 
									$_bo_Retry:=True:C214
								End if 
							: ($_t_ErrorCodeSTR="81@")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="99998")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							: ($_t_ErrorCodeSTR="10401")
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
							Else 
								Gen_Alert($_t_LongErrorMessage+". This request cannot be processed. Contact your developer to report this problem")
								$0:=-1
						End case 
						
						
						
						
						
						
						
						
					End if 
					
					
				: ($_t_ElementValue="SUCCESS")
					$_bo_Retry:=False:C215
					SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
					
					TEXT TO BLOB:C554($_t_AuthResponse; CCM_Bl_TransResponse; 6)
					$0:=0
			End case 
		Else 
			Gen_Alert("SOAP FAILURE")
			$0:=-1
		End if 
		
	: ($_t_ModuleToUse="GetTransactionDetails")
		//TRACE
		$_t_RootXMLRef:=DOM Create XML Ref:C861("GetTransactionDetailsReq"; "urn:ebay:api:PayPalAPI")
		
		$_t_SubElementDetailsRequest:=DOM Create XML element:C865($_t_RootXMLRef; "/GetTransactionDetailsReq/GetTransactionDetailsRequest")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/GetTransactionDetailsRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementBaseComponent; "88.0")
		$_t_SubElementBaseComponent:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/GetTransactionDetailsRequest/GetTransactionDetailsRequestDetails"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
		
		$_t_SubElementPaymentAction:=DOM Create XML element:C865($_t_SubElementDetailsRequest; "/GetTransactionDetailsRequest/TransactionID")
		If (Count parameters:C259<8)
			$_t_Value:="VELLO"
		Else 
			$_t_Value:=$8
		End if 
		DOM SET XML ELEMENT VALUE:C868($_t_SubElementPaymentAction; $_t_Value)
		//DOM EXPORT TO FILE($_t_RootXMLRef;"")
		WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_RootXMLRef)
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Request data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_RootXMLRef; "")
				End if 
			End if 
		End if 
		
		WEB SERVICE CALL:C778($_t_AuthService; ""; "GetTransactionDetails"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
		WEB SERVICE GET RESULT:C779($_t_AuthResponse; "/GetTransactionDetailsResponse")
		$_t_XMLReference:=DOM Parse XML variable:C720($_t_AuthResponse)
		//$_ti_DocumentRef:=Create document("";"TEXT")
		//SEND PACKET($_ti_DocumentRef;$_t_AuthResponse)
		//Close DocUMENT($_ti_DocumentRef)
		If ($_bo_insetest)
			If (False:C215)
				Gen_Confirm("Export the Response data"; "yes"; "no")
				If (OK=1)
					DOM EXPORT TO FILE:C862($_t_XMLReference; "")
				End if 
			End if 
		End if 
		CCM_t_responseText:=$_t_AuthResponse
		$0:=1
End case 
ERR_MethodTrackerReturn("CCM_PaypalRequest"; $_t_oldMethodName)