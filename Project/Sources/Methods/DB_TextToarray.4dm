//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TextToarray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      22/12/2010 15:32 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit; $_bo_IgnoreBlankSpace; $_bo_IgnoreLeadingSpace; $_bo_IgnoreTrailingSpace; $4; $5; $6)
	C_LONGINT:C283($_l_CharacterPosition; $_l_LineLength)
	C_POINTER:C301($_ptr_Array; $1; $2)
	C_TEXT:C284($_t_Delimiter; $_t_Line; $_t_oldMethodName; $_t_Text; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TextToarray")
$_t_Text:=$1->

$_ptr_Array:=$2
$_bo_IgnoreLeadingSpace:=False:C215
$_bo_IgnoreTrailingSpace:=False:C215
$_bo_IgnoreBlankSpace:=False:C215
If (Count parameters:C259>=4)
	$_bo_IgnoreLeadingSpace:=$4
Else 
	$_bo_IgnoreLeadingSpace:=False:C215
End if 
If (Count parameters:C259>=5)
	$_bo_IgnoreTrailingSpace:=$5
Else 
	$_bo_IgnoreTrailingSpace:=False:C215
End if 
If (Count parameters:C259>=6)
	$_bo_IgnoreBlankSpace:=$6
Else 
	$_bo_IgnoreBlankSpace:=False:C215
End if 
If (Count parameters:C259>=3)
	$_t_Delimiter:=$3
Else 
	$_t_Delimiter:=Char:C90(13)
End if 
Repeat 
	$_l_CharacterPosition:=Position:C15($_t_Delimiter; $_t_Text)
	$_t_Line:=""
	If ($_l_CharacterPosition>0)
		$_t_Line:=Substring:C12($_t_Text; 1; $_l_CharacterPosition-1)
		$_t_Text:=Substring:C12($_t_Text; $_l_CharacterPosition+1)
	Else 
		$_t_Line:=$_t_Text
		$_t_Text:=""
	End if 
	If ($_bo_IgnoreLeadingSpace)
		$_bo_Exit:=False:C215
		Repeat 
			If (Length:C16($_t_Line)>0)
				If ($_t_Line[[1]]=" ")
					If (Length:C16($_t_Line)>1)
						$_t_Line:=Substring:C12($_t_Line; 2)
					Else 
						$_t_Line:=""
					End if 
				Else 
					$_bo_Exit:=True:C214
				End if 
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
	End if 
	If ($_bo_IgnoreTrailingSpace)
		$_bo_Exit:=False:C215
		Repeat 
			$_l_LineLength:=Length:C16($_t_Line)
			If ($_l_LineLength>0)
				If ($_t_Line[[$_l_LineLength]]=" ")
					If (Length:C16($_t_Line)>1)
						$_t_Line:=Substring:C12($_t_Line; 1; ($_l_LineLength-1))
					Else 
						$_t_Line:=""
					End if 
				Else 
					$_bo_Exit:=True:C214
				End if 
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
	End if 
	If ($_bo_IgnoreBlankSpace)
		If ($_t_Line=Char:C90(13))
			$_t_Line:=""
		End if 
		If ($_t_Line=Char:C90(10))
			$_t_Line:=""
		End if 
	End if 
	
	APPEND TO ARRAY:C911($_ptr_Array->; $_t_Line)
Until ($_t_Text="")
ERR_MethodTrackerReturn("DB_TextToarray"; $_t_oldMethodName)