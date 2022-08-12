//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetTimezone
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_iCal_GetTimezone
	// //
	// //  Written by Charles Vass - 03/25/2009, 08:05
	// //
	// //  Purpose: Return the current timezone save in "TimeZone.xlf" saved
	// //           in the current Resources folder
	// //
	// //  $0 - TEXT - The Timezone <Zone>:<DT | ST>
	// //       <Zone> is the single letter designator typically used by the military
	// //       <DT | ST> DT if in Daylight Savings time, ST if in Standard time
	// //
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 18:16`Method: Cal4D_iCal_GetTimezone
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_TImeZone; $0; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetTimezone")

Cal4D_TimeZone_LoadFromDisk(Cal4D_User_Name)

//========================    Method Actions    ==================================

$_t_TImeZone:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":")+":"+Choose:C955(CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":")="Daylight"; "DT"; "ST")


//========================    Clean up and Exit    =================================

$0:=$_t_TImeZone
ERR_MethodTrackerReturn("Cal4D_iCal_GetTimezone"; $_t_oldMethodName)