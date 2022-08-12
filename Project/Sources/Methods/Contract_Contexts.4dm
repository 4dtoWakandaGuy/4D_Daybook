//%attributes = {}
If (False:C215)
	//Project Method Name:      Contract_Contexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     28/11/2010 20:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CONT_al_DocIncludes;0)
	//ARRAY LONGINT(CONT_AL_FormIDs;0)
	//ARRAY LONGINT(CONT_al_TabIds;0)
	//ARRAY LONGINT(CONT_al_TabIncludes;0;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(CONT_al_ViewTabsSettings;0)
	//ARRAY LONGINT(CONT_al_ViewTabsState;0)
	//ARRAY TEXT(CONT_at_TabNames;0)
	//ARRAY TEXT(CONT_at_ViewTabsFormName;0)
	//ARRAY TEXT(CONT_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_AddDocuments; CONT_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CurrentElement; $_l_Index; $_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Contract_Contexts")
//mod<2 no access
//mod=2=read write
//mod =3` read only
ARRAY TEXT:C222(CONT_at_ViewTabsLabels; 150)
ARRAY LONGINT:C221(CONT_al_ViewTabsSettings; 150)
ARRAY LONGINT:C221(CONT_al_ViewTabsState; 150)
ARRAY TEXT:C222(CONT_at_ViewTabsFormName; 150)
ARRAY TEXT:C222(CONT_at_ViewTabsFormSettings; 150)
ARRAY LONGINT:C221(CONT_al_ViewTableToTable; 150)
ARRAY TEXT:C222(CONT_at_TabNames; 0)
ARRAY LONGINT:C221(CONT_al_TabIds; 0)
ARRAY LONGINT:C221(CONT_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(CONT_al_DocIncludes; 0)
$_l_CurrentElement:=0
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))  //Sales Orders
If ($_l_ModuleAccess>1)
	$_l_CurrentElement:=$_l_CurrentElement+1
	CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Supported Products"
	CONT_al_ViewTabsSettings{$_l_CurrentElement}:=0  //no on screen edit
	CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
	CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Items_in"
	CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="02509"
	CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDER_ITEMS:25])
End if 

If ($_l_ModuleAccess>1)
	$_l_CurrentElement:=$_l_CurrentElement+1
	CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Contract Billing"
	CONT_al_ViewTabsSettings{$_l_CurrentElement}:=0  //no on screen edit
	CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
	CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Order_In"
	CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="02509"
	CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
End if 

If (CONT_bo_FurtherFieldsLoaded)  //This is set to true in the method Companies_InLPB
	$_l_CurrentElement:=$_l_CurrentElement+1
	
	CONT_at_ViewTabsLabels{$_l_CurrentElement}:=" Further Fields "
	CONT_al_ViewTabsSettings{$_l_CurrentElement}:=0  //edit on screen
	CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
	CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contact_In"
	CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
	CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[CUSTOM_FIELDS:98])
End if 


If (True:C214)
	If (True:C214)
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			ARRAY TEXT:C222(CONT_at_TabNames; 0)
			ARRAY LONGINT:C221(CONT_al_TabIds; 0)
			ARRAY LONGINT:C221(CONT_AL_FormIDs; 0)
			ARRAY LONGINT:C221(CONT_al_TabIncludes; 0; 0)
			ARRAY LONGINT:C221(CONT_al_DocIncludes; 0)
			SD2_LoadTabSetting(True:C214; Table:C252(->[CONTRACTS:17]); ->CONT_at_TabNames; ->CONT_al_TabIncludes; ->CONT_al_DocIncludes; ->CONT_al_TabIds; ->CONT_Al_FormIDs)
			SD2_LoadActionGroups
			If (Size of array:C274(CONT_at_TabNames)>0)
				$_bo_AddDocuments:=False:C215
				For ($_l_Index; 1; Size of array:C274(CONT_at_TabNames))
					$_l_CurrentElement:=$_l_CurrentElement+1
					CONT_at_ViewTabsLabels{$_l_CurrentElement}:=CONT_at_TabNames{$_l_Index}
					CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
					CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
					CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="3"
					CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
					If (CONT_al_DocIncludes{$_l_Index}=0)
						$_bo_AddDocuments:=True:C214
					End if 
				End for 
				If ($_bo_AddDocuments)  // at least one tab does not show documents
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					If ($_l_ModuleAccess>1)
						$_l_CurrentElement:=$_l_CurrentElement+1
						CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
						CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
						CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
						CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
						CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
						CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
						
					End if 
				End if 
				
			Else 
				$_l_CurrentElement:=$_l_CurrentElement+1
				CONT_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
				CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
				CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
				CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contact_In"  //NG April 2004 Removed ◊Screen
				CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="3"
				CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				If ($_l_ModuleAccess>1)
					$_l_CurrentElement:=$_l_CurrentElement+1
					CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
					CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
					CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
					CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contact_In"
					CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="3"
					CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
					
				End if 
			End if 
		End if 
	Else 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CONT_at_ViewTabsLabels{$_l_CurrentElement}:="   Diary   "
			CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"  //NG April 2004 Removed ◊Screen
			CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="00103"
			CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DIARY:12])
		End if 
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Documents"
			CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
			CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[DOCUMENTS:7])  //we resolve this to diary
			
		End if 
	End if 
	
	If (False:C215)  //Need to populate a data update to activate this
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase orders `This will be related by the order items
		//This would only show pos where the Po relates to an order item in the contract schedule NOT to orders items BILLED to the customer as a result of providing support on this contract
		//because there is current NO relation between a service and call and a resulting order(or invoice)
		//Support plan DO have this relation but only because the  Service call number(R number) and the Order number are the same!!
		//I have now added on the field to the database but will need to populate it
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Purchase Orders"
			CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
			CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[PURCHASE_ORDERS:57])
		End if 
		
		
		$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales Invoices. These will be related via the order items see above
		If ($_l_ModuleAccess>1)
			$_l_CurrentElement:=$_l_CurrentElement+1
			CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Invoices"
			CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
			CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
			CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
			CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="0010"+String:C10(3+Num:C11(SYS_t_AccessType="Q"))
			CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[INVOICES:39])
		End if 
		
	End if 
	
	
	
	//[SERVICE CALLS]
	$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))  //Contracts/Service Calls
	If ($_l_ModuleAccess>1)
		$_l_CurrentElement:=$_l_CurrentElement+1
		CONT_at_ViewTabsLabels{$_l_CurrentElement}:="Service Calls"
		CONT_al_ViewTabsSettings{$_l_CurrentElement}:=3  //no on screen edit
		CONT_al_ViewTabsState{$_l_CurrentElement}:=$_l_ModuleAccess
		CONT_at_ViewTabsFormName{$_l_CurrentElement}:="Contacts_InN"+"13"
		CONT_at_ViewTabsFormSettings{$_l_CurrentElement}:="3"
		CONT_al_ViewTableToTable{$_l_CurrentElement}:=Table:C252(->[SERVICE_CALLS:20])
	End if 
End if 

ARRAY TEXT:C222(CONT_at_ViewTabsLabels; $_l_CurrentElement)
ARRAY LONGINT:C221(CONT_al_ViewTabsSettings; $_l_CurrentElement)
ARRAY LONGINT:C221(CONT_al_ViewTabsState; $_l_CurrentElement)
ARRAY TEXT:C222(CONT_at_ViewTabsFormName; $_l_CurrentElement)
ARRAY TEXT:C222(CONT_at_ViewTabsFormSettings; $_l_CurrentElement)
ERR_MethodTrackerReturn("Contract_Contexts"; $_t_oldMethodName)