//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Path_CheckLUDec
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
	C_LONGINT:C283($_l_Character; $_l_CharacterIndex; $_l_Length; $_l_SectionCharCode)
	C_TEXT:C284($_t_oldMethodName; $_t_Section; $_t_UnencryptedText; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckLUDec")
//Path_CheckLUDec - decode the contents

$_t_UnencryptedText:=""
$_l_CharacterIndex:=1
While ($_l_CharacterIndex<=Length:C16($1))
	IDLE:C311  // 7/04/03 pb
	$_l_SectionCharCode:=Character code:C91(Substring:C12($1; $_l_CharacterIndex; 1))
	If (($_l_SectionCharCode<48) | ($_l_SectionCharCode>57))
		If (($_l_SectionCharCode>96) & ($_l_SectionCharCode<123))
			$_t_UnencryptedText:=$_t_UnencryptedText+String:C10($_l_SectionCharCode-32)
		End if 
		If (($_l_SectionCharCode>64) & ($_l_SectionCharCode<91))
			$_t_UnencryptedText:=$_t_UnencryptedText+String:C10($_l_SectionCharCode-50)
		End if 
		If (($_l_SectionCharCode=47) | ($_l_SectionCharCode=92))
			$_t_UnencryptedText:=$_t_UnencryptedText+String:C10($_l_SectionCharCode)
		End if 
		If ($_l_SectionCharCode=45)
			$_t_UnencryptedText:=$_t_UnencryptedText+"00"
		End if 
	Else 
		$_t_UnencryptedText:=$_t_UnencryptedText+Substring:C12($1; $_l_CharacterIndex; 1)
	End if 
	$_l_CharacterIndex:=$_l_CharacterIndex+1
End while 

$_l_Character:=Num:C11(Substring:C12($_t_UnencryptedText; Length:C16($_t_UnencryptedText); 1))
$_t_UnencryptedText:=Substring:C12($_t_UnencryptedText; 1; Length:C16($_t_UnencryptedText)-1)
$0:=""
$_l_Length:=Length:C16($_t_UnencryptedText)
For ($_l_CharacterIndex; 1; $_l_Length)
	$_t_Section:=Substring:C12($_t_UnencryptedText; $_l_CharacterIndex; 1)
	$_l_SectionCharCode:=Num:C11($_t_Section)-$_l_Character
	If ($_l_SectionCharCode<0)
		$_l_SectionCharCode:=$_l_SectionCharCode+10
	End if 
	$0:=$0+String:C10($_l_SectionCharCode)
End for 

If ((Substring:C12($0; 1; 1)="7") & (Substring:C12($0; Length:C16($0); 1)="7"))
	$0:=Substring:C12($0; 2; Length:C16($0)-2)
	$_l_CharacterIndex:=1
	While ($_l_CharacterIndex<=Length:C16($0))
		IDLE:C311  // 7/04/03 pb
		$_t_Section:=Substring:C12($0; $_l_CharacterIndex; 2)
		If ((Length:C16($_t_Section))>1)
			$_l_SectionCharCode:=Num:C11($_t_Section)
			If (($_l_SectionCharCode>14) & ($_l_SectionCharCode<41) & ($_l_SectionCharCode#29) & ($_l_SectionCharCode#23))
				$0:=Substring:C12($0; 1; $_l_CharacterIndex-1)+Char:C90($_l_SectionCharCode+50)+Substring:C12($0; $_l_CharacterIndex+2; 32000)
			End if 
			If (($_l_SectionCharCode>64) & ($_l_SectionCharCode<91) & ($_l_SectionCharCode#79) & ($_l_SectionCharCode#76))
				$0:=Substring:C12($0; 1; $_l_CharacterIndex-1)+Char:C90($_l_SectionCharCode+32)+Substring:C12($0; $_l_CharacterIndex+2; 32000)
			End if 
			If (($_l_SectionCharCode=47) | ($_l_SectionCharCode=92))
				$0:=Substring:C12($0; 1; $_l_CharacterIndex-1)+Char:C90($_l_SectionCharCode)+Substring:C12($0; $_l_CharacterIndex+2; 32000)
			End if 
			If ($_l_SectionCharCode=0)
				$0:=Substring:C12($0; 1; $_l_CharacterIndex-1)+Char:C90(45)+Substring:C12($0; $_l_CharacterIndex+2; 32000)
			End if 
		End if 
		$_l_CharacterIndex:=$_l_CharacterIndex+1
	End while 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Path_CheckLUDec"; $_t_oldMethodName)
