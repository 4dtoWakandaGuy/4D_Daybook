If (False:C215)
	//object Name: [SOURCES]SOurces_in.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].SOurces_in.Variable6"; Form event code:C388)
Gen_ExportButt(->[SOURCES:6]Export:13)
ERR_MethodTrackerReturn("OBJ [SOURCES].SOurces_in.Variable6"; $_t_oldMethodName)