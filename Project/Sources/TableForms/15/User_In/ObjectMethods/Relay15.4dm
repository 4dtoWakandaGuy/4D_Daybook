If (False:C215)
	//object Name: [USER]User_In.Relay15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; SMS_LowLevelWarningSent)
	C_LONGINT:C283(SMS_iCreditsLowLevel; SMS_l_MessagesAvailable)
	C_REAL:C285($_l_CharacterPosition; SMS_AvgMsgCredits; SMS_Credits)
	C_TEXT:C284($_t_MessageText; $_t_oldMethodName; $_t_Result; SMS_AccountName; SMS_Password)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Relay15"; Form event code:C388)

Case of 
	: ((SMS_AccountName="") | (SMS_Password=""))
		$_t_MessageText:="Please set up an account with SMS Relay"
		$_t_MessageText:=$_t_MessageText+" and enter your Account Name and Password first."
		//   ALERT($_t_MessageText)
		Gen_Alert($_t_MessageText)
	Else 
		//    MESSAGE("Retrieving data ...")
		Gen_Message("Retrieving data ...")
		$_t_Result:=SMS_SendMsg2(SMS_AccountName; SMS_Password; "zzzzzz"; "test"; False:C215; "")
		CLOSE WINDOW:C154
		<>SYS_bo_CurrentWindowModal:=False:C215
		$_l_CharacterPosition:=Position:C15("Account-Value:"; $_t_Result)
		If ($_l_CharacterPosition>0)
			$_t_Result:=Substring:C12($_t_Result; $_l_CharacterPosition+14)
			$_l_CharacterPosition:=Position:C15(Char:C90(10); $_t_Result)
			If ($_l_CharacterPosition>0)
				SMS_Credits:=Int:C8(Num:C11(Substring:C12($_t_Result; 1; $_l_CharacterPosition-1)))
			Else 
				SMS_Credits:=Int:C8(Num:C11($_t_Result))
			End if 
			SMS_l_MessagesAvailable:=Int:C8(SMS_Credits/SMS_AvgMsgCredits)
		Else 
			Case of   // 19/12/02 pb
				: (Position:C15("unknown user"; $_t_Result)>0)
					//          ALERT("The SMS service does not recognise the user name: "+SMS_Account
					Gen_Alert("The SMS service does not recognise the user name: "+SMS_AccountName)
				: (Position:C15("authorization failed"; $_t_Result)>0)
					//       ALERT("Your password was not accepted by the SMS service.")
					Gen_Alert("Your password was not accepted by the SMS service.")
				Else 
					//        ALERT($_t_Result)
					Gen_Alert($_t_Result)
			End case 
		End if 
		
		If ((SMS_iCreditsLowLevel<SMS_Credits) & (SMS_LowLevelWarningSent=True:C214))  // 7/01/03 pb
			SMS_LowLevelWarningSent:=False:C215
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Relay15"; $_t_oldMethodName)
