//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_VATReg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/05/2011 17:01 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoCheck; $_bo_Reject)
	C_LONGINT:C283($_l_FormatLength; $_l_FormatLength2; $_l_Index; $_l_InputTextLength; $_l_TestInputLength; $_l_ThisCharacterCode)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_CountryCode; $_t_FormatA; $_t_FormatB; $_t_FormatC; $_t_incomingRegistration; $_t_oldMethodName; $_t_outputMessage; $_t_ThisFormatCharacter; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_VATReg")

$_bo_NoCheck:=False:C215
If (($1->#"") & ($_t_incomingRegistration#""))
	$_t_CountryCode:=$1->
	$2->:=Uppercase:C13($2->)
	$_t_incomingRegistration:=$2->
	$_bo_Reject:=False:C215
	$_l_InputTextLength:=Length:C16($_t_incomingRegistration)
	$_l_TestInputLength:=0
	$_l_FormatLength:=0
	$_l_FormatLength2:=0
	$_t_FormatA:=""
	$_t_FormatB:=""
	$_t_FormatC:=""
	Case of 
		: ($_t_CountryCode="GB")
			$_l_FormatLength:=11
			$_l_FormatLength2:=9
			$_t_FormatA:="999 9999 99"
			$_t_FormatB:="999999999"
		: ($_t_CountryCode="AT")
			$_l_FormatLength:=9
			$_t_FormatA:="U99999999"
		: ($_t_CountryCode="BE")
			$_l_FormatLength:=9
			$_t_FormatA:="999999999"
		: ($_t_CountryCode="DK")
			$_l_FormatLength:=8
			$_t_FormatA:="99999999"
		: ($_t_CountryCode="FI")
			$_l_FormatLength:=8
			$_t_FormatA:="99999999"
		: ($_t_CountryCode="FR")
			$_l_FormatLength:=11
			$_t_FormatA:="99999999999"
		: ($_t_CountryCode="DE")
			$_l_FormatLength:=9
			$_t_FormatA:="999999999"
		: ($_t_CountryCode="EL")
			//$_l_FormatLength:=8
			//$_t_FormatA:="99999999"
			$_l_FormatLength:=9  //changed v631b126? - kmw 18/02/09
			$_t_FormatA:="099999999"  //changed v631b126? - kmw 18/02/09
		: ($_t_CountryCode="IE")
			$_l_FormatLength:=8
			$_t_FormatA:="9999999X"
			$_t_FormatB:="9X99999X"
		: ($_t_CountryCode="IT")
			$_l_FormatLength:=11
			$_t_FormatA:="99999999999"
		: ($_t_CountryCode="LU")
			$_l_FormatLength:=8
			$_t_FormatA:="99999999"
		: ($_t_CountryCode="NL")
			$_l_FormatLength:=12
			$_t_FormatA:="999999999B99"
		: ($_t_CountryCode="PT")
			$_l_FormatLength:=9
			$_t_FormatA:="999999999"
		: ($_t_CountryCode="ES")
			$_l_FormatLength:=9
			$_t_FormatA:="X99999999"
			$_t_FormatB:="99999999X"
			$_t_FormatC:="X9999999X"
		: ($_t_CountryCode="SE")
			$_l_FormatLength:=12
			$_t_FormatA:="999999999999"
		Else 
			$_bo_NoCheck:=True:C214
	End case 
	If (Not:C34($_bo_NoCheck))
		If ($_l_FormatLength2#0)
			$_l_TestInputLength:=$_l_InputTextLength
		End if 
		
		If (($_l_InputTextLength#$_l_FormatLength) & ($_l_TestInputLength#$_l_FormatLength2) & ($_l_FormatLength#0) & ($_t_FormatA#""))
			$_bo_Reject:=True:C214
		End if 
		
		If (Not:C34($_bo_Reject))
			
			For ($_l_Index; 1; Length:C16($_t_incomingRegistration))
				$_l_ThisCharacterCode:=Character code:C91(Substring:C12($_t_incomingRegistration; $_l_Index; 1))
				$_t_ThisFormatCharacter:=Substring:C12($_t_FormatA; $_l_Index; 1)
				Case of 
					: ($_t_ThisFormatCharacter="9")
						If (($_l_ThisCharacterCode<48) | ($_l_ThisCharacterCode>57))
							$_bo_Reject:=True:C214
						End if 
					: ($_t_ThisFormatCharacter="X")
						If (($_l_ThisCharacterCode<65) | ($_l_ThisCharacterCode>90))
							$_bo_Reject:=True:C214
						End if 
					Else 
						If ($_t_ThisFormatCharacter#Substring:C12($_t_incomingRegistration; $_l_Index; 1))
							$_bo_Reject:=True:C214
						End if 
				End case 
			End for 
			If (($_t_FormatB#"") & ($_bo_Reject))
				$_bo_Reject:=False:C215
				For ($_l_Index; 1; Length:C16($_t_incomingRegistration))
					$_l_ThisCharacterCode:=Character code:C91(Substring:C12($_t_incomingRegistration; $_l_Index; 1))
					$_t_ThisFormatCharacter:=Substring:C12($_t_FormatB; $_l_Index; 1)
					Case of 
						: ($_t_ThisFormatCharacter="9")
							If (($_l_ThisCharacterCode<48) | ($_l_ThisCharacterCode>57))
								$_bo_Reject:=True:C214
							End if 
						: ($_t_ThisFormatCharacter="X")
							If (($_l_ThisCharacterCode<65) | ($_l_ThisCharacterCode>90))
								$_bo_Reject:=True:C214
							End if 
						Else 
							If ($_t_ThisFormatCharacter#Substring:C12($_t_incomingRegistration; $_l_Index; 1))
								$_bo_Reject:=True:C214
							End if 
					End case 
				End for 
			End if 
			If (($_t_FormatC#"") & ($_bo_Reject))
				$_bo_Reject:=False:C215
				For ($_l_Index; 1; Length:C16($_t_incomingRegistration))
					$_l_ThisCharacterCode:=Character code:C91(Substring:C12($_t_incomingRegistration; $_l_Index; 1))
					$_t_ThisFormatCharacter:=Substring:C12($_t_FormatC; $_l_Index; 1)
					Case of 
						: ($_t_ThisFormatCharacter="9")
							If (($_l_ThisCharacterCode<48) | ($_l_ThisCharacterCode>57))
								$_bo_Reject:=True:C214
							End if 
						: ($_t_ThisFormatCharacter="X")
							If (($_l_ThisCharacterCode<65) | ($_l_ThisCharacterCode>90))
								$_bo_Reject:=True:C214
							End if 
						Else 
							If ($_t_ThisFormatCharacter#Substring:C12($_t_incomingRegistration; $_l_Index; 1))
								$_bo_Reject:=True:C214
							End if 
					End case 
				End for 
			End if 
		End if 
		
		If ($_bo_Reject)
			$_t_outputMessage:=String:C10($_l_FormatLength)+" Characters are required"+Char:C90(13)+"in the format "+$_t_FormatA
			If ($_t_FormatB#"")
				$_t_outputMessage:=$_t_outputMessage+Char:C90(13)+"or "+$_t_FormatB
			End if 
			If ($_t_FormatC#"")
				$_t_outputMessage:=$_t_outputMessage+Char:C90(13)+"or "+$_t_FormatC
			End if 
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("That VAT Registration format is incorrect: "+$_t_outputMessage; "Try again")
			End if 
			
			REJECT:C38($1->)
			OK:=0
		Else 
			OK:=1
		End if 
	Else 
		OK:=1
	End if 
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Check_VATReg"; $_t_oldMethodName)