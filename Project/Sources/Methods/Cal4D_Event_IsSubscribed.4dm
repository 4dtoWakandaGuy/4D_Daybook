//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_IsSubscribed
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_IsSubscribed --> Boolean
	
	// Returns True if the currently loaded event is part of a subscription.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	//   $0 : Boolean : True if part of a subscription
	
	// Created by Dave Batton on May 21, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:39`Method: Cal4D_Event_IsSubscribed
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301(<>Cal_ptr_EventGroupIDField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_IsSubscribed")


READ ONLY:C145(<>Cal_ptr_GroupTable->)
RELATE ONE:C42(<>Cal_ptr_EventGroupIDField->)

If (<>Cal_ptr_GroupicalURLField->#"")
	$0:=True:C214
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Cal4D_Event_IsSubscribed"; $_t_oldMethodName)