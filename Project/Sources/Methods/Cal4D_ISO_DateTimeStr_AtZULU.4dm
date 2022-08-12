//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_ISO_DateTimeStr_AtZULU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_CountParameters)
	C_TEXT:C284($_t_DateTimeString; $_t_MethodName; $_t_Offset; $_t_oldMethodName; $_t_Zone; $0; $3; CAL_t_TimeZone)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ISO_DateTimeStr_AtZULU")


Cal4D_Cal_GetTimezoneProcVars
$_t_Zone:=Substring:C12(CAL_t_TimeZone; 1; 1)

$_t_DateTimeString:=""
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	$_d_Date:=$1
	If ($_l_CountParameters>1)
		$_ti_Time:=$2
		If ($_l_CountParameters>2)
			$_t_Offset:=$3
		Else 
			$_t_Offset:=Substring:C12(CAL_t_TimeZone; 3)
		End if 
	Else 
		$_ti_Time:=Current time:C178(*)
		$_t_Offset:=Substring:C12(CAL_t_TimeZone; 3)
	End if 
Else 
	$_d_Date:=Current date:C33(*)
	$_ti_Time:=Current time:C178(*)
	$_t_Offset:=Substring:C12(CAL_t_TimeZone; 3)
	
End if 

//========================    Method Actions    ==================================

$_t_DateTimeString:=Cal4D_iCal_ApplyTimezoneOffset("Z"; $_t_Zone; $_d_Date; $_ti_Time; " 0000"; $_t_Offset)

//========================    Clean up and Exit    =================================

$0:=$_t_DateTimeString
ERR_MethodTrackerReturn("Cal4D_ISO_DateTimeStr_AtZULU"; $_t_oldMethodName)