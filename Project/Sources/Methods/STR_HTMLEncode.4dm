//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_HTMLEncode
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
	//ARRAY TEXT(<>HTML_at_Entities;0)
	C_LONGINT:C283($_l_CharacterPosition; $2; $codepoint; $i; $_l_Options)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $input; $output; $replacement; $string)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_HTMLEncode")

// (PM) STR_HTML_Encode
// $1 = Input text (encoded in MacRoman encoding if not in Unicode mode)
// $1 = Options (0 = full conversion, 1 (don't convert < and >)
// $0 = HTML encoded text


$input:=$1
If (Count parameters:C259>=2)
	$_l_Options:=$2
End if 
//
// Initialise the array with HTML entities
STR_InitHTMLEntities

// If not in Unicode mode, convert the text from  MacRoman to ISO encoding
//v11 `If (Get database parameter(Unicode mode)=0)
$input:=_O_Mac to ISO:C519($input)
//v11 `End if

// Replace the characters with their equivalent
For ($i; 1; Length:C16($input))
	
	$codepoint:=Character code:C91($input[[$i]])  //v11 `Character code
	//
	Case of 
		: (($codepoint=Tab:K15:37) | ($codepoint=Line feed:K15:40) | ($codepoint=Carriage return:K15:38))
			$replacement:=$input[[$i]]  //Char($codepoint)
		: (($codepoint<31) | ($codepoint>255))  // Non-printable characters or characters outside of the Latin 1 range
			$replacement:="&#"+String:C10($codepoint)+";"
		: (($_l_Options=1) & (($codepoint=60) | ($codepoint=62)))  // Do not convert < and >
			$replacement:=$input[[$i]]  //Char($codepoint)
		: ($codepoint=39)  //Rollo 2008-01-10 don't convert a single quote - to be like ITK
			$replacement:=$input[[$i]]  //Char($codepoint)
		: (($_l_Options=1) & ($codepoint=34))  //Rollo 2008-01-17 if option 1, don't convert a double quote - to be like ITK
			$replacement:=$input[[$i]]  //Char($codepoint)
			
		: (<>HTML_at_Entities{$codepoint}#"")
			If (($_l_Options=1) & ($codepoint=38))  //Rollo 2008-01-17 don't convert &nbsp; etc if option 1
				$string:=Substring:C12($input; $i; 8)
				$_l_CharacterPosition:=Position:C15(";"; $string)
				If ($_l_CharacterPosition>0)
					If (STR_HTMLDecodeCallback(Substring:C12($string; 1; $_l_CharacterPosition))#"")
						$replacement:=$input[[$i]]
					Else 
						$replacement:=<>HTML_at_Entities{$codepoint}
					End if 
				Else 
					$replacement:=<>HTML_at_Entities{$codepoint}
				End if 
			Else 
				$replacement:=<>HTML_at_Entities{$codepoint}
			End if 
			
		Else 
			$replacement:=$input[[$i]]  //Char($codepoint)
	End case 
	//
	$output:=$output+$replacement
	
End for 

$0:=$output
ERR_MethodTrackerReturn("STR_HTMLEncode"; $_t_oldMethodName)
