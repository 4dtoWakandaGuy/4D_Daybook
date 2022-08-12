If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_DataChange)
	C_LONGINT:C283(ACC_l_CBConstantCheck; ACC_l_CBContinuousCheck; ACC_l_CBOneCheck)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(ACC_ti_CTimeEnd; ACC_ti_CTimeStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable6"; Form event code:C388)
ACC_bo_DataChange:=True:C214
If (ACC_l_CBConstantCheck=0)
	OBJECT SET ENABLED:C1123(ACC_l_CBOneCheck; False:C215)
	OBJECT SET ENABLED:C1123(ACC_l_CBContinuousCheck; False:C215)
	
	//_O_DISABLE BUTTON(ACC_l_CBOneCheck)
	//_O_DISABLE BUTTON(ACC_l_CBContinuousCheck)
	OBJECT SET ENTERABLE:C238(ACC_ti_CTimeStart; False:C215)
	OBJECT SET ENTERABLE:C238(ACC_ti_CTimeEnd; False:C215)
Else 
	OBJECT SET ENABLED:C1123(ACC_l_CBOneCheck; True:C214)
	OBJECT SET ENABLED:C1123(ACC_l_CBContinuousCheck; True:C214)
	
	//_O_ENABLE BUTTON(ACC_l_CBOneCheck)
	//_O_ENABLE BUTTON(ACC_l_CBContinuousCheck)
	OBJECT SET ENTERABLE:C238(ACC_ti_CTimeStart; True:C214)
	OBJECT SET ENTERABLE:C238(ACC_ti_CTimeEnd; True:C214)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable6"; $_t_oldMethodName)
