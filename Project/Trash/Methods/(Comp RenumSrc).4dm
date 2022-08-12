//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp RenumSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 17:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(<>DB_bo_ClearDayStockActive; <>MultiCo)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp RenumSrc")
If (<>MultiCo)
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$1; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
	QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	
Else 
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$1)
End if 
QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$1)
QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$1; *)
QUERY:C277([ORDERS:24];  | ; [ORDERS:24]Delivery_Company:29=$1)
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20=$1)
QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$1; *)
QUERY:C277([INVOICES:39];  | ; [INVOICES:39]Delivery_Company:30=$1)  //Altered to do OR with previous statement kmw 13/02/09 (v631b125-126)? `Added kmw 12/02/09 (v631b125-126)?

QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$1)
QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$1; *)
QUERY:C277([PURCHASE_ORDERS:57];  | ; [PURCHASE_ORDERS:57]Deliver_to_Company:6=$1)  //kmw 13/02/09 (v631b125-126)?

QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Company_From:2=$1)
QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$1)
SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)

QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=$1)
QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=$1; *)
QUERY:C277([CONTRACTS:17];  | ; [CONTRACTS:17]Supplier_Company:9=$1)  //kmw 13/02/09 (v631b125-126)?
QUERY:C277([JOBS:26]; [JOBS:26]Company_Code:3=$1)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Company_Code:7=$1)
QUERY:C277([PUBLICATIONS:52]; [PUBLICATIONS:52]Company_Code:3=$1)
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Company_Code:9=$1)
QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$1)
QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=("002"+$1))
If (<>DB_bo_ClearDayStockActive)
	//QUERY([Stock_Thread];[STOCK_THREAD]SupplierCompanyCode=$1;*)  `kmw 13/02/09 (v631b125-126)?
	//QUERY([Stock_Thread]; | ;[STOCK_THREAD]SuppliedtoCompanyCode=$1)  `kmw 13/02/09 (v631b125-126)?
	//QUERY([TRANS IN];[TRANS IN]TRANS SUB'Company Code=$1)  `kmw 13/02/09 (v631b125-126)?
End if 
QUERY:C277([PROJECTS:89]; [PROJECTS:89]Company_Code:3=$1)  //kmw 13/02/09 (v631b125-126)?

QUERY:C277([RECURRING_JOURNALS:38]; [RECURRING_JOURNALS:38]Company_Code:1=$1)  //kmw 13/02/09 (v631b125-126)?

//QUERY([USER];[USER]StockOrderCo=$1)  //kmw 13/02/09 (v631b125-126)?


QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]CompanyReference:17=$1)  //kmw 13/02/09 (v631b125-126)?


//************************************************ kmw 13/02/09 (v631b125-126)? ************************************************
QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xOneTableNUm:1=Table:C252(->[COMPANIES:2]); *)
QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableFieldNum:2=Field:C253(->[COMPANIES:2]Company_Code:1); *)
QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableSTRreference:6=$1)
CREATE SET:C116([xOtherRelations:138]; "TempOthRel1")

QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xManyTableNum:3=Table:C252(->[COMPANIES:2]); *)
QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableFieldNum:4=Field:C253(->[COMPANIES:2]Company_Code:1); *)
QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableSTRRef:8=$1)
CREATE SET:C116([xOtherRelations:138]; "TempOthRel2")

UNION:C120("TempOthRel1"; "TempOthRel2"; "TempOthRel1")
USE SET:C118("TempOthRel1")

CLEAR SET:C117("TempOthRel1")
CLEAR SET:C117("TempOthRel2")
//************************************************************************************************************************************
If (<>DB_bo_ClearDayStockActive)
	//QUERY([x_ProductSupplierSettings];[x_ProductSupplierSettings]xSupplierCode=$1)  `kmw 13/02/09 (v631b125-126)?
End if 
ERR_MethodTrackerReturn("Comp RenumSrc"; $_t_oldMethodName)
