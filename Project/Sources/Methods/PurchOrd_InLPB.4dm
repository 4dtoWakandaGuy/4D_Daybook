//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: PurchOrd_InLPB
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	//ARRAY TEXT(STK_at_DeliveryLocCodes;0)
	//ARRAY TEXT(STK_at_DeliveryLocNames;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>PersAnOver; PO_bo_FurtherFieldsLoaded)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_DeliveryLocationRow; $_l_FurtherFieldsExist; $_l_Process; baddressModify; PO_l_FurtherFieldsMod; PO_l_SelectedTabsLabelsOLD; STK_l_ShowSupplierProducts)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_oldMethodName; $_t_ProcessName; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; PO_t_AddressLine1; PO_t_AddressLine2; PO_t_Country; PO_t_County)
	C_TEXT:C284(PO_t_DeliveryAddress; PO_t_PostalCode; PO_t_Town; SD_t_CallingCompanyCode; SD_t_CallingContactCode; STK_t_DeliveryLocationNAME; vButtDisInv; vCompNameA; vCompNameC; vContNameA; vContNameC)
	C_TEXT:C284(vDetails; vExtnA; vExtnC; vProbDesc; vTelA; vTelC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_InLPB")
//PurchOrd_InLPB
If (SD_t_CallingCompanyCode#"") & ([PURCHASE_ORDERS:57]Company_Code:1="")
	[PURCHASE_ORDERS:57]Company_Code:1:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
If ([PURCHASE_ORDERS:57]Contact_Code:5="") & (SD_t_CallingContactCode#"")
	[PURCHASE_ORDERS:57]Contact_Code:5:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
End if 
If ([PURCHASE_ORDERS:57]Company_Code:1#"")
	RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
	If ([PURCHASE_ORDERS:57]Finance_Method:11="")
		If ([PURCHASE_ORDERS:57]Finance_Method:11#"")
			//[PURCHASE ORDERS]Finance Method:=[COMPANIES]PL Terms
		End if 
	End if 
	vCompNameA:=[COMPANIES:2]Company_Name:2
	vTelA:=[COMPANIES:2]Telephone:9
Else 
	REDUCE SELECTION:C351([COMPANIES:2]; 0)
	vCompNameA:=""
	vTelA:="'"
End if 
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTelA; COM_t_TelephoneNumberFormat)
End if 
If ([PURCHASE_ORDERS:57]Contact_Code:5#"")
	RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
	vContNameA:=CON_BuildContactNameandJobTitle
	vExtnA:=[CONTACTS:1]Extn:9
Else 
	vContNameA:=""
	vExtnA:=""
End if 
If ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
	RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
	vCompNameC:=[COMPANIES:2]Company_Name:2
	vTelC:=[COMPANIES:2]Telephone:9
Else 
	vCompNameC:=""
	vTelC:=""
End if 
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTelC; COM_t_TelephoneNumberFormat)
End if 
If ([PURCHASE_ORDERS:57]Deliver_to_Contact:7#"")
	RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Contact:7)
	vContNameC:=CON_BuildContactNameandJobTitle
	vExtnC:=[CONTACTS:1]Extn:9
Else 
	vContNameC:=""
	vExtnC:=""
End if 
If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2="")
	PurchOrd_No
	[PURCHASE_ORDERS:57]Purchase_Order_Date:3:=<>DB_d_CurrentDate
	[PURCHASE_ORDERS:57]State:14:=-1
	PUR_SetFileState
	If (([PURCHASE_ORDERS:57]Analysis_Code:15="") & (<>PersAnOver))
		[PURCHASE_ORDERS:57]Analysis_Code:15:=<>Per_t_CurrentDefaultAnalCode
	End if 
	If ([PURCHASE_ORDERS:57]Currency_Code:16="")
		[PURCHASE_ORDERS:57]Currency_Code:16:=<>SYS_t_BaseCurrency
	End if 
	If ([PURCHASE_ORDERS:57]Layer_Code:17="")
		[PURCHASE_ORDERS:57]Layer_Code:17:=DB_GetLedgerActualLayer
	End if 
End if 
If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2="")
	PurchOrd_No
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[PURCHASE_ORDERS:57])
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "PO_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "PO_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")  //
PO_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
PO_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!
PO_Contexts
If (PO_l_SelectedTabsLabelsOLD>0)
	PO_l_SelectedTabsLabelsOLD:=0
End if 
If (PO_at_ViewTabsLabels=0)
	PO_at_ViewTabsLabels:=1
	PO_l_SelectedTabsLabelsOLD:=0
End if 
PO_LoadRelatedEvent
PO_t_DeliveryAddress:=""
OBJECT SET ENTERABLE:C238(PO_t_DeliveryAddress; False:C215)
OBJECT SET VISIBLE:C603(PO_t_DeliveryAddress; True:C214)
OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; True:C214)
OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
OBJECT SET VISIBLE:C603(baddressModify; True:C214)
PO_t_AddressLine1:=""
PO_t_AddressLine2:=""
PO_t_Town:=""
PO_t_County:=""
PO_t_PostalCode:=""
PO_t_Country:=""

Case of 
	: ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20>0)
		RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[PURCHASE_ORDERS:57]x_DeliveryAddressID:20)
		PO_t_DeliveryAddress:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
		RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
		RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
	: ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
		
		RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
		RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Contact:7)
		MCont_Add("L")
		PO_t_DeliveryAddress:=vDetails
		RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
		RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
	Else 
		PO_t_DeliveryAddress:=DB_GetOrganisationAddress
End case 

PurchOrd_State
ARRAY TEXT:C222(STK_at_DeliveryLocNames; 0)
ARRAY TEXT:C222(STK_at_DeliveryLocCodes; 0)
QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
If (Records in selection:C76([LOCATIONS:61])>0)
	$_l_Process:=New process:C317("STK_UpdateLocationsIDS"; 128000; "LocationIDsUpate")
	While (Process state:C330($_l_Process)>=0) & ($_l_Process>0)
		$_t_ProcessName:=Process_Name($_l_Process)
		
		If ($_t_ProcessName="LocationIDsUpate")
			DelayTicks(2)
			//MESSAGE("Updating Service calls states")
		Else 
			$_l_Process:=0
		End if 
	End while 
End if 
QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=0)  //These are the top level locations.
SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_DeliveryLocCodes; [LOCATIONS:61]Location_Name:2; STK_at_DeliveryLocNames)
SORT ARRAY:C229(STK_at_DeliveryLocNames; STK_at_DeliveryLocCodes)

STK_t_DeliveryLocationNAME:=""
If ([PURCHASE_ORDERS:57]State:14>=0)  //cant add things to a printed PO....we could  change that back(up till now10/07/08) you have been able to but it did not update the Stock movement.
	OBJECT SET VISIBLE:C603(STK_l_ShowSupplierProducts; False:C215)
	OBJECT SET VISIBLE:C603(STK_at_DeliveryLocNames; False:C215)
	OBJECT SET ENTERABLE:C238(STK_t_DeliveryLocationNAME; False:C215)
	If ([PURCHASE_ORDERS:57]X_DeliveryLocation:9#"")
		$_l_DeliveryLocationRow:=Find in array:C230(STK_at_DeliveryLocCodes; [PURCHASE_ORDERS:57]X_DeliveryLocation:9)
		If ($_l_DeliveryLocationRow>0)
			STK_t_DeliveryLocationNAME:=STK_at_DeliveryLocNames{$_l_DeliveryLocationRow}
		Else 
			[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=""
		End if 
	End if 
Else 
	STK_at_DeliveryLocNames:=0
	OBJECT SET VISIBLE:C603(STK_at_DeliveryLocNames; True:C214)
	OBJECT SET ENTERABLE:C238(STK_t_DeliveryLocationNAME; True:C214)
	If ([PURCHASE_ORDERS:57]X_DeliveryLocation:9#"")
		$_l_DeliveryLocationRow:=Find in array:C230(STK_at_DeliveryLocCodes; [PURCHASE_ORDERS:57]X_DeliveryLocation:9)
		If ($_l_DeliveryLocationRow>0)
			STK_t_DeliveryLocationNAME:=STK_at_DeliveryLocNames{$_l_DeliveryLocationRow}
		Else 
			[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=""
		End if 
	End if 
End if 

If ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"") | (<>DB_bo_NewStockActive=False:C215)
	OBJECT SET VISIBLE:C603(STK_at_DeliveryLocNames; False:C215)
End if 





vTot:=0
vProbDesc:=Term_VATWT("Amount/VAT")
If ([PURCHASE_ORDERS:57]State:14=-1)
	//vButtDisInv:="I       FSSSRCAD "
	vButtDisInv:="I    O  FSSSRCAD "
Else 
	vButtDisInv:="I  PMO  FSSSRCAD "
End if 
//vButtDisInv:="I    O  FSSSRCAD "
Input_Buttons(->[PURCHASE_ORDERS:57]; ->vButtDisInv; "Purchase Order"; "Purchase Order  Item")
DB_t_CallOnCloseorSave:="P:PurchOrd_InLPA"
Macro_AccType("Load "+String:C10(Table:C252(->[PURCHASE_ORDERS:57])))
ERR_MethodTrackerReturn("PurchOrd_InLPB"; $_t_oldMethodName)
