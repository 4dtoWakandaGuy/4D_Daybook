If (False:C215)
	//object Name: [USER]Licence_Accept.Button1
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
	C_BOOLEAN:C305(yAccept)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Licence_Accept.Button1"; Form event code:C388)
yAccept:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].Licence_Accept.Button1"; $_t_oldMethodName)