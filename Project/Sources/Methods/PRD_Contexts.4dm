//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_DocIncludes;0)
	//ARRAY LONGINT(PRD_AL_FormIDs;0)
	//ARRAY LONGINT(PRD_al_TabIds;0)
	//ARRAY LONGINT(PRD_al_TabIncludes;0;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY LONGINT(PRD_al_ViewTabsSettings;0)
	//ARRAY LONGINT(PRD_al_ViewTabsStates;0)
	//ARRAY LONGINT(PTF_al_DocIncludes;0)
	//ARRAY TEXT(PRD_at_TabNames;0)
	//ARRAY TEXT(PRD_at_ViewTabsFormNames;0)
	//ARRAY TEXT(PRD_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; $_bo_ShowStock; $1; $2; PRD_bo_FurtherFieldsLoaded)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_CurrentRow; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_Contexts")


//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(PRD_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(PRD_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(PRD_al_ViewTabsStates; 150)
ARRAY TEXT:C222(PRD_at_ViewTabsFormNames; 150)
ARRAY TEXT:C222(PRD_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(PRD_al_ViewTabletoTable; 150)
ARRAY TEXT:C222(PRD_at_TabNames; 0)
ARRAY LONGINT:C221(PRD_al_TabIds; 0)
ARRAY LONGINT:C221(PRD_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(PTF_al_DocIncludes; 0)
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
$_l_CurrentRow:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Products))
$_l_CurrentRow:=1
PRD_at_ViewTabsLabels{$_l_CurrentRow}:=" Suppliers "
PRD_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
PRD_at_ViewTabsFormNames{$_l_CurrentRow}:=""
PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="3"  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[PRODUCTS:9])

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)  //Price Table"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Price Table"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[PRICE_TABLE:28])
End if 

If (PRD_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN13"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3)
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
If ($_l_ModuleAccess>1)
	ARRAY TEXT:C222(PRD_at_TabNames; 0)
	ARRAY LONGINT:C221(PRD_al_TabIds; 0)
	ARRAY LONGINT:C221(PRD_AL_FormIDs; 0)
	ARRAY LONGINT:C221(PRD_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(PRD_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[PRODUCTS:9]); ->PRD_at_TabNames; ->PRD_al_TabIncludes; ->PRD_al_DocIncludes; ->PRD_al_TabIds; ->PRD_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(PRD_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_Index; 1; Size of array:C274(PRD_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			PRD_at_ViewTabsLabels{$_l_CurrentRow}:=PRD_at_TabNames{$_l_Index}
			PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (PRD_al_DocIncludes{$_l_Index}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			
			
			If ($_l_ModuleAccess>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
				PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
				PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		PRD_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
		PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
			PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Invoices"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Order items"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Invoices Items"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="16103"
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[INVOICES_ITEMS:161])
End if   // note this is actually a view of invoice items so will resolve to an array based setup
//


$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Orders"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
End if   //Note that this is actually a view of PO items..so will resolve to an array based setup....




// this could be done when stock is done
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase Invoices"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Invoices"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])
End if   //Note that this actually a view of pi items so will resolve to an array based setup

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //Stock Items"
If (Count parameters:C259>=2)
	If ($2)
		$_bo_ShowStock:=True:C214
	Else 
		$_bo_ShowStock:=False:C215
	End if 
Else 
	$_bo_ShowStock:=True:C214
End if 
If ($_l_ModuleAccess>1) & ($_bo_ShowStock)
	
	$_l_CurrentRow:=$_l_CurrentRow+1
	PRD_at_ViewTabsLabels{$_l_CurrentRow}:="Current Stock"
	PRD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PRD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PRD_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PRD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PRD_al_ViewTabletoTable{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
End if   //note that this resolved to a view of consolidated stock counts by status.location
//Could show ATTENDEES for events
//Service calls

ARRAY TEXT:C222(PRD_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(PRD_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(PRD_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(PRD_at_ViewTabsFormNames; $_l_CurrentRow)
ARRAY TEXT:C222(PRD_at_ViewTabsFormSettings; $_l_CurrentRow)
ERR_MethodTrackerReturn("ORD_Contexts"; $_t_oldMethodName)
