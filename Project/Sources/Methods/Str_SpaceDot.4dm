//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_SpaceDot
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_SpaceDot")
If (Count parameters:C259>=1)
	$0:=$1
	$_l_CharPosition:=Position:C15(" "; $0)
	
	While ($_l_CharPosition>0)
		IDLE:C311  // 7/04/03 pb
		$0:=Substring:C12($0; 1; $_l_CharPosition-1)+"."+Substring:C12($0; $_l_CharPosition+1; Length:C16($0))
		$_l_CharPosition:=Position:C15(" "; $0)
	End while 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_SpaceDot"; $_t_oldMethodName)
