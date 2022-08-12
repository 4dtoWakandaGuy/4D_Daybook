//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SubLPInv
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

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPInv")
//Trans_SubLPInv
Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)
$0:=True:C214
If (OK=1)
	If (Count parameters:C259=0)
		
		Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
		If ([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#"")
			If ([INVOICES:39]Posted_Date:8=!00-00-00!)
				Gen_Alert("That Invoice has not been Posted"; "")
				[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=""
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
				[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
				Gen_Alert("NB: Invoice "+[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4+" has "+[INVOICES:39]Currency_Code:27+String:C10([INVOICES:39]Total_Due:7; "|Accounts")+" outstanding"; "")
			End if 
		End if 
	Else 
		Check_MinorNC($1; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
		If ($1->#"")
			If ([INVOICES:39]Posted_Date:8=!00-00-00!)
				Gen_Alert("That Invoice has not been Posted"; "")
				$1->:=""
				$0:=False:C215
			Else 
				$0:=True:C214
				$2->:=[INVOICES:39]Company_Code:2
				$3->:=[INVOICES:39]Currency_Code:27
				Gen_Alert("NB: Invoice "+$1->+" has "+[INVOICES:39]Currency_Code:27+String:C10([INVOICES:39]Total_Due:7; "|Accounts")+" outstanding"; "")
			End if 
		End if 
	End if 
Else 
	If (Count parameters:C259>0)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPInv"; $_t_oldMethodName)
