//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 14:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PO_al_DocIncludes;0)
	//ARRAY LONGINT(PO_AL_FormIDs;0)
	//ARRAY LONGINT(PO_al_TabIds;0)
	//ARRAY LONGINT(PO_al_TabIncludes;0;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY LONGINT(PO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(PO_al_ViewTabsStates;0)
	//ARRAY TEXT(PO_at_TabNames;0)
	//ARRAY TEXT(PO_at_ViewTabsFormNames;0)
	//ARRAY TEXT(PO_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; PO_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentRow; $_l_ModuleAccess; $_l_TabsIndex)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(PO_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(PO_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(PO_al_ViewTabsStates; 150)
ARRAY TEXT:C222(PO_at_ViewTabsFormNames; 150)
ARRAY TEXT:C222(PO_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(PO_al_ViewTableToTable; 150)
ARRAY TEXT:C222(PO_at_TabNames; 0)
ARRAY LONGINT:C221(PO_al_TabIds; 0)
ARRAY LONGINT:C221(PO_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(PO_al_DocIncludes; 0)
$_l_CurrentRow:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
$_l_CurrentRow:=1
PO_at_ViewTabsLabels{$_l_CurrentRow}:=" Purchase order Items "
PO_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="05703"  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])

If (PO_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentRow:=$_l_CurrentRow+1
	
	PO_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	PO_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Contact_In"
	PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3)
	PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 



$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)  //Sales orders items"
If ($_l_ModuleAccess>1)
	ARRAY TEXT:C222(PO_at_TabNames; 0)
	ARRAY LONGINT:C221(PO_al_TabIds; 0)
	ARRAY LONGINT:C221(PO_AL_FormIDs; 0)
	ARRAY LONGINT:C221(PO_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(PO_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[PURCHASE_ORDERS:57]); ->PO_at_TabNames; ->PO_al_TabIncludes; ->PO_al_DocIncludes; ->PO_al_TabIds; ->PO_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(PO_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_TabsIndex; 1; Size of array:C274(PO_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			PO_at_ViewTabsLabels{$_l_CurrentRow}:=PO_at_TabNames{$_l_TabsIndex}
			PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Contact_In"  //NG April 2004 Removed ◊Screen
			PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (PO_al_DocIncludes{$_l_TabsIndex}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleAccess>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				PO_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
				PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
				PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		PO_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
		PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PO_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
			PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 





$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //sales orders"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PO_at_ViewTabsLabels{$_l_CurrentRow}:="Sales  Orders Items"
	PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="002503"
	PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
End if 


$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase invoices"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PO_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Invoices"
	PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PO_at_ViewTabsFormSettings{$_l_CurrentRow}:=" `Note this will be a list of PIs not PI Items"
	PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])
End if 
//
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //stcok movements"
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PO_at_ViewTabsLabels{$_l_CurrentRow}:="Stock Movement Items"
	PO_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PO_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	PO_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PO_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PO_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
End if 


ARRAY TEXT:C222(PO_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(PO_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(PO_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(PO_at_ViewTabsFormNames; $_l_CurrentRow)
ARRAY TEXT:C222(PO_at_ViewTabsFormSettings; $_l_CurrentRow)
ERR_MethodTrackerReturn("PO_Contexts"; $_t_oldMethodName)
