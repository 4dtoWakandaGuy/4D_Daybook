If (False:C215)
	//object Name: [USER]General_ChoiceFORM.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(GEN_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].General_ChoiceFORM.Button1"; Form event code:C388)
GEN_OK:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].General_ChoiceFORM.Button1"; $_t_oldMethodName)