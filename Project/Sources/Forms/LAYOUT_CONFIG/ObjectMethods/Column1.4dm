If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Column1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/11/2010 11:12
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Column1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Column1"; $_t_oldMethodName)