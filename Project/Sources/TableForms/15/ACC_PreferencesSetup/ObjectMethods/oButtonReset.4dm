If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable14
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
	C_DATE:C307(ACC_D_EDate)
	C_TEXT:C284($_t_oldMethodName; ACC_t_EPeriodCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable14"; Form event code:C388)
If (ACC_t_EPeriodCode#"")
	CONFIRM:C162("Clear Period?"; "No"; "Yes")
	If (OK=0)
		ACC_t_EPeriodCode:=""
		OBJECT SET ENTERABLE:C238(ACC_D_EDate; True:C214)
		ACC_bo_DataChange:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable14"; $_t_oldMethodName)
