//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_InvoicesViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/03/2011 19:16 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTabs; $_bo_OpenInNewWindow; $_bo_OpenViews; DB_bo_ViewsOption; INV_bo_Addingitem)
	C_LONGINT:C283($_l_MenuOption; $_l_Number; $_l_TableNumber; $_l_TabWas; vCT)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_InvoicesViewsTab")
$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
$_bo_IgnoreTabs:=True:C214
If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_OpenViews:=True:C214
	
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	If ($_l_Number>5)
		If ($_l_Number>0)
			//$_l_Number:=$_l_Number-5
			$_l_TabWas:=INV_at_ViewTabsLabels
			INV_at_ViewTabsLabels:=$_l_Number-5
		End if 
		If ($_bo_OpenViews)
			$_bo_OpenInNewWindow:=DB_bo_ViewsOption
		Else 
			$_bo_OpenInNewWindow:=False:C215
		End if 
	Else 
		$_bo_IgnoreTabs:=True:C214
		$_bo_OpenInNewWindow:=True:C214
	End if 
	If ($_bo_OpenInNewWindow)
		$_l_MenuOption:=0
		If (Not:C34($_bo_IgnoreTabs))
			$_l_TableNumber:=INV_al_ViewTableToTable{INV_at_ViewTabsLabels}
			
		Else 
			Case of 
				: ($_l_Number=1)
					$_l_TableNumber:=Table:C252(->[COMPANIES:2])
				: ($_l_Number=2)
					$_l_TableNumber:=Table:C252(->[CONTACTS:1])
				: ($_l_Number=3)
					$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
				: ($_l_Number=4)
					$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
				: ($_l_Number=5)  //Allocations
					$_l_TableNumber:=Table:C252(->[INVOICES:39])
				Else 
					
					$_l_TableNumber:=INV_al_ViewTableToTable{INV_at_ViewTabsLabels}
			End case 
		End if 
		//params are
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_MenuOption:=1
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_MenuOption:=2
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_MenuOption:=3
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				$_l_MenuOption:=4
				
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				If ($_l_Number=5)
					$_l_MenuOption:=5
				Else 
					//invoice items
					$_l_MenuOption:=13
					
				End if 
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				
				$_l_MenuOption:=7
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				$_l_MenuOption:=8
				//e=Table(->[DOCUMENTS]))
				//$_l_MenuOption:=8
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_l_MenuOption:=9
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				$_l_MenuOption:=12
			: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
				$_l_MenuOption:=13
				
		End case 
		If ($_l_MenuOption>0)
			Invoices_MenV($_l_MenuOption)
		End if 
		If ($_l_TabWas>0)
			INV_at_ViewTabsLabels:=$_l_TabWas
		End if 
	Else 
		vCT:=0
		If (INV_bo_Addingitem)
			DB_SaveRecord(->[INVOICES_ITEMS:161])
		End if 
		LBi_RemoveAll(->INV_aptr_ListboxSetup)
		ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
		Invoices_InLPß("P1")
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_InvoicesViewsTab"; $_t_oldMethodName)