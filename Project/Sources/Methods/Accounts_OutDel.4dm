//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_OutDel")
//Accounts Del
If (Records in set:C195("Userset")>0)
	USE SET:C118("Userset")
	REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
	
	//QUERY([ACC BALANCES];[ACC BALANCES]Account Code="zzzz")
	FIRST RECORD:C50([ACCOUNTS:32])
	While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (Records in selection:C76([ACCOUNT_BALANCES:34])=0))
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
		NEXT RECORD:C51([ACCOUNTS:32])
	End while 
	If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
		Gen_Alert("At least one selected Account has been used"; "Cancel")
	Else 
		Are_You_Sure
		If (OK=1)
			DELETE SELECTION:C66([ACCOUNTS:32])
		End if 
	End if 
	ALL RECORDS:C47([ACCOUNTS:32])
	
	Gen_OutNo(->[ACCOUNTS:32])
End if 
ERR_MethodTrackerReturn("Accounts_OutDel"; $_t_oldMethodName)
