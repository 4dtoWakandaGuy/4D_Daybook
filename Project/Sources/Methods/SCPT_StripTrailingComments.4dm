//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_StripTrailingComments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2009 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_StripTrailingComments")

If (Count parameters:C259>=1)
	If ($1#"")
		//UNICODE TEST
		$_l_CharacterPosition:=Position:C15(Char:C90(96); $1; *)
		If ($_l_CharacterPosition>0)
			$0:=Substring:C12($1; 1; $_l_CharacterPosition-1)
		Else 
			$0:=$1
		End if 
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SCPT_StripTrailingComments"; $_t_oldMethodName)
