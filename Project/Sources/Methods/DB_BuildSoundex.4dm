//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BuildSoundex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharIndex)
	C_TEXT:C284($_t_CharacterString; $_t_oldMethodName; $_t_Return; $_t_SoundsString; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BuildSoundex")
$_t_CharacterString:="aehiouwybfpvcgjkqsxzdtlmnr"
$_t_SoundsString:="11111111222233333333445667"
$_t_Return:=""
If ($1#"")
	For ($_l_CharIndex; 1; Length:C16($1))
		$_l_CharacterPosition:=Position:C15($1[[$_l_CharIndex]]; $_t_CharacterString)
		If ($_l_CharacterPosition>0)
			$_t_Return:=$_t_Return+$_t_SoundsString[[$_l_CharacterPosition]]
		End if 
	End for 
End if 

$0:=$_t_Return
ERR_MethodTrackerReturn("DB_BuildSoundex"; $_t_oldMethodName)