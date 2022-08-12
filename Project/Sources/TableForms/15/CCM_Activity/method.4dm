If (False:C215)
	//Table Form Method Name: Object Name:      [USER].CCM_Activity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 13:06
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
	ARRAY TEXT:C222($_at_PSPs; 0)
	ARRAY TEXT:C222($_at_ReceiptCode; 0)
	ARRAY TEXT:C222($_at_ResponseCodes; 0)
	ARRAY TEXT:C222($_at_ResponseReason; 0)
	ARRAY TEXT:C222($_at_ResponseReasonCode; 0)
	ARRAY TEXT:C222($_at_ResponseSubCode; 0)
	ARRAY TEXT:C222($_at_State; 0)
	ARRAY TEXT:C222($_at_Status; 0)
	ARRAY TEXT:C222($_at_TransID; 0)
	ARRAY TEXT:C222($_at_TransType; 0)
	ARRAY TEXT:C222($_at_Zip; 0)
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
	//ARRAY TEXT(CCM_at_PSPs;0)
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_AddMode; $_l_ButtonFunction; $_l_event; $_l_Number; $_l_PSPIndex; $_l_TableNumber; CCM_l_DetailsAL; DB_l_ButtonClickedFunction; oOK; vAdd; vNo)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_CurrentOutputform; $_t_FormIdentity; $_t_FormReference; $_t_oldMethodName; CCM_t_PSPName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CCM_Activity"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "CCM_Activity")
		ARRAY REAL:C219(CCM_ar_AuthAmount; 0)
		ARRAY TEXT:C222(CCM_at_ResponseCodes; 0)
		ARRAY TEXT:C222(CCM_at_ResponseSubCode; 0)
		ARRAY TEXT:C222(CCM_at_ResponseReasonCode; 0)
		ARRAY TEXT:C222(CCM_at_ResponseReason; 0)
		ARRAY TEXT:C222(CCM_at_ApprovalCode; 0)
		ARRAY TEXT:C222(CCM_at_AVSResult; 0)
		ARRAY TEXT:C222(CCM_at_TransID; 0)
		ARRAY TEXT:C222(CCM_at_FirstName; 0)
		ARRAY TEXT:C222(CCM_at_LastName; 0)
		ARRAY TEXT:C222(CCM_at_Company; 0)
		ARRAY TEXT:C222(CCM_at_Address; 0)
		ARRAY TEXT:C222(CCM_at_City; 0)
		ARRAY TEXT:C222(CCM_at_State; 0)
		ARRAY TEXT:C222(CCM_at_ZIp; 0)
		ARRAY TEXT:C222(CCM_at_Country; 0)
		ARRAY TEXT:C222(CCM_at_CV2Response; 0)
		ARRAY TEXT:C222(CCM_at_ContactCode; 0)
		ARRAY TEXT:C222(CCM_at_InvoiceCode; 0)
		ARRAY TEXT:C222(CCM_at_DepositCode; 0)
		ARRAY TEXT:C222(CCM_at_ReceiptCode; 0)
		ARRAY TEXT:C222(CCM_at_OrderCode; 0)
		ARRAY TEXT:C222(CCM_at_Status; 0)
		ARRAY TEXT:C222(CCM_at_CreditCard; 0)
		ARRAY TEXT:C222(CCM_at_TransType; 0)
		ARRAY TEXT:C222(CCM_at_CreditCardType; 0)
		ARRAY TEXT:C222(CCM_at_CreditCardissuer; 0)
		ARRAY DATE:C224(CCM_Ad_TransDate; 0)
		
		DISTINCT VALUES:C339([CCM_PSPTransaction:136]PSPUSED:4; $_at_PSPs)
		If (Size of array:C274($_at_PSPs)=1)
			Case of 
				: ($_at_PSPs{1}="Authorize net")
					CCM_t_PSPName:="Authorize net"
					CCM_DisplayActivityAN("Authorize.net")  //the parameter is just to prevent invalid calls
					//AL_UpdateArrays (CCM_l_DetailsAL;-2)
					
				: ($_at_PSPs{1}="Transax")
					CCM_t_PSPName:="Transax"
					CCM_DisplayActivityTransax("Transax")
					
				: ($_at_PSPs{1}="Paypal")
					CCM_t_PSPName:="Paypal"
					CCM_DisplayActivityPP("Paypal")
					
					
			End case 
			ARRAY TEXT:C222(CCM_at_PSPs; 0)
			OBJECT SET VISIBLE:C603(CCM_at_PSPs; False:C215)
			
		Else 
			ARRAY TEXT:C222(CCM_at_PSPs; 0)
			For ($_l_PSPIndex; 1; Size of array:C274($_at_PSPs))
				APPEND TO ARRAY:C911(CCM_at_PSPs; $_at_PSPs{$_l_PSPIndex})
			End for 
			CCM_at_PSPs:=1
			If (Size of array:C274($_at_PSPs)>0)
				//CCM_DisplayActivityAN ("Authorize.net")  //the parameter is just to prevent invalid calls
				Case of 
					: ($_at_PSPs{1}="Authorize net")
						CCM_t_PSPName:="Authorize net"
						CCM_DisplayActivityAN("Authorize.net")  //the parameter is just to prevent invalid calls
						//AL_UpdateArrays (CCM_l_DetailsAL;-2)
						
					: ($_at_PSPs{1}="Transax")
						CCM_t_PSPName:="Transax"
						CCM_DisplayActivityTransax("Transax")
						
					: ($_at_PSPs{1}="Paypal")
						CCM_t_PSPName:="Paypal"
						CCM_DisplayActivityPP("Paypal")
						
						
				End case 
			End if 
			
		End if 
		
		//When displaying multiple PSP the screen will need a tab to disaplay the PSP names and the selection will load accorfing to the PSP selected
		//(MOST COMPANIES WOULD ONLY USE ONE HANDLING COMPANY
		
		
		//End if
		$_t_FormIdentity:="CCM_Activity"
		WS_AutoscreenSize(1; 600; 1400; Table name:C256(->[USER:15])+"_"+$_t_FormIdentity)
		INT_SetDialog
	: ($_l_event=On Outside Call:K2:11)
		$_l_ButtonFunction:=DB_l_ButtonClickedFunction
		DB_l_ButtonClickedFunction:=0
		Case of 
			: (($_l_ButtonFunction=DB_GetButtonFunction("OK")) | (oOK=1))
				CANCEL:C270
			: ($_l_ButtonFunction=DB_GetButtonFunction("Cancel"))
				CANCEL:C270
			: ($_l_ButtonFunction=DB_GetButtonFunction("Close"))
				CANCEL:C270
			: ($_l_ButtonFunction=DB_GetButtonFunction("Report"))
				//````
				Case of 
					: (CCM_t_PSPName="Transax")
					: (CCM_t_PSPName="Authorize net")
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
						ARRAY TEXT:C222($_at_Zip; 0)
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
						COPY ARRAY:C226(CCM_at_CITY; $_at_City)
						COPY ARRAY:C226(CCM_at_State; $_at_State)
						COPY ARRAY:C226(CCM_at_Zip; $_at_Zip)
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
						$_l_Number:=vNo
						vFilePtr:=->[CCM_PSPTransaction:136]
						$_l_AddMode:=vAdd
						Userset_Empty(->[DOCUMENTS:7])
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
						Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
						vNo:=Records in selection:C76([DOCUMENTS:7])
						$_l_AddMode:=Vadd
						If (vNo=0)
							Open_Pro_Window("Create a SuperReport"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)
							$_t_FormReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
							vAdd:=1
							ADD RECORD:C56([DOCUMENTS:7]; *)
						Else 
							//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];"Reports_Out")
							$_t_FormReference:=""
							//vAdd:=0
							//FS_SetFormSort (WIN_t_CurrentOutputform)
							//WIn_SetFormSize (1;->[DOCUMENTS];"Reports_Out")
							DB_PrintSelectSRReport
						End if 
						Vadd:=$_l_AddMode
						If ($_t_FormReference#"")
							Close_ProWin($_t_FormReference)
						Else 
							//Close_ProWin
						End if 
						vAdd:=$_l_AddMode
						vNo:=$_l_Number
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
						COPY ARRAY:C226($_at_City; CCM_at_CITY)
						COPY ARRAY:C226($_at_State; CCM_at_State)
						COPY ARRAY:C226($_at_Zip; CCM_at_Zip)
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
						
					: (CCM_t_PSPName="Paypal")
				End case 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:CCM_Activity"; $_t_oldMethodName)
