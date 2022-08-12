//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_EncrFixed3
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
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterCode2; $_l_EnctyptedCharCode; $_l_index; $_l_LengthPosition; $_l_OutputLength; $_l_TextLength)
	C_TEXT:C284($_t_CheckText; $_t_EncryptedText2; $_t_EncyptedText; $_t_IncomingText; $_t_oldMethodName; $_t_OutputText; $_t_Prefix; $0; $1; $2; $t)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_EncrFixed3")
//IME_EncrFixed3
//Encrypts a string in a way that doesn't time out
//hence 'fixed'

//LOG_SetMethod ("IME_EncrFixed3")
//IME EncrFixed3

$_t_IncomingText:=$1

If (Count parameters:C259>1)
	$_t_Prefix:=$2
Else 
	$_t_Prefix:="*"
End if 

$_t_OutputText:=""

$_t_EncyptedText:=""
For ($_l_index; 1; 5)
	$_t_EncyptedText:=(($_t_EncyptedText)+(Char:C90(Random:C100%26+65)))
	
End for 

$_l_TextLength:=Length:C16($_t_IncomingText)
$_l_OutputLength:=Length:C16($_t_EncyptedText)
$_l_LengthPosition:=1
$_t_IncomingText:=Uppercase:C13($_t_IncomingText)

$t:=""
For ($_l_index; 1; $_l_TextLength)
	$_l_CharacterCode:=Character code:C91($_t_IncomingText[[$_l_index]])
	$_l_EnctyptedCharCode:=Character code:C91($_t_EncyptedText[[$_l_LengthPosition]])
	Case of 
		: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
			$_l_CharacterCode2:=$_l_CharacterCode
		: (($_l_CharacterCode>31) & ($_l_CharacterCode<58))
			$_l_CharacterCode2:=$_l_CharacterCode+($_l_EnctyptedCharCode-32)  //ie 26 asciis from 32 map to >=65
			If ($_l_CharacterCode2>90)
				$_l_CharacterCode2:=$_l_CharacterCode2-26
			End if 
		Else 
			$_l_CharacterCode2:=$_l_CharacterCode+($_l_EnctyptedCharCode-33)  //and 26 from 65 map to >=97
			If ($_l_CharacterCode2>122)
				$_l_CharacterCode2:=$_l_CharacterCode2-26
			End if 
	End case 
	$t:=$t+Char:C90($_l_CharacterCode2)
	$_l_LengthPosition:=$_l_LengthPosition+1
	If ($_l_LengthPosition>$_l_OutputLength)
		$_l_LengthPosition:=1
	End if 
End for 

If (Length:C16($t)<3)
	$_t_OutputText:=""
Else 
	$_t_OutputText:=$t[[1]]+$_t_EncyptedText[[1]]+$t[[2]]+Substring:C12($_t_EncyptedText; 2; 2)+$t[[3]]+Substring:C12($_t_EncyptedText; 4; 2)+Substring:C12($t; 4)
	
	$_l_TextLength:=Length:C16($_t_OutputText)  //now add up the characters as a checksum
	$_l_CharacterCode2:=0
	For ($_l_index; 1; $_l_TextLength)
		$_l_CharacterCode:=Character code:C91($_t_OutputText[[$_l_index]])
		Case of 
			: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
			: (($_l_CharacterCode>64) & ($_l_CharacterCode<91))
				$_l_CharacterCode2:=$_l_CharacterCode2+($_l_CharacterCode-64)  //ie 65 -> 1
			Else 
				$_l_CharacterCode2:=$_l_CharacterCode2+($_l_CharacterCode-70)  //ie 97 -> 27
		End case 
	End for 
	
	
	If ($_l_CharacterCode2<1000)
		$_l_CharacterCode2:=$_l_CharacterCode2*10
		If ($_l_CharacterCode2<1000)
			$_l_CharacterCode2:=$_l_CharacterCode2*10
			If ($_l_CharacterCode2<1000)
				$_l_CharacterCode2:=$_l_CharacterCode2*10
			End if 
		End if 
	End if 
	
	If (Length:C16(String:C10($_l_CharacterCode2))<4)
		$_t_OutputText:=""
	Else 
		$_t_EncryptedText2:=Substring:C12(String:C10($_l_CharacterCode2); 1; 4)  //convert the checksum to letters
		$_t_CheckText:=""
		For ($_l_index; 1; 4)
			$_t_CheckText:=$_t_CheckText+Char:C90((Num:C11($_t_EncryptedText2[[$_l_index]])*2)+65)
		End for 
		
		$_l_OutputLength:=Length:C16($_t_OutputText)
		If ($_l_OutputLength<4)
			$_t_OutputText:=""
		Else 
			$_t_OutputText:=$_t_Prefix+Substring:C12($_t_OutputText; 1; $_l_OutputLength-3)+$_t_CheckText[[4]]+$_t_OutputText[[$_l_OutputLength-2]]+$_t_CheckText[[3]]+$_t_OutputText[[$_l_OutputLength-1]]+$_t_CheckText[[2]]+$_t_OutputText[[$_l_OutputLength]]+$_t_CheckText[[1]]
			//WAS:
			//   $_t_OutputText:="*"+Substring($_t_OutputText;1;$_l_OutputLength-3)+$_t_CheckText[[4]]+Substring($_t_OutputText;$_l_OutputLength-2
			//~;1)+$_t_CheckText[[3]]+$_t_OutputText[[$_l_OutputLength-1]]+$_t_CheckText[[2]]+$_t_OutputText[[$_l_OutputLength]]+$_t_CheckText[[1]]
		End if 
	End if 
End if 

$0:=$_t_OutputText

//LOG_ResetMethod
ERR_MethodTrackerReturn("IME_EncrFixed3"; $_t_oldMethodName)