//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderNumbers; 0)
	ARRAY TEXT:C222($_at_ServiceCallCode; 0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_SelectedMenu)
	C_REAL:C285($1)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_MenV")
If (Count parameters:C259=0)
	$_l_SelectedMenu:=Sel_LPmi("Contacts_MenV")
Else 
	$_l_SelectedMenu:=$1
End if 
<>AutoFind:=True:C214
<>AutoFile:="Contracts"
<>AutoProc:=Current process:C322
Defaults_Clear
If (FORM Get current page:C276=1)
	<>ContCode:=[CONTRACTS:17]Contact_Code:2
	<>CompCode:=[CONTRACTS:17]Company_Code:1
Else 
	<>ContCode:=[CONTRACTS:17]Supplier_Contact:10
	<>CompCode:=[CONTRACTS:17]Supplier_Company:9
End if 
<>DB_bo_AutoOut:=False:C215
$_l_SelectedMenu:=Sel_LPmi("Contracts_MenV")
Case of 
	: ($_l_SelectedMenu=1)
		DBI_DisplayRecord(0; Table:C252(->[COMPANIES:2]); ""; [CONTRACTS:17]Company_Code:1)
		//DBI_MenuDisplayRecords ("Companies";Module_ServiceCentre ;"";->[COMPANIES]Company Code;[CONTRACTS]Company Code)
		
	: ($_l_SelectedMenu=2)
		DBI_DisplayRecord(0; Table:C252(->[CONTACTS:1]); ""; [CONTRACTS:17]Contact_Code:2)
		//DBI_MenuDisplayRecords ("Contacts";Module_ServiceCentre ;"";->[CONTACTS]Contact Code;[CONTRACTS]Contact Code)
	: ($_l_SelectedMenu=3)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDER_ITEMS:25]))); Module_ServiceCentre; ""; ->[ORDER_ITEMS:25]Contract_Code:29; [CONTRACTS:17]Contract_Code:3)
	: ($_l_SelectedMenu=4)  //fruther fields
		//DBI_MenuDisplayRecords ("Order items";Module_ServiceCentre ;"";->[ORDER ITEMS]Contract Code;[CONTRACTS]Contract Code)
		
		FurthFld_Func2(->[CONTRACTS:17])
	: ($_l_SelectedMenu=5)  //orders
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		ARRAY TEXT:C222($_at_ServiceCallCode; 0)
		SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Call_Code:4; $_at_ServiceCallCode)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ServiceCallCODE:61; $_at_ServiceCallCode)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
		COPY NAMED SELECTION:C331([ORDERS:24]; "ContractOrders")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDERS:24]))); Module_ServiceCentre; "ContractOrders")
		
		
		
	: ($_l_SelectedMenu=6)  //purchase eorders
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		ARRAY TEXT:C222($_at_ServiceCallCode; 0)
		SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Call_Code:4; $_at_ServiceCallCode)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ServiceCallCODE:61; $_at_ServiceCallCode)
		ARRAY TEXT:C222($_at_PurchaseOrderNumbers; 0)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PurchaseOrderNumbers)
		QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNumbers)
		COPY NAMED SELECTION:C331([PURCHASE_ORDERS:57]; "ContractPOs")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); Module_ServiceCentre; "ContractPOs")
		
	: ($_l_SelectedMenu=7)  // service calls
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); Module_ServiceCentre; ""; ->[SERVICE_CALLS:20]Contract_Code:3; [CONTRACTS:17]Contract_Code:3)
	: ($_l_SelectedMenu=8)  // Diary
		//`DBI_MenuDisplayRecords ("Service Calls";Module_ServiceCentre ;"";->[SERVICE CALLS]Contract Code;[CONTRACTS]Contract Code)
		
	: ($_l_SelectedMenu=9)  // Documents
End case 
ERR_MethodTrackerReturn("Contracts_MenV"; $_t_oldMethodName)