//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PostSelectedBatches
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/10/2010 08:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	C_LONGINT:C283($_l_BlankPeriodRow; $_l_TransPostStatus; DB_l_CurrentDisplayedForm; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodIdent; DB_t_CurrentContext; DB_t_CurrentFormUsage2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PostSelectedBatches")

CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
	FIRST RECORD:C50([TRANSACTION_BATCHES:30])
	SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
	QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
	DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]Period_Code:11; $_at_PeriodCodes)
	QUERY WITH ARRAY:C644([PERIODS:33]Period_Code:1; $_at_PeriodCodes)
	QUERY SELECTION:C341([PERIODS:33]; [PERIODS:33]NL_Closed:5=True:C214)
	If (Records in selection:C76([PERIODS:33])>0)
		$_t_PeriodIdent:="Period "+[PERIODS:33]Period_Code:1
	Else 
		$_l_BlankPeriodRow:=Find in array:C230($_at_PeriodCodes; "")
		
		If ($_l_BlankPeriodRow>0)
			$_t_PeriodIdent:="Batch No "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
		End if 
	End if 
	
	If ($_t_PeriodIdent#"")
		If ($_t_PeriodIdent="Period@")
			Gen_Alert($_t_PeriodIdent+" is closed.  Reopen it before posting"; "Cancel")
		Else 
			Gen_Alert($_t_PeriodIdent+" has no Period allocated"; "Cancel")
		End if 
	Else 
		Gen_Confirm("Post "+String:C10(vNo)+" Transaction Batch"+("es"*Num:C11(vNo>1))+"?"; "Yes"; "No")
		If (OK=1)
			StartTransaction
			
			FIRST RECORD:C50([TRANSACTION_BATCHES:30])
			DB_t_CurrentFormUsage2:="NBat"
			$_l_TransPostStatus:=0
			While ((Not:C34(End selection:C36([TRANSACTION_BATCHES:30]))) & (OK=1))
				COPY NAMED SELECTION:C331([TRANSACTION_BATCHES:30]; "$Sel")
				$_l_TransPostStatus:=TransactionBatch_Post
				USE NAMED SELECTION:C332("$Sel")
				CLEAR NAMED SELECTION:C333("$Sel")
				NEXT RECORD:C51([TRANSACTION_BATCHES:30])
			End while 
			If ($_l_TransPostStatus>=0)
				Transact_End
			Else 
				Transact_End(False:C215)
			End if 
		End if 
	End if 
	
End if 
USE SET:C118("$temp")
QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]State:15=1)
SEL_UpdateRecordCache(Table:C252(->[TRANSACTION_BATCHES:30]))

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ACC_PostSelectedBatches"; $_t_oldMethodName)