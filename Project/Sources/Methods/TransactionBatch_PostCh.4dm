//%attributes = {}

If (False:C215)
	//Project Method Name:      TransactionBatch_PostCh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; vHideMessages)
	C_DATE:C307($_d_TransactionDate)
	C_LONGINT:C283($1; vControl)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_Alert; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_LayerCode; $_t_oldMethodName)
	C_TEXT:C284($_t_PeriodCode; $_t_SystemAccessType; $_t_TaxCode; $_t_Title; $_t_TransactionCurrency; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage3; EMAIL_t_EmailType; EMAIL_t_SendCalledFrom; SYS_t_AccessType; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransactionBatch_PostCh")

DB_ErrorReportSettings
$_t_oldMethodName:=ERR_MethodTracker("TransactionBatch_PostCh")


OK:=1
vControl:=1
While ((vControl=1) & (OK=1))
	$_t_Alert:=""
	If ([TRANSACTION_BATCHES:30]Zero:13#0)
		$_t_Alert:="The Credit postings must balance the Debits."
	End if 
	$_t_PeriodCode:=""
	$_d_TransactionDate:=!00-00-00!
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
	While ((Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155]))) & ($_t_Alert=""))
		If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="")
			$_t_Alert:="At least one line has no Transaction Type specified"
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Period_Code:11="")
			$_t_Alert:="At least one Period Code is not specified"
		End if 
		If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=""))
			$_t_Alert:="At least one line has no Accounts specified"
		Else 
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
				If (Records in selection:C76([ACCOUNTS:32])=0)
					$_t_Alert:="The Account "+[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3+" does not exist"
				End if 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
				If (Records in selection:C76([ACCOUNTS:32])=0)
					$_t_Alert:="The Account "+[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12+" does not exist"
				End if 
			End if 
		End if 
		If (([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0) & ($_t_Alert=""))
			$_t_TaxCode:=Term_VATWT("VAT")
			If ($_t_TaxCode#"VAT")
				If (([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"S") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"P") & ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"S") & ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"P"))
					$_t_Alert:="A Tax Amount has been specified that is not allocated to"+" S - Sales or P - Purchases"
				End if 
			Else 
				If (([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"I@") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"O@") & ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"I@") & ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"O@"))
					$_t_Alert:="A Tax Amount has been specified that is not allocated to"+" I - Input or O - Output"
				End if 
			End if 
		End if 
		If (($_t_PeriodCode="") & (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")))
			$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
			$_d_TransactionDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
			$_t_TransactionCurrency:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
			$_t_LayerCode:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
		End if 
		If (($_t_PeriodCode#"") & (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")))
			If (($_t_PeriodCode#[TRANSACTION_BATCH_ITEMS:155]Period_Code:11) | ($_d_TransactionDate#[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5))
				$_t_Alert:="All single-sided transactions in the batch must have the same Date and Period"
			End if 
			If ($_t_TransactionCurrency#[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19)
				$_t_Alert:="All single-sided transactions in the batch must be in the same Currency"
			End if 
			If ($_t_LayerCode#[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
				$_t_Alert:="All single-sided transactions in the batch must be allocated to the same Account"+"s Layer"
			End if 
		End if 
		If ($_t_Alert#"")  //added 27/03/07 -kmw
			//TRACE//added 27/03/07 -kmw
		End if   //added 27/03/07 -kmw
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End while 
	
	If (((([TRANSACTION_BATCHES:30]Control_Amount:7>0) | ([TRANSACTION_BATCHES:30]Control_Tax:8>0) | ([TRANSACTION_BATCHES:30]Control_Total:9>0)) & (([TRANSACTION_BATCHES:30]Batch_Amount:3>0) | ([TRANSACTION_BATCHES:30]Batch_Tax:4>0) | ([TRANSACTION_BATCHES:30]Batch_Total:5>0))) | ($_t_Alert#""))
		$_t_Title:=""
		If (([TRANSACTION_BATCHES:30]Control_Amount:7>0) & ([TRANSACTION_BATCHES:30]Batch_Amount:3#[TRANSACTION_BATCHES:30]Control_Amount:7))
			$_t_Title:=" Amount"
		End if 
		If (([TRANSACTION_BATCHES:30]Control_Tax:8>0) & ([TRANSACTION_BATCHES:30]Batch_Tax:4#[TRANSACTION_BATCHES:30]Control_Tax:8))
			$_t_Title:=$_t_Title+" VAT"
		End if 
		If (([TRANSACTION_BATCHES:30]Control_Total:9>0) & ([TRANSACTION_BATCHES:30]Batch_Total:5#[TRANSACTION_BATCHES:30]Control_Total:9))
			$_t_Title:=$_t_Title+" Total"
		End if 
		If (($_t_Title#"") | ($_t_Alert#""))
			
			If (vHideMessages)  //added 27/03/07 -kmw
				If ($_t_Alert#"")  //added 27/03/07 -kmw
					$_t_EmailText:=$_t_Alert  //added 27/03/07 -kmw
				Else   //added 27/03/07 -kmw
					$_t_EmailText:="The Control "+$_t_Title+" has not been met."  //added 27/03/07 -kmw
				End if   //added 27/03/07 -kmw
				
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					LOGIN_SetEmail
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				
				
				If (<>PER_t_CurrentEmailFrom#"")
					
					EMAIL_t_EmailType:="To"  //added 27/03/07 -kmw
					$_t_EmailSentTo:="To"  //added 27/03/07 -kmw
					$_t_EmailAttachment:=""  //added 27/03/07 -kmw
					EMAIL_t_SendCalledFrom:="TransactionBatch_PostCh"
					$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)  //added 27/03/07 -kmw
				End if   //added 27/03/07 -kmw
				
				vControl:=0  //to break out of loop
				
			Else   //added 27/03/07 -kmw
				If ($_t_Alert#"")
					Gen_Alert($_t_Alert; "Try again")
				Else 
					Gen_Confirm("The Control "+$_t_Title+" has not been met.  Check it?"; "Yes"; "Ignore it")
				End if 
				If (OK=0)
					vControl:=0
					OK:=1
				Else 
					If (Count parameters:C259=0)
						vLayer:=""
						DB_t_CurrentFormUsage3:="Pch"
						$_t_SystemAccessType:=SYS_t_AccessType
						SYS_t_AccessType:=""
						//TransB_FileI
						//Open_Pro_Window ("Please correct the Transaction Batch";0;2;->[TRANS IN];WIN_t_CurrentInputForm)
						DBI_DisplayRecord(-Current process:C322; Table:C252(->[TRANSACTION_BATCHES:30]); "Please correct the Transaction Batch")
						
						
						//MODIFY RECORD([TRANS IN];*)
						//Close_ProWin (Table name(->[TRANS IN])+"_"+WIN_t_CurrentInputForm)
						If (DB_t_CallOnCloseorSave="AS")  //for Access Switch
							OK:=1  //Necessary cos it wrongly returns 0
						End if 
						SYS_t_AccessType:=$_t_SystemAccessType
						DB_t_CurrentFormUsage3:=""
						If (OK=1)
							TransB_InCalc
							TransactionBatch_PostCh
						Else 
							DELETE RECORD:C58([TRANSACTION_BATCHES:30])
							vControl:=0
							OK:=0
						End if 
					Else 
						vControl:=0
						OK:=0
					End if 
				End if 
			End if 
		Else 
			vControl:=0
		End if 
	Else 
		vControl:=0
	End if 
End while 
ERR_MethodTrackerReturn("TransactionBatch_PostCh"; $_t_oldMethodName)
