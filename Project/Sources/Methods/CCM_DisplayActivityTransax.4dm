//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DisplayActivityTransax
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 11:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_LB_DetailsAL;0)
	//ARRAY DATE(CCM_Ad_TransDate;0)
	//ARRAY REAL(CCM_ar_AuthAmount;0)
	//ARRAY TEXT(CCM_at_Address;0)
	//ARRAY TEXT(CCM_at_ApprovalCode;0)
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
	//ARRAY TEXT(CCM_at_ResponseFields;0)
	//ARRAY TEXT(CCM_at_ResponseReason;0)
	//ARRAY TEXT(CCM_at_ResponseReasonCode;0)
	//ARRAY TEXT(CCM_at_ResponseSubCode;0)
	//ARRAY TEXT(CCM_At_Responsevalues;0)
	//ARRAY TEXT(CCM_at_SentFields;0)
	//ARRAY TEXT(CCM_At_Sentvalues;0)
	//ARRAY TEXT(CCM_at_State;0)
	//ARRAY TEXT(CCM_at_Status;0)
	//ARRAY TEXT(CCM_at_TransID;0)
	//ARRAY TEXT(CCM_at_TransType;0)
	//ARRAY TEXT(CCM_at_ZIp;0)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterIndex; $_l_FieldRow; $_l_PSPTransIndex; $_l_SecurityAllow; CCM_l_BUT1; CCM_l_BUT10; CCM_l_BUT11; CCM_l_BUT12; CCM_l_BUT13; CCM_l_BUT14)
	C_LONGINT:C283(CCM_l_BUT15; CCM_l_BUT16; CCM_l_BUT17; CCM_l_BUT18; CCM_l_BUT19; CCM_l_BUT2; CCM_l_BUT20; CCM_l_BUT21; CCM_l_BUT22; CCM_l_BUT23; CCM_l_BUT24)
	C_LONGINT:C283(CCM_l_BUT25; CCM_l_BUT26; CCM_l_BUT27; CCM_l_BUT3; CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8; CCM_l_BUT9; CCM_l_DetailsAL)
	C_TEXT:C284($_t_NulText; $_t_oldMethodName; $_t_ResponseCode; $_t_ResponseReasonCodeSTR; $1; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_T_CardNumber; oCCM_COL1; oCCM_COL10; oCCM_COL11)
	C_TEXT:C284(oCCM_COL12; oCCM_COL13; oCCM_COL14; oCCM_COL15; oCCM_COL16; oCCM_COL17; oCCM_COL18; oCCM_COL19; oCCM_COL2; oCCM_COL20; oCCM_COL21)
	C_TEXT:C284(oCCM_COL22; oCCM_COL23; oCCM_COL24; oCCM_COL25; oCCM_COL26; oCCM_COL27; oCCM_COL3; oCCM_COL4; oCCM_COL5; oCCM_COL6; oCCM_COL7)
	C_TEXT:C284(oCCM_COL8; oCCM_COL9; oCCM_HED1; oCCM_HED10; oCCM_HED11; oCCM_HED12; oCCM_HED13; oCCM_HED14; oCCM_HED15; oCCM_HED16; oCCM_HED17)
	C_TEXT:C284(oCCM_HED18; oCCM_HED19; oCCM_HED2; oCCM_HED20; oCCM_HED21; oCCM_HED22; oCCM_HED23; oCCM_HED24; oCCM_HED25; oCCM_HED26; oCCM_HED27)
	C_TEXT:C284(oCCM_HED3; oCCM_HED4; oCCM_HED5; oCCM_HED6; oCCM_HED7; oCCM_HED8; oCCM_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DisplayActivityTransax")

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
FIRST RECORD:C50([CCM_PSPTransaction:136])
For ($_l_PSPTransIndex; 1; Records in selection:C76([CCM_PSPTransaction:136]))
	ARRAY TEXT:C222(CCM_At_Responsevalues; 0)
	ARRAY TEXT:C222(CCM_at_ResponseFields; 0)
	
	$_t_NulText:=CCM_GetTransaxField(->[CCM_PSPTransaction:136]RESPONSEDATA:7; 1; ""; ->CCM_At_Responsevalues; ->CCM_at_ResponseFields)
	//Here we have an array of the fields
	ARRAY TEXT:C222(CCM_At_Sentvalues; 0)
	ARRAY TEXT:C222(CCM_at_SentFields; 0)
	
	$_t_NulText:=CCM_GetTransaxField(->[CCM_PSPTransaction:136]SENTDATA:6; 2; ""; ->CCM_At_Sentvalues; ->CCM_at_SentFields)
	
	
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "STATUS_CODE")
	If ($_l_FieldRow>0)
		$_t_ResponseCode:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		$_t_ResponseCode:="20"
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "STATUS_MSG")
	If ($_l_FieldRow>0)
		$_t_ResponseReasonCodeSTR:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		$_t_ResponseReasonCodeSTR:=""
	End if 
	
	Case of 
		: ($_t_ResponseCode="1")
			CCM_at_ResponseCodes{$_l_PSPTransIndex}:="Approved"
		: ($_t_ResponseCode="2")
			
			CCM_at_ResponseCodes{$_l_PSPTransIndex}:="Declined"
		: ($_t_ResponseCode="10")
			
			CCM_at_ResponseCodes{$_l_PSPTransIndex}:="Validation Error"
		: ($_t_ResponseCode="20")
			CCM_at_ResponseCodes{$_l_PSPTransIndex}:=" Data or System Error"
		Else 
			CCM_at_ResponseCodes{$_l_PSPTransIndex}:=$_t_ResponseCode
	End case 
	//1  =  Approved
	//2=Declined
	//3=Error
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "Amount")
	If ($_l_FieldRow>0)
		CCM_ar_AuthAmount{$_l_PSPTransIndex}:=Num:C11(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_ar_AuthAmount{$_l_PSPTransIndex}:=0
	End if 
	//CCM_at_ResponseSubCode{$_l_PSPTransIndex}:=CCM_ExtractField ("Authorize Net";"Response Subcode";$CCM_T_Response)
	//CCM_at_ResponseReasonCode{$_l_PSPTransIndex}:=CCM_ExtractField ("Authorize Net";"Response Reason Code";$CCM_T_Response)
	//CCM_at_ResponseReason{$_l_PSPTransIndex}:=CCM_ExtractField ("Authorize Net";"Response Reason Text";$CCM_T_Response)
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "AUTH CODE")
	If ($_l_FieldRow>0)
		CCM_at_ApprovalCode{$_l_PSPTransIndex}:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		CCM_at_ApprovalCode{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "AVS_MSG")
	If ($_l_FieldRow>0)
		CCM_at_AVSResult{$_l_PSPTransIndex}:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		CCM_at_AVSResult{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "TRANS_ID")
	If ($_l_FieldRow>0)
		CCM_at_TransID{$_l_PSPTransIndex}:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		CCM_at_TransID{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "FirstName")
	If ($_l_FieldRow>0)
		CCM_at_FirstName{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_FirstName{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "lastName")
	If ($_l_FieldRow>0)
		CCM_at_LastName{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_LastName{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "Company")
	If ($_l_FieldRow>0)
		CCM_at_Company{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_Company{$_l_PSPTransIndex}:=""
	End if 
	
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "Address1")
	If ($_l_FieldRow>0)
		CCM_at_Address{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_Address{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "City")
	If ($_l_FieldRow>0)
		CCM_at_City{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_City{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "State")
	If ($_l_FieldRow>0)
		CCM_at_State{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_State{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "ZIP")
	If ($_l_FieldRow>0)
		CCM_at_ZIp{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_ZIp{$_l_PSPTransIndex}:=""
	End if 
	$_l_FieldRow:=Find in array:C230(CCM_at_SentFields; "Country")
	If ($_l_FieldRow>0)
		CCM_at_COuntry{$_l_PSPTransIndex}:=(CCM_At_Sentvalues{$_l_FieldRow})
	Else 
		CCM_at_COuntry{$_l_PSPTransIndex}:=""
	End if 
	
	$_l_FieldRow:=Find in array:C230(CCM_at_ResponseFields; "CVV2_MSG")
	If ($_l_FieldRow>0)
		CCM_at_CV2Response{$_l_PSPTransIndex}:=(CCM_At_Responsevalues{$_l_FieldRow})
	Else 
		CCM_at_CV2Response{$_l_PSPTransIndex}:=""
	End if 
	
	
	If ([CONTACTS:1]x_ID:33#[CCM_PSPTransaction:136]xContactID:9) & ([CCM_PSPTransaction:136]xContactID:9#0)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[CCM_PSPTransaction:136]xContactID:9)
	End if 
	If ([CCM_PSPTransaction:136]xContactID:9#0)
		CCM_at_ContactCode{$_l_PSPTransIndex}:=[CONTACTS:1]Contact_Code:2
	Else 
		CCM_at_ContactCode{$_l_PSPTransIndex}:=""
	End if 
	CCM_at_InvoiceCode{$_l_PSPTransIndex}:=[CCM_PSPTransaction:136]xInvoiceID:11
	CCM_at_DepositCode{$_l_PSPTransIndex}:=[CCM_PSPTransaction:136]xDepositCode:12
	CCM_at_ReceiptCode{$_l_PSPTransIndex}:=[CCM_PSPTransaction:136]xReceiptID:13
	If ([ORDERS:24]x_ID:58#[CCM_PSPTransaction:136]xOrderID:10) & ([CCM_PSPTransaction:136]xOrderID:10#0)
		QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[CCM_PSPTransaction:136]xOrderID:10)
	End if 
	If ([CCM_PSPTransaction:136]xOrderID:10#0)
		CCM_at_OrderCode{$_l_PSPTransIndex}:=[ORDERS:24]Order_Code:3
	Else 
		CCM_at_OrderCode{$_l_PSPTransIndex}:=[ORDERS:24]Order_Code:3
	End if 
	Case of 
		: ([CCM_PSPTransaction:136]XTransactionStatus:15=-1)
			CCM_at_Status{$_l_PSPTransIndex}:="Resolved Auth"
		: ([CCM_PSPTransaction:136]XTransactionStatus:15=-2)
			CCM_at_Status{$_l_PSPTransIndex}:="Cancelled Auth"
	End case 
	CCM_Ad_TransDate{$_l_PSPTransIndex}:=[CCM_PSPTransaction:136]TRANSACTION_DATE:2
	CCM_at_TransType{$_l_PSPTransIndex}:=[CCM_PSPTransaction:136]TRANSACTION_TYPE:3
	If ([xCreditCardDetails:132]x_ID:1#[CCM_PSPTransaction:136]x_CCID:8)
		QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=[CCM_PSPTransaction:136]x_CCID:8)
	End if 
	
	
	CCM_DecryptCardNumber
	$_l_SecurityAllow:=4
	If (Length:C16(CC_T_CCX99999999999)>0)
		For ($_l_CharacterIndex; 1; Length:C16(CC_T_CCX99999999999))
			If (CC_T_CCX99999999999[[$_l_CharacterIndex]]=" ")
				$_l_SecurityAllow:=(Length:C16(CC_T_CCX99999999999))-$_l_CharacterIndex
			End if 
		End for 
	End if 
	
	CCM_T_CardNumber:=""
	If (CC_T_CCX99999999999#"")
		For ($_l_CharacterIndex; 1; (Length:C16(CC_T_CCX99999999999)-$_l_SecurityAllow))
			If (CC_T_CCX99999999999[[$_l_CharacterIndex]]#" ")
				CCM_T_CardNumber:=CCM_T_CardNumber+"X"
			Else 
				CCM_T_CardNumber:=CCM_T_CardNumber+" "
			End if 
		End for 
		
	End if 
	If ($_l_SecurityAllow>0) & (CC_T_CCX99999999999#"")
		CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_SecurityAllow); (Length:C16(CC_T_CCX99999999999)))
	End if 
	CCM_at_CreditCard{$_l_PSPTransIndex}:=CCM_T_CardNumber
	CCM_at_CreditCardType{$_l_PSPTransIndex}:=[xCreditCardDetails:132]Card_TypeName:5
	CCM_at_CreditCardissuer{$_l_PSPTransIndex}:=[xCreditCardDetails:132]Card_Issuer:6
	NEXT RECORD:C51([CCM_PSPTransaction:136])
	
End for 

//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 1; ->CCM_at_ResponseCodes; ->CCM_at_ResponseSubCode; ->CCM_at_ResponseReasonCode; ->CCM_at_ResponseReason; ->CCM_at_ApprovalCode; ->CCM_ar_AuthAmount; ->CCM_at_AVSResult; ->CCM_at_TransID; ->CCM_at_FirstName; ->CCM_at_LastName; ->CCM_at_Company)
LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 12; ->CCM_at_Address; ->CCM_at_City; ->CCM_at_State; ->CCM_at_ZIp; ->CCM_at_Country; ->CCM_at_CV2Response; ->CCM_at_ContactCode; ->CCM_at_InvoiceCode; ->CCM_at_DepositCode; ->CCM_at_ReceiptCode)
LB_SetupListbox(->CCM_LB_DetailsAL; "oCCM"; "CCM_L"; 22; ->CCM_at_OrderCode; ->CCM_at_Status; ->CCM_at_CreditCard; ->CCM_at_CreditCardType; ->CCM_Ad_TransDate; ->CCM_at_TransType)
LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 1; "STATUS CODE"; "NOT VISIBLE"; "NOT VISIBLE"; "STATUS MSG"; "AUTH CODE"; "AMOUNT"; "AVS MSG"; "TRANS ID"; "FIRST NAME"; "LAST NAME"; "COMPANY")
LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 12; "ADDRESS 1"; "CITY"; "STATE"; "ZIP"; "COUNTRY"; "CVV2 MSG"; "Contact Code"; "Invoice No"; "Deposit No"; "Receipt No")
LB_SetColumnHeaders(->CCM_LB_DetailsAL; "CCM_L"; 22; "Order Code"; "Status"; "Credit Card"; "Card Type"; "Date"; "Transaction Type")
LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 1; 90; 0; 0; 250; 80; 50; 200; 80; 140; 140; 100)

LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 12; 100; 100; 200; 60; 80; 130; 80; 80; 80; 80)
LB_SetColumnWidths(->CCM_LB_DetailsAL; "oCCM"; 22; 80; 100; 160; 160; 60)
LB_SetScroll(->CCM_LB_DetailsAL; -2; -2)
LB_Setdividers(->CCM_LB_DetailsAL; Black:K11:16; 32)
LB_SetEnterable(->CCM_LB_DetailsAL; False:C215; 0; "")
LB_SetColours(->CCM_LB_DetailsAL; Black:K11:16; Light grey:K11:13; Grey:K11:15)  // stripey - white font black/grey stipes
LBi_InclSetupJustStyle(->CCM_l_DetailsAL)
ERR_MethodTrackerReturn("CCM_DisplayActivityTransax"; $_t_oldMethodName)