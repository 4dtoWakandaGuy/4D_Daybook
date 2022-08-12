//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_IMAChars2
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
	C_TEXT:C284($_t_InputText; $_t_oldMethodName; $_t_OutputText; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_IMAChars2")
//strips chars not allowed in IMA Codes
If (Count parameters:C259>=1)
	$_t_InputText:=$1
	$_l_InputLength:=Length:C16($_t_InputText)
	$_t_OutputText:="'"
	$0:=""
	For ($_l_Index; 1; $_l_InputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($_t_InputText; $_l_Index; 1))
		If ((($_l_CharacterCode>64) & ($_l_CharacterCode<91)) | (($_l_CharacterCode>96) & ($_l_CharacterCode<123)) | (($_l_CharacterCode>42) & ($_l_CharacterCode<58)) | ($_l_CharacterCode=32) | ($_l_CharacterCode=37) | ($_l_CharacterCode=39) | ($_l_CharacterCode=40) | ($_l_CharacterCode=41))
			$_t_OutputText:=$_t_OutputText+Char:C90($_l_CharacterCode)
		End if 
	End for 
	$0:=$_t_OutputText
	
Else 
	$0:=""
End if 
//a-z, A-Z, 0-9 plus space ! # % ' ( ) + , - .
ERR_MethodTrackerReturn("Str_IMAChars2"; $_t_oldMethodName)