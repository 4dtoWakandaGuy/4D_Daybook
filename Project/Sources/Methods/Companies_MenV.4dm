//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; <>SD_l_SelectedMenuNumber; <>SD3_l_DiaryProcess; $_l_SelectedMenu; SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_REAL:C285($1)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>SD3_t_CompMenuCall; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_MenV")
If (Modified record:C314([COMPANIES:2]))
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
End if 
If (Modified record:C314([CONTACTS:1]))
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
End if 
UNLOAD RECORD:C212([CONTACTS:1])
<>AutoFind:=True:C214
<>AutoFile:="Companies"
<>AutoProc:=vProc
Defaults_Clear
<>CompCode:=[COMPANIES:2]Company_Code:1
SD3_t_DiaryRelatedRecord:=<>CompCode
SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])

<>SD3_l_DiaryProcess:=vProc
<>DB_bo_AutoOut:=True:C214
If (Count parameters:C259=0)
	$_l_SelectedMenu:=Sel_LPmi("Companies_MenV")
Else 
	$_l_SelectedMenu:=$1
End if 

<>SD_l_SelectedMenuNumber:=$_l_SelectedMenu
Case of 
	: ($_l_SelectedMenu=1)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CONTACTS:1]))); Module_Companies; ""; ->[CONTACTS:1]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
	: ($_l_SelectedMenu=2)
		
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PRODUCTS:9]))); Module_Companies; ""; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
	: ($_l_SelectedMenu=3)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PRICE_TABLE:28]))); Module_Companies; ""; ->[PRICE_TABLE:28]Company_Code:8; [COMPANIES:2]Company_Code:1)
		
	: ($_l_SelectedMenu=4)
		
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[DIARY:12]))); Module_Companies; ""; ->[DIARY:12]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
		
	: ($_l_SelectedMenu=5)
		//  If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4DWrite "Silver"
		
		DBI_MenuDisplayRecords("DiaryLetters"; Module_Companies; ""; ->[DIARY:12]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
	: ($_l_SelectedMenu=6)  //enquiries
		DBI_MenuDisplayRecords("OrdersEnquiries"; Module_Companies; ""; ->[ORDERS:24]Company_Code:1; [COMPANIES:2]Company_Code:1)
		//ZOrders_View
	: ($_l_SelectedMenu=7)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDERS:24]))); Module_Companies; ""; ->[ORDERS:24]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
		
	: ($_l_SelectedMenu=8)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); Module_Companies; ""; ->[PURCHASE_ORDERS:57]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
		//ZPurchOrd_Mod
	: ($_l_SelectedMenu=9)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[INVOICES:39]))); Module_Companies; ""; ->[INVOICES:39]Company_Code:2; [COMPANIES:2]Company_Code:1)
		
		
	: ($_l_SelectedMenu=10)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))); Module_Companies; ""; ->[PURCHASE_INVOICES:37]Company_Code:2; [COMPANIES:2]Company_Code:1)
		
		//ZPurchases_Mod
	: ($_l_SelectedMenu=11)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); Module_Companies; ""; ->[SERVICE_CALLS:20]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
		
	: ($_l_SelectedMenu=15)
		FurthFld_Func2(->[COMPANIES:2])
		
		
		
	: ($_l_SelectedMenu=16)
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CONTRACTS:17]))); Module_Companies; ""; ->[CONTRACTS:17]Company_Code:1; [COMPANIES:2]Company_Code:1)
		
		//ZContracts_Mod
End case 
ERR_MethodTrackerReturn("Companies_MenV"; $_t_oldMethodName)