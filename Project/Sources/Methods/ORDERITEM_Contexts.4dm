//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDERITEM_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/07/2010 16:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORDI_al_DocIncludes;0)
	//ARRAY LONGINT(ORDI_AL_FormIDs;0)
	//ARRAY LONGINT(ORDI_al_TabIds;0)
	//ARRAY LONGINT(ORDI_al_TabIncludes;0;0)
	//ARRAY LONGINT(ORDI_al_ViewsTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTabsSettings;0)
	//ARRAY LONGINT(ORDI_al_ViewTabsStates;0)
	//ARRAY TEXT(ORDI_at_TabNames;0)
	//ARRAY TEXT(ORDI_at_ViewTabsFormName;0)
	//ARRAY TEXT(ORDI_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; ORDI_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderItem_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(ORDI_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(ORDI_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(ORDI_al_ViewTabsStates; 150)
ARRAY TEXT:C222(ORDI_at_ViewTabsFormName; 150)
ARRAY TEXT:C222(ORDI_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(ORDI_al_ViewTableToTable; 150)
ARRAY TEXT:C222(ORDI_at_TabNames; 0)
ARRAY LONGINT:C221(ORDI_al_TabIds; 0)
ARRAY LONGINT:C221(ORDI_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(ORDI_al_DocIncludes; 0)
$_l_CurrentRow:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Companies))

If (ORDI_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentRow:=$_l_CurrentRow+1
	
	ORDI_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contact_In"
	ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 
//``
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
If ($_l_ModuleAccess>1)
	ARRAY TEXT:C222(ORDI_at_TabNames; 0)
	ARRAY LONGINT:C221(ORDI_al_TabIds; 0)
	ARRAY LONGINT:C221(ORDI_AL_FormIDs; 0)
	ARRAY LONGINT:C221(ORDI_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(ORDI_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[ORDER_ITEMS:25]); ->ORDI_at_TabNames; ->ORDI_al_TabIncludes; ->ORDI_al_DocIncludes; ->ORDI_al_TabIds; ->ORDI_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(ORDI_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_Index; 1; Size of array:C274(ORDI_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			ORDI_at_ViewTabsLabels{$_l_CurrentRow}:=ORDI_at_TabNames{$_l_Index}
			ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (ORDI_al_DocIncludes{$_l_Index}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleAccess>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				ORDI_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
				ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contacts_InN"+"13"
				ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		ORDI_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contact_In"  //NG April 2004 Removed ◊Screen
		ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			ORDI_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contact_In"
			ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 

//``
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORDI_at_ViewTabsLabels{$_l_CurrentRow}:=" Invoices "
	ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //edit on screen
	ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Items_in"
	ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[INVOICES:39])
End if 
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORDI_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Orders"
	ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Contacts_InN"+"13"
	ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //Purchase orders
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	ORDI_at_ViewTabsLabels{$_l_CurrentRow}:="Stock Items"
	ORDI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	ORDI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	ORDI_at_ViewTabsFormName{$_l_CurrentRow}:="Stock_in"
	ORDI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00101"
	ORDI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
	
End if 






//Could show ATTENDEES for events
//Service calls

ARRAY TEXT:C222(ORDI_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(ORDI_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(ORDI_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(ORDI_at_ViewTabsFormName; $_l_CurrentRow)
ARRAY TEXT:C222(ORDI_at_ViewTabsFormSettings; $_l_CurrentRow)
ERR_MethodTrackerReturn("OrderItem_Contexts"; $_t_oldMethodName)
