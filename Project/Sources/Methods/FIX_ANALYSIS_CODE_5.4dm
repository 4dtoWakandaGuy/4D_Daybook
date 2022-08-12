//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_CODE_5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($I)
	C_TEXT:C284($_t_oldMethodName; vWT_AnalysisCode; vWT_AnalysisCodeReq; ACC_t_AnalysisPeriodtoFix; vWT_MESSAGE; vWT_POCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_CODE_5")
//Project Method FIX_ANALYSIS_COD/3/2(ID 21399-1650)

//FIX_ANALYSIS_CODE_5: WT>11/15/00: fixes the Anaylsis Codes: [TRANSACTIONS]
MESSAGES ON:C181
READ WRITE:C146(*)

//ALL RECORDS([TRANSACTIONS])`10/07/02 pb
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=""; *)
QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12#"")
If (Records in selection:C76([TRANSACTIONS:29])>0)
	CREATE SET:C116([TRANSACTIONS:29]; "WT_One")
End if 
USE SET:C118("WT_One")  //[TRANSACTIONS]
If (Records in set:C195("WT_One")>0)
	For ($i; 1; Records in set:C195("WT_One"))  //[TRANSACTIONS]
		USE SET:C118("WT_One")
		GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $i)
		MESSAGE:C88("Please wait, processing Transactions record number "+String:C10($i)+" of "+String:C10(Records in set:C195("WT_One")))
		//    ALL RECORDS([PURCHASES])`10/07/02 pb
		QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=[TRANSACTIONS:29]Purchase_invoice_number:19)
		vWT_AnalysisCode:=[PURCHASE_INVOICES:37]Analysis_Code:15
		vWT_POCode:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		USE SET:C118("WT_One")
		GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $i)
		If ([TRANSACTIONS:29]Analysis_Code:2="")
			[TRANSACTIONS:29]Analysis_Code:2:=vWT_AnalysisCode
			DB_SaveRecord(->[TRANSACTIONS:29])
			AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
			NEXT RECORD:C51([TRANSACTIONS:29])
		Else 
			NEXT RECORD:C51([TRANSACTIONS:29])
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("FIX_ANALYSIS_CODE_5"; $_t_oldMethodName)