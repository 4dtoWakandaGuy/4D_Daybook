//%attributes = {}
If (False:C215)
	//Project Method Name:      RemoveChar
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RemoveChar")
//RemoveChar - just a single character, multiple times

$_l_CharPosition:=Position:C15($2; $1)
While ($_l_CharPosition>0)
	IDLE:C311  // 7/04/03 pb
	$1:=Substring:C12($1; 1; $_l_CharPosition-1)+Substring:C12($1; $_l_CharPosition+1; 32000)
	$_l_CharPosition:=Position:C15($2; $1)
End while 
$0:=$1
ERR_MethodTrackerReturn("RemoveChar"; $_t_oldMethodName)
