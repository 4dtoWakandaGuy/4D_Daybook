//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_postUpdatePurchInvoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2010 18:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vHideMessages)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_InvoiceDate; $9)
	C_REAL:C285($_r_DebitTotal; $1; $8)
	C_TEXT:C284($_t_CompanyCode; $_t_NewPurchaseInvoiceNumber; $_t_oldMethodName; $_t_OLDPurchaseInvoiceNumber; $_t_PurchaseCode; $10; $11; $12; $13; $14; $15)
	C_TEXT:C284($2; $3; $4; $5; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_postUpdatePurchInvoice")

If ($2#"")
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$5)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$5)
	End if 
	If (($3=DB_GetLedgerTRANSPurINVPay) & ($4#"") & ($1=1) & (OK=1))
		READ WRITE:C146([PURCHASE_INVOICES:37])
		QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$2; *)
		QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Company_Code:2=$4)
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			If (Check_LockMess(->[PURCHASE_INVOICES:37]; "Purchase Ledger Item"))
				
				If (vHideMessages=False:C215)  //added 20/03/07 -kmw
					MESSAGE:C88(Char:C90(13)+"      Allocating to Purchase Invoice "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
				End if 
				
				$_t_NewPurchaseInvoiceNumber:=Substring:C12("*S"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; "*S"); 1; 11)
				$_t_OLDPurchaseInvoiceNumber:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
				$_t_PurchaseCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
				$_d_InvoiceDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
				$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
				If (($6="Reversal@") & ($7#[TRANSACTION_TYPES:31]Credit_Account:5))
					$_r_DebitTotal:=Gen_Round((0-$8); 2; 2)
				Else 
					$_r_DebitTotal:=$8
				End if 
				[PURCHASE_INVOICES:37]Total_Paid:8:=Gen_Round(([PURCHASE_INVOICES:37]Total_Paid:8+$_r_DebitTotal); 2; 2)
				[PURCHASE_INVOICES:37]Total_Due:9:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Paid:8); 2; 2)
				CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
				[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
				[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
				
				[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4:=$_t_NewPurchaseInvoiceNumber
				[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_NewPurchaseInvoiceNumber
				[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=$9
				[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=$_r_DebitTotal
				DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
				
				DB_SaveRecord(->[PURCHASE_INVOICES:37])
				//Create Payment record
				CREATE RECORD:C68([PURCHASE_INVOICES:37])
				[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_NewPurchaseInvoiceNumber
				[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=$_t_NewPurchaseInvoiceNumber
				[PURCHASE_INVOICES:37]State:24:=-3
				[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
				[PURCHASE_INVOICES:37]Invoice_Date:5:=$9
				[PURCHASE_INVOICES:37]Period_Code:3:=$10
				[PURCHASE_INVOICES:37]Company_Code:2:=$_t_CompanyCode
				[PURCHASE_INVOICES:37]Creditors_Account:13:=$11
				[PURCHASE_INVOICES:37]Bank_Account:14:=$7
				[PURCHASE_INVOICES:37]Comments:16:="Payment Posting"+Char:C90(13)+"Cheque No: "+$12
				[PURCHASE_INVOICES:37]Total_Paid:8:=$_r_DebitTotal
				[PURCHASE_INVOICES:37]Total_Due:9:=0
				[PURCHASE_INVOICES:37]Analysis_Code:15:=$13
				[PURCHASE_INVOICES:37]Currency_Code:23:=$14
				[PURCHASE_INVOICES:37]Layer_Code:28:=$15
				CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
				[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
				[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
				[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4:=$_t_OLDPurchaseInvoiceNumber
				[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_PurchaseCode
				[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=$_d_InvoiceDate
				[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=$_r_DebitTotal
				DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
				DB_SaveRecord(->[PURCHASE_INVOICES:37])
			End if 
		End if 
		UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
		READ ONLY:C145([PURCHASE_INVOICES:37])
	End if 
End if 
ERR_MethodTrackerReturn("TransB_postUpdatePurchInvoice"; $_t_oldMethodName)
