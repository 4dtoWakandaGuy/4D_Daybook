//%attributes = {}
If (False:C215)
	//Project Method Name:      DATE_SecondsToDateTime
	//------------------ Method Notes ------------------
	// DATE_SecondsToDateTime
	// Returns the date and time values that are packed into a longint value
	// $1 = Longint value
	// $2 = Pointer to date field/variable
	// $3 = Pointer to time field/variable
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Value; $1)
	C_POINTER:C301($_d_Date; $_ti_Time; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DATE_SecondsToDateTime")


$_l_Value:=$1
$_d_Date:=$2
$_ti_Time:=$3

$_ti_Time->:=?00:00:00?+Mod:C98($_l_Value; 24*60*60)
$_d_Date->:=!1970-01-01!+(($_l_Value-$_ti_Time->)/(24*60*60))
ERR_MethodTrackerReturn("DATE_SecondsToDateTime"; $_t_oldMethodName)