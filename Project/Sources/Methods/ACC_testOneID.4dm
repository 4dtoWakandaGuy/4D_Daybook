//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_testOneID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_OK)
	C_LONGINT:C283($_l_Delay; $_l_Repeats; $_l_Retries; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Transaction)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_testOneID")
If (Count parameters:C259=0)
	$_t_Transaction:=Request:C163("enterID"; "")
Else 
	$_t_Transaction:=String:C10($1)
End if 

READ WRITE:C146([TRANSACTIONS:29])
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=Num:C11($_t_Transaction))
If (Application type:C494<=4)
	ERASE WINDOW:C160
End if 
$_bo_OK:=False:C215
$_l_Repeats:=0
$_l_Delay:=1
Repeat 
	$_l_Repeats:=$_l_Repeats+1
	$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
	If (Not:C34($_bo_OK))
		If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
			//only increase every 10 tries
			$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
		End if 
		DelayTicks(2*$_l_Delay)
	End if 
Until ($_bo_OK=True:C214)

If ([TRANSACTIONS:29]Transaction_ID:31=0)
	[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
	$_l_Retries:=0
	While (Semaphore:C143("TRANSACTIONUPDATE"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	
	<>TransactionDisableValidation:=True:C214
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	DB_SaveRecord(->[TRANSACTIONS:29])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	
	<>TransactionDisableValidation:=False:C215
	SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
	CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
End if 
ACC_TransValidateBatch([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTIONS:29]Batch_Number:7)
ERR_MethodTrackerReturn("ACC_testOneID"; $_t_oldMethodName)
