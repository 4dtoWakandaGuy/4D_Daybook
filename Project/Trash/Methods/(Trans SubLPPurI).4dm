//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SubLPPurI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 20:16
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

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPPurI")
//Trans_SubLPPurI
Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17)
$0:=False:C215
If (OK=1)
	If (Count parameters:C259=0)
		Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchase")
		If ([TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17#"")
			If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
				Gen_Alert("That Purchase has not been Posted"; "")
				[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=""
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
				Gen_Alert("NB: Purchase "+[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17+" has £"+String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")+" outstanding"; "")
			End if 
		End if 
	Else 
		Check_MinorNC($1; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchase")
		If ($1->#"")
			If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
				Gen_Alert("That Purchase has not been Posted"; "")
				$1->:=""
				$0:=False:C215
			Else 
				$2->:=[PURCHASE_INVOICES:37]Purchase_Code:1
				$3->:=[PURCHASE_INVOICES:37]Company_Code:2
				Gen_Alert("NB: Purchase "+[PURCHASE_INVOICES:37]Purchase_Code:1+" has £"+String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")+" outstanding"; "")
				$0:=True:C214
			End if 
		Else 
			$0:=False:C215
			
		End if 
	End if 
Else 
	If (Count parameters:C259>0)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPPurI"; $_t_oldMethodName)
