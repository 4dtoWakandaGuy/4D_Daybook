//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_UpdateRoutines
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 11:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_abo_UpdateFeaturesAsync;0)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	//ARRAY LONGINT(DB_al_UpdateFeaturesVersion;0)
	//ARRAY LONGINT(DB_al_StoredUpdates;0)
	//ARRAY LONGINT(DB_l_UpdateFeaturesVersion;0)
	//ARRAY TEXT(DB_at_UpdateFeatures;0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_JustToAvoidProblems; $_bo_NormalStartup; $1)
	C_LONGINT:C283(<>SCPT_l_CheckVersion; $_l_CurrentRevision; $_l_Element; $_l_ElementCount; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_Process; $_l_ProcessState; $_l_RecordsIndex; $_l_SizeofArray)
	C_LONGINT:C283($_l_TableIndex; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_UpdateRoutines")
If (False:C215)
	//NG Feb 2004
	//This method will run at server (or single User_Startup)
	//it will check if data updates have been done
	//if you have a new update to implement call it from here
	//and add it to the list below
	//if you modify an update routine give it a new version number and it will run aga
	
	//Inputs
	//None
	//Parameters
	//NONE
	//OUTPUTS
	//None
End if 



$_bo_JustToAvoidProblems:=True:C214
If (Count parameters:C259>=1)
	$_bo_NormalStartup:=$1
Else 
	$_bo_NormalStartup:=True:C214
End if 
If ($_bo_NormalStartup)
	If (Application type:C494#4D Remote mode:K5:5)
		//DB_UpgradeV13toV14
		
		
		$_l_Process:=New process:C317("GEN_restoreIndexes"; 64*1024; "Restore Indexes"; *)
		//this must run to ensure no indexes are dropped
		$_l_Process:=New process:C317("GEN_UPDATETAXPERIOD"; 64*1024; "UPDATING TAX PERIOD"; *)
	End if 
	//this must run to ensure the CURRENT tax period is done
End if 
<>SYS_bo_SkipDateUpdates:=False:C215
//If (Gen_Option )
//Gen_Confirm ("Do you want to force updates to not run?";"No";"Yes")
//If (OK=0)
//◊SkipDateUpdates:=True
//End if
//End if
OK:=1

READ WRITE:C146([LIST_LAYOUTS:96])
ARRAY LONGINT:C221($_al_TableNumbers; 0)
$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
APPEND TO ARRAY:C911($_al_TableNumbers; $_l_TableNumber)
//$_l_TableNumber:=Table(->[TRANS IN_TRANS SUB])
//APPEND TO ARRAY($_al_TableNumbers;$_l_TableNumber)
$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
APPEND TO ARRAY:C911($_al_TableNumbers; $_l_TableNumber)
$_l_TableNumber:=Table:C252(->[INVOICES_ITEMS:161])
APPEND TO ARRAY:C911($_al_TableNumbers; $_l_TableNumber)
$_l_TableNumber:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
APPEND TO ARRAY:C911($_al_TableNumbers; $_l_TableNumber)
For ($_l_TableIndex; 1; Size of array:C274($_al_TableNumbers))
	
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Table_Number:2=$_al_TableNumbers{$_l_TableIndex}; *)
	QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Formula:9#"")
	For ($_l_RecordsIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
		Case of 
			: ([LIST_LAYOUTS:96]Formula:9="Company Code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
			: ([LIST_LAYOUTS:96]Formula:9="suppprodCode@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
			: ([LIST_LAYOUTS:96]Formula:9="Lead Days@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Lead_Days:6)
			: ([LIST_LAYOUTS:96]Formula:9="Cost Price@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2)
			: ([LIST_LAYOUTS:96]Formula:9="Standard Cost@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Standard_Cost:5)
			: ([LIST_LAYOUTS:96]Formula:9="Costpricecurrencycode@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9)
			: ([LIST_LAYOUTS:96]Formula:9="margin@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Margin:3)
			: ([LIST_LAYOUTS:96]Formula:9="Preferred Supplier@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10)
				
			: ([LIST_LAYOUTS:96]Formula:9="amount@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Amount:5)
			: ([LIST_LAYOUTS:96]Formula:9="Analysis Code@")
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Analysis_Code:10)
			: ([LIST_LAYOUTS:96]Formula:9="company Code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Company_Code:20)
			: ([LIST_LAYOUTS:96]Formula:9="cost amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Cost_Amount:15)
			: ([LIST_LAYOUTS:96]Formula:9="Description@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Description:13)
			: ([LIST_LAYOUTS:96]Formula:9="item numbe@r") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Item_Number:12)
			: ([LIST_LAYOUTS:96]Formula:9="order code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Order_Code:11)
			: ([LIST_LAYOUTS:96]Formula:9="price per@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Price_Per:16)
			: ([LIST_LAYOUTS:96]Formula:9="print desc@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Print_Description:14)
			: ([LIST_LAYOUTS:96]Formula:9="Product Code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Code:1)
			: ([LIST_LAYOUTS:96]Formula:9="Product name@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Name:2)
			: ([LIST_LAYOUTS:96]Formula:9="quantity@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Quantity:3)
			: ([LIST_LAYOUTS:96]Formula:9="sales acc@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Account:9)
			: ([LIST_LAYOUTS:96]Formula:9="sales Price@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4)
			: ([LIST_LAYOUTS:96]Formula:9="tax amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES_ITEMS:161]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7)
			: ([LIST_LAYOUTS:96]Formula:9="analysis code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)
			: ([LIST_LAYOUTS:96]Formula:9="cost amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)
			: ([LIST_LAYOUTS:96]Formula:9="cost Price@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
			: ([LIST_LAYOUTS:96]Formula:9="description@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Description:13)
			: ([LIST_LAYOUTS:96]Formula:9="item number@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12)
			: ([LIST_LAYOUTS:96]Formula:9="our order no@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
			: ([LIST_LAYOUTS:96]Formula:9="price per@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10)
			: ([LIST_LAYOUTS:96]Formula:9="product code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
			: ([LIST_LAYOUTS:96]Formula:9="purchase acc@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
			: ([LIST_LAYOUTS:96]Formula:9="quantity@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2)
			: ([LIST_LAYOUTS:96]Formula:9="sale price@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15)
			: ([LIST_LAYOUTS:96]Formula:9="stock code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Stock_Code:14)
			: ([LIST_LAYOUTS:96]Formula:9="tax amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)
			: ([LIST_LAYOUTS:96]Formula:9="tax code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
			: ([LIST_LAYOUTS:96]Formula:9="total amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)
			: ([LIST_LAYOUTS:96]Formula:9="cost amount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)
			: ([LIST_LAYOUTS:96]Formula:9="cost price@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
			: ([LIST_LAYOUTS:96]Formula:9="description@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Description:13)
			: ([LIST_LAYOUTS:96]Formula:9="distcount@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Discount:10)
			: ([LIST_LAYOUTS:96]Formula:9="internalcomments@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]InternalComments:15)
			: ([LIST_LAYOUTS:96]Formula:9="item number@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
			: ([LIST_LAYOUTS:96]Formula:9="original code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)
			: ([LIST_LAYOUTS:96]Formula:9="price code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
			: ([LIST_LAYOUTS:96]Formula:9="price per@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
			: ([LIST_LAYOUTS:96]Formula:9="print desc@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Print_Description:14)
			: ([LIST_LAYOUTS:96]Formula:9="product code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			: ([LIST_LAYOUTS:96]Formula:9="product name@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
				
			: ([LIST_LAYOUTS:96]Formula:9="purch Inv_No@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
			: ([LIST_LAYOUTS:96]Formula:9="quantity@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
			: ([LIST_LAYOUTS:96]Formula:9="tax code@") & ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
				
				
		End case 
		SAVE RECORD:C53([LIST_LAYOUTS:96])
		
		
		NEXT RECORD:C51([LIST_LAYOUTS:96])
	End for 
	
	
End for 

If (Application type:C494#4D Remote mode:K5:5)
	
	$_l_ElementCount:=17
	
	ARRAY TEXT:C222(DB_at_UpdateFeatures; $_l_ElementCount)  // The name of the update so we know what it is
	ARRAY LONGINT:C221(DB_al_UpdateFeaturesVersion; $_l_ElementCount)  //The version of code running(this allows us to modify a routine and force it to r
	ARRAY BOOLEAN:C223(DB_abo_UpdateFeaturesAsync; $_l_ElementCount)  //Indicate if the code must complete before the next code runs
	
	
	
	DB_at_UpdateFeatures{1}:="Update Company Address"
	DB_al_UpdateFeaturesVersion{1}:=1
	DB_abo_UpdateFeaturesAsync{1}:=True:C214
	DB_at_UpdateFeatures{2}:="Build email address"
	DB_al_UpdateFeaturesVersion{2}:=1
	DB_abo_UpdateFeaturesAsync{2}:=True:C214
	DB_at_UpdateFeatures{3}:="Invoice Allocation Transfer"
	DB_al_UpdateFeaturesVersion{3}:=3
	DB_abo_UpdateFeaturesAsync{3}:=True:C214
	DB_at_UpdateFeatures{4}:="Validate List Item IDs"
	DB_al_UpdateFeaturesVersion{4}:=1
	DB_abo_UpdateFeaturesAsync{4}:=False:C215
	DB_at_UpdateFeatures{5}:="Update Account Unique Value"
	DB_al_UpdateFeaturesVersion{5}:=1
	DB_abo_UpdateFeaturesAsync{5}:=False:C215
	DB_at_UpdateFeatures{6}:="Stock Items ID check"
	DB_al_UpdateFeaturesVersion{6}:=1
	DB_abo_UpdateFeaturesAsync{6}:=False:C215
	
	DB_at_UpdateFeatures{7}:="Movement Types Update"
	DB_al_UpdateFeaturesVersion{7}:=3
	DB_abo_UpdateFeaturesAsync{7}:=True:C214
	DB_at_UpdateFeatures{8}:="Contact Soundex"
	DB_al_UpdateFeaturesVersion{8}:=2
	DB_abo_UpdateFeaturesAsync{8}:=True:C214
	
	DB_at_UpdateFeatures{9}:="Allocations Tax Date Transfer"
	DB_al_UpdateFeaturesVersion{9}:=1
	DB_abo_UpdateFeaturesAsync{9}:=False:C215
	DB_at_UpdateFeatures{10}:="Invoices_Check Cleared Date"
	DB_al_UpdateFeaturesVersion{10}:=4
	DB_abo_UpdateFeaturesAsync{10}:=False:C215
	DB_at_UpdateFeatures{11}:="List PropertiesUpdate"
	DB_al_UpdateFeaturesVersion{11}:=1
	DB_abo_UpdateFeaturesAsync{11}:=False:C215
	DB_at_UpdateFeatures{12}:="Company Soundex Update"
	DB_al_UpdateFeaturesVersion{12}:=1
	DB_abo_UpdateFeaturesAsync{12}:=False:C215
	DB_at_UpdateFeatures{13}:="Contact Soundex Update"
	DB_al_UpdateFeaturesVersion{13}:=1
	DB_abo_UpdateFeaturesAsync{13}:=False:C215
	DB_at_UpdateFeatures{14}:="Module Button Settings"
	DB_al_UpdateFeaturesVersion{14}:=1
	DB_abo_UpdateFeaturesAsync{14}:=False:C215
	DB_at_UpdateFeatures{15}:="Diary Setup"
	DB_al_UpdateFeaturesVersion{15}:=1
	DB_abo_UpdateFeaturesAsync{15}:=False:C215
	DB_at_UpdateFeatures{16}:="Stock Revision"
	DB_al_UpdateFeaturesVersion{16}:=1
	DB_abo_UpdateFeaturesAsync{16}:=True:C214
	DB_at_UpdateFeatures{17}:="13to14 Preperation"
	DB_al_UpdateFeaturesVersion{17}:=2
	
	DB_abo_UpdateFeaturesAsync{17}:=True:C214
	If (False:C215)
		DB_at_UpdateFeatures{2}:="Diary Date Stamp"
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=True:C214
		DB_at_UpdateFeatures{2}:="Update Order IDS"
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=False:C215
		DB_at_UpdateFeatures{2}:="Update Order Sort Date"
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=False:C215
		DB_at_UpdateFeatures{2}:="Update Contact IDs"
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=True:C214
		
		DB_at_UpdateFeatures{2}:="Check Qualities"
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=True:C214
		//Update Version5.0
		DB_at_UpdateFeatures{2}:=""
		DB_al_UpdateFeaturesVersion{2}:=1
		DB_abo_UpdateFeaturesAsync{2}:=False:C215
	End if 
	
	//Email Check
	//Transactions
	//tax period check-has to run if document is there
	//Check_List items
	//restore indexes has to run at startup
	//sales allocation
	
	//all updates added on to this array(new ones only ever added at the end!!!!!!!!!
	While (Semaphore:C143("LoadingValidationPrefs"))
		DelayTicks(2)
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
	$_l_offset:=0
	ARRAY LONGINT:C221(DB_al_StoredUpdates; 0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		VARIABLE TO BLOB:C532(DB_al_StoredUpdates; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		//Here will be needed a routine to update the system based on the  current running
		//otherwise all the updates since version 1.0 will rerun and we don’t want that!!
	Else 
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_al_StoredUpdates; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
	End if 
	CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
	
	//Now we have  the current values we can check against the arrays at the top of th
	If (Size of array:C274(DB_al_StoredUpdates)<Size of array:C274(DB_al_UpdateFeaturesVersion))
		$_l_SizeofArray:=Size of array:C274(DB_al_UpdateFeaturesVersion)
		ARRAY LONGINT:C221(DB_al_StoredUpdates; $_l_SizeofArray)
	End if 
	
	If (DB_al_UpdateFeaturesVersion{1}>DB_al_StoredUpdates{1})  //Update Company Address
		
		//this update needs to be done
		$_l_Process:=New process:C317("UPD_CheckCoAddress"; 64000; "Update Address records"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{1}; 1; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{1}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	End if 
	If (DB_al_UpdateFeaturesVersion{12}>DB_al_StoredUpdates{12})  //Update Company Phonetic Name
		
		//this update needs to be done
		DB_SetAlltriggers(-1; Table:C252(->[COMPANIES:2]))
		$_l_Process:=New process:C317("Update_CompanySoundex"; 64000; "Update Phonetic Names"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{12}; 12; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{12}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
		DB_SetAlltriggers(0; Table:C252(->[COMPANIES:2]))
		
	End if 
	If (False:C215)
		If (DB_al_UpdateFeaturesVersion{13}>DB_al_StoredUpdates{13})  //Update COntact Phonetic Name
			
			//this update needs to be done
			DB_SetAlltriggers(-1; Table:C252(->[CONTACTS:1]))
			
			
			$_l_Process:=New process:C317("UPD_ContactSoundex"; 64000; "Update Phonetic Names"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{13}; 13; *)
			//Note the parameter passed to the process here
			//if that is not asyncronous and is a process have to wait
			If (DB_abo_UpdateFeaturesAsync{13}=False:C215) | (Not:C34($_bo_NormalStartup))
				Repeat 
					$_l_ProcessState:=Process state:C330($_l_Process)
					DelayTicks(30*60)
				Until ($_l_ProcessState<0)
			End if 
			DB_SetAlltriggers(0; Table:C252(->[CONTACTS:1]))
			
		End if 
	End if 
	If (DB_al_UpdateFeaturesVersion{2}>DB_al_StoredUpdates{2})  //check email addresses
		
		//this update needs to be done
		DB_SetAlltriggers(-1; Table:C252(->[CONTACTS:1]))
		$_l_Process:=New process:C317("EmailAddressUpdate"; 64*1024; "Checking Email addresses"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{2}; 2; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{2}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
		DB_SetAlltriggers(0; Table:C252(->[CONTACTS:1]))
	End if 
	
	If (DB_al_UpdateFeaturesVersion{3}>DB_al_StoredUpdates{3})  //Invoice allocation transfer
		
		//this update needs to be done
		DB_SetAlltriggers(-1; Table:C252(->[INVOICES:39]))
		$_l_Process:=New process:C317("SI_transfer"; 128*1024; "Transfer Sales Allocation"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{3}; 3; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{3}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
		DB_SetAlltriggers(0; Table:C252(->[INVOICES:39]))
	End if 
	
	If (DB_al_UpdateFeaturesVersion{4}>DB_al_StoredUpdates{4})  //Validate List Item IDs
		
		//this update needs to be done
		$_l_Process:=New process:C317("AA_FixListItems"; 64*1024; "Validating List Items IDs"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{4}; 4; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{4}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	End if 
	If (DB_al_UpdateFeaturesVersion{11}>DB_al_StoredUpdates{11})  //Modify list properties-new Property blob
		
		//this update needs to be done
		$_l_Process:=New process:C317("AA_UpdateListProperties"; 64*1024; "Validating List Items IDs"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{11}; 11; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{11}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	End if 
	If (DB_al_UpdateFeaturesVersion{5}>DB_al_StoredUpdates{5})  //Build Account Unique Value
		
		//this update needs to be done
		$_l_Process:=New process:C317("ACC_11Update"; 192*1024; "Validating Transactions"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{5}; 5; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{5}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	Else 
		If ($_bo_NormalStartup)
			//this call will just start the monitoring preferences
			$_l_Process:=New process:C317("ACC_11Update"; 192*1024; "Validating Transactions"; False:C215; *)
		End if 
		
	End if 
	If (DB_al_UpdateFeaturesVersion{6}>DB_al_StoredUpdates{6})  //Stock Items ID check
		
		//this update needs to be done
		$_l_Process:=New process:C317("Stock_itemsupdate"; 64000; "Check Stock Item IDs"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{6}; 6; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{6}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	End if 
	If (False:C215)
		If (DB_al_UpdateFeaturesVersion{7}>DB_al_StoredUpdates{7})  //Movement Types Numbers Change
			
			//SPLASH_UPDATE ("";0;-1)
			//this update needs to be done
			$_l_Process:=New process:C317("UPD_MovementTypeNumbers"; 64000; "Movement Type Updates "; True:C214; DB_al_UpdateFeaturesVersion{7}; 7; *)
			//Note the parameter passed to the process here
			//if that is not asyncronous and is a process have to wait
			If (DB_abo_UpdateFeaturesAsync{7}=False:C215) | (Not:C34($_bo_NormalStartup))
				Repeat 
					$_l_ProcessState:=Process state:C330($_l_Process)
					DelayTicks(30*60)
				Until ($_l_ProcessState<0)
			End if 
		End if 
	End if 
	
	If (DB_al_UpdateFeaturesVersion{8}>DB_al_StoredUpdates{8})  //soundex Update for contacts
		
		//SPLASH_UPDATE ("";0;-1)
		//this update needs to be done
		$_l_Process:=New process:C317("UPD_ContactSoundex"; 64000; "Contact Soundex"; True:C214; DB_al_UpdateFeaturesVersion{8}; 8; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{8}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
		End if 
	End if 
	
	If (DB_al_UpdateFeaturesVersion{9}>DB_al_StoredUpdates{9})  //Invoice allocation tax date transfer
		
		$_bo_JustToAvoidProblems:=True:C214
		$_l_Process:=New process:C317("SI_transfertaxdate"; 128*1024; "Transfer Allocation Tax Date"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{9}; 9; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{9}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
			
		End if 
		
	End if 
	If (DB_al_UpdateFeaturesVersion{10}>DB_al_StoredUpdates{10})  //Invoice allocation tax date transfer
		
		$_l_Process:=New process:C317("INV_ImplementClearedDate"; 128*1024; "Set Cleared Date"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{10}; 10; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{10}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
			
		End if 
		
	End if 
	If (DB_al_UpdateFeaturesVersion{14}>DB_al_StoredUpdates{14})  //Invoice allocation tax date transfer
		
		$_l_Process:=New process:C317("MOD_UpdateButtonSettings"; 128*1024; "Set Buttons"; $_bo_JustToAvoidProblems; DB_al_UpdateFeaturesVersion{14}; 14; *)
		//Note the parameter passed to the process here
		//if that is not asyncronous and is a process have to wait
		If (DB_abo_UpdateFeaturesAsync{14}=False:C215) | (Not:C34($_bo_NormalStartup))
			Repeat 
				$_l_ProcessState:=Process state:C330($_l_Process)
				DelayTicks(30*60)
			Until ($_l_ProcessState<0)
			
		End if 
		
	End if 
	If (DB_al_UpdateFeaturesVersion{15}>DB_al_StoredUpdates{15})  //Invoice allocation tax date transfer
		
		$_l_NextRevision:=DB_al_UpdateFeaturesVersion{15}
		While (Semaphore:C143("LoadingValidationPrefs"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
		$_l_offset:=0
		$_l_Element:=15
		ARRAY LONGINT:C221($_al_StoredUpdates; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
				$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
			Else 
				$_l_CurrentRevision:=0
			End if 
			
		Else 
			$_l_CurrentRevision:=0
		End if 
		CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
		
		If (SD2_SetupActionUsage)
			VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
			//Note the parameter passed to the process here
			//if that is not asyncronous and is a process have to wait
		End if 
		
		
		
	End if 
	If (DB_al_UpdateFeaturesVersion{16}>DB_al_StoredUpdates{16})  //Invoice allocation tax date transfer
		
		$_l_NextRevision:=DB_al_UpdateFeaturesVersion{16}
		While (Semaphore:C143("LoadingValidationPrefs"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
		$_l_offset:=0
		$_l_Element:=16
		ARRAY LONGINT:C221($_al_StoredUpdates; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
				$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
			Else 
				$_l_CurrentRevision:=0
			End if 
			
		Else 
			$_l_CurrentRevision:=0
		End if 
		If (False:C215)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215)
			//TRACE
			If (Records in selection:C76([PRODUCTS:9])>0)
				UNLOAD RECORD:C212([PRODUCTS:9])
				$_l_Process:=New process:C317("STK_Manage2011Updates"; 512*1024; "Setup Stock")
			End if 
			
			
		End if 
		CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
		
		
	End if 
	If (DB_al_UpdateFeaturesVersion{17}>DB_al_StoredUpdates{17})  //Iv13 rto V14
		
		$_l_NextRevision:=DB_al_UpdateFeaturesVersion{17}
		While (Semaphore:C143("LoadingValidationPrefs"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
		$_l_offset:=0
		$_l_Element:=17
		ARRAY LONGINT:C221($_al_StoredUpdates; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
				$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
			Else 
				$_l_CurrentRevision:=0
			End if 
			
		Else 
			$_l_CurrentRevision:=0
		End if 
		If (Application type:C494#4D Remote mode:K5:5)
			DB_UpgradeV13toV14
		End if 
		
		VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
		
	End if 
	
End if 
LAY_UpdateFonts  //one time setting of fonts!



<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck  //Updated to 4 so will run the updates

QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Checked:12<<>SCPT_l_CheckVersion)
If (Records in selection:C76([SCRIPTS:80])>0)
	While (Semaphore:C143("UpdatingMacros"))
		DelayTicks
	End while 
	
	READ WRITE:C146([SCRIPTS:80])
	LOAD RECORD:C52([SCRIPTS:80])
	DB_lockFile(->[SCRIPTS:80])
	APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8:=[SCRIPTS:80]Table_Number:8)
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
	
	CLEAR SEMAPHORE:C144("UpdatingMacros")
	//if the macros needed updating then so might list layouts
	DB_UpdateLIstLayoutFormulas
End if 
UNLOAD RECORD:C212([SCRIPTS:80])
SR_Update
ERR_MethodTrackerReturn("VER_UpdateRoutines"; $_t_oldMethodName)
