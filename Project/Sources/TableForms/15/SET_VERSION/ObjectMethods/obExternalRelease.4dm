If (False:C215)
	//object Name: [USER]SET_VERSION.obExternalRelease
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LIC_at_ReleaseTypes;0)
	C_LONGINT:C283($_l_LicenceLength; $_l_PositionChar; $_l_ReleaseNumber)
	C_TEXT:C284($_t_AfterCharacter; $_t_AfterCharacterString; $_t_BeforeCharacter; $_t_Character; $_t_oldMethodName; VER_t_CustomerLicenceVersion; VER_t_LicVerSection3; VER_t_LicVerSection4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SET_VERSION.obExternalRelease"; Form event code:C388)
If (LIC_at_ReleaseTypes#4)
	LIC_at_ReleaseTypes:=4
End if 
Gen_Confirm("Increment Structure build number for compile?"; "Yes"; "No")
If (OK=1)
	Gen_Confirm("Just the build or the version number"; "Build"; "Version")
	If (OK=0)
		VER_t_LicVerSection4:="000"
		$_l_ReleaseNumber:=Num:C11(VER_t_LicVerSection3)
		VER_t_LicVerSection3:=String:C10($_l_ReleaseNumber+1)
		
	Else 
		$_l_ReleaseNumber:=(Num:C11(VER_t_LicVerSection4))+1
		VER_t_LicVerSection4:=String:C10($_l_ReleaseNumber; "000")
	End if 
End if 

Gen_Confirm("Increment Licence version(customers will need new licence)"; "No"; "Yes")
If (OK=0)
	$_l_LicenceLength:=Length:C16(VER_t_CustomerLicenceVersion)
	If ($_l_LicenceLength>0)
		$_l_PositionChar:=0
		Repeat 
			$_t_Character:=VER_t_CustomerLicenceVersion[[$_l_LicenceLength]]
			If ($_t_Character=".")
				$_l_PositionChar:=$_l_LicenceLength
			End if 
			$_l_LicenceLength:=$_l_LicenceLength-1
		Until ($_t_Character=".") | ($_l_LicenceLength=1)
		If ($_l_PositionChar>0)
			$_t_BeforeCharacter:=Substring:C12(VER_t_CustomerLicenceVersion; 1; $_l_PositionChar)
			$_t_AfterCharacter:=Substring:C12(VER_t_CustomerLicenceVersion; $_l_PositionChar; Length:C16(VER_t_CustomerLicenceVersion))
			$_l_ReleaseNumber:=Num:C11($_t_AfterCharacter)
			$_t_AfterCharacterString:=String:C10($_l_ReleaseNumber+1; "000")
			VER_t_CustomerLicenceVersion:=$_t_BeforeCharacter+$_t_AfterCharacterString
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SET_VERSION.obExternalRelease"; $_t_oldMethodName)
