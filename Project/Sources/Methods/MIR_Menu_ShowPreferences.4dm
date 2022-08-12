//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_Menu_ShowPreferences
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
	C_LONGINT:C283($LPid)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_Menu_ShowPreferences")


// Declare local variables

$LPid:=New process:C317("MIR_P_Preferences"; 256000; "$Mirror Preferences"; *)
BRING TO FRONT:C326($LPid)

//End of method
ERR_MethodTrackerReturn("MIR_Menu_ShowPreferences"; $_t_oldMethodName)