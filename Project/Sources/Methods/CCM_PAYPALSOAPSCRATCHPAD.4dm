//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PAYPALSOAPSCRATCHPAD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2012 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_ElementRef; $_t_ElementRef2; $_t_oldMethodName; $_t_RootRef; $_t_XMLRoot; $_t_XMLSubElement; $_t_XMLSubElement2; $_t_XMLSubElement3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_PAYPALSOAPSCRATCHPAD")
If (False:C215)
	
	//<SOAP-ENV:Header>
	//<RequesterCredentials xmlns=”urn:ebay:api:PayPalAPI” xsi:type=”ebl:CustomSecurityHeaderType”>
	//<Credentials xmlns=”urn:ebay:apis:eBLBaseComponents” xsi:type=”ebl:UserIdPasswordType”>
	//<Username>nigel.greenlee_1332436768_biz_api1.me.com</Username>
	//<Password>1332436797</Password>
	//<Signature>ALW0m9ZRepLaWIrxnGmQ2rgiDBHOAbP6xTRaEVhWVe-MHY3RC9hLZED4</Signature>
	//<Subject>nigel.greenlee_1332436768_biz@me.com</Subject>
	//</Credentials>
	//</RequesterCredentials>
	//</SOAP-ENV:Header>
	//$SanboxURI:="https://api-aa.sandbox.paypal.com/2.0/"
	//$RealURI:="https://api-aa.paypal.com/2.0/"
	//$XMLDATA:=CCM_CreatePPXML("DoDirectPayment";$SanboxURI;"USD";50;""nigel.greenlee_1332436768_biz_api1.me.com";"1332436797";"ALW0m9ZRepLaWIrxnGmQ2rgiDBHOAbP6xTRaEVhWVe-MHY3RC9hLZED4";"
	//SET WEB SERVICE PARAMETER("DoAuthorizationReq";value{;soapType})
	//CALL WEB SERVICE($SanboxURI;soapAction;methodName;nameSpace{;complexType{;*}})
End if 
// Authentication
//Break this down into elements-think of these as the 'tables' of a paypal transaction

//Request message (abstract) AbstractRequestType
//Detail level -DetaillevelCodeType
//Error language(string)
//Version(string)
//any??

//DoDirectPaymentRequestType
//DoDirectPaymentRequestDetails DoDirectPaymentRequestDetailsType(seeBelow)²

//ReturnFMFDetails (int)

//DoDirectPaymentRequestDetailsType
//paymentAction PaymentActionCodeType(see Below)²
//PaymentDetails PaymentDetailsType(See below)²
//CreditCard CreditCardDetailsType(see below)²
//IPAddress(String)
//MerchantSessionId(string)
//ReturnFMFDetails(Boolean)

//PaymentActionCodeType
//(ebl)
//How you want to obtain payment. It is one of the following values:
//? Authorization – This payment is a basic authorization subject to settlement
//with PayPal Authorization and Capture.
//? Sale – This is a final sale for which you are requesting payment(default)0
//Note that with 'direct payment' order is not an option(presumably it is valid with other types

//PaymentDetailsType
//OrderTotal
//itemTotal
//ShippingTotal
//HandlingTotal
//TaxTotal
//OrderDescription(String)
//Custom(String)
//InvoiceID(String)
//ButtonSource (String)
//NotifyURL(String)
//ShiptoAddress AddressType-See Below²
//ShippingMethod ShippingServiceCodeType-see below-dont think this is mandatory
//ProfileAddressChangeDate DateTime
//PaymentDetailsItem PaymentDetailsItemtype-see below²
//InsuranceTotal
//ShippingDiscount
//InsuranceOptionOffered (string)
//AllowedPaymentMethod AllowedPaymentMethodType
//EnhancedPaymentData
//SellerDetails SellerDetailsType
//NoteText(String)

//CreditCardDetailsType
//CreditCardTypeType-see below
//CreditCardType string
//CreditCardNumber int
//ExpMonth int
//ExpYear int
//CardOwner PayerInfoType-see below
//CVV2 String int
//StartMonth int
//StartYear int
//IssueNumber string
//ThreeDSecureRequest ThreeDSecureRequestType


//AddressType
//Name(string)
//Street(string
//Street2(string)
//CityName(String)
//StateOrProvince(String)
//Country CountryCodeType-seeBelow
//CountryName(String)
//Phone(String
//PostalCode(String)
//AddressID
//AddressOwner AddressOwnerCodeType)
//ExternalAddressID(string)
//InternationalName(String)
//InternationalStateAndCity(String)
//InternationalStreet(String)
//AddressStatus Address StatusCodeType-seeBelow

//ShippingServiceCodeType??

//PaymentDetailsItemtype
//Name String (optional) item Name
// Description(optional) item description
//Amount BasicAmountType-see below
//Number (optional) item number
//Quantity(Optional) Integer item quantity(BTW thats a flaw whole quantities)
//Tax BasicAmountType-SeeBelow
//EbatItemPaymentDetailsItem EbayItamPaymentDetails(optional)-not applicable from Daybook..




//AllowedPaymentMethodType











$_t_RootRef:=DOM Create XML Ref:C861("RequesterCredentials"; "urn:ebay:api:PayPalAPI")
$_t_ElementRef:=DOM Create XML element:C865($_t_RootRef; "/RequesterCredentials/Security"; "xmlns"; "http://schemas.xmlsoap.org/ws/2002/12/secext")
$_t_ElementRef:=DOM Create XML element:C865($_t_RootRef; "/RequesterCredentials/Credentials"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")

$_t_ElementRef2:=DOM Create XML element:C865($_t_ElementRef; "Credentials/Username")
DOM SET XML ELEMENT VALUE:C868($_t_ElementRef2; "nigel.greenlee_1332436768_biz_api1.me.com")

$_t_ElementRef2:=DOM Create XML element:C865($_t_ElementRef; "Credentials/Password")
DOM SET XML ELEMENT VALUE:C868($_t_ElementRef2; "1332436797")

$_t_ElementRef2:=DOM Create XML element:C865($_t_ElementRef; "Credentials/Signature")
DOM SET XML ELEMENT VALUE:C868($_t_ElementRef2; "ALW0m9ZRepLaWIrxnGmQ2rgiDBHOAbP6xTRaEVhWVe-MHY3RC9hLZED4")

$_t_ElementRef2:=DOM Create XML element:C865($_t_ElementRef; "Credentials/Subject")
DOM SET XML ELEMENT VALUE:C868($_t_ElementRef2; "")

WEB SERVICE SET OPTION:C901(Web Service SOAP header:K48:10; $_t_RootRef)

// The call
$_t_XMLRoot:=DOM Create XML Ref:C861("SetExpressCheckoutReq"; "urn:ebay:api:PayPalAPI")

$_t_XMLSubElement:=DOM Create XML element:C865($_t_XMLRoot; "/SetExpressCheckoutReq/SetExpressCheckoutRequest")

$_t_XMLSubElement2:=DOM Create XML element:C865($_t_XMLSubElement; "SetExpressCheckoutRequest/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement2; "87.0")

$_t_XMLSubElement2:=DOM Create XML element:C865($_t_XMLSubElement; "SetExpressCheckoutRequest/SetExpressCheckoutRequestDetails"; "xsi:type"; "SetExpressCheckoutRequestDetailsType")
$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "SetExpressCheckoutRequestDetails/ReturnUrl")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "url_to_/success.paypal.php")

$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "SetExpressCheckoutRequestDetails/CancelUrl")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "url_to_/cancel.paypal.php")

$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "SetExpressCheckoutRequestDetails/LocaleCode")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "US")

WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_XMLRoot)
WEB SERVICE CALL:C778("https://api-3t.sandbox.paypal.com/2.0/"; ""; "SetExpressCheckout"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)

//``
$_t_XMLRoot:=DOM Create XML Ref:C861("DoDirectPaymentReq"; "urn:ebay:api:PayPalAPI")

$_t_XMLSubElement:=DOM Create XML element:C865($_t_XMLRoot; "/DoDirectPaymentReq/DoDirectPayment")

$_t_XMLSubElement2:=DOM Create XML element:C865($_t_XMLSubElement; "DoDirectPayment/Version"; "xmlns"; "urn:ebay:apis:eBLBaseComponents")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement2; "87.0")

$_t_XMLSubElement2:=DOM Create XML element:C865($_t_XMLSubElement; "DoDirectPayment/DoDirectPaymentDetails"; "xsi:type"; "DoDirectPaymentRequestDetailsType")
//payment action(paymentactioncodetype)
//payment details type
//creditcarddetailstype
$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "DoDirectPayment/ReturnUrl")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "url_to_/success.paypal.php")

$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "SetExpressCheckoutRequestDetails/CancelUrl")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "url_to_/cancel.paypal.php")

$_t_XMLSubElement3:=DOM Create XML element:C865($_t_XMLSubElement2; "SetExpressCheckoutRequestDetails/LocaleCode")
DOM SET XML ELEMENT VALUE:C868($_t_XMLSubElement3; "US")

WEB SERVICE SET PARAMETER:C777("XMLIn"; $_t_XMLRoot)
WEB SERVICE CALL:C778("https://api-3t.sandbox.paypal.com/2.0/"; ""; "SetExpressCheckout"; "urn:ebay:api:PayPalAPI"; Web Service manual:K48:4)
ERR_MethodTrackerReturn("CCM_PAYPALSOAPSCRATCHPAD"; $_t_oldMethodName)