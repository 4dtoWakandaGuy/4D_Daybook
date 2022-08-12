//%attributes = {}
If (False:C215)
	//Project Method Name:      User_inLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: User_inLP
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>DefSignature)
	//C_UNKNOWN(<>OfficeCode)
	//C_UNKNOWN(<>TermST)
	//C_UNKNOWN(<>UserAdd)
	//C_UNKNOWN(bd20)
	//C_UNKNOWN(bd22)
	//C_UNKNOWN(ch0)
	//C_UNKNOWN(ch1)
	//C_UNKNOWN(ch2)
	//C_UNKNOWN(ch5)
	//C_UNKNOWN(ch6)
	//C_UNKNOWN(ch7)
	//C_UNKNOWN(CreateSem)
	//C_UNKNOWN(iCancel)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(r0)
	//C_UNKNOWN(r1)
	//C_UNKNOWN(r2)
	//C_UNKNOWN(r3)
	//C_UNKNOWN(r4)
	//C_UNKNOWN(r6)
	//C_UNKNOWN(r7)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(s2)
	//C_UNKNOWN(s3)
	//C_UNKNOWN(Up_LogoMOD)
	//C_UNKNOWN(vButtDisUser)
	//C_UNKNOWN(vCreate)
	//C_UNKNOWN(vOrdTitle)
	//C_UNKNOWN(vTitle2)
	//C_UNKNOWN(vTitle3)
	//C_UNKNOWN(vTot)
	//C_UNKNOWN(xSearch)
	//C_UNKNOWN(xSet)
	//C_UNKNOWN(xSort)
	//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
	//ARRAY INTEGER(WS_aI_NumberHasBackslash;0)
	//ARRAY INTEGER(WS_aI_NumberIncludesOfficecode;0)
	//ARRAY INTEGER(WS_aI_Numberofleadingzeros;0)
	//ARRAY INTEGER(WS_aI_NumberTableID;0)
	//ARRAY INTEGER(WS_aI_NumberUsesMultiNumber;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY LONGINT(WS_al_NumberCurrentValue;0)
	//ARRAY LONGINT(WS_al_RecordNumbers;0)
	//ARRAY POINTER(SR_aptr_PrefsToSave;0)
	//ARRAY TEXT(PROD_at_ProductEntryForm;0)
	//ARRAY TEXT(PROD_at_ProductEntryFunction;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	//ARRAY TEXT(SMTP_at_UserAuthName;0)
	//ARRAY TEXT(SMTP_at_UserAuthPass;0)
	C_BOOLEAN:C305(<>PW_Bo_WindowsAutoLogin; <>SYS_bo_CapitaliseTown; <>TermST; $_bo_Continue; $_bo_OK; CAT_bo_ChangePrefs; DB_bo_NoLoad; DB_bo_RecordModified; DM_bo_CreditsSequence; DM_bo_nomAllowUnProc; DM_bo_nomLedgersBatched)
	C_BOOLEAN:C305(DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch; DM_bo_nomPostbyCompany; DM_bo_nomTransinCalc; DM_bo_nomVatcash; DM_bo_SALESAllowInvoicecancel; DM_bo_SALESAllowInvoicenoPrint; DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESInvoiceAutoReceipt; EW_bo_ModifiedSettings)
	C_BOOLEAN:C305(SD_bo_ChangePrefs; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork; Up_LogoMOD; <>PW_bo_PasswordExpires; <>PW_Bo_WindowsAutoLogin; <>SYS_bo_CapitaliseTown; $_bo_Continue; $_bo_OK)
	C_BOOLEAN:C305(CAT_bo_ChangePrefs; DB_bo_NoLoad; DB_bo_RecordModified; DM_bo_CreditsSequence; DM_bo_nomAllowUnProc; DM_bo_nomenforceAnalysis; DM_bo_nomLedgersBatched; DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch; DM_bo_nomPostbyCompany; DM_bo_nomTransinCalc)
	C_BOOLEAN:C305(DM_bo_nomVatcash; DM_bo_SALESAllowInvoicecancel; DM_bo_SALESAllowInvoicenoPrint; DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESAllowPurchaseZero; DM_bo_SALESInvoiceAutoReceipt; EW_bo_ModifiedSettings; SD_bo_ChangePrefs; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence)
	C_BOOLEAN:C305(SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_DATE:C307(DM_D_SalesLEdgerStartDate)
	C_LONGINT:C283(<>PW_l_ExpiryDays; $_l_ButtonPressed; $_l_Event; $_l_FirstIdentityNumber; $_l_FunctionPosition; $_l_IdentityNumber; $_l_IDTableNumber; $_l_Index; $_l_Process; bd20; bd22)
	C_LONGINT:C283(CAT_l_DefaultCatalogue; ch0; ch1; ch2; ch5; ch6; ch7; DB_l_ButtonClickedFunction; DM_l_NomAgingStage1; DM_l_NomAgingStage3; EW_l_SelectedTableNumber)
	C_LONGINT:C283(iCancel; iOK; PROD_l_SimpleProdEntry; r0; r1; r2; r3; r4; r6; r7; s1)
	C_LONGINT:C283(s2; s3; SD_CB_l_result; SD_CB_l_resultSequences; SD_CB_l_SaturdayWork; SD_l_SaturdayWork; SD_l_SundayWork; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType; vCreate; xSearch)
	C_LONGINT:C283(xSet; xSort; <>BAR; <>PW_l_ExpiryDays; $_l_ButtonPressed; $_l_Event; $_l_FirstIdentityNumber; $_l_FunctionPosition; $_l_IdentityNumber; $_l_IDTableNumber; $_l_Index)
	C_LONGINT:C283($_l_Process; bd21; CAT_l_DefaultCatalogue; DB_l_ButtonClickedFunction; DM_l_NomAgingStage1; DM_l_NomAgingStage2; DM_l_NomAgingStage3; EW_l_SelectedTableNumber; PROD_l_SimpleProdEntry; r5; SD_CB_l_result)
	C_LONGINT:C283(SD_CB_l_resultSequences; SD_CB_l_SaturdayWork; SD_l_SundayWork; SMTP_l_AUTH; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType)
	C_PICTURE:C286(UP_Logo)
	C_REAL:C285(vTot; <>PW_l_ExpiryDay)
	C_TEXT:C284(<>DefSignature; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>OfficeCode; <>SYS_t_MainorRemote; <>UserAdd; $_t_IndentityString; $_t_Machine; $_t_oldMethodName; $_t_ProcessName; CreateSem)
	C_TEXT:C284(DB_t_CallOnCloseorSave; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_NomActualLayer; DM_T_NomDefaultCreditStage)
	C_TEXT:C284(DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax; DM_T_NomPurchaseTerms; DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay; DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC)
	C_TEXT:C284(DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName; vButtDisUser; vOrdTitle; vTitle2; vTitle3; <>DefCopytoaddress; <>EMAIL_t_DefaultReplyToAddress)
	C_TEXT:C284(<>EMAIL_t_DefaultSMTPhost; <>SYS_t_MainorRemote; $_t_IndentityString; $_t_Machine; $_t_oldMethodName; $_t_ProcessName; $_t_user; DB_t_CallOnCloseorSave; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD)
	C_TEXT:C284(DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_BankAccTo; DM_T_NomActualLayer; DM_T_NomDefaultCreditStage; DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax; DM_T_NomPurchaseTerms)
	C_TEXT:C284(DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay; DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC; DM_T_nomVatECCreditor; DM_T_nomVatInput)
	C_TEXT:C284(DM_T_nomVatOutput; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName; vTitle1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_inLP")
//User_inLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "user_in")
		
		
		ch0:=0
		ch1:=0  //these are here in case the buttons are removed in Silver
		ch2:=0
		ch5:=0
		ch6:=0
		ch7:=0
		Case of 
			: ([USER:15]Capitalisation:67=0)
				ch0:=1
			: ([USER:15]Capitalisation:67=1)
				ch1:=1
			: ([USER:15]Capitalisation:67=2)
				ch2:=1
		End case 
		If (Count users:C342>1)
			READ ONLY:C145([IDENTIFIERS:16])
			OBJECT SET ENABLED:C1123(xSearch; False:C215)
			OBJECT SET ENABLED:C1123(xSort; False:C215)
			OBJECT SET ENABLED:C1123(xSet; False:C215)
		End if 
		User_FilesSrch
		//the subform entry does not work on windows
		//so
		WS_fileprefs2array
		User_InLPMoR
		
		If ((Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator"))))
			OBJECT SET ENTERABLE:C238([USER:15]Main or Remote:115; False:C215)
		End if 
		If ((Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator"))) & (<>SYS_t_MainorRemote="R"))
			OBJECT SET ENTERABLE:C238([USER:15]Office Code:13; False:C215)
		End if 
		If ([USER:15]Title LRC:117="")
			[USER:15]Title LRC:117:="C"
		End if 
		If (<>TermST)
			vTitle1:="Default Sales Tax Code"
			vTitle2:="Default Use Tax Code"
			vTitle3:="Tax Accounts"
		Else 
			vTitle1:="Default Standard VAT"
			vTitle2:="(not applicable)"
			vTitle3:="VAT Accounts"
		End if 
		User_vAT
		vOrdTitle:=Uppercase:C13(Term_StoWT("STOCK CONTROL"))
		r4:=0
		r5:=0
		r6:=0
		r7:=0
		Case of 
			: ([USER:15]Purch Price2:153=0)
				r4:=1
			: ([USER:15]Purch Price2:153=1)
				r5:=1
			: ([USER:15]Purch Price2:153=2)
				r6:=1
			: ([USER:15]Purch Price2:153=3)
				r7:=1
		End case 
		s1:=0
		s2:=0
		s3:=0
		Case of 
			: ([USER:15]Form Method:134=0)
				s1:=1
			: ([USER:15]Form Method:134=1)
				s2:=1
			: ([USER:15]Form Method:134=2)
				s3:=1
		End case 
		
		If (<>Bar=47)  //Silver
			If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
				DB_MenuAction("Section"; "Core Data"; 3; "")
				//DISABLE MENU ITEM(2049;3)
			End if 
			
			DB_MenuAction("Section"; "Stock Control"; 1; Term_StoWT("Stock Control"))
			//SET MENU ITEM(2049;3;Term_StoWT ("Stock Control"))
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2))
				DB_MenuAction("Section"; "Stock Control"; 3; "")
				
				//  DISABLE MENU ITEM(2049;4)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2))
				DB_MenuAction("Section"; "Sales"; 3; "")
				DB_MenuAction("Section"; "Purchases"; 3; "")
				// `DISABLE MENU ITEM(2049;5)
				// DISABLE MENU ITEM(2049;6)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
				DB_MenuAction("Section"; "Accounts"; 3; "")
				//DISABLE MENU ITEM(2049;7)
			End if 
		Else 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
				DB_MenuAction("Section"; "Stock Control"; 3; "")
				//DISABLE MENU ITEM(2049;4)
			End if 
			
			DB_MenuAction("Section"; "Stock Control"; 1; Term_StoWT("Stock Control"))
			//  SET MENU ITEM(2049;4;Term_StoWT ("Stock Control"))
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2))
				DB_MenuAction("Section"; "Sales"; 3; "")
				//   DISABLE MENU ITEM(2049;5)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2))
				
				DB_MenuAction("Section"; "Purchases"; 3; "")
				DB_MenuAction("Section"; "Accounts"; 3; "")
				//DISABLE MENU ITEM(2049;6)
				//  DISABLE MENU ITEM(2049;7)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
				DB_MenuAction("Section"; "Call Centre"; 3; "")
				//  DISABLE MENU ITEM(2049;8)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
				DB_MenuAction("Section"; "Job Costing"; 3; "")
				//DISABLE MENU ITEM(2049;9)
			End if 
			If ((DB_GetModuleSettingByNUM(21)<2) & (DB_GetModuleSettingByNUM(32)<2) & (DB_GetModuleSettingByNUM(Module_IntServer)<2))
				
				DB_MenuAction("Section"; "Communications"; 3; "")
				// DISABLE MENU ITEM(2049;10)
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ChequeWriter))<2)
			OBJECT SET ENTERABLE:C238([USER:15]Purch PayRem:148; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]Purch PayCheq:149; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			OBJECT SET ENTERABLE:C238([USER:15]Actual Layer:146; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]Layers AccSrc:151; False:C215)
		End if 
		//Remove when ACI sort out Modules Palette
		//See also User_Details  & Menu_DisFile
		// SET ENTERABLE([USER]Show ModBar;False)
		If ((DB_GetModuleSettingByNUM(1))=5)
			OBJECT SET ENTERABLE:C238([USER:15]Func Palette:162; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]Prod Func Ord:122; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_FaxManager))<2)  //Fax"
			DB_MenuAction("Section"; "Fax Settings"; 3; "")
			// DISABLE MENU ITEM(2049;13)
		End if 
		If (Is macOS:C1572)
			
			OBJECT SET ENTERABLE:C238([USER:15]QA Path Name:181; False:C215)
			OBJECT SET ENABLED:C1123(ch5; False:C215)
			OBJECT SET ENABLED:C1123(ch6; False:C215)
			OBJECT SET ENABLED:C1123(ch7; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]QA Commas:182; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]QA Abbrev:183; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]QA Optional:184; False:C215)
		Else 
			If ((<>UserAdd#"@BWB@") & (DB_GetModuleSettingByNUM(31)<2) & (DB_GetModuleSettingByNUM(35)<2))
				DB_MenuAction("Section"; "Other"; 3; "")
				//DISABLE MENU ITEM(2050;14)
			Else 
				If ([USER:15]QA Uppers:185=4)
					ch7:=1
					ch6:=1
					ch5:=1
				Else 
					If ([USER:15]QA Uppers:185=3)
						ch6:=1
						ch5:=1
					Else 
						If ([USER:15]QA Uppers:185=2)
							ch6:=1
						Else 
							ch5:=1
						End if 
					End if 
				End if 
			End if 
		End if 
		r1:=0
		r2:=0
		r3:=0
		r4:=0
		//there is now only two options 4D write or NOT!
		Case of 
			: ([USER:15]Word Processor:14=0)
				r0:=1
			: ([USER:15]Word Processor:14=1)
				r1:=1
			: ([USER:15]Word Processor:14=2)
				r1:=1
				[USER:15]Word Processor:14:=1
			: ([USER:15]Word Processor:14=3)
				r1:=1
				[USER:15]Word Processor:14:=1
		End case 
		
		Up_LogoMOD:=False:C215
		
		QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1="LOGO")
		If (Records in selection:C76([PICTURES:85])=1)
			UP_Logo:=[PICTURES:85]Picture:3
		End if 
		
		
		If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
			OBJECT SET ENTERABLE:C238([USER:15]Assembly Stock:180; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENTERABLE:C238([USER:15]Exch Contr Acc:186; False:C215)
			OBJECT SET ENTERABLE:C238([USER:15]Bank ExCh Acc:187; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(40))=0)
			OBJECT SET ENTERABLE:C238([USER:15]Term Code:129; False:C215)
		End if 
		
		bd21:=0
		bd22:=0
		bd20:=0
		Case of 
			: ([USER:15]Fax Mode:215=1)
				bd21:=1
			: ([USER:15]Fax Mode:215=2)
				bd22:=1
			Else 
				bd20:=1
		End case 
		
		If (Is Windows:C1573)
			OBJECT SET ENTERABLE:C238([USER:15]Module Icons:79; False:C215)
		End if 
		
		User_FontsUp
		DB_LoadPasswordAutoSetup
		PW_l_WindowsAutoLogin:=Num:C11(<>PW_Bo_WindowsAutoLogin)
		PW_l_AutoExpire:=Num:C11(<>PW_bo_PasswordExpires)
		PW_l_ExpiryDays:=<>PW_l_ExpiryDays
		OBJECT SET VISIBLE:C603(*; "oAutoLogin@"; [USER:15]SinglePWsystem:235)
		If (Not:C34([USER:15]SinglePWsystem:235))  //Just to make sure nothing else has turned that option on....
			<>PW_Bo_WindowsAutoLogin:=False:C215
			<>PW_l_ExpiryDay:=0
			PW_l_WindowsAutoLogin:=Num:C11(<>PW_Bo_WindowsAutoLogin)
			PW_l_AutoExpire:=Num:C11(<>PW_bo_PasswordExpires)
			PW_l_ExpiryDays:=<>PW_l_ExpiryDays
		End if 
		DB_t_CallOnCloseorSave:="File"
		vButtDisUser:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisUser)
		DB_bo_RecordModified:=True:C214
		vTot:=0
		In_ButtChkDis(->vButtDisUser)
		DB_LoadLedgerPreferences
		DB_LoadProductCodePreferences
		[USER:15]SL New Date:154:=DM_D_SalesLEdgerStartDate
		[USER:15]Bank From:15:=DM_T_BankAccFrom
		[USER:15]Bank To:16:=DM_T_BankAccTo
		[USER:15]Exch Contr Acc:186:=DM_T_BankAccCurrencyExchange
		[USER:15]Bank ExCh Acc:187:=DM_T_BankAccCurrencyCharges
		[USER:15]BS Profit Adj:225:=DM_T_BankAccBalanceAdjustments
		[USER:15]BS Profit BFWD:29:=DM_T_BankAccBalanceProfitBFWD
		[USER:15]BS Profit YTD:26:=DM_T_BankAccBalanceProfitYTD
		[USER:15]Cash From:17:=DM_T_BankAccCashFrom
		[USER:15]Cash To:18:=DM_T_BankAccCashTo
		[USER:15]VAT Input:19:=DM_T_nomVatInput
		[USER:15]VAT Output:20:=DM_T_nomVatOutput
		[USER:15]Credit Note Sep:118:=DM_bo_CreditsSequence
		[USER:15]Actual Layer:146:=DM_T_NomActualLayer
		[USER:15]Default Terms:113:=DM_T_NomSalesTerms
		[USER:15]Default Terms:113:=DM_T_NomPurchaseTerms
		[USER:15]Def Cred Stage:90:=DM_T_NomDefaultCreditStage
		[USER:15]AD 1:34:=DM_l_NomAgingStage1
		[USER:15]AD 2:35:=DM_l_NomAgingStage2
		[USER:15]AD 3:36:=DM_l_NomAgingStage3
		[USER:15]Def Purch Tax:131:=DM_T_NomDefaultPurchaseTax
		[USER:15]Def VAT Code:91:=DM_T_NomDefaultSalesTax
		[USER:15]VAT Cash:212:=DM_bo_nomVatcash
		[USER:15]VAT CashAcc:211:=DM_T_nomVatCashACC
		[USER:15]VAT EC Creditor:75:=DM_T_nomVatECCreditor
		[USER:15]Deposit Rec:60:=DM_T_nomTRANSDepositReconcile  //Replaces <>DepRTrans
		[USER:15]Deposit Trans:59:=DM_T_nomTRANDepositReceipt
		[USER:15]Invoice Trans:21:=DM_T_nomTRANSInvoicePost
		[USER:15]InvoiceP Trans:24:=DM_T_nomTRANSInvoiceReceipt
		[USER:15]PrePay Rec:62:=DM_T_nomTRANSInvoicePrePay
		[USER:15]PrePay Trans:61:=DM_T_nomTRANSPurchasePrePay
		[USER:15]Purch Trans:27:=DM_T_nomTRANSPurchase
		[USER:15]PurchP Trans:28:=DM_T_nomTRANSPurchasePay
		[USER:15]Zero Invoices:169:=DM_bo_SALESAllowPurchaseZero
		[USER:15]NL LedgerBat:190:=DM_bo_nomLedgersBatched
		[USER:15]NL Rec Jour:163:=DM_bo_nomLedgersRecJournal
		[USER:15]NL Unproc:188:=DM_bo_nomAllowUnProc
		[USER:15]PayRec Batch:213:=DM_bo_nomPostatendofbatch
		[USER:15]PayRec ByCo:205:=DM_bo_nomPostbyCompany
		[USER:15]PL Analysis:227:=DM_bo_nomenforceAnalysis
		[USER:15]TransIn Calc:145:=DM_bo_nomTransinCalc
		[USER:15]Zero Invoices:169:=DM_bo_SALESAllowInvoiceZero
		[USER:15]Invoices Cancel:72:=DM_bo_SALESAllowInvoicecancel
		[USER:15]Invoices NoPrin:132:=DM_bo_SALESAllowInvoicenoPrint
		[USER:15]Invoices Unproc:71:=DM_bo_SALESAllowInvoiceUnproc
		[USER:15]Invoices PayAft:133:=DM_bo_SALESInvoiceAutoReceipt
		
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[USER:15]); "user_in")
		
		
		In_ButtChkDis(->vButtDisUser)
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		<>EMAIL_t_DefaultSMTPhost:=[USER:15]DEF_SMTP_HOST:236
		<>EMAIL_t_DefaultReplyToAddress:=[USER:15]Email From:232
		<>DefCopytoaddress:=[USER:15]DEF_Copy_to_email:237
		<>DefSignature:=[USER:15]Default_mail_signature:238
		
		$_bo_Continue:=True:C214  // 29/10/02 pb
		If (EW_bo_ModifiedSettings)
			$_bo_Continue:=EW_FieldMapSave(EW_l_SelectedTableNumber)
		End if 
		$_bo_Continue:=True:C214  //BSW/NG 5/12/03 this must be true
		If ($_bo_Continue)
			If ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1))
				DB_SavePrefs
				DB_SaveDataCheckPrefs
				DB_LoadViewPreference(True:C214)
				SVS_LoadPreferences(True:C214)
				If (PROD_l_SimpleProdEntry=1)
					
					$_l_FunctionPosition:=Find in array:C230(PROD_at_ProductEntryFunction; "Enter Products from sales orders")
					If ($_l_FunctionPosition>0)
						PROD_at_ProductEntryForm{$_l_FunctionPosition}:="Products_SimplifiedEntry"
						
					Else 
						APPEND TO ARRAY:C911(PROD_at_ProductEntryForm; "Products_SimplifiedEntry")
						APPEND TO ARRAY:C911(PROD_at_ProductEntryFunction; "Enter Products from sales orders")
					End if 
				Else 
					$_l_FunctionPosition:=Find in array:C230(PROD_at_ProductEntryFunction; "Enter Products from sales orders")
					If ($_l_FunctionPosition>0)
						//(PROD_at_ProductEntryForm{$Ref}:="")
						PROD_at_ProductEntryForm{$_l_FunctionPosition}:=""  //-kmw, 31/07/08 (removed brackets)
						
					Else 
						APPEND TO ARRAY:C911(PROD_at_ProductEntryForm; "")
						APPEND TO ARRAY:C911(PROD_at_ProductEntryFunction; "Enter Products from sales orders")
					End if 
				End if 
				PROD_GetFunctionPref(True:C214)
				
				SMS_SaveVariables
				SMS_LoadVariables
				SP_SaveGenPrefs
				Cat_SavePrefs  // 29/10/02 pb
				Ecommerce_SavePrefs  // 29/10/02 pb
				EW_SavePrefs  // 31/10/02 pb
				JC_SavePrefs  //added 23/02/07 -kmw
				JC_SavePrefs2  //added 12/04/07 -kmw
				DSPLY_SavePrefs  //added 27/06/08 -kmw
				//added 27/06/08 -kmw (progress bars check is done regularly so in this case for speed of access it is worth it to store the pref in an interprocess on startup and after change to pref)
				
				BP_SavePrefs  //BSW 21/01/03 This loads backup sync prefs
				ORD_DeliveryDatePrefs(True:C214)
				DF_LoadProdPriceSettings(True:C214)
				DF_LoadOrderEntryOption(True:C214)
				ARRAY POINTER:C280(SR_aptr_PrefsToSave; 0)
				If (Size of array:C274(REP_at_DocReportTo)>0)
					Reports_PrefsSaveNEW(REP_at_DocReportTo{REP_at_DocReportTo}; "REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[DOCUMENTS:7]); 0)
				End if 
				//Added 14/11/08 v631b120i -kmw
				
				
				Reports_PrefsCommit  //Added 02/12/08 v631b120i -kmw
				
				Doc_userPreferencesSave
				
				SYS_LOADSMTPAUTH(True:C214; ->SMTP_l_AUTH; ->SMTP_l_GeneralPassActive; ->SMTP_l_GeneralPassType; ->SMTP_t_GeneralPassName; ->SMTP_t_GeneralPassAuth; ->SMTP_al_UserIDs; ->SMTP_al_UserAuthActive; ->SMTP_al_UserAuthType; ->SMTP_at_UserAuthName; ->SMTP_at_UserAuthPass; ->SMTP_abo_UserPassSSL)  //note here we are only loading the arrays.and system settings
				
				DB_LoadPasswordAutoSetup(True:C214)
				//save files array
				If (Up_LogoMOD=True:C214)
					If (Picture size:C356(UP_Logo)>0)
						
						READ WRITE:C146([PICTURES:85])
						QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1="LOGO")
						If (Records in selection:C76([PICTURES:85])=0)
							CREATE RECORD:C68([PICTURES:85])
							[PICTURES:85]Picture_Code:1:="LOGO"
						End if 
						[PICTURES:85]Picture_Name:2:="Company Logo"
						[PICTURES:85]Picture:3:=UP_Logo
						DB_SaveRecord(->[PICTURES:85])
						AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
						UNLOAD RECORD:C212([PICTURES:85])
					Else 
						READ WRITE:C146([PICTURES:85])
						QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1="LOGO")
						DELETE RECORD:C58([PICTURES:85])
						READ ONLY:C145([PICTURES:85])
						
					End if 
				End if 
				
				DB_SaveOldPrefstoNew
				
				READ WRITE:C146([IDENTIFIERS:16])
				For ($_l_Index; 1; Size of array:C274(WS_aI_NumberTableID))
					GOTO RECORD:C242([IDENTIFIERS:16]; WS_al_RecordNumbers{$_l_Index})
					//``
					LOAD RECORD:C52([IDENTIFIERS:16])
					$_bo_OK:=True:C214
					While ($_bo_OK=True:C214)
						$_bo_OK:=(Locked:C147([IDENTIFIERS:16]))
						If ($_bo_OK)
							//I HAVE SEEN 4D TELL ME A RECORDS IS LOCKED-WHEN IT NOT
							LOCKED BY:C353([IDENTIFIERS:16]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
							If ($_l_Process=Current process:C322) & ($_t_user=Current user:C182) | ($_l_Process=0)
								//THEN ITS NOT REALLY LOCKED
								$_bo_OK:=False:C215
							End if 
						End if 
					End while 
					//``
					
					[IDENTIFIERS:16]Office_Code:4:=(WS_aI_NumberIncludesOfficecode{$_l_Index}=1)
					[IDENTIFIERS:16]Backslash:5:=(WS_aI_NumberHasBackslash{$_l_Index}=1)
					[IDENTIFIERS:16]Leading_Zeros:6:=WS_aI_Numberofleadingzeros{$_l_Index}
					//``
					$_l_IDTableNumber:=[IDENTIFIERS:16]Table_Number:1
					CreateSem:="CodeCr"+String:C10($_l_IDTableNumber)
					Case of 
						: ((WS_aI_NumberUsesMultiNumber{$_l_Index}=1) & ([IDENTIFIERS:16]Multiple_Numbers:7=False:C215))
							Gen_Confirm("Are you sure that you want to convert the "+[IDENTIFIERS:16]Name:3+" Unique No sequence"+" to the 'Multiple Numbers' method?  40 Numbers will be "+"created, starting from the Number specified +1."; "Yes"; "No")
							If (OK=1)
								WS_aI_NumberUsesMultiNumber{$_l_Index}:=1
								$_l_IDTableNumber:=New process:C317("Gen_CodeCreate"; 128000; String:C10($_l_IDTableNumber); $_l_IDTableNumber)
								DelayTicks(180)
								While (Semaphore:C143(CreateSem))
									DelayTicks(30)
									
								End while 
								CLEAR SEMAPHORE:C144(CreateSem)
							Else 
								WS_aI_NumberUsesMultiNumber{$_l_Index}:=1
							End if 
						: ((WS_aI_NumberUsesMultiNumber{$_l_Index}=0) & ([IDENTIFIERS:16]Multiple_Numbers:7=True:C214))
							If (Not:C34(Semaphore:C143(CreateSem)))
								Gen_Confirm("Are you sure that you want to convert the "+[IDENTIFIERS:16]Name:3+" Unique No sequence"+" back to the standard method?"+"  Existing 'Multiple Numbers' will be deleted,"+" and any gaps in the sequence will become permanent."; "Yes"; "No")
								If (OK=1)
									WS_aI_NumberUsesMultiNumber{$_l_Index}:=0
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)
									If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
										MESSAGES OFF:C175
										ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
										MESSAGES ON:C181
										FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
										$_l_FirstIdentityNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										$_t_IndentityString:=""
										While (Not:C34(End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])))
											If ($_l_FirstIdentityNumber#[IDENTIFIERS_MULTI_NUMBERS:94]Number:2)
												$_t_IndentityString:=$_t_IndentityString+String:C10([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)+" "
											Else 
												$_l_IdentityNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
											End if 
											NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
											$_l_FirstIdentityNumber:=$_l_FirstIdentityNumber-1
										End while 
										If ($_t_IndentityString="")
											LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
											[IDENTIFIERS:16]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2-1
										Else 
											Gen_Alert("NB: The following numbers will now never be used: "+$_t_IndentityString)
											[IDENTIFIERS:16]Number:2:=$_l_IdentityNumber-1
										End if 
										
										DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
										
										
									End if 
									$_l_FirstIdentityNumber:=$_l_IDTableNumber+9000
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_FirstIdentityNumber)
									DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
								Else 
									WS_aI_NumberUsesMultiNumber{$_l_Index}:=1
								End if 
								CLEAR SEMAPHORE:C144(CreateSem)
							Else 
								Gen_Alert("The Numbers are currently in use and cannot be updated"; "Cancel")
								WS_aI_NumberUsesMultiNumber{$_l_Index}:=1
							End if 
					End case 
					
					Case of 
						: (WS_al_NumberCurrentValue{$_l_Index}#[IDENTIFIERS:16]Number:2)
							If (WS_aI_NumberUsesMultiNumber{$_l_Index}=1)
								$_l_IDTableNumber:=WS_aI_NumberUsesMultiNumber{$_l_Index}
								CreateSem:="CodeCr"+String:C10($_l_IDTableNumber)
								Gen_Confirm("Are you sure that you want to modify the "+[IDENTIFIERS:16]Name:3+" Number?"+"  Existing 'Multiple Numbers' will be deleted, and 40 more created, starting"+"  from the Number specified +1."; "Yes"; "No")
								If (OK=1)
									DB_SaveRecord(->[IDENTIFIERS:16])
									READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
									$_l_FirstIdentityNumber:=$_l_IDTableNumber+9000
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1; *)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  | ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_FirstIdentityNumber)
									DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
									$_l_IDTableNumber:=[IDENTIFIERS:16]Table_Number:1
									DB_SaveRecord(->[IDENTIFIERS:16])
									UNLOAD RECORD:C212([IDENTIFIERS:16])
									$_l_IDTableNumber:=New process:C317("Gen_CodeCreate"; 24000; String:C10($_l_IDTableNumber); $_l_IDTableNumber)
									DelayTicks(180)
									While (Semaphore:C143(CreateSem))
										DelayTicks(30)
									End while 
									CLEAR SEMAPHORE:C144(CreateSem)
									vTot:=1
								Else 
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)
									If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
										MESSAGES OFF:C175
										ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
										MESSAGES ON:C181
										FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
										[IDENTIFIERS:16]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
									End if 
								End if 
							End if 
							
					End case 
					//``
					If (WS_al_NumberCurrentValue{$_l_Index}>[IDENTIFIERS:16]Number:2)
						[IDENTIFIERS:16]Number:2:=WS_al_NumberCurrentValue{$_l_Index}
					End if 
					[IDENTIFIERS:16]Multiple_Numbers:7:=(WS_aI_NumberUsesMultiNumber{$_l_Index}=1)
					DB_SaveRecord(->[IDENTIFIERS:16])
				End for 
				
			Else   //Added kmw 02/12/08 -v631b120i
				Reports_PrefsCancel  //Added 02/12/08 v631b120i -kmw (although probably unnessary to clear out the arrys (as i would guess that Process_Ends  anyway after a cancel) but doing this just in case)
				
			End if 
			$_l_ButtonPressed:=DB_l_ButtonClickedFunction
			If (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
				If (SD_bo_ChangePrefs)
					//update the prefs
					
					SD_bo_SaturdayWork:=(SD_CB_l_SaturdayWork=1)
					SD_bo_SundayWork:=(SD_l_SundayWork=1)
					SD_bo_ResultsDialog:=(SD_CB_l_result=1)
					SD_bo_ResultsDialogSequence:=(SD_CB_l_resultSequences=1)
					
					SD_SavePrefs(-1)
				End if 
				If (CAT_bo_ChangePrefs)
					READ WRITE:C146([Catalogue_Availability:110])
					QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-1)
					If (Records in selection:C76([Catalogue_Availability:110])>0)
						
						DB_lockFile(->[Catalogue_Availability:110])
						APPLY TO SELECTION:C70([Catalogue_Availability:110]; [Catalogue_Availability:110]Default:4:=False:C215)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[Catalogue_Availability:110]))
						QUERY SELECTION:C341([Catalogue_Availability:110]; [Catalogue_Availability:110]Catalogue_ID:3=CAT_l_DefaultCatalogue)
					End if 
					If (Records in selection:C76([Catalogue_Availability:110])=0)
						CREATE RECORD:C68([Catalogue_Availability:110])
						[Catalogue_Availability:110]Person_Or_GroupID:2:=-1
						[Catalogue_Availability:110]Catalogue_ID:3:=CAT_l_DefaultCatalogue
						
					End if 
					[Catalogue_Availability:110]Default:4:=True:C214
					DB_SaveRecord(->[Catalogue_Availability:110])
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
					UNLOAD RECORD:C212([Catalogue_Availability:110])
				End if 
			End if 
			
			
			In_ButtCall(""; ""; ""; ->[USER:15]; ->[USER:15]Organisation:1; "User"; ""; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisUser)
		End if   // $_bo_Continue 29/10/02 pb
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
		
	: ($_l_Event=On Data Change:K2:15)
		
		Case of 
			: (Modified:C32([USER:15]Path Name:12))
				[USER:15]Limit Date:58:=!00-00-00!
				vCreate:=1
			: (Modified:C32([USER:15]Name:38))
				[USER:15]Name:38:=Uppers2([USER:15]Name:38)
			: (Modified:C32([USER:15]Organisation:1))
				[USER:15]Organisation:1:=Uppers2([USER:15]Organisation:1)
			: (Modified:C32([USER:15]Add1:2))
				[USER:15]Add1:2:=Uppers2([USER:15]Add1:2)
			: (Modified:C32([USER:15]Add2:3))
				[USER:15]Add2:3:=Uppers2([USER:15]Add2:3)
			: (Modified:C32([USER:15]Town:4))
				If (<>SYS_bo_CapitaliseTown)
					If (Substring:C12([USER:15]Town:4; 1; 1)="!")
						[USER:15]Town:4:=Substring:C12([USER:15]Town:4; 2; 32000)
					Else 
						[USER:15]Town:4:=Uppercase:C13([USER:15]Town:4)
					End if 
				Else 
					[USER:15]Town:4:=Uppers2([USER:15]Town:4)
				End if 
			: (Modified:C32([USER:15]County:5))
				[USER:15]County:5:=Uppers2([USER:15]County:5)
			: (Modified:C32([USER:15]Postcode:6))
				[USER:15]Postcode:6:=Uppercase:C13([USER:15]Postcode:6)
			: (Modified:C32([USER:15]Country:7))
				If ((DB_GetModuleSettingByNUM(1))=5)
					[USER:15]Country:7:=Uppers2([USER:15]Country:7)
				Else 
					Check_Minor(->[USER:15]Country:7; "Country"; ->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]Address_Format:2; "Countries In")
					User_vAT
				End if 
			: (Modified:C32([USER:15]VAT Reg No:11))
				[USER:15]VAT Reg No:11:=Uppercase:C13([USER:15]VAT Reg No:11)
			: (Modified:C32([USER:15]VAT Prefix:70))
				[USER:15]VAT Prefix:70:=Uppercase:C13(Substring:C12([USER:15]VAT Prefix:70; 1; 2))
			: (Modified:C32([USER:15]Telex:10))
				[USER:15]Telex:10:=Uppercase:C13([USER:15]Telex:10)
			: (Modified:C32([USER:15]Office Code:13))
				[USER:15]Office Code:13:=Uppercase:C13([USER:15]Office Code:13)
				<>OfficeCode:=[USER:15]Office Code:13
			: (Modified:C32([USER:15]Wild Card:123))
				If ((Length:C16([USER:15]Wild Card:123)>1) | ((Character code:C91([USER:15]Wild Card:123)>47) & (Character code:C91([USER:15]Wild Card:123)<58)) | ((Character code:C91([USER:15]Wild Card:123)>63) & (Character code:C91([USER:15]Wild Card:123)<91)) | ((Character code:C91([USER:15]Wild Card:123)>96) & (Character code:C91([USER:15]Wild Card:123)<123)))
					Gen_Alert("That is not a suitable Wild Card"; "Try again")
					REJECT:C38([USER:15]Wild Card:123)
				End if 
			: (Modified:C32([USER:15]Main or Remote:115))
				If (([USER:15]Main or Remote:115#"M") & ([USER:15]Main or Remote:115#"R"))
					If ((Not:C34(User in group:C338(Current user:C182; "Designer"))) & ([USER:15]Main or Remote:115=""))
						Gen_Alert("Must be M or R"; "Try again")
						REJECT:C38([USER:15]Main or Remote:115)
					End if 
				Else 
					[USER:15]Main or Remote:115:=Uppercase:C13([USER:15]Main or Remote:115)
					If (([USER:15]Main or Remote:115="R") & (Old:C35([USER:15]Main or Remote:115)#"R"))
						Gen_Confirm("Are you sure?  You will be required to receive data from the"+" Main System before using any other Modules"; "No"; "Yes")
						[USER:15]Main or Remote:115:="M"
					Else 
						[USER:15]Office Code:13:="??"
						<>OfficeCode:="??/"
						If ((Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator"))))
							OBJECT SET ENTERABLE:C238([USER:15]Office Code:13; False:C215)
						End if 
					End if 
				End if 
				User_InLPMoR
			: (Modified:C32([USER:15]Title LRC:117))
				If (([USER:15]Title LRC:117#"L") & ([USER:15]Title LRC:117#"R") & ([USER:15]Title LRC:117#"C"))
					Gen_Alert("Must be L, R or C"; "Try again")
					REJECT:C38([USER:15]Title LRC:117)
				Else 
					[USER:15]Title LRC:117:=Uppercase:C13([USER:15]Title LRC:117)
				End if 
			: (Modified:C32([USER:15]Invoice Trans:21))
				User_InLPChkTr(->[USER:15]Invoice Trans:21)
			: (Modified:C32([USER:15]InvoiceP Trans:24))
				User_InLPChkTr(->[USER:15]InvoiceP Trans:24)
			: (Modified:C32([USER:15]Purch Trans:27))
				User_InLPChkTr(->[USER:15]Purch Trans:27)
			: (Modified:C32([USER:15]PurchP Trans:28))
				User_InLPChkTr(->[USER:15]PurchP Trans:28)
			: (Modified:C32([USER:15]Deposit Trans:59))
				User_InLPChkTr(->[USER:15]Deposit Trans:59)
			: (Modified:C32([USER:15]Deposit Rec:60))
				User_InLPChkTr(->[USER:15]Deposit Rec:60)
			: (Modified:C32([USER:15]PrePay Trans:61))
				User_InLPChkTr(->[USER:15]PrePay Trans:61)
			: (Modified:C32([USER:15]PrePay Rec:62))
				User_InLPChkTr(->[USER:15]PrePay Rec:62)
				
			: (Modified:C32([USER:15]Bank From:15))
				User_InLPChkAcc(->[USER:15]Bank From:15)
			: (Modified:C32([USER:15]Bank To:16))
				User_InLPChkAcc(->[USER:15]Bank To:16)
			: (Modified:C32([USER:15]Cash From:17))
				User_InLPChkAcc(->[USER:15]Cash From:17)
			: (Modified:C32([USER:15]Cash To:18))
				User_InLPChkAcc(->[USER:15]Cash To:18)
			: (Modified:C32([USER:15]Exch Contr Acc:186))
				User_InLPChkAcc(->[USER:15]Exch Contr Acc:186)
			: (Modified:C32([USER:15]Bank ExCh Acc:187))
				User_InLPChkAcc(->[USER:15]Bank ExCh Acc:187)
			: (Modified:C32([USER:15]VAT Input:19))
				User_InLPChkAcc(->[USER:15]VAT Input:19)
			: (Modified:C32([USER:15]VAT Output:20))
				User_InLPChkAcc(->[USER:15]VAT Output:20)
			: (Modified:C32([USER:15]VAT EC Creditor:75))
				User_InLPChkAcc(->[USER:15]VAT EC Creditor:75)
			: (Modified:C32([USER:15]VAT CashAcc:211))
				User_InLPChkAcc(->[USER:15]VAT CashAcc:211)
			: (Modified:C32([USER:15]BS Profit BFWD:29))
				User_InLPChkAcc(->[USER:15]BS Profit BFWD:29)
			: (Modified:C32([USER:15]BS Profit YTD:26))
				User_InLPChkAcc(->[USER:15]BS Profit YTD:26)
			: (Modified:C32([USER:15]BS Profit Adj:225))
				User_InLPChkAcc(->[USER:15]BS Profit Adj:225)
				
			: (Modified:C32([USER:15]User Additions:164))
				[USER:15]User Additions:164:=Uppercase:C13([USER:15]User Additions:164)
				If ([USER:15]User Additions:164="@BWB@")
					//Fax Settings
					DB_MenuAction("Section"; "Fax Settings"; 2; "")
					//  ENABLE MENU ITEM(2050;13)
				End if 
			: (Modified:C32([USER:15]Co Code Chars:88))
				If (([USER:15]Co Code Chars:88<0) | ([USER:15]Co Code Chars:88>6))
					Gen_Alert("Please specify a number between 0 and 6"; "Try again")
					REJECT:C38([USER:15]Co Code Chars:88)
				End if 
			: (Modified:C32([USER:15]Default Terms:113))
				Check_Lists(->[USER:15]Default Terms:113; "Terms")
			: (Modified:C32([USER:15]Mailsort Serv:173))
				Check_Lists(->[USER:15]Mailsort Serv:173; "Mailsort")
			: (Modified:C32([USER:15]WIP TR Trans:200))  //WIP lookups added 07/12/06 -kmw
				//User_InLPChkAcc (->[USER]WIP TR Trans)
				//was doing lookup on accounts table instead of transaction types - now correct - kmw 06/02/07
				Check_MinorNC(->[USER:15]WIP TR Trans:200; ""; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; "Transaction Type")  //made $2 blank, 25/10/07 -kmw...was getting runtime error due to non-existent variable
				
				//Check_MinorNC (->[USER]WIP TR Trans;"TransactionType1";->[Trans_Types];->[Trans_Types]Trans Code;->[Trans_Types]Trans Name;"Transaction Type")
			: (Modified:C32([USER:15]WIP CI Trans:201))  //WIP lookups added 07/12/06 -kmw
				//User_InLPChkAcc (->[USER]WIP CI Trans)
				//was doing lookup on accounts table instead of transaction types - now correct - kmw 06/02/07
				Check_MinorNC(->[USER:15]WIP CI Trans:201; ""; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; "Transaction Type")
			: (Modified:C32([USER:15]WIP TRWO Trans:202))  //WIP lookups added 07/12/06 -kmw
				//User_InLPChkAcc (->[USER]WIP TRWO Trans)
				//was doing lookup on accounts table instead of transaction types - now correct - kmw 06/02/07
				Check_MinorNC(->[USER:15]WIP TRWO Trans:202; ""; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; "Transaction Type")
			: (Modified:C32([USER:15]WIP CIWO Trans:203))  //WIP lookups added 07/12/06 -kmw
				//User_InLPChkAcc (->[USER]WIP CIWO Trans)
				//was doing lookup on accounts table instead of transaction types - now correct - kmw 06/02/07
				Check_MinorNC(->[USER:15]WIP CIWO Trans:203; ""; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; "Transaction Type")
			: (Modified:C32([USER:15]Time Action:66))  //Time Recording Action lookup added 07/12/06 -kmw
				Check_MinorNC(->[USER:15]Time Action:66; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
			: (vTot=1)
				REDRAW:C174([IDENTIFIERS:16])
				vTot:=0
		End case 
End case 
ERR_MethodTrackerReturn("User_inLP"; $_t_oldMethodName)
