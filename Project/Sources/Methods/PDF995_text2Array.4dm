//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_text2Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_cleanNullValues; $_bo_Match; $4)
	C_LONGINT:C283($_l_DelimiterCharacterIndex; $_l_DelimiterLength; $_l_ElementIndex; $_l_LastCopiedCharacterIndex; $_l_lastSourceCharToCheckMax; $_l_LineLength; $_l_LineStartIndex; $_l_SourceIndex; $_l_SourceLength)
	C_POINTER:C301($_ptr_Array; $2)
	C_TEXT:C284($_t_Delmiter; $_t_oldMethodName; $_t_Remainder; $_t_Source; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_text2Array")

If (False:C215)
	// TextParseIntoArray
	
	// This routine takes a text block, parses it into elements
	// and appends each element to a string or text array.
	// The delimiter is stripped out of the text by the parser.
	//
End if 





$_t_Source:=$1
$_ptr_Array:=$2
$_t_Delmiter:=$3

If (($_t_Source#"") & (Not:C34(Is nil pointer:C315($_ptr_Array))) & ($_t_Delmiter#""))
	
	If (Count parameters:C259>3)
		$_bo_cleanNullValues:=$4
	Else 
		$_bo_cleanNullValues:=False:C215
	End if 
	
	$_l_LineStartIndex:=1
	$_l_LineLength:=0
	
	$_l_SourceLength:=Length:C16($_t_Source)
	$_l_DelimiterLength:=Length:C16($_t_Delmiter)
	$_l_SourceIndex:=1
	$_l_lastSourceCharToCheckMax:=$_l_SourceLength-$_l_DelimiterLength+1
	$_l_ElementIndex:=Size of array:C274($_ptr_Array->)+1
	$_l_LastCopiedCharacterIndex:=0
	
	While ($_l_SourceIndex<=$_l_lastSourceCharToCheckMax)
		
		$_bo_Match:=True:C214
		
		For ($_l_DelimiterCharacterIndex; 1; $_l_DelimiterLength)
			If ($_t_Source[[$_l_SourceIndex+$_l_DelimiterCharacterIndex-1]]#$_t_Delmiter[[$_l_DelimiterCharacterIndex]])
				$_bo_Match:=False:C215  // The pattern did not match perfectly.
			End if 
		End for 
		
		If ($_bo_Match)  // Jump over matching pattern. (Don't want to risk counting subparts twice.)
			
			$_l_LineLength:=$_l_SourceIndex-$_l_LineStartIndex
			
			INSERT IN ARRAY:C227($_ptr_Array->; $_l_ElementIndex; 1)
			$_ptr_Array->{$_l_ElementIndex}:=Substring:C12($_t_Source; $_l_LineStartIndex; $_l_LineLength)
			
			$_l_LastCopiedCharacterIndex:=$_l_LineStartIndex+$_l_LineLength-1
			$_l_ElementIndex:=$_l_ElementIndex+1
			$_l_SourceIndex:=$_l_SourceIndex+$_l_DelimiterLength
			$_l_LineStartIndex:=$_l_SourceIndex
			
		Else   // Check from next character in source.
			$_l_SourceIndex:=$_l_SourceIndex+1
		End if 
		
	End while   // ($_l_SourceIndex<$_l_lastSourceCharToCheckMax)
	
	// The text block may not end on a line break. If so, recover and save the
	// trailing text.
	$_t_Remainder:=""
	If ($_l_SourceLength>$_l_LastCopiedCharacterIndex)
		$_t_Remainder:=Substring:C12($_t_Source; $_l_LastCopiedCharacterIndex+1)
		$_t_Remainder:=Replace string:C233($_t_Remainder; $_t_Delmiter; "")
		INSERT IN ARRAY:C227($_ptr_Array->; $_l_ElementIndex; 1)
		$_ptr_Array->{$_l_ElementIndex}:=$_t_Remainder
	End if 
	
	If ($_bo_cleanNullValues)
		PDF995_clearEmptyElements($_ptr_Array)  //Get rid of empty strings  from array
		
	End if 
	
End if 
ERR_MethodTrackerReturn("PDF995_text2Array"; $_t_oldMethodName)
