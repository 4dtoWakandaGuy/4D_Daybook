//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_GetDateTimeStamp
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
	C_TEXT:C284($_t_Date; $_t_oldMethodName; $0)
	C_TIME:C306($_ti_TIme; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_GetDateTimeStamp")


// Declare local variables

// Reassign for readability
$_d_Date:=$1
$_ti_TIme:=$2


$0:=String:C10(Year of:C25($_d_Date); "0000")+String:C10(Month of:C24($_d_Date); "00")+String:C10(Day of:C23($_d_Date); "00")+String:C10($_ti_TIme; HH MM SS:K7:1)
$0:=Replace string:C233($0; ":"; "")
$0:=Replace string:C233($0; "/"; "")
ERR_MethodTrackerReturn("MIR_GetDateTimeStamp"; $_t_oldMethodName)
