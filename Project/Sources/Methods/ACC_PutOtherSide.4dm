//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_PutOtherSide
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
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_NoChange; $_bo_OK)
	C_LONGINT:C283($_l_BatchItemID; $_l_Delay; $_l_Repeats; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PutOtherSide")

//pass this 2 parameters
//$1=the id of the transaction to put it on
//$2=the id of the transaction of the other side
//$3=The batch item ID
$_t_oldMethodName:=ERR_MethodTracker("ACC_PutOtherSide")
READ WRITE:C146([TRANSACTIONS:29])
If (Count parameters:C259>=2)
	$_bo_NoChange:=True:C214
	If ($1>0) & ($2>0)
		If (Count parameters:C259>=3)
			$_l_BatchItemID:=$3
		Else 
			$_l_BatchItemID:=0
		End if 
		If ([TRANSACTIONS:29]Transaction_ID:31#$1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$1)
			
			If ([TRANSACTIONS:29]Transaction_OtherSideID:32#$2) | ([TRANSACTIONS:29]BatchItem_X_ID:30#$_l_BatchItemID)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
					If (Not:C34($_bo_OK))
						IDLE:C311
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				
				$_bo_NoChange:=False:C215
			Else 
				$_bo_NoChange:=True:C214
			End if 
		Else 
			$_bo_NoChange:=([TRANSACTIONS:29]Transaction_OtherSideID:32=$2) & ([TRANSACTIONS:29]BatchItem_X_ID:30=$_l_BatchItemID)
		End if 
		If (Not:C34($_bo_NoChange))
			[TRANSACTIONS:29]Transaction_OtherSideID:32:=$2
			If (Count parameters:C259>=3)
				If ($3>0)
					[TRANSACTIONS:29]BatchItem_X_ID:30:=$3
				End if 
			End if 
		End if 
		
		
		If (Not:C34($_bo_NoChange))
			While (Semaphore:C143("TRANSACTIONUPDATE"))
				DelayTicks(2)
			End while 
			<>TransactionDisableValidation:=True:C214
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			DB_SaveRecord(->[TRANSACTIONS:29])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
			<>TransactionDisableValidation:=False:C215
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
		End if 
		
		UNLOAD RECORD:C212([TRANSACTIONS:29])
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_PutOtherSide"; $_t_oldMethodName)
