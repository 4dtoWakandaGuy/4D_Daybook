//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
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

$_t_oldMethodName:=ERR_MethodTracker("Accounts_InDel")
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	Gen_Alert("This Account has been used and cannot be deleted"; "")
Else 
	Are_You_Sure
	If (OK=1)
		DB_DeletionControl(->[ACCOUNTS:32])
		
		DELETE RECORD:C58([ACCOUNTS:32])
		CANCEL:C270
		ALL RECORDS:C47([ACCOUNTS:32])
		Gen_InNoF(->[ACCOUNTS:32])
	End if 
End if 
ERR_MethodTrackerReturn("Accounts_InDel"; $_t_oldMethodName)
