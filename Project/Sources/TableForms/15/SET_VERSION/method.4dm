If (False:C215)
	//Table Form Method Name: [USER]SET_VERSION
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LIC_at_ReleaseTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; VER_bo_BuildChanged; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; VER_l_CustomerBuild; VER_l_DevelopmentStage; VER_l_DevPhase; $_l_event; VER_l_CustomerBuild; VER_l_DevelopmentStage)
	C_TEXT:C284($_t_oldMethodName; VER_t_CustomerLicenceVersion; VER_t_DeveloperName; VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; VER_t_STRUCTBUILDREFERENCE; $_t_oldMethodName; VER_t_CustomerLicenceVersion; VER_t_DeveloperName)
	C_TEXT:C284(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; VER_t_STRUCTBUILDREFERENCE)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SET_VERSION"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//NG modifying this August 2008.
		//This should save changes if you change anything
		ARRAY TEXT:C222(LIC_at_ReleaseTypes; 4)
		LIC_at_ReleaseTypes{1}:="Development"
		LIC_at_ReleaseTypes{2}:="Alpha"
		LIC_at_ReleaseTypes{3}:="Beta"
		LIC_at_ReleaseTypes{4}:="Final"
		LIC_at_ReleaseTypes:=4
		VER_t_DeveloperName:=Current system user:C484
		
		VER_l_DevelopmentStage:=0
		VER_t_STRUCTBUILDREFERENCE:=VER_GetVersion
		Ver_GetVersionBits(0; ->VER_t_LicVerSection1; ->VER_t_LicVerSection2; ->VER_t_LicVerSection3; ->VER_t_LicVerSection4; ->VER_l_DevelopmentStage; ->VER_t_CustomerLicenceVersion)
		VER_l_CustomerBuild:=VER_GetBuildNumber
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].SET_VERSION"; $_t_oldMethodName)
