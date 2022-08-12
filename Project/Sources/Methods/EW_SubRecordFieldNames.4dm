//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_SubRecordFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2009 10:05:28If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY LONGINT(EW_al_dbFieldMapTypes;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	C_LONGINT:C283($_l_ArraySize; $_l_MaxLength; $_l_ParentKeyFieldNumber)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_SubRecordFieldNames")
// EW_SubRecordFieldNames
// 05/08/02 pb

//this not very generic method
//(it cannot be generic by the nature of subrecord table structures)
//creates a hist containing field names of specified subtable
// and stores field no. of parent table's key field in $_l_ParentKeyFieldNumber

// Parameters: $1 = the table number
//                     $2 = the field number

ARRAY TEXT:C222(EW_at_DBFieldNames; 24)
ARRAY LONGINT:C221(EW_al_DBFieldNumbers; 24)
ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; 24)
$_l_ArraySize:=1
$_l_ParentKeyFieldNumber:=0
Case of 
		
	: ($1=Table:C252(->[CONTACTS:1]))
		Case of 
			: ($2=21)  //FURTHERS
				EW_at_DBFieldNames{1}:="Further Code"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=0
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{1})
			: ($2=22)  //COMPANIES
				EW_at_DBFieldNames{1}:="Company Code"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=0
				EW_at_DBFieldNames{2}:="Address Type"
				EW_al_DBFieldNumbers{2}:=2
				EW_al_dbFieldMapTypes{2}:=0
				$_l_ArraySize:=2
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{1})
		End case 
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		Case of 
			: ($2=11)  //Contacts
				EW_at_DBFieldNames{1}:="Contact Code"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=0
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{1})
		End case 
		
	: ($1=Table:C252(->[COMPANIES:2]))  //COMPANIES
		Case of 
			: ($2=28)  //FURTHERS
				EW_at_DBFieldNames{1}:="Further Code"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=0
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{1})
		End case 
		
	: ($1=Table:C252(->[DOCUMENTS:7]))  //DOCUMENTS
		Case of 
			: ($2=4)  //BREAK POINTS
				EW_at_DBFieldNames{1}:="Break Point"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=8  // integer
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{1})
		End case 
		
	: ($1=Table:C252(->[PRODUCTS:9]))  //PRODUCTS
		Case of 
			: ($2=21)  //`suppliers
				EW_at_DBFieldNames{1}:="Company Code"
				EW_al_DBFieldNumbers{1}:=1
				EW_al_dbFieldMapTypes{1}:=0
				EW_at_DBFieldNames{2}:="Cost Price"
				EW_al_DBFieldNumbers{2}:=2
				EW_al_dbFieldMapTypes{2}:=1  //real
				EW_at_DBFieldNames{3}:="Margin"
				EW_al_DBFieldNumbers{3}:=3
				EW_al_dbFieldMapTypes{3}:=1  //real
				EW_at_DBFieldNames{4}:="SuppProdCode"
				EW_al_DBFieldNumbers{4}:=4
				EW_al_dbFieldMapTypes{4}:=0
				EW_at_DBFieldNames{5}:="Standard Cost"
				EW_al_DBFieldNumbers{5}:=5
				EW_al_dbFieldMapTypes{5}:=1
				EW_at_DBFieldNames{6}:="Lead Days"
				EW_al_DBFieldNumbers{6}:=6
				EW_al_dbFieldMapTypes{6}:=8
				$_l_ArraySize:=6
				$_l_MaxLength:=Length:C16(EW_at_DBFieldNames{5})
		End case 
		
	: ($1=Table:C252(->[PERSONNEL:11]))  //PERSONNEL
		//Case of
		//: ($2=Field(->[PERSONNEL]DIARY ACCESS))  `
		//EW_at_DBFieldNames{1}:="Person"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//End case
		
	: ($1=Table:C252(->[USER:15]))  //
		//Case of
		//: ($2=Field(->[USER]DOWNLOADS))  `USER DOWNLOADS
		//EW_at_DBFieldNames{1}:="Download_Time"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=11  ` time
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//End case
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))  // SERVICE CALLS
		//Case of
		//: ($2=Field(->[SERVICE CALLS]PRODUCTS))
		//EW_at_DBFieldNames{1}:="Product Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Serial No"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=0
		//EW_at_DBFieldNames{3}:="Contract Code"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=0
		//EW_at_DBFieldNames{4}:="System"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=0
		//EW_at_DBFieldNames{5}:="Product Name"
		//EW_al_DBFieldNumbers{5}:=5
		//EW_al_dbFieldMapTypes{5}:=0
		//$_l_ArraySize:=5
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{5})
		//Else
		//End case
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))  //
		//Case of
		//: ($2=Field(->[TRANS IN]TRANS SUB))
		//EW_at_DBFieldNames{1}:="Trans Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Analysis Code"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=0
		//EW_at_DBFieldNames{3}:="Debit Acc"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=0
		//EW_at_DBFieldNames{4}:="Invoice No"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=0
		//EW_at_DBFieldNames{5}:="Trans_Date"
		//EW_al_DBFieldNumbers{5}:=5
		//EW_al_dbFieldMapTypes{5}:=4
		//EW_at_DBFieldNames{6}:="Amount"
		//EW_al_DBFieldNumbers{6}:=6
		//EW_al_dbFieldMapTypes{6}:=1
		//EW_at_DBFieldNames{7}:="Tax Code"
		//EW_al_DBFieldNumbers{7}:=7
		//EW_al_dbFieldMapTypes{7}:=0
		//EW_at_DBFieldNames{8}:="Tax Amount"
		//EW_al_DBFieldNumbers{8}:=8
		//EW_al_dbFieldMapTypes{8}:=1
		//EW_at_DBFieldNames{9}:="Total"
		//EW_al_DBFieldNumbers{9}:=9
		//EW_al_dbFieldMapTypes{9}:=1
		//EW_at_DBFieldNames{10}:="Desc"
		//EW_al_DBFieldNumbers{10}:=10
		//EW_al_dbFieldMapTypes{10}:=0
		//EW_at_DBFieldNames{11}:="Period Code"
		//EW_al_DBFieldNumbers{11}:=11
		//EW_al_dbFieldMapTypes{11}:=0
		//EW_at_DBFieldNames{12}:="Credit Acc"
		//EW_al_DBFieldNumbers{12}:=12
		//EW_al_dbFieldMapTypes{12}:=0
		//EW_at_DBFieldNames{13}:="Company Code"
		//EW_al_DBFieldNumbers{13}:=13
		//EW_al_dbFieldMapTypes{13}:=0
		//EW_at_DBFieldNames{14}:="Cheque No"
		//EW_al_DBFieldNumbers{14}:=14
		//EW_al_dbFieldMapTypes{14}:=0
		//EW_at_DBFieldNames{15}:="Debit IO"
		//EW_al_DBFieldNumbers{15}:=15
		//EW_al_dbFieldMapTypes{15}:=0
		//`EW_at_DBFieldNames{16}:="Credit IO"
		//EW_al_DBFieldNumbers{16}:=16
		//EW_al_dbFieldMapTypes{16}:=0
		//EW_at_DBFieldNames{17}:="Purch Inv_No"
		//EW_al_DBFieldNumbers{17}:=17
		//EW_al_dbFieldMapTypes{17}:=0
		//EW_at_DBFieldNames{18}:="UK EC"
		//EW_al_DBFieldNumbers{18}:=18
		//EW_al_dbFieldMapTypes{18}:=0
		//EW_at_DBFieldNames{19}:="Currency Code"
		//EW_al_DBFieldNumbers{19}:=19
		//EW_al_dbFieldMapTypes{19}:=0
		//EW_at_DBFieldNames{20}:="Layer Code"
		//EW_al_DBFieldNumbers{20}:=20
		//EW_al_dbFieldMapTypes{20}:=0
		//EW_at_DBFieldNames{21}:="Second Amt"
		//EW_al_DBFieldNumbers{21}:=21
		//EW_al_dbFieldMapTypes{21}:=1
		//EW_at_DBFieldNames{22}:="Purchase Code"
		//EW_al_DBFieldNumbers{22}:=22
		//EW_al_dbFieldMapTypes{22}:=0
		//EW_at_DBFieldNames{23}:="Job Code"
		//EW_al_DBFieldNumbers{23}:=23
		//EW_al_dbFieldMapTypes{23}:=0
		//EW_al_DBFieldNumbers{24}:=24
		//EW_al_dbFieldMapTypes{24}:=0
		//$_l_ArraySize:=24
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{22})
		//End case
		
	: ($1=Table:C252(->[ACCOUNTS:32]))  //
		//Case of
		//: ($2=Field(->[ACCOUNTS]LAYERS))  `
		//EW_at_DBFieldNames{1}:="Layer Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		
		//: ($2=Field(->[ACCOUNTS]ANALYSES))  `
		//EW_at_DBFieldNames{1}:="Analysis Code"
		//EW_al_DBFieldNumbers{1}:=2
		//EW_al_dbFieldMapTypes{1}:=0
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//End case
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))  //
		//Case of
		//: ($2=Field(->[PURCHASES]ITEMS))  `
		//EW_at_DBFieldNames{1}:="Product Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Quantity"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=1
		//EW_at_DBFieldNames{3}:="Cost Price"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=1
		//EW_at_DBFieldNames{4}:="Cost Amount"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=1
		//EW_at_DBFieldNames{5}:="Tax Code"
		//EW_al_DBFieldNumbers{5}:=5
		//EW_al_dbFieldMapTypes{5}:=0
		//EW_at_DBFieldNames{6}:="Tax Amount"
		//EW_al_DBFieldNumbers{6}:=6
		//EW_al_dbFieldMapTypes{6}:=1
		//EW_at_DBFieldNames{7}:="Total Amount"
		//EW_al_DBFieldNumbers{7}:=7
		//EW_al_dbFieldMapTypes{7}:=1
		//EW_at_DBFieldNames{8}:="Purchase Acc"
		//EW_al_DBFieldNumbers{8}:=8
		//EW_al_dbFieldMapTypes{8}:=0
		//EW_at_DBFieldNames{9}:="Analysis Code"
		//EW_al_DBFieldNumbers{9}:=9
		//EW_al_dbFieldMapTypes{9}:=0
		//EW_at_DBFieldNames{10}:="Price Per"
		//EW_al_DBFieldNumbers{10}:=10
		//EW_al_dbFieldMapTypes{10}:=1
		//EW_at_DBFieldNames{11}:="Our Order No"
		//EW_al_DBFieldNumbers{11}:=11
		//EW_al_dbFieldMapTypes{11}:=0
		//EW_at_DBFieldNames{12}:="Item Number"
		//EW_al_DBFieldNumbers{12}:=12
		//EW_al_dbFieldMapTypes{12}:=9
		//EW_at_DBFieldNames{13}:="Description"
		//EW_al_DBFieldNumbers{13}:=13
		//EW_al_dbFieldMapTypes{13}:=0
		//EW_at_DBFieldNames{14}:="Stock Code"
		//EW_al_DBFieldNumbers{14}:=14
		//EW_al_dbFieldMapTypes{14}:=0
		//EW_at_DBFieldNames{15}:="Sales Price"
		//EW_al_DBFieldNumbers{15}:=15
		//EW_al_dbFieldMapTypes{15}:=1
		//$_l_ArraySize:=15
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{11})
		
		//: ($2=Field(->[PURCHASES]ALLOCATIONS))  `
		//EW_at_DBFieldNames{1}:="Purchase Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Amount"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=1
		//EW_at_DBFieldNames{3}:="Date"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=4
		//EW_at_DBFieldNames{4}:="Purch Inv_No"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=0
		//$_l_ArraySize:=4
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//End case
		
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))  //
		//Case of
		//: ($2=Field(->[REC JOURNALS]DATES))  `
		//EW_at_DBFieldNames{1}:="Posting Date"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=4
		//EW_at_DBFieldNames{2}:="Amount"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=1
		//$_l_ArraySize:=2
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//End case
		
	: ($1=Table:C252(->[INVOICES:39]))  //
		//Case of
		//: ($2=Field(->[INVOICES]ITEMS))
		//EW_at_DBFieldNames{1}:="Product Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Product Name"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=0
		//EW_at_DBFieldNames{3}:="Quantity"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=1
		//EW_at_DBFieldNames{4}:="Sales Price"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=1
		//EW_at_DBFieldNames{5}:="Amount"
		//EW_al_DBFieldNumbers{5}:=5
		//EW_al_dbFieldMapTypes{5}:=1
		//EW_at_DBFieldNames{6}:="Tax Code"
		//EW_al_DBFieldNumbers{6}:=6
		//EW_al_dbFieldMapTypes{6}:=0
		//EW_at_DBFieldNames{7}:="Tax Amount"
		//EW_al_DBFieldNumbers{7}:=7
		//EW_al_dbFieldMapTypes{7}:=1
		//EW_at_DBFieldNames{8}:="Total Amount"
		//EW_al_DBFieldNumbers{8}:=8
		//EW_al_dbFieldMapTypes{8}:=1
		//EW_at_DBFieldNames{9}:="Sales Acc"
		//EW_al_DBFieldNumbers{9}:=9
		//EW_al_dbFieldMapTypes{9}:=0
		//EW_at_DBFieldNames{10}:="Analysis Code"
		//EW_al_DBFieldNumbers{10}:=10
		//EW_al_dbFieldMapTypes{10}:=0
		//EW_at_DBFieldNames{11}:="Order Code"
		//EW_al_DBFieldNumbers{11}:=11
		//EW_al_dbFieldMapTypes{11}:=0
		//EW_at_DBFieldNames{12}:="Item Number"
		//EW_al_DBFieldNumbers{12}:=12
		//EW_al_dbFieldMapTypes{12}:=9
		//EW_at_DBFieldNames{13}:="Description"
		//EW_al_DBFieldNumbers{13}:=13
		//EW_al_dbFieldMapTypes{13}:=2
		//EW_at_DBFieldNames{14}:="Print Desc"
		//EW_al_DBFieldNumbers{14}:=14
		//EW_al_dbFieldMapTypes{14}:=6
		//EW_at_DBFieldNames{15}:="Cost Amount"
		//EW_al_DBFieldNumbers{15}:=15
		//EW_al_dbFieldMapTypes{15}:=1
		//EW_at_DBFieldNames{16}:="Price Per"
		//EW_al_DBFieldNumbers{16}:=16
		//EW_al_dbFieldMapTypes{16}:=1
		//$_l_ArraySize:=16
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{10})
		
		//: ($2=Field(->[INVOICES]ALLOCATIONS))  `
		//EW_at_DBFieldNames{1}:="Invoice No"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Amount"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=1
		//EW_at_DBFieldNames{3}:="Date"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=4
		//$_l_ArraySize:=3
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{1})
		//Else
		//End case
		
		
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))  //
		//Case of
		//: ($2=Field(->[PURCHASE ORDERS]ITEMS))
		//EW_at_DBFieldNames{1}:="Product Code"
		//EW_al_DBFieldNumbers{1}:=1
		//EW_al_dbFieldMapTypes{1}:=0
		//EW_at_DBFieldNames{2}:="Product Name"
		//EW_al_DBFieldNumbers{2}:=2
		//EW_al_dbFieldMapTypes{2}:=0
		//EW_at_DBFieldNames{3}:="Quantity"
		//EW_al_DBFieldNumbers{3}:=3
		//EW_al_dbFieldMapTypes{3}:=1
		//EW_at_DBFieldNames{4}:="Cost Price"
		//EW_al_DBFieldNumbers{4}:=4
		//EW_al_dbFieldMapTypes{4}:=1
		//EW_at_DBFieldNames{5}:="Cost Amount"
		//EW_al_DBFieldNumbers{5}:=5
		//EW_al_dbFieldMapTypes{5}:=1
		//EW_at_DBFieldNames{6}:="Item Number"
		//EW_al_DBFieldNumbers{6}:=6
		//EW_al_dbFieldMapTypes{6}:=9
		//EW_at_DBFieldNames{7}:="Tax Code"
		//EW_al_DBFieldNumbers{7}:=7
		//EW_al_dbFieldMapTypes{7}:=0
		//EW_at_DBFieldNames{8}:="Purch Inv_No"
		//EW_al_DBFieldNumbers{8}:=8
		//EW_al_dbFieldMapTypes{8}:=0
		//EW_at_DBFieldNames{9}:="Price Code"
		//EW_al_DBFieldNumbers{9}:=9
		//EW_al_dbFieldMapTypes{9}:=0
		//EW_at_DBFieldNames{10}:="Discount"
		//EW_al_DBFieldNumbers{10}:=10
		//EW_al_dbFieldMapTypes{10}:=1
		//EW_at_DBFieldNames{11}:="Original Cost"
		//EW_al_DBFieldNumbers{11}:=11
		//EW_al_dbFieldMapTypes{11}:=1
		//EW_at_DBFieldNames{12}:="Price Per"
		//EW_al_DBFieldNumbers{12}:=12
		//EW_al_dbFieldMapTypes{12}:=1
		//EW_at_DBFieldNames{13}:="Description"
		//EW_al_DBFieldNumbers{13}:=13
		//EW_al_dbFieldMapTypes{13}:=2
		//EW_at_DBFieldNames{14}:="Print Desc"
		//EW_al_DBFieldNumbers{14}:=14
		//EW_al_dbFieldMapTypes{14}:=6
		//$_l_ArraySize:=14
		//$_l_MaxLength:=Length(EW_at_DBFieldNames{11})
		//End case
		
		
		
End case 

ARRAY TEXT:C222(EW_at_DBFieldNames; $_l_ArraySize)
ARRAY LONGINT:C221(EW_al_DBFieldNumbers; $_l_ArraySize)
ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; $_l_ArraySize)
SORT ARRAY:C229(EW_at_DBFieldNames; EW_al_DBFieldNumbers; EW_al_dbFieldMapTypes)
ERR_MethodTrackerReturn("EW_SubRecordFieldNames"; $_t_oldMethodName)