//%attributes = {}

If (False:C215)
	//Project Method Name:      THERMO_DEMO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_ThermoID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("THERMO_DEMO")

//kmw 26/06/08 - Converted thermo functionality to run in multiple processes (ie uses process instead of interprocess vars and so now each process can have it's own associated thermo process).


$_t_oldMethodName:=ERR_MethodTracker("THERMO_DEMO")
If (SelfStart("THERMO_DEMO"; "Thermo demo"))
	$_l_ThermoID:=OPEN_THERMOMETER("Message to user...")
	For ($_l_Index; 1; 100)
		SET_THERMOMETER("Thermometer demo...in a for loop "+String:C10($_l_Index); $_l_Index)
		DelayTicks(30)
	End for 
	SET_THERMOMETER("Good bye "+String:C10($_l_Index); $_l_Index-1)
	DelayTicks(120)
	
	CLOSE_THERMOMETER
End if 
ERR_MethodTrackerReturn("THERMO_DEMO"; $_t_oldMethodName)
