//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_EditFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2010 09:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_EditFieldNames")
$0:=$2
Case of 
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		Case of 
			: ($2="Format Code")
				$0:="Format_Code"
			: ($2="Format Name")
				$0:="Format_Name"
			: ($2="Town Name")
				$0:="Town_Name"
			: ($2="County Name")
				$0:="County_Name"
			: ($2="Postcode Name")
				$0:="Postcode_Name"
			: ($2="Country Name")
				$0:="Country_Name"
			: ($2="address 1 name")
				$0:="Address_1_Name"
			: ($2="address 2 name")
				$0:="Address_1_Name"
			: ($2="Address Text")
				$0:="Address_Text"
			: ($2="Upper Town")
				$0:="Upper_Town"
			: ($2="Upper County")
				$0:="Upper_County"
			: ($2="Upper Postcode")
				$0:="Upper_Postcode"
			: ($2="Check PC")
				$0:="Check_PostalCode"
			: ($2="Enforce PC")
				$0:="Enforce_PostalCode"
		End case 
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		Case of 
			: ($2="FF Code")
				$0:="Custom_Code"
			: ($2="Unique Code")
				$0:="Unique_Code"
			: ($2="Field Name")
				$0:="FIeld_Name"
			: ($2="String 31")
				$0:="String_31"
			: ($2="Real or integer")
				$0:="Real_or_integer"
			: ($2="Text field")
				$0:="Text_field"
			: ($2="Date Field")
				$0:="Date_Field"
				
		End case 
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		Case of 
			: ($2="Analysis Code")
				$0:="Analysis_Code"
			: ($2="Account code")
				$0:="Account_Code"
			: ($2="Period code")
				
				$0:="Period_Code"
			: ($2="Layer code")
				$0:="Layer_Code"
				//: ($2="currency code")
				//[`ACCOUNT_BALANCES]Currency Code
				//$`0:="Layer_Code"
				
		End case 
	: ($1=Table:C252(->[DIARY:12]))
		Case of 
			: ($2="Diary code")
				$0:="Diary_Code"
			: ($2="Action Code")
				$0:="Action_Code"
			: ($2="Action Desc")
				$0:="Action_Details"
			: ($2="SourceDataField")
				$0:="DataSourceTable"
				
		End case 
	: ($1=Table:C252(->[PRODUCTS:9]))
		Case of 
			: ($2="xDerivateGrouping")
				$0:="xDerivitaveGrouping"
		End case 
	: ($1=Table:C252(->[ACTIONS:13]))
		Case of 
			: ($2="Action Code")
				$0:="Action_Code"
			: ($2="Action Name")
				$0:="Action_Name"
				
			: ($2="Document Code")
				$0:="Document_Code"
			: ($2="Default Desc")
				$0:="Default_Description"
			: ($2="WP action")
				$0:="DocumentManager_Action"
		End case 
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		Case of 
			: ($2="xLocationID")
				$0:=""
				$3->:=Is longint:K8:6
				
			: ($2="X_CopiedtoID")
				$0:=""
				$3->:=Is longint:K8:6
			: ($2="Stock_Item_UnitChangeValue")
				$0:=""
				$3->:=Is real:K8:4
			: ($2="StockItemReference")
				$0:=""
				$3->:=Is longint:K8:6
			: ($2="CurrentStockPosted")
				$0:=""
				$3->:=Is boolean:K8:9
				
			: ($2="xProductID")
				$0:=""
				$3->:=Is longint:K8:6
			: ($2="xCompanyToID")
				$0:=""
				$3->:=Is longint:K8:6
			: ($2="xSalesOrderID")
				$0:=""
				$3->:=Is longint:K8:6
				
			: ($2="xSalesOrderItemID")
				$0:=""
				$3->:=Is longint:K8:6
				
			: ($2="xCurrentStockAddedToUUID")
				$0:=""
				$3->:=Is string var:K8:2
				
			: ($2="xAccountsPosted")
				$0:=""
				$3->:=Is boolean:K8:9
				
			: ($2="xLevelAddistoFREE")
				$0:=""
				$3->:=Is boolean:K8:9
				
			: ($2="xStockBatchID")
				$0:=""
				$3->:=Is longint:K8:6
				
			: ($2="xStockQuantityisMinus")
				$0:=""
				$3->:=Is boolean:K8:9
				
			: ($2="Stock_Item_UnitChangeValue")
				$0:=""
				$3->:=Is boolean:K8:9
				
			: ($2="StockItemCurrency")
				$0:="xHeaderCurrency"
				
			: ($2="Stock_Batch_Reference")
				$0:=""
				$3->:=Is string var:K8:2
				
			: ($2="Stock_Batch_Reference")
				$0:=""
				$3->:=Is string var:K8:2
				
				
				
			Else 
				
		End case 
	: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
		Case of 
			: ($2="LISTING NAME")
				$0:="Listing_Name"
			: ($2="FILE NO")
				$0:="Table_number"
			: ($2="STATE Ref")
				$0:="State_Reference"
			: ($2="ENTRY NAME")
				$0:="Entry_Name"
			: ($2="ABBREV NAME")
				$0:="Abbreviated_Name"
			: ($2="State Code")
				$0:="STATE_t_Code"
				
		End case 
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		Case of 
			: ($2="Report Heading")
				$0:="Report_Heading"
			: ($2="Account Name")
				$0:="Account_Name"
			: ($2="Account Code")
				$0:="Account_Code"
			: ($2="Group Heading")
				$0:="Group_Heading"
			: ($2="No NL postings")
				$0:="No_NL_Postings"
			: ($2="Multicurrency Valuation")
				$0:="Multicurrency_Valuation"
		End case 
	: ($1=Table:C252(->[ANALYSES:36]))
		Case of 
			: ($2="Analysis Code")
				$0:="Analysis_Code"
			: ($2="Analysis Name")
				$0:="Analysis_Name"
			: ($2="Bank acc")
				$0:="Bank_account_code"
			: ($2="TitDepCo")
				$0:="Title_Department_company"
			: ($2="TitDepCoP")
				$0:="Title_Department_Co_Person"
			: ($2="TitAdd")
				$0:="Title_Address"
			: ($2="TitReg")
				$0:="Title_Registration"
			: ($2="VAT Prefix")
				$0:="TAX_Prefix"
			: ($2="VAT Reg No")
				$0:="TAX_Registered_No"
			: ($2="File No Start")
				$0:="Record_number_start"
				
		End case 
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		Case of 
			: ($2="x_MovementFunction")
				$0:="x_MovementFunction"
				
		End case 
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		Case of 
			: ($2="StockStatus")
				$0:="xStockLevelID"
			: ($2="xRelatedLevelsID")
				$0:="xStockLevelID"
			: ($2="UUID")
				$0:="Location"
			: ($2="SalesOrderItemID") | ($2="ProductID") | ($2="locationID") | ($2="serialsiD") | ($2="StcokBatchID")
				
				$0:="xStockLevelID"
			: ($2="Batch_Reference")
				$0:="Location"
		End case 
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		Case of 
			: ($2="xTotalQTY") | ($2="xTotalvalue")
				
				$0:=""
				$3->:=Is real:K8:4
		End case 
	: ($1=Table:C252(->[SCRIPTS:80]))
		Case of 
			: ($2="ReplaceableBoolean")
				$0:="AddToDataEntryFunctionsMenu"
		End case 
	: ($1=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
		Case of 
			: ($2="Further Code")
				$0:="Analysis_Code"
				
		End case 
	: ($1=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
		Case of 
			: ($2="Further Code")
				$0:="Analysis_Code"
				
		End case 
	: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		
		Case of 
			: ($2="Further Code")
				$0:="Analysis_Code"
				
		End case 
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		Case of 
			: ($2="Further Code")
				$0:="Additional_Analysis_Code"
			: ($2="Further Name")
				$0:="Additional_Analysis_Name"
		End case 
End case 
ERR_MethodTrackerReturn("DB_EditFieldNames"; $_t_oldMethodName)