//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_DateTimeToNum
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
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Time; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_DateTimeToNum")
//UTI_DateTimeToNum
//Converts a date ($1) and Time ($2) to a longint
//(number of seconds since 01/01/1998)
//example call: DateTimeFld:=DateTimeToNum(Current Date;Current Time)
If (Count parameters:C259>=2)
	$_d_Date:=$1
	$_ti_Time:=$2
	$0:=(($_d_Date-!1998-01-01!)*86400)+$_ti_Time
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("UTI_DateTimeToNum"; $_t_oldMethodName)
