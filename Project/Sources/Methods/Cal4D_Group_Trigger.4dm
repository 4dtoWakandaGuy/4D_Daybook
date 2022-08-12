//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Trigger
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Trigger --> Number
	
	// The trigger for the [Cal4D_Group] table.
	
	// Access Type: Protected
	
	// Parameters: None
	
	// Returns:
	//   $0 : Longint : The error number
	
	// Created by Dave Batton on Aug 9, 2006
	// ----------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_Group_Trigger
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

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Trigger")


$_l_Error:=0

Case of 
	: ((Trigger event:C369=On Saving New Record Event:K3:1) | (Trigger event:C369=On Saving Existing Record Event:K3:2) | (Trigger event:C369=On Deleting Record Event:K3:3))
		// We update the other workstations even if the group is set so they can't see it, because maybe they could before the edit.
		Cal4D_Cal_RedrawOtherClients
End case 

$0:=$_l_Error
ERR_MethodTrackerReturn("Cal4D_Group_Trigger"; $_t_oldMethodName)