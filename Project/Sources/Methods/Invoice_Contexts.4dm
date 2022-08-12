//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoice_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_DocIncludes;0)
	//ARRAY LONGINT(INV_AL_FormIDs;0)
	//ARRAY LONGINT(INV_al_TabIds;0)
	//ARRAY LONGINT(INV_al_TabIncludes;0;0)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY LONGINT(INV_al_ViewTabsSettings;0)
	//ARRAY LONGINT(INV_al_ViewTabsStates;0)
	//ARRAY TEXT(INV_at_TabNames;0)
	//ARRAY TEXT(INV_at_ViewTabsForMname;0)
	//ARRAY TEXT(INV_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; INV_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Invoice_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(INV_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(INV_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(INV_al_ViewTabsStates; 150)
ARRAY TEXT:C222(INV_at_ViewTabsForMname; 150)
ARRAY TEXT:C222(INV_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(INV_al_ViewTableToTable; 150)
ARRAY TEXT:C222(INV_at_TabNames; 0)
ARRAY LONGINT:C221(INV_al_TabIds; 0)
ARRAY LONGINT:C221(INV_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(INV_al_DocIncludes; 0)

$_l_CurrentRow:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesLedger))

$_l_CurrentRow:=1
INV_at_ViewTabsLabels{$_l_CurrentRow}:=" Invoice Items "
INV_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
INV_at_ViewTabsForMname{$_l_CurrentRow}:="Items_in"
INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="03903"  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[INVOICES:39])

If (INV_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentRow:=$_l_CurrentRow+1
	
	INV_at_ViewTabsLabels{$_l_CurrentRow}:=" Further Fields "
	INV_al_ViewTabsSettings{$_l_CurrentRow}:=0  //edit on screen
	INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	INV_at_ViewTabsForMname{$_l_CurrentRow}:="Contact_In"
	INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
	INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
If ($_l_ModuleAccess>1)
	ARRAY TEXT:C222(INV_at_TabNames; 0)
	ARRAY LONGINT:C221(INV_al_TabIds; 0)
	ARRAY LONGINT:C221(INV_AL_FormIDs; 0)
	ARRAY LONGINT:C221(INV_al_TabIncludes; 0; 0)
	ARRAY LONGINT:C221(INV_al_DocIncludes; 0)
	SD2_LoadTabSetting(True:C214; Table:C252(->[INVOICES:39]); ->INV_at_TabNames; ->INV_al_TabIncludes; ->INV_al_DocIncludes; ->INV_al_TabIds; ->INV_Al_FormIDs)
	SD2_LoadActionGroups
	If (Size of array:C274(INV_at_TabNames)>0)
		$_bo_AddDocuments:=False:C215
		For ($_l_Index; 1; Size of array:C274(INV_at_TabNames))
			$_l_CurrentRow:=$_l_CurrentRow+1
			INV_at_ViewTabsLabels{$_l_CurrentRow}:=INV_at_TabNames{$_l_Index}
			INV_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			INV_at_ViewTabsForMname{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
			INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
			If (INV_al_DocIncludes{$_l_Index}=0)
				$_bo_AddDocuments:=True:C214
			End if 
		End for 
		If ($_bo_AddDocuments)  // at least one tab does not show documents
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleAccess>1)
				$_l_CurrentRow:=$_l_CurrentRow+1
				INV_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
				INV_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
				INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
				INV_at_ViewTabsForMname{$_l_CurrentRow}:="Contacts_InN"+"13"
				INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
				INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
				
			End if 
		End if 
		
	Else 
		$_l_CurrentRow:=$_l_CurrentRow+1
		INV_at_ViewTabsLabels{$_l_CurrentRow}:="   Diary   "
		INV_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
		INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
		INV_at_ViewTabsForMname{$_l_CurrentRow}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
		INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="00103"
		INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DIARY:12])
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			INV_at_ViewTabsLabels{$_l_CurrentRow}:="Documents"
			INV_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
			INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
			INV_at_ViewTabsForMname{$_l_CurrentRow}:="Contacts_InN"+"13"
			INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
End if 





$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales orders
If ($_l_ModuleAccess>1)
	$_l_CurrentRow:=$_l_CurrentRow+1
	INV_at_ViewTabsLabels{$_l_CurrentRow}:="Order Items"
	INV_al_ViewTabsSettings{$_l_CurrentRow}:=3  //no on screen edit
	INV_al_ViewTabsStates{$_l_CurrentRow}:=$_l_ModuleAccess
	INV_at_ViewTabsForMname{$_l_CurrentRow}:="Items_in"
	INV_at_ViewTabsFormSettings{$_l_CurrentRow}:="002503"
	INV_al_ViewTableToTable{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
End if 


//Could show ATTENDEES for events
//Service calls

ARRAY TEXT:C222(INV_at_ViewTabsLabels; $_l_CurrentRow)
ARRAY LONGINT:C221(INV_al_ViewTabsSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(INV_al_ViewTabsStates; $_l_CurrentRow)
ARRAY TEXT:C222(INV_at_ViewTabsForMname; $_l_CurrentRow)
ARRAY TEXT:C222(INV_at_ViewTabsFormSettings; $_l_CurrentRow)
ARRAY LONGINT:C221(INV_al_ViewTableToTable; $_l_CurrentRow)
ERR_MethodTrackerReturn("Invoice_Contexts"; $_t_oldMethodName)