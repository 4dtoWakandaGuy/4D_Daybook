If (False:C215)
	//object Name: Object Name:      DB_ShowFloatingPicture.oDBOpenRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 17:44
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_ShowFloatingPicture.oDBOpenRecord"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ DB_ShowFloatingPicture.oDBOpenRecord"; $_t_oldMethodName)