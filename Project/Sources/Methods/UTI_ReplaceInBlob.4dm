//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ReplaceInBlob
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
	C_BOOLEAN:C305($_bo_Match)
	C_LONGINT:C283($_l_AddBytes; $_l_FoundPosition; $_l_Index; $_l_LastCharposition; $_l_Position; $_l_ReplaceStringLen; $_l_SearchStringLen; $_l_StartPosition)
	C_POINTER:C301($_ptr_Blob; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_ReplaceString; $_t_SearchString; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ReplaceInBlob")
//LOG_SetMethod ("UTI_ReplaceInBlob")
//******************************************************************************
//Method: UTI_ReplaceInBlob
//
//Written by  John on 10/13/99, which must have been a real off day
//because it was riddled with bugs which he corrected
//6/17/2000

//Purpose: Replaces a string $1in a blob ($3->) with another string ($2)
//Implements the Boyer-Moore search algorithm, which is in most cases
//many times faster than a brute force method

//Returns -1 if string not found.

//NB THIS IS CASE SENSITIVE!
//$1 = string 255, search string (case sensitive)
//$2 = string 255, replace string
//$3  = pointer to blob to search in  `

If (Count parameters:C259>=3)
	$_t_SearchString:=$1
	$_t_ReplaceString:=$2
	$_ptr_Blob:=$3
	
	$_l_SearchStringLen:=Length:C16($_t_SearchString)
	$_l_ReplaceStringLen:=Length:C16($_t_ReplaceString)
	$_l_AddBytes:=$_l_ReplaceStringLen-$_l_SearchStringLen
	$_l_StartPosition:=0
	Repeat 
		$_l_FoundPosition:=UTI_FindInBlob($_t_SearchString; $_ptr_Blob; $_l_StartPosition)
		If ($_l_FoundPosition#-1)
			$_l_LastCharposition:=$_l_FoundPosition+$_l_SearchStringLen
			Case of 
				: ($_l_AddBytes>0)
					INSERT IN BLOB:C559($_ptr_Blob->; $_l_LastCharposition; $_l_AddBytes)
				: ($_l_AddBytes<0)
					DELETE FROM BLOB:C560($_ptr_Blob->; $_l_LastCharposition-Abs:C99($_l_AddBytes); Abs:C99($_l_AddBytes))
			End case 
			For ($_l_Index; 1; $_l_ReplaceStringLen)
				$_l_Position:=$_l_FoundPosition+$_l_Index-1
				$_ptr_Blob->{$_l_Position}:=Character code:C91($_t_ReplaceString[[$_l_Index]])
			End for 
			$_l_StartPosition:=$_l_FoundPosition+$_l_ReplaceStringLen
		End if 
	Until ($_l_FoundPosition=-1)
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_ReplaceInBlob"; $_t_oldMethodName)
