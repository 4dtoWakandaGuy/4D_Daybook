//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InPLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2010 09:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver; <>TermRP; PI_bo_NoListbox)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName; vAccount; vAnalysis; vBAccount; vInvTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InPLPB")
//Project Method Purch_InPLPB 26/3/2(ID 14981-1274)

If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
	// Purch_Code
	//[PURCHASES]Purchase Code:="*P"+[PURCHASES]Purchase Code
	//[PURCHASES]Purch Inv_No:=[PURCHASES]Purchase Code
	vDate:=<>DB_d_CurrentDate
	$_l_PeriodID:=Check_Period
	Check_PerCloseP
	[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
End if 
[PURCHASE_INVOICES:37]State:24:=-2
PI_bo_NoListbox:=True:C214
Purch_InLPB(False:C215)

QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay)
If ([PURCHASE_INVOICES:37]Creditors_Account:13="")
	[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Debit_Account:4
	[PURCHASE_INVOICES:37]Bank_Account:14:=[TRANSACTION_TYPES:31]Credit_Account:5
	If (<>PersAnOver=False:C215)
		[PURCHASE_INVOICES:37]Analysis_Code:15:=[TRANSACTION_TYPES:31]Analysis_Code:7
	End if 
	[PURCHASE_INVOICES:37]Invoice_Date:5:=<>DB_d_CurrentDate
End if 
RELATE ONE:C42([PURCHASE_INVOICES:37]Creditors_Account:13)
vAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([PURCHASE_INVOICES:37]Bank_Account:14)
vBAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([PURCHASE_INVOICES:37]Analysis_Code:15)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
If (<>TermRP)
	vInvTitle:="PRE-PAYMENT"
Else 
	vInvTitle:="PURCHASE PRE-PAYMENT"
End if 
ERR_MethodTrackerReturn("Purch_InPLPB"; $_t_oldMethodName)