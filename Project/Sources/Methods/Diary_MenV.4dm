//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    14/09/2010 23:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; <>SD_l_SelectedMenuNumber; <>SD3_l_DiaryProcess; $_l_MenuItem; $_l_ShowRecordsProcess)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; <>SD3_t_CompMenuCall; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_MenV")
If (<>SD3_t_CompMenuCall#"")
	$_l_MenuItem:=<>SD_l_SelectedMenuNumber
	vProc:=<>SD3_l_DiaryProcess
	QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=<>CompCode)
Else 
	$_l_MenuItem:=Sel_LPmi("Diary_MenV")
End if 
<>CompCode:=[DIARY:12]Company_Code:1
<>ContCode:=[DIARY:12]Contact_Code:2
<>ProdCode:=[DIARY:12]Product_Code:13
<>JobCode:=[DIARY:12]Job_Code:19
<>CallCode:=[DIARY:12]Call_Code:25
<>OrderCode:=[DIARY:12]Order_Code:26
If ($_l_MenuItem<4)
	<>DB_bo_AutoOut:=False:C215
Else 
	<>DB_bo_AutoOut:=True:C214
End if 
<>AutoFind:=True:C214
<>AutoProc:=vProc
<>AutoFile:="Diary"
Case of 
	: ($_l_MenuItem=1) & (<>CompCode#"")
		//DBI_MenuDisplayRecords ("Companies")
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [DIARY:12]Company_Code:1)
		
	: ($_l_MenuItem=2) & (<>ContCode#"")
		//DBI_MenuDisplayRecords ("Contacts")
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [DIARY:12]Contact_Code:2)
		
	: ($_l_MenuItem=3) & ([DIARY:12]Product_Code:13#"")
		//DBI_MenuDisplayRecords ("Products";Module_DiaryManager ;"";->[DIARY]Product Code)
		//ZProducts_Mod ([DIARY]Product Code)
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Product"; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; [DIARY:12]Product_Code:13)
		
	: ($_l_MenuItem=4) & (<>OrderCode#"")
		UNLOAD RECORD:C212([ORDERS:24])
		//ZOrders_View
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [DIARY:12]Order_Code:26)
		
	: ($_l_MenuItem=5) & (<>OrderCode#"")
		UNLOAD RECORD:C212([ORDERS:24])
		//ZOrders_Mod
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [DIARY:12]Order_Code:26)
		
	: ($_l_MenuItem=6) & (<>CallCode#"")
		UNLOAD RECORD:C212([SERVICE_CALLS:20])
		//ZCalls_Mod
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Service Call"; Current process:C322; Table:C252(->[SERVICE_CALLS:20]); ""; [DIARY:12]Call_Code:25)
		
	: ($_l_MenuItem=7) & (<>JobCode#"")
		
		<>DB_bo_AutoOut:=False:C215
		
		$_l_ShowRecordsProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Jobs"; Current process:C322; Table:C252(->[JOBS:26]); ""; [DIARY:12]Job_Code:19)
		
		
End case 
ERR_MethodTrackerReturn("Diary_MenV"; $_t_oldMethodName)