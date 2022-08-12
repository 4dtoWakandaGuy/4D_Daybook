//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJUNK_4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>LB_al_FormTables;0)
	//ARRAY TEXT(<>DB_at_LBViews;0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; $0; <>LB_bo_LayoutsInited; <>PER_bo_LbDefinitiionsInited)
	C_LONGINT:C283($_l_TableNumber; $_l_TableRow; $1; $_l_ArraySize; $_l_TableNumber; $_l_TableRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAJUNK_4")

//NG this new method changes the way we use the arrays
//◊ALLayouts
//◊aALLayouts,◊FUR_at_CustomFieldNames,◊FUR_at_CustomFieldTypes,◊FUR_at_CustomFieldFormat
If (Count parameters:C259>0)
	While (Semaphore:C143("$Inserting"+"◊aALLayouts"))
		DelayTicks
	End while 
	If (Not:C34(<>LB_bo_LayoutsInited))
		ARRAY LONGINT:C221(<>LB_al_FormTables; 0)
		<>LB_bo_LayoutsInited:=True:C214
	End if 
	If (<>PER_bo_LbDefinitiionsInited)
		If (Count parameters:C259>=1)
			$_l_TableNumber:=$1
			$_l_TableRow:=Find in array:C230(<>LB_al_FormTables; $_l_TableNumber)  //
			If ($_l_TableRow<0)
				APPEND TO ARRAY:C911(<>LB_al_FormTables; $_l_TableNumber)
				$_l_TableRow:=Size of array:C274(<>LB_al_FormTables)
			End if 
		End if 
		If (Size of array:C274(<>DB_at_LBViews)<$_l_TableRow)  //This SHOULD never need to insert more than one element but just in case
			Repeat 
				$_l_ArraySize:=Size of array:C274(<>DB_at_LBViews)
				INSERT IN ARRAY:C227(<>DB_at_LBViews; $_l_ArraySize+1; 1)
			Until (Size of array:C274(<>DB_at_LBViews)>=$_l_TableRow)
		End if 
		If (Size of array:C274(<>DB_at_LBViews{$_l_TableRow})=0)
			Case of 
				: ($1=1)  //Contacts
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Contacts"; "QA View Contacts"; "Contacts_Incl"; "QA Contacts_Incl")
				: ($1=2)  //companies
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Companies"; "QA View Companies"; "Furthers Incl")
				: ($1=9)  //Products
					
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Products"; "QA View Products"; "Suppliers Incl"; "View Products")
				: ($1=9)  //Diary
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Diary"; "QA View Diary"; "Enquirers Incl"; ""; ""; ""; ""; "View Diary"; "View Documents"; ""; "View Diary"; "View Workflow")
				: ($1=19)  //contracts
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; "View Contracts")
				: ($1=20)  //service calls
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; "View Service Calls")
				: ($1=24)  //sales orders
					
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Orders"; "QA View Orders"; "Enquirers Incl"; ""; ""; ""; ""; "View Enquiries"; "View Orders")
				: ($1=25)  //sales order items
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Order Items"; "QA View Order Items"; "Order Items Incl"; "QA Order Items Incl"; "Enquiry Items Incl"; "QA Enq Items Incl"; "Enquirers Incl")
				: ($1=26)  //Jobs
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; "View Jobs")
					
					//ARRAY STRING(19;◊aALLayouts{27};0)
					//LBI_ArrayFillT (»◊aALLayouts{27};"View Stock Items";"QA View Stock Items"
					//;"Stock Items Incl";"QA Stock Items Incl")
				: ($1=30)  //trans batch
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Trans Batches"; "QA View Trans Batch"; "Trans Journal Items"; "QA Trans Journal It")
				: ($1=37)  //Purchase Invoices
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Purch Ledger"; "QA View PurchLedger"; "PL Items Incl"; "QA PL Items Incl"; "Payment")
					
				: ($1=41)  //events
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; ""; "Events")
					
				: ($1=42)  //attendees
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; "Attenders")
					
					
					ARRAY TEXT:C222(<>DB_at_LBViews{39}; 0)
				: ($1=39)  //attendees
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Sales Ledger"; "QA View SalesLedger"; "SL Items Incl"; "QA SL Items Incl"; "Receipt"; "Invoices")
				: ($1=55)  //attendees
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Infomation"; "Companies_Incl"; "Applic Incl"; "Enquirers Incl")
				: ($1=57)  //Purchase orders
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; "View Purchase Orders"; "QA View PurchOrders"; "PO Items Incl"; "QA PO Items Incl"; "Purchase Orders")
				: ($1=64)  //Bookings
					LBi_ArrayFillT(-><>DB_at_LBViews; $_l_TableRow; ""; "View Bookings")
					
					
			End case 
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$Inserting"+"◊aALLayouts")
End if 
ERR_MethodTrackerReturn("AAJUNK_4"; $_t_oldMethodName)
