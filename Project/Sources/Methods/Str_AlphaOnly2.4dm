//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_AlphaOnly2
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
	C_TEXT:C284($_t_InputText; $_t_oldMethodName; $_t_outputText; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_AlphaOnly2")
//strips every character apart from Alpha Letters

$0:=""
If (Count parameters:C259>=1)
	$_t_inputtext:=$1
	$_t_outputText:=""
	$_l_InputLength:=Length:C16($_t_InputText)
	For ($_l_Index; 1; $_l_InputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($_t_InputText; $_l_Index; 1))
		If ((($_l_CharacterCode>64) & ($_l_CharacterCode<91)) | (($_l_CharacterCode>96) & ($_l_CharacterCode<123)))
			$_t_outputText:=$_t_outputText+Char:C90($_l_CharacterCode)
		End if 
	End for 
	$0:=$_t_outputText
End if 
ERR_MethodTrackerReturn("Str_AlphaOnly2"; $_t_oldMethodName)