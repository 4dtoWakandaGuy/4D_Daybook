If (False:C215)
	//object Name: [USER]BK_ServerSetup.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ServerSetup.Button1"; Form event code:C388)
Gen_Alert("Note, this is a path to the server, the file open dialogue will appear on the"+"server")
//Execute_File open on server!~~~
ERR_MethodTrackerReturn("OBJ [USER].BK_ServerSetup.Button1"; $_t_oldMethodName)