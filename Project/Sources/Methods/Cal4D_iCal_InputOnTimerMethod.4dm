//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_InputOnTimerMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2010 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CurrentUserID)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField)
	C_TEXT:C284($_t_oldMethodName; $_t_TempFilePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_InputOnTimerMethod")

// ----------------------------------------------------
// Project Method: Cal4D_iCal_InputOnTimerMethod

// Called from the Cal4D_iCal_Edit form and the Cal4D_iCal_Subscribe form
//   during the On Timer event, which is invoked by the forms' OK buttons.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on May 18, 2004
// ----------------------------------------------------


SET TIMER:C645(0)

$_t_TempFilePath:=Cal4D_iCal_DownloadCalendarFile(<>Cal_ptr_GroupicalURLField->; <>Cal_ptr_GroupicaluserNameField->; <>Cal_ptr_GroupicalPasswordField->)
If (Error=0)
	Cal4D_iCal_ImportCalendarFile($_t_TempFilePath; <>Cal_ptr_GroupFld_ID->)
End if 
Cal4D_iCal_DeleteCalendarFile($_t_TempFilePath)

If (Error=0)
	If (<>Cal_ptr_GroupFld_Name->="")
		<>Cal_ptr_GroupFld_Name->:=Cal4D_iCal_GetCalendarName($_t_TempFilePath)
		<>Cal_ptr_GroupUserIDField->:=<>CAL_l_CurrentUserID  //3/1/2007-Robert Molina-Displays imported Ical data.  Without this code group user ID is 0 in group table and subscribed ical data is not displayed.
	End if 
	SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
	ACCEPT:C269
	Cal4D_UpdateEvents
	
Else 
	Cal4D_Alert("ImportError"; Error)
	FORM GOTO PAGE:C247(1)
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_InputOnTimerMethod"; $_t_oldMethodName)