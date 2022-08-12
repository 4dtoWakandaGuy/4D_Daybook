//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DisplayActivityAN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 22:10`Method: CCM_DisplayActivityAN
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
	//ARRAY TEXT(CCM_at_ResponseFieldName;0)
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
	//ARRAY TEXT(CCM_at_ResponseReason;0)
	//ARRAY TEXT(CCM_at_ResponseReasonCode;0)
	//ARRAY TEXT(CCM_at_ResponseSubCode;0)
	//ARRAY TEXT(CCM_at_State;0)
	//ARRAY TEXT(CCM_at_Status;0)
	//ARRAY TEXT(CCM_at_TransID;0)
	//ARRAY TEXT(CCM_at_TransType;0)
	//ARRAY TEXT(CCM_at_ZIp;0)
	C_LONGINT:C283($_l_ArraySize; $_l_index; $_l_Index2; $_l_SecurityLevel; CCM_l_BUT1; CCM_l_BUT10; CCM_l_BUT11; CCM_l_BUT12; CCM_l_BUT13; CCM_l_BUT14; CCM_l_BUT15)
	C_LONGINT:C283(CCM_l_BUT16; CCM_l_BUT17; CCM_l_BUT18; CCM_l_BUT19; CCM_l_BUT2; CCM_l_BUT20; CCM_l_BUT21; CCM_l_BUT22; CCM_l_BUT23; CCM_l_BUT24; CCM_l_BUT25)
	C_LONGINT:C283(CCM_l_BUT26; CCM_l_BUT27; CCM_l_BUT3; CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8; CCM_l_BUT9)
	C_TEXT:C284($_t_AVSResult; $_t_CV2Response; $_t_oldMethodName; $_t_ResponseCode; $_t_ResponseReasonCodeSTR; $1; $CCM_T_Response; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_T_CardNumber; oCCM_COL1)
	C_TEXT:C284(oCCM_COL10; oCCM_COL11; oCCM_COL12; oCCM_COL13; oCCM_COL14; oCCM_COL15; oCCM_COL16; oCCM_COL17; oCCM_COL18; oCCM_COL19; oCCM_COL2)
	C_TEXT:C284(oCCM_COL20; oCCM_COL21; oCCM_COL22; oCCM_COL23; oCCM_COL24; oCCM_COL25; oCCM_COL26; oCCM_COL27; oCCM_COL3; oCCM_COL4; oCCM_COL5)
	C_TEXT:C284(oCCM_COL6; oCCM_COL7; oCCM_COL8; oCCM_COL9; oCCM_HED1; oCCM_HED10; oCCM_HED11; oCCM_HED12; oCCM_HED13; oCCM_HED14; oCCM_HED15)
	C_TEXT:C284(oCCM_HED16; oCCM_HED17; oCCM_HED18; oCCM_HED19; oCCM_HED2; oCCM_HED20; oCCM_HED21; oCCM_HED22; oCCM_HED23; oCCM_HED24; oCCM_HED25)
	C_TEXT:C284(oCCM_HED26; oCCM_HED27; oCCM_HED3; oCCM_HED4; oCCM_HED5; oCCM_HED6; oCCM_HED7; oCCM_HED8; oCCM_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DisplayActivityAN")

If (Count parameters:C259>=1)
	If ($1="Authorize.net")
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
		
		CCMAuthorizenetDefinitions
		FIRST RECORD:C50([CCM_PSPTransaction:136])
		For ($_l_index; 1; Records in selection:C76([CCM_PSPTransaction:136]))
			$CCM_T_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
			//Amount
			$_t_ResponseCode:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
			$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
			Case of 
				: ($_t_ResponseCode="1")
					CCM_at_ResponseCodes{$_l_index}:="Approved"
				: ($_t_ResponseCode="2")
					If ($_t_ResponseReasonCodeSTR#"27")
						CCM_at_ResponseCodes{$_l_index}:="Declined"
					Else 
						CCM_at_ResponseCodes{$_l_index}:="Declined-AVS failure (may be used without AVS)"
					End if 
					
				: ($_t_ResponseCode="3")
					CCM_at_ResponseCodes{$_l_index}:="Error"
				Else 
					CCM_at_ResponseCodes{$_l_index}:=$_t_ResponseCode
			End case 
			//1  =  Approved
			//2=Declined
			//3=Error
			CCM_ar_AuthAmount{$_l_index}:=Num:C11(CCM_ExtractField("Authorize Net"; "Amount"; $CCM_T_Response))
			CCM_at_ResponseSubCode{$_l_index}:=CCM_ExtractField("Authorize Net"; "Response Subcode"; $CCM_T_Response)
			CCM_at_ResponseReasonCode{$_l_index}:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
			CCM_at_ResponseReason{$_l_index}:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
			CCM_at_ApprovalCode{$_l_index}:=CCM_ExtractField("Authorize Net"; "Approval Code"; $CCM_T_Response)
			
			$_t_AVSResult:=CCM_ExtractField("Authorize Net"; "AVS Result Code"; $CCM_T_Response)
			Case of 
				: ($_t_AVSResult="A")
					CCM_at_AVSResult{$_l_index}:="Address (Street) matches, ZIP does not"
				: ($_t_AVSResult="B")
					CCM_at_AVSResult{$_l_index}:="Address information not provided for AVS check "
				: ($_t_AVSResult="E")
					CCM_at_AVSResult{$_l_index}:="AVS error "
				: ($_t_AVSResult="G")
					CCM_at_AVSResult{$_l_index}:="Non-U.S. Card Issuing Bank "
					
					
				: ($_t_AVSResult="N")
					CCM_at_AVSResult{$_l_index}:="No Match on Address (Street) or ZIP "
					
					
				: ($_t_AVSResult="P")
					CCM_at_AVSResult{$_l_index}:="AVS not applicable for this transaction "
					
				: ($_t_AVSResult="R")
					CCM_at_AVSResult{$_l_index}:="Retry – System unavailable or timed out "
					
				: ($_t_AVSResult="S")
					CCM_at_AVSResult{$_l_index}:="Service not supported by issuer"
				: ($_t_AVSResult="U")
					CCM_at_AVSResult{$_l_index}:="Address information is unavailable "
				: ($_t_AVSResult="W")
					CCM_at_AVSResult{$_l_index}:="9 digit ZIP matches, Address (Street) does not "
				: ($_t_AVSResult="X")
					CCM_at_AVSResult{$_l_index}:="Address (Street) and 9 digit ZIP match "
				: ($_t_AVSResult="Y")
					CCM_at_AVSResult{$_l_index}:="Address (Street) and 5 digit ZIP match "
				: ($_t_AVSResult="Z")
					CCM_at_AVSResult{$_l_index}:="5 digit ZIP matches, Address (Street) does not"
				Else 
					CCM_at_AVSResult{$_l_index}:=$_t_AVSResult
			End case 
			
			CCM_at_TransID{$_l_index}:=CCM_ExtractField("Authorize Net"; "Transaction ID"; $CCM_T_Response)
			CCM_at_FirstName{$_l_index}:=CCM_ExtractField("Authorize Net"; "Cardholder First Name"; $CCM_T_Response)
			CCM_at_LastName{$_l_index}:=CCM_ExtractField("Authorize Net"; "Cardholder Last Name"; $CCM_T_Response)
			CCM_at_Company{$_l_index}:=CCM_ExtractField("Authorize Net"; "Company"; $CCM_T_Response)
			CCM_at_Address{$_l_index}:=CCM_ExtractField("Authorize Net"; "Billing Address"; $CCM_T_Response)
			CCM_at_City{$_l_index}:=CCM_ExtractField("Authorize Net"; "City"; $CCM_T_Response)
			CCM_at_State{$_l_index}:=CCM_ExtractField("Authorize Net"; "State"; $CCM_T_Response)
			CCM_at_Zip{$_l_index}:=CCM_ExtractField("Authorize Net"; "Zip"; $CCM_T_Response)
			CCM_at_Country{$_l_index}:=CCM_ExtractField("Authorize Net"; "Country"; $CCM_T_Response)
			$_t_CV2Response:=CCM_ExtractField("Authorize Net"; "CVV2 Response Code"; $CCM_T_Response)
			Case of 
				: ($_t_CV2Response="M")
					CCM_at_CV2Response{$_l_index}:="Match"
				: ($_t_CV2Response="N")
					CCM_at_CV2Response{$_l_index}:="No Match"
				: ($_t_CV2Response="O")
					CCM_at_CV2Response{$_l_index}:="Not Processed"
				: ($_t_CV2Response="S")
					CCM_at_CV2Response{$_l_index}:="Should have been present"
				: ($_t_CV2Response="U")
					CCM_at_CV2Response{$_l_index}:="Issuer unable to process"
				Else 
					CCM_at_CV2Response{$_l_index}:="Unknown response"
			End case 
			If ([CONTACTS:1]x_ID:33#[CCM_PSPTransaction:136]xContactID:9) & ([CCM_PSPTransaction:136]xContactID:9#0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[CCM_PSPTransaction:136]xContactID:9)
			End if 
			If ([CCM_PSPTransaction:136]xContactID:9#0)
				CCM_at_ContactCode{$_l_index}:=[CONTACTS:1]Contact_Code:2
			Else 
				CCM_at_ContactCode{$_l_index}:=""
			End if 
			CCM_at_InvoiceCode{$_l_index}:=[CCM_PSPTransaction:136]xInvoiceID:11
			CCM_at_DepositCode{$_l_index}:=[CCM_PSPTransaction:136]xDepositCode:12
			CCM_at_ReceiptCode{$_l_index}:=[CCM_PSPTransaction:136]xReceiptID:13
			If ([ORDERS:24]x_ID:58#[CCM_PSPTransaction:136]xOrderID:10) & ([CCM_PSPTransaction:136]xOrderID:10#0)
				QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[CCM_PSPTransaction:136]xOrderID:10)
			End if 
			If ([CCM_PSPTransaction:136]xOrderID:10#0)
				CCM_at_OrderCode{$_l_index}:=[ORDERS:24]Order_Code:3
			Else 
				CCM_at_OrderCode{$_l_index}:=[ORDERS:24]Order_Code:3
			End if 
			Case of 
				: ([CCM_PSPTransaction:136]XTransactionStatus:15=-1)
					CCM_at_Status{$_l_index}:="Resolved Auth"
				: ([CCM_PSPTransaction:136]XTransactionStatus:15=-2)
					CCM_at_Status{$_l_index}:="Cancelled Auth"
			End case 
			CCM_Ad_TransDate{$_l_index}:=[CCM_PSPTransaction:136]TRANSACTION_DATE:2
			CCM_at_TransType{$_l_index}:=[CCM_PSPTransaction:136]TRANSACTION_TYPE:3
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
			CCM_at_CreditCard{$_l_index}:=CCM_T_CardNumber
			CCM_at_CreditCardType{$_l_index}:=[xCreditCardDetails:132]Card_TypeName:5
			CCM_at_CreditCardissuer{$_l_index}:=[xCreditCardDetails:132]Card_Issuer:6
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
ERR_MethodTrackerReturn("CCM_DisplayActivityAN"; $_t_oldMethodName)