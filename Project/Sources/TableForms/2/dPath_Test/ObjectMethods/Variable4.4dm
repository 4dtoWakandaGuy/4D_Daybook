If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_LoggedIn)
	C_LONGINT:C283(<>SYS_l_MaxConnectedUsers)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable4"; Form event code:C388)
//[USER]Path Name:="" `do not clear this
If (Not:C34(<>SYS_bo_LoggedIn))
	[USER:15]Limit Date:58:=!00-00-00!
	DB_SaveRecord(->[USER:15])
	//Path_CheckLUDel
	Case of 
		: (Application type:C494=4D Server:K5:6)
			//     ALERT("No users will be able to log in")
			Gen_Alert("No users will be able to log in")
			<>SYS_l_MaxConnectedUsers:=0
			CANCEL:C270
		Else 
			FLUSH CACHE:C297
			QUIT 4D:C291
	End case 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable4"; $_t_oldMethodName)
