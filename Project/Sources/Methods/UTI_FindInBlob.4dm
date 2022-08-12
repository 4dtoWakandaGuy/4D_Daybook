//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_FindInBlob
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
	C_BLOB:C604($_blb_SkipTable; $4)
	C_BOOLEAN:C305($_bo_EndText; $_bo_Match)
	C_LONGINT:C283($_l_Error; $_l_LastByteIndex; $_l_NumToSkip; $_l_Parameters; $_l_Position; $_l_SearchIndex; $_l_SearchPosition; $_l_SearchStringLength; $_l_SourceLength; $_l_SourcePosition; $_l_Start)
	C_LONGINT:C283($0; $3)
	C_POINTER:C301($_ptr_Blob; $2)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_SearchString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_FindInBlob")
//LOG_SetMethod ("UTI_FindInBlob")
//******************************************************************************
//Method: UTI_FindInBlob
//
//Written by  John on 12/20/98
//Adapted (to work with binaries) and condensed from original code by John Macrae.

//Major, unbelievable crippling bug fixed by John, 6/15/2000 -
//the answer was wrong EVERY TIME, out by one!!!

//Purpose: Returns position of first instance of a string within a BLOb
//Implements the Boyer-Moore search algorithm, which is in most cases
//many times faster than a brute force method

//Returns -1 if string not found.

//NB THIS IS CASE SENSITIVE!
//$1 = string 255, search string (case sensitive)
//$2 = pointer to blob to search in
//$3 (optional) = longint, start point in BLob
//$4 (optional) = blob, skip table. (If doing repeated searches for same string,
//it will be faster to build the skip table first and pass it each time)

//$0 = longint, position of first occurrence of string

//******************************************************************************


// ****************
// ****************
$_l_Parameters:=Count parameters:C259
$_t_SearchString:=$1
$_ptr_Blob:=$2
If ($_l_Parameters>=3)
	$_l_Start:=$3
	If ($_l_Parameters=4)
		$_blb_SkipTable:=$4
	Else 
		$_blb_SkipTable:=UTI_BuildBMSkipTable($_t_SearchString)
	End if 
Else 
	$_l_Start:=0
	$_blb_SkipTable:=UTI_BuildBMSkipTable($_t_SearchString)
End if 


$_l_SearchStringLength:=Length:C16($_t_SearchString)  //Length of Word
$_l_SourceLength:=BLOB size:C605($_ptr_Blob->)  //Length of source blob
$_l_LastByteIndex:=$_l_SourceLength-1  //Index of last byte in blob
$_bo_Match:=False:C215
$_l_Error:=0

Case of   //Check that parameters are legal.
	: ($_l_SourceLength=0)  //Source text is empty.
		$_l_Error:=-1
	: ($_t_SearchString="")  //Search string is empty.
		$_l_Error:=-2
	: ($_l_SearchStringLength>$_l_SourceLength)  //Search Key is longer than the text to be searched.
		$_l_Error:=-5
	: ($_l_SearchStringLength>255)  //Search key is too long.
		$_l_Error:=-6
	Else 
		If ($_l_Start>$_l_LastByteIndex)  //Start point is beyond end of blob
			$_l_Error:=-4
		End if 
End case 

If ($_l_Error=0)  //no error occured
	$_bo_EndText:=False:C215
	$_l_NumToSkip:=0
	//First position string could occur in is at the beginning (in relation
	//to the start position, anyway), in which case the end of the string
	//would be found stringlength bytes on from the start position, inclusive
	//of the start index. E.g., we should start looking for a 4 byte string  at an
	//index (start+stringlength-1) into the blob
	
	$_l_SourcePosition:=$_l_Start+$_l_SearchStringLength-1  // n.b, blob is indexed from 0
	$_l_SearchPosition:=$_l_SearchStringLength  //the index of the last byte in the string (indexed from 1)
	
	Repeat 
		If ($_l_SourcePosition>$_l_LastByteIndex)
			$_bo_EndText:=True:C214  //We've got to the end
		Else 
			$_bo_Match:=($_ptr_Blob->{$_l_SourcePosition})=(Character code:C91($_t_SearchString[[$_l_SearchPosition]]))  // compare the ascii codes
			If ($_bo_Match)  //If there was a match
				$_l_SourcePosition:=$_l_SourcePosition-1  //try the previous byte in the blob
				$_l_SearchPosition:=$_l_SearchPosition-1  //and the previous character in the search string
			Else   //no match - goto the next position to search
				If (($_l_SearchStringLength-$_l_SearchPosition+1)>($_blb_SkipTable{$_ptr_Blob->{$_l_SourcePosition}}))
					$_l_NumToSkip:=($_l_SearchStringLength-$_l_SearchPosition)+1
					$_l_SourcePosition:=$_l_SourcePosition+$_l_NumToSkip
				Else 
					$_l_NumToSkip:=$_blb_SkipTable{$_ptr_Blob->{$_l_SourcePosition}}
					$_l_SourcePosition:=$_l_SourcePosition+$_l_NumToSkip
				End if 
				$_l_SearchPosition:=$_l_SearchStringLength
			End if 
		End if 
	Until (($_l_SearchPosition<1) | ($_bo_EndText))
	If ($_bo_Match)
		//Bug fixed by John, 6/15/2000 - was always reading one short
		//$0:=$_l_SourcePosition
		$0:=$_l_SourcePosition+1
	Else 
		$0:=-1
	End if 
Else 
	$0:=-1
	//we could do something useful with the error here if we wanted to...
End if 






//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_FindInBlob"; $_t_oldMethodName)
