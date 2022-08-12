//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_lb_ALLOCATIONS;0)
	//ARRAY DATE(PINV_ad_aDate;0)
	//ARRAY LONGINT(PINV_al_AllocationID;0)
	//ARRAY REAL(PINV_ar_ABSAllocationAmount;0)
	//ARRAY REAL(PINV_ar_DisplayAllocationAmount;0)
	//ARRAY TEXT(INV_at_DisplayAllocSource;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PINV_at_aCredit;0)
	//ARRAY TEXT(PINV_at_aDeposit;0)
	//ARRAY TEXT(PINV_at_aInvoice;0)
	//ARRAY TEXT(PINV_at_aReceipt;0)
	C_BOOLEAN:C305(<>PersAnOver; <>SYS_bo_DefaultEntry; $_bo_ShowAllocations; $_bo_ShowSubAreas; $1; $2; PUR_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_FurtherFieldsExist; INV_l_BUT1; INV_l_But2; INV_l_BUT3; INV_l_BUT4; INV_l_BUT5; INV_l_BUT6; INV_l_BUT7; INV_l_BUT8; INV_l_BUT9; PI_l_selectedViewTabsLabelsOLD)
	C_LONGINT:C283(PINV_l_Once; PUR_l_FurtherFieldsMod; vAdd; vCalls; vContr; vPS)
	C_TEXT:C284(<>CompCode; <>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; oAllocations_COL1; oAllocations_COL2; oAllocations_COL3; oAllocations_COL4; oAllocations_COL5; oAllocations_COL6; oAllocations_COL7)
	C_TEXT:C284(oAllocations_COL8; oAllocations_COL9; oAllocations_HED1; oAllocations_HED2; oAllocations_HED3; oAllocations_HED4; oAllocations_HED5; oAllocations_HED6; oAllocations_HED7; oAllocations_HED8; oAllocations_HED9)
	C_TEXT:C284(SD_t_CallingCompanyCode; vButtDisPI; vCompName; vPeriod; vStage; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPB")
If (SD_t_CallingCompanyCode#"") & ([PURCHASE_INVOICES:37]Company_Code:2="")
	[PURCHASE_INVOICES:37]Company_Code:2:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[PURCHASE_INVOICES:37])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "PI_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "PI_FFSelection")
End if 
If (Count parameters:C259>=1)
	$_bo_ShowAllocations:=$1
Else 
	$_bo_ShowAllocations:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_ShowSubAreas:=$2
Else 
	$_bo_ShowSubAreas:=True:C214
End if 
CLEAR SET:C117("FUR_FFSelection")
PUR_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
PUR_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
If ($_bo_ShowSubAreas)
	Purch_Contexts
	If (PI_l_selectedViewTabsLabelsOLD>0)
		PI_l_selectedViewTabsLabelsOLD:=0
	End if 
	If (PI_at_ViewTabsLabels=0)
		PI_at_ViewTabsLabels:=1
		PI_l_selectedViewTabsLabelsOLD:=0
	End if 
End if 
If ((<>CompCode#"") & ([PURCHASE_INVOICES:37]Company_Code:2="") & (<>SYS_bo_DefaultEntry))
	[PURCHASE_INVOICES:37]Company_Code:2:=<>CompCode
	RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
	If ([COMPANIES:2]Default_Layer:51#"")
		[PURCHASE_INVOICES:37]Layer_Code:28:=[COMPANIES:2]Default_Layer:51
	End if 
	If ([COMPANIES:2]Default_Currency:59#"")
		[PURCHASE_INVOICES:37]Currency_Code:23:=[COMPANIES:2]Default_Currency:59
	End if 
Else 
	RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
End if 
vCompName:=[COMPANIES:2]Company_Name:2
RELATE ONE:C42([PURCHASE_INVOICES:37]Period_Code:3)
vPeriod:=[PERIODS:33]Period_Name:2
If (([PURCHASE_INVOICES:37]Terms:31="") & ([PURCHASE_INVOICES:37]State:24<1) & ([PURCHASE_INVOICES:37]State:24>-2))
	If ([COMPANIES:2]PL_Terms:53#"")
		[PURCHASE_INVOICES:37]Terms:31:=[COMPANIES:2]PL_Terms:53
	End if 
	Purchases_DueDt
End if 
If ([PURCHASE_INVOICES:37]Invoice_Date:5>!00-00-00!)
	Purchases_LPAge
Else 
	vCalls:=0
	vContr:=0
	Layer_Fill(->[PURCHASE_INVOICES:37]Layer_Code:28)
	If (([COMPANIES:2]TAX_Prefix:38#"") & ([COMPANIES:2]TAX_Prefix:38#DB_GetOrganisationVATPrefix))
		[PURCHASE_INVOICES:37]UK_EC:18:="E"
	Else 
		[PURCHASE_INVOICES:37]UK_EC:18:="U"
	End if 
	If ([PURCHASE_INVOICES:37]Currency_Code:23="")
		[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
	End if 
	If ((DB_GetLedgerisCashVAT) & (DB_GetLedgerCashvatACC#"") & ([PURCHASE_INVOICES:37]State:24#-2))
		[PURCHASE_INVOICES:37]Cash_TAX:33:=True:C214
	End if 
End if 
If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
	If (([PURCHASE_INVOICES:37]Analysis_Code:15="") & (<>PersAnOver))
		[PURCHASE_INVOICES:37]Analysis_Code:15:=<>Per_t_CurrentDefaultAnalCode
	End if 
End if 
vPS:=1
vTitle2:=Term_VATWT("Amount/VAT")
If (DB_GetModuleSettingByNUM(Module_MultiCurrency)<2)
	//OBJECT SET VISIBLE([PURCHASES]Currency Code;False)
	
	OBJECT SET ENTERABLE:C238([PURCHASE_INVOICES:37]Currency_Code:23; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([PURCHASE_INVOICES:37]Layer_Code:28; False:C215)
End if 
If (vAdd=0)
	DB_MenuAction("Functions"; "Stock Levels"; 3; "")
	DB_MenuAction("Functions"; "Copy a Purchase Order"; 3; "")
	DB_MenuAction("Functions"; "Copy a Stock Movement  "; 3; "")
	DB_MenuAction("Functions"; "Opening Balance "; 3; "")
	
End if 
Purchases_LPSt
RELATE ONE:C42([PURCHASE_INVOICES:37]Credit_Stage:34)
vStage:=[CREDIT_STAGES:54]Stage_Name:2
If ([PURCHASE_INVOICES:37]Posted_Date:12#!00-00-00!)
	vButtDisPI:="I  PMO  FSSSRCAD "
Else 
	vButtDisPI:="I       FSSSRCAD "
End if 
If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
Else 
	REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; 0)
End if 
[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2)
[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
	QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
Else 
	REDUCE SELECTION:C351([PURCHASE_INVOICE_ALLOCATIONS:159]; 0)
End if 
If ($_bo_ShowAllocations)
	ARRAY LONGINT:C221(PINV_al_AllocationID; 0)
	
	ARRAY REAL:C219(PINV_ar_DisplayAllocationAmount; 0)
	ARRAY REAL:C219(PINV_ar_ABSAllocationAmount; 0)
	ARRAY TEXT:C222(PINV_at_aReceipt; 0)
	ARRAY TEXT:C222(PINV_at_aDeposit; 0)
	ARRAY TEXT:C222(PINV_at_aCredit; 0)
	ARRAY TEXT:C222(PINV_at_aReceipt; 0)
	ARRAY TEXT:C222(PINV_at_aInvoice; 0)
	ARRAY DATE:C224(PINV_ad_aDate; 0)
	ARRAY TEXT:C222(INV_at_DisplayAllocSource; 0)
	SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ALLOCATIONS:159]ID:5; PINV_al_AllocationID; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; INV_at_DisplayAllocSource; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4; PINV_at_aReceipt; [PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2; PINV_ar_DisplayAllocationAmount; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3; PINV_ad_aDate)
	LB_SetupListbox(->INV_lb_ALLOCATIONS; "oAllocations"; "INV_L"; 1; ->PINV_at_aReceipt; ->PINV_al_AllocationID; ->INV_at_DisplayAllocSource; ->PINV_ar_DisplayAllocationAmount; ->PINV_ad_aDate)
	
	LB_SetColumnHeaders(->INV_lb_ALLOCATIONS; "INV_L"; 1; "ID"; "Purchase Code"; "Purchase Invoice"; "Amount"; "Date")
	LB_SetColumnWidths(->INV_lb_ALLOCATIONS; "oAllocations"; 1; 0; 80; 80; 65; 65)
	LB_SetScroll(->INV_lb_ALLOCATIONS; -3; -2)
	LB_SetFormat(->INV_lb_ALLOCATIONS; 2; "|accounts"; 4)
	LB_SetFormat(->INV_lb_ALLOCATIONS; 2; ""; 5; 0; 2)
	LB_SetFormat(->INV_lb_ALLOCATIONS; 1; ""; 5; 0; 2)
	LB_StyleSettings(->INV_lb_ALLOCATIONS; "Black"; 9; "oAllocations"; ->[PURCHASE_INVOICES:37])
End if 
Input_Buttons(->[PURCHASE_INVOICES:37]; ->vButtDisPI; "Purchase Invoice"; "Purchase Invoice Item")


Macro_AccType("Load "+String:C10(Table:C252(->[PURCHASE_INVOICES:37])))
ERR_MethodTrackerReturn("Purch_InLPB"; $_t_oldMethodName)
