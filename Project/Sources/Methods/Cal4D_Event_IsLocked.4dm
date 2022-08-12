//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_IsLocked
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_IsLocked --> Boolean
	
	// Returns True if the currently loaded event is locked.
	// Events that belong to a subscription are locked.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns:
	//   $0 : Boolean : True if locked
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:39`Method: Cal4D_Event_IsLocked
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301(<>Cal_ptr_EventTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_IsLocked")


Case of 
	: (Cal4D_Event_IsSubscribed)
		$0:=True:C214
		
	: ((Not:C34(Read only state:C362(<>Cal_ptr_EventTable->))) & (Locked:C147(<>Cal_ptr_EventTable->)))
		$0:=True:C214
		
	Else 
		$0:=False:C215
End case 
ERR_MethodTrackerReturn("Cal4D_Event_IsLocked"; $_t_oldMethodName)