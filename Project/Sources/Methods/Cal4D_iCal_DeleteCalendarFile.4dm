//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_DeleteCalendarFile
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_DeleteCalendarFile (path)
	
	// Deletes the specified file.  Since we stick files in the system's Temporary Items
	//   folder, we're not going to complain if we're unable to delete a file.  That makes
	//  it safe to call this even if the file didn't get created.
	// Also preserves the value of 4D's Error variable.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A full file path
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 18, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_iCal_DeleteCalendarFile
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OldError)
	C_TEXT:C284($_t_ErrorHandler; $_t_oldMethodName; $_t_Path; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_DeleteCalendarFile")


$_t_Path:=$1

$_l_OldError:=Error
$_t_ErrorHandler:=Method called on error:C704

ON ERR CALL:C155("Cal4D_DummyMethod")
//ALERT("Method called on error "+Method called on error+"Cal4D_iCal_DeleteCalendarFile")
DELETE DOCUMENT:C159($_t_Path)
ON ERR CALL:C155($_t_ErrorHandler)
//ALERT("Method called on error "+Method called on error+"Cal4D_iCal_DeleteCalendarFile")
Error:=$_l_OldError
ERR_MethodTrackerReturn("Cal4D_iCal_DeleteCalendarFile"; $_t_oldMethodName)