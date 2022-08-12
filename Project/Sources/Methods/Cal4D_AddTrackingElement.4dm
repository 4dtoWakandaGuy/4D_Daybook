//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_AddTrackingElement
	//------------------ Method Notes ------------------
	//Based on Code from Dave Batton included in the CAL_4D development from Charlie Vass
	// Project Method: Cal4D_AddTrackingElement (event ID; form object variable name{; box number})
	
	// Call this whenever we want to add a variable to our tracking arrays.
	// We track objects related to variables by the variable name. We remove the IP
	//   variable indicator (<>) first so this works in a cross-platform environment
	//   without needing to test the platform everywhere else in the code.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The event ID
	//   $2 : Text : A form object name form the calendar form
	//   $3 : Longint : The calendar box number (1..42) (optional)
	
	// Returns: Nothing
	
	// Created by Dave Batton on Jul 28, 2004
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 12:32`Method: Cal4D_AddTrackingElement
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_EventColours;0)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY LONGINT(SD2_al_BoxNumber;0)
	//ARRAY TEXT(SD2_at_FormVarNames;0)
	C_LONGINT:C283($_i_boxNumber; $_l_Colour; $_l_EventID; $1; $3; $4)
	C_TEXT:C284($_t_formObjectVariableName; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_AddTrackingElement")

If (Count parameters:C259>2)
	$_l_EventID:=$1
	$_t_formObjectVariableName:=$2
	If (Count parameters:C259>=3)
		$_i_boxNumber:=$3
		$_l_Colour:=$4
	Else 
		$_i_boxNumber:=0
		$_l_Colour:=0
	End if 
	$_t_formObjectVariableName:=Cal4D_GetSimpleVarName($_t_formObjectVariableName)  // Remove the diamond.
	//◊Cal4D_TrackRecordEventIDs_ai becomes SD2_al_EventIDs
	//◊Cal4D_TrackFormVarNames_at becomes SD2_at_FormVarNames
	//◊Cal4D_TrackBoxNumbers_ai becomes SD2_al_BoxNumber
	//◊Cal4D_TrackEventCAL4d_al_Colours becomes SD2_al_EventColours
	APPEND TO ARRAY:C911(SD2_al_EventIDs; $_l_EventID)  // Add an element to the array of record numbers.
	APPEND TO ARRAY:C911(SD2_at_FormVarNames; $_t_formObjectVariableName)  // Add an element to the array of variable names.
	APPEND TO ARRAY:C911(SD2_al_BoxNumber; $_i_boxNumber)
	APPEND TO ARRAY:C911(SD2_al_EventColours; $_l_Colour)
	
End if 
ERR_MethodTrackerReturn("Cal4D_AddTrackingElement"; $_t_oldMethodName)