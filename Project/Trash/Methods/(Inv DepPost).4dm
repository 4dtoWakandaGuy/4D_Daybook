//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv DepPost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unlocked; $0)
	C_DATE:C307(<>DB_d_CurrentDate; vInvDate)
	C_LONGINT:C283($_l_TimeOut; $_l_TransPostStatus)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv DepPost")
//Invoices DepPost
$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 0)
$0:=True:C214
If (Not:C34($_bo_Unlocked))
	
	Gen_Confirm("Deposit No"+""+[INVOICES:39]Invoice_Number:1+"cannot be posted-it is in use."; "Wait"; "Stop")
	If (OK=0)
		$_bo_Unlocked:=False:C215
	Else 
		Repeat 
			$_l_TimeOut:=0
			Repeat 
				$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
				If (Not:C34($_bo_Unlocked))
					$_l_TimeOut:=$_l_TimeOut+1
				End if 
				DelayTicks(60)
			Until ($_bo_Unlocked=True:C214) | ($_l_TimeOut>100)
			If (Not:C34($_bo_Unlocked))
				Gen_Confirm("Deposit No"+""+[INVOICES:39]Invoice_Number:1+"is STILL locked by another user"; "Wait"; "Stop")
			End if 
		Until ($_bo_Unlocked=True:C214) | (OK=0)
	End if 
End if 

If (Not:C34($_bo_Unlocked))
	Gen_Alert("Deposit No "+[INVOICES:39]Invoice_Number:1+" cannot be posted - it is in use"; "Cancel")
	OK:=0
Else 
	OK:=1
	LOAD RECORD:C52([INVOICES:39])
	StartTransaction
	// [INVOICES]Posted Nominal:=2
	[INVOICES:39]Total_Invoiced:5:=0
	[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
	[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
	vInvDate:=[INVOICES:39]Invoice_Date:4
	DB_SaveRecord(->[INVOICES:39])
	If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (OK=1))
		READ WRITE:C146([TRANSACTION_BATCHES:30])
		CREATE RECORD:C68([TRANSACTION_BATCHES:30])
		BatchNo
		If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
			OK:=0
		Else 
			[TRANSACTION_BATCHES:30]Batch_Date:1:=vInvDate
			[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
			[TRANSACTION_BATCHES:30]Description:12:="Posting of Deposit "+[INVOICES:39]Invoice_Number:1
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
			Inv_DepPost2
			[TRANSACTION_BATCHES:30]Batch_Amount:3:=[INVOICES:39]Total_Paid:6
			[TRANSACTION_BATCHES:30]Batch_Tax:4:=0
			[TRANSACTION_BATCHES:30]Batch_Total:5:=[INVOICES:39]Total_Paid:6
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			$_l_TransPostStatus:=TransactionBatch_Post
			If ($_l_TransPostStatus>=0)
				//VALIDATE TRANSACTION
				Transact_End(True:C214)
			Else 
				Gen_Alert("Posting the Deposit to accounts has been cancelled")
				//CANCEL TRANSACTION
				Transact_End(False:C215)
				$0:=False:C215
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Inv DepPost"; $_t_oldMethodName)