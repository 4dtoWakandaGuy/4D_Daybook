If (False:C215)
	//object Name: [RESULTS]Results_in.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [RESULTS].Results_in.Variable4"; Form event code:C388)
Gen_ExportButt(->[RESULTS:14]Export:4)
ERR_MethodTrackerReturn("OBJ [RESULTS].Results_in.Variable4"; $_t_oldMethodName)