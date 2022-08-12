//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_SecondOf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Seconds; $0)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_TimeString)
	C_TIME:C306($_ti_Time; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_SecondOf")

$_ti_Time:=$1


$_t_TimeString:=String:C10($_ti_Time; HH MM SS:K7:1)
$_l_Seconds:=Num:C11(Substring:C12($_t_TimeString; 7; 2))


$0:=$_l_Seconds
ERR_MethodTrackerReturn("Cal4D_UTIL_SecondOf"; $_t_oldMethodName)