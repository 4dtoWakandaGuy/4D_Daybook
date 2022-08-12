If (False:C215)
	//object Name: Object Name:      SD_al_TimeSetting.osaveTime
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
	C_LONGINT:C283(PER_l_saveTime)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD_al_TimeSetting.osaveTime"; Form event code:C388)
PER_l_saveTime:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ SD_al_TimeSetting.osaveTime"; $_t_oldMethodName)
