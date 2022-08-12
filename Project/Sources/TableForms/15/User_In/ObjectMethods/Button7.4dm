If (False:C215)
	//object Name: [USER]User_In.Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button7"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Records in table:C83([SMS_Log:124])=0)
			//     ALERT("There are no entries in the SMS Log.")
			Gen_Alert("There are no entries in the SMS Log.")
		Else 
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			FORM SET INPUT:C55([SMS_Log:124]; "SMS_Log_Deletions"; *)
			
			WIN_l_CurrentWinRef:=Open window:C153(200; 200; -1; -1; Movable form dialog box:K39:8; "Log Deletions")
			
			DIALOG:C40([SMS_Log:124]; "SMS_Log_Deletions")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:User_In,bClearLog"; $_t_oldMethodName)
