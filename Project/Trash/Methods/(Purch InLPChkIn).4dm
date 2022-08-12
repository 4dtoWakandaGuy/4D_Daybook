//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InLPChkIn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoPurchaseCode; $0)
	C_TEXT:C284($_t_CompanyCode; $_t_InvoiceNumber; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPChkIn")
//Purch_InLPChkIn
If (([PURCHASE_INVOICES:37]Company_Code:2#"") & ([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4#""))
	If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
		$_bo_NoPurchaseCode:=True:C214
		[PURCHASE_INVOICES:37]Purchase_Code:1:=Substring:C12("*"+String:C10(Num:C11(Export_Stamp)+Num:C11([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)); 1; 11)
	Else 
		$_bo_NoPurchaseCode:=False:C215
	End if 
	DB_SaveRecord(->[PURCHASE_INVOICES:37])
	$_t_InvoiceNumber:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
	$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
	CUT NAMED SELECTION:C334([PURCHASE_INVOICES:37]; "$Selection")
	QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$_t_CompanyCode; *)
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$_t_InvoiceNumber)
	If (Records in selection:C76([PURCHASE_INVOICES:37])>1)
		Gen_Alert("Invoice No "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" has already been entered for Supplier "+[PURCHASE_INVOICES:37]Company_Code:2; "Try again")
		$0:=False:C215
	Else 
		$0:=True:C214
	End if 
	USE NAMED SELECTION:C332("$Selection")
	If ($_bo_NoPurchaseCode)
		[PURCHASE_INVOICES:37]Purchase_Code:1:=""
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Purch_InLPChkIn"; $_t_oldMethodName)
