//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_EncodeURL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:05`Method: CCM_EncodeURL
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SafeCharacters; 0)
	C_BOOLEAN:C305($_bo_IsSafe)
	C_LONGINT:C283($_l_Index; $_l_Length; $_l_ThisCharacterNumber)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $_t_ValidCharacters; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_EncodeURL")

// encodes umlauts, blanks and other special chars in an URL
// (PM) String_URLEncode
// Returns a URL encoded string
// $1 = String to encode
// $0 = Encoded string

If (Count parameters:C259>=1)
	$_t_Input:=$1
	
	//$_t_Input:=_O_Mac to ISO($_t_Input)
	
	// Fill an array with the characters which need no conversion
	$_t_ValidCharacters:="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:/.?=_-$(){}~&"
	$_l_Length:=Length:C16($_t_ValidCharacters)
	ARRAY LONGINT:C221($_al_SafeCharacters; $_l_Length)
	For ($_l_Index; 1; $_l_Length)
		$_al_SafeCharacters{$_l_Index}:=Character code:C91($_t_ValidCharacters[[$_l_Index]])
	End for 
	
	// Convert the characters
	$_l_Length:=Length:C16($_t_Input)
	For ($_l_Index; 1; $_l_Length)
		
		$_l_ThisCharacterNumber:=Character code:C91($_t_Input[[$_l_Index]])
		$_bo_IsSafe:=(Find in array:C230($_al_SafeCharacters; $_l_ThisCharacterNumber)#-1)
		
		Case of 
			: ($_bo_IsSafe)  // It's a safe character, append unaltered
				$_t_Output:=$_t_Output+Char:C90($_l_ThisCharacterNumber)
			: ($_l_ThisCharacterNumber=32)  // It's a space, append a plus sign
				$_t_Output:=$_t_Output+"+"
			Else   // It's an unsafe character, append as a hex string
				$_t_Output:=$_t_Output+"%"+Substring:C12(String:C10($_l_ThisCharacterNumber; "&x"); 5)
		End case 
		
		
	End for 
End if 
$0:=$_t_Output
ERR_MethodTrackerReturn("CCM_EncodeURL"; $_t_oldMethodName)