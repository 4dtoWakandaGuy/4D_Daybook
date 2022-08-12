//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 14:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PI_al_DocIncludes;0)
	//ARRAY LONGINT(PI_AL_FormIDs;0)
	//ARRAY LONGINT(PI_al_TabIds;0)
	//ARRAY LONGINT(PI_al_TabIncludes;0;0)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PI_al_ViewTabsSettings;0)
	//ARRAY LONGINT(PI_al_ViewTabsStates;0)
	//ARRAY TEXT(PI_at_TabNames;0)
	//ARRAY TEXT(PI_at_ViewTabsFormNames;0)
	//ARRAY TEXT(PI_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; PUR_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_ModuleSetting)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(PI_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(PI_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(PI_al_ViewTabsStates; 150)
ARRAY TEXT:C222(PI_at_ViewTabsFormNames; 150)
ARRAY TEXT:C222(PI_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(PI_al_ViewTableToTable; 150)
ARRAY TEXT:C222(PI_at_TabNames; 0)
ARRAY LONGINT:C221(PI_al_TabIds; 0)
ARRAY LONGINT:C221(PI_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(PI_al_DocIncludes; 0)
$_l_CurrentRow:=0
$_l_ModuleSetting:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
$_l_CurrentRow:=1
PI_at_ViewTabsLabels{$_l_CurrentRow}:=" Purchase Ledger Items "
PI_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="03703"  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])

If (PUR_bo_FurtherFieldsLoaded)
	$_l_CurrentRow:=$_l_CurrentRow+1
	
	PI_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	PI_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
	PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Contact_In"
	PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3)
	PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 

$_l_ModuleSetting:=DB_GetModuleSettingByNUM(Module_DiaryManager)  //diary"
If ($_l_ModuleSetting>1)
	ARRAY TEXT:C222(PI_at_TabNames; 0)
	ARRAY LONGINT:C221(PI_al_TabIds; 0)
	ARRAY LONGINT:C221(PI_AL_FormIDs; 0)
	ARRAY LONGINT:C221(PI_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(PI_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[PURCHASE_INVOICES:37]); ->PI_at_TabNames; ->PI_al_TabIncludes; ->PI_al_DocIncludes; ->PI_al_TabIds; ->PI_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(PI_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_Index; 1; Size of array:C274(PI_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			PI_at_ViewTabsLabels{$_l_CurrentRow}:=PI_at_TabNames{$_l_Index}
			PI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
			PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (PI_al_DocIncludes{$_l_Index}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleSetting:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleSetting>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				PI_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				PI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
				PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
				PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		PI_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		PI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
		PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
		PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleSetting:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleSetting>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PI_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			PI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
			PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Contacts_InN"+"13"
			PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 






$_l_ModuleSetting:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
If ($_l_ModuleSetting>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	PI_at_ViewTabsLabels{$_l_CurrentRow}:="Purchase Orders"
	PI_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	PI_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleSetting
	PI_at_ViewTabsFormNames{$_l_CurrentRow}:="Items_in"
	PI_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
	PI_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
End if 
//


ARRAY TEXT:C222(PI_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(PI_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(PI_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(PI_at_ViewTabsFormNames; $_l_CurrentRow)
ARRAY TEXT:C222(PI_at_ViewTabsFormSettings; $_l_CurrentRow)
ERR_MethodTrackerReturn("Purch_Contexts"; $_t_oldMethodName)
