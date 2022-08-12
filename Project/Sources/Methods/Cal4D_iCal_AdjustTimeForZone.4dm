//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_AdjustTimeForZone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Local)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_Day; $_l_Hours; $_l_LastDay; $_l_Time)
	C_TEXT:C284($_t_ISODateTimeStr; $_t_MethodName; $_t_Offset; $_t_oldMethodName; $_t_TimeZoneString; $0; $3)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_AdjustTimeForZone")

$_ti_Time:=?12:30:00?
$_l_Hours:=Cal4D_UTIL_HourOf($_ti_Time)
If (15>$_l_Hours)
	$_ti_Time:=$_ti_Time-(12*3600)
	$_ti_Time:=$_ti_Time+(24*3600)
	$_ti_Time:=$_ti_Time-(3*3600)
End if 
$_ti_Time:=$_ti_Time-(15*3600)


$_d_Date:=$1
$_ti_Time:=$2
$_t_Offset:=$3

$_t_TimeZoneString:=Cal4D_ISO_DateTimeStrWithZone($_d_Date; $_ti_Time; $_t_Offset)

$_l_Day:=1
$_l_Time:=1
$_bo_Local:=True:C214
$_l_LastDay:=-1


If (($_l_LastDay=-1) & ($_bo_Local))
	//// Get the day of the week, Sunday = 0
	//// Timezone of origin 20090327T1230Z+1100
	////
	//$_l_LastDay:=Day number(Cal4D_Time_ParseISO8601 ($_t_TimeZoneString;Not($_bo_Local)))
End if 

//$_d_Date:=Cal4D_Time_ParseISO8601 (obj.className,$_bo_Local);




$0:=$_t_ISODateTimeStr
ERR_MethodTrackerReturn("Cal4D_iCal_AdjustTimeForZone"; $_t_oldMethodName)