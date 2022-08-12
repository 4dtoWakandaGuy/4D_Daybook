//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LicenceModulesFromCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 12:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Option1; $_bo_Option2; $_bo_Option3)
	C_LONGINT:C283($_l_CharacterPosition; $_l_ModuleIndex; $_l_Number; $3)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_LicenceNumber; $_t_oldMethodName; $_t_ThisCharacter; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LicenceModulesFromCode")

If (Count parameters:C259>=3)
	$_t_LicenceNumber:=$1
	$_l_CharacterPosition:=1
	$_l_ModuleIndex:=1
	For ($_l_ModuleIndex; 1; $3; 3)
		If ($_l_ModuleIndex=37)
			$_l_ModuleIndex:=40
		End if 
		
		//While ($_l_ModuleIndex<(<>Mod_l_MaxModules))
		If ($_l_CharacterPosition<=Length:C16($_t_LicenceNumber))
			$_t_ThisCharacter:=Substring:C12($_t_LicenceNumber; $_l_CharacterPosition; 1)
			$_l_Number:=Num:C11($_t_ThisCharacter)
			$_bo_Option1:=($_l_Number=4) | ($_l_Number=5) | ($_l_Number=6) | ($_l_Number=7)
			$_bo_Option2:=($_l_Number=3) | ($_l_Number=4) | ($_l_Number=5) | ($_l_Number=8)
			$_bo_Option3:=($_l_Number=2) | ($_l_Number=3) | ($_l_Number=4) | ($_l_Number=7)
			$2->{$_l_ModuleIndex}:=(Num:C11($_bo_Option1))
			$2->{$_l_ModuleIndex+1}:=(Num:C11($_bo_Option2))
			$2->{$_l_ModuleIndex+2}:=(Num:C11($_bo_Option3))
			$_l_CharacterPosition:=$_l_CharacterPosition+1
		End if 
		//$_l_ModuleIndex:=$_l_ModuleIndex+3
		
		//End while
	End for 
	$2->{1}:=0
	If ($3>=30)
		$2->{30}:=0
	End if 
	If ($3>=37)
		$2->{37}:=1
	End if 
	If ($3>=38)
		$2->{38}:=1
	End if 
	If ($3>=39)
		$2->{39}:=1
	End if 
	If ($3>=Module_DiaryManager)
		$2->{Module_DiaryManager}:=1
	End if 
	If ($3>=Module_SalesLedger)
		$2->{Module_SalesLedger}:=1
	End if 
	If ($3>=Module_PurchaseLedger)
		$2->{Module_PurchaseLedger}:=1
	End if 
	If ($3>=Module_NominalLedger)
		$2->{Module_NominalLedger}:=1
	End if 
	If ($3>=Module_DataManager)
		$2->{Module_DataManager}:=1
	End if 
	If ($3>=Module_Companies)
		$2->{Module_Companies}:=1
	End if 
	If ($3>=Module_Products)
		$2->{Module_Products}:=1
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_LicenceModulesFromCode"; $_t_oldMethodName)