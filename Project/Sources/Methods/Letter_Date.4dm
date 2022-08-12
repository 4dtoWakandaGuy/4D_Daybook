//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_Date
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
	C_DATE:C307($_d_Date; $1; vDate)
	C_TEXT:C284($_t_DayEnd; $_t_MonthName; $_t_oldMethodName; vLetterDate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Date")
//Letter_Date
If (Count parameters:C259>=1)
	$_d_Date:=$1
Else 
	$_d_Date:=vDate
End if 
$_t_DayEnd:=DayEnd($_d_Date)
$_t_MonthName:=MonthName($_d_Date)
vLetterDate:=String:C10(Day of:C23($_d_Date))+$_t_DayEnd+" "+$_t_MonthName+" "+String:C10(Year of:C25($_d_Date))
ERR_MethodTrackerReturn("Letter_Date"; $_t_oldMethodName)