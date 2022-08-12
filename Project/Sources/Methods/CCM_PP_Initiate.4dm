//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PP_Initiate
	//------------------ Method Notes ------------------
	// This method will insert a row in the array of active transactions(cant see we will ever have more than one row!
	// it will return an internal id for the row which is used to put data in there
	
	
	
	// Parameters
	// Declarations
	// ----------------------------------------------------
	// Project method Amendments
	
	
	// Nigel Greenlee10/4/2012 02:27 v7.0.0/1
	// Added
	
	// Block of lines added from line 27to line 241
	// Edited
	
	// Block of lines edited from line 1to line 7
	// Block of lines edited from line 14to line 17
	// Block of lines edited from line 23to line 26
	
	
	// Nigel Greenlee11/4/2012 17:31 v7.0.0/1
	// Added
	
	// Block of lines added from line 320to line 323
	// Block of lines added from line 334to line 667 ` (625)CCM_AN_INSERTDATA ($_l_IndexID;"Username";CCM_t_AuthorizationLogin;"Password";CCM_t_AuthorizationPass)
	// (626)  `"X_version";"3.1";"x_Delim_data";"TRUE";"x_delim_char";"|";"x_relay_response";"FALSE")
	
	// Edited
	// (5) ` Description(Changed to) ` If the data type is XS then it is a string  of the data that goes in
	// (6) ` This method will insert a row in the array of active transactions(cant see we will ever have more than one row!(Changed to)  `if the data type is EBL then the data is a subentity-there is a data module of that name somewhere the 'fields' of whch are defined
	
	// Block of lines edited from line 36to line 38
	// Block of lines edited from line 41to line 46
	// Block of lines edited from line 48to line 53
	// Block of lines edited from line 55to line 64 ` (39)APPEND TO ARRAY(CCM_at_PPDieldsModule;"DoVoid")(Changed to)APPEND TO ARRAY(CCM_at_PPDieldsModule;"RequesterCredentials")
	// (42)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (43)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (45)(Changed to)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)
	// (46)APPEND TO ARRAY(CCM_at_PPFIelds;"CreditCard")(Changed to)APPEND TO ARRAY(CCM_at_PPDieldsModule;"DoVoid")
	// (49)APPEND TO ARRAY(CCM_at_PPDieldsModule;"DoDirectPayment")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (50)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (56)APPEND TO ARRAY(CCM_at_PPFIelds;"IPAddress")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (57)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"CreditCardDetails")
	// (63)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (69)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (75)APPEND TO ARRAY(CCM_at_PPDieldsModule;"DoDirectPayment")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (82)APPEND TO ARRAY(CCM_at_PPFIelds;"CreditCardNumber")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")  `boolean 0 or 1
	// (87)APPEND TO ARRAY(CCM_at_PPFIelds;"ExpMonth")(Changed to)APPEND TO ARRAY(CCM_at_PPFIelds;"ThreeDSecureRequest")  `note only applicable in the UK
	// (88)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"ns")
	// (94)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (95)APPEND TO ARRAY(CCM_at_PPDieldsModule;"CreditCardDetails")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (101)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (102)APPEND TO ARRAY(CCM_at_PPFIelds;"CardOwner")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (108)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")  `INT 01 02 etc
	// (109)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (115)APPEND TO ARRAY(CCM_at_PPDieldsModule;"CreditCardDetails")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")  `2012 2013 etc
	// (116)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (122)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (123)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (129)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"NS")
	// (130)APPEND TO ARRAY(CCM_at_PPFIelds;"PayerID")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (136)APPEND TO ARRAY(CCM_at_PPFIelds;"PayerStatus")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (137)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (143)APPEND TO ARRAY(CCM_at_PPFIelds;"PayerName")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")
	// (144)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (150)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"xs")  `2 digit max(maestro card)
	// (151)APPEND TO ARRAY(CCM_at_PPDieldsModule;"PayerInfoType")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (160)INSERT IN ARRAY(CCM_at_PPDieldsModule;Size of array(CCM_at_PPDieldsModule)+1;1)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (161)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"EmailAddressType")
	// (167)$_l_SizeofArray:=Size of array(CCM_at_PPDieldsModule)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (168)APPEND TO ARRAY(CCM_at_PPDieldsModule;"PayerNameType")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"UserIDType")
	// (175)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (176)APPEND TO ARRAY(CCM_at_PPFIelds;"x_ship_to_last_name")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"PayPalUserStatusCodeType")
	
	// Block of lines edited from line 212to line 217
	// Block of lines edited from line 219to line 224 ` (196)APPEND TO ARRAY(CCM_at_PPFIelds;"x_card_num")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (197)APPEND TO ARRAY(CCM_at_PPFIelds;"x_exp_date")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"PersonNameType")
	// (203)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"EBL")
	// (204)APPEND TO ARRAY(CCM_at_PPFIelds;"x_po_num")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"CountryCodeType")
	// (210)APPEND TO ARRAY(CCM_at_PPFIelds;"x_last_name")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"XS")
	// (211)APPEND TO ARRAY(CCM_at_PPFIelds;"x_company")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	// (218)APPEND TO ARRAY(CCM_at_PPFIelds;"x_phone")(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"XS")  `although this is what is stated under dodirect payment in donoreferenced credit this is NS and is address type information
	// (219)APPEND TO ARRAY(CCM_at_PPFIelds;"x_email")(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"")
	
	// Block of lines edited from line 256to line 258 ` (234)$_l_SizeofArray:=Size of array(CCM_at_SubmitData) ` GET THE CURRENT SIZE(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"ebl")
	// (235)$_l_SizeofArray2:=Size of array(CCM_at_PPFIelds)(Changed to)APPEND TO ARRAY(CCM_at_PPSubentityName;"PersonNameType")
	
	// Block of lines edited from line 272to line 277
	// Block of lines edited from line 286to line 291
	// Block of lines edited from line 297to line 302 ` (261)(Changed to)APPEND TO ARRAY(CCM_at_PPFIelds;"Name")
	// (262)ERR_MethodTrackerReturn ("CCM_PP_Initiate";$_t_oldMethodName)(Changed to)APPEND TO ARRAY(CCM_at_PPDataType;"XS")
	
	
	
	// Nigel Greenlee12/4/2012 10:34 v7.0.0/1
	// Added
	
	// Block of lines added from line 300to line 304
	// Block of lines added from line 310to line 315
	// Block of lines added from line 331to line 336
	// Block of lines added from line 347to line 680 ` (640)CCM_PP_INSERTDATA($_l_IndexID;"Username";CCM_t_AuthorizationLogin;"Password";CCM_t_AuthorizationPass)
	// (641) ` "X_version";"3.1";"x_Delim_data";"TRUE";"x_delim_char";"|";"x_relay_response";"FALSE")
	
	// Edited
	// (1)If (False) ` ----------------------------------------------------(Changed to)End if 
	//------------------ Revision Control ----------------
	//Date Created: 09/4/2012 13:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	//ARRAY TEXT(CCM_at_PPDataType;0)
	//ARRAY TEXT(CCM_at_PPDieldsModule;0)
	//ARRAY TEXT(CCM_at_PPFIelds;0)
	//ARRAY TEXT(CCM_at_PPSubentityName;0)
	//ARRAY TEXT(CCM_at_SubmitData;0;0)
	C_BOOLEAN:C305(CCM_bo_PPFieldNamesInited)
	C_LONGINT:C283($_l_BlankRow; $_l_Index; $_l_IndexID; $_l_SizeofArray; $_l_SizeofArray2; $0; CCM_l_InternalTransactionID)
	C_TEXT:C284($_t_oldMethodName; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_PP_Initiate")
// This method will insert a row in the array of active transactions(cant see we will ever have more than one row!
// If the data type is XS then it is a string  of the data that goes in
//TRACE
// if the data type is EBL then the data is a subentity-there is a data module of that name somewhere the 'fields' of which are defined
If (Not:C34(CCM_bo_PPFieldNamesInited))
	ARRAY TEXT:C222(CCM_at_PPFIelds; 0)
	ARRAY TEXT:C222(CCM_at_PPDataType; 0)
	ARRAY TEXT:C222(CCM_at_PPSubentityName; 0)
	ARRAY TEXT:C222(CCM_at_PPDieldsModule; 0)  // the entities this belongs to
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "TransactionTYPE")  // This is not a PP field its my own it will hold the type-auth etc
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "TransactionDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "TransactionPath")  // This is not a PP field its my own it will hold test or live(live=0)test=1
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "TransactionDetails")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Username")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "RequesterCredentials")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Password")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "RequesterCredentials")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Signature")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "RequesterCredentials")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Subject")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "RequesterCredentials")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "AuthorizationID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoVoid")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PaymentAction")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CreditCard")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "CreditCardDetails")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PaymentDetails")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "IPAddress")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "MerchantSessionId")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ReturnFMFDetails")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")  // boolean 0 or 1
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ThreeDSecureRequest")  // note only applicable in the UK
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "ns")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoDirectPayment")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CompleteType")  // note only applicable in the UK
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoCapture")
	
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CreditCardType")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CreditCardNumber")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ExpMonth")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")  // INT 01 02 etc
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ExpYear")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")  // 2012 2013 etc
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CVV2")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CardOwner")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "NS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "StartMonth")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "StartYear")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "IssueNumber")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "xs")  // 2 digit max(maestro card)
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "CreditCardDetails")
	
	
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Payer")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "EmailAddressType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "UserIDType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerStatus")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PayPalUserStatusCodeType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerNameFirstName")  // Used in credit payment but not in payment
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PersonNameType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerNameLastName")  // Used in credit payment but not in payment
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PersonNameType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PersonNameType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerCCCountry")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "CountryCodeType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerBusiness")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Address")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")  // although this is what is stated under dodirect payment in donoreferenced credit 
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerInfoType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Salutation")  // PayerNameType
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerNameType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "FirstName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "ebl")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PersonNameType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerNameType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "MiddleName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "ebl")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "NameUser")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerNameType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "LastName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "ebl")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "NameType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerNameType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Suffix")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "ebl")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "SuffixType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PayerNameType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerStreet1")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerStreet2")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerCityName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerStateOrProvince")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerCountry")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerPostalCode")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PayerPhone")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressType")
	
	// The following entity is not a real Paypal entity-if we have a shipping address it goes in this arrays
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Name")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Street1")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Street2")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CityName")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "StateOrProvince")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Country")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PostalCode")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Phone")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "AddressTypeSHIPPING")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "OrderTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CurrencyCode")  // Note this is not a PP field its an attribute of a basic amount type
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ItemTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ShippingTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "InsuranceTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ShippingDiscount")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "HandlingTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "TaxTotal")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "OrderDescription")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Custom")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "InvoiceID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ButtonSource")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "NotifyURL")  // only applies to express checkout
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ShipToAddress")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "NS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "AddressTypeSHIPPING")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "PaymentDetailsItem")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "PaymentDetailsItemType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Recurring")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "NS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "RecurringFlagType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Name")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Description")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Amount")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Number")  // Item number
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Tax")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "EbayItemPaymentDetailsItem")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "ebayItemPaymentDetailsItemType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "PaymentDetailsItemType")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ItemNumber")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "EbayItemPaymentDetailsItemtype")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "AuctionTransactionId")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "EbayItemPaymentDetailsItemtype")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "OrderID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "EbayItemPaymentDetailsItemtype")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "AuthStatus3ds")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "ThreeDSecureRequest")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "MpiVendor3ds")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "ThreeDSecureRequest")
	
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Cavv")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "ThreeDSecureRequest")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Eci3ds")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "ThreeDSecureRequest")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "XID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "ThreeDSecureRequest")
	// DoNonReferencedCredit
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "NetAmount")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "NS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CURRENCY")  // Note this is not a PP field it is an attribute of BasicAmountType
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ShppingAmount")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "NS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "CreditCard")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "CreditCardDetailsType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "ReceiverEmail")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Comment")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoNonReferencedCredit")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "AuthorizationID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoReauthorization")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "Amount")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "EBL")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "BasicAmountType")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoReauthorization")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "RefundType")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoRefund")
	
	APPEND TO ARRAY:C911(CCM_at_PPFIelds; "TransactionID")
	APPEND TO ARRAY:C911(CCM_at_PPDataType; "XS")
	APPEND TO ARRAY:C911(CCM_at_PPSubentityName; "")
	INSERT IN ARRAY:C227(CCM_at_PPDieldsModule; Size of array:C274(CCM_at_PPDieldsModule)+1; 1)
	$_l_SizeofArray:=Size of array:C274(CCM_at_PPDieldsModule)
	APPEND TO ARRAY:C911(CCM_at_PPDieldsModule; "DoRefund")
	
	
	
	$_l_SizeofArray2:=Size of array:C274(CCM_at_PPFields)
	ARRAY TEXT:C222(CCM_at_SubmitData; 0; $_l_SizeofArray2)
	ARRAY LONGINT:C221(CCM_al_RowIndexIDS; 0)
	CCM_bo_PPFieldNamesInited:=True:C214
	
End if 

$_l_BlankRow:=Find in array:C230(CCM_al_RowIndexIDS; 0)  // no free row..insert one
If ($_l_BlankRow<0)
	$_l_SizeofArray:=Size of array:C274(CCM_at_SubmitData)  // GET THE CURRENT SIZE
	$_l_SizeofArray2:=Size of array:C274(CCM_at_PPFIelds)
	ARRAY TEXT:C222(CCM_at_SubmitData; $_l_SizeofArray+1; $_l_SizeofArray2)  // Resize the 2D array by one extra row
	CCM_l_InternalTransactionID:=0
	$_l_IndexID:=AA_GetNextID(->CCM_l_InternalTransactionID)  // CREATE AN INDEX NUMBER
	APPEND TO ARRAY:C911(CCM_al_RowIndexIDS; $_l_IndexID)  // store that
	$0:=$_l_IndexID
Else 
	CCM_l_InternalTransactionID:=0
	$_l_IndexID:=AA_GetNextID(->CCM_l_InternalTransactionID)  // CREATE AN INDEX NUMBER
	For ($_l_Index; 1; Size of array:C274(CCM_at_SubmitData{$_l_BlankRow}))
		// make sure the row is cleared out
		CCM_at_SubmitData{$_l_BlankRow}{$_l_Index}:=""
	End for 
	CCM_al_RowIndexIDS{$_l_BlankRow}:=$_l_IndexID
	$0:=$_l_IndexID
End if 
If ($_l_IndexID>0)
	CCM_PP_InsertData($_l_IndexID; "Username"; CCM_t_AuthorizationLogin; "Password"; CCM_t_AuthorizationPass; "Signature"; CCM_t_AuthorizationPassID)
End if 
ERR_MethodTrackerReturn("CCM_PP_Initiate"; $_t_oldMethodName)