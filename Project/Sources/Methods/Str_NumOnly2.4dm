//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_NumOnly2
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
	C_LONGINT:C283($_l_CharacterCode; $_l_Index; $_l_InputLength)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_NumOnly2")
//strips every character apart from numbers
If (Count parameters:C259>=1)
	$_l_InputLength:=Length:C16($1)
	$0:=""
	For ($_l_Index; 1; $_l_InputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_Index; 1))
		If (($_l_CharacterCode>47) & ($_l_CharacterCode<58))
			$0:=$0+Char:C90($_l_CharacterCode)
		End if 
	End for 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_NumOnly2"; $_t_oldMethodName)