//%attributes = {}
If (False:C215)
	//Project Method Name:      Password_Delete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_UserNumbers; 0)
	ARRAY TEXT:C222($_at_UserNames; 0)
	C_LONGINT:C283($_l_UserIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Password_Delete")
ARRAY TEXT:C222($_at_UserNames; 0)
ARRAY LONGINT:C221($_al_UserNumbers; 0)

GET USER LIST:C609($_at_UserNames; $_al_UserNumbers)
For ($_l_UserIndex; 1; Size of array:C274($_at_UserNames))
	Case of 
		: ($_at_UserNames{$_l_UserIndex}="AdministratorWP") | ($_at_UserNames{$_l_UserIndex}="ManagerWP") | ($_at_UserNames{$_l_UserIndex}="UserWP")
			DELETE USER:C615($_al_UserNumbers{$_l_UserIndex})
	End case 
End for 
ERR_MethodTrackerReturn("Password_Delete"; $_t_oldMethodName)
