//%attributes = {}
If (False:C215)
	//Project Method Name:      CLOSE_THERMOMETER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 10:51`Method: CLOSE_THERMOMETER
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; Therm_bo_CloseThermometer)
	C_LONGINT:C283(THERM_l_ThermoProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CLOSE_THERMOMETER")
//C_BOOLEAN(◊Close_Thermo)
If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (DSPLY_bo_DisplayProgressBars)  //added 27/06/08 -kmw
	
	SET PROCESS VARIABLE:C370(THERM_l_ThermoProc; Therm_bo_CloseThermometer; True:C214)
	
	If (Application type:C494#4D Server:K5:6)
		//CALL PROCESS(◊ThermoProc)
		POST OUTSIDE CALL:C329(THERM_l_ThermoProc)
	End if 
	
End if 
ERR_MethodTrackerReturn("CLOSE_THERMOMETER"; $_t_oldMethodName)
