//%attributes = {}
If (False:C215)
	//Project Method Name:      DATE_DateTimeToSeconds
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
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_Value; $0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DATE_DateTimeToSeconds")

// (PM) DATE_DateTimeToSeconds
// Converts a date/time to seconds
// $1 = Date
// $2 = Time
// $0 = Longint value


If (Count parameters:C259>=1)
	$_d_Date:=$1
Else 
	$_d_Date:=Current date:C33
End if 
If (Count parameters:C259>=2)
	$_ti_Time:=$2
Else 
	$_ti_Time:=Current time:C178
End if 

// We're storing the value as the number of seconds since 1-1-1970
$_l_Value:=($_d_Date-!1970-01-01!)*(24*60*60)
$_l_Value:=$_l_Value+$_ti_Time

$0:=$_l_Value
ERR_MethodTrackerReturn("DATE_DateTimeToSeconds"; $_t_oldMethodName)