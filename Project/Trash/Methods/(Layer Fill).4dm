//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Layer Fill
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 12:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layer Fill")
If ($1->="")
	If ([TRANSACTION_TYPES:31]Layer_Code:16#"")
		$1->:=[TRANSACTION_TYPES:31]Layer_Code:16
	Else 
		$1->:=DB_GetLedgerActualLayer
	End if 
End if 
//Copied to Orders_InLPB
ERR_MethodTrackerReturn("Layer Fill"; $_t_oldMethodName)