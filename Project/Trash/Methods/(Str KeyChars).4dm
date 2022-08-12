//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str KeyChars
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
	C_LONGINT:C283($_l_CharCode; $_l_Index; $_l_InputLength; $_l_PreviousCharCode)
	C_TEXT:C284($_t_FieldValue; $_t_FieldValueOutput; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str KeyChars")
//Str KeyChars
//strips chars not allowed in Keywords

$0:=""

$_l_PreviousCharCode:=0
$_t_FieldValue:=""
$_t_FieldValueOutput:=""
If (Count parameters:C259>=1)
	RemoveLeadTr($1; ->$_t_FieldValue)
	
	$_t_FieldValue:=Replace string:C233(Replace string:C233($_t_FieldValue; "  "; " "); "  "; " ")
	$_l_InputLength:=Length:C16($_t_FieldValue)
	
	For ($_l_Index; 1; $_l_InputLength)
		$_l_PreviousCharCode:=$_l_CharCode
		$_l_CharCode:=Character code:C91(Substring:C12($_t_FieldValue; $_l_Index; 1))
		If ((($_l_CharCode>64) & ($_l_CharCode<91)) | (($_l_CharCode>96) & ($_l_CharCode<123)) | (($_l_CharCode>47) & ($_l_CharCode<58)) | ($_l_CharCode=35) | ($_l_CharCode=36) | ($_l_CharCode=37) | ($_l_CharCode=32) | ($_l_CharCode=45) | ($_l_CharCode=163))
			If (($_l_CharCode=45) & ($_l_PreviousCharCode=32))
			Else 
				$_t_FieldValueOutput:=$_t_FieldValueOutput+Char:C90($_l_CharCode)
			End if 
		Else 
			If ($_l_PreviousCharCode#32)
				$_t_FieldValueOutput:=$_t_FieldValueOutput+" "
			End if 
		End if 
	End for 
	$_t_FieldValue:=""
	RemoveLeadTr($_t_FieldValueOutput; ->$_t_FieldValue)
	$0:=Replace string:C233(Replace string:C233($_t_FieldValue; "  "; " "); "  "; " ")
End if 

//a-z, A-Z, 0-9, plus  # % £ $ and hyphen is allowed when not surrounded by spaces
ERR_MethodTrackerReturn("Str KeyChars"; $_t_oldMethodName)