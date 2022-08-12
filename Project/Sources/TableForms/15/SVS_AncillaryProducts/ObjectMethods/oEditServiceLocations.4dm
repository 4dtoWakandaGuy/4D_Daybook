If (False:C215)
	//object Name: [USER]SVS_AncillaryProducts.oEditServiceLocations
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_AncillaryProducts.oEditServiceLocations"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].SVS_AncillaryProducts.oEditServiceLocations"; $_t_oldMethodName)