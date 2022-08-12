//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_TimeDateStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:24`Method: GEN_TimeDateStamp
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1; $3)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_TimeDateStamp")

//NG July 2001
//Pass this method a date and time(even empty ones)
//and it will return a time date code(LONGINT)
Case of 
	: (Count parameters:C259=0)
		$_d_Date:=Current date:C33(*)
		$_ti_Time:=Current time:C178(*)
	: (Count parameters:C259=1)
		$_d_Date:=$1
		$_ti_Time:=Current time:C178
	: (Count parameters:C259=2)
		$_d_Date:=$1
		$_ti_Time:=$2
End case 
If (Count parameters:C259>=3)
	
	$0:=(($_d_Date-$3)*24*60*60)+($_ti_Time+0)
Else 
	$0:=(($_d_Date-!1999-12-30!)*24*60*60)+($_ti_Time+0)
End if 

If ($0=0)
	$0:=1
End if 
ERR_MethodTrackerReturn("GEN_TimeDateStamp"; $_t_oldMethodName)