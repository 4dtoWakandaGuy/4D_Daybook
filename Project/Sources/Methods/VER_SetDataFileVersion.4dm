//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_SetDataFileVersion
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
	//C_UNKNOWN(t_structure_LicenceVersion)
	C_LONGINT:C283($_l_DataReleaseType)
	C_REAL:C285($_l_StructureReleaseType)
	C_TEXT:C284($_t_DataLicenceVersion; $_t_DataVersion1; $_t_DataVersion2; $_t_DataVersion3; $_t_DataVersion4; $_t_oldMethodName; $_t_Version1; $_t_Version2; $_t_Version3; $_t_Version4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_SetDataFileVersion")
//bsw 17/12/03
//This method will set up data file version same as structure

t_structure_LicenceVersion:=""

$_t_Version1:=""
$_t_Version2:=""
$_t_Version3:=""
$_t_Version4:=""
$_l_StructureReleaseType:=0

Ver_GetVersionBits(0; ->$_t_Version1; ->$_t_Version2; ->$_t_Version3; ->$_t_Version4; ->$_l_StructureReleaseType; ->t_structure_LicenceVersion)

$_t_DataLicenceVersion:=t_structure_LicenceVersion

$_t_DataVersion1:=$_t_Version1
$_t_DataVersion2:=$_t_Version2
$_t_DataVersion3:=$_t_Version3
$_t_DataVersion4:=$_t_Version4
$_l_DataReleaseType:=$_l_StructureReleaseType

VER_UPDATEVERSION($_t_DataVersion1; $_t_DataVersion2; $_t_DataVersion3; $_t_DataVersion4; $_l_DataReleaseType; $_t_DataLicenceVersion; 1)
ERR_MethodTrackerReturn("VER_SetDataFileVersion"; $_t_oldMethodName)
