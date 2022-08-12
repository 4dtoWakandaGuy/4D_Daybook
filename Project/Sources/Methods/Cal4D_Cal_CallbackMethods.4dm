//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_CallbackMethods
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_CallbackMethods (update method name; event callback name)
	
	// Allows the developer to set a callback method that will be called when the events
	//   are redrawn (update method name) and when a calendar object receives an
	//   event (event callback name).
	
	// The update callback method will be passed these parameters:
	//   $1 : Date : The first visible date
	//   $2 : Date : The last visible date
	
	// The update callback method should call Cal4D_Event_Display to add events to the calendar.
	
	// The event callback method will be passed these parameters:
	//   $1 : Longint : The 4D form event
	//   $2 : Longint : The associated event ID or 'No current record'
	//   $3 : Date : The event start date
	//   $4 : Date : The event end date
	
	// The event form method will be one of these 4D constants:
	//   On Selection Change
	//   On Double Clicked
	//   On Drop
	
	// If the event happens on a date box (not an event), the event ID will be equal to 4D's 'No current record' constant.
	// Only a date box can receive the On Drop event.
	
	// Pass an empty string for either callback you don't want to use or to turn off an existing callback.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : A method name
	
	// Returns: Nothing
	
	// Created by Dave Batton on Apr 10, 2006
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_Cal_CallbackMethods
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>Cal_t_CallbackMethodforEvents; <>Cal_t_CallbackMethodforUpdates; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_CallbackMethods")


Cal4D_Init

<>Cal_t_CallbackMethodforUpdates:=$1
<>Cal_t_CallbackMethodforEvents:=$2
ERR_MethodTrackerReturn("Cal4D_Cal_CallbackMethods"; $_t_oldMethodName)