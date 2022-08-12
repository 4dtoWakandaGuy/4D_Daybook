//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/03/2010 13:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>ContCode)
	//C_UNKNOWN(<>SalesOrder)
	//C_UNKNOWN(<>Source)
	//C_UNKNOWN(<>StatesLoaded)
	//C_UNKNOWN(<>TermEst)
	//C_UNKNOWN(bPrintAuths)
	//C_UNKNOWN(Bvoid)
	//C_UNKNOWN(Vadd)
	//C_UNKNOWN(vAttendType)
	//C_UNKNOWN(vButtDisOrd)
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vCompName)
	//C_UNKNOWN(vDetails)
	//C_UNKNOWN(vDiaryCheck)
	//C_UNKNOWN(vFromIn)
	//C_UNKNOWN(vMod2)
	//C_UNKNOWN(vNo2)
	//C_UNKNOWN(vOR)
	//C_UNKNOWN(vOrderCode)
	//C_UNKNOWN(vProcaMod)
	//C_UNKNOWN(vSelPrev)
	//C_UNKNOWN(vSource)
	//C_UNKNOWN(vTel)
	//C_UNKNOWN(vTotal)
	//C_UNKNOWN(vVATTitle)
	//C_UNKNOWN(xApply)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(ORD_al_RevisionNumbers;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>SalesOrder; <>StatesLoaded; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultSource; <>TermEst; CCM_bo_IsLicenced; LBI_bo_NoEdit; ORD_bo_FurtherFieldsLoaded; ORD_bo_IsRevision; ORD_bo_ItemsModified; STK_bo_ALLOCATIONASKED)
	C_BOOLEAN:C305(STK_bo_SHOWSTOCKALLOCATION; vFromIn; vMod2; <>ForceCred; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultSource; CCM_bo_IsLicenced; LBI_bo_NoEdit; ORD_bo_FurtherFieldsLoaded; ORD_bo_IsRevision; ORD_bo_ItemsModified)
	C_BOOLEAN:C305(ORD_bo_OrderModified; STK_bo_ALLOCATIONASKED; STK_bo_SHOWSTOCKALLOCATION)
	C_DATE:C307(ACC_d_EntryDateFrom; ORD_d_EntryDateFrom; <>DB_d_CurrentDate; ACC_d_EntryDateFrom; ORD_d_EntryDateFrom)
	C_LONGINT:C283($_l_FurtherFieldsExist; $_l_Index; $_l_Silver; bPrintAuths; Bvoid; CCM_l_CardToUse; DF_l_ContactCentric; MOD_l_CurrentModuleAccess; ORD_l_DOwn; ORD_l_FurtherFieldsMod; ORD_l_RevisionNumbers)
	C_LONGINT:C283(ORD_l_SelectedViewTabOLD; Ord_l_UP; Vadd; vDiaryCheck; vNo2; vOR; vProcaMod; xApply; <>SYS_l_ORDDefaultRequiredDays; $_l_FurtherFieldsExist; $_l_Index)
	C_LONGINT:C283($_l_Silver; CCM_l_CardToUse; DF_l_ContactCentric; MOD_l_CurrentModuleAccess; ORD_l_DOwn; ORD_l_FurtherFieldsMod; ORD_l_OrderRevision; ORD_l_RevisionNumbers; ORD_l_SelectedViewTabOLD; Ord_l_UP)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285(vTotal; vTot)
	C_TEXT:C284(<>ContCode; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>Source; <>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_oldMethodName)
	C_TEXT:C284(COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; ORD_t_AddressLine1; ORD_t_AddressLine2; ORD_t_Country; ORD_t_County; ORD_t_PostalCode; ORD_t_RevisionNote)
	C_TEXT:C284(ORD_t_Town; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SYS_t_AccessType; vAttendType; vButtDisOrd; vCallCode; vCompName; vDetails; vOrderCode; VSELPREV)
	C_TEXT:C284(vSource; vTel; vVATTitle; <>CompCode; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>SYS_t_BaseCurrency)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; <>UserAdd; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; ORD_t_AddressLine1; ORD_t_AddressLine2; ORD_t_Country; ORD_t_County; ORD_t_OrderCode)
	C_TEXT:C284(ORD_t_PostalCode; ORD_t_RevisionNote; ORD_t_Town; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SYS_t_AccessType; vContName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPB")
//Orders_InLPB
STK_bo_ALLOCATIONASKED:=False:C215
STK_bo_SHOWSTOCKALLOCATION:=True:C214
//THE ABOve settings will mean that on changing a stock quantity the user will be asked if the want to allocate stock with an option to hold stock allocation till the end
//if they choose to not hold allocation then no subsequent lines will ask about allocation. When they save the order if STK_bo_SHowStockAllocation is false then requried allocations will be checked(dont want to ask if none of the lines should allocate)
//if there are lines requiring allocation the user will then be offered the option to auto or manully allocate.
//note that they only get one chance to hold allocation so if they say no dont hold allocation they wont be asked about allocating stock on subsequent lines the allocation window will come up
ARRAY LONGINT:C221(ORD_al_RevisionNumbers; 0)
OBJECT SET VISIBLE:C603(ORD_l_RevisionNumbers; False:C215)
OBJECT SET VISIBLE:C603(*; "oRevisionLabel"; False:C215)
OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; False:C215)
OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; False:C215)
ORD_t_RevisionNote:=""
CCM_l_CardToUse:=0
LBI_bo_NoEdit:=False:C215
CCM_LoadServiceProvidersV11(True:C214)
DF_LoadOrderEntryOption
If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If (ORD_bo_IsRevision)
	LBI_bo_NoEdit:=True:C214
	ORD_t_RevisionNote:="Drag Order Lines to copy them"
	Vadd:=0
	If (ORD_l_OrderRevision>=0)
		SET WINDOW TITLE:C213("View Order revision")
		ORD_OrderRetrieveRevision(ORD_t_OrderCode; ORD_l_OrderRevision)
	Else 
		//we are viewing an order  to copy items
		For ($_l_Index; 1; Get last field number:C255(->[ORDERS:24]))
			$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_l_Index)
			OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
		End for 
		For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
			$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
			OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
		End for 
	End if 
	OBJECT SET ENABLED:C1123(Ord_l_UP; False:C215)
	OBJECT SET ENABLED:C1123(ORD_l_DOwn; False:C215)
	
	//_O_DISABLE BUTTON(Ord_l_UP)
	//_O_DISABLE BUTTON(ORD_l_DOwn)
	OBJECT SET ENTERABLE:C238(ACC_d_EntryDateFrom; False:C215)
	OBJECT SET VISIBLE:C603(xApply; False:C215)
	
Else 
	If ([ORDERS:24]Order_Code:3#"")
		READ ONLY:C145([XOrder_revisions:127])
		QUERY:C277([XOrder_revisions:127]; [XOrder_revisions:127]X_OrderCode:4=[ORDERS:24]Order_Code:3)
		If (Records in selection:C76([XOrder_revisions:127])>0)
			SELECTION TO ARRAY:C260([XOrder_revisions:127]X_RevisionNumber:2; ORD_al_RevisionNumbers)
			SORT ARRAY:C229(ORD_al_RevisionNumbers)
			OBJECT SET VISIBLE:C603(ORD_l_RevisionNumbers; True:C214)
			OBJECT SET VISIBLE:C603(*; "oRevisionLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; True:C214)
			OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; True:C214)
			ORD_l_RevisionNumbers:=ORD_al_RevisionNumbers{Size of array:C274(ORD_al_RevisionNumbers)}
			SORT ARRAY:C229(ORD_al_RevisionNumbers; <)
			ORD_al_RevisionNumbers:=1
			Case of 
				: (Size of array:C274(ORD_al_RevisionNumbers)=1)
					OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; False:C215)
					OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; False:C215)
				: (Size of array:C274(ORD_al_RevisionNumbers)>1)
					OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; True:C214)
					OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; True:C214)
				Else 
					OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; False:C215)
					OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; False:C215)
					//its a new order so it WILL be modified
					ORD_bo_OrderModified:=True:C214
					ORD_bo_ItemsModified:=True:C214
			End case 
			
		End if 
	Else 
		OBJECT SET VISIBLE:C603(*; "Ord_Pi_RevisionPopUp"; False:C215)
		OBJECT SET VISIBLE:C603(ORD_al_RevisionNumbers; False:C215)
		//its a new order so it WILL be modified
		ORD_bo_OrderModified:=True:C214
		ORD_bo_ItemsModified:=True:C214
		
	End if 
	
End if 

If (Not:C34(CCM_bo_IsLicenced))
	OBJECT SET VISIBLE:C603(Bvoid; False:C215)
	OBJECT SET VISIBLE:C603(bPrintAuths; False:C215)
	OBJECT SET TITLE:C194(*; "oAuthorizePayment"; "Select Payment Card")
	
End if 

vDiaryCheck:=0

$_l_Silver:=3*Num:C11(DB_GetModuleSettingByNUM(1)=5)  //no of positions to remove if Silver  - same on Print & Functions
If (SYS_t_AccessType#"Q") | (True:C214)
	If ([ORDERS:24]Delivery_Company:29#"")
		Orders_InLPDelC
	Else 
		vDetails:=""
	End if 
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[ORDERS:24])
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "ORD_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "ORD_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")  //
ORD_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
ORD_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!
ORD_Contexts
If (ORD_l_SelectedViewTabOLD>0)
	ORD_at_ViewTabsLabels:=ORD_l_SelectedViewTabOLD
End if 
If (ORD_at_ViewTabsLabels=0)
	ORD_at_ViewTabsLabels:=1
	ORD_l_SelectedViewTabOLD:=0
End if 
If (SD_t_CallingCompanyCode#"") & ([ORDERS:24]Company_Code:1="")
	[ORDERS:24]Company_Code:1:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
	If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
	End if 
	[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
	Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
	If (SD_t_CallingContactCode="")
		Check_ContDef(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
	End if 
	Orders_InLPArea
	If ([COMPANIES:2]Default_Layer:51#"")
		[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
	End if 
	If ([COMPANIES:2]Default_Currency:59#"")
		[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
	End if 
	
End if 
If ([ORDERS:24]Contact_Code:2="") & (SD_t_CallingContactCode#"")
	[ORDERS:24]Contact_Code:2:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
	If ([ORDERS:24]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	End if 
	If (([ORDERS:24]Company_Code:1="") & (Not:C34(Check_ContCorr(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2))))
		[ORDERS:24]Company_Code:1:=[CONTACTS:1]Company_Code:1
		If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
		[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
		Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
		Orders_InLPArea
		
		If ([COMPANIES:2]Default_Layer:51#"")
			[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
		End if 
		If ([COMPANIES:2]Default_Currency:59#"")
			[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
		End if 
	End if 
End if 

If ((vAdd=1) & (<>SYS_bo_DefaultEntry) & (DB_t_CurrentFormUsage#"CP") & ((<>ForceCred=False:C215) | (DB_t_CurrentFormUsage="InEAdd") | (DB_t_CurrentFormUsage="InQAdd")))
	If ((<>CompCode#"") & ([ORDERS:24]Company_Code:1=""))
		[ORDERS:24]Company_Code:1:=<>CompCode
		If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
		[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
		Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
		If (<>ContCode="")
			Check_ContDef(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
		End if 
		Orders_InLPArea
		If ([COMPANIES:2]Default_Layer:51#"")
			[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
		End if 
		If ([COMPANIES:2]Default_Currency:59#"")
			[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
		End if 
	Else 
		If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
	End if 
	If ((<>ContCode#"") & ([ORDERS:24]Contact_Code:2=""))
		[ORDERS:24]Contact_Code:2:=<>ContCode
		If ([ORDERS:24]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
			RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		End if 
		If ((<>CompCode="") & (Not:C34(Check_ContCorr(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2))))
			[ORDERS:24]Company_Code:1:=[CONTACTS:1]Company_Code:1
			If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
			End if 
			[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
			Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
			Orders_InLPArea
			If ([COMPANIES:2]Default_Layer:51#"")
				[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
			End if 
			If ([COMPANIES:2]Default_Currency:59#"")
				[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
			End if 
		End if 
	Else 
		If ([ORDERS:24]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
			RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		End if 
	End if 
Else 
	If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
	End if 
	If ([ORDERS:24]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	End if 
End if 
vCompName:=[COMPANIES:2]Company_Name:2
vTel:=[COMPANIES:2]Telephone:9
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
	
End if 
vContName:=CON_BuildContactNameandJobTitle
If ([ORDERS:24]Order_Code:3="")
	Orders_Code
	Orders_InLPBDef
End if 
If (DB_t_CurrentFormUsage#"AS")  //only because the Items are always brought in anyway in the during
	Orders_InLPOI
End if 
vNo2:=0
vOR:=1
vTot:=0
vOrderCode:=[ORDERS:24]Order_Code:3
vTotal:=0
If (DB_t_CurrentFormUsage#"None")
	If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
		DB_MenuAction("View"; "View Items"; 3; "")
		// DISABLE MENU ITEM(2049;4)
	End if 
	If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print") | (MOD_l_CurrentModuleAccess=3))
		DB_MenuAction("Print"; ""; 3; "")
		DB_MenuAction("Functions"; ""; 3; "")
		// DISABLE MENU ITEM(2050;0)
		// DISABLE MENU ITEM(2051;0)
	Else 
		If ((DB_GetModuleSettingByNUM(1)#5) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2))  //grey Qtns if no EnqWriter
			DB_MenuAction("Print"; "Quotation Form"; 3; "")
			DB_MenuAction("Print"; "Quotation WP"; 3; "")
			//DISABLE MENU ITEM(2050;1)
			//DISABLE MENU ITEM(2050;2)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
			DB_MenuAction("Functions"; "View Stock Levels"; 3; "")
			
			//   DISABLE MENU ITEM(2051;11-$_l_Silver)
			If (vProcaMod#13)
				DB_MenuAction("Functions"; "Unallocate - Auto"; 3; "")
				DB_MenuAction("Functions"; "Allocate - Auto"; 3; "")
				// DISABLE MENU ITEM(2051;10-$_l_Silver)
				// DISABLE MENU ITEM(2051;9-$_l_Silver)
			End if 
			DB_MenuAction("Functions"; "Allocate Stock"; 3; "")
			// DISABLE MENU ITEM(2051;8-$_l_Silver)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
			DB_MenuAction("Functions"; "Trial Assembly - Display"; 3; "")
			DB_MenuAction("Functions"; "  Show Top Level Items"; 3; "")
			DB_MenuAction("Functions"; "  Show Next Level Items"; 3; "")
			// DISABLE MENU ITEM(2051;13)
			//   DISABLE MENU ITEM(2051;16)
			//  DISABLE MENU ITEM(2051;17)
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders)<2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3))
			DB_MenuAction("View"; "Order Items"; 3; "")
			//  DISABLE MENU ITEM(2049;9)
			DB_MenuAction("Functions"; "Allocate Stock"; 3; "")
			//DISABLE MENU ITEM(2051;8-$_l_Silver)
			If (vProcaMod#13)
				DB_MenuAction("Functions"; "Allocate - Auto"; 3; "")
				// DISABLE MENU ITEM(2051;9-$_l_Silver)
				DB_MenuAction("Functions"; "Unallocate - Auto"; 3; "")
				//  DISABLE MENU ITEM(2051;10-$_l_Silver)
			End if 
			DB_MenuAction("Print"; "  Deliver Allocated Items"; 3; "")
			DB_MenuAction("Print"; "  Items by Date"; 3; "")
			DB_MenuAction("Print"; "  All Items not Delivered"; 3; "")
			DB_MenuAction("Print"; "  Deliver Selected Items"; 3; "")
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
			If ($_l_Silver=0)
				DB_MenuAction("Print"; "Proforma Invoice"; 3; "")
				
			End if 
			DB_MenuAction("Print"; "  Allocated Items"; 3; "")
			DB_MenuAction("Print"; "  Items by Invoice No"; 3; "")
			DB_MenuAction("Print"; "  All Items not Invoiced"; 3; "")
			DB_MenuAction("Print"; "  Selected items"; 3; "")
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)
				DB_MenuAction("View"; "Sales Ledger"; 3; "")
				
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=3))
			DB_MenuAction("Print"; "  Items by Purch Ord No"; 3; "")
			DB_MenuAction("Print"; "  Selected Items"; 3; "")
			
		End if 
		If ((<>UserAdd#"@avid@") & (vProcaMod#13))
			DB_MenuAction("Functions"; "Export Order to Disk"; 3; "")
			DB_MenuAction("Functions"; "Export Order to Picture  "; 3; "")
			
		End if 
	End if 
	
	DB_MenuAction("Functions"; "Allocate Stock"; 1; Term_StoWT("Allocate Stock"))
	
	DB_MenuAction("Functions"; "View Stock Levels"; 1; Term_StoWT("View Stock Levels"))
	
	
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)
		DB_MenuAction("View"; "Subscriptions Details"; 3; "")
		
	End if 
	
End if 

If (vAdd=1)
	Case of 
		: (DB_t_CurrentFormUsage="InEAdd")
			[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{1}
			If ([ORDERS:24]Enquiry_Date:25=!00-00-00!)
				[ORDERS:24]Enquiry_Date:25:=<>DB_d_CurrentDate
			End if 
		: (DB_t_CurrentFormUsage="InQAdd")
			[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{2}
			If ([ORDERS:24]Quotation_Date:26=!00-00-00!)
				[ORDERS:24]Quotation_Date:26:=<>DB_d_CurrentDate
			End if 
		Else 
			If (([ORDERS:24]Order_Date:4=!00-00-00!) | (DB_t_CurrentFormUsage="InVAdd"))
				[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{3}
				If ([ORDERS:24]Order_Date:4=!00-00-00!)
					[ORDERS:24]Order_Date:4:=<>DB_d_CurrentDate
					[ORDERS:24]Order_Period:42:=ACC_GetCurrentperiod
				End if 
			End if 
	End case 
	If ([ORDERS:24]Required_Date:9=!00-00-00!)
		[ORDERS:24]Required_Date:9:=<>DB_d_CurrentDate+<>SYS_l_ORDDefaultRequiredDays
	End if 
	If (([ORDERS:24]Currency_Code:32="") & (Records in selection:C76([ORDER_ITEMS:25])=0))
		[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
	End if 
	If (DF_l_ContactCentric=1)
		GOTO OBJECT:C206([ORDERS:24]Contact_Code:2)
	End if 
Else 
	GOTO OBJECT:C206([ORDERS:24]Source:18)
	HIGHLIGHT TEXT:C210([ORDERS:24]Source:18; 80; 80)
End if 
If (DB_t_CurrentFormUsage#"None")
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
		OBJECT SET ENTERABLE:C238([ORDERS:24]Currency_Code:32; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
		OBJECT SET ENTERABLE:C238([ORDERS:24]Layer_Code:47; False:C215)
	End if 
End if 

If (SYS_t_AccessType#"Q") | (True:C214)
	If ([ORDERS:24]Source:18#"")
		RELATE ONE:C42([ORDERS:24]Source:18)
		vSource:=[SOURCES:6]Source_Name:2
	Else 
		vSource:=""
	End if 
	If ([ORDERS:24]Order_Type:43#"")
		RELATE ONE:C42([ORDERS:24]Order_Type:43)
		vAttendType:=[JOB_TYPES:65]Type_Name:2
	Else 
		vAttendType:=""
	End if 
End if 
If ((Locked:C147([ORDERS:24])) | (Read only state:C362([ORDERS:24])))
	OBJECT SET ENTERABLE:C238(ORD_d_EntryDateFrom; False:C215)
End if 
If (DB_t_CurrentFormUsage#"None")
	Order_Title
	
	vVATTitle:=Term_VATWT("VAT/Total")
	
	
	
	vButtDisOrd:="IO       SS R AD "
	If (ORD_bo_IsRevision)
		vButtDisOrd:="DO       SS R AD "
	End if 
End if 
States_CUArr(->[ORDERS:24]State:15)


If (((<>SYS_al_RecStateRestriction{24}{vStPos}\2)%2)=1)
	Orders_InLPBDis
Else 
	If (vSelPrev="&Dis")
		Orders_InLPBEn
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
		If ([ORDERS:24]State:15>("024"+<>SYS_at_RecStateCodes{24}{3}))
			If (vProcaMod=13)
				If ((<>SalesOrder=False:C215) | (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3))
					
					Orders_InLPBDis
				End if 
			End if 
		End if 
	End if 
End if 
If ((<>SYS_bo_DefaultSource) & (vAdd=1))  //has to be here cos need ST_ai_StatusUsage
	If (<>Source#"")
		[ORDERS:24]Source:18:=<>Source
		RELATE ONE:C42([ORDERS:24]Source:18)
		Orders_InLPDSou
	End if 
End if 
//If (DB_GetModuleSetting(21)>0)
//Gen_InDisCode (»[ORDERS]Order Code;»vButtDisOrd)
//End if
If (ORD_bo_IsRevision)
End if 
If (DB_t_CurrentFormUsage#"None")
	Input_Buttons(->[ORDERS:24]; ->vButtDisOrd; "Order"; "Order Item")
	DB_t_CallOnCloseorSave:="P:Orders_InLPA:D:Orders_InCan"
	If (<>TermEst)
		Orders_PPQtnEst
	End if 
	Gen_FindVars
End if 

vMod2:=False:C215
vFromIn:=False:C215
vCallCode:=[ORDERS:24]Company_Code:1
CCM_LoadOrderAuths([ORDERS:24]x_ID:58)
If ([ORDERS:24]Deliver_To:31="") | ([ORDERS:24]X_DeliveryAddressID:59>0)
	If ([ORDERS:24]X_DeliveryAddressID:59>0)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
		[ORDERS:24]Deliver_To:31:=[AddressRecords:125]FormattedAddress:12
	End if 
	
End if 
OBJECT SET ENTERABLE:C238([ORDERS:24]Deliver_To:31; False:C215)
ORD_t_AddressLine1:=""
ORD_t_AddressLine2:=""
ORD_t_Town:=""
ORD_t_County:=""
ORD_t_PostalCode:=""
ORD_t_Country:=""
DB_t_Address1Label:=<>DB_t_Address1Label
DB_t_Address2Label:=<>DB_t_Address2Label
DB_t_TownLabel:=<>DB_t_TownLabel
DB_t_CountyLabel:=<>DB_t_CountyLabel
DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
DB_t_CountryLabel:=<>DB_t_CountryLabel
OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
ORD_COMtoComments
Macro_AccType("Load "+String:C10(Table:C252(->[ORDERS:24])))
ERR_MethodTrackerReturn("Orders_InLPB"; $_t_oldMethodName)
