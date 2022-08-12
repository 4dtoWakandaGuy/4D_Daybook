//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Color
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Color (event ID{; color}) --> Number
	
	// Allows the developer to get and set an event's color.
	// Set the color to -1 to use the group color.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The event ID
	//   $2 : Longint : The new RGB color (optional)
	
	// Returns:
	//   $0 : Longint : The event's color
	
	// Created by Dave Batton on Jun 10, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_Event_Color
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(<>CAL4D_al_EventIDS;0)
	//Array LONGINT(<>Cal4D_al_EventColors;0)
	C_LONGINT:C283(<>CAL_l_UseGroupColor; $0; $1; $2; $_l_colour; $_l_element; $_l_eventID)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Color")



$_l_eventID:=$1

$_l_colour:=<>CAL_l_UseGroupColor  // The default return value.

If ($_l_eventID<0)  // It's a record based event.
	Cal4D_Group_LoadRecord($_l_eventID)
	
	If (Count parameters:C259>=2)
		If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
			READ WRITE:C146(<>Cal_ptr_EventTable->)
			LOAD RECORD:C52(<>Cal_ptr_EventTable->)
		End if 
		<>Cal_ptr_EventColorField->:=$2
		$_l_colour:=<>Cal_ptr_EventColorField->
		If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
			SAVE RECORD:C53(<>Cal_ptr_EventTable->)
			UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
		End if 
	End if 
	
	$_l_colour:=<>Cal_ptr_EventColorField->
	
	
Else   // It's an array based event added with Cal4D_Event_Display.
	$_l_element:=Find in array:C230(<>Cal_al_EventIDS; $_l_eventID)
	If ($_l_element>0)
		
		If (Count parameters:C259>=2)
			<>Cal_al_EventColors{$_l_element}:=$2
		End if 
		
		$_l_colour:=<>Cal_al_EventColors{$_l_element}
	End if 
End if 

$0:=$_l_colour
ERR_MethodTrackerReturn("Cal4D_Event_Color"; $_t_oldMethodName)