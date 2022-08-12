//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Long Date2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_DayEnd; $_t_DayName; $_t_MonthName; $_t_oldMethodName; vLongDate)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Long Date2")
//Long Date2
$_t_DayEnd:=DayEnd(vDate)
$_t_DayName:=DayName(vDate)
$_t_MonthName:=MonthName(vDate)
vLongDate:=$_t_DayName+" "+String:C10(Day of:C23(vDate))+$_t_DayEnd+" "+$_t_MonthName
//vMonth:=$_t_MonthName
//vYear:=String(Year of(vDate))
ERR_MethodTrackerReturn("Long Date2"; $_t_oldMethodName)
