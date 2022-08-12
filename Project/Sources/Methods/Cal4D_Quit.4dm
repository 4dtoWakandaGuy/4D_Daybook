//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Quit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_StackSize; $_l_ProcessNumber)
	C_TEXT:C284($_t_ContinueAction; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Quit")

// ----------------------------------------------------
// Project Method: Cal4D_Quit ({continue action})

// Call this when you want to quit the mail processes and close any open
//   mail windows. If the mail process can quit, it will call the continue action
//   that's passed as a parameter. If it can't quit, perhaps because the user
//   wants to continue editing a message, then the continue action is not called.

// Access Type: Protected

// Parameters:
//   $1 : Text : A 4D command or method name (optional)

// Returns: Nothing

// Created by Dave Batton
// ----------------------------------------------------


Cal4D_Init

If (Count parameters:C259>=1)
	$_t_ContinueAction:=$1
Else 
	$_t_ContinueAction:=""
End if 

// We launch a new process to try to quit everything, since the current
//   process might be something we're trying to quit.
// We'll make it a server process in case the continue action wants
//   access to the data file.
$_l_ProcessNumber:=New process:C317("Cal4D_Quit2"; <>CAL_l_StackSize; "Cal4D_QuitProcess"; $_t_ContinueAction; *)
ERR_MethodTrackerReturn("Cal4D_Quit"; $_t_oldMethodName)