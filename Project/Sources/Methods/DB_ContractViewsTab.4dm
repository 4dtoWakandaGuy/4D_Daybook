//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ContractViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      09/03/2011 13:42 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(CONT_al_ViewTabsSettings;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY POINTER(SVS_lb_ItemsSetup;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTabs; $_bo_OpenInNewWindows; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_MenuParameterNUM; $_l_SelectedMenu; $_l_TableNumber; $_l_TabWas; CON_l_editMode; vCT)
	C_PICTURE:C286(CON_pic_ModePict)
	C_TEXT:C284($_t_Function; $_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContractViewsTab")

$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
$_bo_IgnoreTabs:=True:C214
If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_OpenViews:=True:C214
	
	$_l_MenuParameterNUM:=Num:C11($_t_MenuItemParameter)
	If ($_l_MenuParameterNUM>2)
		If ($_l_MenuParameterNUM>0)
			$_l_MenuParameterNUM:=$_l_MenuParameterNUM-2
			$_l_TabWas:=CONT_at_ViewTabsLabels
			CONT_at_ViewTabsLabels:=$_l_MenuParameterNUM
		End if 
		If ($_bo_OpenViews)
			$_bo_OpenInNewWindows:=DB_bo_ViewsOption
		Else 
			$_bo_OpenInNewWindows:=False:C215
		End if 
	Else 
		$_bo_IgnoreTabs:=True:C214
		$_bo_OpenInNewWindows:=True:C214
	End if 
	
	
	If ($_bo_OpenInNewWindows)
		$_l_SelectedMenu:=0
		If (Not:C34($_bo_IgnoreTabs))
			$_l_TableNumber:=CON_al_ViewTableToTable{CON_at_ViewTabsLabels}
		Else 
			$_l_TableNumber:=$_l_MenuParameterNUM
		End if 
		//params are
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_SelectedMenu:=1
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_SelectedMenu:=2
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_l_SelectedMenu:=3
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				
				$_l_SelectedMenu:=4
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_l_SelectedMenu:=6
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				
				$_l_SelectedMenu:=7
				
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_l_SelectedMenu:=8
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_l_SelectedMenu:=9
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				
				$_l_SelectedMenu:=10
				
				
		End case 
		If ($_l_SelectedMenu>0)
			Contracts_MenV($_l_SelectedMenu)
		End if 
		If ($_l_TabWas>0)
			CON_at_ViewTabsLabels:=$_l_TabWas
		End if 
		
		
	Else 
		//if the tab item is contact or company
		
		
		vCT:=0
		
		$_t_Function:="P"+String:C10(1)
		// there could be saving to do?
		If ([ORDER_ITEMS:25]Description:44#"")
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
		
		LBi_RemoveAll(->SVS_aptr_ListboxSetup)
		ARRAY POINTER:C280(SVS_aptr_ListboxSetup; 0)
		Contracts_inLPß($_t_Function)
		
		Case of 
			: (CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels}=3)  //no edit
				If (CON_al_EditMode{1}=-1)  //already no edit
					
					CON_l_editMode:=1
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode; True:C214)
				End if 
				
			Else   // it is editable
				If (COn_al_EditMode{1}=2)  // already edit
					//set the highlight here
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode; True:C214)
				End if 
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DB_ContractViewsTab"; $_t_oldMethodName)