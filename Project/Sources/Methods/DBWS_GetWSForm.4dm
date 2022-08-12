//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetWSForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011$) 20:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_WebStyle; $0; $1; DBWS_T_PageLabel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetWSForm")
$_t_WebStyle:=DBWS_GetPreferences

Case of 
	: ($1="Login")
		
		$0:="Login"
	: ($1="Home")
		DBWS_T_PageLabel:="Connect to Daybook..."
		$0:="Home"
	: ($1="Search")
		$0:="Search"
End case 
ERR_MethodTrackerReturn("DBWS_GetWSForm"; $_t_oldMethodName)