//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Version
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CustomerBuild)
	C_TEXT:C284(<>SYS_t_VersionNumber; $_t_oldMethodName; $_t_VerLicenceBuildString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Version")
<>SYS_t_VersionNumber:=VER_GetLicenceVersion
//NG..The above will now return this in the format 5.3
$_l_CustomerBuild:=VER_GetBuildNumber
$_t_VerLicenceBuildString:=String:C10($_l_CustomerBuild; "000")

If (False:C215)
	If (Is compiled mode:C492)
		<>SYS_t_VersionNumber:="7.0"
	Else 
		<>SYS_t_VersionNumber:="7.0.000"
	End if 
End if 
ERR_MethodTrackerReturn("User_Version"; $_t_oldMethodName)
