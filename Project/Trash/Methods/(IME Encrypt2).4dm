//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_Encrypt2
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
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterCode2; $_l_EncryptChar; $_l_EncryptLength; $_l_EncryptPosition; $_l_Index; $_l_OutputLength)
	C_REAL:C285($2; $3; $4)
	C_TEXT:C284(<>iEncrypt; $_t_Check; $_t_Encrypt2; $_t_oldMethodName; $_t_Unencrypted; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Encrypt2")
//IME_Encrypt
If ((<>iEncrypt="") | ($1=""))
	$0:=$1
Else 
	
	If (<>iEncrypt="RANDOM")
		<>iEncrypt:=""
		$_l_OutputLength:=(Random:C100%6)+6  //ie bet 6 and 11
		For ($_l_Index; 1; $_l_OutputLength)
			<>iEncrypt:=<>iEncrypt+Char:C90((Random:C100%26)+65)
		End for 
	Else 
		<>iEncrypt:=Uppercase:C13(Str_AlphaOnly(<>iEncrypt))
	End if 
	
	$_l_OutputLength:=Length:C16($1)
	$_l_EncryptLength:=Length:C16(<>iEncrypt)
	$_l_EncryptPosition:=1
	$1:=Uppercase:C13($1)
	
	$_t_Unencrypted:=""
	For ($_l_Index; 1; $_l_OutputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_Index; 1))
		$_l_EncryptChar:=Character code:C91(Substring:C12(<>iEncrypt; $_l_EncryptPosition; 1))
		Case of 
			: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
				$_l_CharacterCode2:=$_l_CharacterCode
			: (($_l_CharacterCode>31) & ($_l_CharacterCode<58))
				$_l_CharacterCode2:=$_l_CharacterCode+($_l_EncryptChar-32)  //ie 26 asciis from 32 map to >=65
				If ($_l_CharacterCode2>90)
					$_l_CharacterCode2:=$_l_CharacterCode2-26
				End if 
			Else 
				$_l_CharacterCode2:=$_l_CharacterCode+($_l_EncryptChar-33)  //and 26 from 65 map to >=97
				If ($_l_CharacterCode2>122)
					$_l_CharacterCode2:=$_l_CharacterCode2-26
				End if 
		End case 
		$_t_Unencrypted:=$_t_Unencrypted+Char:C90($_l_CharacterCode2)
		$_l_EncryptPosition:=$_l_EncryptPosition+1
		If ($_l_EncryptPosition>$_l_EncryptLength)
			$_l_EncryptPosition:=1
		End if 
	End for 
	
	$_l_CharacterCode:=Num:C11(Substring:C12(Time string:C180(Current time:C178); 1; 2))  //ie will not work if not same 2-hour period
	$_l_CharacterCode2:=Day number:C114(Current date:C33)  //on the same day of the week
	$_t_Encrypt2:=""
	For ($_l_Index; 1; 3)
		$_t_Encrypt2:=$_t_Encrypt2+Char:C90((Random:C100%26)+65)
	End for 
	
	$_t_Encrypt2:=Substring:C12($_t_Encrypt2; 1; 1)+Char:C90(65+$_l_CharacterCode)+Substring:C12($_t_Encrypt2; 2; 1)+Char:C90(67+($_l_CharacterCode2*2))+Substring:C12($_t_Encrypt2; 3; 1)
	
	$_l_OutputLength:=Length:C16($_t_Unencrypted)
	$_l_EncryptLength:=Length:C16($_t_Encrypt2)
	$_l_EncryptPosition:=1
	
	$0:=""
	For ($_l_Index; 1; $_l_OutputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($_t_Unencrypted; $_l_Index; 1))
		$_l_EncryptChar:=Character code:C91(Substring:C12($_t_Encrypt2; $_l_EncryptPosition; 1))
		Case of 
			: (($_l_CharacterCode=36) | ($_l_CharacterCode=63) | ($_l_CharacterCode=47) | ($_l_CharacterCode=60) | ($_l_CharacterCode=61) | ($_l_CharacterCode=62) | ($_l_CharacterCode=35))  //don't translate $ / = > < # or ?
				$_l_CharacterCode2:=$_l_CharacterCode
			: (($_l_CharacterCode>64) & ($_l_CharacterCode<91))
				$_l_CharacterCode2:=$_l_CharacterCode+($_l_EncryptChar-33)  //ie 26 asciis from 65 map to >=97
				If ($_l_CharacterCode2>122)
					$_l_CharacterCode2:=$_l_CharacterCode2-26
				End if 
			Else 
				$_l_CharacterCode2:=$_l_CharacterCode-($_l_EncryptChar-33)  //and 26 from 97 map to >=65
				If ($_l_CharacterCode2<65)
					$_l_CharacterCode2:=$_l_CharacterCode2+26
				End if 
				If ($_l_CharacterCode2>90)
					$_l_CharacterCode2:=$_l_CharacterCode2-26
				End if 
		End case 
		$0:=$0+Char:C90($_l_CharacterCode2)
		$_l_EncryptPosition:=$_l_EncryptPosition+1
		If ($_l_EncryptPosition>$_l_EncryptLength)
			$_l_EncryptPosition:=1
		End if 
	End for 
	
	$0:=Substring:C12($0; 1; 1)+Substring:C12($_t_Encrypt2; 1; 1)+Substring:C12($0; 2; 1)+Substring:C12($_t_Encrypt2; 2; 2)+Substring:C12($0; 3; 1)+Substring:C12($_t_Encrypt2; 4; 2)+Substring:C12($0; 4; 32000)
	
	$_l_OutputLength:=Length:C16($0)  //now add up the characters as a checksum
	$_l_CharacterCode2:=0
	For ($_l_Index; 1; $_l_OutputLength)
		$_l_CharacterCode:=Character code:C91(Substring:C12($0; $_l_Index; 1))
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
	$_t_Check:=""
	For ($_l_Index; 1; 4)
		$_t_Check:=$_t_Check+Char:C90((Num:C11(Substring:C12($_t_Encrypt2; $_l_Index; 1))*2)+65)
	End for 
	
	$_l_EncryptLength:=Length:C16($0)
	$0:="*"+Substring:C12($0; 1; $_l_EncryptLength-3)+Substring:C12($_t_Check; 4; 1)+Substring:C12($0; $_l_EncryptLength-2; 1)+Substring:C12($_t_Check; 3; 1)+Substring:C12($0; $_l_EncryptLength-1; 1)+Substring:C12($_t_Check; 2; 1)+Substring:C12($0; $_l_EncryptLength; 1)+Substring:C12($_t_Check; 1; 1)
End if 
ERR_MethodTrackerReturn("IME_Encrypt2"; $_t_oldMethodName)