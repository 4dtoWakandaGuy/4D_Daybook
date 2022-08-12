If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable72
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable72"; Form event code:C388)
Gen_ExportButtU(->[CONTACTS:1]Export:18)
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable72"; $_t_oldMethodName)