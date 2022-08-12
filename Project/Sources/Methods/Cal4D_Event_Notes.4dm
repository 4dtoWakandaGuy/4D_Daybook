//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Notes
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Notes (event ID{; notes}) --> Text
	
	// Gets and sets the description for the event.
	// See RFC 2445 <http://www.faqs.org/rfcs/rfc2445.html>
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : An event ID
	//   $2 : Text : New event notes (optional)
	
	// Returns:
	//   $0 : Text : The event notes
	
	// Created by Dave Batton on May 19, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:38`Method: Cal4D_Event_Notes
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301(<>Cal_ptr_EventNotesField; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_EventNotes; $_t_oldMethodName; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Notes")


Cal4D_Event_LoadRecord($1)

$_t_EventNotes:=<>Cal_ptr_EventNotesField->

If (Count parameters:C259>=2)
	If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
		READ WRITE:C146(<>Cal_ptr_EventTable->)
		LOAD RECORD:C52(<>Cal_ptr_EventTable->)
	End if 
	<>Cal_ptr_EventNotesField->:=Cal4D_ReplaceSpecialCharacters($2)
	$_t_EventNotes:=<>Cal_ptr_EventNotesField->
	If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
		SAVE RECORD:C53(<>Cal_ptr_EventTable->)
		UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
	End if 
End if 

$0:=$_t_EventNotes
ERR_MethodTrackerReturn("Cal4D_Event_Notes"; $_t_oldMethodName)