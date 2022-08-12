//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_BackgroundLoop
	//------------------ Method Notes ------------------
	//Based on Project Method: Cal4D_BackgroundLoop
	
	// Launched as a background process by Cal4D_Startup
	//   to update the iCal calendars.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 18, 2004
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 12:57`Method: Cal4D_BackgroundLoop
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_QuitNow; <>SYS_bo_QuitCalled)
	C_LONGINT:C283(<>CAL_l_iCalUpdateInterval; <>CAL_l_ServerCheckInterval; $_i_nextServerCheckRun; $_l_nextiCalRefreshRun; $_l_Seconds)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_BackgroundLoop")


$_l_nextiCalRefreshRun:=0  // So we run this immediately.

Repeat 
	$_l_Seconds:=Cal4D_DateAndTimeToLongint  // We use the local date and time. Don't use Tickcount! It will fail sooner than you expect.
	Case of 
		: ($_l_Seconds>$_i_nextServerCheckRun)
			Cal4D_CheckServerForUpdates
			
			$_i_nextServerCheckRun:=$_l_Seconds+<>CAL_l_ServerCheckInterval
			
		: ($_l_Seconds>$_l_nextiCalRefreshRun)
			Cal4D_iCal_Refresh2  // We could alternately call Cal4D_iCal_Refresh to launch another process to handle this.
			$_l_nextiCalRefreshRun:=$_l_Seconds+<>CAL_l_iCalUpdateInterval
	End case 
	DELAY PROCESS:C323(Current process:C322; 60)  // Go through the loop once every second.
Until (<>Cal_bo_QuitNow) | (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("Cal4D_BackgroundLoop"; $_t_oldMethodName)