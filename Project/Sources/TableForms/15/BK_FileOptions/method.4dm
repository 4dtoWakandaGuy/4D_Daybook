If (False:C215)
	//Table Form Method Name: [USER]BK_FileOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DM_ai_DefaultState;0)
	//ARRAY LONGINT(BK_al_DayBookContext;0)
	//ARRAY LONGINT(DM_al_OrderDelMethod;0)
	//ARRAY LONGINT(DM_al_OrderDelTerms;0)
	//ARRAY LONGINT(DM_al_OrderTerms;0)
	//ARRAY REAL(DM_ar_ContactTaxRate;0)
	//ARRAY TEXT((DM_at_ContactRoleCode;0)
	//ARRAY TEXT(BK_at_DayBookContext;0)
	//ARRAY TEXT(DM_at_ALLstates;0)
	//ARRAY TEXT(DM_at_CompanyStatusCode;0)
	//ARRAY TEXT(DM_at_CompanyStatusName;0)
	//ARRAY TEXT(DM_at_ContactRoleCode;0)
	//ARRAY TEXT(DM_at_ContactRoleName;0)
	//ARRAY TEXT(DM_at_ContactStageCode;0)
	//ARRAY TEXT(DM_at_ContactStageName;0)
	//ARRAY TEXT(DM_at_ContactTaxCode;0)
	//ARRAY TEXT(DM_at_ContactTaxName;0)
	//ARRAY TEXT(DM_at_ContactTYPE_PPG;0)
	//ARRAY TEXT(DM_at_ContactTYPE_SPG;0)
	//ARRAY TEXT(DM_at_ContactTypeCode;0)
	//ARRAY TEXT(DM_at_ContactTypeName;0)
	//ARRAY TEXT(DM_at_OrderAnalysisCode;0)
	//ARRAY TEXT(DM_at_OrderAreaCode;0)
	//ARRAY TEXT(DM_at_OrderAreaName;0)
	//ARRAY TEXT(DM_at_OrderCurCode;0)
	//ARRAY TEXT(DM_at_OrderCurName;0)
	//ARRAY TEXT(DM_at_OrderDelMethod;0)
	//ARRAY TEXT(DM_at_OrderDelTerms;0)
	//ARRAY TEXT(DM_at_OrderLayerCode;0)
	//ARRAY TEXT(DM_at_OrderPersonInitials;0)
	//ARRAY TEXT(DM_at_OrderPersonName;0)
	//ARRAY TEXT(DM_at_OrderSourceCode;0)
	//ARRAY TEXT(DM_at_OrderSourceName;0)
	//ARRAY TEXT(DM_at_OrderTBINIT;0)
	//ARRAY TEXT(DM_at_OrderTBName;0)
	//ARRAY TEXT(DM_at_OrderTerms;0)
	//ARRAY TEXT(DM_at_OrderTypeCode;0)
	//ARRAY TEXT(DM_at_OrderTypeName;0)
	//ARRAY TEXT(DM_at_POPriceGroupCodes;0)
	//ARRAY TEXT(DM_at_POPriceGroups;0)
	//ARRAY TEXT(DM_at_SOPriceGroupNames;0)
	//ARRAY TEXT(DM_at_SOPriceGroups;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; BK_l_OrdDataModelID; BL_l_OptionsContext; DM_l_CurrentOptions; DM_l_DataOptions; DM_l_OptionsContext)
	C_TEXT:C284($_t_oldMethodName; BK_t_OrdDataModelName; DM_t_ContextName; DM_t_OrderLayerCode; DM_t_OrderPersonInitials; DM_t_OrderTypeCode; DM_t_OrderTypeName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].BK_FileOptions"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "BK_FileOptions")
		WS_AutoscreenSize(3; 434; 478)
		ARRAY TEXT:C222(DM_at_OrderTypeName; 0)
		ARRAY TEXT:C222(DM_at_OrderTypeCode; 0)
		ARRAY TEXT:C222(DM_at_OrderPersonName; 0)
		ARRAY TEXT:C222(DM_at_OrderPersonInitials; 0)
		ARRAY TEXT:C222(DM_at_OrderTBName; 0)
		ARRAY TEXT:C222(DM_at_OrderTBINIT; 0)
		ARRAY TEXT:C222(DM_at_OrderSourceName; 0)
		ARRAY TEXT:C222(DM_at_OrderSourceCode; 0)
		ARRAY TEXT:C222(DM_at_OrderAreaName; 0)
		ARRAY TEXT:C222(DM_at_OrderAreaCode; 0)
		ARRAY TEXT:C222(DM_at_OrderDelMethod; 0)
		ARRAY LONGINT:C221(DM_al_OrderDelMethod; 0)
		ARRAY TEXT:C222(DM_at_OrderDelTerms; 0)
		ARRAY LONGINT:C221(DM_al_OrderDelTerms; 0)
		ARRAY TEXT:C222(DM_at_OrderCurName; 0)
		ARRAY TEXT:C222(DM_at_OrderCurCode; 0)
		ARRAY TEXT:C222(DM_at_OrderAnalysisCode; 0)
		ARRAY TEXT:C222(DM_at_OrderLayerCode; 0)
		ARRAY TEXT:C222(DM_at_OrderTerms; 0)
		ARRAY LONGINT:C221(DM_al_OrderTerms; 0)
		ARRAY INTEGER:C220(DM_ai_DefaultState; 0)
		ARRAY TEXT:C222(DM_at_StateNames; 0)
		ARRAY TEXT:C222(DM_at_StateFunction; 0)
		ARRAY TEXT:C222(DM_at_ContactTypeName; 0)
		ARRAY TEXT:C222(DM_at_ContactTypeCode; 0)
		ARRAY TEXT:C222(DM_at_ContactTYPE_SPG; 0)
		ARRAY TEXT:C222(DM_at_ContactTYPE_PPG; 0)
		ARRAY TEXT:C222(DM_at_POPriceGroupCodes; 0)
		ARRAY TEXT:C222(DM_at_POPriceGroups; 0)
		ARRAY TEXT:C222(DM_at_SOPriceGroupNames; 0)
		ARRAY TEXT:C222(DM_at_SOPriceGroups; 0)
		ARRAY TEXT:C222(DM_at_ContactStageName; 0)  //credit stage!
		ARRAY TEXT:C222(DM_at_CompanyStatusName; 0)
		ARRAY TEXT:C222(DM_at_CompanyStatusCode; 0)
		ARRAY TEXT:C222(DM_at_ContactTaxName; 0)
		ARRAY REAL:C219(DM_ar_ContactTaxRate; 0)
		ARRAY TEXT:C222(DM_at_ContactTaxCode; 0)
		ARRAY TEXT:C222(DM_at_ContactRoleName; 0)
		ARRAY TEXT:C222(DM_at_ContactRoleCode; 0)
		
		
		ARRAY TEXT:C222(DM_at_ContactStageCode; 0)
		ARRAY TEXT:C222(DM_at_ALLstates; 0)
		DM_t_OrderPersonInitials:=""
		DM_t_OrderPersonInitials:=""
		DM_t_OrderTypeCode:=""
		DM_t_OrderTypeName:=""
		ARRAY TEXT:C222(BK_at_DayBookContext; 3)
		ARRAY LONGINT:C221(BK_al_DayBookContext; 3)
		BK_t_OrdDataModelName:=""
		BK_l_OrdDataModelID:=0
		BK_at_DayBookContext{1}:="Orders"
		BK_al_DayBookContext{1}:=25
		BK_at_DayBookContext{2}:="Contacts"
		BK_al_DayBookContext{2}:=2
		BK_at_DayBookContext{3}:="Products"
		BK_al_DayBookContext{3}:=Table:C252(->[PRODUCTS:9])
		BK_at_DayBookContext:=0
		DM_OptionSettingsToScreen(DM_l_OptionsContext; 0)
		DM_l_CurrentOptions:=DM_l_DataOptions
		
		Case of 
			: (DM_l_OptionsContext=25)
				DM_t_ContextName:="ORDERS"
				If (DM_l_DataOptions>0)
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_DataOptions; *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=25)
					DM_OptionSettingsToScreen(DM_l_OptionsContext; DM_l_DataOptions)
				End if 
				FORM GOTO PAGE:C247(1)
				
			: (DM_l_OptionsContext=2)
				DM_t_ContextName:="CONTACTS"
				If (DM_l_DataOptions>0)
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_DataOptions; *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=2)
					DM_OptionSettingsToScreen(DM_l_OptionsContext; DM_l_DataOptions)
				End if 
				FORM GOTO PAGE:C247(2)
				
		End case 
		INT_SetLongintCheckFormat(->DM_ai_DefaultState)
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:BK_FileOptions"; $_t_oldMethodName)
