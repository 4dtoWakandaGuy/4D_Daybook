//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_BuildBMSkipTable
	//------------------ Method Notes ------------------
	//LOG_SetMethod ("UTI_BuildBMSkipTable")
	//******************************************************************************
	//
	//Method: UTI_BuildBMSkipTable
	//
	//Written by  John on 12/21/98
	//
	//Purpose: Auxiliary function for Boyer-Moore search routine UTI_FindInBlob
	//
	//$1 - search string (255)
	//$0 - Blob, skip table
	
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_SkipTable; $0)
	C_LONGINT:C283($_l_CharPosition; $_l_SearchIndex; $_l_SearchStringLength)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchString; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_BuildBMSkipTable")


If (Count parameters:C259>=1)
	$_t_SearchString:=$1
	$_l_SearchStringLength:=Length:C16($_t_SearchString)
	// Fill entire skip table with length of search string
	
	SET BLOB SIZE:C606($_blb_SkipTable; 256; $_l_SearchStringLength)
	// NOTE: The search string may contain duplicate characters.
	// By examining the search string from left to right
	// the rightmost occurrence of a character is the one
	// which sets the final value in the skip table.
	For ($_l_SearchIndex; 1; $_l_SearchStringLength)  // examine each character in search string
		$_l_CharPosition:=Character code:C91($_t_SearchString[[$_l_SearchIndex]])  //find position reserved for this character
		$_blb_SkipTable{$_l_CharPosition}:=$_l_SearchStringLength-$_l_SearchIndex  //place skip value in skip table
	End for 
	
	$0:=$_blb_SkipTable
Else 
	$0:=$_blb_SkipTable
	
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_BuildBMSkipTable"; $_t_oldMethodName)
