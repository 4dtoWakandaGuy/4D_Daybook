//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_UPDATEVERSION
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
	C_LONGINT:C283($_l_DevelopmentStage; $_l_ResourceCode; $_l_SetVersionProcess; $_l_UpdateBuildOnly; $_l_VersionBuildNo; $5; $7; $8; $9)
	C_TEXT:C284($_t_DeveloperName; $_t_LicenceVersion; $_t_oldMethodName; $_t_Version1; $_t_Version2; $_t_Version3; $_t_Version4; $_t_VersionComment; $1; $10; $11)
	C_TEXT:C284($2; $3; $4; $6)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("VER_UPDATEVERSION")

If (Count parameters:C259>=6)
	$_t_Version1:=$1
	$_t_Version2:=$2
	$_t_Version3:=$3
	$_t_Version4:=$4
	
	$_l_DevelopmentStage:=$5
	$_t_LicenceVersion:=$6
	
	If ($_t_LicenceVersion="")
		$_t_LicenceVersion:=VER_DefaultLicenceVersion
	End if 
	
	If (Count parameters:C259>6)
		$_l_ResourceCode:=$7
	Else 
		$_l_ResourceCode:=0
	End if 
	
	If (Count parameters:C259>7)
		$_l_VersionBuildNo:=$8
	Else 
		$_l_VersionBuildNo:=0
	End if 
	
	If (Count parameters:C259>8)
		$_l_UpdateBuildOnly:=$9
	Else 
		$_l_UpdateBuildOnly:=0
	End if 
	If (Count parameters:C259>9)
		$_t_DeveloperName:=$10
	Else 
		$_t_DeveloperName:=""
	End if 
	If (Count parameters:C259>10)
		$_t_VersionComment:=$11
	Else 
		$_t_VersionComment:=""
	End if 
	If (Application type:C494=4D Remote mode:K5:5)
		$_l_SetVersionProcess:=Execute on server:C373("VER_SETVERSION"; DB_ProcessMemoryinit(1); "Set Version"; $_t_Version1; $_t_Version2; $_t_Version3; $_t_Version4; $_l_DevelopmentStage; $_t_LicenceVersion; $_l_ResourceCode; $_l_VersionBuildNo; $_l_UpdateBuildOnly)
	Else 
		VER_SETVERSION($_t_Version1; $_t_Version2; $_t_Version3; $_t_Version4; $_l_DevelopmentStage; $_t_LicenceVersion; $_l_ResourceCode; $_l_VersionBuildNo; $_l_UpdateBuildOnly; $_t_DeveloperName; $_t_VersionComment)
	End if 
	
End if 
ERR_MethodTrackerReturn("VER_UPDATEVERSION"; $_t_oldMethodName)
