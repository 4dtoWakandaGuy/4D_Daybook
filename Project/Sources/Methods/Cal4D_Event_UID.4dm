//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_UID
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_UID (event ID{; UID}) --> Text
	
	// Gets and sets the unique identifier (UID) for the event.
	// See RFC 2445 <http://www.faqs.org/rfcs/rfc2445.html>
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : An event ID
	//   $2 : Text : The Unique ID (optional)
	
	// Returns:
	//   $0 : Text : The Unique ID
	
	// Created by Dave Batton on May 19, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_Event_UID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_oldMethodName; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_UID")


Cal4D_Event_LoadRecord($1)

If (Count parameters:C259>=2)
	If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
		READ WRITE:C146(<>Cal_ptr_EventTable->)
		LOAD RECORD:C52(<>Cal_ptr_EventTable->)
	End if 
	<>Cal_ptr_EventiCalUIDField->:=$2
	If (Not:C34(Is new record:C668(<>Cal_ptr_EventTable->)))
		SAVE RECORD:C53(<>Cal_ptr_EventTable->)
	End if 
	
End if 

$0:=<>Cal_ptr_EventiCalUIDField->
ERR_MethodTrackerReturn("Cal4D_Event_UID"; $_t_oldMethodName)