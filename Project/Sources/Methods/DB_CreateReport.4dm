//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreateReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       15/05/2010 11:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	//ARRAY LONGINT(REF_al_Reporttable;0)
	ARRAY TEXT:C222($_at_FieldTitles; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_ProductNumbers; 0)
	ARRAY TEXT:C222($_at_PurchaseInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderNumbers; 0)
	ARRAY TEXT:C222($_at_SalesOrderNumbers; 0)
	ARRAY TEXT:C222($_at_ServiceCallNumbers; 0)
	//ARRAY TEXT(REP_at_ReportContext;0)
	C_BOOLEAN:C305(<>SR; <>SYS_bo_CurrentWindowModal; $_bo_Ask; $_bo_NoContinue; $_bo_OptionKey; $_bo_ReadOnly; $_bo_Stop; $_bo_UseNS)
	C_LONGINT:C283($_l_AddMode; $_l_CurrentDisplayedForm; $_l_FieldRow; $_l_GotoTableNumber; $_l_Index; $_l_MenuItemParameterNumber; $_l_Number; $_l_TableNumber; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_T_ReportContext)
	C_LONGINT:C283(vAdd; vNo)
	C_POINTER:C301($_ptr_Table; $0; vFilePtr)
	C_TEXT:C284($_t_CurrentOutputform; $_t_LastDocumentName; $_t_MenuItemParameter; $_t_oldMethodName; $_t_Reference; $_t_SelectedContextName; DB_t_CurrentContext; vMTitle2; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreateReport")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
$_bo_NoContinue:=False:C215
If ($_t_MenuItemParameter#"")
	$_l_MenuItemParameterNumber:=Num:C11($_t_MenuItemParameter)
	$_ptr_Table:=Table:C252($_l_MenuItemParameterNumber)
Else 
	If (DB_l_CurrentDisplayedForm>0)
		$_l_MenuItemParameterNumber:=0
		$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
		
	Else 
		$_bo_NoContinue:=True:C214
	End if 
	
End if 
If (Not:C34($_bo_NoContinue))
	$_t_Reference:=""
	
	
	
	//C_POINTER($_Ptr_Table)
	If ($_l_MenuItemParameterNumber=0)
		
		If (Records in set:C195("ListboxSet0")>0)
			CUT NAMED SELECTION:C334($_ptr_Table->; "$NS")
			$_bo_UseNS:=True:C214
			USE SET:C118("ListboxSet0")
		Else 
			COPY NAMED SELECTION:C331($_ptr_Table->; "$NS")
			$_bo_UseNS:=True:C214
		End if 
	End if 
	
	
	
	//ON ERR CALL("Error_Macro")
	vMTitle2:="n/a"
	//TRACE
	
	
	
	
	$_bo_OptionKey:=Gen_Option
	If ((((<>SR) & ($_bo_OptionKey=False:C215)) | ((<>SR=False:C215) & ($_bo_OptionKey)))) & (False:C215)
		SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
		
		READ WRITE:C146([DOCUMENTS:7])
		$_t_CurrentOutputform:=WIN_t_CurrentOutputform
		Reports_FileI
		FORM SET OUTPUT:C54([DOCUMENTS:7]; "Reports_Out")
		WIN_t_CurrentOutputform:="Reports_Out"
		$_l_TableNumber:=Table:C252($_ptr_Table)
		//  $_Ptr_Table:=vFilePtr
		$_l_Number:=DB_l_CurrentDisplayedForm
		vFilePtr:=Table:C252(DB_l_CurrentDisplayedForm)
		$_l_AddMode:=vAdd
		Userset_Empty(->[DOCUMENTS:7])
		
		QUERY:C277([DOCUMENTS:7];  & [DOCUMENTS:7]Document_Code:1="SR@")
		Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
		$_l_Number:=Records in selection:C76([DOCUMENTS:7])
		
		If ($_l_Number=0)
			Open_Pro_Window("Create a SuperReport"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)
			$_t_Reference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
			vAdd:=1
			ADD RECORD:C56([DOCUMENTS:7]; *)
		Else 
			//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];"Reports_Out")
			//$_t_Reference:=""
			//vAdd:=0
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[DOCUMENTS];"Reports_Out")
			//MODIFY SELECTION([DOCUMENTS];*)
			DB_PrintSelectSRReport
		End if 
		
		If ($_t_Reference#"")
			Close_ProWin($_t_Reference)
		Else 
			
			Close_ProWin
		End if 
		
		vAdd:=$_l_AddMode
		vNo:=$_l_Number
		WIN_t_CurrentOutputform:=$_t_CurrentOutputform
		// vFilePtr:=$_Ptr_Table
		Userset_Empty($0)
	Else 
		$_t_LastDocumentName:=DOCUMENT
		$_l_TableNumber:=Table:C252($_ptr_Table)
		$_bo_Ask:=False:C215
		ARRAY TEXT:C222(REP_at_ReportContext; 0)
		ARRAY LONGINT:C221(REF_al_Reporttable; 0)
		
		Case of 
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Transaction Batch")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[TRANSACTION_BATCHES:30]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Transaction Batch items")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Invoices")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[INVOICES:39]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Invoice items")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[INVOICES_ITEMS:161]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Payment Allocations")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[INVOICES_ALLOCATIONS:162]))
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Purchase Invoices")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PURCHASE_INVOICES:37]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Purchase items")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Payment Allocations")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Purchase Orders")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PURCHASE_ORDERS:57]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Purchase order items")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Sales Orders")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[ORDERS:24]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Order items")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[ORDER_ITEMS:25]))
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Service calls")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[SERVICE_CALLS:20]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Service call products")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Products")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PRODUCTS:9]))
				
				APPEND TO ARRAY:C911(REP_at_ReportContext; "Product suppliers")
				APPEND TO ARRAY:C911(REF_al_Reporttable; Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				
		End case 
		//TRACE
		$_bo_Stop:=False:C215
		$_l_GotoTableNumber:=$_l_TableNumber
		If (Size of array:C274(REP_at_ReportContext)>0)
			$_l_FieldRow:=Find in array:C230(REF_al_Reporttable; $_l_TableNumber)
			$_t_SelectedContextName:=Gen_RequestWithList("Which context do you need to report from?"; REP_at_ReportContext{$_l_FieldRow}; "Continue"; "Stop"; 0; 0; "Report Requirements"; 0; ""; "REP_at_ReportContext")
			If ($_t_SelectedContextName#"") & (OK=1)
				$_l_FieldRow:=Find in array:C230(REP_at_ReportContext; $_t_SelectedContextName)
				If ($_l_FieldRow>0)
					$_l_GotoTableNumber:=REF_al_Reporttable{$_l_FieldRow}
				Else 
					$_bo_Stop:=True:C214
				End if 
				
			Else 
				$_bo_Stop:=True:C214
			End if 
		End if 
		OK:=1
		If ($_bo_Stop=False:C215)
			If ($_l_TableNumber#$_l_GotoTableNumber)
				Case of 
					: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
						If ($_l_GotoTableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
							SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
							QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
							$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
						End if 
						
					: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
						SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[INVOICES_ITEMS:161]))
								QUERY WITH ARRAY:C644([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
								$_l_TableNumber:=Table:C252(->[INVOICES_ITEMS:161])
								CREATE SET:C116([INVOICES_ITEMS:161]; "$Temp")
								$_bo_ReadOnly:=Read only state:C362([INVOICES_ITEMS:161])
								READ WRITE:C146([INVOICES_ITEMS:161])
								QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Company_Code:20="")
								If (Records in selection:C76([INVOICES_ITEMS:161])>0)
									For ($_l_Index; 1; Records in selection:C76([INVOICES_ITEMS:161]))
										If ([INVOICES:39]Invoice_Number:1#[INVOICES_ITEMS:161]INVOICES_CODE:18)
											QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[INVOICES_ITEMS:161]INVOICES_CODE:18)
										End if 
										[INVOICES_ITEMS:161]Company_Code:20:=[INVOICES:39]Company_Code:2
										SAVE RECORD:C53([INVOICES_ITEMS:161])
										NEXT RECORD:C51([INVOICES_ITEMS:161])
									End for 
								End if 
								UNLOAD RECORD:C212([INVOICES_ITEMS:161])
								If ($_bo_ReadOnly)
									READ ONLY:C145([INVOICES_ITEMS:161])
								End if 
								USE SET:C118("$temp")
								
							: ($_l_GotoTableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
								QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumbers)
								$_l_TableNumber:=Table:C252(->[INVOICES_ALLOCATIONS:162])
								CREATE SET:C116([INVOICES_ALLOCATIONS:162]; "$Temp")
								$_bo_ReadOnly:=Read only state:C362([INVOICES_ALLOCATIONS:162])
								READ WRITE:C146([INVOICES_ALLOCATIONS:162])
								QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Company_Code:7="")
								If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>0)
									For ($_l_Index; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
										If ([INVOICES:39]Invoice_Number:1#[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6)
											QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6)
										End if 
										[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
										SAVE RECORD:C53([INVOICES_ALLOCATIONS:162])
										NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
										
									End for 
								End if 
								UNLOAD RECORD:C212([INVOICES_ALLOCATIONS:162])
								If ($_bo_ReadOnly)
									READ ONLY:C145([INVOICES_ALLOCATIONS:162])
								End if 
								USE SET:C118("$temp")
								GET FIELD TITLES:C804([INVOICES_ALLOCATIONS:162]; $_at_FieldTitles; $_al_FieldNumbers)
								$_l_FieldRow:=Find in array:C230($_at_FieldTitles; "Parent_record_code")
								If ($_l_FieldRow>0)
									$_at_FieldTitles{$_l_FieldRow}:="InvoiceNo"
								End if 
								$_l_FieldRow:=Find in array:C230($_at_FieldTitles; "Invoice No")
								If ($_l_FieldRow>0)
									$_at_FieldTitles{$_l_FieldRow}:="Related_InvoiceNo"
								End if 
								SET FIELD TITLES:C602([INVOICES_ALLOCATIONS:162]; $_at_FieldTitles; $_al_FieldNumbers)
								
						End case 
						
						
					: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
						SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseInvoiceNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
								QUERY WITH ARRAY:C644([PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17; $_at_PurchaseInvoiceNumbers)
								$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
							: ($_l_GotoTableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
								QUERY WITH ARRAY:C644([PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6; $_at_PurchaseInvoiceNumbers)
								$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159])
						End case 
						
						
					: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
						SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
								QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderNumbers)
								$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
								
						End case 
						
						
					: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
						SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_SalesOrderNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[ORDER_ITEMS:25]))
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_SalesOrderNumbers)
								$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
								
						End case 
						
					: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
						SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Call_Code:4; $_at_ServiceCallNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
								QUERY WITH ARRAY:C644([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_ServiceCallNumbers)
								$_l_TableNumber:=Table:C252(->[SERVICE_CALLS_PRODUCTS:152])
								
								
						End case 
						
					: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
						SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductNumbers)
						Case of 
							: ($_l_GotoTableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
								QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductNumbers)
								$_l_TableNumber:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
								
								
						End case 
						
				End case 
				
				
			End if 
			//TRACE
			//AUTOMATIC RELATIONS(False;False)
			If ($_l_TableNumber#Table:C252(->[CONTACTS:1]))
				SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
			End if 
			
			<>SYS_bo_CurrentWindowModal:=True:C214
			//Gen_PallHide
			$_ptr_Table:=Table:C252($_l_TableNumber)
			$_t_LastDocumentName:=DOCUMENT
			$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
			DB_l_CurrentDisplayedForm:=Table:C252($_ptr_Table)
			DB_T_ReportContext:=0
			If ((((<>SR) & ($_bo_OptionKey=False:C215)) | ((<>SR=False:C215) & ($_bo_OptionKey))))
				DB_l_ReportType:=SuperReportReport Template
				
			Else 
				DB_l_ReportType:=SuperWrite Report Template
			End if 
			DIALOG:C40("DB_QR_Editor")
			DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
			DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
			//QR REPORT($_ptr_Table->;Char(1);False;False;False)
			If ($_t_LastDocumentName#DOCUMENT)
				
			End if 
			//Gen_PallShow
			<>SYS_bo_CurrentWindowModal:=False:C215
		End if 
		SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		If ($_bo_UseNS)
			USE NAMED SELECTION:C332("$NS")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_CreateReport"; $_t_oldMethodName)