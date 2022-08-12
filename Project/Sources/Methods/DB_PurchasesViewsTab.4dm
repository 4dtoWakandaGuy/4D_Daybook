//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PurchasesViewsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     14/03/2011 15:40 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	ARRAY TEXT:C222($_at_PurchaseOrderNos; 0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_IgnoreTabs; $_bo_OpenInNewWindow; $_bo_OpenViews; DB_bo_ViewsOption; PI_bo_Addingitem)
	C_LONGINT:C283($_l_Number; $_l_TableNumber; $_l_TabWas; vCT)
	C_TEXT:C284($_t_FirstChar; $_t_MenuItemParameter; $_t_oldMethodName; $_t_SecondChar)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PurchasesViewsTab")

$_bo_OpenViews:=False:C215
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_TabWas:=0
	$_bo_IgnoreTabs:=False:C215
	$_bo_OpenViews:=True:C214
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	If ($_l_Number>4)
		$_l_TabWas:=PI_at_ViewTabsLabels
		PI_at_ViewTabsLabels:=$_l_Number-4
	Else 
		$_bo_IgnoreTabs:=True:C214
	End if 
End if 
If ($_bo_IgnoreTabs)
	$_bo_OpenInNewWindow:=True:C214
Else 
	If ($_bo_OpenViews)
		$_bo_OpenInNewWindow:=DB_bo_ViewsOption
	Else 
		$_bo_OpenInNewWindow:=False:C215
	End if 
End if 

If ($_bo_OpenInNewWindow)
	//$SM:=0
	If ($_bo_IgnoreTabs)
		Case of 
			: ($_l_Number=1)
				$_l_TableNumber:=Table:C252(->[COMPANIES:2])
				
			: ($_l_Number=2)
				$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
			: ($_l_Number=3)
				$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
				
			: ($_l_Number=4)
				$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICES:37])
		End case 
	Else 
		
		$_l_TableNumber:=PI_al_ViewTableToTable{PI_at_ViewTabsLabels}
	End if 
	//params are
	Case of 
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
			FurthFld_Func2(->[PURCHASE_INVOICES:37])
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			DBI_DisplayRecord(0; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_INVOICES:37]Company_Code:2)
			
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			If ([PURCHASE_INVOICE_ITEMS:158]Product_Code:1#"")
				DBI_DisplayRecord(0; Table:C252(->[PRODUCTS:9]); ""; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
			End if 
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			If ($_l_Number=4)
				Purchases_Alloc
			Else 
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))); Module_PurchaseLedger; ""; ->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17; [PURCHASE_INVOICES:37]Purchase_Code:1)
			End if 
			
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
				$_t_FirstChar:=[PURCHASE_INVOICES:37]Purchase_Code:1[[1]]
				If (Length:C16([PURCHASE_INVOICES:37]Purchase_Code:1)>1)
					$_t_SecondChar:=[PURCHASE_INVOICES:37]Purchase_Code:1[[2]]
				Else 
					$_t_SecondChar:=""
				End if 
				If ($_t_SecondChar#"S")
					DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30]))); Module_PurchaseLedger; ""; ->[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22; [PURCHASE_INVOICES:37]Purchase_Code:1)
					
					
					//ZProc ("TransB_Mod";◊K2;"View Batches";"0";"";[PURCHASES]Purchase Code)
				Else 
					Gen_Alert("Batches Must be viewed from the invoice or deposit")
					
					
				End if 
				
			End if 
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
			SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderNos)
			QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNos)
			COPY NAMED SELECTION:C331([PURCHASE_ORDERS:57]; "PoSelecton")
			UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); Module_PurchaseLedger; "PoSelecton")
			
			
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			//
			
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			
			
			
			
	End case 
	
	If ($_l_TabWas>0)
		PI_at_ViewTabsLabels:=$_l_TabWas
	End if 
	
	
	
	
	
Else 
	
	vCT:=0
	If (PI_bo_Addingitem)
		[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
		DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
	End if 
	PI_bo_Addingitem:=False:C215
	LBi_RemoveAll(->PUR_aPtr_LBItemsSetup)
	ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
	Purch_InLPß("P1")
	
	
End if 
ERR_MethodTrackerReturn("DB_PurchasesViewsTab"; $_t_oldMethodName)