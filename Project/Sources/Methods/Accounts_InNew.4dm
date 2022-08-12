//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_InNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/08/2010 20:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_boj_InputData)
	C_BOOLEAN:C305($_bo_OpenWindow; $_bo_ProcessStart; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_InNew")
If (Count parameters:C259>=1)
	$_bo_ProcessStart:=$1
Else 
	$_bo_ProcessStart:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_OpenWindow:=$2
Else 
	$_bo_OpenWindow:=True:C214
End if 
TRACE:C157
If ($_bo_ProcessStart)
Else 
	$_boj_InputData:=New object:C1471("TableNumber"; Table:C252(->[ACCOUNTS:32]); "FormName"; "Accounts"; "RecordTitle"; "Account"; "StartProcess"; $_bo_ProcessStart; "OpenWindow"; $_bo_OpenWindow; "FormData"; New object:C1471)
	
	Minor_In($_boj_InputData)  //->[ACCOUNTS]; "Accounts"; "Accounts")
End if 
ERR_MethodTrackerReturn("Accounts_InNew"; $_t_oldMethodName)
