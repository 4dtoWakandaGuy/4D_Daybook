//%attributes = {}
If (False:C215)
	//Project Method Name:      GenExportSubRecordFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:54:01If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ServiceCallsTable; $2; $3)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $1; $4; $5; $6)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GenExportSubRecordFieldNames")
If (Count parameters:C259>=6)
	//this not very generic method
	//(it cannot be generic by the nature of subrecord table structures)
	//exports to a document the subrecords in text format
	
	
	//beginning of the subrecord export to relate the record
	//back to the header record
	$_l_ServiceCallsTable:=Table:C252(->[SERVICE_CALLS:20])
	$_ti_DocumentRef:=Append document:C265($1)
	
	$_ptr_Field:=Field:C253($2; $3)
	//send packet($_ti_DocumentRef;"HeaderID")
	Case of 
			
		: ($2=1)  //CONTACT
			//Case of
			//: ($3=21)  `FURTHERS
			//`send packet($_ti_DocumentRef;"[CONTACTS]FURTHERS'Further Code"+$5)
			//: ($3=22)  `COMPANIES
			//`send packet($_ti_DocumentRef;"[CONTACTS]COMPANIES'Company Code"+$5)
			//`send packet($_ti_DocumentRef;"[CONTACTS]COMPANIES'Address Type")
			//Else
			
			//End case
			
		: ($2=2)  //COMPANIES
			Case of 
				: ($3=28)  //FURTHERS
					
				Else 
					
			End case 
		: ($2=7)  //DOCUMENTS
			Case of 
				: ($3=4)  //BREAK POINTS
					//`send packet($_ti_DocumentRef;"[DOCUMENTS]BREAK POINTS'Break Point")
				Else 
					
			End case 
		: ($2=9)  //PRODUCTS
			//Case of
			//: ($3=21)  `
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'Company Code"+$5)
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'Cost Price"+$5)
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'Margin"+$5)
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'SuppProdCode"+$5)
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'Standard Cost"+$5)
			//`send packet($_ti_DocumentRef;"[PRODUCTS]SUPPLIERS'Lead Days")
			//Else
			
			//End case
		: ($2=11)  //PERSONNEL
			//Case of
			
			//: ($3=Field(->[PERSONNEL]DIARY ACCESS))  `
			//`send packet($_ti_DocumentRef;"[PERSONNEL]DIARY ACCESS'Person")
			//Else
			
			//End case
		: ($2=Table:C252(->[USER:15]))  //
			//Case of
			//: ($3=Field(->[USER]DOWNLOADS))  `USER DOWNLOADS
			//`send packet($_ti_DocumentRef;"[USER]DOWNLOADS'Download_Time")
			//Else
			
			//End case
		: ($2=$_l_ServiceCallsTable)  // SERVICE CALLS
			
			//Case of
			//: ($3=Field(->[SERVICE CALLS]PRODUCTS))
			//`send packet($_ti_DocumentRef;"[SERVICE CALLS]PRODUCTS'Product Code"+$5)
			// PACKET($_ti_DocumentRef;"[SERVICE CALLS]PRODUCTS'Serial No"+$5)
			//`send packet($_ti_DocumentRef;"[SERVICE CALLS]PRODUCTS'Contract Code"+$5)
			//`send packet($_ti_DocumentRef;"[SERVICE CALLS]PRODUCTS'System"+$5)
			//`send packet($_ti_DocumentRef;"[SERVICE CALLS]PRODUCTS'Product Name")
			//Else
			
			//End case
		: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			
			//Case of
			//: ($3=Field(->[TRANS IN]TRANS SUB))
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Trans Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Analysis Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Debit Acc"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Invoice No"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Trans_Date"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Amount"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Tax Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Tax Amount"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Total"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Desc"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Period Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Credit Acc"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Company Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Cheque No"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Debit IO"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Credit IO"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Purch Inv_No"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'UK EC"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Currency Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Layer Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Second Amt"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Purchase Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'Job Code"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'BatchItemID"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'CreditTransID"+$5)
			//send packet($_ti_DocumentRef;"[TRANS IN]TRANS SUB'DebitTransID")
			//Else
			
			//End case
		: ($2=Table:C252(->[ACCOUNTS:32]))  //
			
			//Case of
			//: ($3=Field(->[ACCOUNTS]LAYERS))  `
			//`send packet($_ti_DocumentRef;"[ACCOUNTS]LAYERS'Layer Code")  `   "
			//: ($3=Field(->[ACCOUNTS]ANALYSES))  `
			//`send packet($_ti_DocumentRef;"[ACCOUNTS]ANALYSES'Analysis Code")  `"
			//Else
			
			//End case
		: ($2=Table:C252(->[PURCHASE_INVOICES:37]))  //
			
			//Case of
			//: ($3=Field(->[PURCHASES]ITEMS))  `
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Product Code"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Quantity"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Cost Price"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Cost Amount"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Tax Code"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Tax Amount"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Total Amount"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Purchase Acc"+$5)`
			
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Analysis Code"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Price Per"+$5)
			
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Our Order No"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Item Number"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Description"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Stock Code"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ITEMS'Sales Price")
			
			//: ($3=Field(->[PURCHASES]ALLOCATIONS))
			//
			//`send packet($_ti_DocumentRef;"[PURCHASES]ALLOCATIONS'Purchase Code"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ALLOCATIONS'Amount"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ALLOCATIONS'Date"+$5)
			//`send packet($_ti_DocumentRef;"[PURCHASES]ALLOCATIONS'Purch Inv_No")
			//Else
			
			//End case
		: ($2=Table:C252(->[RECURRING_JOURNALS:38]))  //
			
			//Case of
			//: ($3=Field(->[REC JOURNALS]DATES))  `
			//
			//`send packet($_ti_DocumentRef;"[REC JOURNALS]DATES'Posting Date")
			//
			
			//End case
		: ($2=Table:C252(->[INVOICES:39]))  //
			
			//Case of
			//: ($3=Field(->[INVOICES]ITEMS))
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Product Code"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Product Name"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Quantity"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Sales Price"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Amount"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Tax Code"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Tax Amount"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Total Amount"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Sales Acc"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Analysis Code"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Order Code"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Item Number"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Description"+$5)
			
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Print Desc"+$5)
			
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Cost Amount"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Price Per")
			
			
			//: ($3=Field(->[INVOICES]ALLOCATIONS))  `
			//send packet($_ti_DocumentRef;"[INVOICES]ALLOCATIONS'Invoice No"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ALLOCATIONS'Amount"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ALLOCATIONS'Date"+$5)
			//Else
			
			//End case
			
			
			
		: ($2=Table:C252(->[PURCHASE_ORDERS:57]))  //
			
			//Case of
			
			//: ($3=Field(->[PURCHASE ORDERS]ITEMS))
			//`send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Product Code"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Product Name"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Quantity"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Cost Price"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Cost Amount"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Item Number"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Tax Code"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Purch Inv_No"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Price Code"+$5)
			
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Discount"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Original Cost"+$5)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Price Per"+$5)
			//C_TEXT($TEXT)
			//send packet($_ti_DocumentRef;"[PURCHASE ORDERS]ITEMS'Description"+$5)
			//send packet($_ti_DocumentRef;"[INVOICES]ITEMS'Print Desc")
			
			
			//Else
			
			//End case
			
		Else 
			
	End case 
	
	//send packet($_ti_DocumentRef;$6)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
End if 
ERR_MethodTrackerReturn("GenExportSubRecordFieldNames"; $_t_oldMethodName)