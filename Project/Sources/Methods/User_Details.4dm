//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Details
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Login_al_AccountsLoaded;0)
	ARRAY LONGINT:C221($_al_ClientProcesses; 0)
	//ARRAY LONGINT(DM_al_DataOwnerIDS;0)
	//ARRAY OBJECT(<>Login_aobj_accountData;0)
	ARRAY TEXT:C222($_at_ClientList; 0)
	//ARRAY TEXT(DM_at_DataOwnerNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbValues;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValues;0)
	//ARRAY TEXT(LIC_at_StdAttrbNames;0)
	//ARRAY TEXT(LIC_at_StdAttrbValues;0)
	C_BOOLEAN:C305(<>_bo_NoAutoScripts; <>CheckCredit; <>ContCheck; <>ContDedupCo; <>DB_bo_FunctionOrder; <>DialSynch; <>Email_bo_Enabled; <>FaxPicker; <>FaxSingle; <>FaxUrgent; <>FindMy)
	C_BOOLEAN:C305(<>ForceCred; <>Form4DW; <>FormWPTit; <>LogIn_bo_AccountsInited; <>MargCP; <>ModuleIcons; <>MultiCo; <>NoJT; <>OneEntry; <>OrdDelAdd; <>OrdersDisTr)
	C_BOOLEAN:C305(<>OrdQtyAlloc; <>POShowDisc; <>POTheirCode; <>ProdGrpBrd; <>PurchPayChe; <>PurchPayRem; <>RemAllComp; <>RemBeg; <>RemLaun; <>RemNewMod; <>RemNotProd)
	C_BOOLEAN:C305(<>RemOver; <>RemShowData; <>SalesHdrDP; <>SalesItemDP; <>SalesOrder; <>SCPT_bo_NoAutoScripts; <>SelOr; <>ServShowCon; <>ShowFunPal; <>ShowModBar; <>SR)
	C_BOOLEAN:C305(<>StandMA; <>StateAnal; <>StockAnal; <>StockPostAu; <>StockPostIn; <>StockPostIt; <>StockPostOr; <>SYS_bo_AutoShowQualities; <>SYS_bo_CalenderPics; <>SYS_bo_CapitaliseTown; <>SYS_bo_CompanyStatusSeperate)
	C_BOOLEAN:C305(<>SYS_bo_ContactDuplicateCheck; <>SYS_bo_ContactJustDeleteMC; <>SYS_bo_CopyPreviousDate; <>SYS_bo_DataChangeLog; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultSalutation; <>SYS_bo_DefaultsCallback; <>SYS_bo_DefaultsFind; <>SYS_bo_DefaultSource; <>SYS_bo_LoqateAddressing)
	C_BOOLEAN:C305(<>SYS_bo_OrderItemPartDelivery; <>SYS_bo_PRDFurtherAnalSearch; <>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; <>SYS_bo_RestrictCompanies; <>SYS_bo_SDMonoCalendar; <>SYS_bo_SpecifiedAccounts; <>TechOrder; <>TermEst; <>TermFLN; <>TermGL)
	C_BOOLEAN:C305(<>TermInq; <>TermInv; <>TermRP; <>TermST; <>TopModBar; <>ViewLists; $_bo_licencesedVersionOK; $_bo_NewStyleLicence; $_bo_Renew; $_bo_ROState; $_bo_RunMonitor)
	C_BOOLEAN:C305($_bo_SaveConfigurationPrefs; $_bo_SaveLedgerPrefs; $_bo_Start2; $_bo_Unload; $2; DM_bo_CreditsSequence; DM_bo_nomenforceAnalysis; DM_bo_nomLedgersBatched; DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch; DM_bo_nomPostbyCompany)
	C_BOOLEAN:C305(DM_bo_nomTransinCalc; DM_bo_nomVatcash; DM_bo_SALESAllowInvoicenoPrint; DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESAllowPurchaseZero; DM_bo_SALESInvoiceAutoReceipt; LR_bo_Enable; LR_bo_isLicenced; USR_bo_DisableTempButton)
	C_DATE:C307(<>SYS_d_InceptionDate; <>TimeYear; $_d_Date; $_d_ExpiryDate; DM_D_SalesLEdgerStartDate)
	C_LONGINT:C283(<>ButtProcV; <>CCC; <>cwSelectColor; <>cwSelectStyle; <>cwStartWeekOn; <>FaxCover; <>FaxDestin; <>FaxHdrPage; <>FaxMode; <>FaxResol; <>FaxRetries)
	C_LONGINT:C283(<>FaxRetrySec; <>FaxServAddr; <>FormMethod; <>LoggedInaccount; <>PalDelay; <>PCC; <>PER_l_CurLoggedinDataOwnerID; <>PER_l_ProcessWaiting; <>ProcMax; <>PurchPrice2; <>Repeat)
	C_LONGINT:C283(<>ScrnSavMin; <>SD3_l_DiaryVersion; <>SMS_Activate; <>SYS_l_AutoCapitalization; <>SYS_l_DecimalPlacesonPrices; <>SYS_l_MaxConnectedUsers; <>SYS_l_ORDDefaultRequiredDays; <>SYS_l_Windowx; <>SYS_l_Windowy; <>TelIPActual; $_l_ApplicationType)
	C_LONGINT:C283($_l_BasicUserDataID; $_l_CoreInfoID; $_l_CountUsers; $_l_DataPosition; $_l_DelayCounter; $_l_Index; $_l_Offset; $_l_StoredProcessServer; $_l_ThisNumber; $_l_Timescale; $1)
	C_LONGINT:C283($3; DM_l_DataOwnerID; DM_l_NomAgingStage1; DM_l_NomAgingStage2; DM_l_NomAgingStage3; SD3_l_CalendarStartDayNumber; vCreate)
	C_PICTURE:C286(<>DB_Pic_CoLogo; <>SYS_pic_TitlePicture)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceTimeAdded)
	C_REAL:C285(<>TimeDay)
	C_TEXT:C284(<>AT; <>ClientStat; <>ContClStat; <>ContEnqStat; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_addressFormatNotation; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_DefaultUser; <>DB_t_ErrorReportAddress)
	C_TEXT:C284(<>DB_t_ErrorReportPerson; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>DefContSta; <>DefCopytoaddress; <>DefPrior; <>DefRole; <>DefSignature; <>DefSta; <>DialPref; <>eLetAct)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>EnqStat; <>FaxServName; <>FaxServType; <>FaxServZone; <>Forename; <>GenPrice; <>LabAct; <>LabProd; <>LetAct)
	C_TEXT:C284(<>LIC_t_LicenceOwnerName; <>MAIL_t_SMTPServer; <>MailSal; <>PathName; <>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentEmailFrom; <>PurPTrans; <>QtnAct; <>ScreenT; <>Source; <>STK_t_AllocationMovement)
	C_TEXT:C284(<>STK_t_PhysicalStockType; <>StockAss; <>STS_t_CRMDefaultAccountsRole; <>Surname; <>SYS_t_4DWriteType; <>SYS_t_AccessType; <>SYS_t_ACCOpenBalancesStatus; <>SYS_t_BaseCurrency; <>SYS_t_FormPath; <>SYS_t_FormSizeName; <>SYS_t_MainorRemote)
	C_TEXT:C284(<>SYS_t_MessageAction; <>SYS_t_ScreenTitle; <>SYS_t_StockOrderCompany; <>SYS_t_VersionNumber; <>TechCode; <>TelPCPath; <>TimeAct; <>TitAdd; <>TitAuth; <>TitDepCo; <>TitDepCoP)
	C_TEXT:C284(<>TitDepCoS; <>TitleLRC; <>TitPay; <>TitPayB; <>TitReg; <>UserAdd; <>UserDetail; <>WildCard; <>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans)
	C_TEXT:C284(<>WIP_t_TRWTrans; <>YrPerF; <>YrPerT; $_t_LicencedName; $_t_LicenceRelease; $_t_LicenceVersion; $_t_oldMethodName; $_t_ReleaseVersion; $_t_VersionNumber2; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD)
	C_TEXT:C284(DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashto; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_BankAccto; DM_T_NomActualLayer; DM_T_NomDefaultCreditStage; DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax)
	C_TEXT:C284(DM_T_NomPurchaseTerms; DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSDepositReconcile; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay; DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC)
	C_TEXT:C284(DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput; DM_t_Org; DM_T_UserAddress1; DM_T_UserAddress2; DM_T_UserCountry; DM_T_UserCounty; DM_T_UserFAX; DM_T_UserName; DM_t_UserOfficeCode)
	C_TEXT:C284(DM_T_UserPostCode; DM_t_UserScreenTitle; DM_T_UserTelephone; DM_T_UserTown; DM_T_Uservat; DM_T_UservatPrefix)
	C_TIME:C306(<>SYS_ti_DefaultDiaryTimeCheck; <>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultTimeDayStart; <>SYS_ti_DefaultTimeUnits)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Details")
//This is moving towards having multiple user accounts. so there will no longer be single
//`'user' record and with a number of 'singular' preferences the potential is to allow multiples
//so a customer could have different preferences for different user groups or different analysis codes
//as this happens 'holding' the values on the server or even single user becomes redundant. and in the case of server
//pretty irrelevant. Any 'request' to the server must know what preferences(Data owner, analysis, user group) the request pertains to
//the process services request must record this so it can be used and the server must dynamically load the preferences.
//if you change the preferences the method that caused the prefs to reload called on clients will now simply set the 'inited' flags in all processes to false.
//on the server the 'inited' flag never should get to true so that the loading is dynamic.


LR_Custom
$_bo_SaveConfigurationPrefs:=False:C215
//User_Details◊aModOrder
While (Semaphore:C143("$UpdatingUser"))
	DelayTicks(40)
	$_l_DelayCounter:=$_l_DelayCounter+1
	If ($_l_DelayCounter>200)
		MESSAGE:C88("Long delay")
	End if 
End while 
If (Records in table:C83([USER:15])=0)  //`This will no longer be the case once completed
	READ WRITE:C146([USER:15])
	CREATE RECORD:C68([USER:15])
	
	[USER:15]Office Code:13:="1"
	[USER:15]Town:4:="NEW"  //just any field used to flag the new record
	[USER:15]Date FirstRun:214:=Current date:C33(*)
	[USER:15]XdataOwnerID:251:=AA_GetNextID(->DM_l_DataOwnerID)
	DB_SaveRecord(->[USER:15])
	UNLOAD RECORD:C212([USER:15])
	READ ONLY:C145([USER:15])
	
End if 
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (True:C214)
	$_l_CoreInfoID:=PREF_GetPreferenceID("Data Owners"; True:C214; -1)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CoreInfoID)  //There will be one record per data owner
	If (Records in selection:C76([PREFERENCES:116])=0)
		//if there are no records we will create one
		ALL RECORDS:C47([USER:15])
		ARRAY LONGINT:C221(DM_al_DataOwnerIDS; 0)
		ARRAY TEXT:C222(DM_at_DataOwnerNames; 0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_CoreInfoID
		[PREFERENCES:116]Preference_DataID:7:=-1
		DM_t_Org:=[USER:15]Organisation:1
		If ([USER:15]XdataOwnerID:251>0)
			DM_l_DataOwnerID:=[USER:15]XdataOwnerID:251
		Else 
			DM_l_DataOwnerID:=AA_GetNextID(->DM_l_DataOwnerID)
		End if 
		APPEND TO ARRAY:C911(DM_al_DataOwnerIDS; DM_l_DataOwnerID)
		APPEND TO ARRAY:C911(DM_at_DataOwnerNames; DM_t_Org)
		VARIABLE TO BLOB:C532(DM_al_DataOwnerIDS; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_at_DataOwnerNames; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
	Else 
		$_l_Offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DataOwnerIDS; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_DataOwnerNames; $_l_Offset)
	End if 
	
End if 
If (Size of array:C274(DM_al_DataOwnerIDS)=1)
	//If there is more than one user data setup in the data file dont handle it this way
	//if there is more than one we will load a core setting-the server. when users log in their parent will define which user settings they load
	<>PER_l_CurLoggedinDataOwnerID:=DM_al_DataOwnerIDS{1}
	$_l_BasicUserDataID:=PREF_GetPreferenceID("Configuration Owner"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_BasicUserDataID)
	DB_LoadConfigurationPrefs
	DB_LoadLedgerPreferences
	
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]DataOwnerID:54=0)
	If (Records in selection:C76([PERSONNEL:11])>0)
		READ WRITE:C146([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]DataOwnerID:54=0)
		APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]DataOwnerID:54:=<>PER_l_CurLoggedinDataOwnerID)
		UNLOAD RECORD:C212([PERSONNEL:11])
		READ ONLY:C145([PERSONNEL:11])
	End if 
	QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Data_Owner_ID:14=0)
	If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
		READ WRITE:C146([PERSONNEL_GROUPS:92])
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Data_Owner_ID:14=0)
		APPLY TO SELECTION:C70([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Data_Owner_ID:14:=<>PER_l_CurLoggedinDataOwnerID)
		UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
		READ ONLY:C145([PERSONNEL_GROUPS:92])
	End if 
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListDataOwnerID:7=0)
	If (Records in selection:C76([X_LISTS:111])>0)
		READ WRITE:C146([X_LISTS:111])
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListDataOwnerID:7=0)
		APPLY TO SELECTION:C70([X_LISTS:111]; [X_LISTS:111]x_ListDataOwnerID:7:=<>PER_l_CurLoggedinDataOwnerID)
	End if 
	QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10=0)
	If (Records in selection:C76([X_LISTS:111])>0)
		READ WRITE:C146([TERMINOLOGY:75])
		QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10=0)
		APPLY TO SELECTION:C70([TERMINOLOGY:75]; [TERMINOLOGY:75]x_DataOwnerID:10:=<>PER_l_CurLoggedinDataOwnerID)
	End if 
	
	$_bo_RunMonitor:=True:C214
	If (Count parameters:C259>=1)
		Vcreate:=$1
		If (Count parameters:C259>=2)
			$_bo_RunMonitor:=$2
		End if 
	Else 
		SPLASH_UPDATE("Loading User Preferences ...")
	End if 
	READ ONLY:C145([USER:15])
	//at server startup we are always loading account 0.
	//further accounts are associated with users so ◊LoggedInaccount is set in a client or set in a browser
	If (Count parameters:C259>=3)
		If ($3#0)
			
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=$3)
		End if 
	Else 
		If (<>LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>LoggedInaccount)
		End if 
	End if 
	//To make sure the prefs get saved while the USER Table is still in use need to check changes.
	
	$_bo_SaveConfigurationPrefs:=False:C215
	DB_LoadConfigurationPrefs
	If (DM_T_UserName#[USER:15]Organisation:1)
		DM_T_UserName:=[USER:15]Organisation:1
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Organisation:1="Daybook Review")
		//TRACE
	End if 
	//Qualities Preferences
	//◊autoshowQualities
	//Licence Preferences
	//◊PathName
	//◊DateFirst
	//Text Handling Preference
	//◊Capital
	//CRM Preferences
	//◊CompanyStatusSeperate
	//◊cwSelectColor:=[USER]CalenderColor
	//◊cwSelectStyle:=[USER]CalenderStyle
	//◊cwStartWeekOn:=[USER]CalenderWeekStartDay
	//Default Address format
	
	//email preferences
	//◊DefSMTPhost:=[USER]DEF_SMTP_HOST
	//◊DefReplytoaddress:=[USER]Email From
	//◊DefCopytoaddress:=[USER]DEF_Copy_to_email
	//◊DefSignature:=[USER]Default_mail_signature
	
	
	
	
	<>SYS_bo_AutoShowQualities:=[USER:15]autoshowQualities:250
	<>SYS_t_FormPath:=[USER:15]Form Path:175
	<>SYS_l_AutoCapitalization:=[USER:15]Capitalisation:67  //Used in PathTestDlog
	<>SYS_bo_CompanyStatusSeperate:=[USER:15]enableCompanydataonPrivate:249
	
	
	If ((<>SYS_t_FormPath#"") & (<>SYS_t_FormPath#"@:"))
		<>SYS_t_FormPath:=<>SYS_t_FormPath+":"
	End if 
	<>SYS_d_InceptionDate:=[USER:15]Date FirstRun:214  //used in Path_Check
	
	If (<>SYS_d_InceptionDate=!00-00-00!)
		<>SYS_d_InceptionDate:=Current date:C33(*)
	End if 
	User_Version
	
	
	//moved to up here so we can send email errors during licening functionality -kmw, 04/04/08
	<>DB_t_ErrorReportPerson:="Nigel Greenlee"  // email error reports sent to this person
	<>DB_t_ErrorReportAddress:="nigel.greenlee@btinternet.com"  // 22/04/02 pb
	
	
	//moved to up here so we can send email errors during licening functionality -kmw, 04/04/08
	<>EMAIL_t_DefaultSMTPhost:=[USER:15]DEF_SMTP_HOST:236
	<>EMAIL_t_DefaultReplyToAddress:=[USER:15]Email From:232
	<>DefCopytoaddress:=[USER:15]DEF_Copy_to_email:237
	<>DefSignature:=[USER:15]Default_mail_signature:238
	<>cwSelectColor:=[USER:15]CalenderColor:242
	<>cwSelectStyle:=[USER:15]CalenderStyle:243
	<>cwStartWeekOn:=[USER:15]CalenderWeekStartDay:244
	
	
	<>Email_bo_Enabled:=IsEmailAvailable(True:C214)  //moved to up here so we can send email errors during licening functionality -kmw, 04/04/08
	
	
	
	DB_LoadLicenceDetails
	Case of 
		: (Application type:C494=4D Remote mode:K5:5)
			//NEED TO DISCOUNT ANY 'STORED PROCS'
			$_l_CountUsers:=Count users:C342-1
			If ($_l_CountUsers>DB_GetLicenceMaxUsers)
				Gen_Alert("The maximum of "+String:C10(<>SYS_l_MaxConnectedUsers)+" Concurrent User(s) has been exceeded"; Quit_Name; -1984)
				QUIT 4D:C291
			End if 
	End case 
	$_bo_NewStyleLicence:=False:C215
	If (False:C215)
		If (vCreate=1)
			$_bo_NewStyleLicence:=False:C215
			//TRACE
			If (LR_bo_Enable)  //(LR_t_LicenceHost#"")  ` & (False)
				ALL RECORDS:C47(LIC_ptr_LicenceTable->)
				ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->; <)
				$_d_Date:=LR_ptr_LicenceDateAdded->
				QUERY:C277(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->=$_d_Date)
				ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceTimeAdded->; <)
				If (BLOB size:C605(LR_ptr_LicenceFile->)>0)
					$_bo_NewStyleLicence:=True:C214
					//TRACE
					//********************** altered to use new Eblob type (array vars placed in blob directly as opposed to parsing text) ***********
					ARRAY TEXT:C222(LIC_at_NonStdAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_NonStdAttrbValues; 0)
					ARRAY TEXT:C222(LIC_at_StdAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_StdAttrbValues; 0)
					ARRAY TEXT:C222(LIC_at_ModAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_ModAttrbValues; 0)
					//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
					//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
					ARRAY TEXT:C222(LIC_at_NonsModAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_NonsModAttrbvalues; 0)
					LR_LicenceFileEBLOBToArrays(LR_ptr_LicenceFile; ->LIC_at_StdAttrbNames; ->LIC_at_StdAttrbValues; ->LIC_at_NonStdAttrbNames; ->LIC_at_NonStdAttrbValues; ->LIC_at_ModAttrbNames; ->LIC_at_ModAttrbValues; ->LIC_at_NonsModAttrbNames; ->LIC_at_NonsModAttrbvalues)
					//LR_LicNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonStdAttrbNames;->LIC_at_NonStdAttrbValues)
					//LR_LicStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_StdAttrbNames;->LIC_at_StdAttrbValues)
					//LR_ModStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_ModAttrbNames;->LIC_at_ModAttrbValues)
					//LR_ModNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonsModAttrbNames;->LIC_at_NonsModAttrbvalues)
					//*********************************************************************************************
					$_l_DataPosition:=Find in array:C230(LIC_at_StdAttrbNames; "LICENSE EXPIRY DATE")
					If ($_l_DataPosition<0)
						$_l_DataPosition:=Find in array:C230(LIC_at_StdAttrbNames; "LICENCE EXPIRY DATE")
					End if 
					If ($_l_DataPosition>0)
						$_d_ExpiryDate:=Date:C102(LIC_at_StdAttrbValues{$_l_DataPosition})
					Else 
						$_d_ExpiryDate:=!00-00-00!
					End if 
					If (Current date:C33(*)>($_d_ExpiryDate+365)) & ($_d_ExpiryDate#!00-00-00!)
						Case of 
							: (Application type:C494=4D Server:K5:6)
								Gen_Alert("Your Licence appears to be more than one year out of date, Check_Date on Machine"; ""; -1984)
								<>SYS_l_MaxConnectedUsers:=0
							Else 
								Gen_Confirm("Your Licence appears to be more than one year out of date, Check_Date on Machine"; "Quit"; "Renew"; -1984)
								If (OK=1)
									QUIT 4D:C291
								End if 
						End case 
						
					End if 
					$_l_DataPosition:=Find in array:C230(LIC_at_NonStdAttrbNames; "USER")
					If ($_l_DataPosition>0)  //it should be
						$_t_LicencedName:=LIC_at_NonStdAttrbValues{$_l_DataPosition}
					Else 
						$_t_LicencedName:="UNKNOWN"
					End if 
					//``
					$_bo_licencesedVersionOK:=False:C215
					$_l_DataPosition:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENSEVERSION")
					If ($_l_DataPosition<0)
						$_l_DataPosition:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENCEVERSION")
					End if 
					If ($_l_DataPosition>0)
						$_t_LicenceVersion:=LIC_at_NonStdAttrbValues{$_l_DataPosition}
					Else 
						$_t_LicenceVersion:="1.0.0"
					End if 
					$_l_DataPosition:=Find in array:C230(LIC_at_NonStdAttrbNames; "RELEASEVERSION")
					If ($_l_DataPosition>0)
						$_t_ReleaseVersion:=LIC_at_NonStdAttrbValues{$_l_DataPosition}
					Else 
						$_t_ReleaseVersion:="000"
					End if 
					$_t_LicenceRelease:=Substring:C12(<>SYS_t_VersionNumber; 4; Length:C16(<>SYS_t_VersionNumber))
					If (Num:C11($_t_LicenceRelease)>=Num:C11($_t_ReleaseVersion))
						$_bo_licencesedVersionOK:=True:C214
					Else 
						$_bo_licencesedVersionOK:=False:C215
					End if 
					If ($_t_LicenceVersion=Substring:C12(<>SYS_t_VersionNumber; 1; 3)) & ($_bo_licencesedVersionOK)
						$_bo_licencesedVersionOK:=True:C214
					Else 
						$_bo_licencesedVersionOK:=False:C215
					End if 
					
					//```
				Else 
					$_bo_NewStyleLicence:=False:C215
					
					
					
				End if 
			End if 
			If ($_bo_NewStyleLicence=False:C215)
				
				Path_Check
				$_bo_Renew:=True:C214  //can renew if need to
				If (Current date:C33(*)>([USER:15]Limit Date:58+365)) & ([USER:15]Limit Date:58#!00-00-00!)
					Case of 
						: (Application type:C494=4D Server:K5:6)
							Gen_Confirm("Your Licence appears to be more than one year out of date, Check_Date on Machine"; "Quit"; "Renew"; -1984)
							If (OK=1)
								QUIT 4D:C291
								$_bo_Renew:=False:C215
							Else 
								$_bo_Renew:=True:C214
							End if 
							<>SYS_l_MaxConnectedUsers:=0
						Else 
							Gen_Confirm("Your Licence appears to be more than one year out of date, Check_Date on Machine"; "Quit"; "Renew"; -1984)
							If (OK=1)
								QUIT 4D:C291
								$_bo_Renew:=False:C215
							Else 
								$_bo_Renew:=True:C214
							End if 
					End case 
					
				End if 
				
				
				
				If ($_bo_Renew)  //licence needs renewing and user is not quiting
					If ((<>PathName="") | (Current date:C33(*)>[USER:15]Limit Date:58))
						If ((<>PathName#"") & (Year of:C25([USER:15]Limit Date:58)=1975) & ([USER:15]Tutorial Data:228))  //do Tutorial_Date update
							$_bo_ROState:=Read only state:C362([USER:15])
							If ($_bo_ROState=True:C214)
								READ WRITE:C146([USER:15])
								LOAD RECORD:C52([USER:15])
							End if 
							[USER:15]Limit Date:58:=Current date:C33(*)+([USER:15]Limit Date:58-!1975-01-01!)
							DB_SaveRecord(->[USER:15])
						End if 
						If ((<>PathName="") | (Current date:C33(*)>[USER:15]Limit Date:58))
							USR_bo_DisableTempButton:=True:C214  //changes start BSW 27/05/02
							//User Licence
							User_Licence(True:C214)  //modified to suppress login screen 20/08/08 -kmw (gets done later anyway)
							
						End if 
					End if 
				End if 
				//here need to test if any server processes are running
				Case of 
					: (Application type:C494=4D Server:K5:6)
						If (Count parameters:C259=0) | ($_bo_RunMonitor)
							//TRACE
							
							$_l_StoredProcessServer:=Execute on server:C373("SER_MON_USERS"; 128000; "Stored Proc Server"; *)
							
							// Perform appropriate actions
							
						End if 
					: (Application type:C494<4)
						//single user versions
					: (Application type:C494=4D Remote mode:K5:5)
						$_l_ApplicationType:=Application type:C494
						If (Application type:C494=4D Remote mode:K5:5)
							
							$_l_CountUsers:=Count users:C342-1
						Else 
							$_l_CountUsers:=Count users:C342
						End if 
						
						If ($_l_CountUsers><>SYS_l_MaxConnectedUsers)
							Gen_Alert("The maximum of "+String:C10(<>SYS_l_MaxConnectedUsers)+" Concurrent User(s) has been exceeded"; Quit_Name; -1984)
							QUIT 4D:C291
						End if 
						//here if passed 1 parameter-resetting details
						ARRAY TEXT:C222($_at_ClientList; 0)
						ARRAY LONGINT:C221($_al_ClientProcesses; 0)
						GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ClientProcesses)
						For ($_l_Index; 1; Count users:C342)
							
							EXECUTE ON CLIENT:C651($_at_ClientList{$_l_Index}; "UserDetailsBLOB")
							
						End for 
						
						
					Else 
						//something else
						QUIT 4D:C291
				End case 
			Else 
				//TRACE
				If (Application type:C494=4D Server:K5:6)
					$_l_Timescale:=10
				Else 
					$_l_Timescale:=5
				End if 
				If (Current date:C33(*)>($_d_ExpiryDate-$_l_Timescale)) | ($_t_LicencedName#<>LIC_t_LicenceOwnerName) | ($_bo_licencesedVersionOK=False:C215)
					
					If ((<>PathName#"") & (Year of:C25([USER:15]Limit Date:58)=1975) & ([USER:15]Tutorial Data:228))  //do Tutorial_Date update `NG left as is
						$_bo_ROState:=Read only state:C362([USER:15])
						If ($_bo_ROState=True:C214)
							READ WRITE:C146([USER:15])
							LOAD RECORD:C52([USER:15])
						End if 
						[USER:15]Limit Date:58:=Current date:C33(*)+([USER:15]Limit Date:58-!1975-01-01!)
						DB_SaveRecord(->[USER:15])
					End if 
					Case of 
						: (Current date:C33(*)>($_d_ExpiryDate-$_l_Timescale))
							//Try getting an update first
							
							Licence_AutoUpdateCheck($_d_ExpiryDate; False:C215)
							Path_Check  //added 17/01/08 -kmw
							//Path_TestDlog
						: ($_t_LicencedName#<>LIC_t_LicenceOwnerName)
							Gen_Alert("The current licence is not for this company, please update the licence")
							Path_TestDlog(True:C214)  //cant do an auto update
						: ($_bo_licencesedVersionOK=False:C215)
							Gen_Alert("The current licence is not for this version of Daybook, please update the licence")
							Path_TestDlog(True:C214)  //cant do an auto update
					End case 
					If (LR_bo_isLicenced)  // it is licenced
						Case of 
							: (Application type:C494=4D Server:K5:6)
								If (Count parameters:C259=0) | ($_bo_RunMonitor)
									
									
									$_l_StoredProcessServer:=Execute on server:C373("SER_MON_USERS"; 128000; "Stored Proc Server"; *)
									
									// Perform appropriate actions
									
								End if 
							: (Application type:C494<4)
								//single user versions
							: (Application type:C494=4D Remote mode:K5:5)
								$_l_ApplicationType:=Application type:C494
								If (Application type:C494=4D Remote mode:K5:5)
									
									$_l_CountUsers:=Count users:C342-1
								Else 
									$_l_CountUsers:=Count users:C342
								End if 
								
								If ($_l_CountUsers><>SYS_l_MaxConnectedUsers)
									Gen_Alert("The maximum of "+String:C10(<>SYS_l_MaxConnectedUsers)+" Concurrent User(s) has been exceeded"; Quit_Name; -1984)
									QUIT 4D:C291
								End if 
								//here if passed 1 parameter-resetting details
								ARRAY TEXT:C222($_at_ClientList; 0)
								ARRAY LONGINT:C221($_al_ClientProcesses; 0)
								GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ClientProcesses)
								For ($_l_Index; 1; Count users:C342)
									
									EXECUTE ON CLIENT:C651($_at_ClientList{$_l_Index}; "UserDetailsBLOB")
									
								End for 
								
								
							Else 
								//something else
								QUIT 4D:C291
						End case 
					Else 
						USR_bo_DisableTempButton:=True:C214  //changes start BSW 27/05/02
						//User Licence
						User_Licence(True:C214)  //modified to suppress login screen 20/08/08 -kmw (gets done later anyway)
						
						If (Not:C34(LR_bo_isLicenced))
							QUIT 4D:C291
						End if 
					End if 
					
				Else 
					Path_Check(True:C214)
					If (LR_bo_isLicenced=False:C215)  //Licence failed so show licence screen
						USR_bo_DisableTempButton:=True:C214  //changes start BSW 27/05/02
						//User Licence
						User_Licence(True:C214)  //modified to suppress login screen 20/08/08 -kmw (gets done later anyway)
						
					End if 
					If (LR_bo_isLicenced)  // it is licenced
						Case of 
							: (Application type:C494=4D Server:K5:6)
								If (Count parameters:C259=0) | ($_bo_RunMonitor)
									
									$_l_StoredProcessServer:=Execute on server:C373("SER_MON_USERS"; 128000; "Stored Proc Server"; *)
									
									// Perform appropriate actions
									
								End if 
							: (Application type:C494<4)
								//single user versions
							: (Application type:C494=4D Remote mode:K5:5)
								$_l_ApplicationType:=Application type:C494
								If (Application type:C494=4D Remote mode:K5:5)
									
									$_l_CountUsers:=Count users:C342-1
								Else 
									$_l_CountUsers:=Count users:C342
								End if 
								
								If ($_l_CountUsers><>SYS_l_MaxConnectedUsers)
									Gen_Alert("The maximum of "+String:C10(<>SYS_l_MaxConnectedUsers)+" Concurrent User(s) has been exceeded"; Quit_Name; -1984)
									QUIT 4D:C291
								End if 
								//here if passed 1 parameter-resetting details
								ARRAY TEXT:C222($_at_ClientList; 0)
								ARRAY LONGINT:C221($_al_ClientProcesses; 0)
								GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ClientProcesses)
								For ($_l_Index; 1; Count users:C342)
									
									EXECUTE ON CLIENT:C651($_at_ClientList{$_l_Index}; "UserDetailsBLOB")
									
								End for 
								
								
							Else 
								//something else
								QUIT 4D:C291
						End case 
					Else 
						QUIT 4D:C291
						
					End if 
					
				End if 
				
			End if 
		End if 
	End if 
	
	READ ONLY:C145([ADDRESS_FORMATS:74])
	<>AT:=[USER:15]Address Format:127
	QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=[USER:15]Address Format:127)
	
	If (Records in selection:C76([ADDRESS_FORMATS:74])=1)
		<>DB_t_Address1Label:=[ADDRESS_FORMATS:74]Address_1_Name:3
		<>DB_t_Address2Label:=[ADDRESS_FORMATS:74]Address_2_Name:4
		<>DB_t_TownLabel:=[ADDRESS_FORMATS:74]Town_Name:5
		<>DB_t_CountyLabel:=[ADDRESS_FORMATS:74]County_Name:6
		<>DB_t_PostcodeLabel:=[ADDRESS_FORMATS:74]Postcode_Name:7
		<>DB_t_CountryLabel:=[ADDRESS_FORMATS:74]Country_Name:8
		<>DB_t_addressFormatNotation:=[ADDRESS_FORMATS:74]Address_Text:9
		<>PCC:=Num:C11([ADDRESS_FORMATS:74]Check_PostalCode:14)+Num:C11(([ADDRESS_FORMATS:74]Check_PostalCode:14) & ([ADDRESS_FORMATS:74]Enforce_PostalCode:15))
	Else 
		<>DB_t_Address1Label:="Address"
		<>DB_t_Address2Label:=""
		If (([USER:15]Address Format:127="US") & (DB_GetModuleSettingByNUM(40)>0))
			<>DB_t_TownLabel:="City"
			<>DB_t_CountyLabel:="State"
			<>DB_t_PostcodeLabel:="ZIP"
			<>DB_t_CountryLabel:="Country"
			<>DB_t_addressFormatNotation:="1"+Char:C90(13)+"2"+Char:C90(13)+"3, 4 5"+Char:C90(13)+"6"
			<>PCC:=0
		Else 
			<>DB_t_TownLabel:="Town"
			<>DB_t_CountyLabel:="County"
			<>DB_t_PostcodeLabel:="Postcode"
			<>DB_t_CountryLabel:="Country"
			<>DB_t_addressFormatNotation:="1"+Char:C90(13)+"2"+Char:C90(13)+"3"+Char:C90(13)+"4 5"+Char:C90(13)+"6"
			<>PCC:=0
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(1))#5)
		UNLOAD RECORD:C212([ADDRESS_FORMATS:74])
	End if 
	
	If (Semaphore:C143("VersUp"))
		User_DetsVersUp
	End if 
	CLEAR SEMAPHORE:C144("VersUp")
	//$_t_VersionNumber:=VER_GetVersion (1)
	$_t_VersionNumber2:=VER_GetVersion
	If ([USER:15]Last Version:92#<>SYS_t_VersionNumber)  // | ($_t_VersionNumber#$_t_VersionNumber2)
		User_VersionUp(""; $_t_VersionNumber2)
	End if 
	If ([USER:15]Town:4="*NEW")
		User_Start
		$_bo_Start2:=True:C214
	Else 
		$_bo_Start2:=False:C215
	End if 
	If (Count parameters:C259=0)
		//SPLASH_UPDATE ("")
		//RESUME PROCESS(SD3_l_CalendarStartDayNumber)
	End if 
	
	<>UserDetail:=""
	//◊Name:=[user]name
	If (Records in table:C83([PERSONNEL:11])=0)
		Personnel_Gen
	End if 
	If ([USER:15]Add1:2#DM_T_UserAddress1)
		DM_T_UserAddress1:=[USER:15]Add1:2
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Add2:3#DM_T_UserAddress2)
		DM_T_UserAddress2:=[USER:15]Add1:2
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Town:4#DM_T_UserTown)
		DM_T_UserTown:=[USER:15]Town:4
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]County:5#DM_T_UserCounty)
		DM_T_UserCounty:=[USER:15]County:5
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Country:7#DM_T_UserCountry)
		DM_T_UserCountry:=[USER:15]Country:7
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Country:7#DM_T_UserCountry)
		DM_T_UserCountry:=[USER:15]Country:7
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If ([USER:15]Postcode:6#DM_T_UserPostCode)
		DM_T_UserPostCode:=[USER:15]Postcode:6
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_UserTelephone#[USER:15]Telephone:8)
		DM_T_UserTelephone:=[USER:15]Telephone:8
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_UserFAX#[USER:15]Fax:9)
		DM_T_UserFAX:=[USER:15]Fax:9
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_UserFAX#[USER:15]Fax:9)
		DM_T_UserFAX:=[USER:15]Fax:9
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_UservatPrefix#[USER:15]VAT Prefix:70)
		DM_T_UservatPrefix:=[USER:15]VAT Prefix:70
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_Uservat#[USER:15]VAT Reg No:11)
		DM_T_Uservat:=[USER:15]VAT Reg No:11
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_bo_nomVatcash#[USER:15]VAT Cash:212)
		DM_bo_nomVatcash:=[USER:15]VAT Cash:212
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_t_UserOfficeCode#[USER:15]Office Code:13)
		DM_t_UserOfficeCode:=[USER:15]Office Code:13
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	If (DM_T_BankAccFrom#[USER:15]Bank From:15)
		DM_T_BankAccFrom:=[USER:15]Bank From:15
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_BankAccto#[USER:15]Bank To:16)
		DM_T_BankAccto:=[USER:15]Bank To:16
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	//See also Accounts_CheckPref & Accounts_InLPA
	If (DM_T_BankAccCashFrom#[USER:15]Cash From:17)
		DM_T_BankAccCashFrom:=[USER:15]Cash From:17
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_BankAccCashto#[USER:15]Cash To:18)
		DM_T_BankAccCashto:=[USER:15]Cash To:18
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_nomVatInput#[USER:15]VAT Input:19)
		DM_T_nomVatInput:=[USER:15]VAT Input:19
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_nomVatOutput#[USER:15]VAT Output:20)
		DM_T_nomVatOutput:=[USER:15]VAT Output:20
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomVatECCreditor#[USER:15]VAT EC Creditor:75)
		DM_T_nomVatECCreditor:=[USER:15]VAT EC Creditor:75
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomVatCashACC#[USER:15]VAT CashAcc:211)
		DM_T_nomVatCashACC:=[USER:15]VAT CashAcc:211
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	
	If (DM_T_nomTRANSInvoicePost#[USER:15]Invoice Trans:21)
		DM_T_nomTRANSInvoicePost:=[USER:15]Invoice Trans:21
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomTRANSInvoiceReceipt#[USER:15]InvoiceP Trans:24)
		DM_T_nomTRANSInvoiceReceipt:=[USER:15]InvoiceP Trans:24
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomTRANDepositReceipt#[USER:15]Deposit Trans:59)
		DM_T_nomTRANDepositReceipt:=[USER:15]Deposit Trans:59
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomTRANSDepositReconcile#[USER:15]Deposit Rec:60)
		DM_T_nomTRANSDepositReconcile:=[USER:15]Deposit Rec:60
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>YrPerF:=[USER:15]Year PeriodF:22
	<>YrPerT:=[USER:15]Year PeriodT:23
	If (DM_T_BankAccBalanceProfitYTD#[USER:15]BS Profit YTD:26)
		DM_T_BankAccBalanceProfitYTD:=[USER:15]BS Profit YTD:26
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_BankAccBalanceProfitBFWD#[USER:15]BS Profit BFWD:29)
		DM_T_BankAccBalanceProfitBFWD:=[USER:15]BS Profit BFWD:29
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_BankAccBalanceAdjustments#[USER:15]BS Profit Adj:225)
		DM_T_BankAccBalanceAdjustments:=[USER:15]BS Profit Adj:225
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_nomTRANSPurchase#[USER:15]Purch Trans:27)
		DM_T_nomTRANSPurchase:=[USER:15]Purch Trans:27
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_nomTRANSPurchasePay#[USER:15]PurchP Trans:28)
		DM_T_nomTRANSPurchasePay:=[USER:15]PurchP Trans:28
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	<>PurPTrans:=[USER:15]PurchP Trans:28
	
	If (DM_T_nomTRANSPurchasePrePay#[USER:15]PrePay Trans:61)
		DM_T_nomTRANSPurchasePrePay:=[USER:15]PrePay Trans:61
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_nomTRANSInvoicePrePay#[USER:15]PrePay Rec:62)
		DM_T_nomTRANSInvoicePrePay:=[USER:15]PrePay Rec:62
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>WIP_t_TRPTrans:=[USER:15]WIP TR Trans:200
	<>WIP_t_CIPTRANS:=[USER:15]WIP CI Trans:201
	<>WIP_t_TRWTrans:=[USER:15]WIP TRWO Trans:202
	<>WIP_t_CIWTrans:=[USER:15]WIP CIWO Trans:203
	<>ScreenT:=[USER:15]TScreen_Title:25
	If (DM_t_UserScreenTitle#[USER:15]TScreen_Title:25)
		DM_t_UserScreenTitle:=[USER:15]TScreen_Title:25
		$_bo_SaveConfigurationPrefs:=True:C214
	End if 
	
	If ((DB_GetModuleSettingByNUM(1))=5)
		<>SYS_t_4DWriteType:="W"
	Else 
		Case of 
			: ([USER:15]Word Processor:14=1)  // "Gold"
				<>SYS_t_4DWriteType:="W"
			: ([USER:15]Word Processor:14=2)  // SuperWrite OUT 24/04/02 pb
				<>SYS_t_4DWriteType:="W"
			: ([USER:15]Word Processor:14=3)  // "Silver"
				<>SYS_t_4DWriteType:="W"
			Else   //0 - plain text
				<>SYS_t_4DWriteType:=""
		End case 
	End if 
	
	QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1="LOGO")
	If (Records in selection:C76([PICTURES:85])=1)
		<>DB_Pic_CoLogo:=[PICTURES:85]Picture:3
		UNLOAD RECORD:C212([PICTURES:85])
	End if 
	
	
	<>SYS_bo_CalenderPics:=[USER:15]Show Pics:30
	<>SYS_t_ScreenTitle:=[USER:15]SScreen_Name:31
	<>SYS_t_FormSizeName:="13"
	<>SYS_bo_SDMonoCalendar:=[USER:15]BW:32
	<>STS_t_CRMDefaultAccountsRole:=[USER:15]Def_AccountJobRole:248
	<>eLetAct:=[USER:15]Def_EmailAction:239
	If (<>eLetAct="")
		<>eLetAct:="Email"
	End if 
	
	<>LetAct:=[USER:15]Letter Action:33
	<>QtnAct:=[USER:15]Qtn Action:39
	
	If (DM_l_NomAgingStage1#[USER:15]AD 1:34)
		DM_l_NomAgingStage1:=[USER:15]AD 1:34
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_l_NomAgingStage2#[USER:15]AD 2:35)
		DM_l_NomAgingStage2:=[USER:15]AD 2:35
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_l_NomAgingStage3#[USER:15]AD 3:36)
		DM_l_NomAgingStage3:=[USER:15]AD 3:36
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SYS_t_StockOrderCompany:=[USER:15]StockOrderCo:37
	<>DefSta:=[USER:15]Default Status:40
	<>ClientStat:=[USER:15]Client Status:85
	<>ContClStat:=[USER:15]ContCl Status:86
	<>EnqStat:=[USER:15]Enquirer Status:196
	<>ContEnqStat:=[USER:15]ContEnq Status:197
	<>DefRole:=[USER:15]Default Role:41
	//◊SalesAlloc:=[USER]Sales Alloc
	//◊StockAlloc:=[USER]Stock Alloc
	<>TechOrder:=[USER:15]Tech Order:44
	<>SYS_ti_DefaultSVSResponse:=[USER:15]Response Hrs:45
	<>TechCode:=[USER:15]Tech Code:46
	<>LabAct:=[USER:15]Tech LabAct:48
	<>LabProd:=[USER:15]Tech LabProd:47
	<>TitDepCo:=[USER:15]TitDepCo:50
	<>TitDepCoP:=[USER:15]TitDepCoP:51
	<>TitDepCoS:=[USER:15]TitDepCoS:52
	<>TitAdd:=[USER:15]TitAdd:53
	<>TitPay:=[USER:15]TitPay:54
	<>TitPayB:=[USER:15]TitPayB:55
	<>TitReg:=[USER:15]TitReg:56
	<>TitAuth:=[USER:15]TitAuth:57
	If (DM_T_NomDefaultSalesTax#[USER:15]Def VAT Code:91)
		DM_T_NomDefaultSalesTax:=[USER:15]Def VAT Code:91
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If ([USER:15]User_Processes:63<1)
		<>ProcMax:=5
	Else 
		<>ProcMax:=[USER:15]User_Processes:63
	End if 
	If ((DB_GetModuleSettingByNUM(1))=5)
		<>ModuleIcons:=False:C215
	Else 
		If (Is Windows:C1573)
			
			<>ModuleIcons:=True:C214
		Else 
			<>ModuleIcons:=[USER:15]Module Icons:79
		End if 
	End if 
	<>PalDelay:=[USER:15]Palette Delay:80
	<>SYS_ti_DefaultTimeUnits:=[USER:15]Time Unit:64
	<>TimeYear:=[USER:15]Time Year:65
	<>TimeAct:=[USER:15]Time Action:66
	<>TimeDay:=[USER:15]Time Day:198
	<>SYS_ti_DefaultTimeDayStart:=[USER:15]Time Day Start:199
	<>SYS_bo_CapitaliseTown:=[USER:15]Capitalise Town:77
	<>DefPrior:=[USER:15]Diary Priority:68
	<>SYS_l_ORDDefaultRequiredDays:=[USER:15]Order Req:69
	If (DM_bo_SALESAllowInvoicenoPrint#[USER:15]Invoices NoPrin:132)
		DM_bo_SALESAllowInvoicenoPrint:=[USER:15]Invoices NoPrin:132
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_bo_SALESAllowInvoiceUnproc#[USER:15]Invoices Unproc:71)
		DM_bo_SALESAllowInvoiceUnproc:=[USER:15]Invoices Unproc:71
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>ForceCred:=[USER:15]Force CredCheck:73
	<>Repeat:=[USER:15]Repeat Delay:74
	If (<>Repeat=0)
		<>Repeat:=1500
	End if 
	<>DB_t_DefaultUser:=[USER:15]Default User:76
	<>SYS_bo_DefaultSource:=[USER:15]Def Source:78
	<>Source:=""
	<>RemOver:=[USER:15]Remote Over:81
	<>SalesOrder:=[USER:15]Sales Ordering:82
	<>SYS_bo_DefaultSales:=[USER:15]Def Sales:83
	<>SYS_bo_DefaultsCallback:=[USER:15]Def Callback:84
	<>MultiCo:=True:C214  //[USER]Multi Co Cont
	<>CCC:=[USER:15]Co Code Chars:88
	<>SYS_bo_DefaultSalutation:=[USER:15]Def Salutation:89
	If (DM_T_NomDefaultCreditStage#[USER:15]Def Cred Stage:90)
		DM_T_NomDefaultCreditStage:=[USER:15]Def Cred Stage:90
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SelOr:=[USER:15]Sel_Or:93
	<>RemLaun:=[USER:15]Remote Launch:95
	<>RemBeg:=[USER:15]Remote Begin:96
	<>SCPT_bo_NoAutoScripts:=[USER:15]No Play:97
	<>StateAnal:=[USER:15]State Anal:98
	<>ShowModBar:=[USER:15]Show ModBar:99
	//<>DeepModBar:=[USER]Deep ModBar
	<>TopModBar:=[USER:15]Top ModBar:101
	<>SYS_bo_DefaultEntry:=[USER:15]Entry Defaults:106
	<>SYS_bo_DefaultsFind:=[USER:15]Find Defaults:107
	<>RemAllComp:=[USER:15]Rem AllComp:108
	If ([USER:15]Physical Stock:109="")
		<>STK_t_PhysicalStockType:="P"
	Else 
		<>STK_t_PhysicalStockType:=[USER:15]Physical Stock:109
	End if 
	If ([USER:15]Alloc Move:110="")
		<>STK_t_AllocationMovement:="A"
	Else 
		<>STK_t_AllocationMovement:=[USER:15]Alloc Move:110
	End if 
	<>RemShowData:=[USER:15]Remote ShowData:111
	<>RemNewMod:=[USER:15]Remote NewMod:112
	If (DM_T_NomSalesTerms#[USER:15]Default Terms:113)
		DM_T_NomSalesTerms:=[USER:15]Default Terms:113
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_NomPurchaseTerms#[USER:15]Default Terms:113)
		DM_T_NomPurchaseTerms:=[USER:15]Default Terms:113
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>OneEntry:=([USER:15]Batch Entry:114=False:C215)
	<>SYS_t_MainorRemote:=[USER:15]Main or Remote:115
	<>RemNotProd:=[USER:15]Remote NotProd:116
	If ([USER:15]Title LRC:117="")
		<>TitleLRC:="C"
	Else 
		<>TitleLRC:=[USER:15]Title LRC:117
	End if 
	If (DM_bo_CreditsSequence#[USER:15]Credit Note Sep:118)
		DM_bo_CreditsSequence:=[USER:15]Credit Note Sep:118
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SYS_pic_TitlePicture:=[USER:15]Form Picture:119
	If ([USER:15]Base Currency:120="")
		READ WRITE:C146([USER:15])
		LOAD RECORD:C52([USER:15])
		[USER:15]Base Currency:120:="£"
		DB_SaveRecord(->[USER:15])
	End if 
	
	<>SYS_t_BaseCurrency:=[USER:15]Base Currency:120
	<>DB_bo_FunctionOrder:=[USER:15]Prod Func Ord:122
	<>WildCard:=[USER:15]Wild Card:123
	<>ContCheck:=False:C215
	<>SYS_bo_RestrictCompanies:=[USER:15]Comp User Chk:124
	<>NoJT:=[USER:15]No Job Title:126
	<>StandMA:=[USER:15]Stand Marg Act:130
	
	
	
	If (Count parameters:C259=0)
		//SPLASH_UPDATE ("0")
		//RESUME PROCESS(SD3_l_CalendarStartDayNumber)
	End if 
	
	If ((DB_GetModuleSettingByNUM(40))>0)
		User_DetsTerm
	Else 
		<>TermFLN:=False:C215
		<>Forename:="Forename"
		<>Surname:="Surname"
		<>TermInq:=False:C215
		<>TermEst:=False:C215
		<>TermInv:=False:C215
		<>TermST:=False:C215
		<>TermGL:=False:C215
		<>TermRP:=False:C215
	End if 
	If (DM_T_NomDefaultPurchaseTax#[USER:15]Def Purch Tax:131)
		DM_T_NomDefaultPurchaseTax:=[USER:15]Def Purch Tax:131
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_bo_SALESAllowInvoicenoPrint#[USER:15]Invoices NoPrin:132)
		DM_bo_SALESAllowInvoicenoPrint:=[USER:15]Invoices NoPrin:132
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_bo_SALESInvoiceAutoReceipt#[USER:15]Invoices PayAft:133)
		DM_bo_SALESInvoiceAutoReceipt:=[USER:15]Invoices PayAft:133
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>FormMethod:=[USER:15]Form Method:134
	<>Form4DW:=[USER:15]Form 4DW:135
	<>FormWPTit:=[USER:15]Form with Title:136
	<>StockPostOr:=[USER:15]StockPostOrd:138
	<>StockPostIn:=[USER:15]StockPostInv:137
	<>StockPostIt:=[USER:15]StockPostItem:139
	//<>ProdGrpBrd:=[USER]ProdGroupBrand
	<>DialSynch:=[USER:15]Dial Synch:141
	<>SR:=[USER:15]Super Report:142
	<>DialPref:=[USER:15]Dial Prefix:143
	<>ServShowCon:=[USER:15]Service ShowCon:144
	If (DM_bo_nomTransinCalc#[USER:15]TransIn Calc:145)
		DM_bo_nomTransinCalc:=[USER:15]TransIn Calc:145
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_T_NomActualLayer#[USER:15]Actual Layer:146)
		DM_T_NomActualLayer:=[USER:15]Actual Layer:146
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>CheckCredit:=[USER:15]Check Credit:147
	<>PurchPayRem:=[USER:15]Purch PayRem:148
	<>PurchPayChe:=[USER:15]Purch PayCheq:149
	<>ViewLists:=[USER:15]View Lists:150
	//DB_LoadViewPreference `Changed my mind-will load when its needed-it will always be the current setting
	
	<>SYS_bo_SpecifiedAccounts:=[USER:15]Layers AccSrc:151
	<>POTheirCode:=[USER:15]PO Their Code:152
	<>POShowDisc:=[USER:15]PO ShowDisc:207
	<>PurchPrice2:=[USER:15]Purch Price2:153
	If (DM_D_SalesLEdgerStartDate#[USER:15]SL New Date:154)
		DM_D_SalesLEdgerStartDate:=[USER:15]SL New Date:154
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>FindMy:=[USER:15]Find My Data:155
	<>OrdQtyAlloc:=[USER:15]Orders QtyAlloc:156
	<>GenPrice:=[USER:15]Gen Co Price Gr:157
	<>StockPostAu:=[USER:15]StockPostAuto:158
	<>SYS_bo_ContactJustDeleteMC:=[USER:15]Cont Del MC:160
	If ([USER:15]Diary_TimeCheck:161>?00:00:00?)
		<>SYS_ti_DefaultDiaryTimeCheck:=[USER:15]Diary_TimeCheck:161-?00:01:00?
	Else 
		<>SYS_ti_DefaultDiaryTimeCheck:=?00:00:00?
	End if 
	If ([USER:15]SuperDiaryActive:245=True:C214)
		<>SD3_l_DiaryVersion:=1  //SuperDiary is installed
	Else 
		<>SD3_l_DiaryVersion:=0  //SuperDiary is not installed
	End if 
	If ([USER:15]SMS_Active:241=True:C214)
		
		<>SMS_Activate:=1  //SMS messaging is active
	Else 
		<>SMS_Activate:=0  //SMS messaging is inactive
	End if 
	<>ShowFunPal:=[USER:15]Func Palette:162
	If (DM_bo_nomLedgersRecJournal#[USER:15]NL Rec Jour:163)
		DM_bo_nomLedgersRecJournal:=[USER:15]NL Rec Jour:163
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>UserAdd:=[USER:15]User Additions:164
	<>OrdDelAdd:=[USER:15]OrdFormDelAdd:168
	If (DM_bo_SALESAllowPurchaseZero#[USER:15]Zero Invoices:169)
		DM_bo_SALESAllowPurchaseZero:=[USER:15]Zero Invoices:169
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_bo_SALESAllowInvoiceZero#[USER:15]Zero Invoices:169)
		DM_bo_SALESAllowInvoiceZero:=[USER:15]Zero Invoices:169
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SYS_bo_CopyPreviousDate:=[USER:15]CopyPrevKpDate:170
	<>SYS_t_MessageAction:=[USER:15]Message Action:174
	<>MailSal:=[USER:15]Mail Salutation:176
	<>MargCP:=[USER:15]Margin CP:177
	<>SalesHdrDP:=[USER:15]Sales HdrDesPr:178
	<>SalesItemDP:=[USER:15]Sales ItemDesPr:179
	<>StockAss:=[USER:15]Assembly Stock:180
	If (DM_T_BankAccCurrencyExchange#[USER:15]Exch Contr Acc:186)
		DM_T_BankAccCurrencyExchange:=[USER:15]Exch Contr Acc:186
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	If (DM_T_BankAccCurrencyCharges#[USER:15]Bank ExCh Acc:187)
		DM_T_BankAccCurrencyCharges:=[USER:15]Bank ExCh Acc:187
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	
	<>SYS_bo_ContactDuplicateCheck:=[USER:15]Cont DupCheck:189
	If (DM_bo_nomLedgersBatched#[USER:15]NL LedgerBat:190)
		DM_bo_nomLedgersBatched:=[USER:15]NL LedgerBat:190
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>DefContSta:=[USER:15]Def Cont Status:191
	<>ContDedupCo:=[USER:15]Cont DedupComp:192
	<>StockAnal:=[USER:15]Stock Analysis:193
	<>PER_l_ProcessWaiting:=[USER:15]Waiting Proc:194
	<>SYS_t_AccessType:="Q"*Num:C11([USER:15]Access Type:195)  //& (◊Screen#""))
	<>OrdersDisTr:=[USER:15]Orders DiscTran:204
	If (DM_bo_nomPostbyCompany#[USER:15]PayRec ByCo:205)
		DM_bo_nomPostbyCompany:=[USER:15]PayRec ByCo:205
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	If (DM_bo_nomPostatendofbatch#[USER:15]PayRec Batch:213)
		DM_bo_nomPostatendofbatch:=[USER:15]PayRec Batch:213
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SYS_l_DecimalPlacesonPrices:=[USER:15]Decimal Price:206
	If (<>SYS_l_DecimalPlacesonPrices<1)
		<>SYS_l_DecimalPlacesonPrices:=2
	End if 
	<>TelPCPath:=[USER:15]Tel PCPath:208
	<>TelIPActual:=[USER:15]Tel IPActual:209
	<>ScrnSavMin:=[USER:15]ScreenSaverMin:210
	User_Fonts
	<>SYS_bo_PRDFurtherAnalSearch:=[USER:15]Prod FurtherSrc:226
	If (DM_bo_nomenforceAnalysis#[USER:15]PL Analysis:227)
		DM_bo_nomenforceAnalysis:=[USER:15]PL Analysis:227
		$_bo_SaveLedgerPrefs:=True:C214
	End if 
	
	<>SYS_bo_OrderItemPartDelivery:=[USER:15]OrderI Part:229
	<>SYS_l_Windowx:=[USER:15]Window x:230
	<>SYS_l_Windowy:=[USER:15]Window y:231
	<>MAIL_t_SMTPServer:=[USER:15]SMTP Address:233
	<>PER_t_CurrentEmailFrom:=[USER:15]Email From:232
	
	
	<>SYS_bo_LoqateAddressing:=False:C215
	
	
	
	If ((DB_GetModuleSettingByNUM(Module_FaxManager))>0)
		<>FaxMode:=[USER:15]Fax Mode:215
		<>FaxResol:=1+Num:C11([USER:15]Fax Best:218)
		<>FaxRetries:=[USER:15]Fax Retries:216
		<>FaxRetrySec:=[USER:15]Fax Retry Secs:217
		<>FaxSingle:=[USER:15]Fax Single User:219
		If (<>FaxSingle)
			<>FaxPicker:=False:C215
		Else 
			<>FaxPicker:=True:C214
		End if 
		<>FaxHdrPage:=0  //could be a preference
		<>FaxUrgent:=False:C215  //could be a pref
		<>FaxDestin:=1  //1 for fax, 2 for telex, 4 for ISDN
		<>FaxServName:=[USER:15]Fax Server Name:220
		<>FaxServType:=[USER:15]Fax Server Type:221
		<>FaxServZone:=[USER:15]Fax Server Zone:222
		<>FaxServAddr:=[USER:15]Fax Server Addr:223
		<>FaxCover:=[USER:15]Fax Cover Page:224
	Else 
		<>FaxMode:=0
	End if 
	
	If ((DB_GetModuleSettingByNUM(1))=5)  //make sure non-Silver things are off - see User_Vers40010
		User_DetSilvOff
	End if 
	
	<>SYS_t_ACCOpenBalancesStatus:=[USER:15]Opening Balance:49  //blank for none in progress, 1 in char1 for SL, 1 in char2 for PL, 1 in 3 for GL
	If (($_bo_Start2) | (<>SYS_t_ACCOpenBalancesStatus#""))
		<>Per_t_CurrentDefaultAnalCode:=""
		Startup_Page2
		<>SYS_t_ACCOpenBalancesStatus:=[USER:15]Opening Balance:49
	End if 
	//TRACE
	
	<>SYS_bo_DataChangeLog:=[USER:15]Data_ChangeLOG:234  //this does not need to be copied in userBlob as it is required on the server
	<>SYS_bo_PWActive:=[USER:15]SinglePWsystem:235
	DB_LoadPasswordAutoSetup
	<>SYS_bo_PWActiveOLD:=<>SYS_bo_PWActive
	
	//EMAIL DEFAULTS
	
	If (False:C215)
		If (Current date:C33(*)+30>[USER:15]Limit Date:58)
			//here we setup the auto get licence...
			If (Not:C34($_bo_NewStyleLicence))
				Gen_Alert("Your licence will expire on the "+String:C10([USER:15]Limit Date:58)+" . Please contact Daybook for a licence update"; ""; -720)
			End if 
		End if 
	End if 
	If ([USER:15]XdataOwnerID:251>0)
		If (Not:C34(<>LogIn_bo_AccountsInited))
			ARRAY LONGINT:C221(<>Login_al_AccountsLoaded; 0)
			ARRAY OBJECT:C1221(<>Login_aobj_accountData; 0)
			<>LogIn_bo_AccountsInited:=True:C214
		End if 
		APPEND TO ARRAY:C911(<>Login_al_AccountsLoaded; [USER:15]XdataOwnerID:251)
	End if 
	
	//
	//READ ONLY([USER])
	If ((DB_GetModuleSettingByNUM(21))>0)
		User_DetsRA
	End if 
	UNLOAD RECORD:C212([IDENTIFIERS:16])
	
	//moved setting ◊DOC_bo_EmailEnabled to higher up so we can send error emails when trying to do licensing -04/04/08 -kmw
	//◊DOC_bo_EmailEnabled:=IsEmailAvailable (True)
	If ($_bo_SaveConfigurationPrefs)
		DB_SaveConfigurationPrefs
	End if 
	If ($_bo_SaveConfigurationPrefs)
		DB_SaveledgerPrefs
		
	End if 
	If (True:C214)
		
		If (Count parameters:C259>=1)
			ARRAY TEXT:C222($_at_ClientList; 0)
			ARRAY LONGINT:C221($_al_ClientProcesses; 0)
			GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ClientProcesses)
			For ($_l_Index; 1; Size of array:C274($_at_ClientList))
				$_l_ThisNumber:=1
				//EXECUTE ON CLIENT($_at_ClientList{$_l_Index};"UserDetailsBLOB";$_l_ThisNumber)
			End for 
		End if 
	End if 
End if 
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
CLEAR SEMAPHORE:C144("$UpdatingUser")


//◊InternetConnectionActive:=InternetConnectionStatusCheck   ` for SMS etc. 31/07/
ERR_MethodTrackerReturn("User_Details"; $_t_oldMethodName)
