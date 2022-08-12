//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Play_Words
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
	C_LONGINT:C283($_l_CharIndex; $_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Play_Words")
$_l_CharPosition:=Position:C15(" "; $1)
$_l_CharIndex:=Length:C16($1)
If ($_l_CharPosition=0)
	Play_Word($_l_CharIndex)
Else 
	$_l_CharIndex:=$_l_CharPosition-1
	While ($1#"")
		IDLE:C311  // 7/04/03 pb
		$1:=Substring:C12($1; $_l_CharPosition+1; 32000)
		Play_Word($_l_CharIndex)
		PLAY:C290("Key Space"; 0)
		$_l_CharPosition:=Position:C15(" "; $1)
		If ($_l_CharPosition=0)
			$_l_CharIndex:=Length:C16($1)
			$_l_CharPosition:=31999
		Else 
			$_l_CharIndex:=$_l_CharPosition-1
		End if 
	End while 
End if 
ERR_MethodTrackerReturn("Play_Words"; $_t_oldMethodName)
