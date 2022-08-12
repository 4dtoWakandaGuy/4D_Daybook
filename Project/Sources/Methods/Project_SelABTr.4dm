//%attributes = {}
If (False:C215)
	//Project Method Name:      Project_SelABTr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2011 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Project_SelABTr")
//Project_SelABTr - Account Balances to Transactions

$_l_RecordsinSelection:=Records in selection:C76([ACCOUNT_BALANCES:34])
If ($_l_RecordsinSelection>0)
	If ($_l_RecordsinSelection>1)
		CREATE EMPTY SET:C140([TRANSACTIONS:29]; "Master")
		FIRST RECORD:C50([ACCOUNT_BALANCES:34])
		While (Not:C34(End selection:C36([ACCOUNT_BALANCES:34])))
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6)
			
			CREATE SET:C116([TRANSACTIONS:29]; "Extra3")
			UNION:C120("Master"; "Extra3"; "Master")
			NEXT RECORD:C51([ACCOUNT_BALANCES:34])
		End while 
		USE SET:C118("Master")
		
	Else 
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6)
	End if 
Else 
	REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
End if 
ERR_MethodTrackerReturn("Project_SelABTr"; $_t_oldMethodName)
