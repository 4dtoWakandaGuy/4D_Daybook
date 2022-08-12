//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_DeleteEvents
	//------------------ Method Notes ------------------
	
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_DeleteEvents (group ID)
	
	// Deletes all of the events for the specified calendar group.  If not all of the events
	//   can be deleted, the 4D Error variable is set and none of the records
	//   are deleted.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The group ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:27`Method: Cal4D_Group_DeleteEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WasinTransaction)
	C_LONGINT:C283($_l_CalendarID; $1)
	C_POINTER:C301(<>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventTable; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_DeleteEvents")


$_l_CalendarID:=$1

$_bo_WasinTransaction:=In transaction:C397
Cal4D_TRANSACTION("START")  // These can't be nested, so this is harmless if we're already in one.

Error:=0

READ WRITE:C146(<>Cal_ptr_EventTable->)
QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventGroupIDField->=$_l_CalendarID)

DELETE SELECTION:C66(<>Cal_ptr_EventTable->)

If (Records in set:C195("LockedSet")#0)
	Error:=19322  // An event was locked.
End if 

READ ONLY:C145(<>Cal_ptr_EventTable->)
READ ONLY:C145(<>Cal_ptr_GroupTable->)

Case of 
	: (($_bo_WasinTransaction) & (Error#0))
		// Don't end the existing transaction.
		Cal4D_UpdateEvents
	: (Error=0)
		Cal4D_TRANSACTION("VALIDATE")
		Cal4D_UpdateEvents
	Else 
		Cal4D_TRANSACTION("CANCEL")
End case 
ERR_MethodTrackerReturn("Cal4D_Group_DeleteEvents"; $_t_oldMethodName)