//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetEventIDfromFormObject
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetEventIDfromFormObject (->form object) --> Number
	
	// Pass this method a pointer to a variable object on the calendar and it wil
	//   return the record ID for the associated event.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : A 4D form object
	
	// Returns:
	//   $0 : Longint : The record ID
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:21`Method: Cal4D_GetEventIDfromFormObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal4D_al_TrackRecordEventIDs;0)
	//ARRAY TEXT(<>cal4d_at_TrackFormVarNames;0)
	C_LONGINT:C283($_l_EventID; $_l_FieldNumber; $_l_ObjectPosition; $_l_TableNumber; $0)
	C_POINTER:C301(<>Cal_ptr_EventTable; <>CAL_ptr_Nil; <>CAL_ptr_SelectedObject; $_ptr_Object; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetEventIDfromFormObject")


$_ptr_Object:=$1

$_l_EventID:=0

If (Not:C34(Is nil pointer:C315($_ptr_Object)))
	RESOLVE POINTER:C394($_ptr_Object; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_t_VariableName:=Cal4D_GetSimpleVarName($_t_VariableName)  // Remove the diamond.
	
	$_l_ObjectPosition:=Find in array:C230(<>Cal_at_TrackFormVarNames; $_t_VariableName)
	
	If ($_l_ObjectPosition>0)
		$_l_EventID:=<>Cal_al_TrackRecordEventIDs{$_l_ObjectPosition}
		
	Else 
		// This shouldn't happen, but it does sometimes.
		// Hopefully this will make the problem object go away.
		REDUCE SELECTION:C351(<>Cal_ptr_EventTable->; 0)
		<>CAL_ptr_SelectedObject:=<>CAL_ptr_Nil
		Cal4D_PlaceEvents
		ABORT:C156
	End if 
End if 

$0:=$_l_EventID
ERR_MethodTrackerReturn("Cal4D_GetEventIDfromFormObject"; $_t_oldMethodName)