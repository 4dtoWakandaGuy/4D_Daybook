//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   28/11/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_DocIncludes;0)
	//ARRAY LONGINT(CON_AL_FormIDs;0)
	//ARRAY LONGINT(CON_al_TabIds;0)
	//ARRAY LONGINT(CON_al_TabIncludes;0;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY LONGINT(CON_al_ViewTabsState;0)
	//ARRAY TEXT(CON_at_TabNames;0)
	//ARRAY TEXT(CON_at_ViewTabsFormNames;0)
	//ARRAY TEXT(CON_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; CON_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentElement; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(CON_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(CON_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(CON_al_ViewTabsState; 150)
ARRAY TEXT:C222(CON_at_ViewTabsFormNames; 150)
ARRAY TEXT:C222(CON_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(CON_al_ViewTableToTable; 150)
ARRAY TEXT:C222(CON_at_TabNames; 0)
ARRAY LONGINT:C221(CON_al_TabIds; 0)
ARRAY LONGINT:C221(CON_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(CON_al_DocIncludes; 0)
$_l_CurrentElement:=0


If (CON_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentElement:=$_l_CurrentElement+1
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
	CON_at_ViewTabsLabels{$_l_CurrentElement}:=" Custom Fields "
	CON_al_ViewTabsSettings{$_l_CurrentElement}:=0  //edit on screen
	CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
	CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contact_In"
	CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3)
	CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 


If (True:C214)
	If (True:C214)
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(COn_at_TabNames; 0)
			ARRAY LONGINT:C221(CON_al_TabIds; 0)
			ARRAY LONGINT:C221(CON_AL_FormIDs; 0)
			ARRAY LONGINT:C221(CON_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(CON_al_DocIncludes; 0)
			SD2_LoadTabSetting(True:C214; Table:C252(->[CONTACTS:1]); ->CON_at_TabNames; ->CON_al_TabIncludes; ->CON_al_DocIncludes; ->CON_al_TabIds; ->CON_Al_FormIDs)
			SD2_LoadActionGroups
			If (Size of array:C274(CON_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(CON_at_TabNames))
					$_l_CurrentElement:=$_l_CurrentElement+1
					CON_at_ViewTabsLabels{$_l_CurrentElement}:=CON_at_TabNames{$_l_Index}
					CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
					CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
					CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
					CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
					If (CON_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)  // at least one tab does not show documents
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess>1)
						$_l_CurrentElement:=$_l_CurrentElement+1
						CON_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
						CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
						CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
						CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
						CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
						CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
						
					End if 
				End if 
				
			Else 
				$_l_CurrentElement:=$_l_CurrentElement+1
				CON_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
				CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
				CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
				CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
				CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
				CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				If ($_l_ModuleAccess>1)
					$_l_CurrentElement:=$_l_CurrentElement+1
					CON_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
					CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
					CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
					CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
					CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
					
				End if 
			End if 
		End if 
	Else 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CON_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
			CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
			CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
		End if 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CON_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
			CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
			CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
			CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Enquiries)  //enquiries"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Enquiries"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
		
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Orders"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Purchase Orders"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[PURCHASE_ORDERS:57])
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Invoices"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[INVOICES:39])
	End if 
	
	//[CONTRACTS]
	$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))  //Contracts/Service Calls"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Contracts"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CONTRACTS:17])
	End if 
	
	//[SERVICE CALLS]
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)  //Contracts/Service Calls"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Service Calls"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[SERVICE_CALLS:20])
	End if 
	
	
	
	
	
	//[JOBS]
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Jobs????(Jobs and stages"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CON_at_ViewTabsLabels{$_l_CurrentElement}:="Jobs"
		CON_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CON_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CON_at_ViewTabsFormNames{$_l_CurrentElement}:="Contacts_InN"+"13"
		CON_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
		CON_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[JOBS:26])
	End if 
	
	
	
	
	
	
	
	
	
	
	//[PUBLICATIONS]
	//DB_GetModuleSetting(Module_Subscriptions)=Subsciptions
End if 

ARRAY TEXT:C222(CON_at_ViewTabsLabels; $_l_CurrentElement)
ARRAY LONGINT:C221(CON_al_ViewTabsSettings; $_l_CurrentElement)
ARRAY LONGINT:C221(CON_al_ViewTabsState; $_l_CurrentElement)
ARRAY TEXT:C222(CON_at_ViewTabsFormNames; $_l_CurrentElement)
ARRAY TEXT:C222(CON_at_ViewTabsFormSettings; $_l_CurrentElement)
ERR_MethodTrackerReturn("CON_Contexts"; $_t_oldMethodName)