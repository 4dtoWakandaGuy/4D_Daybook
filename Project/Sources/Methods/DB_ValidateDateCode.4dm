//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ValidateDateCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 00:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_noDate)
	C_DATE:C307($_d_StartDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283($_l_Index; $_l_SectionCharacter; $_t_NumberD; $_t_Numberd2; $_t_NumberM; $_t_NumberM2; $_t_NumbertR; $_t_NumberY; $_t_NumberY2)
	C_REAL:C285($_l_NumberT)
	C_TEXT:C284($_t_ld; $_t_ldR; $_t_LicenceString; $_t_NC3; $_t_NC4; $_t_Number1; $_t_Number2; $_t_Number3; $_t_Number4; $_t_NumberR; $_t_oldMethodName)
	C_TEXT:C284($_t_PN; $_t_s2; $_t_Substring; $_t_Title3; $_t_UppercaseNC1; $_t_UppercaseNC2; $1; $2; VTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ValidateDateCode")
If (Count parameters:C259>=1)
	$_t_Title3:=$1
Else 
	$_t_Title3:=VTitle3
End if 
If (Count parameters:C259>=2)
	$_t_LicenceString:=$2
Else 
	$_t_LicenceString:=[USER:15]Path Name:12
End if 



If (Substring:C12($_t_Title3; 1; 1)="*")
	$_bo_noDate:=True:C214
	$_t_Title3:=Substring:C12($_t_Title3; 2; 32000)
Else 
	$_bo_noDate:=False:C215
End if 

$_t_PN:=""
$_l_Index:=1
While ($_l_Index<=Length:C16($_t_Title3))
	IDLE:C311  // 03/04/03 pb
	$_l_SectionCharacter:=Character code:C91(Substring:C12($_t_Title3; $_l_Index; 1))
	If (($_l_SectionCharacter<48) | ($_l_SectionCharacter>57))
		If (($_l_SectionCharacter>96) & ($_l_SectionCharacter<123))
			$_t_PN:=$_t_PN+String:C10($_l_SectionCharacter-32)
		End if 
		If (($_l_SectionCharacter>64) & ($_l_SectionCharacter<91))
			$_t_PN:=$_t_PN+String:C10($_l_SectionCharacter-50)
		End if 
		If (($_l_SectionCharacter=47) | ($_l_SectionCharacter=92))
			$_t_PN:=$_t_PN+String:C10($_l_SectionCharacter)
		End if 
		If ($_l_SectionCharacter=45)
			$_t_PN:=$_t_PN+"00"
		End if 
	Else 
		$_t_PN:=$_t_PN+Substring:C12($_t_Title3; $_l_Index; 1)
	End if 
	$_l_Index:=$_l_Index+1
End while 

If ($_bo_noDate)
	$_t_Substring:=Substring:C12($_t_PN; 1; Length:C16($_t_PN)-3)
	$_l_NumberT:=Num:C11(Substring:C12($_t_PN; Length:C16($_t_PN)-2; 32000))
	$_t_ld:=Str_Divide($_t_Substring; String:C10($_l_NumberT))
	
	$_t_Number2:=Char:C90(Num:C11(Substring:C12($_t_ld; 1; 2)))
	$_t_Number1:=Char:C90(Num:C11(Substring:C12($_t_ld; Length:C16($_t_ld)-1; 2)))
	$_t_Substring:=Substring:C12($_t_ld; 3; Length:C16($_t_ld)-4)
	$_l_NumberT:=Abs:C99(Int:C8(Num:C11($_t_Substring)-98765))
	$_t_UppercaseNC1:=Uppercase:C13(Substring:C12($_t_LicenceString; 1; 1))
	$_t_UppercaseNC2:=Uppercase:C13(Substring:C12($_t_LicenceString; 2; 1))
	If (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & ($_l_NumberT>0))
		DB_d_ExpiryDateNEW:=Current date:C33(*)+$_l_NumberT
	End if 
Else 
	$_t_Substring:=Substring:C12($_t_PN; 1; Length:C16($_t_PN)-3)
	$_l_NumberT:=Num:C11(Substring:C12($_t_PN; Length:C16($_t_PN)-2; 32000))
	$_t_ld:=Str_Divide($_t_Substring; String:C10($_l_NumberT))
	
	$_t_Number1:=Char:C90(Num:C11(Substring:C12($_t_ld; 7; 2)))
	$_t_Number2:=Char:C90(Num:C11(Substring:C12($_t_ld; 1; 2)))
	$_t_NumberD:=Abs:C99(Num:C11(Substring:C12($_t_ld; 5; 2))-50)
	$_t_NumberM:=Abs:C99(Num:C11(Substring:C12($_t_ld; 9; 2))-30)
	$_t_NumberY:=Abs:C99(Num:C11(Substring:C12($_t_ld; 3; 2))-2050)
	//If ($_t_NumberY>2000)
	// $_t_NumberY:=$_t_NumberY-100
	//End if
	$_t_UppercaseNC1:=Uppercase:C13(Substring:C12($_t_LicenceString; 1; 1))
	$_t_UppercaseNC2:=Uppercase:C13(Substring:C12($_t_LicenceString; 2; 1))
	Case of 
		: (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & (Length:C16($_t_ld)=10) & ($_l_NumberT>9))
			DB_d_ExpiryDateNEW:=Date_FromNums($_t_NumberD; $_t_NumberM; $_t_NumberY)
		Else 
			$_t_s2:=Substring:C12($_t_PN; (Length:C16($_t_PN)/2)+1; Length:C16($_t_PN))
			$_t_Substring:=Substring:C12($_t_s2; 1; Length:C16($_t_s2)-3)
			$_l_NumberT:=Num:C11(Substring:C12($_t_s2; Length:C16($_t_s2)-2; 32000))
			$_t_ld:=Str_Divide($_t_Substring; String:C10($_l_NumberT))
			$_t_Number1:=Char:C90(Num:C11(Substring:C12($_t_ld; 7; 2)))
			$_t_Number2:=Char:C90(Num:C11(Substring:C12($_t_ld; 1; 2)))
			$_t_NumberD:=Abs:C99(Num:C11(Substring:C12($_t_ld; 5; 2))-50)
			$_t_NumberM:=Abs:C99(Num:C11(Substring:C12($_t_ld; 9; 2))-30)
			$_t_NumberY:=Abs:C99(Num:C11(Substring:C12($_t_ld; 3; 2))-2050)
			$_t_UppercaseNC1:=Uppercase:C13(Substring:C12($_t_LicenceString; 1; 1))
			$_t_UppercaseNC2:=Uppercase:C13(Substring:C12($_t_LicenceString; 2; 1))
			If (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & (Length:C16($_t_ld)=10) & ($_l_NumberT>9))
				DB_d_ExpiryDateNEW:=Date_FromNums($_t_NumberD; $_t_NumberM; $_t_NumberY)
				$_t_Number3:=Substring:C12($_t_PN; 1; (Length:C16($_t_PN)/2))
				$_t_NumberR:=Substring:C12($_t_Number3; 1; Length:C16($_t_Number3)-3)
				$_t_NumbertR:=Num:C11(Substring:C12($_t_Number3; Length:C16($_t_Number3)-2; 32000))
				$_t_ldR:=Str_Divide($_t_NumberR; String:C10($_t_NumbertR))
				$_t_Number3:=Char:C90(Num:C11(Substring:C12($_t_ldR; 7; 2)))
				$_t_Number4:=Char:C90(Num:C11(Substring:C12($_t_ldR; 1; 2)))
				$_t_Numberd2:=Abs:C99(Num:C11(Substring:C12($_t_ldR; 5; 2))-50)
				$_t_NumberM2:=Abs:C99(Num:C11(Substring:C12($_t_ldR; 9; 2))-30)
				$_t_NumberY2:=Abs:C99(Num:C11(Substring:C12($_t_ldR; 3; 2))-2050)
				$_t_NC3:=Uppercase:C13(Substring:C12($_t_LicenceString; 3; 1))
				$_t_NC4:=Uppercase:C13(Substring:C12($_t_LicenceString; 4; 1))
				If (($_t_NC3=$_t_Number3) & ($_t_NC3=$_t_Number3) & (Length:C16($_t_ldR)=10) & ($_t_NumbertR>9))
					$_d_StartDate:=Date_FromNums($_t_Numberd2; $_t_NumberM2; $_t_NumberY2)
					If ($_d_StartDate<(Current date:C33(*)-14))
						//no longer valid
						DB_d_ExpiryDateNEW:=!00-00-00!
					End if 
				End if 
			End if 
			
	End case 
	
End if 
ERR_MethodTrackerReturn("DB_ValidateDateCode"; $_t_oldMethodName)