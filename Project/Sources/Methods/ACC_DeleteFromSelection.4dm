//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_DeleteFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/08/2010 12:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_DeleteFromSelection")
CREATE SET:C116([ACCOUNTS:32]; "$temp")
//nG not sure this is correct
USE SET:C118("ListboxSet0")
READ WRITE:C146([ACCOUNTS:32])
If (Records in selection:C76([ACCOUNTS:32])>0)
	REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
	FIRST RECORD:C50([ACCOUNTS:32])
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodes)
	QUERY WITH ARRAY:C644([ACCOUNT_BALANCES:34]Account_Code:2; $_at_AccountCodes)
	If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
		If (Size of array:C274($_at_AccountCodes)>1)
			Gen_Alert("At least one selected Account has been used"; "Cancel")
		Else 
			Gen_Alert("This Account has been used"; "Cancel")
		End if 
	Else 
		Are_You_Sure
		If (OK=1)
			DELETE SELECTION:C66([ACCOUNTS:32])
		End if 
	End if 
End if 
READ ONLY:C145([ACCOUNTS:32])
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
ERR_MethodTrackerReturn("ACC_DeleteFromSelection"; $_t_oldMethodName)