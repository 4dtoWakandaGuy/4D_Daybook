//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_Refresh2
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_Refresh2 (group ID)
	
	// Called as a new process by Cal4D_iCal_Refresh to update all of
	//   the events from calendar subscriptions.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : A [Cal4D_Group]ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_iCal_Refresh2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301(<>Cal_ptr_EventTable; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_Refresh2")


READ ONLY:C145(<>Cal_ptr_GroupTable->)
READ ONLY:C145(<>Cal_ptr_EventTable->)

If (Count parameters:C259>=1)
	Cal4D_iCal_RefreshOne($1)
	
Else 
	QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupicalURLField->#"")
	ORDER BY:C49(<>Cal_ptr_GroupFld_Name->)  // Just so the user sees some order to the process.
	FIRST RECORD:C50(<>Cal_ptr_EventTable->)
	While (Not:C34(End selection:C36(<>Cal_ptr_GroupTable->)))
		Cal4D_iCal_RefreshOne  // It's important not to pass a value here.
		NEXT RECORD:C51(<>Cal_ptr_GroupTable->)
	End while 
End if 

Cal4D_iCal_StatusMessage("Idle")
ERR_MethodTrackerReturn("Cal4D_iCal_Refresh2"; $_t_oldMethodName)