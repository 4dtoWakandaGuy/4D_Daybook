//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Buttons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 14:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Com_at_CompanyDataDisplay;0)
	//ARRAY TEXT(<>Con_at_ContactDataDisplay;0)
	//ARRAY TEXT(<>PRD_at_PriceDisplay;0)
	//ARRAY TEXT(<>SD3_at_DiaryPriority;0)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	//ARRAY TEXT(<>SD3_at_HistoryType;0)
	//ARRAY TEXT(<>TR_at_BudgetorActual;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	C_LONGINT:C283($i)
	C_TEXT:C284(<>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Buttons")

ARRAY TEXT:C222(<>Com_at_CompanyDataDisplay; 10)
<>Com_at_CompanyDataDisplay{1}:=<>DB_t_TownLabel
<>Com_at_CompanyDataDisplay{2}:=<>DB_t_CountyLabel
<>Com_at_CompanyDataDisplay{3}:=<>DB_t_PostcodeLabel
<>Com_at_CompanyDataDisplay{4}:=<>DB_t_CountryLabel
<>Com_at_CompanyDataDisplay{5}:="Telephone"
<>Com_at_CompanyDataDisplay{6}:="Fax"
<>Com_at_CompanyDataDisplay{7}:="Status"
<>Com_at_CompanyDataDisplay{8}:="Type"
<>Com_at_CompanyDataDisplay{9}:="Source"
<>Com_at_CompanyDataDisplay{10}:="Area"
<>Com_at_CompanyDataDisplay:=1

ARRAY TEXT:C222(<>Con_at_ContactDataDisplay; 10)
<>Con_at_ContactDataDisplay{1}:="Contact Code"
<>Con_at_ContactDataDisplay{2}:="Title"
<>Con_at_ContactDataDisplay{3}:="Job Title"
<>Con_at_ContactDataDisplay{4}:="Department"
<>Con_at_ContactDataDisplay{5}:="Extension"
<>Con_at_ContactDataDisplay{6}:="Role"
<>Con_at_ContactDataDisplay{7}:="Status"
<>Con_at_ContactDataDisplay{8}:="Type"
<>Con_at_ContactDataDisplay{9}:="Source"
<>Con_at_ContactDataDisplay{10}:="1st Company"
<>Con_at_ContactDataDisplay:=1

ARRAY TEXT:C222(<>PRD_at_PriceDisplay; 5)
<>PRD_at_PriceDisplay{1}:="Sales Price"
<>PRD_at_PriceDisplay{2}:="Standard Price"
<>PRD_at_PriceDisplay{3}:="Min Stock"
<>PRD_at_PriceDisplay{4}:="Max Stock"
<>PRD_at_PriceDisplay{5}:="Stock Level"
//◊ProdDisp{6}:="Level Incl Ass"
//◊ProdDisp{7}:="Table Price"
<>PRD_at_PriceDisplay:=1

If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>0)
	ARRAY TEXT:C222(<>SD3_at_HistoryRelation; 3)
	<>SD3_at_HistoryRelation{1}:="History…"
	<>SD3_at_HistoryRelation{2}:="Company"
	<>SD3_at_HistoryRelation{3}:="Contact"
	$i:=3
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Job"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
		
		
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Order"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Call"
	End if 
	$i:=$i+1
	INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
	<>SD3_at_HistoryRelation{$i}:="Comp & Action"
	$i:=$i+1
	INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
	<>SD3_at_HistoryRelation{$i}:="Cont & Action"
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Job & Action"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Order & Act"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Call & Action"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryRelation; $i; 1)
		<>SD3_at_HistoryRelation{$i}:="Document"
	End if 
	<>SD3_at_HistoryRelation:=1
	
	ARRAY TEXT:C222(<>SD3_at_HistoryType; 3)
	<>SD3_at_HistoryType{1}:="History…"
	<>SD3_at_HistoryType{2}:="Company"
	<>SD3_at_HistoryType{3}:="Contact"
	$i:=3
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Job"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Order"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Call"
	End if 
	$i:=$i+1
	INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
	<>SD3_at_HistoryType{$i}:="Comp & Action"
	$i:=$i+1
	INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
	<>SD3_at_HistoryType{$i}:="Cont & Action"
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Job & Action"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Order & Act"
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Call & Action"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
		$i:=$i+1
		INSERT IN ARRAY:C227(<>SD3_at_HistoryType; $i; 1)
		<>SD3_at_HistoryType{$i}:="Document"
	End if 
	<>SD3_at_HistoryType:=1
	
	ARRAY TEXT:C222(<>SD3_at_DiaryPriority; 8)
	<>SD3_at_DiaryPriority{1}:="Priority…"
	<>SD3_at_DiaryPriority{2}:="See 1"
	<>SD3_at_DiaryPriority{3}:="See 2"
	<>SD3_at_DiaryPriority{4}:="See 3"
	<>SD3_at_DiaryPriority{5}:="See To Do"
	<>SD3_at_DiaryPriority{6}:="See Done"
	<>SD3_at_DiaryPriority{7}:="See All"
	<>SD3_at_DiaryPriority{8}:="Set Priority"
	<>SD3_at_DiaryPriority:=1
End if 

If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)
	ARRAY TEXT:C222(<>TR_at_BudgetorActual; 2)
	<>TR_at_BudgetorActual{1}:="Budget"
	<>TR_at_BudgetorActual{2}:="Actual"
	<>TR_at_BudgetorActual:=2
End if 

If ((DB_GetModuleSettingByNUM(Module_WPManager))>0)
	ARRAY TEXT:C222(<>WP_at_DocumentDiaryActionCode; 0)
	ARRAY TEXT:C222(<>WP_at_DocumentDiaryActionName; 0)
	//NB are loaded when first used
	//repeated in Actions_Mod
End if 
ERR_MethodTrackerReturn("Diary Buttons"; $_t_oldMethodName)