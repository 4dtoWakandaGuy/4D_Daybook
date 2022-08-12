//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_GetSubTablePointer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 15:54:13If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_GetSubTablePointer")
// EW_GetsubtablePointer
// parameters: $1=the table number
//                     $2=the table number
// 19/08/02 pb


Case of 
		
	: ($1=Table:C252(->[CONTACTS:1]))
		//Case of
		//: ($2=21)  `FURTHERS
		//$0:=->[CONTACTS]FURTHERS
		
		//: ($2=22)  `COMPANIES
		//$0:=->[CONTACTS]COMPANIES
		//End case
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		//Case of
		//: ($2=11)  `Contacts
		//$0:=->[CONTRACTS]CONTACTS
		//End case
		
	: ($1=Table:C252(->[COMPANIES:2]))  //COMPANIES
		If (False:C215)
			Case of 
				: ($2=28)  //FURTHERS
					
			End case 
		End if 
	: ($1=Table:C252(->[DOCUMENTS:7]))  //DOCUMENTS
		Case of 
			: ($2=4)  //BREAK POINTS
				//$0:=->[DOCUMENTS]BREAK POINTS
		End case 
		
	: ($1=Table:C252(->[PRODUCTS:9]))  //PRODUCTS
		//Case of
		//: ($2=21)  ``suppliers
		//$0:=->[PRODUCTS]SUPPLIERS
		//End case
		
	: ($1=Table:C252(->[PERSONNEL:11]))  //PERSONNEL
		//Case of
		//: ($2=Field(->[PERSONNEL]DIARY ACCESS))  `
		//$0:=->[PERSONNEL]DIARY ACCESS
		//End case
		
	: ($1=Table:C252(->[USER:15]))  //
		//Case of
		//: ($2=Field(->[USER]DOWNLOADS))  `USER DOWNLOADS
		//$0:=->[USER]DOWNLOADS
		//End case
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))  // SERVICE CALLS
		//Case of
		//: ($2=Field(->[SERVICE CALLS]PRODUCTS))
		//$0:=->[SERVICE CALLS]PRODUCTS
		//End case
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))  //
		//Case of
		//: ($2=Field(->[TRANS IN]TRANS SUB))
		//$0:=->[TRANS IN]TRANS SUB
		//End case
		
	: ($1=Table:C252(->[ACCOUNTS:32]))  //
		//Case of
		//: ($2=Field(->[ACCOUNTS]LAYERS))
		//$0:=->[ACCOUNTS]LAYERS
		//: ($2=Field(->[ACCOUNTS]ANALYSES))
		//$0:=->[ACCOUNTS]ANALYSES
		//End case
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))  //
		Case of 
				//: ($2=Field(->[PURCHASES]ITEMS))  `
				//$0:=->[PURCHASES]ITEMS
				
				//: ($2=Field(->[PURCHASES]ALLOCATIONS))  `
				//$0:=->[PURCHASES]ALLOCATIONS
				//End case
				
			: ($1=Table:C252(->[RECURRING_JOURNALS:38]))  //
				//Case of
				//: ($2=Field(->[REC JOURNALS]DATES))
				//$0:=->[REC JOURNALS]DATES
				//End case
				
			: ($1=Table:C252(->[INVOICES:39]))  //
				//Case of
				
				
				
				//: ($2=Field(->[INVOICES]ALLOCATIONS))  `
				//$0:=->[INVOICES]ALLOCATIONS
		End case 
		
		
		
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))  //
		//Case of
		//: ($2=Field(->[PURCHASE ORDERS]ITEMS))
		//$0:=->[PURCHASE ORDERS]ITEMS
		//End case
		
		
		
End case 
ERR_MethodTrackerReturn("EW_GetSubTablePointer"; $_t_oldMethodName)