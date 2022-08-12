//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_TimeZone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_TimeZones;0)
	C_BOOLEAN:C305(vMore_B)
	C_LONGINT:C283($_l_Params; $_l_WindowReference; RB_Yes)
	C_TEXT:C284(<>Cal_t_iCalTimeZone; $_t_MethodName; $_t_oldMethodName; $_t_Path; $_t_Timezone; $_t_WeekStart; $_t_Zone; $0; $1; CAL_t_TimeZone; CAL_t_TimeZoneShort)
	C_TEXT:C284(CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_TimeZone")

$_t_WeekStart:=DB_GetIndexedString(32000; 1)
$_l_Params:=Count parameters:C259
If ($_l_Params=1)
	$_t_Zone:=$1
Else 
	$_t_Zone:=Cal4D_iCal_GetTimezone
End if 

vMore_B:=False:C215


If (($_t_Zone="") | ($_l_Params=1))
	$_l_WindowReference:=Open form window:C675("Cal4D_iCal_TimeZone_d"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("Cal4D_iCal_TimeZone_d")
	CLOSE WINDOW:C154($_l_WindowReference)
	
	If (OK=1)
		$_t_Timezone:=CAL_at_TimeZones{CAL_at_TimeZones}
		$_t_Zone:=Substring:C12(CAL_at_TimeZones{CAL_at_TimeZones}; 1; 1)+Choose:C955(RB_Yes=1; ":DT"; ":ST")
		
		CAL_T_UserTimeZone:=CAL4D_STR_Parse(CAL_at_TimeZones{CAL_at_TimeZones}; 4; ":")+":"
		CAL_T_UserTimeZone:=CAL_T_UserTimeZone+CAL4D_STR_Parse(CAL_at_TimeZones{CAL_at_TimeZones}; 1; ":")+":"
		CAL_T_UserTimeZone:=CAL_T_UserTimeZone+Choose:C955(RB_Yes=1; "Daylight"; "Standard")+":"
		CAL_T_UserTimeZone:=CAL_T_UserTimeZone+CAL4D_STR_Parse(CAL_at_TimeZones{CAL_at_TimeZones}; 3; ":")+":"
		CAL_T_UserTimeZone:=CAL_T_UserTimeZone+CAL4D_STR_Parse(CAL_at_TimeZones{CAL_at_TimeZones}; 2; ":")
		<>Cal_t_iCalTimeZone:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":")+":"+Choose:C955(RB_Yes=1; "DT"; "ST")
		Cal_t_TimeZone:=<>Cal_t_iCalTimeZone
		CAL_t_TimeZoneShort:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":")+":"+CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":")
		//}
		
		Cal4D_TimeZone_SaveToDisk(Cal4D_User_Name)
		
	Else 
		If (vMore_B)
			Cal4D_Cal_GetTimeZone_TiZNO(CAL_t_TimeZone)
			
			// //  Reset the variables in memory
			//{
			<>Cal_t_iCalTimeZone:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 2; ":")+":"+Choose:C955(CAL4D_STR_Parse(CAL_T_UserTimeZone; 3; ":")="Daylight"; "DT"; "ST")
			Cal_t_TimeZone:=<>Cal_t_iCalTimeZone
			CAL_t_TimeZoneShort:=CAL4D_STR_Parse(CAL_T_UserTimeZone; 4; ":")+":"+CAL4D_STR_Parse(CAL_T_UserTimeZone; 1; ":")
			//}
			
		End if 
		
	End if 
	
	//========================    Clean up and Exit    =================================
Else 
	ARRAY TEXT:C222(CAL_at_TimeZones; 0)
	STRING LIST TO ARRAY:C511(16003; CAL_at_TimeZones)
	
End if 

CLEAR VARIABLE:C89(CAL_at_TimeZones)
$0:=$_t_Timezone
ERR_MethodTrackerReturn("Cal4D_iCal_TimeZone"; $_t_oldMethodName)