//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_TimeCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $i; $l)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_TimeCode")
$i:=1
$l:=Length:C16(<>PER_t_CurrentUserInitials)
$0:=0
While ($i<=$l)
	IDLE:C311  // 03/04/03 pb
	$0:=$0+Character code:C91(Substring:C12(<>PER_t_CurrentUserInitials; $i; 1))
	$i:=$i+1
End while 
$0:=Int:C8(Current time:C178*($0/2))
ERR_MethodTrackerReturn("Gen_TimeCode"; $_t_oldMethodName)