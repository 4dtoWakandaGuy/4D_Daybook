//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Path Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	ARRAY TEXT:C222($_at_Licence; 0)
	ARRAY TEXT:C222($_at_Version; 0)
	C_BOOLEAN:C305($_bo_NewStyle; $_bo_OK; $_bo_VersionOK; $1; LR_bo_Enable)
	C_DATE:C307(<>DB_d_CurrentDate; <>SYS_d_InceptionDate)
	C_LONGINT:C283(<>ConIMUsers; <>ConWPUsers; <>LIC_l_Seed; <>Mod_l_MaxModules; <>SYS_l_MaxConnectedUsers; $_l_CRMModule; $_l_DMModule; $_l_DModule; $_l_Length; $_l_LicenceChar1; $_l_LicenceChar2)
	C_LONGINT:C283($_l_LicenceCharPosition; $_l_ModuleRow; $_l_NLModule; $_l_OrganisationSumCheck; $_l_OrganisationSumNUM; $_l_PLModule; $_l_POModule; $_l_PRDModule; $_l_SCModule; $_l_SizeofArrayLicence; $_l_SLModule)
	C_LONGINT:C283($_l_SOModule)
	C_POINTER:C301(LIC_ptr_LicenceTable)
	C_TEXT:C284(<>OLDPathName; <>PathName; <>SYS_t_PathVersion; <>SYS_t_VersionNumber; $_t_DecodedLicence; $_t_Demo; $_t_LicenceCharacter; $_t_LicenceNumeric; $_t_LicenceReleaseCheck; $_t_LicenceSeed; $_t_LicenceVersion)
	C_TEXT:C284($_t_oldMethodName; $_t_OrganisationName; $_t_OrganisationNumSTR; $_t_PathName; $_t_ReleaseVersion; $_t_UnDecodedLicence; $_t_VersionHave)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Path Check")
LR_Custom  //LR functionality -added 02/10/07, kmw (needs to be called before daybook specifc licensing check functionality)
//NG moved this to here(and maybe other places too
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 
//Path Check
//see also Path_CheckLU - Licence Update
//& PathCheckSG - Silver/Gold split only


$_t_LicenceNumeric:=""
$_l_LicenceCharPosition:=1

If (False:C215)  //changed to determine new or old style from a preference -  18/01/08 -kmw
	If (Count parameters:C259>=1)
		$_bo_NewStyle:=$1
	Else 
		$_bo_NewStyle:=False:C215
	End if 
End if 

$_bo_NewStyle:=LR_bo_Enable


$_l_Length:=Length:C16(<>PathName)
$_t_OrganisationNumSTR:=""
If (<>PathName#"")
	$_t_PathName:=<>PathName
Else 
	$_t_PathName:=DB_GetLicenceString
End if 
$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_PathName)
$_t_OrganisationNumSTR:=Substring:C12($_t_LicenceNumeric; 4; 4)
$_l_OrganisationSumNUM:=Num:C11($_t_OrganisationNumSTR)
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8; 99)
$_t_OrganisationName:=DB_GetOrganisation
$_l_OrganisationSumCheck:=Character code:C91(Substring:C12($_t_OrganisationName; 1; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 2; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 3; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 4; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 5; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 6; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 7; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 8; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 9; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 10; 1))
$_t_OrganisationNumSTR:=""
If ($_l_OrganisationSumNUM>5000)
	$_l_OrganisationSumNUM:=$_l_OrganisationSumNUM-5000
	If ($_l_OrganisationSumCheck#$_l_OrganisationSumNUM)
		$_t_OrganisationNumSTR:="No"
	End if 
End if 

//If (Length($_t_LicenceNumeric)>18)
$_l_LicenceChar1:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
<>ConWPUsers:=Num:C11($_t_LicenceNumeric[[$_l_LicenceChar1]]+$_t_LicenceNumeric[[$_l_LicenceChar1+1]])
<>ConIMUsers:=Num:C11($_t_LicenceNumeric[[$_l_LicenceChar1+2]]+$_t_LicenceNumeric[[$_l_LicenceChar1+3]])

Case of 
	: ($_l_LicenceChar1=7)
		<>ConWPUsers:=<>ConWPUsers+99
	: ($_l_LicenceChar1=8)
		<>ConIMUsers:=<>ConIMUsers+99
	: ($_l_LicenceChar1=9)
		<>ConWPUsers:=<>ConWPUsers+99
		<>ConIMUsers:=<>ConIMUsers+99
End case 
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_LicenceChar1-2)+Substring:C12($_t_LicenceNumeric; $_l_LicenceChar1+4)
//End if

$_l_LicenceChar1:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
$_l_LicenceChar2:=Num:C11(Substring:C12($_t_LicenceNumeric; $_l_LicenceChar1; 2))
$_t_UnDecodedLicence:=Substring:C12($_t_LicenceNumeric; 2; $_l_LicenceChar1-2)+Substring:C12($_t_LicenceNumeric; $_l_LicenceChar1+2; Length:C16($_t_LicenceNumeric)-3-$_l_LicenceChar1-1)
$_l_SizeofArrayLicence:=Num:C11(Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2; 32000))
$_t_DecodedLicence:=Str_Divide($_t_UnDecodedLicence; String:C10($_l_SizeofArrayLicence))


If ($_l_LicenceChar1>6)
	$_l_LicenceChar2:=$_l_LicenceChar2+99
End if 
<>SYS_l_MaxConnectedUsers:=$_l_LicenceChar2
While (Semaphore:C143("$CheckingModules"))
	DelayTicks
End while 
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 
ARRAY LONGINT:C221(<>Mod_al_ModuleAccessType; <>Mod_l_MaxModules)
$_l_ModuleRow:=(<>Mod_l_MaxModules-2)-6
<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=1  //(37)
<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=1  //38
<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=1  //39

If ($_t_PathName="")
	Path_CheckSG
Else 
	
	//Type 4
	Case of 
		: (($_l_LicenceChar1>2) & ($_l_LicenceChar2>0) & ($_l_LicenceChar2<=99) & (Length:C16($_t_DecodedLicence)=16) & ($_l_SizeofArrayLicence>99) & ($_l_SizeofArrayLicence<900) & ($_t_DecodedLicence#"@9@"))
			$_bo_OK:=True:C214
		: (($_l_LicenceChar1>2) & ($_l_LicenceChar2>0) & ($_l_LicenceChar2<=99) & (Length:C16($_t_DecodedLicence)=23) & ($_l_SizeofArrayLicence>99) & ($_l_SizeofArrayLicence<900) & ((Substring:C12($_t_DecodedLicence; 1; 19))#"@9@"))
			$_t_ReleaseVersion:=Substring:C12($_t_DecodedLicence; 17; 3)
			$_t_LicenceReleaseCheck:=Substring:C12(<>SYS_t_VersionNumber; 4; Length:C16(<>SYS_t_VersionNumber))
			If (Num:C11($_t_LicenceReleaseCheck)>=Num:C11($_t_ReleaseVersion))
				$_bo_OK:=True:C214
			Else 
				//long licence number for old version  !!!
				$_bo_OK:=False:C215
			End if 
		Else 
			$_bo_OK:=False:C215
	End case 
	If ($_bo_OK)
		$_t_LicenceVersion:=Substring:C12($_t_DecodedLicence; 15; 1)+"."+Substring:C12($_t_DecodedLicence; 16; 1)
		If (Length:C16($_t_DecodedLicence)=23)
			$_t_ReleaseVersion:=Substring:C12($_t_DecodedLicence; 17; 3)
			$_t_LicenceSeed:=Substring:C12($_t_DecodedLicence; 20; 4)
			If ($_t_LicenceSeed)#String:C10(<>LIC_l_Seed; "0000")
				$_bo_OK:=False:C215
			End if 
		Else 
			//short licence number
			//is this being entered?
			If ($_t_PathName#<>OLDPathName)
				//yes it is being enetered
				$_t_LicenceReleaseCheck:=Substring:C12(<>SYS_t_VersionNumber; 4; Length:C16(<>SYS_t_VersionNumber))
				If (Num:C11($_t_LicenceReleaseCheck)>13)
					$_bo_OK:=False:C215
				End if 
			Else 
				$_t_LicenceVersion:=Substring:C12(<>SYS_t_VersionNumber; 1; 3)
				If (Num:C11($_t_LicenceVersion)>=5)
					$_bo_OK:=False:C215
				End if 
			End if 
		End if 
		If ($_t_LicenceVersion=Substring:C12(<>SYS_t_VersionNumber; 1; 3)) & ($_bo_OK)
			If ($_t_OrganisationNumSTR="")
				$_l_LicenceCharPosition:=1
				$_l_ModuleRow:=1
				While ($_l_ModuleRow<(<>Mod_l_MaxModules))
					IDLE:C311  // 7/04/03 pb
					$_t_LicenceCharacter:=Substring:C12($_t_DecodedLicence; $_l_LicenceCharPosition; 1)
					Case of 
						: ($_t_LicenceCharacter="1")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_LicenceCharacter="2")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_LicenceCharacter="3")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_LicenceCharacter="4")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_LicenceCharacter="5")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_LicenceCharacter="6")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=0
						: ($_t_LicenceCharacter="7")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=1
						: ($_t_LicenceCharacter="8")
							<>Mod_al_ModuleAccessType{$_l_ModuleRow}:=0
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+1}:=1
							<>Mod_al_ModuleAccessType{$_l_ModuleRow+2}:=0
					End case 
					$_l_LicenceCharPosition:=$_l_LicenceCharPosition+1
					$_l_ModuleRow:=$_l_ModuleRow+3
					If ($_l_ModuleRow=37)
						$_l_ModuleRow:=40
					End if 
				End while 
				
				
			Else 
				Gen_Alert("Please ensure that the Organisation box exactly matches "+"the name on your Licence Form")
				$_t_PathName:=""
				//Path_CheckLUDel
			End if 
		Else 
			Gen_Alert("Your Licence No is not valid for the current version of Daybook")
			$_t_PathName:=""
			//Path_CheckLUDel
		End if 
	Else 
		$_t_PathName:=""
		//Path_CheckLUDel
	End if 
	//TRACE
	If ((<>Mod_al_ModuleAccessType{1})=1)  //GOLD
		<>Mod_al_ModuleAccessType{1}:=5
		$_l_DModule:=Module_DiaryManager
		
		<>Mod_al_ModuleAccessType{$_l_DModule}:=1
		$_l_SLModule:=Module_SalesLedger
		
		<>Mod_al_ModuleAccessType{$_l_SLModule}:=1
		$_l_PLModule:=Module_PurchaseLedger
		
		
		<>Mod_al_ModuleAccessType{$_l_PLModule}:=1
		$_l_NLModule:=Module_NominalLedger
		
		<>Mod_al_ModuleAccessType{$_l_NLModule}:=1
		$_l_DMModule:=Module_DataManager
		
		<>Mod_al_ModuleAccessType{$_l_DMModule}:=1
		$_l_CRMModule:=Module_Companies
		
		<>Mod_al_ModuleAccessType{$_l_CRMModule}:=1
		$_l_PRDModule:=Module_Products
		
		<>Mod_al_ModuleAccessType{$_l_PRDModule}:=1
	End if 
	If ((<>Mod_al_ModuleAccessType{30})=1)  //Silver PLS
		$_l_SOModule:=Module_SalesOrders
		
		<>Mod_al_ModuleAccessType{$_l_SOModule}:=1
		$_l_POModule:=Module_PurchaseOrders
		
		<>Mod_al_ModuleAccessType{$_l_POModule}:=1
		$_l_SCModule:=Module_StockControl
		
		<>Mod_al_ModuleAccessType{$_l_SCModule}:=1
	End if 
	
	If ($_t_PathName#"")  //Check the Silver/Gold split
		//See also Path_CheckDelTm
		ARRAY TEXT:C222($_at_Version; 1)
		LIST TO ARRAY:C288("Version"; $_at_Version)
		If ((<>Mod_al_ModuleAccessType{34})>0)
			$_t_Demo:=" Demo"
		Else 
			$_t_Demo:=""
		End if 
		If ((<>Mod_al_ModuleAccessType{1})=5)
			$_t_VersionHave:="Silver"+$_t_Demo
		Else 
			$_t_VersionHave:="Gold"+$_t_Demo
		End if 
		If ($_at_Version{1}#$_t_VersionHave)
			
			Case of   //any old start numbers to identify Types
				: ($_t_VersionHave="Silver")
					$_l_LicenceChar2:=1273
				: ($_t_VersionHave="Gold")
					$_l_LicenceChar2:=3419
				: ($_t_VersionHave="Silver Demo")
					$_l_LicenceChar2:=7541
				: ($_t_VersionHave="Gold Demo")
					$_l_LicenceChar2:=5826
			End case 
			
			//See also Path_CheckSG
			$_l_SizeofArrayLicence:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
			$_t_LicenceNumeric:="M"+String:C10($_l_LicenceChar2*$_l_SizeofArrayLicence)+".TMP"  //& multiply the 2 to make the file name to check
			ON ERR CALL:C155("Remote_Err")
			vDoc:=DB_OpenDocument($_t_LicenceNumeric)
			If (OK=1)
				$_bo_VersionOK:=True:C214
				Close_DocUMENT(vDoc)
				DELETE DOCUMENT:C159($_t_LicenceNumeric)
			Else 
				$_bo_VersionOK:=False:C215
			End if 
			ON ERR CALL:C155("")
			
			If ((User in group:C338(Current user:C182; "Designer")) | ($_bo_VersionOK))
				ARRAY TEXT:C222($_at_Version; 1)
				If (<>Mod_al_ModuleAccessType{1}=5)
					$_at_Version{1}:="Silver"+$_t_Demo
				Else 
					$_at_Version{1}:="Gold"+$_t_Demo
				End if 
				ARRAY TO LIST:C287($_at_Version; "Version")
			Else 
				If ((<>Mod_al_ModuleAccessType{1})=5)
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
					$_t_PathName:=""
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
					$_t_PathName:=""
				End if 
			End if 
		End if 
		<>SYS_t_PathVersion:=$_at_Version{1}
	Else 
		<>SYS_t_PathVersion:=""
	End if 
	
	If ($_t_PathName#"")  //check the Macintosh/Windows split
		If (Is macOS:C1572)
			If ((<>Mod_al_ModuleAccessType{41})=0)
				Gen_Alert("The Licence No does not allow access to Daybook on Macintosh "+" machines")
				$_t_PathName:=""
			End if 
		Else 
			If ((<>Mod_al_ModuleAccessType{42})=0)
				Gen_Alert("The Licence No does not allow access to Daybook on Windows machines")
				$_t_PathName:=""
			End if 
		End if 
	End if 
	
	If ($_t_PathName#"")
		If (Records in table:C83(LIC_ptr_LicenceTable->)>0) & (False:C215)
			READ ONLY:C145(LIC_ptr_LicenceTable->)
			ARRAY TEXT:C222($_at_Licence; 0)
			ALL RECORDS:C47(LIC_ptr_LicenceTable->)
			SELECTION TO ARRAY:C260([LICENCE_UPDATES:97]Licence:1; $_at_Licence)
			$_l_SizeofArrayLicence:=Size of array:C274($_at_Licence)
			For ($_l_LicenceCharPosition; 1; $_l_SizeofArrayLicence)
				$_t_LicenceNumeric:=Path_CheckLU($_at_Licence{$_l_LicenceCharPosition})
			End for 
			UNLOAD RECORD:C212(LIC_ptr_LicenceTable->)
		End if 
	End if 
	
	If (<>SYS_d_InceptionDate=<>DB_d_CurrentDate)
		If ($_t_PathName#"")
			Path_CheckDelTm  //make sure the tmp file is deleted even if not used
		End if 
	End if 
End if 
If (<>PathName#"")
	<>PathName:=$_t_PathName
End if 
CLEAR SEMAPHORE:C144("$CheckingModules")
ERR_MethodTrackerReturn("Path Check"; $_t_oldMethodName)
