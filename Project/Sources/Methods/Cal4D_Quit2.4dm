//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Quit2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/12/2009 14:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_QuitNow; <>Cal_QuitNow_b; $_bo_Done)
	C_LONGINT:C283($_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284(<>Cal_t_CurrentUserName; $_t_ContinueAction; $_t_oldMethodName; $_t_ProcessName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Quit2")

// ----------------------------------------------------
// Project Method: Cal4D_Quit2 ({continue action})

// Called as a new process from Cal4D_Quit to try to quit any running calendar processes.

// Access Type: Private

// Parameters:
//   $1 : Text : A 4D command or method name (optional)

// Returns: Nothing

// Created by Dave Batton, March 2006
// ----------------------------------------------------


$_t_ContinueAction:=$1

<>Cal_bo_QuitNow:=True:C214

// Send a message to each of our processes telling it to quit.
// Do this until all of our processes are ended or one of them tells us
//   to cancel the quit.
Repeat 
	$_bo_Done:=True:C214
	
	For ($_l_ProcessNumber; 1; Count tasks:C335)
		PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		If (($_t_ProcessName="@Cal4D_@") & ($_l_ProcessState>=0) & ($_l_ProcessNumber#Current process:C322))  // If it's a calendar (but not this one) process, let it know it's time to quit.
			RESUME PROCESS:C320($_l_ProcessNumber)  // Resume the process if it's been paused.
			POST OUTSIDE CALL:C329($_l_ProcessNumber)
			$_bo_Done:=False:C215  // We'll come back to check on it.
		End if 
	End for 
	
	DELAY PROCESS:C323(Current process:C322; 15)  // Give things a moment to wrap up.
Until ((Not:C34(<>Cal_QuitNow_b)) | ($_bo_Done))


If (<>Cal_QuitNow_b)
	// If the quit didn't get canceled, do some cleanup.
	
	<>Cal_t_CurrentUserName:=""  // We check this in Cal4D_Quit and Cal4D_Startup.
	
	If ($_t_ContinueAction#"")
		EXECUTE FORMULA:C63($_t_ContinueAction)
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Quit2"; $_t_oldMethodName)
AA_CloseStates
ERR_MethodTrackerReturn("Cal4D_Quit2"; $_t_oldMethodName)