//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/11/2009 22:36`Method: Contacts_InLPB
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	C_BOOLEAN:C305(<>SYS_bo_DefaultEntry; <>SYS_bo_DefaultSalutation; $_bo_LoadCompanies; $1; $2; CON_bo_AddCompany; DB_bo_RecordModified)
	C_DATE:C307(CON_D_DOB; CON_D_DOBOLD; CON_D_ED; CON_D_EDOLD; CON_D_IVD; CON_D_IVDOLD; CON_D_LMD; CON_D_LMDOLD; CON_D_VISAEXPIRE; CON_D_VISAEXPIREOLD)
	C_LONGINT:C283(B_ClipBoardBUTTON; CB_3; CON_l_ApplicActive; CON_l_ApplicActiveOLD; r1; Vadd; vCM; vCP; vCT; vNo2)
	C_REAL:C285(CON_l_AppActive; CON_l_AppActiveOLD; CON_R_MinRate; CON_R_MinRateOLD; CON_R_SALARYFROM; CON_R_SALARYFROMOLD; CON_R_SALARYTO; CON_R_SALARYTOOLD)
	C_TEXT:C284(<>CompCode; <>ContCode; <>PER_t_CurrentUserInitials; <>SYS_t_4DWriteType; $_t_EnquiryWriterMenuName; $_t_oldMethodName; $_t_TempContactName; $_t_WindowName; $_t_WindowNamee; CON_t_ApplicStatus; CON_t_ApplicStatusOLD)
	C_TEXT:C284(CON_t_BankAccountName; CON_t_BankAccountNameOLD; CON_t_BankAccountNo; CON_t_BankAccountNoOLD; CON_t_BANKBRANCH; CON_t_BANKBRANCHOLD; CON_t_BankName; CON_t_BankNameOLD; CON_t_BankSOrt; CON_t_BankSOrtOLD; CON_t_BENDET)
	C_TEXT:C284(CON_t_BENDETOLD; CON_t_CompanyCode; CON_t_CurrentFocus; CON_t_DisplayType; CON_t_InfoFrom; CON_t_InfoFromOLD; CON_t_IVBy; CON_t_IVByOLD; CON_t_NINumber; CON_t_NINumberOLD; CON_t_NormalWork)
	C_TEXT:C284(CON_t_NormalWorkOLD; CON_t_OtherAccRef; CON_t_OtherAccRefOLD; CON_t_PaymentMethod; CON_t_PaymentMethodOLD; CON_t_Person; CON_t_PersonOLD; CON_t_SelectedCompanyCode; DB_t_Address1Label; DB_t_Address2Label; DB_t_CallOnCloseorSave)
	C_TEXT:C284(DB_t_CountryLabel; DB_t_CountyLabel; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_PostcodeLabel; DB_t_TownLabel; SYS_t_AccessType; vATAdd11; vButtDisCon; vCompCode)
	C_TEXT:C284(vCompName; vContName; vForename; vPostcode; vSource_; vStatus_; vSurname; vTitle; vTown; vType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InLPB")
CON_t_CurrentFocus:=""
//Contacts_InLPB - see lso Contacts_InELPB
If (Count parameters:C259>=1)
	$_bo_LoadCompanies:=$1
Else 
	$_bo_LoadCompanies:=True:C214
End if 
If (DB_t_CurrentFormUsage#"None")
	If ([CONTACTS:1]Company_Code:1#"") & ($_bo_LoadCompanies)
		If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
		End if 
	End if 
	If ([COMPANIES:2]ADDRESS:60="") | (Vadd=1)
		CON_t_CompanyCode:=""
	End if 
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab1"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_Address1Label#""))
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab2"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_Address2Label#""))
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab3"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_TownLabel#""))
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab4"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_CountyLabel#""))
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_PostcodeLabel#""))
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab6"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)) & (DB_t_CountryLabel#""))
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab1"; DB_t_Address1Label+": ")
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab2"; DB_t_Address2Label+": ")
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab3"; DB_t_TownLabel+": ")
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab4"; DB_t_CountyLabel+": ")
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab5"; DB_t_PostcodeLabel+": ")
	OBJECT SET TITLE:C194(*; "oCON_CompanyAdLab6"; DB_t_CountryLabel+": ")
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr1"; DB_t_Address1Label)
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr2"; DB_t_Address2Label)
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr3"; DB_t_TownLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr4"; DB_t_CountyLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr5"; DB_t_PostcodeLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCON_CompanyAddr6"; DB_t_CountryLabel)
	
	
	
	
	OBJECT SET VISIBLE:C603(*; "oCompanyName_P5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	
	OBJECT SET VISIBLE:C603(*; "oAddressLineOne_P5@"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	//OBJECT SET VISIBLE([COMPANIES]Address_Line_two;True)
	OBJECT SET VISIBLE:C603(*; "oaddressLineTwo_P5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	
	OBJECT SET VISIBLE:C603(*; "oaddressTown_P5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	
	OBJECT SET VISIBLE:C603(*; "oaddressCounty_P5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	OBJECT SET VISIBLE:C603(*; "oaddressPostCode_P5"; (([COMPANIES:2]ADDRESS:60="") | (Vadd=1)))
	
	OBJECT SET VISIBLE:C603(vATAdd11; False:C215)
	OBJECT SET VISIBLE:C603(*; "oaddressCountry_P5"; ([COMPANIES:2]ADDRESS:60#"") | (Vadd#1))
	
	
	OBJECT SET VISIBLE:C603(*; "oAddressClipBoardButton@"; ([COMPANIES:2]ADDRESS:60#"") | (Vadd#1))
	OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; ([COMPANIES:2]ADDRESS:60#"") | (Vadd#1))
	
	If (False:C215)  ///this was else
		OBJECT SET VISIBLE:C603(DB_t_Address1Label; False:C215)
		OBJECT SET VISIBLE:C603(DB_t_Address2Label; False:C215)
		OBJECT SET VISIBLE:C603(DB_t_TownLabel; False:C215)
		OBJECT SET VISIBLE:C603(DB_t_CountyLabel; False:C215)
		OBJECT SET VISIBLE:C603(DB_t_PostcodeLabel; False:C215)
		OBJECT SET VISIBLE:C603(DB_t_CountryLabel; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Company_Name:2; True:C214)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_one:3; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_two:4; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Town_or_City:5; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]County_or_State:6; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Postal_Code:7; False:C215)
		OBJECT SET VISIBLE:C603([COMPANIES:2]Country:8; False:C215)
		OBJECT SET VISIBLE:C603(vATAdd11; True:C214)
		OBJECT SET VISIBLE:C603([COMPANIES:2]ADDRESS:60; True:C214)
		OBJECT SET VISIBLE:C603(B_ClipBoardBUTTON; True:C214)
	End if 
End if 
If (DB_t_CurrentFormUsage#"None")
	If ([CONTACTS:1]Contact_Code:2="")
		Contact_Code
		If ((vAdd=1) & (vCP=0) & (vCM=0))
			If ((vCompName#"") | (vPostcode#"") | (vTown#""))
				If (vCompCode="")
					If ((vCompName#"") | (r1=1))
						READ WRITE:C146([COMPANIES:2])
						CREATE RECORD:C68([COMPANIES:2])
						Company_No
						Companies_InBDe
						Companies_InBIn
						$_t_TempContactName:=WS_BUILDADDRESS  // 19/11/02 pb
						If ($_t_TempContactName#[COMPANIES:2]ADDRESS:60)
							[COMPANIES:2]ADDRESS:60:=$_t_TempContactName
							DB_SaveRecord(->[COMPANIES:2])
							AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						End if 
						vCompCode:=[COMPANIES:2]Company_Code:1
						UNLOAD RECORD:C212([COMPANIES:2])
						READ ONLY:C145([COMPANIES:2])
					End if 
				End if 
				If (vCompCode#"")
					CON_bo_AddCompany:=True:C214
					CREATE RECORD:C68([CONTACTS_COMPANIES:145])
					[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
					[CONTACTS_COMPANIES:145]Company_Code:1:=vCompCode
					[CONTACTS:1]Company_Code:1:=vCompCode
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				End if 
			End if 
			[CONTACTS:1]Title:3:=Uppers2(vTitle)
			[CONTACTS:1]Forename:4:=Uppers2(vForename)
			[CONTACTS:1]Surname:5:=Uppers2(vSurname)
			If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Salutation:7="") & (<>SYS_bo_DefaultSalutation))
				[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
			End if 
			$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
			[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
		End if 
		[CONTACTS:1]Sales_Person:25:=<>PER_t_CurrentUserInitials
	End if 
	
	
	If (DB_t_CurrentFormUsage="Ask")
		If (vCompCode#"")
			CON_bo_AddCompany:=True:C214
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			
			[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
			[CONTACTS_COMPANIES:145]Company_Code:1:=vCompCode
			[CONTACTS:1]Company_Code:1:=vCompCode
		End if 
	End if 
	
	If (([CONTACTS:1]Company_Code:1="") & (vAdd=1))
		If ((<>SYS_bo_DefaultEntry) & (<>CompCode#""))
			CON_bo_AddCompany:=True:C214
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			
			[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
			[CONTACTS_COMPANIES:145]Company_Code:1:=<>CompCode
			[CONTACTS:1]Company_Code:1:=<>CompCode
			
		End if 
	End if 
	ARRAY POINTER:C280(CON_aPtr_LBAnalSetup; 0)
	QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
	
	If (Size of array:C274(CON_aPtr_LBAnalSetup)=0)
		LBi_ArrDefFill(->CON_aPtr_LBAnalSetup; ->CON_lb_FurtherAnalysis; ->[CONTACTS_RECORD_ANALYSIS:144]ID:2; ->[CONTACTS:1]Contact_Code:2; "200001000"; ""; 5; " Contacts Analysis"; "Analysis")
	Else 
		OK:=1
	End if 
	
	LBi_LoadSetup(->CON_aPtr_LBAnalSetup; "B"; 0)
	//AL_SetScroll (eALCoFurI;-2;-3)
	//AL_SetMiscOpts (eALCoFurI;0;1;"\\";0;1)
	
	//AL_UpdateArrays (eALCoFurI;-2)
	
End if 
If (SYS_t_AccessType#"Q") | (True:C214)  // Was used to determine different screens-Aug 2006 no longer used for that
	RELATE ONE:C42([CONTACTS:1]Status:14)
	vStatus_:=[STATUS:4]Status_Name:2
	RELATE ONE:C42([CONTACTS:1]Contact_Type:15)
	vType_:=[TYPES:5]Type_Name:2
	RELATE ONE:C42([CONTACTS:1]Source:16)
	vSource_:=[SOURCES:6]Source_Name:2
End if 
If (DB_t_CurrentFormUsage#"none")
	
	If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
		DB_MenuAction("View"; "Diary Actions"; 3; "")
	End if 
	If (DB_GetModuleSettingByNUM(Module_WPManager)<2)
		DB_MenuAction("View"; "Document History"; 3; "")
		
	End if 
	If (<>SYS_t_4DWriteType="W")  // 4DWrite "gold"
		DB_MenuAction("View"; "Document History"; 1; "Letters & Quotes")
	End if 
	If (DB_GetModuleSettingByNUM(Module_Enquiries)<2)
		DB_MenuAction("View"; "EnquiryWriter"; 3; "")
		//DISABLE MENU ITEM(2049;4)
	End if 
	$_t_EnquiryWriterMenuName:=Get localized string:C991("MenuItem_EnquiryWriter")
	$_t_EnquiryWriterMenuName:=Term_OrdWT($_t_EnquiryWriterMenuName)
	If ($_t_EnquiryWriterMenuName#Get localized string:C991("MenuItem_EnquiryWriter"))
		DB_MenuAction("View"; "EnquiryWriter"; 1; Term_OrdWT("SalesBook"))
	End if 
	If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
		DB_MenuAction("View"; "Full Orders"; 3; "")
		
	End if 
	If (DB_GetModuleSettingByNUM(Module_ServiceCentre)<2)
		DB_MenuAction("View"; "Service Calls"; 3; "")
		
	End if 
	If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2))
		DB_MenuAction("View"; "Jobs"; 3; "")
		
	End if 
	
	
	
	
	
	
	If (([CONTACTS:1]Forename:4#"") | ([CONTACTS:1]Surname:5#""))
		If ([CONTACTS:1]Title:3#"")  // | (◊NoContTit))
			GOTO OBJECT:C206([CONTACTS:1]Forename:4)
			// HIGHLIGHT TEXT([CONTACTS]Forename;80;80)
		Else 
			GOTO OBJECT:C206([CONTACTS:1]Title:3)
		End if 
	Else 
		// HIGHLIGHT TEXT([CONTACTS]Contact Code;80;80)
	End if 
	
	If (vCP=0)
		vButtDisCon:="I    O   SSSRCAD "
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		vNo2:=Records in selection:C76([CONTACTS_COMPANIES:145])
		//  RELATE ONE([CONTACTS]Company Code)  `is auto at the moment
	Else 
		vButtDisCon:="I    O  FSSSRCAD "
		If ([CONTACTS:1]Company_Code:1="")
			CON_bo_AddCompany:=True:C214
			[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
			[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
			
			[CONTACTS:1]Sales_Person:25:=[COMPANIES:2]Sales_Person:29
		End if 
		DB_MenuAction("View"; "Company"; 3; "")
		DB_MenuAction("Functions"; "Go to Duplicate"; 3; "")
		DB_MenuAction("Functions"; "Switch Access"; 3; "")
		//DISABLE MENU ITEM(2049;1)
		//DISABLE MENU ITEM(2050;1)
		//DISABLE MENU ITEM(2050;3)
	End if 
	vCT:=1
	vContName:=CON_BuildContactNameandJobTitle
	Input_Buttons(->[CONTACTS:1]; ->vButtDisCon)
End if 

DB_t_CallOnCloseorSave:="P:Contacts_InMCA:C:Contacts_InMCA"
If (vAdd=1)
	DB_bo_RecordModified:=True:C214
End if 
Gen_FindVars
<>ContCode:=[CONTACTS:1]Contact_Code:2
If (False:C215)
	
	[CONTACTS:1]Contact_Name:31:=CON_BuildContactName
	CustList_PopUp
	If ([CONTACTS:1]Company_Code:1#"")
		cb_3:=1
	Else 
		cb_3:=0
	End if 
	
End if 
$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
If ($_t_TempContactName#[CONTACTS:1]Contact_Name:31)
	[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
End if 
If ($_bo_LoadCompanies)
	CustList_PopUp
	//TRACE
	//CON_t_SelectedCompanyCode:=[CONTACTS]Company_Code
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[CONTACTS:1])))
//The following variables only apply to applicant entry
CON_t_NormalWork:=""
CON_R_MinRate:=0
CON_t_Person:=""
CON_D_DOB:=!00-00-00!
CON_D_ED:=!00-00-00!
CON_D_LMD:=!00-00-00!
CON_D_IVD:=!00-00-00!
CON_t_InfoFrom:=""
CON_t_ApplicStatus:=""
CON_t_IVBy:=""
CON_t_NINumber:=""
CON_t_Bendet:=""
CON_R_SALARYFROM:=0
CON_R_SALARYTO:=0
CON_t_BankName:=""
CON_t_PaymentMethod:=""
CON_D_VISAEXPIRE:=!00-00-00!
CON_t_BANKBRANCH:=""
CON_t_BankAccountName:=""
CON_t_BankAccountNo:=""
CON_t_BankSOrt:=""
CON_t_OtherAccRef:=""
CON_l_AppActive:=0
//```
CON_t_NormalWorkOLD:=""
CON_R_MinRateOLD:=0
CON_t_PersonOLD:=""
CON_D_DOBOLD:=!00-00-00!
CON_D_EDOLD:=!00-00-00!
CON_D_LMDOLD:=!00-00-00!
CON_D_IVDOLD:=!00-00-00!
CON_t_InfoFromOLD:=""
CON_t_ApplicStatusOLD:=""
CON_t_IVByOLD:=""
CON_t_NINumberOLD:=""
CON_t_BendetOLD:=""
CON_R_SALARYFROMOLD:=0
CON_R_SALARYTOOLD:=0
CON_t_BankNameOLD:=""
CON_t_PaymentMethodOLD:=""
CON_D_VISAEXPIREOLD:=!00-00-00!
CON_t_BANKBRANCHOLD:=""
CON_t_BankAccountNameOLD:=""
CON_t_BankAccountNoOLD:=""
CON_t_BankSOrtOLD:=""
CON_t_OtherAccRefOLD:=""
CON_l_AppActiveOLD:=0

FORM GOTO PAGE:C247(1)

OBJECT SET VISIBLE:C603(*; "oCON_Applic@"; False:C215)
If ([CONTACTS:1]Contact_Name:31#"")
	$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Contact")
	SET WINDOW TITLE:C213($_t_WindowName+" "+[CONTACTS:1]Contact_Name:31)
Else 
	$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Contact")
	SET WINDOW TITLE:C213($_t_WindowName)
	
End if 

//Turned off till i am ready to reaveal
CON_SetSubInformation([CONTACTS:1]Contact_Code:2; [CONTACTS:1]x_ID:33; CON_t_DisplayType)
ERR_MethodTrackerReturn("Contacts_InLPB"; $_t_oldMethodName)
