//%attributes = {}
If (False:C215)
	//Project Method Name:      DATE_DateTimeToRFCString
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
	C_TEXT:C284($_t_oldMethodName; $_t_rfcDate; $0)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DATE_DateTimeToRFCString")

// (PM) DATE_DateTimeToRFCString
// Returns a RFC 822 string for a date and time
// $1 = Date
// $2 = TIme
// $0 = RFC string


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

//$_t_rfcDate:=@XXAP Timestamp to GMT($_d_Date;$_ti_Time;$gmtdate;$gmttime)
$_t_rfcDate:=String:C10($_d_Date; Date RFC 1123:K1:11; $_ti_Time)  // returns, for example Fri, 10 Sep 2010 13:07:20 GMT 

$0:=$_t_rfcDate
ERR_MethodTrackerReturn("DATE_DateTimeToRFCString"; $_t_oldMethodName)