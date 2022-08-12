//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_RefreshOne
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_RefreshOne ({[Cal4D_iCal]ID})
	
	// Called by Cal4D_iCal_Refresh to download a single calendar file
	//   and update the associated [Cal4D_Event] records.
	// If no parameters are passed, it refreshes the currently loaded
	//   [Cal4D_Event] record.
	// Sets the 4D Error variable.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : A [Cal4D_Event] record ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 18, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_iCal_RefreshOne
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName; $_t_TempFilePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_RefreshOne")


Cal4D_Init

If (Count parameters:C259>=1)
	QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$1)
End if 

If (Records in selection:C76(<>Cal_ptr_GroupTable->)>0)  // Make sure we have a record to work with.
	Cal4D_iCal_StatusMessage("Downloading \""+<>Cal_ptr_GroupFld_Name->+"\" calendar...")  // Localize
	$_t_TempFilePath:=Cal4D_iCal_DownloadCalendarFile(<>Cal_ptr_GroupicalURLField->; <>Cal_ptr_GroupicaluserNameField->; <>Cal_ptr_GroupicalPasswordField->)
	If (Error=0)
		Cal4D_iCal_StatusMessage("Importing \""+<>Cal_ptr_GroupFld_Name->+"\" calendar...")  // Localize
		Cal4D_iCal_ImportCalendarFile($_t_TempFilePath; <>Cal_ptr_GroupFld_ID->)
	End if 
	Cal4D_iCal_DeleteCalendarFile($_t_TempFilePath)
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_RefreshOne"; $_t_oldMethodName)