//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetFormObjectsFromEventID
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_GetFormObjectsFromEventID (event ID; ->text array)
	
	// Pass this routine an event ID and it will fill the array with
	//   the names of the related form object variable names.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Description
	//   $2 : Pointer : Text array
	
	// Returns: Nothing
	
	// Created by Dave Batton on Mar 13, 2006
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:35`Method: Cal4D_GetFormObjectsFromEventID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY TEXT(SD2_at_FormVarNames;0)
	C_LONGINT:C283($_l_element; $_l_eventID; $1)
	C_POINTER:C301($_ptr_FormObjectsArray; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetFormObjectsFromEventID")


$_l_eventID:=$1
$_ptr_FormObjectsArray:=$2

// Clear any junk in the array.
ARRAY TEXT:C222($_ptr_FormObjectsArray->; 0)

// Start searching at the first element.
$_l_element:=1

Repeat 
	$_l_element:=Find in array:C230(SD2_al_EventIDs; $_l_eventID; $_l_element)
	
	If ($_l_element>0)
		APPEND TO ARRAY:C911($_ptr_FormObjectsArray->; SD2_at_FormVarNames{$_l_element})
	End if 
	
	$_l_element:=$_l_element+1  // Continue where we left off.
Until ($_l_element<=0)
ERR_MethodTrackerReturn("Cal4D_GetFormObjectsFromEventID"; $_t_oldMethodName)