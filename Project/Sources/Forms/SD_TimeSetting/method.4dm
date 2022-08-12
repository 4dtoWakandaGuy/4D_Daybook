If (False:C215)
	//Project Form Method Name: SD_al_TimeSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM SD_al_TimeSetting"; Form event code:C388)
ERR_MethodTrackerReturn("FM SD_al_TimeSetting"; $_t_oldMethodName)