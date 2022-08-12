//%attributes = {}
If (False:C215)
	//Project Method Name:      UserDetailsBLOB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 12:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Mod_al_ModuleOrder;0)
	//ARRAY LONGINT(<>Mod_al_STRres;0)
	//ARRAY TEXT(<>Mod_at_ModuleColourName;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>CheckCredit; <>ContCheck; <>ContDedupCo; <>DB_bo_FunctionOrder; <>DefSal; <>DialSynch; <>Email_bo_Enabled; <>FaxPicker; <>FaxSingle; <>FaxUrgent; <>FindMy)
	C_BOOLEAN:C305(<>ForceCred; <>Form4DW; <>FormWPTit; <>MargCP; <>ModuleIcons; <>MultiCo; <>NoJT; <>OneEntry; <>OrdDelAdd; <>OrdersDisTr; <>OrdQtyAlloc)
	C_BOOLEAN:C305(<>POShowDisc; <>POTheirCode; <>PurchPayChe; <>PurchPayRem; <>RemAllComp; <>RemBeg; <>RemLaun; <>RemNewMod; <>RemNotProd; <>RemOver; <>RemShowData)
	C_BOOLEAN:C305(<>SalesHdrDP; <>SalesItemDP; <>SalesOrder; <>SCPT_bo_NoAutoScripts; <>SelOr; <>ServShowCon; <>ShowFunPal; <>ShowModBar; <>SR; <>StandMA; <>StateAnal)
	C_BOOLEAN:C305(<>StockAnal; <>StockPostAu; <>StockPostIn; <>StockPostIt; <>StockPostOr; <>SYS_bo_AutoShowQualities; <>SYS_bo_CalenderPics; <>SYS_bo_CapitaliseTown; <>SYS_bo_CompanyStatusSeperate; <>SYS_bo_ContactDuplicateCheck; <>SYS_bo_ContactJustDeleteMC)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultsCallback; <>SYS_bo_DefaultsFind; <>SYS_bo_DefaultSource; <>SYS_bo_LoqateAddressing; <>SYS_bo_OrderItemPartDelivery; <>SYS_bo_PRDFurtherAnalSearch; <>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD)
	C_BOOLEAN:C305(<>SYS_bo_RestrictCompanies; <>SYS_bo_SDMonoCalendar; <>SYS_bo_SpecifiedAccounts; <>TechOrder; <>TermRP; <>TopModBar; <>ViewLists; $_bo_isLicenced; $_bo_ProcessVisible; $_bo_unload; USR_bo_DisableTempButton)
	C_BOOLEAN:C305(DB_bo_LedgerInited; DB_bo_TranslationInited; DB_bo_ConfigInited; LR_bo_Enable)
	C_DATE:C307(<>DB_d_CurrentDate; <>SYS_d_InceptionDate; <>TimeYear; $_d_ExiryDate)
	C_LONGINT:C283(<>ButtProcV; <>CCC; <>ConIMUsers; <>ConWPUsers; <>cwSelectColor; <>cwSelectStyle; <>cwStartWeekOn; <>DataSize; <>FaxCover; <>FaxDestin; <>FaxHdrPage)
	C_LONGINT:C283(<>FaxMode; <>FaxResol; <>FaxRetries; <>FaxRetrySec; <>FaxServAddr; <>FormMethod; <>PalDelay; <>PCC; <>PER_l_ProcessWaiting; <>ProcMax; <>PurchPrice2)
	C_LONGINT:C283(<>Repeat; <>ScrnSavMin; <>SD3_l_DiaryVersion; <>SYS_l_AutoCapitalization; <>SYS_l_DecimalPlacesonPrices; <>SYS_l_MaxConnectedUsers; <>SYS_l_ORDDefaultRequiredDays; <>SYS_l_Windowx; <>SYS_l_Windowy; <>TelIPActual; <>TextSize)
	C_LONGINT:C283(<>TitleSize; $_l_ApplicationType; $_l_CountUsers; $_l_Index; $_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_TaskCount; $_l_UniqueProcessID; $1)
	C_PICTURE:C286(<>DB_Pic_CoLogo; <>SYS_pic_TitlePicture)
	C_REAL:C285(<>TimeDay)
	C_TEXT:C284(<>AT; <>ClientStat; <>ContClStat; <>ContEnqStat; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_addressFormatNotation; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_DefaultUser; <>DB_t_ErrorReportAddress)
	C_TEXT:C284(<>DB_t_ErrorReportPerson; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>DefContSta; <>DefCopytoaddress; <>DefPrior; <>DefRole; <>DefSignature; <>DefSta; <>DialPref; <>eLetAct)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>EnqStat; <>FaxServName; <>FaxServType; <>FaxServZone; <>Forename; <>FormFont; <>GenPrice; <>LabAct; <>LabProd)
	C_TEXT:C284(<>LetAct; <>MAIL_t_SMTPServer; <>MailSal; <>OLDPathName; <>PathName; <>SYS_t_PathVersion; <>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentEmailFrom; <>QtnAct; <>Source; <>STK_t_AllocationMovement)
	C_TEXT:C284(<>STK_t_PhysicalStockType; <>StockAss; <>STS_t_CRMDefaultAccountsRole; <>Surname; <>SYS_t_4DWriteType; <>SYS_t_AccessType; <>SYS_t_ACCOpenBalancesStatus; <>SYS_t_BaseCurrency; <>SYS_t_FormPath; <>SYS_t_FormSizeName; <>SYS_t_MainorRemote)
	C_TEXT:C284(<>SYS_t_MessageAction; <>SYS_t_StockOrderCompany; <>SYS_t_VersionNumber; <>TechCode; <>TelPCPath; <>TimeAct; <>TitAdd; <>TitAuth; <>TitDepCo; <>TitDepCoP; <>TitDepCoS)
	C_TEXT:C284(<>TitleLRC; <>TitPay; <>TitPayB; <>TitReg; <>UserAdd; <>UserScreen; <>WildCard; <>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_oldMethodName; $_t_ProcessName; vErrorMessage)
	C_TIME:C306(<>SYS_ti_DefaultDiaryTimeCheck; <>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultTimeDayStart; <>SYS_ti_DefaultTimeUnits)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UserDetailsBLOB")
$_bo_unload:=(Records in selection:C76([USER:15])=0)
<>DB_d_CurrentDate:=Current date:C33
LR_Custom
DB_ErrorReportSettings
If (Count parameters:C259=0)
	READ ONLY:C145([DATA_AUDITS:102])
	
	
	ARRAY TEXT:C222(<>Mod_at_ModuleName; 0)
	ARRAY TEXT:C222(<>Mod_at_ProcessFunction; 0)
	ARRAY LONGINT:C221(<>Mod_al_STRres; 0)
	ARRAY LONGINT:C221(<>Mod_al_ModuleOrder; 0)
	ARRAY TEXT:C222(<>Mod_at_ModuleColourName; 0)
	
	//ARRAY INTEGER(◊aMod;0)
	//GET PROCESS VARIABLE(-1;<>Mod_at_ModuleName;<>Mod_at_ModuleName;<>Mod_at_ProcessFunction;<>Mod_at_ProcessFunction;<>Mod_al_ModuleAccessType;<>Mod_al_ModuleAccessType;<>Mod_al_STRres;<>Mod_al_STRres)
	GET PROCESS VARIABLE:C371(-1; <>SYS_t_AccessType; <>SYS_t_AccessType)
	START_GetModulesFromServer
	
End if 


GET PROCESS VARIABLE:C371(-1; <>SD3_l_DiaryVersion; <>SD3_l_DiaryVersion; <>SYS_bo_CompanyStatusSeperate; <>SYS_bo_CompanyStatusSeperate)
GET PROCESS VARIABLE:C371(-1; <>PathName; <>PathName; <>OLDPathName; <>OLDPathName; <>SYS_t_FormPath; <>SYS_t_FormPath; <>SYS_l_AutoCapitalization; <>SYS_l_AutoCapitalization; <>SYS_d_InceptionDate; <>SYS_d_InceptionDate)
GET PROCESS VARIABLE:C371(-1; <>SYS_t_VersionNumber; <>SYS_t_VersionNumber; <>ConWPUsers; <>ConWPUsers; <>ConIMUsers; <>ConIMUsers; <>SYS_l_MaxConnectedUsers; <>SYS_l_MaxConnectedUsers; <>SYS_t_PathVersion; <>SYS_t_PathVersion)
GET PROCESS VARIABLE:C371(-1; <>YrPerF; <>YrPerF; <>YrPerT; <>YrPerT)
GET PROCESS VARIABLE:C371(-1; <>STS_t_CRMDefaultAccountsRole; <>STS_t_CRMDefaultAccountsRole)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_AutoShowQualities; <>SYS_bo_AutoShowQualities)
GET PROCESS VARIABLE:C371(-1; <>DB_Pic_CoLogo; <>DB_Pic_CoLogo)
GET PROCESS VARIABLE:C371(-1; <>WIP_t_TRPTrans; <>WIP_t_TRPTrans; <>WIP_t_CIPTRANS; <>WIP_t_CIPTRANS; <>WIP_t_TRWTrans; <>WIP_t_TRWTrans)
GET PROCESS VARIABLE:C371(-1; <>WIP_t_CIWTrans; <>WIP_t_CIWTrans; <>SYS_t_4DWriteType; <>SYS_t_4DWriteType; <>SYS_bo_CalenderPics; <>SYS_bo_CalenderPics; <>UserScreen; <>UserScreen)
GET PROCESS VARIABLE:C371(-1; <>SYS_t_FormSizeName; <>SYS_t_FormSizeName; <>SYS_bo_SDMonoCalendar; <>SYS_bo_SDMonoCalendar; <>LetAct; <>LetAct; <>eLetAct; <>eLetAct; <>QtnAct; <>QtnAct; <>SYS_t_StockOrderCompany; <>SYS_t_StockOrderCompany)
GET PROCESS VARIABLE:C371(-1; <>cwSelectColor; <>cwSelectColor; <>cwSelectStyle; <>cwSelectStyle; <>cwStartWeekOn; <>cwStartWeekOn)


If (<>eLetAct="")
	<>eLetAct:="Email"
End if 

GET PROCESS VARIABLE:C371(-1; <>DefSta; <>DefSta; <>ClientStat; <>ClientStat; <>ContClStat; <>ContClStat; <>EnqStat; <>EnqStat; <>ContEnqStat; <>ContEnqStat)
GET PROCESS VARIABLE:C371(-1; <>DefRole; <>DefRole; <>TechOrder; <>TechOrder; <>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultSVSResponse; <>TechCode; <>TechCode; <>LabAct; <>LabAct; <>LabProd; <>LabProd)
GET PROCESS VARIABLE:C371(-1; <>TitDepCo; <>TitDepCo; <>TitDepCoP; <>TitDepCoP; <>TitDepCoS; <>TitDepCoS; <>TitAdd; <>TitAdd; <>TitPay; <>TitPay; <>TitPayB; <>TitPayB; <>TitReg; <>TitReg)
GET PROCESS VARIABLE:C371(-1; <>TitAuth; <>TitAuth; <>ProcMax; <>ProcMax; <>ModuleIcons; <>ModuleIcons; <>PalDelay; <>PalDelay)
GET PROCESS VARIABLE:C371(-1; <>SYS_ti_DefaultTimeUnits; <>SYS_ti_DefaultTimeUnits; <>TimeYear; <>TimeYear; <>TimeAct; <>TimeAct; <>TimeDay; <>TimeDay; <>SYS_ti_DefaultTimeDayStart; <>SYS_ti_DefaultTimeDayStart; <>SYS_bo_CapitaliseTown; <>SYS_bo_CapitaliseTown)
GET PROCESS VARIABLE:C371(-1; <>DefPrior; <>DefPrior; <>SYS_l_ORDDefaultRequiredDays; <>SYS_l_ORDDefaultRequiredDays; <>ForceCred; <>ForceCred; <>Repeat; <>Repeat)
GET PROCESS VARIABLE:C371(-1; <>DB_t_DefaultUser; <>DB_t_DefaultUser; <>SYS_bo_DefaultSource; <>SYS_bo_DefaultSource; <>Source; <>Source; <>RemOver; <>RemOver; <>SalesOrder; <>SalesOrder; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultsCallback; <>SYS_bo_DefaultsCallback)
GET PROCESS VARIABLE:C371(-1; <>MultiCo; <>MultiCo; <>CCC; <>CCC; <>DefSal; <>DefSal; <>SelOr; <>SelOr; <>RemLaun; <>RemLaun; <>RemBeg; <>RemBeg)
GET PROCESS VARIABLE:C371(-1; <>SCPT_bo_NoAutoScripts; <>SCPT_bo_NoAutoScripts; <>StateAnal; <>StateAnal; <>ShowModBar; <>ShowModBar; <>TopModBar; <>TopModBar; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultEntry)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_DefaultsFind; <>SYS_bo_DefaultsFind; <>RemAllComp; <>RemAllComp; <>STK_t_PhysicalStockType; <>STK_t_PhysicalStockType; <>STK_t_AllocationMovement; <>STK_t_AllocationMovement; <>RemShowData; <>RemShowData; <>RemNewMod; <>RemNewMod)
GET PROCESS VARIABLE:C371(-1; <>OneEntry; <>OneEntry; <>SYS_t_MainorRemote; <>SYS_t_MainorRemote; <>RemNotProd; <>RemNotProd; <>TitleLRC; <>TitleLRC; <>SYS_pic_TitlePicture; <>SYS_pic_TitlePicture)
GET PROCESS VARIABLE:C371(-1; <>SYS_t_BaseCurrency; <>SYS_t_BaseCurrency; <>DB_bo_FunctionOrder; <>DB_bo_FunctionOrder; <>WildCard; <>WildCard; <>ContCheck; <>ContCheck; <>SYS_bo_RestrictCompanies; <>SYS_bo_RestrictCompanies; <>NoJT; <>NoJT)
GET PROCESS VARIABLE:C371(-1; <>StandMA; <>StandMA; <>AT; <>AT; <>DB_t_Address1Label; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_Address2Label; <>DB_t_TownLabel; <>DB_t_TownLabel; <>DB_t_CountyLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_PostcodeLabel)
GET PROCESS VARIABLE:C371(-1; <>DB_t_CountryLabel; <>DB_t_CountryLabel; <>DB_t_addressFormatNotation; <>DB_t_addressFormatNotation; <>PCC; <>PCC; <>DB_t_Address1Label; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_Address2Label)
GET PROCESS VARIABLE:C371(-1; <>Forename; <>Forename; <>Surname; <>Surname)
GET PROCESS VARIABLE:C371(-1; <>TermRP; <>TermRP)

GET PROCESS VARIABLE:C371(-1; <>CheckCredit; <>CheckCredit)
GET PROCESS VARIABLE:C371(-1; <>ContDedupCo; <>ContDedupCo; <>SYS_bo_ContactJustDeleteMC; <>SYS_bo_ContactJustDeleteMC; <>SYS_bo_ContactDuplicateCheck; <>SYS_bo_ContactDuplicateCheck; <>SYS_bo_CopyPreviousDate; <>SYS_bo_CopyPreviousDate)
GET PROCESS VARIABLE:C371(-1; <>SYS_l_DecimalPlacesonPrices; <>SYS_l_DecimalPlacesonPrices; <>DefContSta; <>DefContSta; <>DialPref; <>DialPref; <>DialSynch; <>DialSynch)
GET PROCESS VARIABLE:C371(-1; <>SYS_ti_DefaultDiaryTimeCheck; <>SYS_ti_DefaultDiaryTimeCheck; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentEmailFrom; <>FaxCover; <>FaxCover)
GET PROCESS VARIABLE:C371(-1; <>FaxDestin; <>FaxDestin; <>FaxHdrPage; <>FaxHdrPage; <>FaxMode; <>FaxMode; <>FaxPicker; <>FaxPicker)
GET PROCESS VARIABLE:C371(-1; <>FaxResol; <>FaxResol; <>FaxRetries; <>FaxRetries; <>FaxRetrySec; <>FaxRetrySec; <>FaxServAddr; <>FaxServAddr)
GET PROCESS VARIABLE:C371(-1; <>FaxServName; <>FaxServName; <>FaxServType; <>FaxServType; <>FaxServZone; <>FaxServZone)
GET PROCESS VARIABLE:C371(-1; <>FaxSingle; <>FaxSingle; <>FaxUrgent; <>FaxUrgent; <>FindMy; <>FindMy; <>Form4DW; <>Form4DW)
GET PROCESS VARIABLE:C371(-1; <>FormMethod; <>FormMethod; <>FormWPTit; <>FormWPTit; <>GenPrice; <>GenPrice)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_SpecifiedAccounts; <>SYS_bo_SpecifiedAccounts; <>MailSal; <>MailSal; <>MargCP; <>MargCP)
GET PROCESS VARIABLE:C371(-1; <>SYS_t_MessageAction; <>SYS_t_MessageAction)
GET PROCESS VARIABLE:C371(-1; <>SYS_t_ACCOpenBalancesStatus; <>SYS_t_ACCOpenBalancesStatus; <>OrdDelAdd; <>OrdDelAdd; <>SYS_bo_OrderItemPartDelivery; <>SYS_bo_OrderItemPartDelivery; <>OrdersDisTr; <>OrdersDisTr)
GET PROCESS VARIABLE:C371(-1; <>OrdQtyAlloc; <>OrdQtyAlloc)
GET PROCESS VARIABLE:C371(-1; <>Per_t_CurrentDefaultAnalCode; <>Per_t_CurrentDefaultAnalCode; <>POShowDisc; <>POShowDisc; <>POTheirCode; <>POTheirCode)
GET PROCESS VARIABLE:C371(-1; <>PER_l_ProcessWaiting; <>PER_l_ProcessWaiting; <>SYS_bo_PRDFurtherAnalSearch; <>SYS_bo_PRDFurtherAnalSearch)
GET PROCESS VARIABLE:C371(-1; <>PurchPayChe; <>PurchPayChe; <>PurchPayRem; <>PurchPayRem; <>PurchPrice2; <>PurchPrice2)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_LoqateAddressing; <>SYS_bo_LoqateAddressing; <>SalesHdrDP; <>SalesHdrDP; <>SalesItemDP; <>SalesItemDP; <>ScrnSavMin; <>ScrnSavMin)
GET PROCESS VARIABLE:C371(-1; <>ServShowCon; <>ServShowCon; <>ShowFunPal; <>ShowFunPal)
GET PROCESS VARIABLE:C371(-1; <>MAIL_t_SMTPServer; <>MAIL_t_SMTPServer; <>SR; <>SR; <>StockAnal; <>StockAnal; <>StockAss; <>StockAss)
GET PROCESS VARIABLE:C371(-1; <>StockPostAu; <>StockPostAu; <>StockPostIn; <>StockPostIn; <>StockPostIt; <>StockPostIt; <>StockPostOr; <>StockPostOr)
GET PROCESS VARIABLE:C371(-1; <>TelIPActual; <>TelIPActual; <>TelPCPath; <>TelPCPath; <>UserAdd; <>UserAdd)
GET PROCESS VARIABLE:C371(-1; <>ViewLists; <>ViewLists; <>SYS_l_Windowx; <>SYS_l_Windowx; <>SYS_l_Windowy; <>SYS_l_Windowy)
GET PROCESS VARIABLE:C371(-1; <>FormFont; <>FormFont; <>TitleSize; <>TitleSize; <>TextSize; <>TextSize; <>DataSize; <>DataSize)
GET PROCESS VARIABLE:C371(-1; <>Repeat; <>Repeat; <>PER_l_ProcessWaiting; <>PER_l_ProcessWaiting; <>ViewLists; <>ViewLists; <>SYS_bo_CopyPreviousDate; <>SYS_bo_CopyPreviousDate)
GET PROCESS VARIABLE:C371(-1; <>PalDelay; <>PalDelay; <>DB_bo_FunctionOrder; <>DB_bo_FunctionOrder; <>OneEntry; <>OneEntry; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultEntry)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_DefaultsFind; <>SYS_bo_DefaultsFind; <>FindMy; <>FindMy; <>SYS_t_AccessType; <>SYS_t_AccessType; <>SYS_bo_DefaultsCallback; <>SYS_bo_DefaultsCallback; <>SYS_l_AutoCapitalization; <>SYS_l_AutoCapitalization)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_CapitaliseTown; <>SYS_bo_CapitaliseTown; <>SYS_bo_RestrictCompanies; <>SYS_bo_RestrictCompanies; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultSales; <>SYS_bo_DefaultSource; <>SYS_bo_DefaultSource)
GET PROCESS VARIABLE:C371(-1; <>SalesOrder; <>SalesOrder; <>StandMA; <>StandMA; <>EnqStat; <>EnqStat; <>ClientStat; <>ClientStat)
GET PROCESS VARIABLE:C371(-1; <>ContClStat; <>ContClStat; <>GenPrice; <>GenPrice)
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_PWActive; <>SYS_bo_PWActive)

GET PROCESS VARIABLE:C371(-1; <>EMAIL_t_DefaultSMTPhost; <>EMAIL_t_DefaultSMTPhost)
GET PROCESS VARIABLE:C371(-1; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress)
GET PROCESS VARIABLE:C371(-1; <>DefCopytoaddress; <>DefCopytoaddress)
GET PROCESS VARIABLE:C371(-1; <>DefSignature; <>DefSignature)
<>SYS_bo_PWActiveOLD:=<>SYS_bo_PWActive
If (Count parameters:C259=0)
	$_l_ApplicationType:=Application type:C494
	If (Application type:C494=4D Remote mode:K5:5)
		
		$_l_CountUsers:=Count users:C342-1
	Else 
		$_l_CountUsers:=Count users:C342
	End if 
	
	If ($_l_CountUsers>DB_GetLicenceMaxUsers)
		Gen_Alert("The maximum of "+String:C10(DB_GetLicenceMaxUsers)+" Concurrent User(s) has been exceeded"; Quit_Name)
		QUIT 4D:C291
	Else 
		vErrorMessage:=""
		
		LR_Custom
		DB_LoadLicenceDetails
		If ((DB_GetLicenceString="") | ((<>DB_d_CurrentDate+5)>DB_GetLicenceExpiryDate))  //added kmw 09/10/07
			$_bo_isLicenced:=True:C214
			
		Else 
			$_bo_isLicenced:=True:C214
		End if 
		
		//ALL RECORDS([USER])
		If (((DB_GetLicenceString="") | ($_bo_isLicenced=False:C215)) | (<>DB_d_CurrentDate>DB_GetLicenceExpiryDate))
			ALERT:C41("Your licence for Daybook is not valid")
			USR_bo_DisableTempButton:=True:C214  //changes start BSW 27/05/02
			
			//User Licence
			User_Licence(True:C214)  //modified to suppress login screen 20/08/08 -kmw (gets done later anyway)
			
			
			//  QUIT 4D
			//changes end BSW 27/05/02
		Else 
			If (User in group:C338(Current user:C182; "Administrator")) & (LR_bo_Enable=False:C215)  //if user is an administrator and we are using old style licence
				If (<>DB_d_CurrentDate+30>DB_GetLicenceExpiryDate)
					$_d_ExiryDate:=DB_GetLicenceExpiryDate
					ALERT:C41("Your licence will expire on the "+String:C10($_d_ExiryDate)+" . Please contact Daybook for a licence update")
				End if 
			End if 
			<>Email_bo_Enabled:=IsEmailAvailable(True:C214)
		End if 
	End if 
Else 
	If (Application type:C494#4D Server:K5:6)
		$_l_TaskCount:=Count tasks:C335
		For ($_l_Index; 1; $_l_TaskCount)
			
			PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
			If ($_l_ProcessOrigin#Internal timer process:K36:29) & ($_l_ProcessOrigin#Client manager process:K36:31) & ($_l_ProcessOrigin#Server interface process:K36:20)
				SET PROCESS VARIABLE:C370($_l_Index; DB_bo_ConfigInited; False:C215)
				SET PROCESS VARIABLE:C370($_l_Index; DB_bo_TranslationInited; False:C215)
				SET PROCESS VARIABLE:C370($_l_Index; DB_bo_LedgerInited; False:C215)
				
			End if 
		End for 
	End if 
End if 
<>DB_t_ErrorReportPerson:="Nigel Greenlee"  // email error reports sent to this person
<>DB_t_ErrorReportAddress:="nigel.greenlee@me.com"  // 22/04/02 pb
//TRACE
If ($_bo_unload)
	UNLOAD RECORD:C212([USER:15])
End if 
//just in case still loaded
ERR_MethodTrackerReturn("UserDetailsBLOB"; $_t_oldMethodName)