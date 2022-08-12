//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DecrFixed3
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
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterCode2; $_l_EncryptedCHarCode; $_l_EncryptPos; $_l_Index; $_l_InputLength; $_l_Textlength)
	C_TEXT:C284($_t_Check; $_t_Check2; $_t_Encrypt2; $_t_Input; $_t_oldMethodName; $_t_Output; $0; $1; $t)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DecrFixed3")
//LOG_SetMethod ("IME_DecrFixed3")
//IME DecrFixed3

$_t_Input:=$1
$_t_Output:=""

If ($_t_Input="*@")
	$_t_Input:=Substring:C12($_t_Input; 2)
End if 

$_l_Textlength:=Length:C16($_t_Input)
If ($_l_Textlength<9)
	$_t_Output:="Error1"
Else 
	$_t_Check:=$_t_Input[[$_l_Textlength]]+$_t_Input[[$_l_Textlength-2]]+$_t_Input[[$_l_Textlength-4]]+$_t_Input[[$_l_Textlength-6]]
	$_t_Input:=Substring:C12($_t_Input; 1; $_l_Textlength-7)+$_t_Input[[$_l_Textlength-5]]+$_t_Input[[$_l_Textlength-3]]+$_t_Input[[$_l_Textlength-1]]
	
	//was:
	// $_t_Check:=Substring($_t_Input;$_l_Textlength;1)+Substring($_t_Input;$_l_Textlength-2;1)
	//+Substring($_t_Input;$_l_Textlength-4;1)+Substring($_t_Input;$_l_Textlength-6;1)
	//$_t_Input:=Substring($_t_Input;1;$_l_Textlength-7)+Substring($_t_Input;$_l_Textlength-5;1)
	//+Substring($_t_Input;$_l_Textlength-3;1)+Substring($_t_Input;$_l_Textlength-1;1)
	
	$_l_InputLength:=Length:C16($_t_Input)  //now add up the characters as a checksum
	$_l_CharacterCode2:=0
	For ($_l_Index; 1; $_l_InputLength)
		$_l_CharacterCode:=Character code:C91($_t_Input[[$_l_Index]])
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
	
	$_t_Encrypt2:=Substring:C12(String:C10($_l_CharacterCode2); 1; 4)  //convert the checksum to letters
	$_t_Check2:=""
	For ($_l_Index; 1; 4)
		$_t_Check2:=$_t_Check2+Char:C90((Num:C11($_t_Encrypt2[[$_l_Index]])*2)+65)
	End for 
	
	If ($_t_Check2#$_t_Check)
		$_t_Output:="Error1"
	Else 
		
		If ($_l_InputLength>7)
			$_t_Encrypt2:=$_t_Input[[2]]+Substring:C12($_t_Input; 4; 2)+Substring:C12($_t_Input; 7; 2)
			$_t_Input:=$_t_Input[[1]]+$_t_Input[[3]]+$_t_Input[[6]]+Substring:C12($_t_Input; 9)
		Else 
			$_t_Encrypt2:=""
		End if 
		If (Length:C16($_t_Encrypt2)#5)
			$_t_Output:="Error1"
		Else 
			
			$t:=$_t_Input
			$_l_InputLength:=Length:C16($t)
			$_l_Textlength:=Length:C16($_t_Encrypt2)
			$_l_EncryptPos:=1
			
			$_t_Output:=""
			For ($_l_Index; 1; $_l_InputLength)
				$_l_CharacterCode:=Character code:C91($t[[$_l_Index]])
				$_l_EncryptedCHarCode:=Character code:C91($_t_Encrypt2[[$_l_EncryptPos]])
				Case of 
					: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
						$_l_CharacterCode2:=$_l_CharacterCode
					: ($_l_CharacterCode<91)
						$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptedCHarCode-32)  //ie 26 asciis from 32 map to >=65
						If ($_l_CharacterCode2<32)
							$_l_CharacterCode2:=$_l_CharacterCode2+26
						End if 
					Else 
						$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptedCHarCode-33)  //and 26 from 65 map to >=97
						If ($_l_CharacterCode2<65)
							$_l_CharacterCode2:=$_l_CharacterCode2+26
						End if 
				End case 
				$_t_Output:=$_t_Output+Char:C90($_l_CharacterCode2)
				$_l_EncryptPos:=$_l_EncryptPos+1
				If ($_l_EncryptPos>$_l_Textlength)
					$_l_EncryptPos:=1
				End if 
			End for 
			
		End if 
	End if 
End if 

$0:=$_t_Output

//LOG_ResetMethod
ERR_MethodTrackerReturn("IME_DecrFixed3"; $_t_oldMethodName)