//%attributes = {}
If (False:C215)
	//Project Method Name:      OPEN_THERMOMETER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: OPEN_THERMOMETER
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_DisallowStop; $_bo_DontAutoClose; $2; $3; $4; DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; Therm_bo_CloseThermometer)
	C_LONGINT:C283($_l_ThermoID; $0; Therm_l_LastValueUpdatedAt)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OPEN_THERMOMETER")
//$1 message var


Therm_l_LastValueUpdatedAt:=0
If (Not:C34(DSPLY_bo_PrefsLoaded))
	//◊Close_Thermo:=True
	DSPLY_LoadPrefs
End if 
If (Count parameters:C259>=4)
	DSPLY_bo_DisplayProgressBars:=$4
End if 
If (DSPLY_bo_DisplayProgressBars)
	//added 27/06/08 -kmw
	
	If (Count parameters:C259>1)
		$_bo_DisallowStop:=$2
	Else 
		$_bo_DisallowStop:=False:C215
	End if 
	
	If (Count parameters:C259>2)
		$_bo_DontAutoClose:=$3
	Else 
		$_bo_DontAutoClose:=False:C215
	End if 
	
	//◊ThermoProc:=New process("OPEN_THERMOMETER1";120000;"Thermometer";$1;*)
	//$_l_ThermoID:=New process("OPEN_THERMOMETER1";120000;"Thermometer";$1;*)
	//$_l_ThermoID:=New process("OPEN_THERMOMETER1";120000;("Thermometer"+String(Current process));$1;*)
	
	If (Count parameters:C259>2)
		If (Process state:C330($_l_ThermoID)=Does not exist:K13:3)
			$_l_ThermoID:=New process:C317("OPEN_THERMOMETER1"; 120000; ("Thermometer"+String:C10(Current process:C322)); $1; $_bo_DisallowStop; $_bo_DontAutoClose)
		Else 
			SET PROCESS VARIABLE:C370($_l_ThermoID; Therm_bo_CloseThermometer; False:C215)  //in case it's about to finish (ie due to Thermometer loop occuring not long ago and the potential that the themoeter process hadn't got as far as cacelling yet  but is about to) we need to cancel the
			$_l_ThermoID:=New process:C317("OPEN_THERMOMETER1"; 120000; ("Thermometer"+String:C10(Current process:C322)); $1; $_bo_DisallowStop; $_bo_DontAutoClose; *)
		End if 
	Else 
		If (Process state:C330($_l_ThermoID)=Does not exist:K13:3)
			$_l_ThermoID:=New process:C317("OPEN_THERMOMETER1"; 120000; ("Thermometer"+String:C10(Current process:C322)); $1; $_bo_DisallowStop)
		Else 
			SET PROCESS VARIABLE:C370($_l_ThermoID; Therm_bo_CloseThermometer; False:C215)  //in case it's about to finish (ie due to Thermometer loop occuring not long ago and the potential that the themoeter process hadn't got as far as cacelling yet  but is about to) we need to cancel the
			$_l_ThermoID:=New process:C317("OPEN_THERMOMETER1"; 120000; ("Thermometer"+String:C10(Current process:C322)); $1; $_bo_DisallowStop; *)
		End if 
	End if 
	
	//$0:=◊ThermoProc  ` 21/11/02 pb
	$0:=$_l_ThermoID  // 21/11/02 pb
	
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("OPEN_THERMOMETER"; $_t_oldMethodName)
