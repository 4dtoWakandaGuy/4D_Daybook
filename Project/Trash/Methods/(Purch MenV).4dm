//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_Menu)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>ProdCode; $_t_FirstChar; $_t_oldMethodName; $_t_SecondChar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch MenV")
$_l_Menu:=Sel_LPmi("Purch MenV")
<>ContCode:=""
<>CompCode:=[PURCHASE_INVOICES:37]Company_Code:2
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=vProc
<>AutoFile:="Purchases"
Case of 
	: ($_l_Menu=1)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])); Module_PurchaseLedger; ""; ->[PURCHASE_INVOICES:37]Company_Code:2)
		
	: ($_l_Menu=2)
		If (LBi_FindLine(->PUR_aPtr_LBItemsSetup))
			<>ProdCode:=[PURCHASE_INVOICE_ITEMS:158]Product_Code:1
			//UNLOAD RECORD([PRODUCTS])
			//ZProducts_Mod ([PURCHASES_ITEMS]Product Code)
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); Module_PurchaseLedger; ""; ->[PRODUCTS:9]Product_Code:1; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
			
		End if 
	: ($_l_Menu=3)
		
		If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
			$_t_FirstChar:=[PURCHASE_INVOICES:37]Purchase_Code:1[[1]]
			If (Length:C16([PURCHASE_INVOICES:37]Purchase_Code:1)>1)
				$_t_SecondChar:=[PURCHASE_INVOICES:37]Purchase_Code:1[[2]]
			Else 
				$_t_SecondChar:=""
			End if 
			If ($_t_SecondChar#"S")
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])); Module_PurchaseLedger; ""; ->[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22; [PURCHASE_INVOICES:37]Purchase_Code:1)
				
				
				//ZProc ("TransB_Mod";◊K2;"View Batches";"0";"";[PURCHASES]Purchase Code)
			Else 
				Gen_Alert("Batches Must be viewed from the invoice or deposit")
				
				
			End if 
			
		End if 
	: ($_l_Menu=5)
		Purchases_Alloc
End case 
ERR_MethodTrackerReturn("Purch MenV"; $_t_oldMethodName)
