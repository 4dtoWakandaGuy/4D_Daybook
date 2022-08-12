//%attributes = {}

If (False:C215)
	//Project Method Name:      SSI_GETSUBFIELDPROPERTIES
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;0)
	//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;0)
	//ARRAY TEXT(SSI_at_SubFieldNames;0)
	C_LONGINT:C283($1)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_GETSUBFIELDPROPERTIES")

//This method will load the subfield Relations properties

//because 4D cannot get info about subtable fields..we have to hard code this
//This will then return arrays of the data for usage
$_t_oldMethodName:=ERR_MethodTracker("SSI_GETSUBFIELDPROPERTIES")
ARRAY TEXT:C222(SSI_at_SubFieldNames; 0)
ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 0)
ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 0)
If (Count parameters:C259>=2)
	
	//this not very generic method
	//(it cannot be generic by the nature of subrecord table structures)
	//Imports from a document the subrecords in text format
	//the document path(doc already created-appending)
	
	Case of 
		: ($1=Table:C252(->[CONTRACTS:17]))
			ARRAY TEXT:C222(SSI_at_SubFieldNames; 1)
			ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 1)
			ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 1)
			SSI_at_SubFieldNames{1}:="CONTRACTS_CONTACTS_ContactCode"
			SSI_al_SUBFIELDRelatedTable{1}:=Table:C252(->[CONTACTS:1])
			SSI_al_SUBFIELDRELATEDField{1}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
			
		: ($1=1)  //CONTACT
			Case of 
				: ($2=21)  //FURTHERS
					ARRAY TEXT:C222(SSI_at_SubFieldNames; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 1)
					SSI_at_SubFieldNames{1}:="CONTACTS_FURTHERS_Further_Code"
					SSI_al_SUBFIELDRelatedTable{1}:=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53])
					SSI_al_SUBFIELDRELATEDField{1}:=Field:C253(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1)
				: ($2=22)  //COMPANIES
					ARRAY TEXT:C222(SSI_at_SubFieldNames; 2)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 2)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 2)
					SSI_at_SubFieldNames{1}:="CONTACTS_COMPANIES_Company_Code"
					SSI_at_SubFieldNames{2}:="CONTACTS_COMPANIES_Address_Type"
					SSI_al_SUBFIELDRelatedTable{1}:=Table:C252(->[COMPANIES:2])
					SSI_al_SUBFIELDRELATEDField{1}:=Field:C253(->[COMPANIES:2]Company_Code:1)
					
				Else 
			End case 
		: ($1=2)  //COMPANIES
			Case of 
				: ($2=28)  //FURTHERS
					ARRAY TEXT:C222(SSI_at_SubFieldNames; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 1)
					SSI_at_SubFieldNames{1}:="COMPANIES_FURTHERS_Further_Code"
					SSI_al_SUBFIELDRelatedTable{1}:=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53])
					SSI_al_SUBFIELDRELATEDField{1}:=Field:C253(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1)
				Else 
					
			End case 
		: ($1=7)  //DOCUMENTS
			Case of 
				: ($2=4)  //BREAK POINTS
					ARRAY TEXT:C222(SSI_at_SubFieldNames; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 1)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 1)
					SSI_at_SubFieldNames{1}:="DOCUMENT_BREAKPOINTS_Break_Point"
					
				Else 
			End case 
		: ($1=9)  //PRODUCTS
			Case of 
				: ($2=21)
					ARRAY TEXT:C222(SSI_at_SubFieldNames; 6)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRelatedTable; 6)
					ARRAY LONGINT:C221(SSI_al_SUBFIELDRELATEDField; 6)
					SSI_at_SubFieldNames{1}:="PRODUCT_SUPPLIERS_Company_Code"  //
					SSI_at_SubFieldNames{2}:="PRODUCT_SUPPLIERS_Cost_Price"
					SSI_at_SubFieldNames{3}:="PRODUCT_SUPPLIERS_Margin"
					SSI_at_SubFieldNames{4}:="PRODUCT_SUPPLIERS_SuppProdCode"
					SSI_at_SubFieldNames{5}:="PRODUCT_SUPPLIERS_Standard_Cost"
					SSI_at_SubFieldNames{6}:="PRODUCT_SUPPLIERS_Lead_Days"
					SSI_al_SUBFIELDRelatedTable{1}:=Table:C252(->[COMPANIES:2])
					SSI_al_SUBFIELDRELATEDField{1}:=Field:C253(->[COMPANIES:2]Company_Code:1)
				Else 
					
			End case 
		: ($1=11)  //PERSONNEL
			//Case of
			
			//: ($2=Field(->[PERSONNEL]DIARY ACCESS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;1)
			//SSI_at_SubFieldNames{1}:="PERSONNEL_DIARYACCESS_Person"  `
			//  `there is no declared relationship here
			//but there is an inferred relationship back to [personnel]initials
			//Else
			
			//End case
		: ($1=Table:C252(->[USER:15]))  //
			//Case of
			//: ($2=Field(->[USER]DOWNLOADS))  `USER DOWNLOADS
			//ARRAY STRING(255;SSI_at_SubFieldNames;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;1)
			//SSI_at_SubFieldNames{1}:="USER_DOWNLOADS_DownloadTime"
			
			//Else
			
			//End case
		: ($1=Table:C252(->[SERVICE_CALLS:20]))  // SERVICE CALLS
			
			//Case of
			//: ($2=Field(->[SERVICE CALLS]PRODUCTS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;5)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;5)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;5)
			//SSI_at_SubFieldNames{1}:="SERVICECALLS_PRODUCTS_ProductCode"  `
			//SSI_at_SubFieldNames{2}:="SERVICECALLS_PRODUCTS_SerialNo"
			//SSI_at_SubFieldNames{3}:="SERVICECALLS_PRODUCTS_ContractCode"
			//SSI_at_SubFieldNames{4}:="SERVICECALLS_PRODUCTS_System"
			//SSI_at_SubFieldNames{5}:="SERVICECALLS_PRODUCTS_ProductName"
			//SSI_al_SUBFIELDRelatedTable{1}:=Table(->[PRODUCTS])
			//SSI_al_SUBFIELDRELATEDField{1}:=Field(->[PRODUCTS]Product Code)
			//the above is inferred not declared
			//SSI_al_SUBFIELDRelatedTable{3}:=Table(->[CONTRACTS])
			//SSI_al_SUBFIELDRELATEDField{3}:=Field(->[CONTRACTS]Contract Code)
			//Else
			
			//End case
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			
			
		: ($1=Table:C252(->[ACCOUNTS:32]))  //
			
			//Case of
			//: ($2=Field(->[ACCOUNTS]LAYERS))  `
			//ARRAY STRING(255;SSI_at_SubFieldNames;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;1)
			//SSI_at_SubFieldNames{1}:="ACCOUNTS_LAYERS_LayerCode"  `
			
			//: ($2=Field(->[ACCOUNTS]ANALYSES))  `
			//ARRAY STRING(255;SSI_at_SubFieldNames;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;1)
			//SSI_at_SubFieldNames{1}:="ACCOUNTS_ANALYSES_AnalysisCode"  `
			
			//Else
			
			//End case
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))  //
			
			//Case of
			//: ($2=Field(->[PURCHASES]ITEMS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;15)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;15)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;15)
			//SSI_at_SubFieldNames{1}:="PURCHASES_ITEMS_ProductCode"  `
			//SSI_at_SubFieldNames{2}:="PURCHASES_ITEMS_Quantity"
			//SSI_at_SubFieldNames{3}:="PURCHASES_ITEMS_CostPrice"
			//SSI_at_SubFieldNames{4}:="PURCHASES_ITEMS_CostAmount"
			//SSI_at_SubFieldNames{5}:="PURCHASES_ITEMS_TaxCode"
			//SSI_at_SubFieldNames{6}:="PURCHASES_ITEMS_TaxAmount"
			//SSI_at_SubFieldNames{7}:="PURCHASES_ITEMS_TotalAmount"
			//SSI_at_SubFieldNames{8}:="PURCHASES_ITEMS_PurchaseAcc"
			//SSI_at_SubFieldNames{9}:="PURCHASES_ITEMS_AnalysisCode"
			//SSI_at_SubFieldNames{10}:="PURCHASES_ITEMS_PricePer"
			//SSI_at_SubFieldNames{11}:="PURCHASES_ITEMS_OurOrderNo"
			//SSI_at_SubFieldNames{12}:="PURCHASES_ITEMS_ItemNumber"
			//SSI_at_SubFieldNames{13}:="PURCHASES_ITEMS_Description"
			//SSI_at_SubFieldNames{14}:="PURCHASES_ITEMS_StockCode"
			//SSI_at_SubFieldNames{15}:="PURCHASES_ITEMS_SalesPrice"
			
			//: ($2=Field(->[PURCHASES]ALLOCATIONS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;4)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;4)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;4)
			//SSI_at_SubFieldNames{1}:="PURCHASES_ALLOCATIONS_PurchaseCode"
			//SSI_at_SubFieldNames{2}:="PURCHASES_ALLOCATIONS_Amount"
			//SSI_at_SubFieldNames{3}:="PURCHASES_ALLOCATIONS_Date"
			//SSI_at_SubFieldNames{4}:="PURCHASES_ALLOCATIONS_PurchaseInvoiceNumber"
			
			//Else
			
			//End case
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))  //
			
			//Case of
			//: ($2=Field(->[REC JOURNALS]DATES))
			//ARRAY STRING(255;SSI_at_SubFieldNames;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;1)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;1)
			//SSI_at_SubFieldNames{1}:="RECJOURNALS_DATES_PostingDate"
			
			//Else
			//
			//End case
		: ($1=Table:C252(->[INVOICES:39]))  //
			
			//Case of
			//: ($2=Field(->[INVOICES]ITEMS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;17)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;17)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;17)
			//SSI_at_SubFieldNames{1}:="INVOICES_ITEMS_ProductCode"
			//SSI_at_SubFieldNames{2}:="INVOICES_ITEMS_ProductName"
			//SSI_at_SubFieldNames{3}:="INVOICES_ITEMS_ProductCode"
			//SSI_at_SubFieldNames{4}:="INVOICES_ITEMS_Quantity"
			//SSI_at_SubFieldNames{5}:="INVOICES_ITEMS_SalesPrice"
			//SSI_at_SubFieldNames{6}:="INVOICES_ITEMS_Amount"
			//SSI_at_SubFieldNames{7}:="INVOICES_ITEMS_TaxCode"
			//SSI_at_SubFieldNames{8}:="INVOICES_ITEMS_TaxAmount"
			//SSI_at_SubFieldNames{9}:="INVOICES_ITEMS_TotalAmount"
			//SSI_at_SubFieldNames{10}:="INVOICES_ITEMS_SalesAccount"
			//SSI_at_SubFieldNames{11}:="INVOICES_ITEMS_AnalysisCode"
			//SSI_at_SubFieldNames{12}:="INVOICES_ITEMS_OrderCode"
			//SSI_at_SubFieldNames{13}:="INVOICES_ITEMS_ItemNumber"
			//SSI_at_SubFieldNames{14}:="INVOICES_ITEMS_Description"
			//SSI_at_SubFieldNames{15}:="INVOICES_ITEMS_PrintDescription"
			//SSI_at_SubFieldNames{16}:="INVOICES_ITEMS_CostAmount"
			//SSI_at_SubFieldNames{17}:="INVOICES_ITEMS_PricePer"
			
			//: ($2=Field(->[INVOICES]ALLOCATIONS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;4)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;4)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;4)
			//SSI_at_SubFieldNames{1}:="INVOICES_ALLOCATIONS_InvoiceNo"
			//SSI_at_SubFieldNames{2}:="INVOICES_ALLOCATIONS_Amount"
			//SSI_at_SubFieldNames{3}:="INVOICES_ALLOCATIONS_Date"
			//SSI_at_SubFieldNames{4}:="INVOICES_ALLOCATIONS_Transferred"  `
			
			//Else
			
			//End case
			
			
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))  //
			
			//Case of
			
			//: ($2=Field(->[PURCHASE ORDERS]ITEMS))
			//ARRAY STRING(255;SSI_at_SubFieldNames;16)
			//ARRAY LONGINT(SSI_al_SUBFIELDRelatedTable;16)
			//ARRAY LONGINT(SSI_al_SUBFIELDRELATEDField;16)
			//SSI_at_SubFieldNames{1}:="PURCHASEORDERS_PURCHASEORDERS_ProductCode"
			//SSI_at_SubFieldNames{2}:="PURCHASEORDERS_PURCHASEORDERS_ProductName"
			//SSI_at_SubFieldNames{3}:="PURCHASEORDERS_PURCHASEORDERS_Quantity"
			//SSI_at_SubFieldNames{4}:="PURCHASEORDERS_PURCHASEORDERS_CostPrice"
			//SSI_at_SubFieldNames{5}:="PURCHASEORDERS_PURCHASEORDERS_CostAmount"
			//SSI_at_SubFieldNames{6}:="PURCHASEORDERS_PURCHASEORDERS_ItemNumber"
			//SSI_at_SubFieldNames{7}:="PURCHASEORDERS_PURCHASEORDERS_TaxCode"
			//SSI_at_SubFieldNames{8}:="PURCHASEORDERS_PURCHASEORDERS_PurchaseInvoiceNumber"
			//SSI_at_SubFieldNames{9}:="PURCHASEORDERS_PURCHASEORDERS_ItemNumber"
			//SSI_at_SubFieldNames{10}:="PURCHASEORDERS_PURCHASEORDERS_PriceCode"
			//SSI_at_SubFieldNames{11}:="PURCHASEORDERS_PURCHASEORDERS_Discount"
			//SSI_at_SubFieldNames{12}:="PURCHASEORDERS_PURCHASEORDERS_OriginalCost"
			//SSI_at_SubFieldNames{13}:="PURCHASEORDERS_PURCHASEORDERS_PricePer"
			//SSI_at_SubFieldNames{14}:="PURCHASEORDERS_PURCHASEORDERS_Description"
			//SSI_at_SubFieldNames{15}:="PURCHASEORDERS_PURCHASEORDERS_PrintDescription"
			//SSI_at_SubFieldNames{16}:="PURCHASEORDERS_PURCHASEORDERS_OriginalCost"
			
			
			//Else
			
			//End case
			
		Else 
			
	End case 
	
End if 
ERR_MethodTrackerReturn("SSI_GETSUBFIELDPROPERTIES"; $_t_oldMethodName)