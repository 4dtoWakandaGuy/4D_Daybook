//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OrdersViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/03/2011 11:33 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTabs; $_bo_OpenInNewWindow; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_Max; $_l_Number; $_l_Number2; $_l_StartModule; $_l_TableNumber; $_l_TabWas; ORD_l_SelectedViewTabOLD; vCT)
	C_TEXT:C284($_t_MenuBarReference; $_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_OrdersViewsTab")
//TRACE
$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
$_bo_IgnoreTabs:=False:C215
If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_OpenViews:=True:C214
	
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	
	$_l_Max:=3
	
	If ($_l_Number>$_l_Max)
		If ($_l_Number>0)
			$_l_Number2:=$_l_Number-$_l_Max
			$_l_TabWas:=ORD_at_ViewTabsLabels
			ORD_at_ViewTabsLabels:=$_l_Number2
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
		$_l_StartModule:=0
		If (Not:C34($_bo_IgnoreTabs))
			$_l_TableNumber:=ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}
			
		Else 
			Case of 
				: ($_l_Number=1)
					$_l_TableNumber:=Table:C252(->[COMPANIES:2])
				: ($_l_Number=2)
					$_l_TableNumber:=Table:C252(->[CONTACTS:1])
				: ($_l_Number=3)
					$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
				: ($_l_Number=4)
					$_l_TableNumber:=Table:C252(->[SUBSCRIPTIONS:93])
				Else 
					
			End case 
		End if 
		//params are
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_StartModule:=1
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_StartModule:=2
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_StartModule:=3
			: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
				$_l_StartModule:=11
				
				
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_l_StartModule:=5
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				$_l_StartModule:=6
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				$_l_StartModule:=7
			: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
				$_l_StartModule:=8
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				$_l_StartModule:=9
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				$_l_StartModule:=10
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
				$_l_StartModule:=12
				
		End case 
		$_t_MenuBarReference:=Get menu bar reference:C979
		If ($_l_StartModule>0)
			Orders_MenV($_l_StartModule)
		End if 
		SET MENU BAR:C67($_t_MenuBarReference)
		
		If ($_l_TabWas>0)
			ORD_at_ViewTabsLabels:=$_l_TabWas
		End if 
	Else 
		If (FORM Get current page:C276>1)
			ORD_at_OrdersTab:=1
			FORM GOTO PAGE:C247(1)
		End if 
		vCT:=0
		If (ORD_l_SelectedViewTabOLD=1)
			If ([ORDER_ITEMS:25]Order_Code:1#"")
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
		End if 
		Orders_InLPß("P1")
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_OrdersViewsTab"; $_t_oldMethodName)