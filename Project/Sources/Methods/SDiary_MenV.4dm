//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_MenV
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
	C_LONGINT:C283(<>AutoProc; $_l_MenuItem; $_l_ViewRecordsProcess; $1)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDiary_MenV")
//SDiary_MenV: WT-13/08/01
$_l_MenuItem:=$1
<>CompCode:=[DIARY:12]Company_Code:1
<>ContCode:=[DIARY:12]Contact_Code:2
<>ProdCode:=[DIARY:12]Product_Code:13
<>JobCode:=[DIARY:12]Job_Code:19
<>CallCode:=[DIARY:12]Call_Code:25
<>OrderCode:=[DIARY:12]Order_Code:26
If ($_l_MenuItem<6)
	<>DB_bo_AutoOut:=False:C215
Else 
	<>DB_bo_AutoOut:=False:C215
End if 
<>AutoFind:=True:C214
<>AutoProc:=vProc
<>AutoFile:="Diary"
Case of 
	: ($_l_MenuItem=3)
		//DBI_MenuDisplayRecords ("Companies";Module_DiaryManager ;"";->[DIARY]Company Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [DIARY:12]Company_Code:1)
		
		
		//ZCompanies_Mod
	: ($_l_MenuItem=4)
		//DBI_MenuDisplayRecords ("Contacts";Module_DiaryManager ;"";->[DIARY]Contact Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [DIARY:12]Contact_Code:2)
		
		//ZContacts_Mod
	: ($_l_MenuItem=5)
		//DBI_MenuDisplayRecords ("Products";Module_DiaryManager ;"";->[DIARY]Product Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Product"; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; [DIARY:12]Product_Code:13)
		
		//ZProducts_Mod ([DIARY]Product Code)
	: ($_l_MenuItem=6)
		UNLOAD RECORD:C212([ORDERS:24])
		//ZOrders_View
		//DBI_MenuDisplayRecords ("Orders";Module_DiaryManager ;"";->[DIARY]Order Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [DIARY:12]Order_Code:26)
		
	: ($_l_MenuItem=7)
		UNLOAD RECORD:C212([ORDERS:24])
		//ZOrders_Mod
		//DBI_MenuDisplayRecords ("Order";Module_DiaryManager ;"";->[DIARY]Order Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [DIARY:12]Order_Code:26)
		
	: ($_l_MenuItem=8)
		UNLOAD RECORD:C212([SERVICE_CALLS:20])
		//ZCalls_Mod
		//DBI_MenuDisplayRecords ("Service Calls";Module_DiaryManager ;"";->[DIARY]Call Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Service Call"; Current process:C322; Table:C252(->[SERVICE_CALLS:20]); ""; [DIARY:12]Call_Code:25)
		
	: ($_l_MenuItem=9)
		
		<>DB_bo_AutoOut:=False:C215
		//ZJobs_Mod
		//DBI_MenuDisplayRecords ("Jobs";Module_DiaryManager ;"";->[DIARY]Job Code)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Job"; Current process:C322; Table:C252(->[JOBS:26]); ""; [DIARY:12]Job_Code:19)
		
	: ($_l_MenuItem=10)
		$_l_ViewRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Job Stage"; Current process:C322; Table:C252(->[JOB_STAGES:47]); ""; [DIARY:12]Stage_Code:21)
		
		
End case 
ERR_MethodTrackerReturn("SDiary_MenV"; $_t_oldMethodName)
