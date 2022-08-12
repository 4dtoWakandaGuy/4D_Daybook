//%attributes = {}
If (False:C215)
	//Project Method Name:      RemoveTrail2
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
	C_LONGINT:C283($l)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RemoveTrail2")
//RemoveTrail2
$l:=Length:C16($1)
While ((Substring:C12($1; $l; 1)=" ") & ($l>0))
	IDLE:C311  // 7/04/03 pb
	$l:=$l-1
End while 
If ($l>0)
	$0:=Substring:C12($1; 1; $l)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("RemoveTrail2"; $_t_oldMethodName)