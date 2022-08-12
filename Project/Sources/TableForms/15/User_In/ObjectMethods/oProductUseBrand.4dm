
If (False:C215)
	//Object Name:      [USER].User_In.oProductUseBrand
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_bo_ProductUseBrand; DM_bo_ProductUseGroupandBrand)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]User_In.oProductUseBrand"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (DM_bo_ProductUseBrand)
			DM_bo_ProductUseGroupandBrand:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER]User_In.oProductUseBrand"; $_t_oldMethodName)
