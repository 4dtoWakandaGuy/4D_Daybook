//%attributes = {}
If (False:C215)
	//Project Method Name:      GenImportSubRecordFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ServiceCallsTable; $0; $2; $3; $7)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $1; $4; $5; $6; GEn_T_ReceiveSubRecord; GEn_T_ReceiveSubRecord2; GEn_T_ReceiveSubReocrd)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GenImportSubRecordFieldNames")
If (Count parameters:C259>=6)
	//this not very generic method
	//(it cannot be generic by the nature of subrecord table structures)
	//Imports from a document the subrecords in text format
	//beginning of the subrecord export to relate the record
	//back to the header record
	$_l_ServiceCallsTable:=Table:C252(->[SERVICE_CALLS:20])
	$_ti_DocumentRef:=DB_OpenDocument($1)
	SET DOCUMENT POSITION:C482($_ti_DocumentRef; $7; 1)
	GEn_T_ReceiveSubReocrd:=""
	GEn_T_ReceiveSubRecord2:=""
	$_ptr_Field:=Field:C253($2; $3)
	RECEIVE PACKET:C104($_ti_DocumentRef; GEn_T_ReceiveSubRecord; Length:C16("HeaderID"))
	Case of 
			
		: ($2=7)  //DOCUMENTS
			Case of 
				: ($3=4)  //BREAK POINTS
					//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[DOCUMENTS]BREAK POINTS'Break Point"))
					//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
				Else 
			End case 
		: ($2=9)  //PRODUCTS
			//Case of
			//: ($3=21)  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'Company Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'Cost Price"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'Margin"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'SuppProdCode"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'Standard Cost"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PRODUCTS]SUPPLIERS'Lead Days"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//Else
			
			//End case
		: ($2=11)  //PERSONNEL
			//Case of
			
			//: ($3=Field(->[PERSONNEL]DIARY ACCESS))  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PERSONNEL]DIARY ACCESS'Person"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//Else
			
			//End case
		: ($2=Table:C252(->[USER:15]))  //
			//Case of
			//: ($3=Field(->[USER]DOWNLOADS))  `USER DOWNLOADS
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[USER]DOWNLOADS'Download_Time"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//Else
			
			//End case
		: ($2=$_l_ServiceCallsTable)  // SERVICE CALLS
			
			//Case of
			//: ($3=Field(->[SERVICE CALLS]PRODUCTS))
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[SERVICE CALLS]PRODUCTS'Product Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[SERVICE CALLS]PRODUCTS'Serial No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[SERVICE CALLS]PRODUCTS'Contract Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[SERVICE CALLS]PRODUCTS'System"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[SERVICE CALLS]PRODUCTS'Product Name"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//Else
			
			//End case
		: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			
			//Case of
			//: ($3=Field(->[TRANS IN]TRANS SUB))
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Trans Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Analysis Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Debit Acc"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Invoice No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Trans_Date"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2`
			
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Tax Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Tax Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Total"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Desc"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Period Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Credit Acc"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Company Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Cheque No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Debit IO"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Credit IO"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Purch Inv_No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'UK EC"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Currency Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Layer Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Second Amt"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Purchase Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'Job Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'BatchItemID"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'CreditTransID"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[TRANS IN]TRANS SUB'DebitTransID"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			
			//Else
			
			//End case
		: ($2=Table:C252(->[ACCOUNTS:32]))  //
			
			//Case of
			//: ($3=Field(->[ACCOUNTS]LAYERS))  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[ACCOUNTS]LAYERS'Layer Code"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//: ($3=Field(->[ACCOUNTS]ANALYSES))  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[ACCOUNTS]ANALYSES'Analysis Code"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//Else
			
			//End case
		: ($2=Table:C252(->[PURCHASE_INVOICES:37]))  //
			
			//Case of
			//: ($3=Field(->[PURCHASES]ITEMS))  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Product Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Quantity"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Cost Price"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Cost Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Tax Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Tax Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Total Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Purchase Acc"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Analysis Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//R`ECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Price Per"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Our Order No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Item Number"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Description"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Stock Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ITEMS'Sales Price"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//: ($3=Field(->[PURCHASES]ALLOCATIONS))
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ALLOCATIONS'Purchase Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ALLOCATIONS'Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ALLOCATIONS'Date"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[PURCHASES]ALLOCATIONS'Purch Inv_No"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//Else
			
			//End case
		: ($2=Table:C252(->[RECURRING_JOURNALS:38]))  //
			
			//Case of
			//: ($3=Field(->[REC JOURNALS]DATES))  `
			//RECEIVE PACKET($_ti_DocumentRef;GEn_T_ReceiveSubRecord2;Length("[REC JOURNALS]DATES'Posting Date"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//Else
			
			//End case
		: ($2=Table:C252(->[INVOICES:39]))  //
			
			//Case of
			//: ($3=Field(->[INVOICES]ITEMS))
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Product Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Product Name"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Quantity"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Sales Price"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Tax Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Tax Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Total Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Sales Acc"+$5))
			//G`En_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Analysis Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Order Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Item Number"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Description"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Print Desc"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Cost Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Price Per"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			
			//: ($3=Field(->[INVOICES]ALLOCATIONS))  `
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ALLOCATIONS'Invoice No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ALLOCATIONS'Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ALLOCATIONS'Date"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//Else
			
			//End case
			
			
			
			//End case
			
		: ($2=Table:C252(->[PURCHASE_ORDERS:57]))  //
			
			//Case of
			
			//: ($3=Field(->[PURCHASE ORDERS]ITEMS))
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Product Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Product Name"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Quantity"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Cost Price"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Cost Amount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Item Number"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Tax Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Purch Inv_No"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Price Code"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Discount"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Original Cost"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Price Per"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//C_TEXT($TEXT)
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[PURCHASE ORDERS]ITEMS'Description"+$5))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			//RECEIVE PACKET($_ti_DocumentRef;Gen_T_ReceiveSubRecord2;Length("[INVOICES]ITEMS'Print Desc"))
			//GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
			
			
			//Else
			
			//End case
			
			
		Else 
			
	End case 
	
	RECEIVE PACKET:C104($_ti_DocumentRef; Gen_T_ReceiveSubRecord2; Length:C16($6))
	GEn_T_ReceiveSubRecord:=GEn_T_ReceiveSubRecord+GEn_T_ReceiveSubRecord2
	$0:=Get document position:C481($_ti_DocumentRef)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
End if 
ERR_MethodTrackerReturn("GenImportSubRecordFieldNames"; $_t_oldMethodName)