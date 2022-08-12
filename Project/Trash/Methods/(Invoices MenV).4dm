//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    14/09/2010 23:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_MenuOption; $_l_SelectedRecordNumber; $1)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; $_t_FirstChar; $_t_InvoiceNumber; $_t_oldMethodName; $_t_secondChar)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices MenV")
If (Count parameters:C259>=1)
	$_l_MenuOption:=$1
Else 
	$_l_MenuOption:=Sel_LPmi("Invoices MenV")
End if 
If ((FORM Get current page:C276=1) | ([INVOICES:39]Delivery_Company:30=""))
	<>CompCode:=[INVOICES:39]Company_Code:2
	<>ContCode:=[INVOICES:39]Contact_Code:3
Else 
	<>CompCode:=[INVOICES:39]Delivery_Company:30
	<>ContCode:=[INVOICES:39]Delivery_Contact:31
End if 
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=Current process:C322
<>AutoFile:="Invoices"
SAVE RECORD:C53([INVOICES:39])
COPY NAMED SELECTION:C331([INVOICES:39]; "$_CurrentSelection")
$_l_SelectedRecordNumber:=Selected record number:C246([INVOICES:39])
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
Case of 
	: ($_l_MenuOption=1)
		DBI_DisplayRecord(0; Table:C252(->[COMPANIES:2]); ""; [INVOICES:39]Company_Code:2)
		//DBI_MenuDisplayRecords ("Companies";Module_SalesLedger ;"";->[INVOICES]Company Code)
		
	: ($_l_MenuOption=2)
		DBI_DisplayRecord(0; Table:C252(->[CONTACTS:1]); ""; [INVOICES:39]Contact_Code:3)
		
		//DBI_MenuDisplayRecords ("Contacts";Module_SalesLedger ;"";->[INVOICES]Contact Code)
	: ($_l_MenuOption=3)
		If (LBi_FindLine(->INV_aptr_ListboxSetup))
			DBI_DisplayRecord(0; Table:C252(->[PRODUCTS:9]); ""; [INVOICES_ITEMS:161]Product_Code:1)
		End if 
	: ($_l_MenuOption=4)
		If ([INVOICES:39]Invoice_Number:1#"")
			$_t_FirstChar:=[INVOICES:39]Invoice_Number:1[[1]]
			If (Length:C16([INVOICES:39]Invoice_Number:1)>1)
				$_t_secondChar:=[INVOICES:39]Invoice_Number:1[[2]]
			Else 
				$_t_secondChar:=""
			End if 
			If ($_t_secondChar#"R")
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])); Module_SalesLedger; ""; ->[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4; [INVOICES:39]Invoice_Number:1)
				
			Else 
				Gen_Alert("Batches Must be viewed from the invoice or deposit")
				
				
			End if 
			
		End if 
		
	: ($_l_MenuOption=6) | ($_l_MenuOption=5)
		Invoices_Alloc
	: ($_l_MenuOption=7)  //Diary
	: ($_l_MenuOption=8)  //Documents
	: ($_l_MenuOption=9)  //order items
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); Module_SalesLedger; ""; ->[ORDER_ITEMS:25]Invoice_Number:17; [INVOICES:39]Invoice_Number:1)
	: ($_l_MenuOption=12)
		
		FurthFld_Func2(->[INVOICES:39])
	: ($_l_MenuOption=13)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES_ITEMS:161])); Module_SalesLedger; ""; ->[INVOICES_ITEMS:161]INVOICES_CODE:18; [INVOICES:39]Invoice_Number:1)
		
End case 
USE NAMED SELECTION:C332("$_CurrentSelection")
If ($_t_InvoiceNumber#[INVOICES:39]Invoice_Number:1)
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
End if 
ERR_MethodTrackerReturn("Invoices MenV"; $_t_oldMethodName)