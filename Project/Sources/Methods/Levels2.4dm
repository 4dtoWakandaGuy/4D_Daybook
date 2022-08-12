//%attributes = {}
If (False:C215)
	//Project Method Name:      Levels2
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
	C_LONGINT:C283(<>PER_l_AccessLevel)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Levels2")
Case of 
	: (Current user:C182="Designer")
		<>PER_l_AccessLevel:=0
	: ((Current user:C182="Manager") | (Current user:C182="ManagerWP") | (Current user:C182="Administrator") | (Current user:C182="AdministratorWP") | (Current user:C182="Demo") | (Current user:C182="DemoWP") | (Current user:C182="DTK"))
		<>PER_l_AccessLevel:=1
	: ((Current user:C182="User") | (Current user:C182="UserWP"))
		<>PER_l_AccessLevel:=2
	: (User in group:C338(Current user:C182; "Designer"))
		<>PER_l_AccessLevel:=0
	: ((User in group:C338(Current user:C182; "Manager")) | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Demo@"))
		<>PER_l_AccessLevel:=1
	: ((User in group:C338(Current user:C182; "User")) | (User in group:C338(Current user:C182; "4D write Group")))
		<>PER_l_AccessLevel:=2
	Else 
		<>PER_l_AccessLevel:=3
End case 
ERR_MethodTrackerReturn("Levels2"; $_t_oldMethodName)