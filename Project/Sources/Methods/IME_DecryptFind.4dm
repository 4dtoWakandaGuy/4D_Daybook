//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DecryptFind
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
	C_BOOLEAN:C305($_bo_isFixed)
	C_LONGINT:C283($_bo_NoPrefix; $_l_CacheUnusedChars; $_l_CountParameters; $_l_CurrentCharPosition; $_l_FixedPos; $_l_Index; $_l_Length; $_l_LengthLinkPrefix; $_l_NoBrowserID; $_l_position2; $_l_position3)
	C_LONGINT:C283($_l_PrefixLength; $_l_textposition; $2; $3)
	C_POINTER:C301($_ptr_CacheUnusedChars; $4)
	C_TEXT:C284(<>iEncrypt; <>IME_t_EncryptFixedForCachePref; <>QUOTE; $_t_CurrentChar; $_t_Input; $_t_LinkPrefix; $_t_oldMethodName; $0; $1; $5; $t)
	C_TEXT:C284(IME_t_AccessTempRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DecryptFind")
//IME_DecryptFind
If (<>QUOTE="")
	<>Quote:=Char:C90(34)
End if 

$_t_Input:=$1

$_l_CountParameters:=Count parameters:C259

If ($_l_CountParameters>3)
	$_ptr_CacheUnusedChars:=$4
	$_l_CacheUnusedChars:=$_ptr_CacheUnusedChars->
Else 
	$_l_CacheUnusedChars:=0
End if 
$_bo_isFixed:=False:C215
$_l_FixedPos:=0
$_l_PrefixLength:=1

If ($_l_CountParameters>1)
	$_bo_NoPrefix:=$2
Else 
	$_bo_NoPrefix:=0
End if 

If ($_l_CountParameters>2)
	$_l_NoBrowserID:=$3
Else 
	$_l_NoBrowserID:=0
End if 

If ($_l_CountParameters>4)
	$_t_LinkPrefix:=$5
Else 
	$_t_LinkPrefix:=""
End if 
$_l_LengthLinkPrefix:=Length:C16($_t_LinkPrefix)

If (<>iEncrypt="")
	If (IME_t_AccessTempRef#"")
		$_l_textposition:=Position:C15((<>Quote+IME_t_AccessTempRef+"&"); $_t_Input)
		If ($_l_textposition=0)
			$_l_textposition:=Position:C15(("'"+IME_t_AccessTempRef+"&"); $_t_Input)  //secondarily find by '*URL because ' may be used for JS parameters
		End if 
	End if 
	$_l_Length:=0
Else 
	//Rollo 8/28/2000 - removed ◊IME_t_CGI since we don't use it
	//  $_l_textposition:=Position(("'"+◊IME_t_CGI+"*");$_t_Input)
	$_l_textposition:=Position:C15(("'"+$_t_LinkPrefix+"*"); $_t_Input)
	If ($_l_textposition=0)
		//Rollo 8/28/2000 - removed ◊IME_t_CGI since we don't use it
		//$_l_textposition:=Position((◊Quote+◊IME_t_CGI+"*");$_t_Input)
		$_l_textposition:=Position:C15((<>Quote+$_t_LinkPrefix+"*"); $_t_Input)
	End if 
	
	//Rollo 2/1/2000
	//No! no need to decrypt Fixed things in the first case
	//$_l_FixedPos:=Position(("'"+◊IME_t_CGI+
	//◊IME_t_EncryptFixedForCachePref);$_t_Input)
	//If ($_l_FixedPos=0)
	//$_l_FixedPos:=Position((◊Quote+◊IME_t_CGI
	//+◊IME_t_EncryptFixedForCachePref);$_t_Input)
	//End if
	//If (($_l_FixedPos<$_l_textposition) & ($_l_FixedPos>0))
	//$_l_textposition:=$_l_FixedPos
	//$_bo_isFixed:=True
	//$_l_PrefixLength:=Length(◊IME_t_EncryptFixedForCachePref)
	//Else
	//$_bo_isFixed:=False
	//$_l_PrefixLength:=1
	//End if
	
	$_t_CurrentChar:=Substring:C12($_t_Input; $_l_textposition+$_l_LengthLinkPrefix+2; 1)
	$_l_CurrentCharPosition:=0
	
	While (($_l_textposition>0) & ($_l_CurrentCharPosition<1000) & (($_t_CurrentChar=",") | ($_t_CurrentChar=" ") | ($_t_CurrentChar="'") | ($_t_CurrentChar=<>Quote)) & ($_l_textposition<(Length:C16($_t_Input)-$_l_CacheUnusedChars)))
		
		$_t_Input:=Substring:C12($_t_Input; 1; $_l_textposition)+"xxx*xxx"+Substring:C12($_t_Input; $_l_textposition+$_l_LengthLinkPrefix+2)
		
		//Rollo 8/28/2000 - removed ◊IME_t_CGI since we don't use it
		//$_l_textposition:=Position(("'"+◊IME_t_CGI+"*");$_t_Input)
		$_l_textposition:=Position:C15(("'"+$_t_LinkPrefix+"*"); $_t_Input)
		If ($_l_textposition=0)
			//Rollo 8/28/2000 - removed ◊IME_t_CGI since we don't use it
			//$_l_textposition:=Position((◊Quote+◊IME_t_CGI+"*");$_t_Input)
			$_l_textposition:=Position:C15((<>Quote+$_t_LinkPrefix+"*"); $_t_Input)
		End if 
		
		$_t_CurrentChar:=Substring:C12($_t_Input; $_l_textposition+$_l_LengthLinkPrefix+2; 1)
		$_l_CurrentCharPosition:=$_l_CurrentCharPosition+1
	End while 
	
	//Rollo 8/28/2000 - removed ◊IME_t_CGI since we don't use it
	$_l_Length:=0  //Length(◊IME_t_CGI)
End if 
$_l_CurrentCharPosition:=0

While (($_l_textposition>0) & ($_l_CurrentCharPosition<1000) & ($_l_textposition<(Length:C16($_t_Input)-$_l_CacheUnusedChars)))
	$_l_Index:=$_l_textposition+$_l_PrefixLength+$_l_Length
	$t:=Substring:C12($_t_Input; $_l_Index)
	
	$_l_textposition:=Position:C15("'"; $t)  //because ' may be used for JS parameters
	$_l_position2:=Position:C15(<>Quote; $t)
	If (<>iEncrypt="")
		$_l_position3:=0
	Else 
		$_l_position3:=Position:C15("&"; $t)
	End if 
	If ((($_l_position2<$_l_textposition) | ($_l_textposition<1)) & ($_l_position2>0))  //whichever is found first takes precedence
		$_l_textposition:=$_l_position2
	End if 
	If (($_l_position3<$_l_textposition) & ($_l_position3>0))
		$_l_textposition:=$_l_position3
	End if 
	
	If ($_l_textposition>0)
		$_t_Input:=Substring:C12($_t_Input; 1; $_l_Index-1)+"$ENC$"+IME_Decrypt2(Substring:C12($t; 1+$_l_LengthLinkPrefix; $_l_textposition-1-$_l_LengthLinkPrefix); $_bo_NoPrefix; 0; $_l_NoBrowserID)+"$END$"+Substring:C12($_t_Input; $_l_Index+$_l_textposition-1)
	End if 
	
	If (<>iEncrypt="")
		If (IME_t_AccessTempRef#"")  //Rollo 2/1/2000
			$_l_textposition:=Position:C15((<>Quote+IME_t_AccessTempRef+"&"); $_t_Input)
			If ($_l_textposition=0)
				$_l_textposition:=Position:C15(("'"+IME_t_AccessTempRef+"&"); $_t_Input)
			End if 
		End if 
	Else 
		
		$_l_textposition:=Position:C15(("'"+$_t_LinkPrefix+"*"); $_t_Input)
		If ($_l_textposition=0)
			
			$_l_textposition:=Position:C15((<>Quote+$_t_LinkPrefix+"*"); $_t_Input)
		End if 
		
		
		$_t_CurrentChar:=Substring:C12($_t_Input; $_l_textposition+$_l_LengthLinkPrefix+2; 1)
		
		While (($_l_textposition>0) & ($_l_CurrentCharPosition<1000) & (($_t_CurrentChar=",") | ($_t_CurrentChar=" ") | ($_t_CurrentChar="'") | ($_t_CurrentChar=<>Quote)) & ($_l_textposition<(Length:C16($_t_Input)-$_l_CacheUnusedChars)))
			If (($_l_FixedPos>0) & ($_l_textposition=$_l_FixedPos))
				$_t_Input:=Substring:C12($_t_Input; 1; $_l_textposition)+"xxx"+<>IME_t_EncryptFixedForCachePref+"xxx"+Substring:C12($_t_Input; $_l_textposition+2)
			Else 
				$_t_Input:=Substring:C12($_t_Input; 1; $_l_textposition)+"xxx*xxx"+Substring:C12($_t_Input; $_l_textposition+2)
			End if 
			
			$_l_textposition:=Position:C15(("'"+$_t_LinkPrefix+"*"); $_t_Input)
			If ($_l_textposition=0)
				
				$_l_textposition:=Position:C15((<>Quote+$_t_LinkPrefix+"*"); $_t_Input)
			End if 
			
			$_t_CurrentChar:=Substring:C12($_t_Input; $_l_textposition+$_l_LengthLinkPrefix+2; 1)
			$_l_CurrentCharPosition:=$_l_CurrentCharPosition+1
		End while 
		
	End if 
	$_l_CurrentCharPosition:=$_l_CurrentCharPosition+1
End while 

$_t_Input:=Replace string:C233($_t_Input; "xxx*xxx"; "*")

If (Count parameters:C259>3)
	If ($_l_textposition>=(Length:C16($_t_Input)-$_l_CacheUnusedChars))
		$_l_CacheUnusedChars:=Length:C16($_t_Input)-$_l_textposition+1000
		If ($_l_CacheUnusedChars<0)
			$_l_CacheUnusedChars:=0
		End if 
	Else 
		$_l_CacheUnusedChars:=0
	End if 
	$_ptr_CacheUnusedChars->:=$_l_CacheUnusedChars
End if 

$0:=$_t_Input
ERR_MethodTrackerReturn("IME_DecryptFind"; $_t_oldMethodName)