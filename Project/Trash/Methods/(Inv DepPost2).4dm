//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv_DepPost2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283(DS_l_BATCHITEMRef)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv_DepPost2")
//Project Method Inv_DepPost2 26/3/2(ID 6047-1394)

CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)

[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSDeposit
If ([INVOICES:39]Comments:12="")
	[TRANSACTION_BATCH_ITEMS:155]Description:10:="Deposit "+[INVOICES:39]Invoice_Number:1
Else 
	[TRANSACTION_BATCH_ITEMS:155]Description:10:=[INVOICES:39]Comments:12
End if 
If ([INVOICES:39]Debtors_Account:15#"")
	[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[INVOICES:39]Debtors_Account:15
Else 
	[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Debit_Account:4
End if 
If ([INVOICES:39]Bank_Account:16#"")
	[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[INVOICES:39]Bank_Account:16
Else 
	[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Credit_Account:5
End if 
[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
TransB_DC
[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vInvDate
[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[INVOICES:39]Period_Code:13
[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
//   RELATE ONE([TRANS IN_TRANS SUB]Tax Code)
[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[INVOICES:39]Total_Paid:6
[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
[TRANSACTION_BATCH_ITEMS:155]Total:9:=[INVOICES:39]Total_Paid:6
[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
	[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
End if 
[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=[INVOICES:39]Cheque_Number:36
If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
	[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
End if 
DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
ERR_MethodTrackerReturn("Inv_DepPost2"; $_t_oldMethodName)