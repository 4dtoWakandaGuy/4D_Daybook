//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ISOTESTER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2013 15:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_EditInTransaction; $_bo_FiltersAvailable; $_bo_GraphsAvailable; $_bo_HideModuleBar; $_bo_ReturnSelectRecords; $_bo_SearchesAvailable; $_bo_SeletionsAvailable; $_bo_StatsAvailable; $_bo_TabsAvailable)
	C_LONGINT:C283($_l_DisplayRecordsTable; $_l_Module; $_l_Process; $_l_ViewType)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_Context; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ISOTester")

Gen_Alert("First select a range of products to use for this test")
ALL RECORDS:C47([PRODUCTS:9])
$_l_DisplayRecordsTable:=Table:C252(->[PRODUCTS:9])
$_Ptr_Table:=Table:C252($_l_DisplayRecordsTable)
COPY NAMED SELECTION:C331($_Ptr_Table->; "◊Selselection")
$_l_ViewType:=1
$_bo_TabsAvailable:=False:C215
$_bo_HideModuleBar:=True:C214
$_bo_SearchesAvailable:=True:C214
$_bo_StatsAvailable:=False:C215
$_bo_GraphsAvailable:=False:C215
$_bo_FiltersAvailable:=True:C214
$_bo_SeletionsAvailable:=True:C214
$_l_Module:=0
$_bo_EditInTransaction:=False:C215
$_bo_ReturnSelectRecords:=True:C214
$_t_Context:="Select Records"
$_l_Process:=New process:C317("DBI_DisplayRecords"; 1024000; "Select "+Table name:C256($_Ptr_Table); $_l_DisplayRecordsTable; "◊Selselection"; $_t_Context; $_l_ViewType; $_bo_TabsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; Current process:C322; $_bo_StatsAvailable; $_bo_GraphsAvailable; $_bo_FiltersAvailable; $_bo_SeletionsAvailable; $_l_Module; $_bo_EditInTransaction; $_bo_ReturnSelectRecords; True:C214)
While (Process state:C330($_l_Process)>=0)
	DelayTicks(60)
	If ($_l_Process#Frontmost process:C327)
		BRING TO FRONT:C326($_l_Process)
	End if 
End while 
USE NAMED SELECTION:C332("◊Selselection")
COPY NAMED SELECTION:C331([PRODUCTS:9]; "ProductSelection")

Gen_Alert("First select a range of products to use for this Sales orders for this test")
ERR_MethodTrackerReturn("STK_ISOTester"; $_t_oldMethodName)
