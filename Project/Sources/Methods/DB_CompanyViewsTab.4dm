//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CompanyViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:          27/01/2011 14:46 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(COM_al_EditMode;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	//ARRAY TEXT(COM_at_editMode;0)
	C_BOOLEAN:C305($_bo_OpenInNewWindow; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_Bracketposition; $_l_index; $_l_Paramter; $_l_SelectedMenu; $_l_TableNumber; $_l_TabWas; vCT)
	C_PICTURE:C286(COM_Pi_EditMode)
	C_TEXT:C284($_t_execute; $_t_MenuItemParameter; $_t_oldMethodName; $_t_Tab; $_t_Tab2; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CompanyViewsTab")
If (FORM Get current page:C276<5)
	$_bo_OpenViews:=False:C215
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
	If ($_t_MenuItemParameter#"")
		$_l_TabWas:=0
		$_bo_OpenViews:=True:C214
		$_l_Paramter:=Num:C11($_t_MenuItemParameter)
		If ($_l_Paramter>0)
			$_l_TabWas:=CO_at_ViewTabsLabels
			CO_at_ViewTabsLabels:=$_l_Paramter
		End if 
	End if 
	If ($_bo_OpenViews)
		$_bo_OpenInNewWindow:=DB_bo_ViewsOption
	Else 
		$_bo_OpenInNewWindow:=False:C215
	End if 
	
	If ($_bo_OpenInNewWindow)
		$_l_SelectedMenu:=0
		$_l_TableNumber:=CO_al_ViewTableToTable{CO_at_ViewTabsLabels}
		//params are
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_SelectedMenu:=1
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_SelectedMenu:=2
			: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
				$_l_SelectedMenu:=3
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_l_SelectedMenu:=4
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				$_l_SelectedMenu:=5
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				//enquirites or orders
				If (CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}="Enquiries")
					$_l_SelectedMenu:=6
				Else 
					$_l_SelectedMenu:=7
				End if 
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				$_l_SelectedMenu:=8
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				$_l_SelectedMenu:=9
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				$_l_SelectedMenu:=10
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				$_l_SelectedMenu:=11
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_l_SelectedMenu:=12
				//: ($_l_TableNumber=Table(->[BOOKINGS]))
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_l_SelectedMenu:=14
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				$_l_SelectedMenu:=15
		End case 
		If ($_l_SelectedMenu>0)
			Companies_MenV($_l_SelectedMenu)
		End if 
		If ($_l_TabWas>0)
			CO_at_ViewTabsLabels:=$_l_TabWas
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
		If (FORM Get current page:C276>1)
			COM_at_CompanyTab:=1
			DB_CompanyTab
		End if 
		vCT:=0
		
		$_t_execute:="P"+String:C10(1)
		// there could be saving to do?
		If ([CONTACTS:1]Forename:4#"")
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		
		LBi_RemoveAll(->COM_aptr_LBItemsSetup)
		ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
		Companies_InLPß($_t_execute)
		Case of 
			: (CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}=3)  //no edit
				If (COM_al_EditMode{1}=-1)  //already no edit
					
					COM_at_editMode:=1
					LBi_EditListLay(->COM_aptr_LBItemsSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode)
				Else 
					LBi_EditListLay(->COM_aptr_LBItemsSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode; True:C214)
				End if 
			Else   // it is editable
				If (COM_al_EditMode{1}=2)  // already edit
					//set the highlight here
					LBi_EditListLay(->COM_aptr_LBItemsSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode)
				Else 
					LBi_EditListLay(->COM_aptr_LBItemsSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode; True:C214)
				End if 
				
		End case 
		
		
		$_t_Tab:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
		Repeat 
			If ($_t_Tab[[1]]=" ")
				$_t_Tab:=Substring:C12($_t_Tab; 2)
			End if 
		Until ($_t_Tab[[1]]#" ")
		$_l_Bracketposition:=Position:C15("("; $_t_Tab)
		If ($_l_Bracketposition>0)
			$_t_Tab:=Substring:C12($_t_Tab; 1; $_l_Bracketposition-1)
		End if 
		DB_SetInputFormMenu(Table:C252(->[COMPANIES:2]); WIN_t_CurrentInputForm; $_t_Tab)
		If (Size of array:C274(CO_at_ViewTabsLabels)>0)
			$_t_Tab:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
			If ($_t_Tab#"")
				Repeat 
					If ($_t_Tab[[1]]=" ")
						$_t_Tab:=Substring:C12($_t_Tab; 2)
					End if 
				Until ($_t_Tab[[1]]#" ")
				For ($_l_index; 1; Size of array:C274(CO_at_ViewTabsLabels))
					If (CO_at_ViewTabsLabels#$_l_index)
						$_t_Tab2:=CO_at_ViewTabsLabels{$_l_index}
						Repeat 
							If ($_t_Tab2[[1]]=" ")
								$_t_Tab2:=Substring:C12($_t_Tab2; 2)
							End if 
						Until ($_t_Tab2[[1]]#" ")
						DB_MenuAction("View"; $_t_Tab2; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				End for 
				DB_MenuAction("View"; $_t_Tab; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		
	End if 
Else 
	If (FORM Get current page:C276=5)
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_CompanyViewsTab"; $_t_oldMethodName)