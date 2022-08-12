If (False:C215)
	//object Name: [USER]SVS_AncillaryProducts.oExitAncillaryProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 11:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_AncillaryProducts.oExitAncillaryProducts"; Form event code:C388)

CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SVS_AncillaryProducts.oExitAncillaryProducts"; $_t_oldMethodName)