//%attributes = {}
If (False:C215)
	//Project Method Name:      Transact_End
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Buffers; $_bo_Validate; $1; $2)
	C_LONGINT:C283($_l_Process; STK_l_TransactionID; TransactionLevel; WS_LastNoType; WS_LastNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Transact_End")

$_bo_Validate:=(OK=1)

If (Count parameters:C259>0)  //bsw 26/09/03 otherwise was crashing server
	If (Count parameters:C259>=2)
		
		$_bo_Buffers:=$2
	Else 
		$_bo_Buffers:=True:C214
	End if 
	$_bo_Validate:=$1
Else 
	$_bo_Buffers:=True:C214
	$_bo_Validate:=(OK=1)
End if 

If (In transaction:C397)
	If (OK=1) | ($_bo_Validate)
		
		VALIDATE TRANSACTION:C240
		If (Count parameters:C259>=1)
			If ($_bo_Buffers)
				FLUSH CACHE:C297
			End if 
		Else 
			FLUSH CACHE:C297
		End if 
		STK_EndTransaction(STK_l_TransactionID; True:C214)
	Else 
		
		If (WS_LastNumber>0)
			If (WS_LastNoType>0)
				$_l_Process:=New process:C317("DB_RecoverNumber"; 128000; "Recover unused number"; WS_LastNoType; WS_LastNumber)
			End if 
		End if 
		CANCEL TRANSACTION:C241
		STK_EndTransaction(STK_l_TransactionID; False:C215)
		
	End if 
	STK_l_TransactionID:=0
End if 
CLEAR SEMAPHORE:C144("NoINDEXING")  //so indexing wont start automatically during a transaction
//note this will only clear if this was the transaction that set it
ERR_MethodTrackerReturn("Transact_End"; $_t_oldMethodName)
