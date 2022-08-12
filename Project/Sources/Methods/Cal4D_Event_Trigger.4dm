//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Trigger
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Trigger --> Number
	
	// The trigger for the [Cal4D_Event] table.
	
	// Access Type: Protected
	
	// Parameters: None
	
	// Returns:
	//   $0 : Longint : The error number
	
	// Created by Dave Batton on Aug 9, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_Event_Trigger
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Error; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Trigger")



$_l_Error:=0

Case of 
	: ((Trigger event:C369=On Saving New Record Event:K3:1) | (Trigger event:C369=On Saving Existing Record Event:K3:2) | (Trigger event:C369=On Deleting Record Event:K3:3))
		// We do this even if the group isn't set to Others can View or Modify, since multiple users
		//   might log in with the same user name, in which case we still want their private calendars
		//   to get updated on other workstations.
		// We could check to make sure something visible in the event (title, color, start date and
		//   time, etc) has been changed, but it's really not worth the trouble.
		Cal4D_Cal_RedrawOtherClients
		
End case 

$0:=$_l_Error
ERR_MethodTrackerReturn("Cal4D_Event_Trigger"; $_t_oldMethodName)