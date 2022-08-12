//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_URLEncode
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
	ARRAY LONGINT:C221($_al_SafeCharacters; 0)
	C_BOOLEAN:C305($_bo_isSafe)
	C_LONGINT:C283($_l_CharacterCode; $_l_Length; $_l_PositionIndex)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $_t_ValidCharacters; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_URLEncode")

// (PM) STR_URLEncode
// Returns a URL encoded string
// $1 = String to encode
// $0 = Encoded string


$_t_Input:=$1

$_t_Input:=_O_Mac to ISO:C519($_t_Input)

// Fill an array with the characters which need no conversion
$_t_ValidCharacters:="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:/.?=_-$(){}~&"
$_l_Length:=Length:C16($_t_ValidCharacters)
ARRAY LONGINT:C221($_al_SafeCharacters; $_l_Length)
For ($_l_PositionIndex; 1; $_l_Length)
	$_al_SafeCharacters{$_l_PositionIndex}:=Character code:C91($_t_ValidCharacters[[$_l_PositionIndex]])  //v11 Character code
End for 

// Convert the characters
$_l_Length:=Length:C16($_t_Input)
For ($_l_PositionIndex; 1; $_l_Length)
	
	$_l_CharacterCode:=Character code:C91($_t_Input[[$_l_PositionIndex]])  //v11 `Character code($_t_Input≤$_l_PositionIndex≥)
	$_bo_isSafe:=(Find in array:C230($_al_SafeCharacters; $_l_CharacterCode)#-1)
	
	Case of 
		: ($_bo_isSafe)  // It's a safe character, append unaltered
			$_t_Output:=$_t_Output+Char:C90($_l_CharacterCode)
		: ($_l_CharacterCode=32)  // It's a space, append a plus sign
			$_t_Output:=$_t_Output+"+"
		Else   // It's an unsafe character, append as a hex string
			$_t_Output:=$_t_Output+"%"+Substring:C12(String:C10($_l_CharacterCode; "&x"); 5)
	End case 
	
	
End for 

$0:=$_t_Output
ERR_MethodTrackerReturn("STR_URLEncode"; $_t_oldMethodName)
