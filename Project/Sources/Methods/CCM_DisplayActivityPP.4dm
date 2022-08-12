//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DisplayActivityPP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/06/2012 12:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_LB_DetailsAL;0)
	//ARRAY DATE(CCM_Ad_TransDate;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY LONGINT(CCM_al_ResponseFields;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY REAL(CCM_ar_AuthAmount;0)
	//ARRAY TEXT(CCM_at_ResponseFieldName;0)
	//ARRAY TEXT(CCM_at_Address;0)
	//ARRAY TEXT(CCM_at_ApprovalCode;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	//ARRAY TEXT(CCM_at_AVSResult;0)
	//ARRAY TEXT(CCM_at_City;0)
	//ARRAY TEXT(CCM_at_Company;0)
	//ARRAY TEXT(CCM_at_ContactCode;0)
	//ARRAY TEXT(CCM_at_Country;0)
	//ARRAY TEXT(CCM_at_CreditCard;0)
	//ARRAY TEXT(CCM_at_CreditCardissuer;0)
	//ARRAY TEXT(CCM_at_CreditCardType;0)
	//ARRAY TEXT(CCM_at_CV2Response;0)
	//ARRAY TEXT(CCM_at_DepositCode;0)
	//ARRAY TEXT(CCM_at_FirstName;0)
	//ARRAY TEXT(CCM_at_InvoiceCode;0)
	//ARRAY TEXT(CCM_at_LastName;0)
	//ARRAY TEXT(CCM_at_OrderCode;0)
	//ARRAY TEXT(CCM_at_ReceiptCode;0)
	//ARRAY TEXT(CCM_at_ResponseCodes;0)
	//ARRAY TEXT(CCM_at_ResponseReason;0)
	//ARRAY TEXT(CCM_at_ResponseReasonCode;0)
	//ARRAY TEXT(CCM_at_ResponseSubCode;0)
	//ARRAY TEXT(CCM_at_State;0)
	//ARRAY TEXT(CCM_at_Status;0)
	//ARRAY TEXT(CCM_at_TransID;0)
	//ARRAY TEXT(CCM_at_TransType;0)
	//ARRAY TEXT(CCM_at_Zip;0)
	//ARRAY TEXT(CCM_at_ResponseFieldDict;0)
	C_BOOLEAN:C305($_bo_inTest; $_bo_TestMode; CCM_bo_IsLicenced; CCM_bo_ProvidorInited)
	C_LONGINT:C283($_l_ArraySize; $_l_CharPosition; $_l_Index; $_l_Index2; $_l_SecurityLevel; $_l_ServiceID; $_l_ServiceRow; CCM_l_BUT1; CCM_l_BUT10; CCM_l_BUT11; CCM_l_BUT12)
	C_LONGINT:C283(CCM_l_BUT13; CCM_l_BUT14; CCM_l_BUT15; CCM_l_BUT16; CCM_l_BUT17; CCM_l_BUT18; CCM_l_BUT19; CCM_l_BUT2; CCM_l_BUT20; CCM_l_BUT21; CCM_l_BUT22)
	C_LONGINT:C283(CCM_l_BUT23; CCM_l_BUT24; CCM_l_BUT25; CCM_l_BUT26; CCM_l_BUT27; CCM_l_BUT3; CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8)
	C_LONGINT:C283(CCM_l_BUT9; CCM_l_RunTest)
	C_TEXT:C284($_t_AVSResult; $_t_CV2Response; $_t_oldMethodName; $_t_PPTransID; $_t_RequestModule; $_t_ResponseCodeSTR; $_t_ResponseReasonCodeSTR; $_t_ResponseText; $_t_TRANSACTIONDETAILS; $_t_TRANSACTIONDETAILS2; $1)
	C_TEXT:C284($CCM_T_Response; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_T_CardNumber; oCCM_COL1; oCCM_COL10; oCCM_COL11)
	C_TEXT:C284(oCCM_COL12; oCCM_COL13; oCCM_COL14; oCCM_COL15; oCCM_COL16; oCCM_COL17; oCCM_COL18; oCCM_COL19; oCCM_COL2; oCCM_COL20; oCCM_COL21)
	C_TEXT:C284(oCCM_COL22; oCCM_COL23; oCCM_COL24; oCCM_COL25; oCCM_COL26; oCCM_COL27; oCCM_COL3; oCCM_COL4; oCCM_COL5; oCCM_COL6; oCCM_COL7)
	C_TEXT:C284(oCCM_COL8; oCCM_COL9; oCCM_HED1; oCCM_HED10; oCCM_HED11; oCCM_HED12; oCCM_HED13; oCCM_HED14; oCCM_HED15; oCCM_HED16; oCCM_HED17)
	C_TEXT:C284(oCCM_HED18; oCCM_HED19; oCCM_HED2; oCCM_HED20; oCCM_HED21; oCCM_HED22; oCCM_HED23; oCCM_HED24; oCCM_HED25; oCCM_HED26; oCCM_HED27)
	C_TEXT:C284(oCCM_HED3; oCCM_HED4; oCCM_HED5; oCCM_HED6; oCCM_HED7; oCCM_HED8; oCCM_HED9)
	C_TIME:C306(CCM_ti_ReconcileTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DisplayActivityPP")

If (Count parameters:C259>=1)
	If ($1="Paypal")
		$_l_ArraySize:=Records in selection:C76([CCM_PSPTransaction:136])
		ARRAY REAL:C219(CCM_ar_AuthAmount; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ResponseCodes; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ResponseSubCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ResponseReasonCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ResponseReason; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ApprovalCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_AVSResult; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_TransID; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_FirstName; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_LastName; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_Company; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_Address; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_City; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_State; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ZIp; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_Country; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_CV2Response; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ContactCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_InvoiceCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_DepositCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_ReceiptCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_OrderCode; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_Status; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_CreditCard; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_TransType; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_CreditCardType; $_l_ArraySize)
		ARRAY TEXT:C222(CCM_at_CreditCardissuer; $_l_ArraySize)
		ARRAY DATE:C224(CCM_Ad_TransDate; $_l_ArraySize)
		
		//``
		
		ARRAY LONGINT:C221(CCM_al_ResponseFields; 40)
		ARRAY TEXT:C222(CCM_at_ResponseFieldName; 40)
		ARRAY TEXT:C222(CCM_at_ResponseFieldDict; 40)
		
		CCM_al_ResponseFields{1}:=1
		CCM_at_ResponseFieldName{1}:="Response Code"
		CCM_at_ResponseFieldDict{1}:="Indicates the result of the transaction"+"1=Approved"+"2=Declined"+"3=Error"
		CCM_al_ResponseFields{2}:=2
		CCM_at_ResponseFieldName{2}:="Response Subcode"
		CCM_at_ResponseFieldDict{2}:="A code used by the system for internal transaction tracking"
		CCM_al_ResponseFields{3}:=3
		CCM_at_ResponseFieldName{3}:="Response Reason Code"
		CCM_at_ResponseFieldDict{3}:=" code representing more details about the result of the transaction."
		//upto here there are commas between the fields so double when decoding
		CCM_al_ResponseFields{4}:=4
		CCM_at_ResponseFieldName{4}:="Response Reason Text"
		CCM_at_ResponseFieldDict{4}:=" Brief description of the result"
		CCM_al_ResponseFields{5}:=5
		CCM_at_ResponseFieldName{5}:="Approval Code"
		CCM_at_ResponseFieldDict{5}:="The six-digit alphanumeric authorization code"
		CCM_al_ResponseFields{6}:=6
		CCM_at_ResponseFieldName{6}:="AVS Result Code"
		CCM_at_ResponseFieldDict{6}:="Indicates the result of Address(AVS)checks:"+" A=Address(Street)matches, ZIP does not"+"B=Address information not provide"+"E=AVS error"+"G=Non-U.S. Card Issuing Bank"+"N=No Match on Address(Street)or ZIP"+"P=AVS not applicable for this tra"+"R=Retry – System unavailable or t"+"S=Service not supported by issuer"+"U=Address information is unavaila"+"W=0(Street)does not"+"X=Address(Street)and 9 digit ZIP match"+"Y=Address(Street)and 5 digit ZIP match"+"Z=0(Street)does not"
		CCM_al_ResponseFields{7}:=7
		CCM_at_ResponseFieldName{7}:="Transaction ID"
		CCM_at_ResponseFieldDict{7}:="This number identifies the tran"
		CCM_al_ResponseFields{8}:=8
		CCM_at_ResponseFieldName{8}:="Invoice Number"
		CCM_at_ResponseFieldDict{8}:=" from form input value fo"
		CCM_al_ResponseFields{9}:=9
		CCM_at_ResponseFieldName{9}:=""
		CCM_at_ResponseFieldDict{9}:="Echoed from form input value fo"
		CCM_al_ResponseFields{10}:=10
		CCM_at_ResponseFieldName{10}:="Amount"
		CCM_at_ResponseFieldDict{10}:="Echoed from form input value fo"
		CCM_al_ResponseFields{11}:=11
		CCM_at_ResponseFieldName{11}:="Method"
		CCM_at_ResponseFieldDict{11}:="Echoed from form input value "
		CCM_al_ResponseFields{12}:=12
		CCM_at_ResponseFieldName{12}:="Transaction Type"
		CCM_at_ResponseFieldDict{12}:="Echoed from form input value"
		CCM_al_ResponseFields{13}:=13
		CCM_at_ResponseFieldName{13}:="Customer ID"
		CCM_at_ResponseFieldDict{13}:="Echoed from form input value"
		CCM_al_ResponseFields{14}:=14
		CCM_at_ResponseFieldName{14}:="Cardholder First Name"
		CCM_at_ResponseFieldDict{15}:="Echoed from form input value"
		CCM_al_ResponseFields{15}:=15
		CCM_at_ResponseFieldName{15}:="Cardholder Last Name"
		CCM_at_ResponseFieldDict{15}:="Echoed from form input value"
		CCM_al_ResponseFields{16}:=16
		CCM_at_ResponseFieldName{16}:="Company"
		CCM_at_ResponseFieldDict{16}:="Echoed from form input value"
		CCM_al_ResponseFields{17}:=17
		CCM_at_ResponseFieldName{17}:="Billing Address"
		CCM_at_ResponseFieldDict{17}:="Echoed from form input value"
		CCM_al_ResponseFields{18}:=18
		CCM_at_ResponseFieldName{18}:="City"
		CCM_at_ResponseFieldDict{18}:="Echoed from form input value"
		CCM_al_ResponseFields{19}:=19
		CCM_at_ResponseFieldName{19}:="State"
		CCM_at_ResponseFieldDict{19}:="Echoed from form input value"
		CCM_al_ResponseFields{20}:=20
		CCM_at_ResponseFieldName{20}:="Zip"
		CCM_at_ResponseFieldDict{20}:="Echoed from form input value"
		CCM_al_ResponseFields{21}:=21
		CCM_at_ResponseFieldName{21}:="Country"
		CCM_at_ResponseFieldDict{21}:="Echoed from form input value"
		CCM_al_ResponseFields{22}:=22
		CCM_at_ResponseFieldName{22}:="Phone"
		CCM_at_ResponseFieldDict{22}:="Echoed from form input value"
		CCM_al_ResponseFields{23}:=23
		CCM_at_ResponseFieldName{23}:="Fax"
		CCM_at_ResponseFieldDict{23}:="Echoed from form input value"
		CCM_al_ResponseFields{24}:=24
		CCM_at_ResponseFieldName{24}:="Email"
		CCM_at_ResponseFieldDict{24}:="Echoed from form input value"
		CCM_al_ResponseFields{25}:=25
		CCM_at_ResponseFieldName{25}:="Ship to First Name"
		CCM_at_ResponseFieldDict{25}:="Echoed from form input value"
		CCM_al_ResponseFields{26}:=26
		CCM_at_ResponseFieldName{26}:="Ship to Last Name"
		CCM_at_ResponseFieldDict{26}:="Echoed from form input value"
		CCM_al_ResponseFields{27}:=27
		CCM_at_ResponseFieldName{27}:="Ship to Company"
		CCM_at_ResponseFieldDict{27}:="Echoed from form input value fo"
		CCM_al_ResponseFields{28}:=28
		CCM_at_ResponseFieldName{28}:="Ship to Address"
		CCM_at_ResponseFieldDict{28}:="Echoed from form input value fo"
		CCM_al_ResponseFields{29}:=29
		CCM_at_ResponseFieldName{29}:="Ship to City"
		CCM_at_ResponseFieldDict{29}:="Echoed from form input value fo"
		CCM_al_ResponseFields{30}:=30
		CCM_at_ResponseFieldName{30}:="Ship to State"
		CCM_at_ResponseFieldDict{30}:="Echoed from form input value fo"
		CCM_al_ResponseFields{31}:=31
		CCM_at_ResponseFieldName{31}:="Ship to Zip"
		CCM_at_ResponseFieldDict{31}:="Echoed from form input value fo"
		CCM_al_ResponseFields{32}:=32
		CCM_at_ResponseFieldName{32}:="Ship to Country"
		CCM_at_ResponseFieldDict{32}:="Echoed from form input value fo"
		CCM_al_ResponseFields{33}:=33
		CCM_at_ResponseFieldName{33}:="Tax Amount"
		CCM_at_ResponseFieldDict{33}:="Echoed from form input value fo"
		CCM_al_ResponseFields{34}:=34
		CCM_at_ResponseFieldName{34}:="Duty Amount"
		CCM_at_ResponseFieldDict{34}:="Echoed from form input value fo"
		CCM_al_ResponseFields{35}:=35
		CCM_at_ResponseFieldName{35}:="Freight Amount"
		CCM_at_ResponseFieldDict{35}:="Echoed from form input value fo"
		CCM_al_ResponseFields{36}:=36
		CCM_at_ResponseFieldName{36}:="Tax Exempt Flag"
		CCM_at_ResponseFieldDict{36}:="Echoed from form input value fo"
		CCM_al_ResponseFields{37}:=37
		CCM_at_ResponseFieldName{37}:="PO Number"
		CCM_at_ResponseFieldDict{37}:="Echoed from form input value fo"
		CCM_al_ResponseFields{38}:=38
		CCM_at_ResponseFieldName{38}:="MD5 Hash"
		CCM_at_ResponseFieldDict{38}:="System -generated hash that may be vali"
		CCM_al_ResponseFields{39}:=39
		
		CCM_at_ResponseFieldName{39}:="CVV2 Response Code"
		CCM_at_ResponseFieldDict{39}:="Indicates the results of Card C"+"M=Match"+"N=No Match"+"P=Not Processed"+"S=Should have been present"+"U=Issuer unable to process reques"
		CCM_al_ResponseFields{40}:=40
		
		CCM_at_ResponseFieldName{40}:="Cardholder Authentication Verif(CAVV)Response Code"
		CCM_at_ResponseFieldDict{40}:="Indicates the results of cardholder"+"Blank or not present=CAVV not validated"+"0=CAVV not validated because erro"+"1=CAVV failed validation"+"2=CAVV passed validation"+"3=CAVV validation could not be pe;issuer attempt incomplete"+"4=CAVV validation could not be pe;issuer system error"+"5=Reserved for future use"+"6=Reserved for future use"+"7=CAVV attempt-failed validation-issuer available(U.S.-issued card/non-U.S. acqui"+"rer)"+"8=CAVV attempt-passed validation-issuer available(U.S.-issued card/non-U.S. acqui"+"rer)"+"9=CAVV attempt-failed validation-issuer unavailable(U.S.-issued card/non-U.S. acq"+"uirer)"+"A=CAVV attempt-passed validation-issuer unavailable(U.S.-issued card/non-U.S. acq"+"uirer)"+"B=CAVV passed validation, informa"
		
		//```
		FIRST RECORD:C50([CCM_PSPTransaction:136])
		For ($_l_Index; 1; Records in selection:C76([CCM_PSPTransaction:136]))
			$CCM_T_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
			$_l_CharPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
			$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_CharPosition-1)
			$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharPosition+Length:C16("END REQUEST TYPE"))
			$_l_CharPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
			$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_CharPosition-1)
			$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_CharPosition+Length:C16("END REQUEST RESPONSE"))
			$_l_CharPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
			$_t_TRANSACTIONDETAILS:=Substring:C12($CCM_T_Response; 1; $_l_CharPosition-1)
			If ($_t_TRANSACTIONDETAILS#"")
				$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TRANSACTIONDETAILS; "Transaction")
				If ($_t_ResponseCodeSTR="Pending")
					$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $_t_TRANSACTIONDETAILS; "Transaction")
					//``````````
					//We go to paypal to get the transaction details....
					If (CCM_bo_ProvidorInited=False:C215)
						
						CCM_LoadServiceProvidersV11(True:C214)
						$_l_ServiceID:=[CCM_PSPTransaction:136]XPSPID:14
						$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
						
						CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
						CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_ServiceRow}
						CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_ServiceRow}
						CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_ServiceRow}
						CCM_l_RunTest:=CCM_al_TestMode{$_l_ServiceRow}
						CCM_ti_ReconcileTime:=Time:C179(Time string:C180(CCM_al_reconcileTime{$_l_ServiceRow}))
						CCM_bo_ProvidorInited:=True:C214
						
					End if 
					If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="timx_1334746876_biz_api1.me.com") | (CCM_l_RunTest=1)
						$_bo_inTest:=True:C214
					End if 
					$_bo_TestMode:=$_bo_inTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
					$_t_TRANSACTIONDETAILS2:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
					If ($_t_TRANSACTIONDETAILS2#"")
						$_t_TRANSACTIONDETAILS:=$_t_TRANSACTIONDETAILS2
					End if 
				End if 
			End if 
			$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TRANSACTIONDETAILS; "Transaction")
			$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TRANSACTIONDETAILS; "Transaction")
			
			Case of 
				: ($_t_ResponseCodeSTR="Pending")
					CCM_at_ResponseCodes{$_l_Index}:="Approved"
				: ($_t_ResponseCodeSTR="None")
					
					CCM_at_ResponseCodes{$_l_Index}:="No Status"
					
					
				: ($_t_ResponseCodeSTR="Canceled-Reversal")
					CCM_at_ResponseCodes{$_l_Index}:="A reversal is cancelled"
				: ($_t_ResponseCodeSTR="Completed")
					CCM_at_ResponseCodes{$_l_Index}:="Payment Completed"
					
				Else 
					CCM_at_ResponseCodes{$_l_Index}:=$_t_ResponseCodeSTR
			End case 
			//1  =  Approved
			//2=Declined$PPAmount:=CCM_ExtractField ("Paypal";"Amount";$CCM_T_Response;"DoDirectResponse")
			
			//3=Error
			CCM_ar_AuthAmount{$_l_Index}:=Num:C11(CCM_ExtractField("Paypal"; "Amount"; $_t_ResponseText; $_t_RequestModule))
			If (CCM_ar_AuthAmount{$_l_Index}=0)
				CCM_ar_AuthAmount{$_l_Index}:=Num:C11(CCM_ExtractField("Paypal"; "GrossAmount"; $_t_ResponseText; $_t_RequestModule))
			End if 
			CCM_at_ResponseSubCode{$_l_Index}:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TRANSACTIONDETAILS; "Transaction")
			
			CCM_at_ResponseReasonCode{$_l_Index}:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_ResponseReason{$_l_Index}:=""  //CCM_ExtractField ("Authorize Net";"Response Reason Text";$CCM_T_Response)
			CCM_at_ApprovalCode{$_l_Index}:=CCM_ExtractField("Paypal"; "TransactionID"; $_t_TRANSACTIONDETAILS; "Transaction")
			
			$_t_AVSResult:=CCM_ExtractField("Paypal"; "AVSCode"; $_t_ResponseText; $_t_RequestModule)
			Case of 
				: ($_t_AVSResult="A")
					CCM_at_AVSResult{$_l_Index}:="Address (Street) matches, ZIP does not"
				: ($_t_AVSResult="B")
					CCM_at_AVSResult{$_l_Index}:="Address information not provided for AVS check "
				: ($_t_AVSResult="C")
					CCM_at_AVSResult{$_l_Index}:="No "
				: ($_t_AVSResult="D")
					CCM_at_AVSResult{$_l_Index}:="Exact Match "
				: ($_t_AVSResult="E")
					CCM_at_AVSResult{$_l_Index}:="Notallowed for MOTO "
				: ($_t_AVSResult="F")
					CCM_at_AVSResult{$_l_Index}:="UK Address (Street) and 9 digit ZIP match "
				: ($_t_AVSResult="G")
					CCM_at_AVSResult{$_l_Index}:="(global)Non-U.S. Card Issuing Bank"
					
				: ($_t_AVSResult="I")
					CCM_at_AVSResult{$_l_Index}:="Non-U.S. Card Issuing Bank"
				: ($_t_AVSResult="M")
					CCM_at_AVSResult{$_l_Index}:="Address"
					
					
				: ($_t_AVSResult="N")
					CCM_at_AVSResult{$_l_Index}:="No "
					
					
				: ($_t_AVSResult="P")
					CCM_at_AVSResult{$_l_Index}:="Postal "
					
				: ($_t_AVSResult="R")
					CCM_at_AVSResult{$_l_Index}:="Retry – System unavailable or timed out "
					
				: ($_t_AVSResult="S")
					CCM_at_AVSResult{$_l_Index}:="Service not supported by issuer"
				: ($_t_AVSResult="U")
					CCM_at_AVSResult{$_l_Index}:="Address information is unavailable "
				: ($_t_AVSResult="W")
					CCM_at_AVSResult{$_l_Index}:="9 digit ZIP matches, Address (Street) does not "
				: ($_t_AVSResult="X")
					CCM_at_AVSResult{$_l_Index}:="Address (Street) and 9 digit ZIP match "
				: ($_t_AVSResult="Y")
					CCM_at_AVSResult{$_l_Index}:="Address (Street) and 5 digit ZIP match "
				: ($_t_AVSResult="Z")
					CCM_at_AVSResult{$_l_Index}:="5 digit ZIP matches, Address (Street) does not"
				Else 
					CCM_at_AVSResult{$_l_Index}:=$_t_AVSResult
			End case 
			//TRACE
			CCM_at_TransID{$_l_Index}:=CCM_ExtractField("Paypal"; "TransactionID"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_FirstName{$_l_Index}:=CCM_ExtractField("Paypal"; "PayerName/FirstName"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_LastName{$_l_Index}:=CCM_ExtractField("Paypal"; "PayerName/LastName"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_Company{$_l_Index}:=CCM_ExtractField("Paypal"; "PayerBusiness"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_Address{$_l_Index}:=CCM_ExtractField("Paypal"; "Address/Street1"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_City{$_l_Index}:=CCM_ExtractField("Paypal"; "Address/CityName"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_State{$_l_Index}:=CCM_ExtractField("Paypal"; "Address/StateOrProvince"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_Zip{$_l_Index}:=CCM_ExtractField("Paypal"; "Address/PostalCode"; $_t_TRANSACTIONDETAILS; "Transaction")
			CCM_at_Country{$_l_Index}:=CCM_ExtractField("Paypal"; "Address/CountryName"; $_t_TRANSACTIONDETAILS; "Transaction")
			$_t_CV2Response:=CCM_ExtractField("Paypal"; "CVV2Code"; $_t_ResponseText; $_t_RequestModule)
			Case of 
				: ($_t_CV2Response="M")
					CCM_at_CV2Response{$_l_Index}:="Match"
				: ($_t_CV2Response="N")
					CCM_at_CV2Response{$_l_Index}:="No Match"
				: ($_t_CV2Response="O")
					CCM_at_CV2Response{$_l_Index}:="Not Processed"
				: ($_t_CV2Response="S")
					CCM_at_CV2Response{$_l_Index}:="Should have been present"
				: ($_t_CV2Response="U")
					CCM_at_CV2Response{$_l_Index}:="Issuer unable to process"
				Else 
					CCM_at_CV2Response{$_l_Index}:="Unknown response"
			End case 
			If ([CONTACTS:1]x_ID:33#[CCM_PSPTransaction:136]xContactID:9) & ([CCM_PSPTransaction:136]xContactID:9#0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[CCM_PSPTransaction:136]xContactID:9)
				//I`f (CCM_at_FirstName{$_l_Index}="not"
			End if 
			If ([CCM_PSPTransaction:136]xContactID:9#0)
				CCM_at_ContactCode{$_l_Index}:=[CONTACTS:1]Contact_Code:2
			Else 
				CCM_at_ContactCode{$_l_Index}:=""
			End if 
			CCM_at_InvoiceCode{$_l_Index}:=[CCM_PSPTransaction:136]xInvoiceID:11
			CCM_at_DepositCode{$_l_Index}:=[CCM_PSPTransaction:136]xDepositCode:12
			CCM_at_ReceiptCode{$_l_Index}:=[CCM_PSPTransaction:136]xReceiptID:13
			If ([ORDERS:24]x_ID:58#[CCM_PSPTransaction:136]xOrderID:10) & ([CCM_PSPTransaction:136]xOrderID:10#0)
				QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[CCM_PSPTransaction:136]xOrderID:10)
			End if 
			If ([CCM_PSPTransaction:136]xOrderID:10#0)
				CCM_at_OrderCode{$_l_Index}:=[ORDERS:24]Order_Code:3
			Else 
				CCM_at_OrderCode{$_l_Index}:=[ORDERS:24]Order_Code:3
			End if 
			Case of 
				: ([CCM_PSPTransaction:136]XTransactionStatus:15=-1)
					CCM_at_Status{$_l_Index}:="Resolved Auth"
				: ([CCM_PSPTransaction:136]XTransactionStatus:15=-2)
					CCM_at_Status{$_l_Index}:="Cancelled Auth"
			End case 
			CCM_Ad_TransDate{$_l_Index}:=[CCM_PSPTransaction:136]TRANSACTION_DATE:2
			CCM_at_TransType{$_l_Index}:=[CCM_PSPTransaction:136]TRANSACTION_TYPE:3
			If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
				QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=[CCM_PSPTransaction:136]x_CCID:8)
			End if 
			
			
			CCM_DecryptCardNumber
			$_l_SecurityLevel:=4
			If (Length:C16(CC_T_CCX99999999999)>0)
				For ($_l_Index2; 1; Length:C16(CC_T_CCX99999999999))
					If (CC_T_CCX99999999999[[$_l_Index2]]=" ")
						$_l_SecurityLevel:=(Length:C16(CC_T_CCX99999999999))-$_l_Index2
					End if 
				End for 
			End if 
			
			CCM_T_CardNumber:=""
			If (CC_T_CCX99999999999#"")
				For ($_l_Index2; 1; (Length:C16(CC_T_CCX99999999999)-$_l_SecurityLevel))
					If (CC_T_CCX99999999999[[$_l_Index2]]#" ")
						CCM_T_CardNumber:=CCM_T_CardNumber+"X"
					Else 
						CCM_T_CardNumber:=CCM_T_CardNumber+" "
					End if 
				End for 
				
			End if 
			If ($_l_SecurityLevel>0) & (CC_T_CCX99999999999#"")
				CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_SecurityLevel); (Length:C16(CC_T_CCX99999999999)))
			End if 
			CCM_at_CreditCard{$_l_Index}:=CCM_T_CardNumber
			CCM_at_CreditCardType{$_l_Index}:=[xCreditCardDetails:132]Card_TypeName:5
			CCM_at_CreditCardissuer{$_l_Index}:=[xCreditCardDetails:132]Card_Issuer:6
			NEXT RECORD:C51([CCM_PSPTransaction:136])
			
		End for 
		
		//We will display fields
		
		//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
		LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 1; ->CCM_at_ResponseCodes; ->CCM_at_ResponseSubCode; ->CCM_at_ResponseReasonCode; ->CCM_at_ResponseReason; ->CCM_at_ApprovalCode; ->CCM_ar_AuthAmount; ->CCM_at_AVSResult; ->CCM_at_TransID; ->CCM_at_FirstName; ->CCM_at_LastName; ->CCM_at_Company)
		LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 12; ->CCM_at_Address; ->CCM_at_City; ->CCM_at_State; ->CCM_at_Zip; ->CCM_at_Country; ->CCM_at_CV2Response; ->CCM_at_ContactCode; ->CCM_at_InvoiceCode; ->CCM_at_DepositCode; ->CCM_at_ReceiptCode)
		LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 22; ->CCM_at_OrderCode; ->CCM_at_Status; ->CCM_at_CreditCard; ->CCM_at_CreditCardType; ->CCM_Ad_TransDate; ->CCM_at_TransType)
		LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 1; CCM_at_ResponseFieldName{1}; CCM_at_ResponseFieldName{2}; CCM_at_ResponseFieldName{3}; CCM_at_ResponseFieldName{4}; CCM_at_ResponseFieldName{5}; CCM_at_ResponseFieldName{10}; CCM_at_ResponseFieldName{6}; CCM_at_ResponseFieldName{7}; CCM_at_ResponseFieldName{14}; CCM_at_ResponseFieldName{15}; CCM_at_ResponseFieldName{16})
		LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 12; CCM_at_ResponseFieldName{17}; CCM_at_ResponseFieldName{18}; CCM_at_ResponseFieldName{19}; CCM_at_ResponseFieldName{20}; CCM_at_ResponseFieldName{21}; CCM_at_ResponseFieldName{39}; "Contact Code"; "Invoice No"; "Deposit No"; "Receipt No")
		LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 22; "Order Code"; "Status"; "Credit Card"; "Card Type"; "Date"; "Transaction Type")
		LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 1; 90; 100; 120; 250; 80; 50; 200; 80; 140; 140; 100)
		LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 12; 100; 100; 200; 60; 80; 130; 80; 80; 80; 80)
		LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 22; 80; 100; 160; 160; 60)
		LB_SetScroll(->CCM_LB_DetailsAL; -2; -2)
		LB_SetEnterable(->CCM_LB_DetailsAL; False:C215; 0; "")
		LBi_InclSetupJustStyle(->CCM_LB_DetailsAL)
	End if 
End if 
ERR_MethodTrackerReturn("CCM_DisplayActivityPP"; $_t_oldMethodName)