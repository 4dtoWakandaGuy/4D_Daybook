//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_ZeroS2
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_ZeroS2")
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
$0:=(Records in selection:C76([ACCOUNT_BALANCES:34])>0)
ERR_MethodTrackerReturn("Accounts_ZeroS2"; $_t_oldMethodName)
