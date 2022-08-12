//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetTimezoneOffset
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_TimeZones; 0)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_Zone; $_t_ZoneString; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetTimezoneOffset")


$_t_Zone:=Cal4D_iCal_GetTimezone
ARRAY TEXT:C222($_at_TimeZones; 0)
Cal4D_iCal_GetTimezones(->$_at_TimeZones; Substring:C12($_t_Zone; 3))
$_t_Zone:=Substring:C12($_t_Zone; 1; 1)+"@"

//========================    Method Actions    ==================================

$_t_ZoneString:=Substring:C12($_at_TimeZones{Find in array:C230($_at_TimeZones; $_t_Zone)}; 3)
$_t_ZoneString:=Substring:C12($_t_ZoneString; 1; (Position:C15(":"; $_t_ZoneString)-1))

//========================    Clean up and Exit    =================================

$0:=$_t_ZoneString
ERR_MethodTrackerReturn("Cal4D_iCal_GetTimezoneOffset"; $_t_oldMethodName)