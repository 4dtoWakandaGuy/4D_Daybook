//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_MinuteOf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Minutes; $0)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_TImeString)
	C_TIME:C306($_ti_Time; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_MinuteOf")
$_ti_Time:=$1

$_t_TImeString:=String:C10($_ti_Time; HH MM SS:K7:1)
$_l_Minutes:=Num:C11(Substring:C12($_t_TImeString; 4; 2))

$0:=$_l_Minutes
ERR_MethodTrackerReturn("Cal4D_UTIL_MinuteOf"; $_t_oldMethodName)