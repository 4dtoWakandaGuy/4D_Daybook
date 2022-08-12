//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_UserOwnsEvent
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_UserOwnsEvent --> Boolean
	
	// Returns True if the currently loaded event belongs to the current user.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	//   $0 : Boolean : True if it belongs to the current user
	
	// Created by Dave Batton on Apr 17, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_Event_UserOwnsEvent
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(<>PER_l_CurrentUserID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_UserOwnsEvent")


READ ONLY:C145([DIARY:12])
If ([DIARY:12]PersonID:56=<>PER_l_CurrentUserID)
	$0:=True:C214
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Cal4D_Event_UserOwnsEvent"; $_t_oldMethodName)