//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalCreateSet
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalCreateSet")
//ACC_BalCreateSet
CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "Master2")
FIRST RECORD:C50([ACCOUNTS:32])
While (Not:C34(End selection:C36([ACCOUNTS:32])))
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "extra")
	INTERSECTION:C121("Master1"; "extra"; "Master")
	UNION:C120("master"; "Master2"; "Master2")
	NEXT RECORD:C51([ACCOUNTS:32])
End while 
USE SET:C118("Master2")
ERR_MethodTrackerReturn("ACC_BalCreateSet"; $_t_oldMethodName)
