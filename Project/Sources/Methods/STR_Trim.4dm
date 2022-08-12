//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      STR_Trim
	//------------------ Method Notes ------------------
	//******************************************************************************
	////
	////  PM: STR_Trim( $_t_String; $_t_Code ) => $_t_String
	////
	////  Written by  Charlie Vass on Sunday, April 9, 2000 @ 2:22 PM
	////
	////  Purpose: Remove white space from one or both sides of a string
	////
	////  $1 - Text - Target string
	////  $2 - String - Action code, "L" for left, "R" for right, "B" for both
	////
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsSpace)
	C_LONGINT:C283($_l_CharacterCode; $_l_LastPosition; $_l_StringLength; $_l_StringLength2)
	C_TEXT:C284($_t_Code; $_t_oldMethodName; $_t_String; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_Trim")


$_t_String:=$1
$_t_Code:=$2
$_l_StringLength:=Length:C16($_t_String)
If (($_l_StringLength>0) & (($_t_Code="R") | ($_t_Code="B")))
	$_l_LastPosition:=Length:C16($_t_String)
	$_bo_IsSpace:=False:C215
	Repeat 
		$_l_CharacterCode:=Character code:C91($_t_String[[$_l_StringLength]])
		$_bo_IsSpace:=(($_l_CharacterCode=Space:K15:42) | ($_l_CharacterCode=NBSP ASCII CODE:K15:43) | ($_l_CharacterCode=FF ASCII code:K15:13) | ($_l_CharacterCode=LF ASCII code:K15:11) | ($_l_CharacterCode=CR ASCII code:K15:14) | ($_l_CharacterCode=Tab:K15:37) | ($_l_CharacterCode=VT ASCII code:K15:12))
		$_l_StringLength:=$_l_StringLength-1
		If ($_bo_IsSpace)
			$_l_LastPosition:=$_l_StringLength
		End if 
	Until (Not:C34($_bo_IsSpace) | ($_l_StringLength=0))
	
	$_t_String:=Substring:C12($_t_String; 1; $_l_LastPosition)
End if 

If (($_l_StringLength>0) & (($_t_Code="L") | ($_t_Code="B")))
	$_l_LastPosition:=0
	$_bo_IsSpace:=False:C215
	$_l_StringLength2:=Length:C16($_t_String)
	$_l_StringLength:=0
	Repeat 
		$_l_StringLength:=$_l_StringLength+1
		$_l_CharacterCode:=Character code:C91($_t_String[[$_l_StringLength]])
		$_bo_IsSpace:=(($_l_CharacterCode=Space:K15:42) | ($_l_CharacterCode=NBSP ASCII CODE:K15:43) | ($_l_CharacterCode=FF ASCII code:K15:13) | ($_l_CharacterCode=LF ASCII code:K15:11) | ($_l_CharacterCode=CR ASCII code:K15:14) | ($_l_CharacterCode=Tab:K15:37) | ($_l_CharacterCode=VT ASCII code:K15:12))
		If ($_bo_IsSpace)
			$_l_LastPosition:=$_l_StringLength+1
		End if 
	Until (Not:C34($_bo_IsSpace) | ($_l_StringLength=$_l_StringLength2))
	
	$_t_String:=Substring:C12($_t_String; $_l_LastPosition)
	
End if 

$0:=$_t_String
ERR_MethodTrackerReturn("STR_Trim"; $_t_oldMethodName)
