//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contracts_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CON_iRB_ChargoutBilling)
	//C_UNKNOWN(CON_iRB_TimeBilling)
	//C_UNKNOWN(CON2_iRB_ChargePartPeriod)
	//C_UNKNOWN(CON2_iRB_ChargePartPeriodnil)
	//C_UNKNOWN(CONT_4DWriteText)
	//C_UNKNOWN(CONT_BILLINGPRODUCT)
	//C_UNKNOWN(Letters Write)
	//C_UNKNOWN(vButtDisCNTR)
	//C_UNKNOWN(vCompName)
	//C_UNKNOWN(vOR)
	//C_UNKNOWN(vPDateF)
	//C_UNKNOWN(vStage)
	//C_UNKNOWN(vTel)
	//C_UNKNOWN(WR DELETE OFFSCREEN AREA)
	//C_UNKNOWN(WR INSERT TEXT)
	//C_UNKNOWN(WR New offscreen area)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//ARRAY BOOLEAN(CON_abo_FurtherMod;0)
	//ARRAY BOOLEAN(CON_abo_IsChargable;0)
	//ARRAY BOOLEAN(CON_lb_ChargeActions;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY POINTER(SVS_lb_ItemsSetup;0)
	//ARRAY TEXT(CON_at_ActionName;0)
	//ARRAY TEXT(CON_at_ActionsCodes;0)
	//ARRAY TEXT(CON_at_ChargableActions;0)
	//ARRAY TEXT(CON_at_ChargePeriods;0)
	//ARRAY TEXT(CON_at_DelFurtherCode;0)
	//ARRAY TEXT(CON_at_FurtherCodes;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(SVS_at_ChargableActions;0)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_BOOLEAN:C305($_bo_4DWriteInstalled; CON_bo_LoansBilling; CON_bo_PartsBilling; CON_bo_TimeOption; CONT_bo_FurtherFieldsLoaded; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_Sheduled; SVS_bo_TimeOption; $_bo_4DWriteInstalled)
	C_BOOLEAN:C305(CON_bo_Chargable; CON_bo_LoansBilling; CON_bo_PartsBilling; CON_bo_TimeOption; CONT_bo_FurtherFieldsLoaded; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_Sheduled; SVS_bo_TimeOption)
	C_DATE:C307(<>DB_d_CurrentDate; vPDateF; <>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ChargeableActionRow; $_l_FurtherFieldsExist; $_l_Index; $_l_Offscreen4DWArea; $_l_TypeOpenEndedStatus; bCON_l_FurthDelete; bCON_l_Furthmodify; CON_iRB_ChargoutBilling; CON_iRB_TimeBilling; CON_l_Chargable; CON_l_ChargeLoanOption)
	C_LONGINT:C283(CON_l_ChargePeriodType; CON_l_CurrentFurtherStatus; CON_l_LoansPricePeriod; CON_l_LoansPricePeriodOLD; CON_l_OpenEndedStatus; CON_l_RestrictCharging; CON_l_TimeBilling; CON_l_TimeMinimum; CON_l_TimeMinimumOLD; CON_l_TimePerUnit; CON_l_TimePerUnitOLD)
	C_LONGINT:C283(CON2_iRB_ChargePartPeriod; CON2_iRB_ChargePartPeriodnil; CONT_4DWriteText; CONT_l_BUT1; CONT_l_BUT2; CONT_l_BUT3; CONT_l_BUT4; CONT_l_BUT5; CONT_l_BUT6; CONT_l_BUT7; CONT_l_BUT8)
	C_LONGINT:C283(CONT_l_BUT9; CONT_l_FurtherFieldsMod; CONT_l_OpenEndedStatus; CONT_l_ViewTabsSelectedOLD; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimePerUnit; vOR)
	C_LONGINT:C283($_l_ChargeableActionRow; $_l_FurtherFieldsExist; $_l_Index; $_l_Offscreen4DWArea; $_l_TypeOpenEndedStatus; bCON_l_FurthDelete; bCON_l_Furthmodify; CON_l_Chargable; CON_l_ChargeLoanOption; CON_l_ChargePeriodType; CON_l_CurrentFurtherStatus)
	C_LONGINT:C283(CON_l_LoansPricePeriod; CON_l_LoansPricePeriodOLD; CON_l_OpenEndedStatus; CON_l_RestrictCharging; CON_l_TimeBilling; CON_l_TimeMinimum; CON_l_TimeMinimumOLD; CON_l_TimePerUnit; CON_l_TimePerUnitOLD; CON2_iRB_ChargeProRata; CONT_l_FurtherFieldsMod)
	C_LONGINT:C283(CONT_l_OpenEndedStatus; CONT_l_ViewTabsSelectedOLD; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimePerUnit)
	C_OBJECT:C1216(Cont_obj_WPText)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_DocumentWriteType; $_t_oldMethodName; $_t_SubItemName; COM_t_TelephoneNumberFormat; CON_t_CurFurtherCode; CON_t_CurrencyCode; CON_t_CurrencyCodeOLD; CON_t_CurrencyName; CON_t_LoansPriceGroup; CON_t_P2Area)
	C_TEXT:C284(CON_t_PartsPriceGroup; CONT_BILLINGPRODUCT; CONT_t_LoansPriceGroup; CONT_t_LoansPriceGroupOLD; CONT_t_PartsPriceGroup; CONT_t_PartsPriceGroupOLD; DB_t_CallOnCloseorSave; oContracttp_COL1; oContracttp_COL2; oContracttp_COL3; oContracttp_COL4)
	C_TEXT:C284(oContracttp_COL5; oContracttp_COL6; oContracttp_COL7; oContracttp_COL9; oContracttp_HED1; oContracttp_HED2; oContracttp_HED3; oContracttp_HED4; oContracttp_HED5; oContracttp_HED6; oContracttp_HED7)
	C_TEXT:C284(oContracttp_HED8; oContracttp_HED9; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SVS_t_CurrencyCode; SVS_t_LoansPriceGroup; SVS_t_PartsPriceGroup; vButtDisCNTR; vCompName; vStage; vTel)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_DocumentWriteType; $_t_oldMethodName; $_t_SubItemName; COM_t_TelephoneNumberFormat; CON_t_CurFurtherCode; CON_t_CurrencyCode; CON_t_CurrencyCodeOLD; CON_t_CurrencyName; CON_t_LoansPriceGroup; CON_t_P2Area)
	C_TEXT:C284(CON_t_PartsPriceGroup; CONT_t_LoansPriceGroup; CONT_t_LoansPriceGroupOLD; CONT_t_PartsPriceGroup; CONT_t_PartsPriceGroupOLD; DB_t_CallOnCloseorSave; oContracttp_COL8; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SVS_t_CurrencyCode; SVS_t_LoansPriceGroup)
	C_TEXT:C284(SVS_t_PartsPriceGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_InLPB")
If (SD_t_CallingCompanyCode#"") & ([CONTRACTS:17]Company_Code:1="")
	[CONTRACTS:17]Company_Code:1:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
If ([CONTRACTS:17]Contact_Code:2="") & (SD_t_CallingContactCode#"")
	[CONTRACTS:17]Contact_Code:2:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
End if 
RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
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
RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)

Contact_Details
If ([CONTRACTS:17]Contract_Code:3="")
	Contr_Code
End if 
RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
If ([CONTACTS:1]Entry_Date:17=!00-00-00!)  //Changed NG March 2000
	vPDateF:=<>DB_d_CurrentDate
Else 
	vPDateF:=[CONTACTS:1]Entry_Date:17
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[CONTRACTS:17])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "CONT_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "CONT_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")
CONT_l_FurtherFieldsMod:=0

//FURTHER FIELDS CANNOT BE PUT ON THE MENU
CONT_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!
Contract_Contexts
If (CONT_l_ViewTabsSelectedOLD>0)
	CONT_l_ViewTabsSelectedOLD:=0
	
End if 
If (CONT_at_ViewTabsLabels=0)
	CONT_at_ViewTabsLabels:=1
	CONT_l_ViewTabsSelectedOLD:=0
End if 

If (vOR=0)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
	[CONTRACTS:17]Contract_Cost:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)); 2; 2)
End if 
Contracts_inLPß

CON_LoadContacts  //NG April 2004
$_l_TypeOpenEndedStatus:=0
If (BLOB size:C605([CONTRACTS:17]xContractRules:13)>0)
	SVS_ContractLoadRules
	If ([CONTRACTS:17]Contract_Type_Code:4#"")
		If ([CONTRACT_TYPES:19]Contract_Type_Code:1#[CONTRACTS:17]Contract_Type_Code:4)
			QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=[CONTRACTS:17]Contract_Type_Code:4)
		End if 
		$_l_TypeOpenEndedStatus:=[CONTRACT_TYPES:19]xOpenEndedStatus:12
	Else 
		$_l_TypeOpenEndedStatus:=0
	End if 
	
Else 
	//Nothing so copy the values from the contract type
	If ([CONTRACTS:17]Contract_Type_Code:4#"")
		If ([CONTRACT_TYPES:19]Contract_Type_Code:1#[CONTRACTS:17]Contract_Type_Code:4)
			QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=[CONTRACTS:17]Contract_Type_Code:4)
		End if 
		$_l_TypeOpenEndedStatus:=[CONTRACT_TYPES:19]xOpenEndedStatus:12
		SVS_ContractTypeLoadRules
		VARIABLE TO BLOB:C532(SVS_bo_Chargable; [CONTRACT_TYPES:19]xContractTypeRules:9; *)  //Work is charg-able
		VARIABLE TO BLOB:C532(SVS_t_CurrencyCode; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimeBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimePerUnit; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_TimeMinimum; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_TimeOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_Sheduled; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_PartsBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_t_PartsPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_bo_LoansBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_t_LoansPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_LoansPricePeriod; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_ChargePeriodType; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_l_ChargeLoanOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		VARIABLE TO BLOB:C532(SVS_at_ChargableActions; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
		SVS_ContractLoadRules
	Else 
		SVS_ContractLoadRules
		
	End if 
	
End if 
If ([CONTRACTS:17]Contract_Type_Code:4#"")
	If ([CONTRACTS:17]X_Contract_Billing_Product:11="")
		QUERY:C277([Contract_Type_Products:191]; [Contract_Type_Products:191]xContractTypeCode:1=[CONTRACTS:17]Contract_Type_Code:4; *)
		QUERY:C277([Contract_Type_Products:191];  & ; [Contract_Type_Products:191]xDefaultProduct:3=True:C214)
		[CONTRACTS:17]X_Contract_Billing_Product:11:=[Contract_Type_Products:191]xProductCodes:2
	End if 
End if 
CONT_BILLINGPRODUCT:=""
If ([CONTRACTS:17]X_Contract_Billing_Product:11#"")
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[CONTRACTS:17]X_Contract_Billing_Product:11)
	CONT_BILLINGPRODUCT:=[PRODUCTS:9]Product_Name:2
End if 
CONT_l_OpenEndedStatus:=0
If ($_l_TypeOpenEndedStatus>0)
	If ([CONTRACTS:17]End_Date:6=!00-00-00!) | ([CONTRACTS:17]End_Date:6>=Current date:C33(*))
		OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; True:C214)
		If ($_l_TypeOpenEndedStatus=2)
			[CONTRACTS:17]xOpenEndedStatus:16:=1  // is open ended
			OBJECT SET ENABLED:C1123(CON_l_OpenEndedStatus; False:C215)
		Else 
			//it is what it is..
			//[CONTRACTS]xOpenEndedStatus:=0  ` is NOT open ended
		End if 
	Else 
		//Contract has an end date and is already finished
		[CONTRACTS:17]xOpenEndedStatus:16:=0
		OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; False:C215)
		
	End if 
Else 
	//it never is
	[CONTRACTS:17]xOpenEndedStatus:16:=0
	OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; False:C215)
	
End if 

CON_l_OpenEndedStatus:=[CONTRACTS:17]xOpenEndedStatus:16
If (CON_l_OpenEndedStatus=1)
	[CONTRACTS:17]End_Date:6:=!00-00-00!
	OBJECT SET VISIBLE:C603(*; "oEndDate@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "oEndDate@"; True:C214)
End if 

If ([CONTRACTS:17]End_Date:6#!00-00-00!)
	OBJECT SET ENTERABLE:C238([CONTRACTS:17]End_Date:6; False:C215)
End if 
CON_l_Chargable:=0
If (CON_bo_Chargable)
	CON_l_Chargable:=1
	OBJECT SET ENTERABLE:C238(CON_t_CurrencyCode; True:C214)
	OBJECT SET ENABLED:C1123(CON_iRB_TimeBilling; True:C214)
	OBJECT SET ENABLED:C1123(CON_iRB_ChargoutBilling; True:C214)
	If (CON_t_CurrencyCode#"")
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CON_t_CurrencyCode)
		If (Records in selection:C76([CURRENCIES:71])=1)
			CON_t_CurrencyName:=[CURRENCIES:71]Currency_Name:2
			
		End if 
		UNLOAD RECORD:C212([CURRENCIES:71])
		OBJECT SET VISIBLE:C603(CON_t_CurrencyName; True:C214)
	End if 
	Case of 
		: (CON_l_TimeBilling=1)
			CON_iRB_TimeBilling:=1
			OBJECT SET ENTERABLE:C238(CON_l_TimePerUnit; True:C214)
			OBJECT SET ENTERABLE:C238(CON_l_TimeMinimum; True:C214)
			OBJECT SET ENABLED:C1123(CON_bo_TimeOption; True:C214)
			CON_iRB_ChargoutBilling:=0
		Else 
			CON_iRB_TimeBilling:=0
			OBJECT SET ENTERABLE:C238(CON_l_TimePerUnit; False:C215)
			OBJECT SET ENTERABLE:C238(CON_l_TimeMinimum; False:C215)
			
			CON_iRB_ChargoutBilling:=1
	End case 
	
	
Else 
	OBJECT SET ENTERABLE:C238(CON_l_TimePerUnit; False:C215)
	OBJECT SET ENTERABLE:C238(CON_l_TimeMinimum; False:C215)
	OBJECT SET ENABLED:C1123(CON_bo_TimeOption; False:C215)
	OBJECT SET ENTERABLE:C238(CON_t_CurrencyCode; False:C215)
	OBJECT SET ENABLED:C1123(CON_bo_TimeOption; False:C215)
	OBJECT SET ENABLED:C1123(CON_iRB_TimeBilling; False:C215)
	OBJECT SET ENABLED:C1123(CON_iRB_ChargoutBilling; False:C215)
	OBJECT SET ENABLED:C1123(CON_l_RestrictCharging; False:C215)
	
End if 
If (CON_bo_PartsBilling)
	OBJECT SET ENTERABLE:C238(CONT_t_PartsPriceGroup; True:C214)
	QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_PartsPriceGroup)
	CON_t_PartsPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
Else 
	OBJECT SET ENTERABLE:C238(CONT_t_PartsPriceGroup; False:C215)
	CON_t_PartsPriceGroup:=""
	OBJECT SET VISIBLE:C603(CON_t_PartsPriceGroup; False:C215)
	
End if 
If (CON_bo_LoansBilling)
	OBJECT SET ENTERABLE:C238(CONT_t_LoansPriceGroup; True:C214)
	QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_LoansPriceGroup)
	CON_t_LoansPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
	OBJECT SET ENTERABLE:C238(CON_l_LoansPricePeriod; True:C214)
	OBJECT SET VISIBLE:C603(CON_t_LoansPriceGroup; True:C214)
	OBJECT SET VISIBLE:C603(CON_at_ChargePeriods; True:C214)
	CON_at_ChargePeriods:=CON_l_ChargePeriodType
	Case of 
		: (CON_l_ChargeLoanOption=2)
			CON2_iRB_ChargeProRata:=1
			CON2_iRB_ChargePartPeriod:=0
			CON2_iRB_ChargePartPeriodnil:=0
		: (CON_l_ChargeLoanOption=1)
			CON2_iRB_ChargeProRata:=0
			CON2_iRB_ChargePartPeriod:=1
			CON2_iRB_ChargePartPeriodnil:=0
		: (CON_l_ChargeLoanOption=0)
			CON2_iRB_ChargeProRata:=0
			CON2_iRB_ChargePartPeriod:=0
			CON2_iRB_ChargePartPeriodnil:=1
	End case 
	//ENABLE BUTTON(CON_iRB_ChargeProRata)
	//ENABLE BUTTON(CON2_iRB_ChargePartPeriod)
	//ENABLE BUTTON(CON2_iRB_ChargePartPeriodnil)
Else 
	OBJECT SET ENTERABLE:C238(CONT_t_LoansPriceGroup; False:C215)
	CON_t_LoansPriceGroup:=""
	OBJECT SET ENTERABLE:C238(CON_l_LoansPricePeriod; False:C215)
	OBJECT SET VISIBLE:C603(CON_t_LoansPriceGroup; False:C215)
	OBJECT SET VISIBLE:C603(CON_at_ChargePeriods; False:C215)
	CON_at_ChargePeriods:=0
	//DISABLE BUTTON(CON2_iRB_ChargeProRata)
	//DISABLE BUTTON(CON2_iRB_ChargePartPeriod)
	//DISABLE BUTTON(CON2_iRB_ChargePartPeriodnil)
	
End if 
// Set up the list box area for  showing the charge-able options
ALL RECORDS:C47([ACTIONS:13])
//Do all actions belong here
//Yep
ARRAY TEXT:C222(CON_at_ActionsCodes; 0)
ARRAY TEXT:C222(CON_at_ActionName; 0)
ARRAY BOOLEAN:C223(CON_abo_IsChargable; 0)

SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; CON_at_ActionsCodes; [ACTIONS:13]Action_Name:2; CON_at_ActionName)
ARRAY BOOLEAN:C223(CON_abo_IsChargable; Size of array:C274(CON_at_ActionsCodes))

//Now check the items in
If (Size of array:C274(CON_at_ChargableActions)>0)
	For ($_l_Index; 1; Size of array:C274(CON_at_ChargableActions))
		$_l_ChargeableActionRow:=Find in array:C230(CON_at_ActionsCodes; CON_at_ChargableActions{$_l_Index})
		If ($_l_ChargeableActionRow>0)
			CON_abo_IsChargable{$_l_ChargeableActionRow}:=True:C214
		End if 
	End for 
Else 
	//all charge-able
	For ($_l_Index; 1; Size of array:C274(CON_abo_IsChargable))
		CON_abo_IsChargable{$_l_Index}:=True:C214
	End for 
	
	
	
End if 
//```

LB_SetupListbox(->CON_lb_ChargeActions; "oContracttp"; "CONT_L"; 1; ->CON_abo_IsChargable; ->CON_at_ActionsCodes; ->CON_at_ActionName)
LB_SetColumnHeaders(->CON_lb_ChargeActions; "CONT_L"; 1; "Charge"; "Action Code"; "Action Name")

LB_SetColumnWidths(->CON_lb_ChargeActions; "oContracttp"; 1; 35; 90; 90)


LB_SETENTRYOPTIONS  // doesn't actually do anything ...

LB_StyleSettings(->CON_lb_ChargeActions; "blue"; 9; "oContracttp"; ->[SERVICE_CALLS:20])
LB_SetScroll(->CON_lb_ChargeActions; -3; -2)
LB_SetEnterable(->CON_lb_ChargeActions; False:C215; 0)
LB_SetEnterable(->CON_lb_ChargeActions; True:C214; 1)
LB_SetSortOptions(->CON_lb_ChargeActions; 0)


If (DB_UserHas4DWriteAccess)
	$_t_DocumentWriteType:=Letters Write(True:C214)
	If ($_t_DocumentWriteType="WS") | ($_t_DocumentWriteType="W") & ($_bo_4DWriteInstalled)
		//The document created here is a template..
		//on a contract the document will be a copy of that template
		OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; False:C215)
		//OBJECT SET VISIBLE(CONT_4DWriteText; True)
		OBJECT SET VISIBLE:C603(*; "oCONT4DWriteText"; True:C214)
		If ([CONTRACTS:17]Contract_DocRef:14#"")
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[CONTRACT_TYPES:19]Contract_DOCRef:10)
			Cont_obj_WPText:=WP New:C1317([DOCUMENTS:7]DocumentWPPro:35)
			DOc_SetWPProModiable(Cont_obj_WPText; 2; True:C214
			//WR PICTURE TO AREA(CONT_4DWriteText; [DOCUMENTS]Write_)
			DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
		Else 
			//No document currently exists
			If ([CONTRACT_TYPES:19]Contract_Text:6#"")  // put this text into and create the document
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Class:14:=4D Write Letter
				[DOCUMENTS:7]Document_Status:15:=1
				[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACTS:17])
				[DOCUMENTS:7]Heading:2:="Contract "+[CONTRACTS:17]Contract_Code:3
				Set_DocumentCode(1)
				$_l_Offscreen4DWArea:=WR New offscreen area:P12000:47/WR New offscreen area:P12000:47
				WR INSERT TEXT:P12000:19($_l_Offscreen4DWArea; [CONTRACT_TYPES:19]Contract_Text:6)
				[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139($_l_Offscreen4DWArea; 1; 1)
				WR DELETE OFFSCREEN AREA:P12000:38($_l_Offscreen4DWArea)
				DB_SaveRecord(->[DOCUMENTS:7])
				WR PICTURE TO AREA:P12000:141(CONT_4DWriteText; [DOCUMENTS:7]Write_:5)
				DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
			Else 
				//jUst set the 4D write area to editable
				DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
			End if 
		End if 
		
	Else 
		OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; True:C214)
		OBJECT SET VISIBLE:C603(CONT_4DWriteText; False:C215)
	End if 
Else 
	OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; True:C214)
	OBJECT SET VISIBLE:C603(CONT_4DWriteText; False:C215)
End if 

CON_t_CurrencyCodeOLD:=CON_t_CurrencyCode  // to track user changing
CON_l_TimePerUnitOLD:=CON_l_TimePerUnit
CON_l_TimeMinimumOLD:=CON_l_TimeMinimum
CONT_t_PartsPriceGroupOLD:=CONT_t_PartsPriceGroup
CONT_t_LoansPriceGroupOLD:=CONT_t_LoansPriceGroup
CON_l_LoansPricePeriodOLD:=CON_l_LoansPricePeriod

//`````
QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=[CONTRACTS:17]Contract_Code:3)
//NGApril 2004
ARRAY TEXT:C222(CON_at_FurtherCodes; 0)
ARRAY BOOLEAN:C223(CON_abo_FurtherMod; 0)
ARRAY TEXT:C222(CON_at_DelFurtherCode; 0)
SELECTION TO ARRAY:C260([CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2; CON_at_FurtherCodes)
ARRAY BOOLEAN:C223(CON_abo_FurtherMod; Size of array:C274(CON_at_FurtherCodes))
CON_l_CurrentFurtherStatus:=0
OBJECT SET VISIBLE:C603(bCON_l_Furthmodify; True:C214)
OBJECT SET TITLE:C194(bCON_l_Furthmodify; "Add")
OBJECT SET VISIBLE:C603(bCON_l_FurthDelete; False:C215)
CON_t_CurFurtherCode:=""
OBJECT SET VISIBLE:C603(CON_t_CurFurtherCode; False:C215)
CON_t_P2Area:="Contacts"

vTot:=0
vStage:=""
vButtDisCNTR:="I    O   SS R AD "

If (Size of array:C274(SVS_aptr_ListboxSetup)>=9)
	$_ptr_ArrayReferences:=SVS_aptr_ListboxSetup{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		If (FORM Get current page:C276=1)
			If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				
				Input_Buttons(->[CONTRACTS:17]; ->vButtDisCNTR; "Contract")
			Else 
				Input_Buttons(->[CONTRACTS:17]; ->vButtDisCNTR; "Contract"; $_t_SubItemName)
			End if 
		Else 
			Input_Buttons(->[CONTRACTS:17]; ->vButtDisCNTR; "Contract")
		End if 
	End if 
Else 
	Input_Buttons(->[CONTRACTS:17]; ->vButtDisCNTR; "Contract")
End if 
DB_t_CallOnCloseorSave:="P:Contracts_InLPA"
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35; >)
FORM GOTO PAGE:C247(SVS_at_ContractsTabs)

Macro_AccType("Load "+String:C10(Table:C252(->[CONTRACTS:17])))
ERR_MethodTrackerReturn("Contracts_InLPB"; $_t_oldMethodName)
