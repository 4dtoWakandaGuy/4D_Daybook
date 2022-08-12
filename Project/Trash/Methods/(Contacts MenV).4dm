//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2010 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_DiaryRecordProcess; $_l_SelectedMenu; SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_REAL:C285($1)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>SYS_t_4DWriteType; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts MenV")
If (Modified record:C314([COMPANIES:2]))
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
End if 
If (Modified record:C314([CONTACTS:1]))
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
End if 
Defaults_Clear
<>ContCode:=[CONTACTS:1]Contact_Code:2
<>CompCode:=[COMPANIES:2]Company_Code:1
If (Count parameters:C259=0)
	$_l_SelectedMenu:=Sel_LPmi("Contacts MenV")
Else 
	$_l_SelectedMenu:=$1
End if 
If ($_l_SelectedMenu<2)
	<>DB_bo_AutoOut:=False:C215
Else 
	<>DB_bo_AutoOut:=True:C214
End if 
If (($_l_SelectedMenu#8) & ($_l_SelectedMenu#9))
	<>AutoFind:=True:C214
	<>AutoFile:="Contacts"
	<>AutoProc:=vProc
End if 
SD3_t_DiaryRelatedRecord:=[CONTACTS:1]Contact_Code:2
SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
Case of 
	: ($_l_SelectedMenu=1)
		//
		//DBI_MenuDisplayRecords ("Companies";Module_Companies ;"";->[COMPANIES]Company Code;[CONTACTS]Company Code)
		
		//DBI_DisplayRecord (-Current process;Table(->[COMPANIES]);"";[CONTACTS]Company_Code)
		$_l_DiaryRecordProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Company"; -Current process:C322; Table:C252(->[COMPANIES:2]); ""; [CONTACTS:1]Company_Code:1)
		
	: ($_l_SelectedMenu=2)
		SD3_l_CallActionNum:=1
		ZDiary_Mod
		
		SD3_l_CallActionNum:=0
	: ($_l_SelectedMenu=3)
		//   If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4DWrite "Silver"
		If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver" 24/04/02 pb
			ZDiary_ModSW
		Else 
			ZDiary_ModL
		End if 
	: ($_l_SelectedMenu=4)
		DBI_MenuDisplayRecords("OrdersEnquiries"; Module_Companies; ""; ->[ORDERS:24]Contact_Code:2; [CONTACTS:1]Contact_Code:2)
		
		//ZOrders_View
	: ($_l_SelectedMenu=5)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDERS:24]))); Module_SalesOrders; ""; ->[ORDERS:24]Contact_Code:2; [CONTACTS:1]Contact_Code:2)
		
		//
	: ($_l_SelectedMenu=6)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); Module_ServiceCentre; ""; ->[SERVICE_CALLS:20]Contact_Code:2; [CONTACTS:1]Contact_Code:2)
	: ($_l_SelectedMenu=7)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[JOBS:26]))); Module_JobCosting; ""; ->[JOBS:26]Contact_Code:4; [CONTACTS:1]Contact_Code:2)
	: ($_l_SelectedMenu=8)
		
		FurthFld_Func2(->[CONTACTS:1])
	: ($_l_SelectedMenu=9)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); Module_PurchaseOrders; ""; ->[PURCHASE_ORDERS:57]Contact_Code:5; [CONTACTS:1]Contact_Code:2)
	: ($_l_SelectedMenu=10)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[INVOICES:39]))); Module_SalesLedger; ""; ->[INVOICES:39]Contact_Code:3; [CONTACTS:1]Contact_Code:2)
	: ($_l_SelectedMenu=11)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CONTRACTS:17]))); Module_ServiceCentre; ""; ->[CONTRACTS:17]Contact_Code:2; [CONTACTS:1]Contact_Code:2)
End case 
ERR_MethodTrackerReturn("Contacts MenV"; $_t_oldMethodName)
