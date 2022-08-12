If (False:C215)
	//object Name: [CONTACTS]Dialog_TimeSetting.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD_l_Timescale; SD_l_TIMESETTING)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Dialog_TimeSetting.Variable6"; Form event code:C388)
If (SD_l_TimeSetting>0)
	SD_l_Timescale:=SD_l_TimeSetting
	CANCEL:C270
Else 
	Gen_Alert("You must set a timescale")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Dialog_TimeSetting.Variable6"; $_t_oldMethodName)
