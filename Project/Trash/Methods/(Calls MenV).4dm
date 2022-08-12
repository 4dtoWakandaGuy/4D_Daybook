//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_CompaniesProcess; $_l_ContactsProcess; $_l_DIaryProcess; $_l_ProductsProcess; $_l_SelectedMenu; SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls MenV")
$_l_SelectedMenu:=Sel_LPmi("Calls MenV")
<>CompCode:=[SERVICE_CALLS:20]Company_Code:1
<>ContCode:=[SERVICE_CALLS:20]Contact_Code:2
<>ProdCode:=[SERVICE_CALLS_PRODUCTS:152]Product_Code:1
<>JobCode:=""
<>CallCode:=[SERVICE_CALLS:20]Call_Code:4
<>OrderCode:=""
<>AutoFind:=True:C214
<>DB_bo_AutoOut:=False:C215
<>AutoProc:=vProc
<>AutoFile:="Calls"
SD3_t_DiaryRelatedRecord:=[SERVICE_CALLS:20]Call_Code:4
SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
Case of 
	: ($_l_SelectedMenu=1)
		//DBI_MenuDisplayRecords ("Companies";Module_ServiceCentre ;"";->[SERVICE CALLS]Company Code)
		$_l_CompaniesProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [SERVICE_CALLS:20]Company_Code:1)
		
		//ZCompanies_Mod
	: ($_l_SelectedMenu=2)
		//DBI_MenuDisplayRecords ("Contacts";Module_ServiceCentre ;"";->[SERVICE CALLS]Contact Code)
		$_l_ContactsProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [SERVICE_CALLS:20]Contact_Code:2)
		
	: ($_l_SelectedMenu=3)
		//NG this needs checking out to see what service call product is loaded
		//DBI_MenuDisplayRecords ("Products";Module_ServiceCentre ;"";->[SERVICE CALLS_PRODUCTS]Product Code)
		$_l_ProductsProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Product"; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; [SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
		
	: ($_l_SelectedMenu=4)
		DB_SaveRecord(->[SERVICE_CALLS:20])
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		
		<>DB_bo_AutoOut:=True:C214
		SD3_l_CallActionNum:=1
		//ZDiary_Mod
		
		//DBI_MenuDisplayRecords ("Products";Module_ServiceCentre ;"";->[SERVICE CALLS]Call Code)
		$_l_DIaryProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Diary"; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; [SERVICE_CALLS:20]Call_Code:4)
		
		SD3_l_CallActionNum:=0
End case 
ERR_MethodTrackerReturn("Calls MenV"; $_t_oldMethodName)