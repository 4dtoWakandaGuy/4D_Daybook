//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_Test2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoDate; $_bo_ReadOnlyState)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StartDate)
	C_LONGINT:C283($_l_CharacterIndex; $_l_NumberD; $_l_NumberD2; $_l_NumberM; $_l_NumberM2; $_l_NumbertR; $_l_NumberY; $_l_NumberY2; $_l_SectionCharCode)
	C_REAL:C285($_t_TextT)
	C_TEXT:C284($_l_Divideld; $_t_DivideldR; $_t_Number1; $_t_Number2; $_t_Number3; $_t_Number4; $_t_oldMethodName; $_t_TextS; $_t_TextS2; $_t_TextS3; $_t_TextSR)
	C_TEXT:C284($_t_UnencryptedText; $_t_UppercaseNC1; $_t_UppercaseNC2; $_t_UpperCaseNC3; $_t_UpperCaseNC4; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_Test2")
//Date_Test2
//requires current writable User record
$_bo_ReadOnlyState:=Read only state:C362([USER:15])
If ($_bo_ReadOnlyState=True:C214)
	READ WRITE:C146([USER:15])
	LOAD RECORD:C52([USER:15])
End if 



If (Substring:C12($1; 1; 1)="*")
	$_bo_NoDate:=True:C214
	$1:=Substring:C12($1; 2; 32000)
Else 
	$_bo_NoDate:=False:C215
End if 

$_t_UnencryptedText:=""
$_l_CharacterIndex:=1
While ($_l_CharacterIndex<=Length:C16($1))
	IDLE:C311  // 03/04/03 pb
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

If ($_bo_NoDate)
	$_t_TextS:=Substring:C12($_t_UnencryptedText; 1; Length:C16($_t_UnencryptedText)-3)
	$_t_TextT:=Num:C11(Substring:C12($_t_UnencryptedText; Length:C16($_t_UnencryptedText)-2; 32000))
	$_l_Divideld:=Str_Divide($_t_TextS; String:C10($_t_TextT))
	
	$_t_Number2:=Char:C90(Num:C11(Substring:C12($_l_Divideld; 1; 2)))
	$_t_Number1:=Char:C90(Num:C11(Substring:C12($_l_Divideld; Length:C16($_l_Divideld)-1; 2)))
	$_t_TextS:=Substring:C12($_l_Divideld; 3; Length:C16($_l_Divideld)-4)
	$_t_TextT:=Abs:C99(Int:C8(Num:C11($_t_TextS)-98765))
	$_t_UppercaseNC1:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 1; 1))
	$_t_UppercaseNC2:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 2; 1))
	If (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & ($_t_TextT>0))
		[USER:15]Limit Date:58:=<>DB_d_CurrentDate+$_t_TextT
	End if 
Else 
	$_t_TextS:=Substring:C12($_t_UnencryptedText; 1; Length:C16($_t_UnencryptedText)-3)
	$_t_TextT:=Num:C11(Substring:C12($_t_UnencryptedText; Length:C16($_t_UnencryptedText)-2; 32000))
	$_l_Divideld:=Str_Divide($_t_TextS; String:C10($_t_TextT))
	
	$_t_Number1:=Char:C90(Num:C11(Substring:C12($_l_Divideld; 7; 2)))
	$_t_Number2:=Char:C90(Num:C11(Substring:C12($_l_Divideld; 1; 2)))
	$_l_NumberD:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 5; 2))-50)
	$_l_NumberM:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 9; 2))-30)
	$_l_NumberY:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 3; 2))-2050)
	//If ($_l_NumberY>2000)
	// $_l_NumberY:=$_l_NumberY-100
	//End if
	$_t_UppercaseNC1:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 1; 1))
	$_t_UppercaseNC2:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 2; 1))
	Case of 
		: (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & (Length:C16($_l_Divideld)=10) & ($_t_TextT>9))
			[USER:15]Limit Date:58:=Date_FromNums($_l_NumberD; $_l_NumberM; $_l_NumberY)
		Else 
			$_t_TextS2:=Substring:C12($_t_UnencryptedText; (Length:C16($_t_UnencryptedText)/2)+1; Length:C16($_t_UnencryptedText))
			$_t_TextS:=Substring:C12($_t_TextS2; 1; Length:C16($_t_TextS2)-3)
			$_t_TextT:=Num:C11(Substring:C12($_t_TextS2; Length:C16($_t_TextS2)-2; 32000))
			$_l_Divideld:=Str_Divide($_t_TextS; String:C10($_t_TextT))
			$_t_Number1:=Char:C90(Num:C11(Substring:C12($_l_Divideld; 7; 2)))
			$_t_Number2:=Char:C90(Num:C11(Substring:C12($_l_Divideld; 1; 2)))
			$_l_NumberD:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 5; 2))-50)
			$_l_NumberM:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 9; 2))-30)
			$_l_NumberY:=Abs:C99(Num:C11(Substring:C12($_l_Divideld; 3; 2))-2050)
			$_t_UppercaseNC1:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 1; 1))
			$_t_UppercaseNC2:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 2; 1))
			If (($_t_UppercaseNC1=$_t_Number1) & ($_t_UppercaseNC2=$_t_Number2) & (Length:C16($_l_Divideld)=10) & ($_t_TextT>9))
				[USER:15]Limit Date:58:=Date_FromNums($_l_NumberD; $_l_NumberM; $_l_NumberY)
				$_t_TextS3:=Substring:C12($_t_UnencryptedText; 1; (Length:C16($_t_UnencryptedText)/2))
				$_t_TextSR:=Substring:C12($_t_TextS3; 1; Length:C16($_t_TextS3)-3)
				$_l_NumbertR:=Num:C11(Substring:C12($_t_TextS3; Length:C16($_t_TextS3)-2; 32000))
				$_t_DivideldR:=Str_Divide($_t_TextSR; String:C10($_l_NumbertR))
				$_t_Number3:=Char:C90(Num:C11(Substring:C12($_t_DivideldR; 7; 2)))
				$_t_Number4:=Char:C90(Num:C11(Substring:C12($_t_DivideldR; 1; 2)))
				$_l_NumberD2:=Abs:C99(Num:C11(Substring:C12($_t_DivideldR; 5; 2))-50)
				$_l_NumberM2:=Abs:C99(Num:C11(Substring:C12($_t_DivideldR; 9; 2))-30)
				$_l_NumberY2:=Abs:C99(Num:C11(Substring:C12($_t_DivideldR; 3; 2))-2050)
				$_t_UpperCaseNC3:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 3; 1))
				$_t_UpperCaseNC4:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 4; 1))
				If (($_t_UpperCaseNC3=$_t_Number3) & ($_t_UpperCaseNC3=$_t_Number3) & (Length:C16($_t_DivideldR)=10) & ($_l_NumbertR>9))
					$_d_StartDate:=Date_FromNums($_l_NumberD2; $_l_NumberM2; $_l_NumberY2)
					If ($_d_StartDate<Current date:C33(*)-14)
						//no longer valid
						[USER:15]Limit Date:58:=!00-00-00!
					End if 
				End if 
			End if 
			
	End case 
	
End if 
ERR_MethodTrackerReturn("Date_Test2"; $_t_oldMethodName)