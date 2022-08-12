If (False:C215)
	//object Method Name: Object Name:      [USER].CCM_Activity.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 23:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(CCM_Ad_TransDate;0)
	ARRAY REAL:C219($_ar_AuthAmount; 0)
	//ARRAY REAL(CCM_ar_AuthAmount;0)
	ARRAY TEXT:C222($_at_Address; 0)
	ARRAY TEXT:C222($_at_ApprovalCode; 0)
	ARRAY TEXT:C222($_at_AVSResult; 0)
	ARRAY TEXT:C222($_at_City; 0)
	ARRAY TEXT:C222($_at_Company; 0)
	ARRAY TEXT:C222($_at_ContactCode; 0)
	ARRAY TEXT:C222($_at_Country; 0)
	ARRAY TEXT:C222($_at_CreditCard; 0)
	ARRAY TEXT:C222($_at_CreditCardissuer; 0)
	ARRAY TEXT:C222($_at_CreditCardType; 0)
	ARRAY TEXT:C222($_at_CV2Response; 0)
	ARRAY TEXT:C222($_at_DepositCode; 0)
	ARRAY TEXT:C222($_at_FirstName; 0)
	ARRAY TEXT:C222($_at_InvoiceCode; 0)
	ARRAY TEXT:C222($_at_LastName; 0)
	ARRAY TEXT:C222($_at_OrderCode; 0)
	ARRAY TEXT:C222($_at_ReceiptCode; 0)
	ARRAY TEXT:C222($_at_ResponseCodes; 0)
	ARRAY TEXT:C222($_at_ResponseReason; 0)
	ARRAY TEXT:C222($_at_ResponseReasonCode; 0)
	ARRAY TEXT:C222($_at_ResponseSubCode; 0)
	ARRAY TEXT:C222($_at_State; 0)
	ARRAY TEXT:C222($_at_Status; 0)
	ARRAY TEXT:C222($_at_TransID; 0)
	ARRAY TEXT:C222($_at_TransType; 0)
	ARRAY TEXT:C222($_at_ZIp; 0)
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
	//ARRAY TEXT(CCM_at_ResponseFieldName;0)
	//ARRAY TEXT(CCM_at_ResponseReason;0)
	//ARRAY TEXT(CCM_at_ResponseReasonCode;0)
	//ARRAY TEXT(CCM_at_ResponseSubCode;0)
	//ARRAY TEXT(CCM_at_State;0)
	//ARRAY TEXT(CCM_at_Status;0)
	//ARRAY TEXT(CCM_at_TransID;0)
	//ARRAY TEXT(CCM_at_TransType;0)
	//ARRAY TEXT(CCM_at_ZIp;0)
	C_LONGINT:C283($_l_AddMode; $_l_Index; $_l_RecordCount; $_l_TableNumber; vAdd; vNo)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t__WindowReference; $_t_CurrentOutputform; $_t_oldMethodName; CCM_t_PSPName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
	C_TIME:C306($_ti_DocumentReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Activity.Variable3"; Form event code:C388)
If (Gen_Option)
	
	Case of 
		: (CCM_t_PSPName="Transax")
		: (CCM_t_PSPName="Authorize net") | (CCM_t_PSPName="Paypal")
			//````
			ARRAY REAL:C219($_ar_AuthAmount; 0)
			ARRAY TEXT:C222($_at_ResponseCodes; 0)
			ARRAY TEXT:C222($_at_ResponseSubCode; 0)
			ARRAY TEXT:C222($_at_ResponseReasonCode; 0)
			ARRAY TEXT:C222($_at_ResponseReason; 0)
			ARRAY TEXT:C222($_at_ApprovalCode; 0)
			ARRAY TEXT:C222($_at_AVSResult; 0)
			ARRAY TEXT:C222($_at_TransID; 0)
			ARRAY TEXT:C222($_at_FirstName; 0)
			ARRAY TEXT:C222($_at_LastName; 0)
			ARRAY TEXT:C222($_at_Company; 0)
			ARRAY TEXT:C222($_at_Address; 0)
			ARRAY TEXT:C222($_at_City; 0)
			ARRAY TEXT:C222($_at_State; 0)
			ARRAY TEXT:C222($_at_ZIp; 0)
			ARRAY TEXT:C222($_at_Country; 0)
			ARRAY TEXT:C222($_at_CV2Response; 0)
			ARRAY TEXT:C222($_at_ContactCode; 0)
			ARRAY TEXT:C222($_at_InvoiceCode; 0)
			ARRAY TEXT:C222($_at_DepositCode; 0)
			ARRAY TEXT:C222($_at_ReceiptCode; 0)
			ARRAY TEXT:C222($_at_OrderCode; 0)
			ARRAY TEXT:C222($_at_Status; 0)
			ARRAY TEXT:C222($_at_CreditCard; 0)
			ARRAY TEXT:C222($_at_TransType; 0)
			ARRAY TEXT:C222($_at_CreditCardType; 0)
			ARRAY TEXT:C222($_at_CreditCardissuer; 0)
			//`
			COPY ARRAY:C226(CCM_ar_AuthAmount; $_ar_AuthAmount)
			COPY ARRAY:C226(CCM_at_ResponseCodes; $_at_ResponseCodes)
			COPY ARRAY:C226(CCM_at_ResponseSubCode; $_at_ResponseSubCode)
			COPY ARRAY:C226(CCM_at_ResponseReasonCode; $_at_ResponseReasonCode)
			COPY ARRAY:C226(CCM_at_ResponseReason; $_at_ResponseReason)
			COPY ARRAY:C226(CCM_at_ApprovalCode; $_at_ApprovalCode)
			COPY ARRAY:C226(CCM_at_AVSResult; $_at_AVSResult)
			COPY ARRAY:C226(CCM_at_TransID; $_at_TransID)
			COPY ARRAY:C226(CCM_at_FirstName; $_at_FirstName)
			COPY ARRAY:C226(CCM_at_LastName; $_at_LastName)
			COPY ARRAY:C226(CCM_at_Company; $_at_Company)
			COPY ARRAY:C226(CCM_at_Address; $_at_Address)
			COPY ARRAY:C226(CCM_at_City; $_at_City)
			COPY ARRAY:C226(CCM_at_State; $_at_State)
			COPY ARRAY:C226(CCM_at_ZIp; $_at_ZIp)
			COPY ARRAY:C226(CCM_at_Country; $_at_Country)
			COPY ARRAY:C226(CCM_at_CV2Response; $_at_CV2Response)
			COPY ARRAY:C226(CCM_at_ContactCode; $_at_ContactCode)
			COPY ARRAY:C226(CCM_at_InvoiceCode; $_at_InvoiceCode)
			COPY ARRAY:C226(CCM_at_DepositCode; $_at_DepositCode)
			COPY ARRAY:C226(CCM_at_ReceiptCode; $_at_ReceiptCode)
			COPY ARRAY:C226(CCM_at_OrderCode; $_at_OrderCode)
			COPY ARRAY:C226(CCM_at_Status; $_at_Status)
			COPY ARRAY:C226(CCM_at_CreditCard; $_at_CreditCard)
			COPY ARRAY:C226(CCM_at_TransType; $_at_TransType)
			COPY ARRAY:C226(CCM_at_CreditCardType; $_at_CreditCardType)
			COPY ARRAY:C226(CCM_at_CreditCardissuer; $_at_CreditCardissuer)
			
			//````
			//SuperReport (File($1);"";513+(8*Num(◊Screen="13")))
			// SRPurge
			READ WRITE:C146([DOCUMENTS:7])
			$_t_CurrentOutputform:=WIN_t_CurrentOutputform
			Reports_FileI
			FORM SET OUTPUT:C54([DOCUMENTS:7]; "Reports_Out")
			WIN_t_CurrentOutputform:="Reports_Out"
			
			$_l_TableNumber:=Table:C252(->[CCM_PSPTransaction:136])
			//  $_Ptr_Table:=vFilePtr
			$_l_RecordCount:=vNo
			vFilePtr:=->[CCM_PSPTransaction:136]
			$_l_AddMode:=vAdd
			Userset_Empty(->[DOCUMENTS:7])
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
			vNo:=Records in selection:C76([DOCUMENTS:7])
			$_l_AddMode:=Vadd
			If (vNo=0)
				Open_Pro_Window("Create a SuperReport"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)
				$_t__WindowReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
				vAdd:=1
				ADD RECORD:C56([DOCUMENTS:7]; *)
			Else 
				//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];"Reports_Out")
				$_t__WindowReference:=""
				//vAdd:=0
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[DOCUMENTS];"Reports_Out")
				DB_PrintSelectSRReport
				
			End if 
			Vadd:=$_l_AddMode
			If ($_t__WindowReference#"")
				Close_ProWin($_t__WindowReference)
			Else 
				//Close_ProWin
			End if 
			vAdd:=$_l_AddMode
			vNo:=$_l_RecordCount
			WIN_t_CurrentOutputform:=$_t_CurrentOutputform
			COPY ARRAY:C226($_ar_AuthAmount; CCM_ar_AuthAmount)
			COPY ARRAY:C226($_at_ResponseCodes; CCM_at_ResponseCodes)
			COPY ARRAY:C226($_at_ResponseSubCode; CCM_at_ResponseSubCode)
			COPY ARRAY:C226($_at_ResponseReasonCode; CCM_at_ResponseReasonCode)
			COPY ARRAY:C226($_at_ResponseReason; CCM_at_ResponseReason)
			COPY ARRAY:C226($_at_ApprovalCode; CCM_at_ApprovalCode)
			COPY ARRAY:C226($_at_AVSResult; CCM_at_AVSResult)
			COPY ARRAY:C226($_at_TransID; CCM_at_TransID)
			COPY ARRAY:C226($_at_FirstName; CCM_at_FirstName)
			COPY ARRAY:C226($_at_LastName; CCM_at_LastName)
			COPY ARRAY:C226($_at_Company; CCM_at_Company)
			COPY ARRAY:C226($_at_Address; CCM_at_Address)
			COPY ARRAY:C226($_at_City; CCM_at_City)
			COPY ARRAY:C226($_at_State; CCM_at_State)
			COPY ARRAY:C226($_at_ZIp; CCM_at_ZIp)
			COPY ARRAY:C226($_at_Country; CCM_at_Country)
			COPY ARRAY:C226($_at_CV2Response; CCM_at_CV2Response)
			COPY ARRAY:C226($_at_ContactCode; CCM_at_ContactCode)
			COPY ARRAY:C226($_at_InvoiceCode; CCM_at_InvoiceCode)
			COPY ARRAY:C226($_at_DepositCode; CCM_at_DepositCode)
			COPY ARRAY:C226($_at_ReceiptCode; CCM_at_ReceiptCode)
			COPY ARRAY:C226($_at_OrderCode; CCM_at_OrderCode)
			COPY ARRAY:C226($_at_Status; CCM_at_Status)
			COPY ARRAY:C226($_at_CreditCard; CCM_at_CreditCard)
			COPY ARRAY:C226($_at_TransType; CCM_at_TransType)
			COPY ARRAY:C226($_at_CreditCardType; CCM_at_CreditCardType)
			COPY ARRAY:C226($_at_CreditCardissuer; CCM_at_CreditCardissuer)
			
	End case 
Else 
	Case of 
		: (CCM_t_PSPName="Transax")
		: (CCM_t_PSPName="Authorize net") | (CCM_t_PSPName="Authorize net")
			$_ti_DocumentReference:=DB_CreateDocument(""; "TEXT"; "Credit Card Activity Report"; True:C214)
			
			If ($_ti_DocumentReference#?00:00:00?)
				
				SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseFieldName{1}+Char:C90(9)+CCM_at_ResponseFieldName{2}+Char:C90(9)+CCM_at_ResponseFieldName{3}+Char:C90(9)+CCM_at_ResponseFieldName{4}+Char:C90(9)+CCM_at_ResponseFieldName{5}+Char:C90(9)+CCM_at_ResponseFieldName{10}+Char:C90(9)+CCM_at_ResponseFieldName{6}+Char:C90(9)+CCM_at_ResponseFieldName{7}+Char:C90(9)+CCM_at_ResponseFieldName{14}+Char:C90(9)+CCM_at_ResponseFieldName{15}+Char:C90(9)+CCM_at_ResponseFieldName{16}+Char:C90(9))
				SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseFieldName{17}+Char:C90(9)+CCM_at_ResponseFieldName{18}+Char:C90(9)+CCM_at_ResponseFieldName{19}+Char:C90(9)+CCM_at_ResponseFieldName{20}+Char:C90(9)+CCM_at_ResponseFieldName{21}+Char:C90(9)+CCM_at_ResponseFieldName{39}+Char:C90(9)+"Contact Code"+Char:C90(9)+"Invoice No"+Char:C90(9)+"Deposit No"+Char:C90(9)+"Receipt No"+Char:C90(9))
				SEND PACKET:C103($_ti_DocumentReference; "Order Code"+Char:C90(9)+"Status"+Char:C90(9)+"Credit Card"+Char:C90(9)+"Card Type"+Char:C90(9)+"Card issuer"+Char:C90(9)+"Date"+Char:C90(9)+"Transaction Type"+Char:C90(13))
				
				For ($_l_Index; 1; Size of array:C274(CCM_at_ResponseCodes))
					//at the moment only using authorize.net
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseCodes{$_l_Index}+Char:C90(9)+CCM_at_ResponseSubCode{$_l_Index}+Char:C90(9)+CCM_at_ResponseReasonCode{$_l_Index}+Char:C90(9)+CCM_at_ResponseReason{$_l_Index}+Char:C90(9)+CCM_at_ApprovalCode{$_l_Index}+Char:C90(9)+String:C10(CCM_ar_AuthAmount{$_l_Index})+Char:C90(9)+CCM_at_AVSResult{$_l_Index}+Char:C90(9)+CCM_at_TransID{$_l_Index}+Char:C90(9)+CCM_at_FirstName{$_l_Index}+Char:C90(9)+CCM_at_LastName{$_l_Index}+Char:C90(9)+CCM_at_Company{$_l_Index}+Char:C90(9))
					
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_Address{$_l_Index}+Char:C90(9)+CCM_at_City{$_l_Index}+Char:C90(9)+CCM_at_State{$_l_Index}+Char:C90(9)+CCM_at_ZIp{$_l_Index}+Char:C90(9)+CCM_at_Country{$_l_Index}+Char:C90(9)+CCM_at_CV2Response{$_l_Index}+Char:C90(9)+CCM_at_ContactCode{$_l_Index}+Char:C90(9)+CCM_at_InvoiceCode{$_l_Index}+Char:C90(9)+CCM_at_DepositCode{$_l_Index}+Char:C90(9)+CCM_at_ReceiptCode{$_l_Index}+Char:C90(9))
					
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_OrderCode{$_l_Index}+Char:C90(9)+CCM_at_Status{$_l_Index}+Char:C90(9)+CCM_at_CreditCard{$_l_Index}+Char:C90(9)+CCM_at_CreditCardType{$_l_Index}+Char:C90(9)+CCM_at_CreditCardissuer{$_l_Index}+Char:C90(9)+String:C10(CCM_Ad_TransDate{$_l_Index})+Char:C90(9)+CCM_at_TransType{$_l_Index}+Char:C90(13))
					
				End for 
				CLOSE DOCUMENT:C267($_ti_DocumentReference)
				
			End if 
		: (CCM_t_PSPName="Paypal")
			$_ti_DocumentReference:=DB_CreateDocument(""; "TEXT"; "Credit Card Activity Report"; True:C214)
			
			If ($_ti_DocumentReference#?00:00:00?)
				//LB_SetColumnHeaders (->CCM_LB_DetailsAL;"CCM_L";1;CCM_at_ResponseFieldName{1};CCM_at_ResponseFieldName{2};CCM_at_ResponseFieldName{3};CCM_at_ResponseFieldName{4};CCM_at_ResponseFieldName{5};CCM_at_ResponseFieldName{10};CCM_at_ResponseFieldName{6};CCM_at_ResponseFieldName{7};CCM_at_ResponseFieldName{14};CCM_at_ResponseFieldName{15};CCM_at_ResponseFieldName{16})
				//LB_SetColumnHeaders (->CCM_LB_DetailsAL;"CCM_L";12;CCM_at_ResponseFieldName{17};CCM_at_ResponseFieldName{18};CCM_at_ResponseFieldName{19};CCM_at_ResponseFieldName{20};CCM_at_ResponseFieldName{21};CCM_at_ResponseFieldName{39};"Contact Code";"Invoice No";"Deposit No";"Receipt No")
				//LB_SetColumnHeaders (->CCM_LB_DetailsAL;"CCM_L";22;"Order Code";"Status";"Credit Card";"Card Type";"Date";"Transaction Type")
				
				//LB_SetColumnHeaders (->CCM_LB_DetailsAL;"CCM_L";22;"Order Code";"Status";"Credit Card";"Card Type";"Date";"Transaction Type")
				
				SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseFieldName{1}+Char:C90(9)+CCM_at_ResponseFieldName{2}+Char:C90(9)+CCM_at_ResponseFieldName{3}+Char:C90(9)+CCM_at_ResponseFieldName{4}+Char:C90(9)+CCM_at_ResponseFieldName{5}+Char:C90(9)+CCM_at_ResponseFieldName{10}+Char:C90(9)+CCM_at_ResponseFieldName{6}+Char:C90(9)+CCM_at_ResponseFieldName{7}+Char:C90(9)+CCM_at_ResponseFieldName{14}+Char:C90(9)+CCM_at_ResponseFieldName{15}+Char:C90(9)+CCM_at_ResponseFieldName{16}+Char:C90(9))
				SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseFieldName{17}+Char:C90(9)+CCM_at_ResponseFieldName{18}+Char:C90(9)+CCM_at_ResponseFieldName{19}+Char:C90(9)+CCM_at_ResponseFieldName{20}+Char:C90(9)+CCM_at_ResponseFieldName{21}+Char:C90(9)+CCM_at_ResponseFieldName{39}+Char:C90(9)+"Contact Code"+Char:C90(9)+"Invoice No"+Char:C90(9)+"Deposit No"+Char:C90(9)+"Receipt No"+Char:C90(9))
				SEND PACKET:C103($_ti_DocumentReference; "Order Code"+Char:C90(9)+"Status"+Char:C90(9)+"Credit Card"+Char:C90(9)+"Card Type"+Char:C90(9)+"Card issuer"+Char:C90(9)+"Date"+Char:C90(9)+"Transaction Type"+Char:C90(13))
				
				For ($_l_Index; 1; Size of array:C274(CCM_at_ResponseCodes))
					//at the moment only using authorize.net
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_ResponseCodes{$_l_Index}+Char:C90(9)+CCM_at_ResponseSubCode{$_l_Index}+Char:C90(9)+CCM_at_ResponseReasonCode{$_l_Index}+Char:C90(9)+CCM_at_ResponseReason{$_l_Index}+Char:C90(9)+CCM_at_ApprovalCode{$_l_Index}+Char:C90(9)+String:C10(CCM_ar_AuthAmount{$_l_Index})+Char:C90(9)+CCM_at_AVSResult{$_l_Index}+Char:C90(9)+CCM_at_TransID{$_l_Index}+Char:C90(9)+CCM_at_FirstName{$_l_Index}+Char:C90(9)+CCM_at_LastName{$_l_Index}+Char:C90(9)+CCM_at_Company{$_l_Index}+Char:C90(9))
					
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_Address{$_l_Index}+Char:C90(9)+CCM_at_City{$_l_Index}+Char:C90(9)+CCM_at_State{$_l_Index}+Char:C90(9)+CCM_at_ZIp{$_l_Index}+Char:C90(9)+CCM_at_Country{$_l_Index}+Char:C90(9)+CCM_at_CV2Response{$_l_Index}+Char:C90(9)+CCM_at_ContactCode{$_l_Index}+Char:C90(9)+CCM_at_InvoiceCode{$_l_Index}+Char:C90(9)+CCM_at_DepositCode{$_l_Index}+Char:C90(9)+CCM_at_ReceiptCode{$_l_Index}+Char:C90(9))
					
					SEND PACKET:C103($_ti_DocumentReference; CCM_at_OrderCode{$_l_Index}+Char:C90(9)+CCM_at_Status{$_l_Index}+Char:C90(9)+CCM_at_CreditCard{$_l_Index}+Char:C90(9)+CCM_at_CreditCardType{$_l_Index}+Char:C90(9)+CCM_at_CreditCardissuer{$_l_Index}+Char:C90(9)+String:C10(CCM_Ad_TransDate{$_l_Index})+Char:C90(9)+CCM_at_TransType{$_l_Index}+Char:C90(13))
					
				End for 
				CLOSE DOCUMENT:C267($_ti_DocumentReference)
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("OBJ:CCM_Activity,Bexport"; $_t_oldMethodName)
