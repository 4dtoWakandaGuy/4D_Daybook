//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    28/11/2010 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(CO_al_ViewTabsStates;0)
	//ARRAY LONGINT(COM_al_DocIncludes;0)
	//ARRAY LONGINT(COM_AL_FormIDs;0)
	//ARRAY LONGINT(COM_al_TabIds;0)
	//ARRAY LONGINT(COM_al_TabIncludes;0;0)
	//ARRAY TEXT(CO_at_ViewTabsFormName;0)
	//ARRAY TEXT(CO_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_TabNames;0)
	C_BOOLEAN:C305($_bo_AddDocuments; CO_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentElement; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(CO_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(CO_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(CO_al_ViewTabsStates; 150)
ARRAY TEXT:C222(CO_at_ViewTabsFormName; 150)
ARRAY TEXT:C222(CO_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(CO_al_ViewTableToTable; 150)
ARRAY TEXT:C222(COM_at_TabNames; 0)
ARRAY LONGINT:C221(COM_al_TabIds; 0)
ARRAY LONGINT:C221(COM_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(COM_al_DocIncludes; 0)
$_l_CurrentElement:=0
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
If ($_l_ModuleAccess>1)
	$_l_CurrentElement:=$_l_CurrentElement+1
	
	CO_at_ViewTabsLabels{$_l_CurrentElement}:=" Contacts "
	CO_al_ViewTabsSettings{$_l_CurrentElement}:=0  //edit on screen
	CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
	CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contact_In"
	CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3)
	CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CONTACTS:1])
End if 
If (True:C214)
	If (CO_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
		$_l_CurrentElement:=$_l_CurrentElement+1
		
		CO_at_ViewTabsLabels{$_l_CurrentElement}:=" Custom Fields "
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=0  //edit on screen
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contact_In"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3)
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CUSTOM_FIELDS:98])
	End if 
End if 

If (True:C214)
	If (True:C214)
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(COM_at_TabNames; 0)
			ARRAY LONGINT:C221(COM_al_TabIds; 0)
			ARRAY LONGINT:C221(COM_AL_FormIDs; 0)
			ARRAY LONGINT:C221(COM_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(COM_al_DocIncludes; 0)
			SD2_LoadTabSetting(True:C214; Table:C252(->[COMPANIES:2]); ->COM_at_TabNames; ->COM_al_TabIncludes; ->COM_al_DocIncludes; ->COM_al_TabIds; ->COM_Al_FormIDs)
			SD2_LoadActionGroups
			If (Size of array:C274(COM_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(COM_at_TabNames))
					$_l_CurrentElement:=$_l_CurrentElement+1
					CO_at_ViewTabsLabels{$_l_CurrentElement}:=COM_at_TabNames{$_l_Index}
					CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
					CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
					CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
					CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
					If (COM_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)  // at least one tab does not show documents
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					If ($_l_ModuleAccess>1)
						$_l_CurrentElement:=$_l_CurrentElement+1
						CO_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
						CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
						CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
						CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
						CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
						CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
						
					End if 
				End if 
				
			Else 
				$_l_CurrentElement:=$_l_CurrentElement+1
				CO_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
				CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
				CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
				CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
				CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
				CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				If ($_l_ModuleAccess>1)
					$_l_CurrentElement:=$_l_CurrentElement+1
					CO_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
					CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
					CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
					CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
					CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
					
				End if 
			End if 
		End if 
	Else 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CO_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
			CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
			CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
			CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
		End if 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CO_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
			CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
			CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
			CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Enquiries)  //enquiries"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Enquiries"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
		
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Orders"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders"
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Purchase Orders"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[PURCHASE_ORDERS:57])
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Invoices"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[INVOICES:39])
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase Invoices
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Purchase Invoices"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[PURCHASE_INVOICES:37])
	End if 
	
	
	//[CONTRACTS]
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)  //Contracts/Service Calls"
	
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Contracts"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CONTRACTS:17])
	End if 
	
	//[SERVICE CALLS]
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)  //Contracts/Service Calls"
	
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Service Calls"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[SERVICE_CALLS:20])
	End if 
	
	//[PRODUCTS](as a supplier of)
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)  //Products"
	
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Products(supplier)"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[PRODUCTS:9])
	End if 
	
	
	
	//[JOBS]
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Jobs????(Jobs and stages"
	
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CO_at_ViewTabsLabels{$_l_CurrentElement}:="Jobs"
		CO_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CO_al_ViewTabsStates{$_l_CurrentElement}:=$_l_ModuleAccess
		CO_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CO_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
		CO_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[JOBS:26])
	End if 
	
	
	
	
	
	
	
	
	
	//[PUBLICATIONS]
	//DB_GetModuleSetting(Module_Subscriptions)=Subsciptions
End if 

ARRAY TEXT:C222(CO_at_ViewTabsLabels; $_l_CurrentElement)
ARRAY LONGINT:C221(CO_al_ViewTabsSettings; $_l_CurrentElement)
ARRAY LONGINT:C221(CO_al_ViewTabsStates; $_l_CurrentElement)
ARRAY TEXT:C222(CO_at_ViewTabsFormName; $_l_CurrentElement)
ARRAY TEXT:C222(CO_at_ViewTabsFormSettings; $_l_CurrentElement)
ERR_MethodTrackerReturn("CO_Contexts"; $_t_oldMethodName)