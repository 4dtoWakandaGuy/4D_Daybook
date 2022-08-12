//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetTimezoneProcVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 20:00`Method: Cal4D_Cal_GetTimezoneProcVars
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_TimeZones;0)
	C_LONGINT:C283($_l_Position)
	C_TEXT:C284($_t_oldMethodName; Cal_t_TimeZone; CAL_t_TimeZoneShort; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetTimezoneProcVars")

If (CAL_t_TimeZone="")
	ARRAY TEXT:C222(CAL_at_TimeZones; 0)
	
	
	If (True:C214)
		Cal4D_TimeZone_LoadFromDisk(Cal4D_User_Name)
		CAL_t_TimeZoneShort:=Choose:C955(CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":")="Daylight"; "DT"; "ST")
		CAL_t_TimeZone:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":")+":"+CAL4D_STR_Parse(CAL_T_UserTimeZone; 5; ":")
		Cal_t_TimeZone:=CAL_t_TimeZone
		Cal4D_iCal_GetTimezones(->CAL_at_TimeZones; CAL_t_TimeZoneShort)
		CAL_t_TimeZoneShort:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":")+":"+CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":")
		
	Else 
		CAL_t_TimeZone:=Cal4D_iCal_GetTimezone
		$_l_Position:=STR_PositionR(":"; CAL_t_TimeZone)
		CAL_t_TimeZoneShort:=Substring:C12(CAL_t_TimeZone; $_l_Position+1)
		Cal4D_iCal_GetTimezones(->CAL_at_TimeZones; CAL_t_TimeZoneShort)
		
		CAL_t_TimeZone:=CAL_at_TimeZones{Find in array:C230(CAL_at_TimeZones; Substring:C12(CAL_t_TimeZone; 1; $_l_Position-1)+"@")}
		$_l_Position:=Position:C15(":"; CAL_t_TimeZone; 3)
		CAL_t_TimeZoneShort:=Substring:C12(CAL_t_TimeZone; $_l_Position+1)
		CAL_t_TimeZone:=Substring:C12(CAL_t_TimeZone; 1; $_l_Position-1)
		
	End if 
	//}
	
	//========================    Clean up and Exit    =================================
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_GetTimezoneProcVars"; $_t_oldMethodName)