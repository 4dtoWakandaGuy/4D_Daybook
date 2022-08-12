//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_SameDayNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; $1; $2)
	C_LONGINT:C283($_l_DayNumber; $_l_DayNumber2; $_l_Dayof; $_l_Month)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_SameDayNo")
//Date_SameDayNo - sets $0 to adjust $1 to be the same day number as
//$0 within the same month

$0:=$1
$_l_DayNumber:=Day number:C114($2)
$_l_DayNumber2:=Day number:C114($0)
If ($_l_DayNumber#$_l_DayNumber2)
	$_l_Month:=Month of:C24($0)
	$_l_Dayof:=Day of:C23($0)
	If ($_l_Dayof>3)
		$0:=$0-3
		$_l_Dayof:=Day of:C23($0)
	End if 
	$_l_DayNumber2:=Day number:C114($0)
	While ($_l_DayNumber#$_l_DayNumber2)
		IDLE:C311  // 03/04/03 pb
		$0:=$0+1
		$_l_DayNumber2:=Day number:C114($0)
	End while 
	If ($_l_Month#Month of:C24($0))
		$0:=$0-7
	End if 
End if 
ERR_MethodTrackerReturn("Date_SameDayNo"; $_t_oldMethodName)