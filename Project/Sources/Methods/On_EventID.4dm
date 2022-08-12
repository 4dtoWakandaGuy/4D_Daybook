//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>DB_t_PassLock; <>DB_t_Password; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventID")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventID")
Case of 
	: (Mousedown=0)
		
		
		If (KeyCode<32)
			If (KeyCode=8)
				<>DB_t_Password:=Substring:C12(<>DB_t_Password; 1; Length:C16(<>DB_t_Password)-1)
				If (Is macOS:C1572)
					<>DB_t_PassLock:="•"*Length:C16(<>DB_t_Password)
				Else 
					<>DB_t_PassLock:="*"*Length:C16(<>DB_t_Password)
				End if 
				
			End if 
		Else 
			<>DB_t_Password:=<>DB_t_Password+Char:C90(KeyCode)
			If (Is macOS:C1572)
				<>DB_t_PassLock:="•"*Length:C16(<>DB_t_Password)
			Else 
				<>DB_t_PassLock:="*"*Length:C16(<>DB_t_Password)
			End if 
			
		End if 
		POST OUTSIDE CALL:C329(-1)
End case 
//ERR_MethodTrackerReturn ("On_EventID";$_t_oldMethodName)