//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str CountStr
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
	C_LONGINT:C283($_l_CharPosition; $0)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str CountStr")
$0:=0
If (Count parameters:C259>=2)
	$_l_CharPosition:=Position:C15($2; $1)
	While ($_l_CharPosition>0)
		IDLE:C311  // 7/04/03 pb
		$1:=Substring:C12($1; $_l_CharPosition+1; 32000)
		$_l_CharPosition:=Position:C15($2; $1)
		$0:=$0+1
	End while 
End if 
ERR_MethodTrackerReturn("Str CountStr"; $_t_oldMethodName)
