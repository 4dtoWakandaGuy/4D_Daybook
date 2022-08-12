//%attributes = {}
If (False:C215)
	//Project Method Name: Companies_InLPB
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY LONGINT(WS_al_RSProperties;0;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_At_FurthCommentsLabels;0)
	//ARRAY TEXT(COM_at_FurtherCommentIDS;0)
	//ARRAY TEXT(COM_at_FurtherCommentLabels;0)
	//ARRAY TEXT(WS_at_RecordStateProperties;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	//ARRAY TEXT(WS_at_RsProperties;0;0)
	//ARRAY TEXT(WS_at_RSPropertyTypes;0;0)
	C_BOOLEAN:C305(<>MultiCo; <>OneEntry; <>SYS_bo_DefaultSalutation; $_bo_AccessAllowed; CO_bo_FurtherFieldsLoaded; DB_bo_RecordModified)
	C_LONGINT:C283($_l_FurtherFieldsExist; $_l_ListID; bQualities; CO_at_ViewTabsLabelsOLD; CO_l_FurtherFieldsMod; Last; vAdd; vCM; vCP; vCT; xApply)
	C_LONGINT:C283(xCount)
	C_TEXT:C284(<>DefRole; <>SYS_t_4DWriteType; $_t_EnquiriesMenuName; $_t_FunctionsMenuName; $_t_oldMethodName; $_t_PurchaseLedgerMenuName; $_t_SalesLedgerMenuName; $_t_ViewMenuName; COM_t_titleVAT; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_AttachContactCode; SYS_t_AccessType; vButtDisCom; vCompCode; vCompName; vForename; vPostcode; vSurname; vTitle)
	C_TEXT:C284(vTitle2; vTown; WS_t_recordState)
End if 
//Code Starts Here




$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPB")
//Companies_InLPB
ARRAY TEXT:C222(COM_at_FurtherCommentIDS; 0)
ARRAY TEXT:C222(COM_At_FurthCommentsLabels; 0)
//ARRAY TEXT(COM_at_FurtherCommentIDS;0)
//ARRAY TEXT(COM_at_FurtherCommentLabels;0)

ARRAY TEXT:C222(WS_at_RSPropertyTypes; 0; 0)
ARRAY LONGINT:C221(WS_al_RSProperties; 0; 0)
ARRAY TEXT:C222(WS_at_RsProperties; 0; 0)


ARRAY TEXT:C222(WS_at_RecordStateProperties; 0)
ARRAY TEXT:C222(WS_at_RecordStates; 0)
ARRAY LONGINT:C221(WS_al_RecordStatesID; 0)

//NG Feb 2002
$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
$_bo_AccessAllowed:=RS_RecordAccessAllowed(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; ->WS_at_RecordStateProperties; ->WS_t_recordState)
If ($_bo_AccessAllowed)
	
	Case of 
		: ((User in group:C338(Current user:C182; "Manager")) | (Current user:C182="Manager"))
			OBJECT SET VISIBLE:C603(WS_at_RecordStates; True:C214)
		: ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Administrator") | (Current user:C182="Designer"))
			OBJECT SET VISIBLE:C603(WS_at_RecordStates; True:C214)
			//if it is the administrator make it modifiable
			$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; False:C215; ->WS_at_RecordStateProperties)
		Else 
			//  SET VISIBLE(WS_at_RecordStates;False)
			OBJECT SET VISIBLE:C603(WS_at_RecordStates; True:C214)
			//if it is the administrator make it modifiable
			$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; False:C215; ->WS_at_RecordStateProperties)
	End case 
	//TRACE
	$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[COMPANIES:2]; ->COM_at_FurtherCommentIDS; ->COM_at_FurtherCommentLabels)  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
	If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
		
		USE SET:C118("FUR_FFSelection")
		CREATE SET:C116([CUSTOM_FIELDS:98]; "COM_FFSelection")
	Else 
		CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "COM_FFSelection")
	End if 
	CLEAR SET:C117("FUR_FFSelection")
	CO_l_FurtherFieldsMod:=0
	//FURTHER FIELDS CANNOT BE PUT ON THE MENU
	CO_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
	//Note that for a new record this will be false!!!!!
	COM_COMtoComments
	CO_Contexts
	If (CO_at_ViewTabsLabelsOLD>0)
		CO_at_ViewTabsLabelsOLD:=0
		
	End if 
	If (CO_at_ViewTabsLabels=0)
		CO_at_ViewTabsLabels:=1
		CO_at_ViewTabsLabelsOLD:=0
	End if 
	CREATE EMPTY SET:C140([COMPANIES:2]; "Rejected")
	WS_at_RecordStates:=0
	If ([COMPANIES:2]Company_Code:1="")
		If (vCM=0)
			If (DB_t_CurrentFormUsage#"None")
				If ([COMPANIES:2]Company_Name:2#"")
					CREATE EMPTY SET:C140([COMPANIES:2]; "Rejected")
					Company_No
				Else 
					CREATE EMPTY SET:C140([COMPANIES:2]; "Rejected")
					
				End if 
				
				Companies_InBDe
				If ((vSurname#"") & ([COMPANIES:2]Company_Name:2="") & (vAdd=1))
					If (SD_t_AttachContactCode="")
						CREATE RECORD:C68([CONTACTS:1])
						Contact_Code
						If (<>MultiCo)
							CREATE RECORD:C68([CONTACTS_COMPANIES:145])
							[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
							[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
							[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
							DB_SaveRecord(->[CONTACTS_COMPANIES:145])
							[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						Else 
							[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						End if 
						[CONTACTS:1]Title:3:=Uppers2(vTitle)
						[CONTACTS:1]Forename:4:=Uppers2(vForename)
						[CONTACTS:1]Surname:5:=Uppers2(vSurname)
						[CONTACTS:1]Contact_Name:31:=Cont Name
						[CONTACTS:1]Role:11:=<>DefRole
						If (([CONTACTS:1]Forename:4#"") & (<>SYS_bo_DefaultSalutation))
							If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
								[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
							End if 
						End if 
						DB_t_CurrentFormUsage:=""
						vSurname:=""
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					Else 
						//Attach a contact
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD_t_AttachContactCode)
						SD_t_AttachContactCode:=""
						If (<>MultiCo)
							[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
							[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
							[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
							DB_SaveRecord(->[CONTACTS_COMPANIES:145])
							[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						Else 
							[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						End if 
					End if 
					
				End if 
			End if 
			
		End if 
	End if 
	If ([COMPANIES:2]x_ID:63=0) & ([COMPANIES:2]Company_Code:1#"")
		[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
	End if 
	
	If ([COMPANIES:2]Company_Name:2="")
		If ((vCM=0) & (vAdd=1) & ((vCompName#"") | (vTown#"") | (vPostcode#"")))
			Companies_InBIn
		Else 
			If ((vCM=1) & (DB_t_CurrentFormUsage2#"xComp") & (vAdd=1))
				vCompName:=[COMPANIES:2]Company_Code:1
				Company_No
				Companies_InBDe
				vCompCode:=[COMPANIES:2]Company_Code:1
			End if 
		End if 
	End if 
	
	
	
	
	If (SYS_t_AccessType="Q")  // Was used to determine different screens-Aug 2006 no longer used for that
		If (DB_t_CurrentFormUsage="AS")
			DB_t_CurrentFormUsage:=""
		End if 
		If (vCT=0)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
			UNLOAD RECORD:C212([CONTACTS:1])
		End if 
	Else 
		
		Companies_InB2
		$_t_ViewMenuName:=Get localized string:C991("Menu_View")
		If (DB_t_CurrentFormUsage#"None")
			If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
				DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_DiaryItems"); 3; "")
				
				
				OBJECT SET ENABLED:C1123(xCount; False:C215)
				OBJECT SET ENABLED:C1123(xApply; False:C215)
			Else 
				If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
					OBJECT SET ENABLED:C1123(xApply; False:C215)
				End if 
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)#2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#4) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#4))
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_Credit_Stage:42; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_TAX:41; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]TAX_Prefix:38; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]TAX_Registration_Number:39; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]SO_Price_Group:44; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Address_Line_One:18; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Address_Line_Two:19; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Town:20; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_County:21; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Postcode:22; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Country:23; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Dept:24; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Invoice_Name:25; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_Layer:51; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_Currency:59; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)#2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#4))
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Sales_Credit:35; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger)#2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)#4))
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Purchase_Credit:36; False:C215)
			End if 
			If (DB_GetModuleSettingByNUM(Module_MultiLayer)<2)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_Layer:51; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Default_Currency:59; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(14))<2)
				OBJECT SET ENABLED:C1123(Last; False:C215)
			Else 
				//If (vALUsed=False)  `remove these 3 lines when old method is dropped
				//   SEARCH([QUALITIES];[QUALITIES]Company Code=[COMPANIES]Company Code)
				// End if
			End if 
			If ((DB_GetModuleSettingByNUM(31)<2) | (DB_GetModuleSettingByNUM(31)=3))
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Mailsort_SSC:49; False:C215)
				OBJECT SET ENTERABLE:C238([COMPANIES:2]Mailsort_OFN:50; False:C215)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(1)#5)
			Companies_vAT2
		End if 
		vTitle2:=Term_VATWT("Default VAT Code")
		COM_t_titleVAT:=Term_VATWT("EC VAT Reg No")
	End if 
	vCompCode:=[COMPANIES:2]Company_Code:1
	$_t_ViewMenuName:=Get localized string:C991("Menu_View")
	
	If (DB_t_CurrentFormUsage#"None")
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_PriceTable"); 3; "")
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_WPManager))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_DocumentHistory"); 3; "")
			
		End if 
		If (<>SYS_t_4DWriteType="W")  // 4Dwrite "Gold"
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_DocumentHistory"); 1; Get localized string:C991("MenuItem_LettersQuotes"))
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_EnquiryWriter"); 3; "")
		End if 
		$_t_EnquiriesMenuName:=Get localized string:C991("MenuItem_EnquiryWriter")
		$_t_EnquiriesMenuName:=Term_OrdWT($_t_EnquiriesMenuName)
		If ($_t_EnquiriesMenuName#Get localized string:C991("MenuItem_EnquiryWriter"))
			
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_EnquiryWriter"); 1; Term_OrdWT("SalesBook"))
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_SalesOrders"); 3; "")
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_SalesLedger"); 3; "")
			$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_SalesLedger"); 1; $_t_SalesLedgerMenuName)
			
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_PurchaseLedger"); 3; "")
			$_t_PurchaseLedgerMenuName:=Term_SLPLWT($_t_PurchaseLedgerMenuName)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_PurchaseLedger"); 1; $_t_PurchaseLedgerMenuName)
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_PurchaseOrders"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)<2)
			DB_MenuAction($_t_ViewMenuName; Get localized string:C991("MenuItem_ServiceCalls"); 3; "")
		End if 
		
		
		If ((DB_GetModuleSettingByNUM(1))=5)
			
			DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_SwitchAccess"); 3; "")
			
			
		End if 
		vButtDisCom:="I                "
		Input_Buttons(->[COMPANIES:2]; ->vButtDisCom; "Company"; "Contact")
		//If (MOD_l_CurrentModuleAccess>2)
		//  DISABLE BUTTON(xMinusO)
		//End if
	End if 
	
	If ([COMPANIES:2]Company_Code:1="")
		DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 2; "")
	Else 
		If (Not:C34(<>OneEntry))
			DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 3; "")
		Else 
			DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 2; "")
		End if 
		
	End if 
	
	If (Not:C34(<>OneEntry))
		
		If (Is Windows:C1573)  //needed to force it to turn the check off
			DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; "18"; Current process:C322; False:C215)
			
		Else 
			DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; "²"; Current process:C322; False:C215)
			
		End if 
	Else 
		DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; ""; Current process:C322; False:C215)
	End if 
	
	
	
	
	
	DB_t_CallOnCloseorSave:="P:Companies_InLPA:C:Companies_InCan"
	If (vAdd=1)
		DB_bo_RecordModified:=True:C214
	End if 
	Gen_FindVars
	vCP:=1
	If ([COMPANIES:2]Company_Name:2#"")
		OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Name:2; False:C215)
		OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Code:1; False:C215)
	End if 
	
Else 
	CANCEL:C270
End if 
//TRACE

If (Size of array:C274(COM_At_FurthCommentsLabels)>0)
	INSERT IN ARRAY:C227(COM_At_FurthCommentsLabels; 1; 1)
	INSERT IN ARRAY:C227(COM_at_FurtherCommentIDS; 1; 1)
	COM_At_FurthCommentsLabels{1}:="Comments"
	COM_at_FurtherCommentLabels:=1
	OBJECT SET VISIBLE:C603(*; "oFurthFieldComments"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCompanyCommentField"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "oFurthFieldComments"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oCompanyCommentField"; False:C215)
End if 
ERR_MethodTrackerReturn("Companies_InLPB"; $_t_oldMethodName)
