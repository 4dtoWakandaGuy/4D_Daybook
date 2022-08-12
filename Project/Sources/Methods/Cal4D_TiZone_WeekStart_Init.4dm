//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_TiZone_WeekStart_Init
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_TiZone_WeekStart_Init
	// //
	// //  Written by Charles Vass - 09/24/2009, 08:15
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//=====================    Declare Variables    ==================================
	//method_parameters_declarations
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:30`Method: Cal4D_TiZone_WeekStart_Init
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cal_at_1stDayOfWeek;0)
	C_LONGINT:C283($_l_WindowReference; CAL_l_SetDST)
	C_TEXT:C284($_t_oldMethodName; $_t_WeekStart; $_t_Zone; CAL_t_CalWeekStart; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_TiZone_WeekStart_Init")
CAL_l_SetDST:=0

//========================    Method Actions    ==================================

$_l_WindowReference:=Open form window:C675("Cal4D_TiZone_WeekStart_Init_d"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("Cal4D_TiZone_WeekStart_Init_d")
CLOSE WINDOW:C154($_l_WindowReference)

If (OK=1)
	CAL_t_CalWeekStart:=Substring:C12(Cal_at_1stDayOfWeek{Cal_at_1stDayOfWeek}; 1; 3)
	Cal4D_TimeZone_SaveToDisk(Cal4D_User_Name)
	
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_TiZone_WeekStart_Init"; $_t_oldMethodName)