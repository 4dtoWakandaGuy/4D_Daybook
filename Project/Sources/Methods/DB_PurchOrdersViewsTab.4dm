//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PurchOrdersViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/03/2011 14:26 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_POINumbers; 0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	ARRAY TEXT:C222($_at_PINumbers; 0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTabs; $_bo_OpeninNewWindow; $_bo_OpenViews; DB_bo_ViewsOption)
	C_LONGINT:C283($_l_ParameterValue; $_l_SelectedMenu; $_l_TableNumber; $_l_TabWas; vCT)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PurchOrdersViewsTab")

$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_IgnoreTabs:=False:C215
	$_bo_OpenViews:=True:C214
	$_l_ParameterValue:=Num:C11($_t_MenuItemParameter)
	If ($_l_ParameterValue>2)
		$_l_TabWas:=PO_at_ViewTabsLabels
		PO_at_ViewTabsLabels:=$_l_ParameterValue-2
	Else 
		$_bo_IgnoreTabs:=True:C214
	End if 
End if 
If ($_bo_IgnoreTabs)
	$_bo_OpeninNewWindow:=True:C214
Else 
	If ($_bo_OpenViews)
		$_bo_OpeninNewWindow:=DB_bo_ViewsOption
	Else 
		$_bo_OpeninNewWindow:=False:C215
	End if 
End if 

If ($_bo_OpeninNewWindow)
	$_l_SelectedMenu:=0
	If ($_bo_IgnoreTabs)
		Case of 
			: ($_l_ParameterValue=1)
				$_l_TableNumber:=Table:C252(->[COMPANIES:2])
				
			: ($_l_ParameterValue=2)
				$_l_TableNumber:=Table:C252(->[CONTACTS:1])
		End case 
	Else 
		
		$_l_TableNumber:=PO_al_ViewTableToTable{PO_at_ViewTabsLabels}
	End if 
	//params are
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			DBI_DisplayRecord(0; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_ORDERS:57]Company_Code:1)
			
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			DBI_DisplayRecord(0; Table:C252(->[CONTACTS:1]); ""; [PURCHASE_ORDERS:57]Contact_Code:5)
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57])) | ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			//TRACE
			
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS_ITEMS:169])); Module_PurchaseOrders; ""; ->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
			
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			//TRACE
			
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[ORDER_ITEMS:25]))); Module_PurchaseOrders; ""; ->[ORDER_ITEMS:25]Purchase_Order_Number:18; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
			
			
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8; $_at_PINumbers)
			QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; $_at_PINumbers)
			COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "PISelecton")
			UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))); Module_PurchaseOrders; "PISelecton")
			
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]Item_Number:6; $_al_POINumbers)
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_POINumbers)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
			
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "SISelection")
			
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))); Module_PurchaseOrders; "SISelection")
			
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			//
			
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
			FurthFld_Func2(->[PURCHASE_ORDERS:57])
			
	End case 
	
	If ($_l_TabWas>0)
		PO_at_ViewTabsLabels:=$_l_TabWas
	End if 
	
	
	
	
	
Else 
	
	vCT:=0
	LBi_RemoveAll(->POI_aptr_LBSetup)
	ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
	PurchOrd_InLPß("P1")
	
End if 
ERR_MethodTrackerReturn("DB_PurchOrdersViewsTab"; $_t_oldMethodName)