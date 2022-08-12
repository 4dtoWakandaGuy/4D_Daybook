//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp RenumApp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_ClearDayStockActive)
	C_LONGINT:C283($_l_NewProcess; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp RenumApp")

READ WRITE:C146(*)
DB_SaveRecord(->[COMPANIES:2])
AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
Comp_RenumAppCT($1; $2)
Gen_AppToSelEx(->[DIARY:12]; ->[DIARY:12]Company_Code:1; $1; ->[DIARY:12]Export:24)
If (Records in selection:C76([ORDERS:24])#0)
	QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$2)
	Gen_AppToSelEx(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; $1; ->[ORDERS:24]Export:24)
	QUERY:C277([ORDERS:24]; [ORDERS:24]Delivery_Company:29=$2)
	Gen_AppToSelEx(->[ORDERS:24]; ->[ORDERS:24]Delivery_Company:29; $1; ->[ORDERS:24]Export:24)
End if 
Gen_AppToSel(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Supplier_Code:20; $1)
If (Records in selection:C76([INVOICES:39])#0)  //Fixed bug. Altered from checking order tabel to invoice table -kmw 13/02/09 (v631b125-126)?
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$2)
	Gen_AppToSel(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; $1)
	QUERY:C277([INVOICES:39]; [INVOICES:39]Delivery_Company:30=$2)
	Gen_AppToSel(->[INVOICES:39]; ->[INVOICES:39]Delivery_Company:30; $1)
End if 
Gen_AppToSel(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Company_Code:2; $1)
If (Records in selection:C76([PURCHASE_ORDERS:57])#0)
	QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$1)
	Gen_AppToSel(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Company_Code:1; $1)
	QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Deliver_to_Company:6=$1)
	Gen_AppToSel(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Deliver_to_Company:6; $1)
End if 
Gen_AppToSel(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Company_From:2; $1)
FIRST RECORD:C50([PRODUCTS:9])
While (Not:C34(End selection:C36([PRODUCTS:9])))
	Comp_ProdSupp($1)
	[PRODUCTS:9]Export:22:=Export_Stamp2([PRODUCTS:9]Export:22)
	DB_SaveRecord(->[PRODUCTS:9])
	AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
	NEXT RECORD:C51([PRODUCTS:9])
End while 
UNLOAD RECORD:C212([PRODUCTS:9])
If (Records in selection:C76([CONTRACTS:17])#0)
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=$1)
	Gen_AppToSel(->[CONTRACTS:17]; ->[CONTRACTS:17]Company_Code:1; $1)
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Supplier_Company:9=$1)
	Gen_AppToSel(->[CONTRACTS:17]; ->[CONTRACTS:17]Supplier_Company:9; $1)
End if 
Gen_AppToSel(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Company_Code:1; $1)
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]Company_Code:3; $1)

READ WRITE:C146([INFORMATION:55])
If (Count parameters:C259>=4)
	If ($3>0) & ($4>0)
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]); *)
		QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=$3)
		APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]RelateTableRecordNumber:13:=$4)
		UNLOAD RECORD:C212([INFORMATION:55])
		READ ONLY:C145([INFORMATION:55])
	End if 
	
Else 
End if 

//Gen_AppToSel (->[INFORMATION];->[INFORMATION]Company Code;$1)
Gen_AppToSel(->[PUBLICATIONS:52]; ->[PUBLICATIONS:52]Company_Code:3; $1)
Gen_AppToSel(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Company_Code:9; $1)
Gen_AppToSel(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Company_Code:8; $1)
Gen_AppToSel(->[CUSTOM_FIELDS:98]; ->[CUSTOM_FIELDS:98]Unique_Code:2; "002"+$1)
If (<>DB_bo_ClearDayStockActive)
	If (Records in selection:C76([Stock_Thread:143])#0)
		//QUERY([Stock_Thread];[STOCK_THREAD]SupplierCompanyCode=$1)
		//Gen_AppToSel (->[Stock_Thread];->[STOCK_THREAD]SupplierCompanyCode;$1)
		//QUERY([Stock_Thread];[STOCK_THREAD]SuppliedtoCompanyCode=$1)
		//Gen_AppToSel (->[Stock_Thread];->[STOCK_THREAD]SuppliedtoCompanyCode;$1)
	End if 
End if 

Gen_AppToSel(->[TRANSACTION_BATCH_ITEMS:155]; ->[TRANSACTION_BATCH_ITEMS:155]Company_Code:13; $1)

Gen_AppToSel(->[PROJECTS:89]; ->[PROJECTS:89]Company_Code:3; $1)

Gen_AppToSel(->[RECURRING_JOURNALS:38]; ->[RECURRING_JOURNALS:38]Company_Code:1; $1)

//Gen_AppToSel (->[USER];->[USER]StockOrderCo;$1) `This should nevere be so

Gen_AppToSel(->[xCreditCardDetails:132]; ->[xCreditCardDetails:132]CompanyReference:17; $1)

If (Records in selection:C76([xOtherRelations:138])#0)
	QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xOneTableNUm:1=Table:C252(->[COMPANIES:2]); *)
	QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableFieldNum:2=Field:C253(->[COMPANIES:2]Company_Code:1); *)
	QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableSTRreference:6=$1)
	Gen_AppToSel(->[xOtherRelations:138]; ->[xOtherRelations:138]xOneTableSTRreference:6; $1)
	QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xManyTableNum:3=Table:C252(->[COMPANIES:2]); *)
	QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableFieldNum:4=Field:C253(->[COMPANIES:2]Company_Code:1); *)
	QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableSTRRef:8=$1)
	Gen_AppToSel(->[xOtherRelations:138]; ->[xOtherRelations:138]xManyTableSTRRef:8; $1)
End if 
If (<>DB_bo_ClearDayStockActive)
	//Gen_AppToSel (->[x_ProductSupplierSettings];->[x_ProductSupplierSettings]xSupplierCode;$1)
End if 
//*********************************************************************************



$_l_NewProcess:=New process:C317("Comp_RenumCompSup"; 128000; "Renum Superior Fields"; $1; $2)  //Added kmw 25/02/09 (v631b125-126)?


READ ONLY:C145(*)
READ WRITE:C146([COMPANIES:2])
READ WRITE:C146([CONTACTS:1])
READ WRITE:C146([INFORMATION:55])
ERR_MethodTrackerReturn("Comp RenumApp"; $_t_oldMethodName)