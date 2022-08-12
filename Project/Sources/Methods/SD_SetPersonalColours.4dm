//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetPersonalColours
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
	C_LONGINT:C283(<>PER_l_CurrentUserID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetPersonalColours")
//This method which can be called from the diary will display the colour prefs for the agenda for the LOGGED IN user
SD_SetColourPreferences(<>PER_l_CurrentUserID; False:C215; True:C214)
ERR_MethodTrackerReturn("SD_SetPersonalColours"; $_t_oldMethodName)