//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Group_ManageDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_StackSize; $_l_processNumber)
	C_TEXT:C284(<>CAL_t_GroupManageProcess; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_ManageDialog")

// ----------------------------------------------------
// Project Method: Cal4D_Group_ManageDialog

// Displays the iCal Subcribe dialog in a new process.

// Access Type: Protected

// Parameters: None

// Returns: Nothing

// Created by Add Komoncharoensiri, 4D, Inc.
// ----------------------------------------------------


Cal4D_Init

$_l_processNumber:=New process:C317("Cal4D_Group_ManageDialog2"; <>CAL_l_StackSize; <>CAL_t_GroupManageProcess; *)
BRING TO FRONT:C326($_l_processNumber)
ERR_MethodTrackerReturn("Cal4D_Group_ManageDialog"; $_t_oldMethodName)