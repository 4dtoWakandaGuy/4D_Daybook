//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Util_DateTimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_DayofSeconds; $_l_Seconds; $_l_SecondsOffset)
	C_TEXT:C284($_t_DateTimeString; $_t_MethodName; $_t_Offset; $_t_oldMethodName; $0; $3)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_DateTimeStamp")

$_t_DateTimeString:=""
$_d_Date:=$1
$_ti_Time:=$2
$_t_Offset:=$3

$_l_SecondsOffset:=(3600*Num:C11(Substring:C12($_t_Offset; 1; 3)))
$_l_Seconds:=($_ti_Time*1)+$_l_SecondsOffset
$_l_DayofSeconds:=(60*60*24)


Case of 
	: ($_l_Seconds<0)
		$_l_Seconds:=$_l_DayofSeconds+$_l_Seconds
		$_d_Date:=Add to date:C393($_d_Date; 0; 0; -1)
	: ($_l_Seconds>$_l_DayofSeconds)
		$_l_Seconds:=$_l_Seconds-$_l_DayofSeconds
		$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
		
	: ($_l_Seconds=0)
		
	: ($_l_Seconds=$_l_DayofSeconds)
		$_d_Date:=Add to date:C393($_d_Date; 0; 0; 1)
		$_l_Seconds:=0
		
End case 

$_ti_Time:=$_l_Seconds
$_t_DateTimeString:=String:C10(Year of:C25($_d_Date))+String:C10(Month of:C24($_d_Date); "00")+String:C10(Day of:C23($_d_Date); "00")+"T"
$_t_DateTimeString:=$_t_DateTimeString+String:C10(Cal4D_UTIL_HourOf($_ti_Time); "00")+String:C10(Cal4D_UTIL_MinuteOf($_ti_Time); "00")+String:C10(Cal4D_UTIL_SecondOf($_ti_Time); "00")+"Z"

$0:=$_t_DateTimeString
ERR_MethodTrackerReturn("Cal4D_Util_DateTimeStamp"; $_t_oldMethodName)