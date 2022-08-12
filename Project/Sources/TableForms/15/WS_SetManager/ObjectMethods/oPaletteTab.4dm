If (False:C215)
	//object Name: [USER]WS_SetManager.Tab Control1
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
	//ARRAY TEXT(SM_at_PalleteTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Tab Control1"; Form event code:C388)
//this may have no values
Case of 
	: (SM_at_PalleteTab=1)
		FORM GOTO PAGE:C247(1)
		SET WINDOW TITLE:C213("Data Lists")
		
	: (SM_at_PalleteTab=2)
		FORM GOTO PAGE:C247(5)
		SET WINDOW TITLE:C213("Macros")
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Tab Control1"; $_t_oldMethodName)
