//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SubLPPur
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 06:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPPur")
//Trans_SubLPPur
Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)
If (OK=1)
	If (Count parameters:C259=0)
		Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; "Purchase")
		If ([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22#"")
			If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
				Gen_Alert("That Purchase has not been Posted"; "")
				[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=""
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
				Gen_Alert("NB: Purchase "+[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22+" has £"+String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")+" outstanding"; "")
			End if 
		End if 
	Else 
		Check_MinorNC($1; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; "Purchase")
		If ($1->#"")
			If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
				Gen_Alert("That Purchase has not been Posted"; "")
				$1->:=""
				$0:=False:C215
			Else 
				$0:=True:C214
				$2->:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
				$3->:=[PURCHASE_INVOICES:37]Company_Code:2
				Gen_Alert("NB: Purchase "+$1->+" has £"+String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")+" outstanding"; "")
			End if 
		Else 
			$0:=False:C215
		End if 
	End if 
	
Else 
	If (Count parameters:C259>=1)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPPur"; $_t_oldMethodName)
