If (False:C215)
	//object Name: Object Name:      SD_al_TimeSetting.ocancelTime1
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD_al_TimeSetting.ocancelTime1"; Form event code:C388)
PER_l_saveTime:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ SD_al_TimeSetting.ocancelTime1"; $_t_oldMethodName)
