//%attributes = {}
If (False:C215)
	//Project Method Name:      CCMGetAuth
	//------------------ Method Notes ------------------
	
	// Parameters
	// ----------------------------------------------------
	// Project method Amendments
	
	
	// Nigel Greenlee11/12/2009 18:24
	
	// Nigel Greenlee11/12/2009 18:49
	
	// Nigel Greenlee11/12/2009 19:04
	
	// Nigel Greenlee11/12/2009 20:04
	
	// Nigel Greenlee11/12/2009 20:12
	
	// Nigel Greenlee14/12/2009 14:23
	
	// Nigel Greenlee14/12/2009 14:25
	
	// Nigel Greenlee15/12/2009 08:39
	
	// Nigel Greenlee15/12/2009 08:43
	
	// Nigel Greenlee15/12/2009 08:55
	
	// Nigel Greenlee15/12/2009 10:24
	
	// Nigel Greenlee15/12/2009 10:38
	
	// Nigel Greenlee15/12/2009 10:51
	
	// Nigel Greenlee15/12/2009 10:59
	
	// Nigel Greenlee15/12/2009 11:02
	
	// Nigel Greenlee01/4/2010 17:32
	
	// Nigel Greenlee18/11/2010 15:33
	
	// Nigel Greenlee 20/11/2010 07:09
	
	// Nigel Greenlee22/8/2011 09:35 v8.0.0/1
	
	
	
	// Nigel Greenlee11/4/2012 17:31 v7.0.0/1
	
	
	
	// Nigel Greenlee12/4/2012 10:34 v7.0.0/1
	
	
	// Nigel Greenlee12/4/2012 16:52 v7.0.0/1
	// Deleted
	// (1588): ($_t_CV2Reponse="X")
	// (1617)$_t_ResponseString:="Note this is an immitation transaction"
	// (1629)If (False)
	// (1645)End if
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 17:09  `Method: CCMGetAuth
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	//ARRAY LONGINT(CCM_al_ActiveServiceIDs;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CCM_at_ActiveServices;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthorizationProvider;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BLOB:C604(CCM_bl_SentData; CCM_Bl_TransRecord; CCM_Bl_TransResponse)
	C_BOOLEAN:C305(<>CCM_bo_Inited; <>DB_bo_PrefsLoaded; <>ViewLists; $_bo_AVSReprocess; $_bo_Continue; $_bo_DisableAVSTEMP; $_bo_Failed; $_bo_InTest; $_bo_NoCVSError; $_bo_NoError; $_bo_Reject)
	C_BOOLEAN:C305($_bo_Retry; $_bo_TestMode; $_bo_Unload; $_bo_ViewLists; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; CCM_bo_IsLicenced; CCM_bo_OfflineHandling; CCM_bo_SendAddress; CCM_bo_useAVS; CCM_bo_useCV2)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($_l_ContactID; $_l_CurrentWinRefOLD; $_l_DotPosition; $_l_Element; $_l_Index; $_l_MonthExpires; $_l_MonthNumber; $_l_offset; $_l_OrderID; $_l_ResponseCode; $_l_ServiceID)
	C_LONGINT:C283($_l_ServiceRow; $_l_YearExpires; $_l_YearNumber; $0; $3; $4; AAofflineID; CCM_l_OrderID; CCM_l_RejectedID; CCM_l_RunTest; CCM_l_TransrecordID)
	C_LONGINT:C283(PER_l_Context; vP; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301(CCM_p_TransRecordPTR; CCM_p_TransRecordRETPTR)
	C_REAL:C285($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_ANTransID; $_t_AVSResult; $_t_CardExpires; $_t_CardType; $_t_CCMText; $_t_CompanyName; $_t_CurrentInputForm; $_t_CurrentOutputForm; $_t_CV2Code; $_t_CV2Reponse)
	C_TEXT:C284($_t_DepositID; $_t_EmailAddress; $_t_ExpiresSTR; $_t_InvoiceID; $_t_MonthExpiresSTR; $_t_MonthSTR; $_t_NameOnCard; $_t_oldMethodName; $_t_PPTransID; $_t_ReceiptID; $_t_ResponseCodeSTR)
	C_TEXT:C284($_t_ResponseReasonCodeSTR; $_t_ResponseString; $_t_ResponseSubtext; $_t_TransactionDetails; $_t_TransactionID; $_t_TRTransID; $_t_YearExpiresSTR; $_t_YearSTR; $2; $5; $6)
	C_TEXT:C284($7; $CC_T_CCX99999999999; $CCM_T_Response; CC_T_CCX99999999999; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AVSResult)
	C_TEXT:C284(CCM_t_Country; CCM_t_CountryISO; CCM_t_County; CCM_t_CurrencyCode; CCM_t_CV2Response; CCM_t_FAILCode; CCM_t_FirstName; CCM_t_ISOCurrencyCode; CCM_t_LastName; CCM_t_PostalCode; CCM_t_Title)
	C_TEXT:C284(CCM_t_Town; CCM_T_xxxNameOnCard; DB_t_WindowTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCMGetAuth")


$_bo_InTest:=False:C215

If (Not:C34(<>CCM_bo_Inited))
	CCM_InitCreditCardModule
End if 


// this is a temporary change
If (Not:C34(<>DB_bo_PrefsLoaded))
	DB_LoadErrorTrackPrefs
End if 



If (Count parameters:C259>=4)
	$_l_ContactID:=$4
	
	If (Count parameters:C259>=5)
		$_t_InvoiceID:=$5
		
		If (Count parameters:C259>=6)
			$_t_DepositID:=$6
			
			If (Count parameters:C259>=7)
				$_t_ReceiptID:=$7
				
				
			Else 
				$_t_ReceiptID:=""
			End if 
			
		Else 
			$_t_ReceiptID:=""
			$_t_DepositID:=""
		End if 
	Else 
		$_t_ReceiptID:=""
		$_t_InvoiceID:=""
		$_t_DepositID:=""
	End if 
Else 
	$_t_ReceiptID:=""
	$_l_OrderID:=0
	$_t_InvoiceID:=""
	$_t_DepositID:=""
End if 
// the contact ID to put on the cc transactions is extracted from the card(
CCM_LoadServiceProvidersV11(True:C214)

ARRAY TEXT:C222(CCM_at_ActiveServices; 0)
ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; 0)
ARRAY TEXT:C222(CCM_at_ActiveServices; Size of array:C274(CCM_al_Services))
ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; Size of array:C274(CCM_al_Services))
$_l_Element:=0
$0:=0
For ($_l_Index; 1; Size of array:C274(CCM_al_Services))
	If (CCM_abo_AuthActive{$_l_Index})
		$_l_Element:=$_l_Element+1
		CCM_at_ActiveServices{$_l_Element}:=CCM_at_AuthNames{$_l_Index}
		CCM_al_ActiveServiceIDs{$_l_Element}:=CCM_al_Services{$_l_Index}
	End if 
	
End for 
ARRAY TEXT:C222(CCM_at_ActiveServices; $_l_Element)
ARRAY LONGINT:C221(CCM_al_ActiveServiceIDs; $_l_Element)
//   ```````

Case of 
	: (Size of array:C274(CCM_al_ActiveServiceIDs)=1)
		$_l_ServiceID:=CCM_al_ActiveServiceIDs{1}
		
	: (Size of array:C274(CCM_al_ActiveServiceIDs)>1)  // ask which to use
		$_l_ServiceID:=CCM_al_ActiveServiceIDs{1}
		ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
		COPY ARRAY:C226(CCM_at_ActiveServices; GEN_at_DropDownMenu)
		COPY ARRAY:C226(CCM_al_ActiveServiceIDs; GEN_al_DropDownMenuID)
		DB_t_WindowTitle:="Select service to use"
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
		GEN_Bo_ShowCreate:=False:C215
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (GEN_at_DropDownMenu>0)
			$_l_ServiceID:=GEN_al_DropDownMenuID{GEN_at_DropDownMenu}
		End if 
	Else 
		$_l_ServiceID:=0
		Gen_Alert("You must set up a service first. Check with you administrator")
End case 
If ($_l_ServiceID>0)
	$_l_ServiceRow:=Find in array:C230(CCM_al_Services; $_l_ServiceID)
	CCM_t_AuthorizationProvider:=CCM_at_AuthProviderName{$_l_ServiceRow}
	CCM_t_AuthorizationLogin:=CCM_at_AuthLogins{$_l_ServiceRow}
	CCM_t_AuthorizationPass:=CCM_at_AuthPasswords{$_l_ServiceRow}
	CCM_t_AuthorizationPassID:=CCM_at_AuthIDs{$_l_ServiceRow}
	CCM_l_RunTest:=CCM_al_TestMode{$_l_ServiceRow}
	If ([xCreditCardDetails:132]x_ID:1#$3)
		QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
	End if 
	$_bo_DisableAVSTEMP:=False:C215
	
	If (CCM_bo_useAVS) & (Not:C34(CCM_bo_DisableAVSTEMP))
		
		$_bo_Continue:=CCM_GetAddress([xCreditCardDetails:132]x_ID:1; ->CCM_t_AddressLine1; ->CCM_t_Town; ->CCM_t_County; ->CCM_t_PostalCode; ->CCM_t_CountryISO)
		
		If (CCM_t_CountryISO#"")
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			READ ONLY:C145([USER:15])
			ALL RECORDS:C47([USER:15])  // only one record
			QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[USER:15]Country:7)
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			If ([COUNTRIES:73]ISO_Code:6#CCM_t_CountryISO)  // address is not in the default format country so not point trying avs
				$_bo_DisableAVSTEMP:=True:C214
			End if 
		End if 
		If ([xCreditCardDetails:132]xAVSStatus:19#"") & (Not:C34($_bo_DisableAVSTEMP))
			// There is an AVS problem with this card OR the card is overseas
			If ([xCreditCardDetails:132]xAVSStatus:19[[1]]="-")
				Gen_Confirm("There was a previous overridden address verification failure on this card. Do you "+"wish to"+" continue without address v"+"erification for this authorization?"; "Yes"; "No")
				If (OK=1)
					CCM_bo_DisableAVSTEMP:=True:C214
					$_bo_Continue:=True:C214
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				Gen_Confirm("There was a previous address verification failure on this card leading to a rejec"+"tion. Do you "+"wish to continue without address verification for this authorization?"; "No"; "Yes")
				If (OK=0)
					CCM_bo_DisableAVSTEMP:=True:C214
					$_bo_Continue:=True:C214
					OK:=1
				Else 
					$_bo_Continue:=False:C215
				End if 
			End if 
		Else 
			$_bo_Continue:=True:C214
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		CCM_DecryptCardNumber
		$_t_NameOnCard:=CCM_DecryptCardName
		$_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
		$_t_YearSTR:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
		If (Length:C16($_t_YearSTR)=4)
			$_t_YearSTR:=Substring:C12($_t_YearSTR; 3; 2)
		End if 
		$_t_MonthSTR:=String:C10(Month of:C24([xCreditCardDetails:132]EndDate:8))
		If (Length:C16($_t_MonthSTR)=1)
			$_t_MonthSTR:="0"+$_t_MonthSTR
		End if 
		$_t_CardExpires:=$_t_MonthSTR+"/"+$_t_YearSTR  // This may not be the correctFORMAT for transax
		$CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; " "; "")
		CCM_t_CurrencyCode:=$2
		If (CCM_t_CurrencyCode="")
			CCM_t_CurrencyCode:=<>SYS_t_BaseCurrency
		End if 
		If ([CURRENCIES:71]Currency_Code:1#CCM_t_CurrencyCode)
			
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CCM_t_CurrencyCode)
		End if 
		
		If ([CURRENCIES:71]ISO_Currency_Code:8="")
			Gen_Alert("The ISO currency code is not known for "+CCM_t_CurrencyCode+Char:C90(13)+" This must be set to process a credit card authorization"+Char:C90(13)+" It will only need to be"+" set once")
			//$CurrentDefault:=Current default table
			$_bo_ViewLists:=<>ViewLists
			Repeat 
				
				$_t_CurrentInputForm:=WIN_t_CurrentInputForm
				$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
				
				READ WRITE:C146([CURRENCIES:71])
				LOAD RECORD:C52([CURRENCIES:71])
				$_bo_ViewLists:=<>ViewLists  // Disable so we always get an input form
				PER_l_Context:=1
				<>ViewLists:=False:C215
				Gen_Mod("Edit Currency"; "Currency_File"; "MasterCur"; ->[CURRENCIES:71]; ->vP; ""; "Currency Modify")
				<>ViewLists:=$_bo_ViewLists
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CCM_t_CurrencyCode)
				If ([CURRENCIES:71]ISO_Currency_Code:8="")
					Gen_Confirm("Sorry you must set this to continue"; "Try Again"; "Stop")
					If (OK=0)
						CCM_t_ISOCurrencyCode:="NUL"
					End if 
				Else 
					CCM_t_ISOCurrencyCode:=[CURRENCIES:71]ISO_Currency_Code:8
				End if 
			Until (CCM_t_ISOCurrencyCode#"")
			
			//DEFAULT TABLE($CurrentDefault->)
			
		Else 
			CCM_t_ISOCurrencyCode:=[CURRENCIES:71]ISO_Currency_Code:8
		End if 
		
		If (CCM_t_ISOCurrencyCode#"NUL")
			
			Case of 
				: (CCM_t_AuthorizationProvider="Transax")
					If (CCM_t_ISOCurrencyCode#"USD")
						// must convert from currency to USD at current rate
						
					End if 
					//   ``
					AA_LoadNameArrays
					$_t_EmailAddress:=""
					$_t_CompanyName:=""
					CCM_T_xxxNameOnCard:=$_t_NameOnCard
					CCM_t_FirstName:=""
					CCM_t_LastName:=""
					CCM_t_Title:=""
					AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
					CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
					CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
					
					//   ``
					CCM_bo_SendAddress:=True:C214
					If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
						CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
						
						CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
						CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
						CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
						CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
						// $Temp2:=ERR_MethodTracker ("Send Street address")
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							CCM_bo_SendAddress:=True:C214
						End if 
					End if 
					//   ``
					$_t_CV2Code:=""
					If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  // no point in CVV2 on a test trans
						Repeat 
							$_t_CV2Code:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
							If (Length:C16($_t_CV2Code)#3)
								If (Length:C16($_t_CV2Code)#4)
									Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
								End if 
							End if 
						Until (Length:C16($_t_CV2Code)=3) | (Length:C16($_t_CV2Code)=4)
					End if 
					//   ``
					If ($_l_ContactID>0)
						If ($_l_ContactID#[CONTACTS:1]x_ID:33)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
						End if 
						If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
						End if 
						If ([CONTACTS:1]Email_Address:35#"")
							If (Length:C16([CONTACTS:1]Email_Address:35)>3)
								$_l_DotPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
								If ($_l_DotPosition>0)
									// $Temp2:=ERR_MethodTracker ("Send Email"+[CONTACTS]EmailAddress)
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
										
									End if 
								End if 
							End if 
						End if 
						
						If ([COMPANIES:2]Private:37=False:C215)
							If ([COMPANIES:2]Company_Name:2#"")
								$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
								
							End if 
							
						End if 
					End if 
					
					//   ``
					If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="transaxdemo") | (CCM_l_RunTest=1)
						$_d_CurrentDate:=Current date:C33(*)
						$_l_YearNumber:=Year of:C25($_d_CurrentDate)
						$_l_YearNumber:=$_l_YearNumber+1
						
						$_l_MonthNumber:=Month of:C24(Current date:C33(*))
						$_t_ExpiresSTR:=String:C10($_l_MonthNumber)+Substring:C12(String:C10($_l_YearNumber); 3; 2)
						$_t_TransactionID:=CCM_transaxsubmit("auth"; CCM_t_AuthorizationLogin; "nelix123"; $1; ""; CCM_t_FirstName; CCM_t_LastName; "4111111111111111"; $_t_ExpiresSTR)
						
					Else 
						$_t_CardExpires:=Replace string:C233($_t_CardExpires; "/"; "")
						// This may not be the correctFORMAT for transax
						If (CCM_bo_SendAddress)
							$_t_TransactionID:=CCM_transaxsubmit("auth"; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; $1; ""; CCM_t_FirstName; CCM_t_LastName; $CC_T_CCX99999999999; $_t_CardExpires; $_t_CV2Code; $_t_EmailAddress; $_t_CompanyName; CCM_t_AddressLine1; ""; CCM_t_Town; CCM_t_County; CCM_t_PostalCode; CCM_t_Country)
							
						Else 
							$_t_TransactionID:=CCM_transaxsubmit("auth"; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; $1; ""; CCM_t_FirstName; CCM_t_LastName; $CC_T_CCX99999999999; $_t_CardExpires; $_t_CV2Code; $_t_EmailAddress; $_t_CompanyName)
						End if 
					End if 
				: (CCM_t_AuthorizationProvider="Authorize Net")
					
					
					If (CCM_t_ISOCurrencyCode="USD")
						$_bo_InTest:=False:C215
						If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="92KgL2uD") | (CCM_l_RunTest=1)
							
							$_bo_InTest:=True:C214
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								CCM_l_TransrecordID:=CCM_AN_Initiate
								Case of 
									: (CCM_t_AuthorizationLogin="92KgL2uD")
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($1); "x_card_num"; "4007000000027"; "x_exp_date"; $_t_CardExpires)
									Else 
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($1); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpires)
								End case 
								
							End if 
						Else 
							
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								CCM_l_TransrecordID:=CCM_AN_Initiate
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($1); "x_card_num"; $CC_T_CCX99999999999; "x_exp_date"; $_t_CardExpires)
							End if 
						End if 
						
						If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="92KgL2uD") | (CCM_l_RunTest=1)
							If (Current user:C182#"Designer") & (Not:C34(CCM_l_RunTest=1))
								Gen_Alert("WARNING:"+" The credit card module is not licenced, this will operate in test mode")
								$_bo_InTest:=True:C214
							Else 
								$_bo_InTest:=True:C214
								If (CCM_l_RunTest=1)
									Gen_Alert("WARNING:"+" The credit card module is set to operate in test mode")
								End if 
								
							End if 
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								If (CCM_l_RunTest=1)
									CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_test_request"; "TRUE")
								End if 
								
							End if 
							
						End if 
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_type"; "AUTH_ONLY")
							
						End if 
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_tran_key"; CCM_t_AuthorizationPass)
						End if 
						If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  // no point in CVV2 on a test trans
							Repeat 
								$_t_CV2Code:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
								If (Length:C16($_t_CV2Code)#3)
									If (Length:C16($_t_CV2Code)#4)
										Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
									End if 
								End if 
							Until (Length:C16($_t_CV2Code)=3) | (Length:C16($_t_CV2Code)=4)
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_code"; $_t_CV2Code)
							End if 
						End if 
						If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
							CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
							CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
							CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
							CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
							CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
							// $Temp2:=ERR_MethodTracker ("Send Street address")
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_address"; CCM_t_AddressLine1)
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_city"; CCM_t_Town)
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_state"; CCM_t_County)
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_zip"; CCM_t_PostalCode)
								CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_country"; CCM_t_CountryISO)
							End if 
						End if 
						AA_LoadNameArrays
						CCM_T_xxxNameOnCard:=$_t_NameOnCard
						CCM_t_FirstName:=""
						CCM_t_LastName:=""
						CCM_t_Title:=""
						AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
						CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
						CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
						
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_first_name"; CCM_t_FirstName)
						End if 
						
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_last_name"; CCM_t_LastName)
						End if 
						If ($_l_ContactID>0)
							If ($_l_ContactID#[CONTACTS:1]x_ID:33)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
							End if 
							If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
							End if 
							If ([CONTACTS:1]Email_Address:35#"")
								If (Length:C16([CONTACTS:1]Email_Address:35)>3)
									$_l_DotPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
									If ($_l_DotPosition>0)
										// $Temp2:=ERR_MethodTracker ("Send Email"+[CONTACTS]EmailAddress)
										If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_email"; [CONTACTS:1]Email_Address:35)
											CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_email_customer"; "TRUE")
											
										End if 
									End if 
								End if 
							End if 
							
							If ([COMPANIES:2]Private:37=False:C215)
								If ([COMPANIES:2]Company_Name:2#"")
									$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
									// $Temp2:=ERR_MethodTracker ("Send company name"+$_t_CompanyName)
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
										CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_company"; $_t_CompanyName)
										
									End if 
								End if 
								
							End if 
						End if 
						SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
						CCM_p_TransRecordRETPTR:=->CCM_Bl_TransResponse
					Else 
						// if it is not dollars it goes through world pay which is the same company
						// $Temp2:=ERR_MethodTracker ("Its not dollars")
						
						CCM_t_AuthorizationProvider:="Worldpay"
					End if 
					
				: (CCM_t_AuthorizationProvider="Planet Payment")
					
				: (CCM_t_AuthorizationProvider="e-xact")
					
				: (CCM_t_AuthorizationProvider="Link Point")
					
				: (CCM_t_AuthorizationProvider="Worldpay")
					
				: (CCM_t_AuthorizationProvider="ION Gate")
					
				: (CCM_t_AuthorizationProvider="Firepay")
					
				: (CCM_t_AuthorizationProvider="Surepay")
					
				: (CCM_t_AuthorizationProvider="Paypal")
					
					
					$_bo_InTest:=False:C215
					$_l_MonthExpires:=Num:C11($_t_MonthSTR)
					$_l_YearExpires:=Num:C11($_t_YearSTR)
					If ($_l_YearExpires<2000)
						$_l_YearExpires:=$_l_YearExpires+2000
					End if 
					If ($_l_MonthExpires<10)
						$_t_MonthExpiresSTR:="0"+String:C10($_l_MonthExpires)
					Else 
						$_t_MonthExpiresSTR:=String:C10($_l_MonthExpires)
					End if 
					$_t_YearExpiresSTR:=String:C10($_l_YearExpires)
					
					If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="timx_1334746876_biz_api1.me.com") | (CCM_l_RunTest=1)
						$_bo_InTest:=True:C214
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
							CCM_l_TransrecordID:=CCM_PP_Initiate
							
							Case of 
								: (CCM_t_AuthorizationLogin="nigelx_1334600399_biz@me.com")
									CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($1); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; "4822963516524409 "; "ExpMonth"; "04"; "ExpYear"; "2017"; "CreditCardType"; "Visa")
								Else 
									CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($1); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; $CC_T_CCX99999999999; "ExpMonth"; $_t_MonthExpiresSTR; "ExpYear"; $_t_YearExpiresSTR; "CreditCardType"; $_t_CardType)
							End case 
							
						End if 
					Else 
						
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
							CCM_l_TransrecordID:=CCM_PP_Initiate
							CCM_PP_InsertData(CCM_l_TransrecordID; "OrderTotal"; String:C10($1); "CurrencyCode"; CCM_t_ISOCurrencyCode; "CreditCardNumber"; $CC_T_CCX99999999999; "ExpMonth"; $_t_MonthExpiresSTR; "ExpYear"; $_t_YearExpiresSTR; "CreditCardType"; $_t_CardType)
						End if 
					End if 
					
					If (Not:C34(CCM_bo_IsLicenced)) | (CCM_t_AuthorizationLogin="2222nigel.greenlee_1332436768_biz_api1.me.com") | (CCM_l_RunTest=1)
						If (Current user:C182#"Designer") & (Not:C34(CCM_l_RunTest=1))
							Gen_Alert("WARNING:"+" The credit card module is not licenced, this will operate in test mode")
							$_bo_InTest:=True:C214
						Else 
							$_bo_InTest:=True:C214
							If (CCM_l_RunTest=1)
								Gen_Alert("WARNING:"+" The credit card module is set to operate in test mode")
							End if 
							
						End if 
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
							If (CCM_l_RunTest=1)
								CCM_PP_InsertData(CCM_l_TransrecordID; "TransactionPath"; "1")
							End if 
							
						End if 
						
					End if 
					If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
						CCM_PP_InsertData(CCM_l_TransrecordID; "TransactionTYPE"; "Authorization")
						
					End if 
					If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
						CCM_PP_InsertData(CCM_l_TransrecordID; "Password"; CCM_t_AuthorizationPass)
					End if 
					If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))  // no point in CVV2 on a test trans
						Repeat 
							$_t_CV2Code:=Gen_Request("Please enter the 3 or 4 digit CVV2 code"; "")
							If (Length:C16($_t_CV2Code)#3)
								If (Length:C16($_t_CV2Code)#4)
									Gen_Alert("THE CVV2 CODE MUST BE 3 or 4 DIGITS")
								End if 
							End if 
						Until (Length:C16($_t_CV2Code)=3) | (Length:C16($_t_CV2Code)=4)
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
							CCM_PP_InsertData(CCM_l_TransrecordID; "CVV2"; $_t_CV2Code)
						End if 
					End if 
					If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION(no point on  a test trans)
						CCM_t_AddressLine1:=Replace string:C233(CCM_t_AddressLine1; ","; "")
						CCM_t_Town:=Replace string:C233(CCM_t_Town; ","; "")
						CCM_t_County:=Replace string:C233(CCM_t_County; ","; "")
						CCM_t_PostalCode:=Replace string:C233(CCM_t_PostalCode; ","; "")
						CCM_t_Country:=Replace string:C233(CCM_t_Country; ","; "")
						// $Temp2:=ERR_MethodTracker ("Send Street address")
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStreet1"; CCM_t_AddressLine1)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStreet2"; CCM_t_AddressLine2)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCityName"; CCM_t_Town)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerStateOrProvince"; CCM_t_County)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerPostalCode"; CCM_t_PostalCode)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCountry"; CCM_t_CountryISO)
							CCM_PP_InsertData(CCM_l_TransrecordID; "PayerCCCountry"; CCM_t_CountryISO)
						End if 
					End if 
					AA_LoadNameArrays
					CCM_T_xxxNameOnCard:=$_t_NameOnCard
					CCM_t_FirstName:=""
					CCM_t_LastName:=""
					CCM_t_Title:=""
					AA_ParseName(CCM_T_xxxNameOnCard; 0; ->CCM_t_Title; ->CCM_t_FirstName; ->CCM_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
					CCM_t_FirstName:=Replace string:C233(CCM_t_FirstName; ","; "")
					CCM_t_LastName:=Replace string:C233(CCM_t_LastName; ","; "")
					
					If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
						CCM_PP_InsertData(CCM_l_TransrecordID; "Salutation"; CCM_t_Title)
					End if 
					
					If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
						CCM_PP_InsertData(CCM_l_TransrecordID; "FirstName"; CCM_t_FirstName)
						CCM_PP_InsertData(CCM_l_TransrecordID; "PayerNameFirstName"; CCM_t_FirstName)
					End if 
					
					If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
						CCM_PP_InsertData(CCM_l_TransrecordID; "LastName"; CCM_t_LastName)
						CCM_PP_InsertData(CCM_l_TransrecordID; "PayerNameLastName"; CCM_t_LastName)
					End if 
					If ($_l_ContactID>0)
						If ($_l_ContactID#[CONTACTS:1]x_ID:33)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
						End if 
						If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
						End if 
						If ([CONTACTS:1]Email_Address:35#"")
							If (Length:C16([CONTACTS:1]Email_Address:35)>3)
								$_l_DotPosition:=Position:C15("."; [CONTACTS:1]Email_Address:35)
								If ($_l_DotPosition>0)
									// $Temp2:=ERR_MethodTracker ("Send Email"+[CONTACTS]EmailAddress)
									If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
										CCM_PP_InsertData(CCM_l_TransrecordID; "Payer"; [CONTACTS:1]Email_Address:35)
										// CCM_PP_InsertData (CCM_l_TransrecordID;"x_email_customer";"TRUE")
										
									End if 
								End if 
							End if 
						End if 
						
						If ([COMPANIES:2]Private:37=False:C215)
							If ([COMPANIES:2]Company_Name:2#"")
								$_t_CompanyName:=Replace string:C233([COMPANIES:2]Company_Name:2; ","; "")
								// $Temp2:=ERR_MethodTracker ("Send company name"+$_t_CompanyName)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using PP
									CCM_PP_InsertData(CCM_l_TransrecordID; "PayerBusiness"; $_t_CompanyName)
									
								End if 
							End if 
							
						End if 
					End if 
					SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
					CCM_p_TransRecordRETPTR:=->CCM_Bl_TransResponse
					
					
			End case 
			
			// $Temp2:=ERR_MethodTracker ("Do transaction")
			// CCM_TempExportRecord (CCM_p_TransRecordPTR)
			If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
				Case of 
					: (CCM_t_AuthorizationProvider="Transax")
						$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
						$_l_ResponseCode:=Num:C11(CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse))
						
					: (CCM_t_AuthorizationProvider="Authorize net")
						// $_l_ResponseCode:=ETRANS_Transact(CCM_p_TransRecordPTR;CCM_p_TransRecordRETPTR)Removed August 2009
						$_l_ResponseCode:=CCM_AuthorizeNetSubmit(CCM_l_TransrecordID; ->CCM_Bl_TransResponse)
					: (CCM_t_AuthorizationProvider="paypal")
						// $1=TEST or BLANK
						// $2=USerName
						//   `$3=Password
						// $4=signature
						// $5=Action="AUTHORIZATION or SALe=on ly applies to do direct."
						// $6=index to array row  ` $7=Array Pointer
						// $8 API to use
						// $9=Blob for response text
						$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
						$_l_ResponseCode:=CCM_PaypalRequest($_bo_TestMode; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; "AUTHORIZATION"; CCM_l_TransrecordID; "DoDirectPayment")
						
				End case 
			Else 
				$_l_ResponseCode:=1
			End if 
			// $Temp2:=ERR_MethodTracker ("Response"+String($_l_ResponseCode))
			
			$_l_offset:=0
			If ($_l_ResponseCode#-1)
				$CCM_T_Response:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
				$_t_ResponseSubtext:=BLOB to text:C555(CCM_Bl_TransResponse; 3)
				Case of 
					: (CCM_t_AuthorizationProvider="Transax")
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							$_t_TRTransID:=CCM_ExtractField("Transax"; "TRANS_ID"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
						Else 
							AAofflineID:=0
							$_t_TRTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
						End if 
						
						$_bo_Reject:=False:C215
						If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								$_t_AVSResult:=CCM_ExtractField("Transax"; "AVS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
							Else 
								$_t_AVSResult:="X"
							End if 
							// $Temp2:=ERR_MethodTracker ("AVS Result"+$_t_AVSResult)
							// Y, D or M=Exact Match, 5-character numeric ZIP
							// A or B=Address match only W=9 character numeric ZIP match only
							// Z, P or L=5 character numeric ZIP match only
							// N or C=No Address or ZIP match
							// U=Address unavailable
							// G or I=Non-U.S. Issuer does not participate
							// R=Issuer system unavailable E=Not a mail/phone order
							// S=Service not supported 0,
							// O or  `B=AVS Not Available
							
							$_bo_NoError:=False:C215
							Case of 
								: ($_t_AVSResult="A")
									CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
									// $_bo_NoError:=True
								: ($_t_AVSResult="B")
									// CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
									// : ($_t_AVSResult="O")
									// CCM_t_AVSResult:="AVS error "
								: ($_t_AVSResult="G") | ($_t_AVSResult="I")
									CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
									$_bo_NoError:=True:C214
									
								: ($_t_AVSResult="N") | ($_t_AVSResult="C")
									CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
									
									
								: ($_t_AVSResult="O")
									CCM_t_AVSResult:="AVS not applicable for this transaction "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="R")
									CCM_t_AVSResult:="Retry – System unavailable or timed out "
									
								: ($_t_AVSResult="S")
									CCM_t_AVSResult:="Service not supported by issuer"
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="U")
									CCM_t_AVSResult:="Address information is unavailable "
								: ($_t_AVSResult="W")
									CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="X")
									CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Y")
									CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Z") | ($_t_AVSResult="P") | ($_t_AVSResult="L")
									CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
									$_bo_NoError:=True:C214
								Else 
									CCM_t_AVSResult:=$_t_AVSResult
							End case 
							If (Not:C34($_bo_NoError))
								// $Temp2:=ERR_MethodTracker ("AVS Failuret"+CCM_t_AVSResult)
								
								Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+"Do you wish to process this without AVS?"; "Process"; "Reject")
								If (OK=0)
									// here mark the CC AVS status
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
									
									DB_SaveRecord(->[xCreditCardDetails:132])
									// $Temp2:=ERR_MethodTracker ("Updated Card")
									
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=False:C215
								Else 
									// reprosess with AVS off
									//   ``but first save the auth.
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
									DB_SaveRecord(->[xCreditCardDetails:132])
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=True:C214
									
									// here mark the CC AVS status
								End if 
								OK:=1
							Else 
								$_bo_Reject:=False:C215
								OK:=1
							End if 
						End if 
						
						If (Not:C34($_bo_Reject))
							//   ``
							$_bo_NoCVSError:=True:C214
							If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_CV2Reponse:=CCM_ExtractField("Transax"; "CVV2_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								Else 
									$_t_CV2Reponse:="M"
								End if 
								
								// $Temp2:=ERR_MethodTracker ($_t_CV2Reponse)
								
								Case of 
									: ($_t_CV2Reponse="M")
										CCM_t_CV2Response:="Match"
										
									: ($_t_CV2Reponse="N")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="No Match"
									: ($_t_CV2Reponse="P")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Not Processed"
									: ($_t_CV2Reponse="S")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Should have been present"
									: ($_t_CV2Reponse="U")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Issuer unable to process"
									Else 
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Unknown response"
								End case 
							End if 
							//   ```
							If ($_bo_NoCVSError)
								// $Temp2:=ERR_MethodTracker ("NO ERROR")
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								Else 
									$_t_ResponseCodeSTR:="1"
								End if 
								// $Temp2:=ERR_MethodTracker ("Response"+$_t_ResponseCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Transax"; "STATUS_MSG"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
									
								Else 
									$_t_ResponseReasonCodeSTR:=""
								End if 
								// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseString:=$_t_ResponseReasonCodeSTR
									// $_t_ResponseString:=CCM_ExtractField ("Authorize Net";"Response Reason Text";$_t_ResponseSubtext)
								Else 
									$_t_ResponseString:="Note this is an immitation transaction"
								End if 
								
								// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
								
								$_bo_Failed:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="1")  // card is accepted
										Gen_Message("Authorization obtained")
										$_bo_Failed:=False:C215
									: ($_t_ResponseCodeSTR="2")  // card is declined
										// If ($_t_ResponseReasonCodeSTR="27")
										Gen_Alert("Authorization DECLINED "+$_t_ResponseString)
										
										$_bo_Failed:=True:C214
										// End if
									: ($_t_ResponseCodeSTR="10")  // error in card handling
										Gen_Alert("An error occurred  "+$_t_ResponseString+" Authorization has not been obtained")
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="20")  // transaction being held for review
										Gen_Alert("Transaction being held"+$_t_ResponseString)
										$_bo_Failed:=True:C214
										
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$0:=0
									$0:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; ->CCM_bl_SentData; ->CCM_Bl_TransResponse; $_t_ResponseString; "auth"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_TRTransID)
									
									
									If (CCM_bo_DisableAVSTEMP)
										// Gen_Alert ("The created CCM record for the approved transaction is "+String($0))
									End if 
								Else 
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:="Transax"
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:="AUTH_ONLY"
									[CCM_PSPTransaction:136]x_CCID:8:=$3
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
								
								If ($_bo_Failed)
									// $Temp2:=ERR_MethodTracker ("it was  a fail"+String($0))
									
									$0:=0
								End if 
								If ($_t_ResponseCodeSTR="1")  // card is accepted-showed  message now close it
									CLOSE WINDOW:C154
								End if 
								
							Else 
								
								$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								// $Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
								
								$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Transax"; "STATUS_MSG"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
								// $Temp2:=ERR_MethodTracker ("Response Code Reason"+$_t_ResponseString)
								
								If (CCM_bo_CV2Retry)
									Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
									
									$_bo_Retry:=False:C215
								Else 
									Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
									$_bo_Retry:=(OK=1)
								End if 
								$0:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; CCM_p_TransRecordPTR; CCM_p_TransRecordRETPTR; $_t_ResponseString; "AUTH_ONLY"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
								// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
								
								If ($_bo_Retry)
									$0:=-908
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								Else 
									
									$0:=0
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								End if 
								
							End if 
						Else 
							
							// still create the transactionrecord
							$_t_ResponseCodeSTR:=CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
							// $Temp2:=ERR_MethodTracker ("Response String"+$_t_ResponseCodeSTR)
							
							$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Transax"; "STATUS_MSG"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse)
							// $Temp2:=ERR_MethodTracker ("Response String(Manual)"+$_t_ResponseString)
							
							// $Temp2:=ERR_MethodTracker ("Auth Code"+CCM_t_FAILCode)
							
							CCM_l_RejectedID:=CCM_CreateTransactionRecord("Transax"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "AUTH"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_TRTransID)
							CCM_t_FAILCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
							
							// $Temp2:=ERR_MethodTracker ("Reject DB transrecordID"+String(CCM_l_RejectedID))
							// NG 22/9/06 Another change..despite the previous change--in which i was told that an AVS failure on an auth was not a decline
							// it is a decline--so i have changed again to reject the transaction
							// NG 5/4/2006. Changed the process again.. do not reprosses an auth because of AVS fail.
							// there is a change to the process getting money so that if the auth had an AVS fa(after warning)
							// will not use the avs
							// if we are here we are rejecting....(but will still save the auth code)..that cannot be use subsequently
							If ($_bo_AVSReprocess)
								$0:=-909
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							Else 
								$0:=-907
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							End if 
						End if 
						
					: (CCM_t_AuthorizationProvider="Authorize Net")
						
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							$_t_ANTransID:=CCM_ExtractField("Authorize Net"; "Transaction ID"; $CCM_T_Response)
						Else 
							AAofflineID:=0
							$_t_ANTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
						End if 
						
						// $Temp2:=ERR_MethodTracker ("TransID"+$_t_ANTransID)
						
						$_bo_Reject:=False:C215
						If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								$_t_AVSResult:=CCM_ExtractField("Authorize Net"; "AVS Result Code"; $CCM_T_Response)
							Else 
								$_t_AVSResult:="X"
							End if 
							// $Temp2:=ERR_MethodTracker ("AVS Result"+$_t_AVSResult)
							
							$_bo_NoError:=False:C215
							Case of 
								: ($_t_AVSResult="A")
									CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
									// $_bo_NoError:=True
								: ($_t_AVSResult="B")
									CCM_t_AVSResult:="Address information not provided for AVS check "
								: ($_t_AVSResult="E")
									CCM_t_AVSResult:="AVS error "
								: ($_t_AVSResult="G")
									CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
									$_bo_NoError:=True:C214
									
								: ($_t_AVSResult="N")
									CCM_t_AVSResult:="No Match on Address (Street) or ZIP "
									
									
								: ($_t_AVSResult="P")
									CCM_t_AVSResult:="AVS not applicable for this transaction "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="R")
									CCM_t_AVSResult:="Retry – System unavailable or timed out "
									
								: ($_t_AVSResult="S")
									CCM_t_AVSResult:="Service not supported by issuer"
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="U")
									CCM_t_AVSResult:="Address information is unavailable "
								: ($_t_AVSResult="W")
									CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="X")
									CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Y")
									CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Z")
									CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
									$_bo_NoError:=True:C214
								Else 
									CCM_t_AVSResult:=$_t_AVSResult
							End case 
							If (Not:C34($_bo_NoError))
								// $Temp2:=ERR_MethodTracker ("AVS Failuret"+CCM_t_AVSResult)
								
								Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+"Do you wish to process this without AVS?"; "Process"; "Reject")
								If (OK=0)
									// here mark the CC AVS status
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
									
									DB_SaveRecord(->[xCreditCardDetails:132])
									// $Temp2:=ERR_MethodTracker ("Updated Card")
									
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=False:C215
								Else 
									// reprosess with AVS off
									//   ``but first save the auth.
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
									DB_SaveRecord(->[xCreditCardDetails:132])
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=True:C214
									
									// here mark the CC AVS status
								End if 
								OK:=1
							Else 
								$_bo_Reject:=False:C215
								OK:=1
							End if 
						End if 
						
						If (Not:C34($_bo_Reject))
							//   ``
							$_bo_NoCVSError:=True:C214
							If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_CV2Reponse:=CCM_ExtractField("Authorize Net"; "CVV2 Response Code"; $CCM_T_Response)
								Else 
									$_t_CV2Reponse:="M"
								End if 
								
								// $Temp2:=ERR_MethodTracker ($_t_CV2Reponse)
								
								Case of 
									: ($_t_CV2Reponse="M")
										CCM_t_CV2Response:="Match"
										
									: ($_t_CV2Reponse="N")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="No Match"
									: ($_t_CV2Reponse="O")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Not Processed"
									: ($_t_CV2Reponse="S")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Should have been present"
									: ($_t_CV2Reponse="U")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Issuer unable to process"
									Else 
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Unknown response"
								End case 
							End if 
							//   ```
							If ($_bo_NoCVSError)
								// $Temp2:=ERR_MethodTracker ("NO ERROR")
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
								Else 
									$_t_ResponseCodeSTR:="1"
								End if 
								// $Temp2:=ERR_MethodTracker ("Response"+$_t_ResponseCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
								Else 
									$_t_ResponseReasonCodeSTR:=""
								End if 
								// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_ResponseString:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
								Else 
									$_t_ResponseString:="Note this is an immitation transaction"
								End if 
								
								// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
								
								$_bo_Failed:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="1")  // card is accepted
										Gen_Message("Authorization obtained")
										$_bo_Failed:=False:C215
									: ($_t_ResponseCodeSTR="2")  // card is declined
										// If ($_t_ResponseReasonCodeSTR="27")
										Gen_Alert("Authorization DECLINED "+$_t_ResponseString)
										
										$_bo_Failed:=True:C214
										// End if
									: ($_t_ResponseCodeSTR="3")  // error in card handling
										Gen_Alert("An error occurred  "+$_t_ResponseString+" Authorization has not been obtained")
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="4")  // transaction being held for review
										Gen_Alert("Transaction being held"+$_t_ResponseString)
										$_bo_Failed:=True:C214
									: ($_t_ResponseCodeSTR="-1")
										Gen_Alert("An error occurred  the Gateway could not be contacted")
										$_bo_Failed:=True:C214
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$0:=0
									$0:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "AUTH_ONLY"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
									If (CCM_bo_DisableAVSTEMP)
										// Gen_Alert ("The created CCM record for the approved transaction is "+String($0))
									End if 
								Else 
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:="Authorize Net"
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:="AUTH_ONLY"
									[CCM_PSPTransaction:136]x_CCID:8:=$3
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
								
								If ($_bo_Failed)
									// $Temp2:=ERR_MethodTracker ("it was  a fail"+String($0))
									
									$0:=0
								End if 
								If ($_t_ResponseCodeSTR="1")  // card is accepted-showed  message now close it
									CLOSE WINDOW:C154
								End if 
								
							Else 
								
								$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
								// $Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
								
								$_t_ResponseString:=CCM_ExtractField("Authorize Net"; "Response Reason Text"; $CCM_T_Response)
								// $Temp2:=ERR_MethodTracker ("Response Code Reason"+$_t_ResponseString)
								
								If (CCM_bo_CV2Retry)
									Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
									
									$_bo_Retry:=False:C215
								Else 
									Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
									$_bo_Retry:=(OK=1)
								End if 
								$0:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "AUTH_ONLY"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
								// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
								
								If ($_bo_Retry)
									$0:=-908
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								Else 
									
									$0:=0
									// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
									
								End if 
								
							End if 
						Else 
							
							// still create the transactionrecord
							$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
							// $Temp2:=ERR_MethodTracker ("Response String"+$_t_ResponseCodeSTR)
							
							$_t_ResponseString:="Rejected by user due to AVS problem"
							// $Temp2:=ERR_MethodTracker ("Response String(Manual)"+$_t_ResponseString)
							
							// $Temp2:=ERR_MethodTracker ("Auth Code"+CCM_t_FAILCode)
							
							CCM_l_RejectedID:=CCM_CreateTransactionRecord("Authorize Net"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "AUTH_ONLY"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_ANTransID)
							CCM_t_FAILCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
							
							// $Temp2:=ERR_MethodTracker ("Reject DB transrecordID"+String(CCM_l_RejectedID))
							// NG 22/9/06 Another change..despite the previous change--in which i was told that an AVS failure on an auth was not a decline
							// it is a decline--so i have changed again to reject the transaction
							// NG 5/4/2006. Changed the process again.. do not reprosses an auth because of AVS fail.
							// there is a change to the process getting money so that if the auth had an AVS fa(after warning)
							// will not use the avs
							// if we are here we are rejecting....(but will still save the auth code)..that cannot be use subsequently
							If ($_bo_AVSReprocess)
								$0:=-909
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							Else 
								$0:=-907
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							End if 
						End if 
					: (CCM_t_AuthorizationProvider="Paypal")
						//NOTE THAT THE AUTH ALWAYS USES THE DODIRECTRESPONSE MODULE
						If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
							$_t_PPTransID:=CCM_ExtractField("Paypal"; "TransactionID"; $CCM_T_Response; "DoDirectResponse")
							//The Do Direct response has the following 'fields'
							//Transaction ID
							//Amount
							//AVSCode
							//CVV2Code
							//FMFDetails<=fraudFilter
							//PaymentAdviceCode<-only on recurring
							// CCM_PP_InsertData ($INDEX;"Username";CCM_t_AuthorizationLogin;"Password";CCM_t_AuthorizationLogin)
							//TRACE
							$_bo_TestMode:=$_bo_InTest | ("timx_1334746876_biz_api1.me.com"=CCM_t_AuthorizationLogin)
							$_t_TransactionDetails:=CCM_PaypalGetTransactionDetails($_t_PPTransID; CCM_t_AuthorizationLogin; CCM_t_AuthorizationPass; CCM_t_AuthorizationPassID; $_bo_TestMode)
							//GetTransactionResponse"
							//The transactionDetailsRespons has
							//ShippingCalculationMode
							//InsuranceOptionSelected
						Else 
							AAofflineID:=0
							$_t_PPTransID:=String:C10(AA_GetNextID(->AAofflineID; 1000))
						End if 
						
						//
						$_bo_Reject:=False:C215
						If (CCM_bo_useAVS) & (Not:C34($_bo_InTest)) & (Not:C34(CCM_bo_DisableAVSTEMP)) & (Not:C34($_bo_DisableAVSTEMP))  // ADDRESS VERIFICATION
							If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
								$_t_AVSResult:=CCM_ExtractField("Paypal"; "AVSCode"; $CCM_T_Response; "DoDirectResponse")
							Else 
								$_t_AVSResult:="X"
							End if 
							$_bo_NoError:=False:C215
							Case of 
								: ($_t_AVSResult="A")
									CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
									// $_bo_NoError:=True
								: ($_t_AVSResult="B")
									CCM_t_AVSResult:="Address (Street) matches, ZIP does not"
								: ($_t_AVSResult="C")
									CCM_t_AVSResult:="No "
								: ($_t_AVSResult="D")
									CCM_t_AVSResult:="Exact match"
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="E")
									CCM_t_AVSResult:="Not allowed for MOTO"
								: ($_t_AVSResult="F")
									CCM_t_AVSResult:="UK Address (Street) and 9 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="G")
									CCM_t_AVSResult:="(global)Non-U.S. Card Issuing Bank "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="I")
									CCM_t_AVSResult:="Non-U.S. Card Issuing Bank "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="M")
									CCM_t_AVSResult:="Address "
									
								: ($_t_AVSResult="N")
									CCM_t_AVSResult:="No "
									
								: ($_t_AVSResult="P")
									CCM_t_AVSResult:="Postal "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="R")
									CCM_t_AVSResult:="Retry – System unavailable or timed out "
									
								: ($_t_AVSResult="S")
									CCM_t_AVSResult:="Service not supported by issuer"
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="U")
									CCM_t_AVSResult:="Address information is unavailable "
								: ($_t_AVSResult="W")
									CCM_t_AVSResult:="9 digit ZIP matches, Address (Street) does not "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="X")
									CCM_t_AVSResult:="Address (Street) and 9 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Y")
									CCM_t_AVSResult:="Address (Street) and 5 digit ZIP match "
									$_bo_NoError:=True:C214
								: ($_t_AVSResult="Z")
									CCM_t_AVSResult:="5 digit ZIP matches, Address (Street) does not"
									$_bo_NoError:=True:C214
								Else 
									CCM_t_AVSResult:=$_t_AVSResult
							End case 
							If (Not:C34($_bo_NoError))
								Gen_Confirm("The address verification failed for the following reason"+Char:C90(13)+CCM_t_AVSResult+"Do you wish to process this without AVS?"; "Process"; "Reject")
								If (OK=0)
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:=CCM_t_AVSResult
									DB_SaveRecord(->[xCreditCardDetails:132])
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=False:C215
								Else 
									READ WRITE:C146([xCreditCardDetails:132])
									If ([xCreditCardDetails:132]x_ID:1#$3)
										QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									Else 
										LOAD RECORD:C52([xCreditCardDetails:132])
										
									End if 
									[xCreditCardDetails:132]xAVSStatus:19:="-"+CCM_t_AVSResult
									DB_SaveRecord(->[xCreditCardDetails:132])
									UNLOAD RECORD:C212([xCreditCardDetails:132])
									READ ONLY:C145([xCreditCardDetails:132])
									LOAD RECORD:C52([xCreditCardDetails:132])
									$_bo_Reject:=True:C214
									$_bo_AVSReprocess:=True:C214
								End if 
								OK:=1
							Else 
								$_bo_Reject:=False:C215
								OK:=1
							End if 
						End if 
						
						If (Not:C34($_bo_Reject))
							// NG PAYPAL IMPORTANT-HERE  call GetTransactionDetails to get the transaction response<=not actually sure i am correct now
							//   actually it is where the payment status are.``
							$_bo_NoCVSError:=True:C214
							If (CCM_bo_useCV2) & (Not:C34($_bo_InTest))
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_CV2Reponse:=CCM_ExtractField("Paypal"; "CVV2Code"; $CCM_T_Response; "DoDirectResponse")
								Else 
									$_t_CV2Reponse:="M"
								End if 
								
								Case of 
									: ($_t_CV2Reponse="M")
										CCM_t_CV2Response:="Match"
										
									: ($_t_CV2Reponse="N")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="No Match"
									: ($_t_CV2Reponse="P")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Not Processed"
									: ($_t_CV2Reponse="S")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Service not supported"
									: ($_t_CV2Reponse="U")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Issuer unable to process"
									: ($_t_CV2Reponse="X")
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="No Response"
									Else 
										$_bo_NoCVSError:=False:C215
										CCM_t_CV2Response:="Unknown response"
								End case 
							End if 
							//   ```
							If ($_bo_NoCVSError)
								
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "Transaction")
								Else 
									$_t_ResponseCodeSTR:="Pending"
								End if 
								//Response code pending means it was authorized and pending reason should
								// $Temp2:=ERR_MethodTracker ("Response"+$_t_ResponseCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Paypal"; "ReasonCode"; $_t_TransactionDetails; "Transaction")
								Else 
									$_t_ResponseReasonCodeSTR:=""
								End if 
								// $Temp2:=ERR_MethodTracker ("Response Reason"+$_t_ResponseReasonCodeSTR)
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									
									$_t_ResponseString:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "Transaction")
								Else 
									$_t_ResponseString:="Note- this is an immitation transaction"
								End if 
								$_bo_Failed:=False:C215
								Case of 
									: ($_t_ResponseCodeSTR="Pending") & ($_t_ResponseReasonCodeSTR="None") & ($_t_ResponseString="Authorization")  // card is accepted
										Gen_Message("Authorization obtained")
										$_bo_Failed:=False:C215
									Else 
										// anything else will be an API error so we wont get here
										If (False:C215)
											Case of 
												: ($_t_ResponseCodeSTR="2")  // card is declined
													// If ($_t_ResponseReasonCodeSTR="27")
													Gen_Alert("Authorization DECLINED "+$_t_ResponseString)
													
													$_bo_Failed:=True:C214
													// End if
												: ($_t_ResponseCodeSTR="3")  // error in card handling
													Gen_Alert("An error occurred  "+$_t_ResponseString+" Authorization has not been obtained")
													$_bo_Failed:=True:C214
												: ($_t_ResponseCodeSTR="4")  // transaction being held for review
													Gen_Alert("Transaction being held"+$_t_ResponseString)
													$_bo_Failed:=True:C214
												: ($_t_ResponseCodeSTR="-1")
													Gen_Alert("An error occurred  the Gateway could not be contacted")
													$_bo_Failed:=True:C214
											End case 
										End if 
								End case 
								If (Not:C34(CCM_bo_OfflineHandling))  // set this to true so we can test logic without using AN
									$0:=0
									//Here we need to conjoin the $_t_TransactionDetails onto $CCM_T_Response and replace CCM_Bl_TransRecord with the contantanacted text
									$_t_CCMText:="DODIRECT"+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
									SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
									TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
									
									$0:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "Authorization"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
									If (CCM_bo_DisableAVSTEMP)
										// Gen_Alert ("The created CCM record for the approved transaction is "+String($0))
									End if 
								Else 
									CREATE RECORD:C68([CCM_PSPTransaction:136])
									[CCM_PSPTransaction:136]PSPUSED:4:="Paypal"
									[CCM_PSPTransaction:136]XPSPID:14:=$_l_ServiceID
									[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$_t_ResponseString
									[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
									[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:="Authorization"
									[CCM_PSPTransaction:136]x_CCID:8:=$3
									QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$3)
									[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
									[CCM_PSPTransaction:136]xDepositCode:12:=$_t_DepositID
									[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
									[CCM_PSPTransaction:136]xOrderID:10:=CCM_l_OrderID
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
									[CCM_PSPTransaction:136]xPSPTransID:16:=$_t_ANTransID
									[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
									[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									$0:=[CCM_PSPTransaction:136]x_ID:1
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									
								End if 
								// $Temp2:=ERR_MethodTracker ("Daybook CC transaction record ID"+String($0))
								
								If ($_bo_Failed)
									
									$0:=0
								End if 
								
								If ($_t_ResponseCodeSTR="Pending")  // card is accepted-showed  message now close it
									CLOSE WINDOW:C154
								End if 
								
							Else 
								
								$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
								// $Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
								
								$_t_ResponseString:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "TRANSACTION")
								// $Temp2:=ERR_MethodTracker ("Response Code Reason"+$_t_ResponseString)
								
								If (CCM_bo_CV2Retry)
									Gen_Alert("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again")
									
									$_bo_Retry:=False:C215
								Else 
									Gen_Confirm("This authorization has failed due to a CVV2 error."+CCM_t_CV2Response+" Please  check the CVV2 code and try again"; "Retry"; "Stop")
									$_bo_Retry:=(OK=1)
								End if 
								$_t_CCMText:="DODIRECT"+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
								SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
								TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
								
								$0:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "Authorization"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
								
								
								If ($_bo_Retry)
									$0:=-908
									
								Else 
									
									$0:=0
									
								End if 
								
							End if 
						Else 
							
							// still create the transactionrecord
							
							
							$_t_ResponseCodeSTR:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "TRANSACTION")
							// $Temp2:=ERR_MethodTracker ("Response Code String"+$_t_ResponseCodeSTR)
							
							$_t_ResponseString:=CCM_ExtractField("Paypal"; "PendingReason"; $_t_TransactionDetails; "TRANSACTION")
							
							// $Temp2:=ERR_MethodTracker ("Response String"+$_t_ResponseCodeSTR)
							
							$_t_ResponseString:="Rejected by user due to AVS problem"
							// $Temp2:=ERR_MethodTracker ("Response String(Manual)"+$_t_ResponseString)
							
							// $Temp2:=ERR_MethodTracker ("Auth Code"+CCM_t_FAILCode)
							// NOTE-with paypal the TRANSACTION ID is the AUTH ID!
							$_t_CCMText:="DODIRECT"+"END REQUEST TYPE"+$CCM_T_Response+"END REQUEST RESPONSE"+$_t_TransactionDetails+"END TRANSACTION DETAILS"
							SET BLOB SIZE:C606(CCM_Bl_TransResponse; 0)
							TEXT TO BLOB:C554($_t_CCMText; CCM_Bl_TransResponse; 3)
							
							CCM_l_RejectedID:=CCM_CreateTransactionRecord("Paypal"; $_l_ServiceID; ->CCM_Bl_TransRecord; ->CCM_Bl_TransResponse; $_t_ResponseString; "Authorization"; $3; CCM_l_OrderID; $_t_InvoiceID; $_t_DepositID; $_t_ReceiptID; $_t_PPTransID)
							CCM_t_FAILCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
							
							// $Temp2:=ERR_MethodTracker ("Reject DB transrecordID"+String(CCM_l_RejectedID))
							// NG 22/9/06 Another change..despite the previous change--in which i was told that an AVS failure on an auth was not a decline
							// it is a decline--so i have changed again to reject the transaction
							// NG 5/4/2006. Changed the process again.. do not reprosses an auth because of AVS fail.
							// there is a change to the process getting money so that if the auth had an AVS fa(after warning)
							// will not use the avs
							// if we are here we are rejecting....(but will still save the auth code)..that cannot be use subsequently
							If ($_bo_AVSReprocess)
								$0:=-909
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							Else 
								$0:=-907
								// $Temp2:=ERR_MethodTracker ("it was a retry"+String($0))
								
							End if 
						End if 
				End case 
			Else 
				Gen_Alert("The Transaction could not be created")
				$0:=0
			End if 
		End if 
		
	Else 
		$0:=0
	End if 
Else 
	$0:=0
	
End if 
ERR_MethodTrackerReturn("CCMGetAuth"; $_t_oldMethodName)