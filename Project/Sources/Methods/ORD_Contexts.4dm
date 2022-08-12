//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   28/11/2010 14:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_DocIncludes;0)
	//ARRAY LONGINT(ORD_AL_FormIDs;0)
	//ARRAY LONGINT(ORD_al_TabIds;0)
	//ARRAY LONGINT(ORD_al_TabIncludes;0;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORD_al_ViewTabsSettings;0)
	//ARRAY LONGINT(ORD_al_ViewTabsStates;0)
	//ARRAY LONGINT(ORD_l_ViewTabsSettings;0)
	//ARRAY TEXT(ORD_at_TabNames;0)
	//ARRAY TEXT(ORD_at_ViewTabsFormNames;0)
	//ARRAY TEXT(ORD_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; ORD_bo_FurtherFieldsLoaded)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_CurrentRow; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(ORD_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(ORD_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(ORD_al_ViewTabsStates; 150)
ARRAY TEXT:C222(ORD_at_ViewTabsFormNames; 150)
ARRAY TEXT:C222(ORD_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(ORD_al_ViewTableToTable; 150)
ARRAY TEXT:C222(ORD_at_TabNames; 0)
ARRAY LONGINT:C221(ORD_al_TabIds; 0)
ARRAY LONGINT:C221(ORD_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(ORD_al_DocIncludes; 0)
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
$_l_CurrentRow:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
$_l_CurrentRow:=1
ORD_at_ViewTabsLabels{$_l_CurrentRow}:=" Order Items "
ORD_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="002503"  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])

If (ORD_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentRow:=$_l_CurrentRow+1
	
	ORD_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	ORD_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contact_In"
	ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3)
	ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
If ($_l_ModuleAccess>1)
	ARRAY TEXT:C222(ORD_at_TabNames; 0)
	ARRAY LONGINT:C221(ORD_al_TabIds; 0)
	ARRAY LONGINT:C221(ORD_AL_FormIDs; 0)
	ARRAY LONGINT:C221(ORD_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(ORD_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[ORDERS:24]); ->ORD_at_TabNames; ->ORD_al_TabIncludes; ->ORD_al_DocIncludes; ->ORD_al_TabIds; ->ORD_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(ORD_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_Index; 1; Size of array:C274(ORD_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			ORD_at_ViewTabsLabels{$_l_CurrentRow}:=ORD_at_TabNames{$_l_Index}
			ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (ORD_al_DocIncludes{$_l_Index}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleAccess>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
				ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
				ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		ORD_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
		ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
			ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 





$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Orders"
	ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
End if 


$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Invoices"
	ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
	ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[INVOICES:39])
End if 

If (False:C215)  // this could be done when stock is done
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase Invoices"
	If ($_l_ModuleAccess>1)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Invoices"
		ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
		ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])
	End if 
End if 
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //Stock Items"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORD_at_ViewTabsLabels{$_l_CurrentRow}:="Stock Movement Items"
	ORD_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	ORD_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORD_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	ORD_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	ORD_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
End if 
//Could show ATTENDEES for events
//Service calls

ARRAY TEXT:C222(ORD_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(ORD_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(ORD_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(ORD_at_ViewTabsFormNames; $_l_CurrentRow)
ARRAY TEXT:C222(ORD_at_ViewTabsFormSettings; $_l_CurrentRow)
ERR_MethodTrackerReturn("ORD_Contexts"; $_t_oldMethodName)
