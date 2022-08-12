//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ContactViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   08/03/2011 17:01 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_OpeninNewWindow; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_ParameterValue; $_l_SelectedMenu; $_l_TableNumber; $_l_TabWas; CON_l_CurrentSubArea; CON_l_ParentProcess)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContactViewsTab")
$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005

If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_OpenViews:=True:C214
	$_l_ParameterValue:=Num:C11($_t_MenuItemParameter)
	If ($_l_ParameterValue>0)
		$_l_TabWas:=CON_at_ViewTabsLabels
		CON_at_ViewTabsLabels:=$_l_ParameterValue
	Else 
		$_l_ParameterValue:=9999
	End if 
End if 
If ($_bo_OpenViews)
	$_bo_OpeninNewWindow:=DB_bo_ViewsOption
Else 
	$_bo_OpeninNewWindow:=False:C215
End if 

If ($_bo_OpeninNewWindow)
	If ($_l_ParameterValue=9999)
		$_l_SelectedMenu:=0
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		
	Else 
		
		$_l_TableNumber:=CON_al_ViewTableToTable{CON_at_ViewTabsLabels}
	End if 
	//params are
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			$_l_SelectedMenu:=1
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			$_l_SelectedMenu:=2
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			$_l_SelectedMenu:=3
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			If (CON_at_ViewTabsLabels{CON_at_ViewTabsLabels}="Enquiries")
				$_l_SelectedMenu:=4
			Else 
				$_l_SelectedMenu:=5
			End if 
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			$_l_SelectedMenu:=6
		: ($_l_TableNumber=Table:C252(->[JOBS:26]))
			
			$_l_SelectedMenu:=7
			
			
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
			$_l_SelectedMenu:=8
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			$_l_SelectedMenu:=9
		: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			
			$_l_SelectedMenu:=10
			//: ($_l_TableNumber=Table(->[BOOKINGS]))
		: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
			$_l_SelectedMenu:=11
	End case 
	If ($_l_SelectedMenu>0)
		Contacts_MenV($_l_SelectedMenu)
	End if 
	If ($_l_TabWas>0)
		CON_at_ViewTabsLabels:=$_l_TabWas
	End if 
	
	
	//2=products
	//3price table
	//4=diary
	//etc in the following orders
	//documents
	//enquiries
	//sales orders
	//purchase orders
	//sales ledger
	//purchase leger
	//service calls
	//jobs
	//bookings
	//contracts
	
	
	
Else 
	
	CON_l_CurrentSubArea:=2
	SET PROCESS VARIABLE:C370(CON_l_ParentProcess; CON_l_CurrentSubArea; CON_l_CurrentSubArea)
	
	LBi_RemoveAll(->CON_aptr_LBSetup)
	ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
	CON_SubLPB
	Case of 
		: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=3)  //no edit
			If (CON_al_EditMode{1}=-1)  //already no edit
				CON_at_editMode:=1
				LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode)
			Else 
				LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; True:C214)
			End if 
		Else   // it is editable
			If (CON_al_EditMode{1}=2)  // already edit
				//set the highlight here
				LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode)
			Else 
				LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; True:C214)
			End if 
			
	End case 
	
	
End if 
ERR_MethodTrackerReturn("DB_ContactViewsTab"; $_t_oldMethodName)