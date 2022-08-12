If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCH_ITEMS]Trans_SubP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 20:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; INV_T_ANALINFO; INV_T_TRANS_INFO; vCAccName; VCompany; vDAccName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCH_ITEMS].Trans_SubP"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		INV_T_ANALINFO:=""
		INV_T_TRANS_INFO:=""
		If ([TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14#"")
			INV_T_TRANS_INFO:="Ch: "+[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14+"   "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Company_Code:13#"")
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Company_Code:13)
			INV_T_TRANS_INFO:=INV_T_TRANS_INFO+"Company: "+[TRANSACTION_BATCH_ITEMS:155]Company_Code:13+" "+[COMPANIES:2]Company_Name:2+"   "
		Else 
			VCompany:=""
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
			vCAccName:=[ACCOUNTS:32]Account_Name:3
		Else 
			vCAccName:=""
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2#"")
			INV_T_ANALINFO:="Analysis :"+[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2+"  "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20#"")
			INV_T_ANALINFO:=INV_T_ANALINFO+"Layer :"+[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20+"  "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
			vDAccName:=[ACCOUNTS:32]Account_Name:3
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#"")
			INV_T_TRANS_INFO:=INV_T_TRANS_INFO+"invoice : "+[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4+"   "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17#"")
			INV_T_TRANS_INFO:=INV_T_TRANS_INFO+"Purchase invoice : "+[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17+"  "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22#"")
			INV_T_TRANS_INFO:=INV_T_TRANS_INFO+"Purchase Order : "+[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22+"  "
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Job_Code:23#"")
			INV_T_TRANS_INFO:=INV_T_TRANS_INFO+"Job Code : "+[TRANSACTION_BATCH_ITEMS:155]Job_Code:23+"  "
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCH_ITEMS].Trans_SubP"; $_t_oldMethodName)
