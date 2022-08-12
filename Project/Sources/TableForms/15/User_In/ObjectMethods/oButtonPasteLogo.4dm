If (False:C215)
	//object Name: [USER]User_In.Variable50
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
	C_BOOLEAN:C305(Up_LogoMOD)
	C_PICTURE:C286(UP_Logo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable50"; Form event code:C388)
Up_LogoMOD:=True:C214
GET PICTURE FROM PASTEBOARD:C522(UP_Logo)
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable50"; $_t_oldMethodName)