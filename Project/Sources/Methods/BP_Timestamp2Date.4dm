//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_Timestamp2Date
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_TimeStampCutDate; $0)
	C_LONGINT:C283($_l_TImeStamp; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_Timestamp2Date")

$_l_TImeStamp:=$1
$_d_TimeStampCutDate:=!1970-01-01!

If ($_l_TImeStamp>0)
	$0:=$_d_TimeStampCutDate+($_l_TImeStamp\86400)
Else 
	$0:=$_d_TimeStampCutDate+($_l_TImeStamp\86400)+1
End if 
ERR_MethodTrackerReturn("BP_Timestamp2Date"; $_t_oldMethodName)
