If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.Variable41
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2010 11:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(Up_LogoMOD)
	C_PICTURE:C286($nullPic; UP_Logo; UP_LogoL)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.Variable41")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.Variable41"; Form event code:C388)
Up_LogoMOD:=True:C214
UP_LogoL:=$nullPic
GET PICTURE FROM PASTEBOARD:C522(UP_Logo)
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.Variable41"; $_t_oldMethodName)