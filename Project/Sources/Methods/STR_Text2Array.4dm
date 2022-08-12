//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_Text2Array
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
	C_LONGINT:C283($_l_CharacterPosition)
	C_POINTER:C301($_ptr_Array; $2)
	C_TEXT:C284(<>STR_t_CR; $_t_Delimiter; $_t_oldMethodName; $_t_Text; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_Text2Array")
//******************************************************************************
//
//Method: STR_Text2Array
//
//Written by  John Moore on 11/6/98
//
//Purpose: Builds a text array from a block of text
//
//$1 = text field or variable
//$2 = pointer to text array
//[$3 = delimiter]

//******************************************************************************




$_t_Text:=$1
$_ptr_Array:=$2

If (Count parameters:C259=3)
	$_t_Delimiter:=$3
Else 
	$_t_Delimiter:=<>STR_t_CR
End if 

While (Length:C16($_t_Text)>0)
	$_l_CharacterPosition:=Position:C15($_t_Delimiter; $_t_Text)
	INSERT IN ARRAY:C227($_ptr_Array->; Size of array:C274($_ptr_Array->)+1)
	If ($_l_CharacterPosition>1)
		$_ptr_Array->{Size of array:C274($_ptr_Array->)}:=Substring:C12($_t_Text; 1; ($_l_CharacterPosition-1))
		$_t_Text:=Substring:C12($_t_Text; ($_l_CharacterPosition+Length:C16($_t_Delimiter)))
	Else 
		$_ptr_Array->{Size of array:C274($_ptr_Array->)}:=Substring:C12($_t_Text; 1)
		$_t_Text:=""
	End if 
End while 
ERR_MethodTrackerReturn("STR_Text2Array"; $_t_oldMethodName)
