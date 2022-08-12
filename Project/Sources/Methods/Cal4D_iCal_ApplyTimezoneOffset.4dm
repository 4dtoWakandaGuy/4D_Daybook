//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_ApplyTimezoneOffset
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
	//ARRAY TEXT(CAL_at_TimeZones;0)
	C_DATE:C307($_d_Date; $_d_IncomingDate; $3)
	C_LONGINT:C283($_l_CharacterPosition; $_l_HourOf; $_l_MinuteOf; $_l_Offset; $_l_OriginDX; $_l_SecondsPerDay; $_l_SecondsPerHour; $_l_SecondsPerMinute; $_l_WestOrEast)
	C_REAL:C285($_r_DIfference; $_r_TZOffset; $_r_TZOffsetOrigin; $_r_ZoffsetLoc)
	C_TEXT:C284($_t CALoZone; $_t_DateTimeString; $_t_MethodName; $_t_oldMethodName; $_t_TimeCodes; $_t_TimeZone; $_t_TZLoc; $_t_TZOrigin; $0; $1; $2)
	C_TEXT:C284($5; $6)
	C_TIME:C306($_ti_iTime; $_ti_Time; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_ApplyTimezoneOffset")


$_t_TimeZone:=$1
$_t CALoZone:=$2
$_d_IncomingDate:=$3
$_ti_iTime:=$4

$_d_Date:=$_d_IncomingDate
$_ti_Time:=$_ti_iTime

////  For human readability
//{
$_l_SecondsPerMinute:=60
$_l_SecondsPerHour:=$_l_SecondsPerMinute*60
$_l_SecondsPerDay:=$_l_SecondsPerHour*24
//}

////  Capture the hour and minute as whole numbers
//{
$_l_HourOf:=Cal4D_UTIL_HourOf($_ti_iTime)
$_l_MinuteOf:=Cal4D_UTIL_MinuteOf($_ti_iTime)
//}

//========================    Method Actions    ==================================

////  Get our GMT/UTC offsets using reals to account for those zone
////  with offsets of 00:30 minutes
//{
If (Count parameters:C259=6)
	$_t_TZLoc:=$5
	$_t_TZOrigin:=$6
	$_l_WestOrEast:=0
	If ($_t_TZOrigin="-@")
		$_l_OriginDX:=-1
	Else 
		$_l_OriginDX:=1
	End if 
	
Else 
	////  "Z" is single letter designator for GMT/UTC
	////  $_l_WestOrEast will be zero or a negative number
	////  $_l_OriginDX will be zero or a positive number
	//{
	$_t_TimeCodes:="YXWVUTSRQPONZABCDEFGHIKLM"
	$_l_CharacterPosition:=Position:C15("Z"; $_t_TimeCodes)
	$_l_WestOrEast:=Position:C15(Substring:C12($_t_TimeZone; 1; 1); $_t_TimeCodes)-$_l_CharacterPosition
	$_l_OriginDX:=Position:C15($_t CALoZone; $_t_TimeCodes)-$_l_CharacterPosition
	//}
	
	$_l_CharacterPosition:=Find in array:C230(CAL_at_TimeZones; $_t_TimeZone+"@")
	$_t_TZLoc:=CAL_at_TimeZones{$_l_CharacterPosition}
	$_t_TZLoc:=Substring:C12($_t_TZLoc; 3; 5)
	
	$_l_CharacterPosition:=Find in array:C230(CAL_at_TimeZones; $_t CALoZone+"@")
	$_t_TZOrigin:=CAL_at_TimeZones{$_l_CharacterPosition}
	$_t_TZOrigin:=Substring:C12($_t_TZOrigin; 3; 5)
	
End if 
If (Substring:C12($_t_TZLoc; 4)#"00")
	$_t_TZLoc:=Substring:C12($_t_TZLoc; 1; 3)+"50"
End if 
$_r_ZoffsetLoc:=Num:C11($_t_TZLoc)/100

If (Substring:C12($_t_TZOrigin; 4)#"00")
	$_t_TZOrigin:=Substring:C12($_t_TZOrigin; 1; 3)+"50"
End if 
$_r_TZOffsetOrigin:=Num:C11($_t_TZOrigin)/100
//}

Case of 
	: ($_l_OriginDX<$_l_WestOrEast)
		////  Originator is West of Local
		//{
		$_r_DIfference:=$_r_ZoffsetLoc-$_r_TZOffsetOrigin
		If ($_r_DIfference+$_l_HourOf<24)
			////  Same day
			//{
			$_l_Offset:=$_r_DIfference*$_l_SecondsPerHour
			$_d_Date:=$_d_IncomingDate
			$_ti_Time:=$_ti_iTime+$_l_Offset
			//}
		Else 
			////  Local is Originator Day + 1
			//{
			$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
			$_l_Offset:=$_r_DIfference*$_l_SecondsPerHour
			
			////  Apply the offset and adjust for past midnight
			////
			$_ti_Time:=($_ti_iTime+$_l_Offset)-$_l_SecondsPerDay
			//}
		End if 
		//}
	: ($_l_OriginDX>$_l_WestOrEast)
		////  Originator is East of Local, $_r_DIfference will be a negative number
		//{
		$_r_DIfference:=$_r_ZoffsetLoc-$_r_TZOffsetOrigin
		If ($_r_DIfference+$_l_HourOf<0)
			////  Local is Originator Day - 1
			//{
			$_d_Date:=Add to date:C393($_d_Date; 0; 0; -1)
			
			////  Strip the hours after midnight out of $_r_DIfference,
			////  what is left is hours before midnight
			////
			$_r_DIfference:=$_r_DIfference+$_l_HourOf
			$_l_Offset:=$_r_DIfference*$_l_SecondsPerHour
			
			////  First adjust $_ti_iTime back to midnight, 00:MM:SS,...
			////  preserving any minutes and seconds in the time,...
			////  next change the value of midnight to 24:MM:SS
			////
			$_ti_iTime:=($_ti_iTime-($_l_HourOf*$_l_SecondsPerHour))+$_l_SecondsPerDay
			
			////  Finally apply the offset before midnight to $_ti_iTime
			////
			$_ti_Time:=$_ti_iTime+$_l_Offset
			//}
		Else 
			////  Local is Same Day
			//{
			$_l_Offset:=$_r_DIfference*$_l_SecondsPerHour
			$_ti_Time:=$_ti_iTime+$_l_Offset
			//}
		End if 
		//}
	Else 
		////  Same Time Zone
		//{
		$_ti_Time:=$_ti_iTime
		//}
End case 

$_t_DateTimeString:=Cal4D_ISO_DateTimeStrWithZone($_d_Date; $_ti_Time; $_t_TZLoc)

//========================    Clean up and Exit    =================================

$0:=$_t_DateTimeString
ERR_MethodTrackerReturn("Cal4D_iCal_ApplyTimezoneOffset"; $_t_oldMethodName)