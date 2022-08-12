//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_CompanyTabPage;0)
	//ARRAY TEXT(COM_at_AddAnalCode;0)
	//ARRAY TEXT(COM_at_AddAnalysisName;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	C_BOOLEAN:C305(<>SYS_bo_CapitaliseTown; <>SYS_bo_DefaultsCallback; COM_bo_Resurrection)
	C_LONGINT:C283(<>AutoProc; <>PER_l_AccessLevel; $_l_index; $_l_oBottom; $_l_oLeft; $_l_oRight; $_l_oTop; $_l_Page5Position; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; B_ClipboardButton; CB_3; L_aFurtherCodeSelected; SD_l_CompanySelected; vAdd; vCP; vCT; vNo2; WS_l_Bdetail; WS_l_Bname)
	C_LONGINT:C283(xCount)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_POINTER:C301($1)
	C_TEXT:C284(<>Forename; <>Surname; <>SYS_t_DefaultTelFormat; $_t_NewCompanyName; $_t_OldCompanyName; $_t_oldMethodName; COM_t_AddressLine1; COM_t_OpenCompanyName; COM_t_TelephoneNumberFormat; CON_t_CompanyName; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType; vCompCode; vType; WS_t_Label1; WS_t_Label2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPX")
Case of 
		
	: ($1=(->[COMPANIES:2]Company_Code:1))
		If ([COMPANIES:2]Company_Code:1#"")
			RemoveLeadTr(Uppercase:C13([COMPANIES:2]Company_Code:1); ->[COMPANIES:2]Company_Code:1)
			[COMPANIES:2]Company_Code:1:=Str_StripDel([COMPANIES:2]Company_Code:1)
			If ((vCompCode#"") & (vCompCode#[COMPANIES:2]Company_Code:1))
				If ([COMPANIES:2]Exported:45)
					If (DB_t_CurrentFormUsage#"None")
						Gen_Alert("You cannot recode Companies that have been Downloaded"; "Cancel")
					End if 
					
					[COMPANIES:2]Company_Code:1:=vCompCode
				Else 
					If (vAdd=0)  //Don't do it if adding from another file
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
						DB_SaveRecord(->[INFORMATION:55])
						AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						Comp_RenumSrc(vCompCode)
						If ((Records in selection:C76([CONTACTS:1])>0) | (Records in selection:C76([DIARY:12])>0) | (Records in selection:C76([ORDER_ITEMS:25])>0) | (Records in selection:C76([STOCK_MOVEMENTS:40])>0) | (Records in selection:C76([PRODUCTS:9])>0) | (Records in selection:C76([SERVICE_CALLS:20])>0) | (Records in selection:C76([INFORMATION:55])>0) | (Records in selection:C76([PUBLICATIONS:52])>0) | (Records in selection:C76([TRANSACTIONS:29])>0) | (Records in selection:C76([INVOICES:39])>0) | (Records in selection:C76([PURCHASE_INVOICES:37])>0) | (Records in selection:C76([ORDERS:24])>0) | (Records in selection:C76([PURCHASE_ORDERS:57])>0) | (Records in selection:C76([JOBS:26])>0) | (Records in selection:C76([CONTRACTS:17])>0) | (Records in selection:C76([PRICE_TABLE:28])>0))
							If ((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_Companies)#2))
								Gen_Alert("You don't have the authority to recode Companies with related data"; "Cancel")
								[COMPANIES:2]Company_Code:1:=vCompCode
							Else 
								Gen_Confirm("Do you want to update references to this Company in other files?"; "Yes"; "No")
								If (OK=1)
									Comp_RenumApp([COMPANIES:2]Company_Code:1; vCompCode)
								End if 
							End if 
						End if 
						READ ONLY:C145([ORDERS:24])
						READ ONLY:C145([DIARY:12])
					Else   //But do update any newly added Contacts
						If (Records in selection:C76([CONTACTS:1])>0)
							Comp_RenumAppCT([COMPANIES:2]Company_Code:1; vCompCode)
						End if 
					End if 
				End if 
			End if 
			vCompCode:=[COMPANIES:2]Company_Code:1
		End if 
		Companies_InLPM
		If ([COMPANIES:2]x_ID:63=0)
			[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
		End if 
		If ([COMPANIES:2]x_ID:63>0)
			QV_UpdateQualsPallette(1; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
		Else 
			QV_HideQualities
		End if 
	: ($1=(->[COMPANIES:2]Superior:34))
		If ([COMPANIES:2]Superior:34#"")
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			COPY NAMED SELECTION:C331([COMPANIES:2]; "Companies")
			CUT NAMED SELECTION:C334([CONTACTS:1]; "Contacts")
			Check_CompanySu([COMPANIES:2]Superior:34)
			USE NAMED SELECTION:C332("Companies")
			CLEAR NAMED SELECTION:C333("Companies")
			USE NAMED SELECTION:C332("Contacts")
			[COMPANIES:2]Superior:34:=vCompCode
			If ([COMPANIES:2]Superior:34=[COMPANIES:2]Company_Code:1)
				Gen_Alert([COMPANIES:2]Company_Code:1+" cannot be a Superior of itself")
				[COMPANIES:2]Superior:34:=""
				GOTO OBJECT:C206([COMPANIES:2]Superior:34)
			End if 
		End if 
		Companies_InLPM
		vCompCode:=[COMPANIES:2]Company_Code:1
	: ($1=(->[COMPANIES:2]Company_Name:2))
		If (Vadd=1)
			//we are adding a record
			//Need to do the following without moving the current record pointer
			PUSH RECORD:C176([COMPANIES:2])
			$_t_OldCompanyName:=[COMPANIES:2]Company_Name:2
			OBJECT GET COORDINATES:C663([COMPANIES:2]Company_Name:2; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			COM_bo_Resurrection:=False:C215
			SD_l_CompanySelected:=0
			$_t_NewCompanyName:=DB_DeDupCompany([COMPANIES:2]Company_Name:2; ->[COMPANIES:2]Phonetic_Name:64; $_l_WindowLeft+$_l_oLeft; $_l_oTop+$_l_windowTop)
			
			POP RECORD:C177([COMPANIES:2])
			ONE RECORD SELECT:C189([COMPANIES:2])
			[COMPANIES:2]Company_Name:2:=$_t_NewCompanyName
			//NG Feb 2007 Problem is company name is same as entered-so added SD_l_CompanySelected
			If ($_t_OldCompanyName#[COMPANIES:2]Company_Name:2) | (COM_bo_Resurrection) | (SD_l_CompanySelected=1)
				
				COM_t_OpenCompanyName:=$_t_NewCompanyName
				//the cancel will have been pushed so
				Companies_InCan
				//The following now gets used by Companies_In
				
			Else 
				Company_No([COMPANIES:2]Company_Name:2)
				
				If ([COMPANIES:2]x_ID:63=0) & ([COMPANIES:2]Company_Code:1#"")
					[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				End if 
				If ([COMPANIES:2]x_ID:63=0)
					[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
				End if 
				If ([COMPANIES:2]x_ID:63>0)
					QV_UpdateQualsPallette(1; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
				Else 
					QV_HideQualities
				End if 
				GOTO OBJECT:C206(COM_t_AddressLine1)
				WS_KeepFocus
				GOTO OBJECT:C206(COM_t_AddressLine1)
			End if 
			SD_l_CompanySelected:=0
		End if 
		
		[COMPANIES:2]Company_Name:2:=Uppers2([COMPANIES:2]Company_Name:2)
		[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr([COMPANIES:2]Company_Name:2)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Also_Known_As:43))
		[COMPANIES:2]Also_Known_As:43:=Uppers2([COMPANIES:2]Also_Known_As:43)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Address_Line_one:3))
		[COMPANIES:2]Address_Line_one:3:=Uppers2([COMPANIES:2]Address_Line_one:3)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Address_Line_two:4))
		[COMPANIES:2]Address_Line_two:4:=Uppers2([COMPANIES:2]Address_Line_two:4)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Town_or_City:5))
		If (<>SYS_bo_CapitaliseTown)
			If (Substring:C12([COMPANIES:2]Town_or_City:5; 1; 1)="!")
				[COMPANIES:2]Town_or_City:5:=Substring:C12([COMPANIES:2]Town_or_City:5; 2; 32000)
			Else 
				[COMPANIES:2]Town_or_City:5:=Uppercase:C13([COMPANIES:2]Town_or_City:5)
			End if 
		Else 
			[COMPANIES:2]Town_or_City:5:=Uppers2([COMPANIES:2]Town_or_City:5)
		End if 
		If (Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49))
			
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]County_or_State:6))
		[COMPANIES:2]County_or_State:6:=Uppers2([COMPANIES:2]County_or_State:6)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Postal_Code:7))
		RemoveLeadTr(Uppercase:C13([COMPANIES:2]Postal_Code:7); ->[COMPANIES:2]Postal_Code:7)
		If ([COMPANIES:2]Postal_Code:7#"")
			If (Companies_InPCC)
				Companies_InPC
				Companies_InLPM
			End if 
		End if 
	: ($1=(->[COMPANIES:2]Mailsort_SSC:49))
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Mailsort_OFN:50))
		[COMPANIES:2]Mailsort_OFN:50:=Uppercase:C13([COMPANIES:2]Mailsort_OFN:50)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Country:8))
		If ((DB_GetModuleSettingByNUM(1))=5)
			[COMPANIES:2]Country:8:=Uppers2([COMPANIES:2]Country:8)
		Else 
			If (DB_t_CurrentFormUsage#"None")
				Check_Minor(->[COMPANIES:2]Country:8; "Country"; ->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]Address_Format:2; "Countries In")
			End if 
			
			Companies_vAT2
			If ([COUNTRIES:73]Default_TAX:4#"")
				[COMPANIES:2]Default_TAX:41:=[COUNTRIES:73]Default_TAX:4
			End if 
			RELATE ONE:C42([COMPANIES:2]Company_Type:13)
			vType:=[TYPES:5]Type_Name:2
		End if 
		Companies_InLPM
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236([COMPANIES:2]Telephone:9; COM_t_TelephoneNumberFormat)
			OBJECT SET FORMAT:C236([COMPANIES:2]Fax:10; COM_t_TelephoneNumberFormat)
		End if 
	: ($1=(->[COMPANIES:2]Area:11))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[COMPANIES:2]Area:11; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
		End if 
		Comp_InLPArea
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Sales_Person:29))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Sales_Person:29; "Sales"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")  //6
		End if 
		
		If (([COMPANIES:2]Sales_Person:29#"") & (vDY=0) & (Records in selection:C76([PERSONNEL:11])>0) & (vCM=0) & (<>SYS_bo_DefaultsCallback) & ((DB_GetModuleSettingByNUM(Module_DiaryManager)=2) | (DB_GetModuleSettingByNUM(Module_DiaryManager)=4)))
			
			xCount:=1
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Taken_By:26))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Taken_By:26; "Tele"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")  //6
		End if 
		
		Companies_InLPM
		
	: ($1=(->[COMPANIES:2]Telephone:9))
		[COMPANIES:2]Telephone:9:=Uppercase:C13([COMPANIES:2]Telephone:9)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Fax:10))
		[COMPANIES:2]Fax:10:=Uppercase:C13([COMPANIES:2]Fax:10)
		Companies_InLPM
		
	: ($1=(->[COMPANIES:2]Status:12))
		If (Old:C35([COMPANIES:2]Status:12)#"")
			OLD RELATED ONE:C44([COMPANIES:2]Status:12)
			If ([STATUS:4]No_Change:4)
				If (DB_t_CurrentFormUsage#"None")
					Gen_Alert("The Status of this Company cannot be changed"; "Cancel")
				End if 
				[COMPANIES:2]Status:12:=Old:C35([COMPANIES:2]Status:12)
			Else 
				If (DB_t_CurrentFormUsage#"None")
					Check_Minor(->[COMPANIES:2]Status:12; "Status"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status In"; "Status"; "2")
				End if 
			End if 
		Else 
			If (DB_t_CurrentFormUsage#"None")
				Check_Minor(->[COMPANIES:2]Status:12; "Status"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status In"; "Status"; "2")
			End if 
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Company_Type:13))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[COMPANIES:2]Company_Type:13; "Type"; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Types In"; "Type"; "2")
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Source:14))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[COMPANIES:2]Source:14; "Source"; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Sources_In"; "Source"; "2")
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Omit:17))
		[COMPANIES:2]Omit:17:=Uppercase:C13([COMPANIES:2]Omit:17)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Default_TAX:41))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Default_TAX:41; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))  //6
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Default_Credit_Stage:42))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Default_Credit_Stage:42; "Stage"; ->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2)  //6
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]SO_Price_Group:44))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]SO_Price_Group:44; ""; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "Price Group")  //6
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]PO_Price_Group:54))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]PO_Price_Group:54; ""; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "Price Group")
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Factor_Number:46))
		[COMPANIES:2]Factor_Number:46:=Uppercase:C13([COMPANIES:2]Factor_Number:46)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Autopay_Number:47))
		[COMPANIES:2]Autopay_Number:47:=Uppercase:C13([COMPANIES:2]Autopay_Number:47)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Their_Account_Number:48))
		[COMPANIES:2]Their_Account_Number:48:=Uppercase:C13([COMPANIES:2]Their_Account_Number:48)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]TAX_Prefix:38))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[COMPANIES:2]TAX_Prefix:38; "VAT Prefixes")
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]TAX_Registration_Number:39))
		Check_VATReg(->[COMPANIES:2]TAX_Prefix:38; ->[COMPANIES:2]TAX_Registration_Number:39)
		If (OK=1)
			Companies_InLPM
		End if 
	: ($1=(->[COMPANIES:2]Default_Layer:51))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Default_Layer:51; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")  //6
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Default_Currency:59))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[COMPANIES:2]Default_Currency:59; ""; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2; "Currency")  //6
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]SL_Terms:40))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[COMPANIES:2]SL_Terms:40; "Terms")
		End if 
		
		Companies_InLPM
	: ($1=(->[COMPANIES:2]PL_Terms:53))
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[COMPANIES:2]PL_Terms:53; "Terms")
		End if 
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Dept:24))
		[COMPANIES:2]Invoice_Dept:24:=Uppers2([COMPANIES:2]Invoice_Dept:24)
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Name:25))
		[COMPANIES:2]Invoice_Name:25:=Uppers2([COMPANIES:2]Invoice_Name:25)
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Address_Line_One:18))
		[COMPANIES:2]Invoice_Address_Line_One:18:=Uppers2([COMPANIES:2]Invoice_Address_Line_One:18)
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Address_Line_Two:19))
		[COMPANIES:2]Invoice_Address_Line_Two:19:=Uppers2([COMPANIES:2]Invoice_Address_Line_Two:19)
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Town:20))
		If (<>SYS_bo_CapitaliseTown)
			If (Substring:C12([COMPANIES:2]Invoice_Town:20; 1; 1)="!")
				[COMPANIES:2]Invoice_Town:20:=Substring:C12([COMPANIES:2]Invoice_Town:20; 2; 32000)
			Else 
				[COMPANIES:2]Invoice_Town:20:=Uppercase:C13([COMPANIES:2]Invoice_Town:20)
			End if 
		Else 
			[COMPANIES:2]Invoice_Town:20:=Uppers2([COMPANIES:2]Invoice_Town:20)
		End if 
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_County:21))
		[COMPANIES:2]Invoice_County:21:=Uppers2([COMPANIES:2]Invoice_County:21)
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Invoice_Postcode:22))
		RemoveLeadTr(Uppercase:C13([COMPANIES:2]Invoice_Postcode:22); ->[COMPANIES:2]Invoice_Postcode:22)
		If ([COMPANIES:2]Invoice_Postcode:22#"")
			If (Companies_InPCI)
				vNo2:=1
				Companies_InLPM
			End if 
		End if 
	: ($1=(->[COMPANIES:2]Invoice_Country:23))
		If ((DB_GetModuleSettingByNUM(1))=5)
			[COMPANIES:2]Invoice_Country:23:=Uppers2([COMPANIES:2]Invoice_Country:23)
		Else 
			If (DB_t_CurrentFormUsage#"None")
				Check_Minor(->[COMPANIES:2]Invoice_Country:23; "Country"; ->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]Address_Format:2; "Countries In")
			End if 
			Companies_vAT2
			RELATE ONE:C42([COMPANIES:2]Company_Type:13)
			vType:=[TYPES:5]Type_Name:2
		End if 
		vNo2:=1
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Email_Before_At:58))
		Gen_EmailAddr(->[COMPANIES:2]Email_Before_At:58; ->[COMPANIES:2]EMail_After_At:55; 1)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]EMail_After_At:55))
		Gen_EmailAddr(->[COMPANIES:2]Email_Before_At:58; ->[COMPANIES:2]EMail_After_At:55; 2)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Home_Page_URL:56))
		[COMPANIES:2]Home_Page_URL:56:=Gen_WWWAddress([COMPANIES:2]Home_Page_URL:56)
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Size:15))
		Companies_InLPM
	: ($1=(->[COMPANIES:2]Private:37))
		If ([COMPANIES:2]Private:37) & (Not:C34(Old:C35([COMPANIES:2]Private:37)))
			Case of 
				: (Records in selection:C76([CONTACTS:1])=0)
					Gen_Alert("You must add the contact before you make the company private!")
					[COMPANIES:2]Private:37:=False:C215
				: (Records in selection:C76([CONTACTS:1])>1)
					Gen_Alert("A company can only be private with one contact!")
					[COMPANIES:2]Private:37:=False:C215
				Else 
					//AL_ExitCell (eALContI)`NG 27/7/06 No need for this with list box
					If ([CONTACTS:1]Forename:4#"")
						DB_SaveRecord(->[CONTACTS:1])
						
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					End if 
					
					If (OK=1)
						If ((DB_GetModuleSettingByNUM(14))>1)
							DB_SaveRecord(->[INFORMATION:55])
							AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						End if 
						DB_SaveRecord(->[COMPANIES:2])
						AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						
						
						
						
						CO_AddressManager(9998; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
						
						
						
						If (OK=1)
							If (SYS_t_AccessType#"Q")
								Comp_CheckCont
								If ((DB_GetModuleSettingByNUM(1))#5)  //these buttons aren't on the Silver screen
									Comp_NextCall
									Comp_Letter
								End if 
							End if 
							vCP:=0
							vCT:=0
							If (<>AutoProc>0)
								Gen_AutoProc
							End if 
						End if 
					End if 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
					
					//One contact
					//Switch the view
					//PROBABLY NEED TO SAVE AT THIS POINT
					DB_SaveRecord(->[COMPANIES:2])
					
					
					//```
					If (DB_t_CurrentFormUsage#"None")
						
						OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; True:C214)
						OBJECT SET VISIBLE:C603(B_ClipboardButton; True:C214)
						OBJECT SET ENABLED:C1123(B_ClipBoardButton; True:C214)
						OBJECT SET VISIBLE:C603([CONTACTS:1]Title:3; False:C215)
						OBJECT SET VISIBLE:C603([CONTACTS:1]Forename:4; False:C215)
						OBJECT SET VISIBLE:C603([CONTACTS:1]Surname:5; False:C215)
						OBJECT SET ENABLED:C1123(*; "oNameButton"; False:C215)
						OBJECT SET ENABLED:C1123(*; "odetailButton"; True:C214)
						WS_t_Label1:="Name"
						WS_t_Label2:="Title"
						OBJECT SET TITLE:C194(*; "oContactNameLabel"; WS_t_Label1+": ")
						OBJECT SET TITLE:C194(*; "oContactForenameLabel"; <>Forename+": ")
						OBJECT SET TITLE:C194(*; "oContactSurnamLabel"; <>Surname+": ")
						OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oContactSurnamLabel"; False:C215)
						
						//OBJECT SET ENTERABLE(WS_t_Label1;False)
						//OBJECT SET ENTERABLE(WS_t_Label2;False)
					End if 
					
					Contacts_InLPB(False:C215; False:C215)
					
					If ([CONTACTS:1]Company_Code:1#"")
						cb_3:=1
					Else 
						cb_3:=0
					End if 
					If (DB_t_CurrentFormUsage#"None")
						//If (cb_3=1)
						
						OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; (cb_3=1))
						
						OBJECT SET VISIBLE:C603(*; "oCompanyName"; (cb_3=1))
						
						OBJECT SET VISIBLE:C603(*; "oContactAddress"; (cb_3=1))
						
						OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; (cb_3=1))
						
						OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; (cb_3=1))
						
						
						//Else
						
						//OBJECT SET VISIBLE(*;"oCompanyNamesDropsDown";False)
						//OBJECT SET VISIBLE(*;"oCompanyName";False)
						
						
						
						
						//End if
						WS_KeepFocus
						If ([CONTACTS:1]Contact_Name:31#"")
							GOTO OBJECT:C206([CONTACTS:1]Comments:10)
						Else 
							GOTO OBJECT:C206([CONTACTS:1]Contact_Name:31)
						End if 
						If (Old:C35([CONTACTS:1]Contact_Code:2)#"")
							OBJECT SET ENTERABLE:C238([CONTACTS:1]Contact_Code:2; False:C215)
						End if 
					End if 
					
					//because we are here we need to put the subrecord
					//into an array
					QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
					
					ARRAY TEXT:C222(COM_at_AddAnalCode; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
					ARRAY TEXT:C222(COM_at_AddAnalysisName; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
					FIRST RECORD:C50([CONTACTS_RECORD_ANALYSIS:144])
					For ($_l_index; 1; Size of array:C274(COM_at_AddAnalCode))
						COM_at_AddAnalCode{$_l_index}:=[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1
						RELATE ONE:C42([CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1)
						COM_at_AddAnalysisName{$_l_index}:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
						NEXT RECORD:C51([CONTACTS_RECORD_ANALYSIS:144])
					End for 
					If (DB_t_CurrentFormUsage#"None")
						$_l_Page5Position:=Find in array:C230(COM_al_CompanyTabPage; 5)
						If ($_l_Page5Position<0)
							INSERT IN ARRAY:C227(COM_at_CompanyTab; Size of array:C274(COM_at_CompanyTab)+1; 1)
							INSERT IN ARRAY:C227(COM_al_CompanyTabPage; Size of array:C274(COM_al_CompanyTabPage)+1; 1)
							COM_al_CompanyTabPage{1}:=5
							COM_at_CompanyTab{Size of array:C274(COM_at_CompanyTab)}:="Company"
							COM_al_CompanyTabPage{Size of array:C274(COM_al_CompanyTabPage)}:=1
						End if 
						COM_at_CompanyTab:=1
						If (DB_t_CurrentFormUsage#"None")
							FORM GOTO PAGE:C247(COM_al_CompanyTabPage{COM_at_CompanyTab})
						End if 
					End if 
					
					//```
			End case 
			
		End if 
		
		Companies_InLPM
End case 
Macro_AccTypePt($1)
ERR_MethodTrackerReturn("Companies_InLPX"; $_t_oldMethodName)
