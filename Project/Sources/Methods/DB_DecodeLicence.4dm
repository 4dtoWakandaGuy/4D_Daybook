//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_DecodeLicence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccess; 0)
	C_LONGINT:C283($_l_IMUsers; $_l_LicenceLength; $_l_MaxIMUsers; $_l_MaxUsers; $_l_MaxWPUsers; $_l_ThisCharacter; $_l_WPUsers)
	C_POINTER:C301($_ptr_LicenceExpiryDate; $_ptr_LicenceStringNumericFULL; $_ptr_MaxIMUsers; $_ptr_MaxUsers; $_ptr_MaxWPUsers; $_ptr_ModuleAccessArray; $_ptr_ModuleDecodeString; $_ptr_OrganisationNUM; $2; $3; $4)
	C_POINTER:C301($5; $6; $7; $8; $9)
	C_TEXT:C284($_t_DivideString; $_t_LastCharacters; $_t_LicenceNumeric; $_t_LicenceString; $_t_LicenceStringNumericFULL; $_t_LicenceVersion; $_t_ModuleDecodeString; $_t_OrganisationNUM; $_t_ReleaseVersion; $_t_Seed; $1)
End if 
//Code Starts Here
$_t_LicenceString:=$1
$_ptr_LicenceStringNumericFULL:=$2
$_ptr_OrganisationNUM:=$3
$_ptr_MaxWPUsers:=$4
$_ptr_MaxIMUsers:=$5
$_ptr_MaxUsers:=$6
$_ptr_ModuleDecodeString:=$7
$_ptr_ModuleAccessArray:=$8
$_ptr_LicenceExpiryDate:=$9


$_l_LicenceLength:=Length:C16($_t_LicenceString)
$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
$_t_LicenceStringNumericFULL:=$_t_LicenceNumeric
$_t_OrganisationNUM:=DB_LicenceOrgFromcode($_t_LicenceNumeric)
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)

$_l_WPUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
$_l_IMUsers:=DB_LicenceIMusersfromCode($_t_LicenceNumeric)
$_l_ThisCharacter:=Num:C11($_t_LicenceNumeric[[1]])
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
$_l_ThisCharacter:=Num:C11(Substring:C12($_t_LicenceNumeric; 1; 1))
$_t_LastCharacters:=Substring:C12($_t_LicenceNumeric; Length:C16($_t_LicenceNumeric)-2)
$_l_LicenceLength:=(Length:C16($_t_LicenceNumeric)-5)
$_t_DivideString:=Str_Divide(Substring:C12((Substring:C12((Substring:C12($_t_LicenceNumeric; 1; $_l_ThisCharacter-1)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+2)); 1; $_l_LicenceLength)); 2); Substring:C12($_t_LicenceNumeric; (Length:C16($_t_LicenceNumeric)-2)))
$_t_ModuleDecodeString:=$_t_DivideString
If (Length:C16($_t_DivideString)>=23)  //On the basis that all licences will be the ones that include the version number(post v5!)
	$_t_ReleaseVersion:=Substring:C12($_t_DivideString; 17; 3)
	$_t_LicenceVersion:=$_t_DivideString[[15]]+"."+$_t_DivideString[[16]]
	$_t_Seed:=Substring:C12($_t_DivideString; 20; 4)
	
Else 
	$_t_ReleaseVersion:="000"
	$_t_LicenceVersion:="1.0"
End if 
ARRAY LONGINT:C221($_al_ModuleAccess; 45)
DB_LicenceModulesFromCode($_t_DivideString; ->$_al_ModuleAccess; 45)
//DB_DecodeLicence(DB_t_PathName;->$_t_LicenceStringNumericFULL;->$_t_OrganisationNUM;->$_l_MaxWPUsers;->$_l_MaxIMUsers;->$_l_MaxUsers;->$_t_ModuleDecodeString;->$_d_LicenceExpiryDate)
$_ptr_LicenceStringNumericFULL->:=$_t_LicenceStringNumericFULL
$_ptr_OrganisationNUM->:=$_t_OrganisationNUM
$_ptr_MaxWPUsers->:=$_l_MaxWPUsers
$_ptr_MaxIMUsers->:=$_l_MaxIMUsers
$_ptr_MaxUsers->:=$_l_MaxUsers
$_ptr_ModuleDecodeString->:=$_t_ModuleDecodeString
COPY ARRAY:C226($_al_ModuleAccess; $_ptr_ModuleAccessArray->)


$_ptr_LicenceExpiryDate:=$9

