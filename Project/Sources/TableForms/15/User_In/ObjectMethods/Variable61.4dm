If (False:C215)
	//object Name: [USER]User_In.Variable61
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable61"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Records in table:C83([SMS_Log:124])=0)
			//    ALERT("There are no entries in the SMS Log.")
			Gen_Alert("There are no entries in the SMS Log.")
		Else 
			WIN_t_CurrentOutputform:=""
			
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SMS_Log:124])))
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:User_In,bViewLog"; $_t_oldMethodName)
