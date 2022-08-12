//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LICENCECODETEST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 17:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccessType; 0)
	ARRAY TEXT:C222($_at_Version; 0)
	C_BOOLEAN:C305($_bo_OK; $_bo_VersionOK)
	C_DATE:C307(<>DB_d_CurrentDate; <>SYS_d_InceptionDate)
	C_LONGINT:C283(<>LIC_l_Seed; <>Mod_l_MaxModules; $_l_CRMModule; $_l_DMModule; $_l_DModule; $_l_IMUsers; $_l_LicenceLength; $_l_LicenceNumeric; $_l_MajorVersion; $_l_MaxUsers; $_l_ModuleChar)
	C_LONGINT:C283($_l_ModuleRow; $_l_NLModule; $_l_OrganisationNUM; $_l_PLModule; $_l_POModule; $_l_PRDModule; $_l_SCModule; $_l_SLModule; $_l_SOModule; $_l_SumNumber; $_l_ThisCharacter)
	C_LONGINT:C283($_l_VersionFactor; $_l_WPUsers)
	C_TEXT:C284(<>SYS_t_PathVersion; <>SYS_t_VersionNumber; $_t_CodeCharacter; $_t_Demo; $_t_DivideString; $_t_HaveVersion; $_t_LicenceNumeric; $_t_LicenceReleased; $_t_LicenceString; $_t_LicenceVersion; $_t_oldMethodName)
	C_TEXT:C284($_t_OrganisationName; $_t_OrganisationNUM; $_t_OrganisationnumSTR; $_t_ReleaseVersion; $_t_Seed; $_t_ThisModule; $0; $1)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LICENCECODETEST")
If (Count parameters:C259>=1)
	$0:=""
End if 
//NG moved this to here(and maybe other places too
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 
//Path_Check
//see also Path_CheckLU - Licence Update
//& PathCheckSG - Silver/Gold split only


$_t_LicenceNumeric:=""
$_l_ModuleChar:=1


If (Count parameters:C259>=1)
	$_t_LicenceString:=$1
Else 
	$_t_LicenceString:=DB_GetLicenceString
End if 
$_l_LicenceLength:=Length:C16($_t_LicenceString)
//$_t_OrganisationnumSTR:=""
$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
$_t_OrganisationNUM:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
If (False:C215)
	$_t_OrganisationnumSTR:=Substring:C12($_t_LicenceNumeric; 4; 4)
	$_l_OrganisationNUM:=Num:C11($_t_OrganisationnumSTR)
	$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8; 99)
	
	$_t_OrganisationName:=DB_GetOrganisation
	$_l_SumNumber:=Character code:C91(Substring:C12($_t_OrganisationName; 1; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 2; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 3; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 4; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 5; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 6; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 7; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 8; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 9; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 10; 1))
	$_t_OrganisationnumSTR:=""
	If ($_l_OrganisationNUM>5000)
		$_l_OrganisationNUM:=$_l_OrganisationNUM-5000
		If ($_l_SumNumber#$_l_OrganisationNUM)
			$_t_OrganisationnumSTR:="No"
		End if 
	End if 
End if 
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)

$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
$_l_WPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)  //Num($_t_LicenceNumeric[[$_l_LicenceNumeric]]+$_t_LicenceNumeric[[$_l_LicenceNumeric+1]])
$_l_IMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)  //Num($_t_LicenceNumeric[[$_l_LicenceNumeric+2]]+$_t_LicenceNumeric[[$_l_LicenceNumeric+3]])

Case of 
	: ($_l_ThisCharacter=7)
		$_l_WPUsers:=$_l_WPUsers+99
	: ($_l_ThisCharacter=8)
		$_l_IMUsers:=$_l_IMUsers+99
	: ($_l_ThisCharacter=9)
		$_l_WPUsers:=$_l_WPUsers+99
		$_l_IMUsers:=$_l_IMUsers+99
End case 
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
//End if

$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))

$_l_VersionFactor:=Num:C11(Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter; 2))
$_t_CodeCharacter:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+2; Length:C16($_t_LicenceNumeric)-3-$_l_ThisCharacter-1)
$_l_MajorVersion:=Num:C11(Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2))
$_t_DivideString:=Str_Divide($_t_CodeCharacter; String:C10($_l_MajorVersion))
If ($_l_ThisCharacter>6)
	$_l_VersionFactor:=$_l_VersionFactor+99
End if 
$_l_MaxUsers:=$_l_VersionFactor
While (Semaphore:C143("$CheckingModules"))
	DelayTicks
End while 
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 
ARRAY LONGINT:C221($_al_ModuleAccessType; <>Mod_l_MaxModules)
$_l_ModuleRow:=(<>Mod_l_MaxModules-2)-6
$_al_ModuleAccessType{$_l_ModuleRow}:=1  //(37)
$_al_ModuleAccessType{$_l_ModuleRow+1}:=1  //38
$_al_ModuleAccessType{$_l_ModuleRow+2}:=1  //39

If ($_t_LicenceString="")
	Path_CheckSG
Else 
	
	//Type 4
	Case of 
		: (($_l_ThisCharacter>2) & ($_l_VersionFactor>0) & ($_l_VersionFactor<=99) & (Length:C16($_t_DivideString)=16) & ($_l_MajorVersion>99) & ($_l_MajorVersion<900) & ($_t_DivideString#"@9@"))
			$_bo_OK:=True:C214
		: (($_l_ThisCharacter>2) & ($_l_VersionFactor>0) & ($_l_VersionFactor<=99) & (Length:C16($_t_DivideString)=23) & ($_l_MajorVersion>99) & ($_l_MajorVersion<900) & ((Substring:C12($_t_DivideString; 1; 19))#"@9@"))
			$_t_ReleaseVersion:=Substring:C12($_t_DivideString; 17; 3)
			$_t_LicenceReleased:=Substring:C12(<>SYS_t_VersionNumber; 4; Length:C16(<>SYS_t_VersionNumber))
			If (Num:C11($_t_LicenceReleased)>=Num:C11($_t_ReleaseVersion))
				$_bo_OK:=True:C214
			Else 
				//long licence number for old version  !!!
				$_bo_OK:=False:C215
			End if 
		Else 
			$_bo_OK:=False:C215
	End case 
	If ($_bo_OK)
		$_t_LicenceVersion:=Substring:C12($_t_DivideString; 15; 1)+"."+Substring:C12($_t_DivideString; 16; 1)
		If (Length:C16($_t_DivideString)=23)
			$_t_ReleaseVersion:=Substring:C12($_t_DivideString; 17; 3)
			$_t_Seed:=Substring:C12($_t_DivideString; 20; 4)
			If ($_t_Seed)#String:C10(<>LIC_l_Seed; "0000")
				$_bo_OK:=False:C215
			End if 
		Else 
			//short licence number
			//is this being entered?
		End if 
		If ($_t_LicenceVersion=Substring:C12(<>SYS_t_VersionNumber; 1; 3)) & ($_bo_OK)
			If ($_t_OrganisationnumSTR="")
				$_l_ModuleChar:=1
				$_l_ModuleRow:=1
				While ($_l_ModuleRow<($_al_ModuleAccessType))
					IDLE:C311  // 7/04/03 pb
					$_t_ThisModule:=Substring:C12($_t_DivideString; $_l_ModuleChar; 1)
					Case of 
						: ($_t_ThisModule="1")
							$_al_ModuleAccessType{$_l_ModuleRow}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_ThisModule="2")
							$_al_ModuleAccessType{$_l_ModuleRow}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_ThisModule="3")
							$_al_ModuleAccessType{$_l_ModuleRow}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_ThisModule="4")
							$_al_ModuleAccessType{$_l_ModuleRow}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_ThisModule="5")
							$_al_ModuleAccessType{$_l_ModuleRow}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_ThisModule="6")
							$_al_ModuleAccessType{$_l_ModuleRow}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_ThisModule="7")
							$_al_ModuleAccessType{$_l_ModuleRow}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_ThisModule="8")
							$_al_ModuleAccessType{$_l_ModuleRow}:=0
							$_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							$_al_ModuleAccessType{$_l_ModuleRow+2}:=0
					End case 
					$_l_ModuleChar:=$_l_ModuleChar+1
					$_l_ModuleRow:=$_l_ModuleRow+3
					If ($_l_ModuleRow=37)
						$_l_ModuleRow:=40
					End if 
				End while 
				
				
			Else 
				Gen_Alert("Please ensure that the Organisation box exactly matches "+"the name on your Licence Form")
				$_t_LicenceString:=""
				//Path_CheckLUDel
			End if 
		Else 
			Gen_Alert("Your Licence No is not valid for the current version of Daybook")
			$_t_LicenceString:=""
			//Path_CheckLUDel
		End if 
	Else 
		$_t_LicenceString:=""
		//Path_CheckLUDel
	End if 
	//TRACE
	If (($_al_ModuleAccessType{1})=1)  //GOLD
		$_al_ModuleAccessType{1}:=5
		$_l_DModule:=Module_DiaryManager
		
		$_al_ModuleAccessType{$_l_DModule}:=1
		$_l_SLModule:=Module_SalesLedger
		
		$_al_ModuleAccessType{$_l_SLModule}:=1
		$_l_PLModule:=Module_PurchaseLedger
		
		
		$_al_ModuleAccessType{$_l_PLModule}:=1
		$_l_NLModule:=Module_NominalLedger
		
		$_al_ModuleAccessType{$_l_NLModule}:=1
		$_l_DMModule:=Module_DataManager
		
		$_al_ModuleAccessType{$_l_DMModule}:=1
		$_l_CRMModule:=Module_Companies
		
		$_al_ModuleAccessType{$_l_CRMModule}:=1
		$_l_PRDModule:=Module_Products
		
		$_al_ModuleAccessType{$_l_PRDModule}:=1
	End if 
	If (($_al_ModuleAccessType{30})=1)  //Silver PLS
		$_l_SOModule:=Module_SalesOrders
		
		$_al_ModuleAccessType{$_l_SOModule}:=1
		$_l_POModule:=Module_PurchaseOrders
		
		$_al_ModuleAccessType{$_l_POModule}:=1
		$_l_SCModule:=Module_StockControl
		
		$_al_ModuleAccessType{$_l_SCModule}:=1
	End if 
	
	If ($_t_LicenceString#"")  //Check the Silver/Gold split
		//See also Path_CheckDelTm
		ARRAY TEXT:C222($_at_Version; 1)
		LIST TO ARRAY:C288("Version"; $_at_Version)
		If (($_al_ModuleAccessType{34})>0)
			$_t_Demo:=" Demo"
		Else 
			$_t_Demo:=""
		End if 
		If (($_al_ModuleAccessType{1})=5)
			$_t_HaveVersion:="Silver"+$_t_Demo
		Else 
			$_t_HaveVersion:="Gold"+$_t_Demo
		End if 
		If ($_at_Version{1}#$_t_HaveVersion)
			
			Case of   //any old start numbers to identify Types
				: ($_t_HaveVersion="Silver")
					$_l_VersionFactor:=1273
				: ($_t_HaveVersion="Gold")
					$_l_VersionFactor:=3419
				: ($_t_HaveVersion="Silver Demo")
					$_l_VersionFactor:=7541
				: ($_t_HaveVersion="Gold Demo")
					$_l_VersionFactor:=5826
			End case 
			
			//See also Path_CheckSG
			$_l_MajorVersion:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
			$_t_LicenceNumeric:="M"+String:C10($_l_VersionFactor*$_l_MajorVersion)+".TMP"  //& multiply the 2 to make the file name to check
			ON ERR CALL:C155("Remote_Err")
			vDoc:=DB_OpenDocument($_t_LicenceNumeric)
			If (OK=1)
				$_bo_VersionOK:=True:C214
				CLOSE DOCUMENT:C267(vDoc)
				DELETE DOCUMENT:C159($_t_LicenceNumeric)
			Else 
				$_bo_VersionOK:=False:C215
			End if 
			ON ERR CALL:C155("")
			
			If ((User in group:C338(Current user:C182; "Designer")) | ($_bo_VersionOK))
				ARRAY TEXT:C222($_at_Version; 1)
				If ($_al_ModuleAccessType{1}=5)
					$_at_Version{1}:="Silver"+$_t_Demo
				Else 
					$_at_Version{1}:="Gold"+$_t_Demo
				End if 
				ARRAY TO LIST:C287($_at_Version; "Version")
			Else 
				If (($_al_ModuleAccessType{1})=5)
					If ($_at_Version{1}#"Silver@")
						If (Count parameters:C259=0)
							Gen_Alert("The Licence No specified is for Daybook Silver"+Char:C90(13)+"This version of Daybook is Gold only"; "Try again")
						End if 
						
					Else 
						If ($_at_Version{1}="Silver")
							Gen_Alert("A Demonstration Licence No cannot be used with a full access version of Daybook"; "Try again")
						Else 
							Gen_Alert("A full access Licence No cannot be used with a Demonstration version of Daybook"; "Try again")
						End if 
					End if 
					$_t_LicenceString:=""
				Else 
					If ($_at_Version{1}#"Gold@")
						Gen_Alert("The current Licence No is for Daybook Gold"+Char:C90(13)+"This version of Daybook is Silver only"; "Try again")
					Else 
						If ($_at_Version{1}="Gold")
							Gen_Alert("A Demonstration Licence No cannot be used with a full access version of Daybook"; "Try again")
						Else 
							Gen_Alert("A full access Licence No cannot be used with a Demonstration version of Daybook"; "Try again")
						End if 
					End if 
					$_t_LicenceString:=""
				End if 
			End if 
		End if 
		<>SYS_t_PathVersion:=$_at_Version{1}
	Else 
		<>SYS_t_PathVersion:=""
	End if 
	
	If ($_t_LicenceString#"")  //check the Macintosh/Windows split
		
	End if 
	
	If ($_t_LicenceString#"")
		
	End if 
	
	If (<>SYS_d_InceptionDate=<>DB_d_CurrentDate)
		If ($_t_LicenceString#"")
			Path_CheckDelTm  //make sure the tmp file is deleted even if not used
		End if 
	End if 
End if 
$0:=$_t_LicenceString
CLEAR SEMAPHORE:C144("$CheckingModules")
ERR_MethodTrackerReturn("DB_LICENCECODETEST"; $_t_oldMethodName)
