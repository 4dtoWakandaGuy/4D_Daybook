//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_RedrawOtherClients
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2010 09:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_LastClientUpdateTime; <>CAL_l_SharedUserID; $_l_LastUpdateServerTime; $_l_ProcessState; $_l_ProcessTime)
	C_POINTER:C301(<>CAL_ptr_UserDefaultGroupIDFld; Cal_ptr_UserTable)
	C_TEXT:C284(<>CAL_t_SharedUserName; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_RedrawOtherClients")

// ----------------------------------------------------
// Project Method: Cal4D_Cal_RedrawOtherClients

// Sets an indicator that other client workstations will check to see
//   if they need to update their calendar.

// Access Type: Protected

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Apr 21, 2006
// ----------------------------------------------------


Cal4D_Init

PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)

If (Application type:C494=4D Server:K5:6)
	<>CAL_l_SharedUserID:=-1  // The server doesn't know about our IP variables.
End if 

If ($_t_ProcessName#"$@")  // We can't do this in a local process.
	READ WRITE:C146(Cal_ptr_UserTable->)
	QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UserIDField->=<>CAL_l_SharedUserID)
	
	If (Records in selection:C76(Cal_ptr_UserTable->)=0)
		CREATE RECORD:C68(Cal_ptr_UserTable->)
		Cal_ptr_UserIDField->:=<>CAL_l_SharedUserID
		Cal_ptr_UsernameField->:=<>CAL_t_SharedUserName
	End if 
	
	// The system user doesn't need a default group, so we store the time of the latest data change in this field.
	// We don't bother to check if the record is locked. If somebody else is updating it now it still accomplishes what we need.
	$_l_LastUpdateServerTime:=Cal4D_DateAndTimeToLongint(True:C214)  // Notice we get the server's date and time.
	<>CAL_ptr_UserDefaultGroupIDFld->:=$_l_LastUpdateServerTime
	SAVE RECORD:C53(Cal_ptr_UserTable->)
	UNLOAD RECORD:C212(Cal_ptr_UserTable->)
	
	<>CAL_l_LastClientUpdateTime:=$_l_LastUpdateServerTime  // So we don't redraw the calendar again unecessarily.
	
Else 
	If (Application type:C494#4D Server:K5:6)  // Just in case...
		Cal4D_Alert("The "+Current method name:C684+" method may not be called from a local process. "+"Please notify the database developer.")
	End if 
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_RedrawOtherClients"; $_t_oldMethodName)