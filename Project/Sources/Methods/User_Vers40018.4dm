//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40018
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	ARRAY TEXT:C222($_at_AccountIO; 0)
	C_LONGINT:C283($_l_AccountPosition; $_l_PercentageDone; $_l_RecordsCount; $_l_RecordsInSelection; $_r_RecordPercent; DS_l_BATCHITEMRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40018")
//User_Vers40018
User_Message(Char:C90(13)+"      Updating General Ledger Transaction Batches"+Char:C90(13))
ALL RECORDS:C47([ACCOUNTS:32])
SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodes; [ACCOUNTS:32]IO:5; $_at_AccountIO)
UNLOAD RECORD:C212([ACCOUNTS:32])

READ WRITE:C146([TRANSACTION_BATCHES:30])
ALL RECORDS:C47([TRANSACTION_BATCHES:30])
//SEARCH([TRANS IN];[TRANS IN]Batch Date>!01/03/96!)

$_l_RecordsInSelection:=Records in selection:C76([TRANSACTION_BATCHES:30])
$_l_RecordsCount:=0
$_l_PercentageDone:=0

While (Not:C34(End selection:C36([TRANSACTION_BATCHES:30])))
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	While (Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155])))
		Case of 
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="D")
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
				$_l_AccountPosition:=Find in array:C230($_at_AccountCodes; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
				If ($_l_AccountPosition>0)
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_AccountIO{$_l_AccountPosition}
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
				End if 
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="C")
				$_l_AccountPosition:=Find in array:C230($_at_AccountCodes; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
				If ($_l_AccountPosition>0)
					[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_AccountIO{$_l_AccountPosition}
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
				End if 
		End case 
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
		End if 
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
		
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End while 
	DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
	$_l_RecordsCount:=$_l_RecordsCount+1
	$_r_RecordPercent:=Int:C8(($_l_RecordsCount/$_l_RecordsInSelection)*100)
	If ($_l_PercentageDone#(Int:C8($_r_RecordPercent/10)))
		User_Message("        "+String:C10($_r_RecordPercent)+"% complete"+Char:C90(13))
		$_l_PercentageDone:=Int:C8($_r_RecordPercent/10)
	End if 
End while 
READ ONLY:C145([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])

READ WRITE:C146([ACTIONS:13])
QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[USER:15]Letter Action:33)
If (Records in selection:C76([ACTIONS:13])>0)
	[ACTIONS:13]DocumentManager_Action:7:=True:C214
	DB_SaveRecord(->[ACTIONS:13])
End if 
QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[USER:15]Qtn Action:39)
If (Records in selection:C76([ACTIONS:13])>0)
	[ACTIONS:13]DocumentManager_Action:7:=True:C214
	DB_SaveRecord(->[ACTIONS:13])
End if 
READ ONLY:C145([ACTIONS:13])
UNLOAD RECORD:C212([ACTIONS:13])
ERR_MethodTrackerReturn("User_Vers40018"; $_t_oldMethodName)