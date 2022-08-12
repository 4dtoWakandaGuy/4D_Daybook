//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_Decrypt2
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
	C_BOOLEAN:C305($_bo_Fail)
	C_LONGINT:C283(<>iHours; $_l_CharacterCode; $_l_CharacterCode2; $_l_EncryptChar; $_l_EncryptPosition; $_l_index; $_l_OutputLength; $_l_TextLength)
	C_REAL:C285($2; $3; $4)
	C_TEXT:C284(<>iEncrypt; $_t_Check; $_t_Check2; $_t_Encrypt2; $_t_oldMethodName; $_t_Unencrypted; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Decrypt2")
//IME_Decrypt2
If ($1="*@")
	$1:=Substring:C12($1; 2; 32000)
End if 
If ((<>iEncrypt="") | ($1=""))
	$0:=$1
Else 
	
	$_l_OutputLength:=Length:C16($1)
	If ($_l_OutputLength<9)
		$0:="Error1"
	Else 
		$_t_Check:=Substring:C12($1; $_l_OutputLength; 1)+Substring:C12($1; $_l_OutputLength-2; 1)+Substring:C12($1; $_l_OutputLength-4; 1)+Substring:C12($1; $_l_OutputLength-6; 1)
		$1:=Substring:C12($1; 1; $_l_OutputLength-7)+Substring:C12($1; $_l_OutputLength-5; 1)+Substring:C12($1; $_l_OutputLength-3; 1)+Substring:C12($1; $_l_OutputLength-1; 1)
		
		$_l_TextLength:=Length:C16($1)  //now add up the characters as a checksum
		$_l_CharacterCode2:=0
		For ($_l_index; 1; $_l_TextLength)
			$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_index; 1))
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
		For ($_l_index; 1; 4)
			$_t_Check2:=$_t_Check2+Char:C90((Num:C11(Substring:C12($_t_Encrypt2; $_l_index; 1))*2)+65)
		End for 
		
		If ($_t_Check2#$_t_Check)
			$0:="Error1"
		Else 
			
			$_t_Encrypt2:=Substring:C12($1; 2; 1)+Substring:C12($1; 4; 2)+Substring:C12($1; 7; 2)
			$1:=Substring:C12($1; 1; 1)+Substring:C12($1; 3; 1)+Substring:C12($1; 6; 1)+Substring:C12($1; 9; 32000)
			$_l_CharacterCode:=Num:C11(Substring:C12(Time string:C180(Current time:C178); 1; 2))
			$_l_CharacterCode2:=Day number:C114(Current date:C33)
			$_l_index:=Character code:C91(Substring:C12($_t_Encrypt2; 2; 1))-65
			$_l_TextLength:=(Character code:C91(Substring:C12($_t_Encrypt2; 4; 1))-67)/2
			$_bo_Fail:=(($_l_TextLength#$_l_CharacterCode2) | ($_l_CharacterCode>($_l_index+<>iHours)) | ($_l_CharacterCode<$_l_index))
			If ($_bo_Fail)
				$_l_CharacterCode:=$_l_CharacterCode+24
				$_l_TextLength:=$_l_TextLength+1-(7*Num:C11($_l_TextLength=7))
				$_bo_Fail:=(($_l_TextLength#$_l_CharacterCode2) | ($_l_CharacterCode>($_l_index+<>iHours)) | ($_l_CharacterCode<$_l_index))
			End if 
			If ($_bo_Fail)
				$0:="Error1"
			Else 
				
				$_l_TextLength:=Length:C16($1)
				$_l_OutputLength:=Length:C16($_t_Encrypt2)
				$_l_EncryptPosition:=1
				
				$_t_Unencrypted:=""
				For ($_l_index; 1; $_l_TextLength)
					$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_index; 1))
					$_l_EncryptChar:=Character code:C91(Substring:C12($_t_Encrypt2; $_l_EncryptPosition; 1))
					Case of 
						: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
							$_l_CharacterCode2:=$_l_CharacterCode
						: ($_l_CharacterCode>96)
							$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptChar-33)  //ie 26 asciis from 97 map to >=65
							If ($_l_CharacterCode2<65)
								$_l_CharacterCode2:=$_l_CharacterCode2+26
							End if 
						Else 
							$_l_CharacterCode2:=$_l_CharacterCode+($_l_EncryptChar-33)  //and 26 from 65 map to >=97
							If ($_l_CharacterCode2>122)
								$_l_CharacterCode2:=$_l_CharacterCode2-26
							End if 
							If ($_l_CharacterCode2<97)
								$_l_CharacterCode2:=$_l_CharacterCode2+26
							End if 
					End case 
					$_t_Unencrypted:=$_t_Unencrypted+Char:C90($_l_CharacterCode2)
					$_l_EncryptPosition:=$_l_EncryptPosition+1
					If ($_l_EncryptPosition>$_l_OutputLength)
						$_l_EncryptPosition:=1
					End if 
				End for 
				
				$_l_TextLength:=Length:C16($_t_Unencrypted)
				$_l_OutputLength:=Length:C16(<>iEncrypt)
				$_l_EncryptPosition:=1
				
				$0:=""
				For ($_l_index; 1; $_l_TextLength)
					$_l_CharacterCode:=Character code:C91(Substring:C12($_t_Unencrypted; $_l_index; 1))
					$_l_EncryptChar:=Character code:C91(Substring:C12(<>iEncrypt; $_l_EncryptPosition; 1))
					Case of 
						: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
							$_l_CharacterCode2:=$_l_CharacterCode
						: ($_l_CharacterCode<91)
							$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptChar-32)  //ie 26 asciis from 32 map to >=65
							If ($_l_CharacterCode2<32)
								$_l_CharacterCode2:=$_l_CharacterCode2+26
							End if 
						Else 
							$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptChar-33)  //and 26 from 65 map to >=97
							If ($_l_CharacterCode2<65)
								$_l_CharacterCode2:=$_l_CharacterCode2+26
							End if 
					End case 
					$0:=$0+Char:C90($_l_CharacterCode2)
					$_l_EncryptPosition:=$_l_EncryptPosition+1
					If ($_l_EncryptPosition>$_l_OutputLength)
						$_l_EncryptPosition:=1
					End if 
				End for 
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("IME_Decrypt2"; $_t_oldMethodName)