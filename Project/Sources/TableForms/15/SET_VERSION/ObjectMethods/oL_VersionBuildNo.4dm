If (False:C215)
	//object Name: [USER]SET_VERSION.oL_VersionBuildNo
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
	C_BOOLEAN:C305(VER_bo_BuildChanged)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SET_VERSION.oL_VersionBuildNo"; Form event code:C388)
Case of 
	: (Form event code:C388=On Losing Focus:K2:8)
		VER_bo_BuildChanged:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ:SET_VERSION,L_VersionBuildNo"; $_t_oldMethodName)
