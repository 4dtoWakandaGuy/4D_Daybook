//%attributes = {}
If (False:C215)
	//Project Method Name:      SET_THERMOMETER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: SET_THERMOMETER
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; Therm_bo_CloseThermometer)
	C_LONGINT:C283($2; Therm_l_LastValueUpdatedAt; THERM_l_Thermometer; THERM_l_ThermoProc)
	C_TEXT:C284($_t_oldMethodName; $1; Therm_t_Message)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SET_THERMOMETER")
//C_LONGINT($2;◊ThermoProc)

If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (DSPLY_bo_DisplayProgressBars)  //added 27/06/08 -kmw
	
	//If (Abs(Therm_l_LastValueUpdatedAt-$2)>3)) `added 27/06/08 -kmw, THERM_l_Thermometer has 100 values, lets cut down on number of process coms (disadvantage is that process bar may look slightly more "jerky")
	//above line altered to below 11/07/08 -kmw (if it's one of the first calls to
	If (($2<4) | (Therm_l_LastValueUpdatedAt<4) | (Therm_l_LastValueUpdatedAt>$2) | (Abs:C99(Therm_l_LastValueUpdatedAt-$2)>3))  //added 27/06/08 -kmw, THERM_l_Thermometer has 100 values, lets cut down on number of process coms (disadvantage is that process bar may look slightly more "jerky")
		//◊_Message:=$1
		//◊_Thermometer:=$2
		Therm_l_LastValueUpdatedAt:=$2
		
		SET PROCESS VARIABLE:C370(THERM_l_ThermoProc; Therm_t_Message; $1)
		SET PROCESS VARIABLE:C370(THERM_l_ThermoProc; THERM_l_Thermometer; $2)
		
		If (Application type:C494#4D Server:K5:6)
			//CALL PROCESS(◊ThermoProc)
			POST OUTSIDE CALL:C329(THERM_l_ThermoProc)
		End if 
		
		//BRING TO FRONT(◊ThermoProc)
		//BRING TO FRONT(THERM_l_ThermoProc)
		//decided bringing the thermo to front isn't really necessary
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SET_THERMOMETER"; $_t_oldMethodName)
