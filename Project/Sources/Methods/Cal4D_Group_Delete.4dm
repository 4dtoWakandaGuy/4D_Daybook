//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Delete
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Delete (group ID)
	
	// Deletes the calendar group, and any events related to the group.
	// Uses a transaction if we're not already in a transaction.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The group ID
	
	// Returns: Nothing
	
	// Created by Add Komoncharoensiri - 4D, Inc.
	//   Method originally named iCal_Unsubscribe.
	// Modified by Dave Batton on May 1, 2004
	//   Major update for the component.
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:27`Method: Cal4D_Group_Delete
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WasinTransaction)
	C_LONGINT:C283($_l_CalendarID; $1)
	C_POINTER:C301(<>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventTable; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Delete")


$_l_CalendarID:=$1

$_bo_WasinTransaction:=In transaction:C397
Cal4D_TRANSACTION("START")  // These can't be nested, so this is harmless if we're already in one.

Error:=0

READ WRITE:C146(<>Cal_ptr_GroupTable->)
QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$_l_CalendarID)

Case of 
	: (Records in selection:C76(<>Cal_ptr_GroupTable->)=0)
		Error:=19320  // The record could not be found.
		
	: (Locked:C147(<>Cal_ptr_GroupTable->))
		Error:=19321  // The record is locked.
		
	Else 
		READ WRITE:C146(<>Cal_ptr_EventTable->)
		QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventGroupIDField->=$_l_CalendarID)
		DELETE SELECTION:C66(<>Cal_ptr_EventTable->)
		If (Records in set:C195("LockedSet")=0)
			DELETE RECORD:C58(<>Cal_ptr_GroupTable->)  // Only delete this if all records were deleted.
		Else 
			Error:=19322  // An event was locked.
		End if 
End case 

READ ONLY:C145(<>Cal_ptr_EventTable->)
READ ONLY:C145(<>Cal_ptr_GroupTable->)

Case of 
	: (($_bo_WasinTransaction)#(Error=0))
		// Don't end the existing transaction.
		Cal4D_UpdateEvents
		
	: (Error=0)
		Cal4D_TRANSACTION("VALIDATE")
		Cal4D_UpdateEvents
		
	Else 
		Cal4D_TRANSACTION("CANCEL")
		
End case 
ERR_MethodTrackerReturn("Cal4D_Group_Delete"; $_t_oldMethodName)