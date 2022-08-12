//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Date Test
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 09:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoDate; $_bo_ReadOnlyState)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ABSChar3; $_l_ABSChar5; $_l_ABSChar9; $_l_Index; $_l_SectionCharCode)
	C_REAL:C285($_t_EncryptKey)
	C_TEXT:C284($_t_Char1; $_t_Char7; $_t_DividedText; $_t_oldMethodName; $_t_SUbnencryptedText; $_t_UnencryptedText; $_t_UppercaseC1; $_t_UppercaseC2; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date Test")
//Date Test

If (<>DB_d_CurrentDate>[USER:15]Limit Date:58)
	vText:="Daybook requires validation"+Char:C90(13)
	vText:=vText+"Call Daybook Group on 01296 399199 if unsure"
	Gen_Confirm(vText; "OK"; "Quit")
	If (OK=1)
		vText:=Gen_Request("Validation code:")
		If (OK=1)
			
			If (Substring:C12(vText; 1; 1)="*")
				$_bo_NoDate:=True:C214
				vText:=Substring:C12(vText; 2; 32000)
			Else 
				$_bo_NoDate:=False:C215
			End if 
			
			$_t_UnencryptedText:=""
			$_l_Index:=1
			While ($_l_Index<=Length:C16(vText))
				IDLE:C311  // 03/04/03 pb
				$_l_SectionCharCode:=Character code:C91(Substring:C12(vText; $_l_Index; 1))
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
					$_t_UnencryptedText:=$_t_UnencryptedText+Substring:C12(vText; $_l_Index; 1)
				End if 
				$_l_Index:=$_l_Index+1
			End while 
			
			If ($_bo_NoDate)
				$_t_SUbnencryptedText:=Substring:C12($_t_UnencryptedText; 1; Length:C16($_t_UnencryptedText)-3)
				$_t_EncryptKey:=Num:C11(Substring:C12($_t_UnencryptedText; Length:C16($_t_UnencryptedText)-2; 32000))
				$_t_DividedText:=Str_Divide($_t_SUbnencryptedText; String:C10($_t_EncryptKey))
				
				$_t_Char1:=Char:C90(Num:C11(Substring:C12($_t_DividedText; 1; 2)))
				$_t_Char7:=Char:C90(Num:C11(Substring:C12($_t_DividedText; Length:C16($_t_DividedText)-1; 2)))
				$_t_SUbnencryptedText:=Substring:C12($_t_DividedText; 3; Length:C16($_t_DividedText)-4)
				$_t_EncryptKey:=Abs:C99(Int:C8(Num:C11($_t_SUbnencryptedText)-98765))
				$_t_UppercaseC1:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 1; 1))
				$_t_UppercaseC2:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 2; 1))
				If (($_t_UppercaseC1=$_t_Char7) & ($_t_UppercaseC2=$_t_Char1) & ($_t_EncryptKey>0))
					$_bo_ReadOnlyState:=Read only state:C362([USER:15])
					If ($_bo_ReadOnlyState=True:C214)
						READ WRITE:C146([USER:15])
						LOAD RECORD:C52([USER:15])
					End if 
					
					[USER:15]Limit Date:58:=<>DB_d_CurrentDate+$_t_EncryptKey
					DB_SaveRecord(->[USER:15])
					Date Test
				Else 
					Date Test
				End if 
			Else 
				$_t_SUbnencryptedText:=Substring:C12($_t_UnencryptedText; 1; Length:C16($_t_UnencryptedText)-3)
				$_t_EncryptKey:=Num:C11(Substring:C12($_t_UnencryptedText; Length:C16($_t_UnencryptedText)-2; 32000))
				$_t_DividedText:=Str_Divide($_t_SUbnencryptedText; String:C10($_t_EncryptKey))
				
				$_t_Char7:=Char:C90(Num:C11(Substring:C12($_t_DividedText; 7; 2)))
				$_t_Char1:=Char:C90(Num:C11(Substring:C12($_t_DividedText; 1; 2)))
				$_l_ABSChar5:=Abs:C99(Num:C11(Substring:C12($_t_DividedText; 5; 2))-50)
				$_l_ABSChar9:=Abs:C99(Num:C11(Substring:C12($_t_DividedText; 9; 2))-30)
				$_l_ABSChar3:=Abs:C99(Num:C11(Substring:C12($_t_DividedText; 3; 2))-2050)
				//   If ($_l_ABSChar3>2000)`why was this here????
				//   $_l_ABSChar3:=$_l_ABSChar3-100
				// End if
				$_t_UppercaseC1:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 1; 1))
				$_t_UppercaseC2:=Uppercase:C13(Substring:C12([USER:15]Path Name:12; 2; 1))
				If (($_t_UppercaseC1=$_t_Char7) & ($_t_UppercaseC2=$_t_Char1) & (Length:C16($_t_DividedText)=10) & ($_t_EncryptKey>99))
					READ WRITE:C146([USER:15])
					LOAD RECORD:C52([USER:15])
					[USER:15]Limit Date:58:=Date_FromNums($_l_ABSChar5; $_l_ABSChar9; $_l_ABSChar3)
					DB_SaveRecord(->[USER:15])
					Date Test
				Else 
					Date Test
				End if 
			End if 
			
		Else 
			READ WRITE:C146([USER:15])
			LOAD RECORD:C52([USER:15])
			[USER:15]Path Name:12:=""
			[USER:15]Limit Date:58:=!00-00-00!
			DB_SaveRecord(->[USER:15])
			QUIT 4D:C291
		End if 
	Else 
		READ WRITE:C146([USER:15])
		LOAD RECORD:C52([USER:15])
		[USER:15]Path Name:12:=""
		[USER:15]Limit Date:58:=!00-00-00!
		DB_SaveRecord(->[USER:15])
		QUIT 4D:C291
	End if 
End if 
ERR_MethodTrackerReturn("Date Test"; $_t_oldMethodName)