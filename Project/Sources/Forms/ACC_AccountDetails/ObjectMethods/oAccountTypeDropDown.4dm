If (False:C215)
	//object Name: Object Name:      ACC_AccountDetails.Variable33
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cur_at_AccountType;0)
	//ARRAY TEXT(Cur_at_MultiCurrVal;0)
	C_LONGINT:C283($_l_TransFound)
	C_TEXT:C284($_t_AccountTypeNew; $_t_AccountTypeOLD; $_t_oldMethodName; CUR_t_AccountType; CUR_t_MultiCurrVal)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_AccountDetails.Variable33"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$_t_AccountTypeOLD:=CUR_t_AccountType
		$_t_AccountTypeNew:=Cur_at_AccountType{Cur_at_AccountType}
		If ($_t_AccountTypeOLD#$_t_AccountTypeNew)
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_TransFound)  // Perform the query
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
			// Restore normal query mode
			If ($_l_TransFound=0)  //No transactions for this account so user can change P->B or B->P
				CUR_t_AccountType:=$_t_AccountTypeNew
				[ACCOUNTS:32]PB:4:=CUR_t_AccountType
				OBJECT SET VISIBLE:C603(Cur_at_MultiCurrVal; True:C214)  //Multi Curr Valuation not set yet so allow them to set
				OBJECT SET VISIBLE:C603(*; "pAccMultCurrValPopup"; True:C214)
				ARRAY TEXT:C222(Cur_at_MultiCurrVal; 0)
				Cur_LoadMultiCurrValCodes(->Cur_at_MultiCurrVal)
				If (CUR_t_AccountType="B")
					Cur_at_MultiCurrVal:=2
				Else 
					Cur_at_MultiCurrVal:=1
				End if 
				CUR_t_MultiCurrVal:=Cur_at_MultiCurrVal{Cur_at_MultiCurrVal}
			Else 
				Gen_Alert("Sorry you cannot change this Account type because there are transactions "+"linked with this Account")
			End if 
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_AccountDetails.Variable33"; $_t_oldMethodName)
