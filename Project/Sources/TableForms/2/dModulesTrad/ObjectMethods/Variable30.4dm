If (False:C215)
	//object Name: [COMPANIES]dModulesTrad.Variable30
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dModulesTrad.Variable30"; Form event code:C388)
Menu_ModBarButt(27)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dModulesTrad.Variable30"; $_t_oldMethodName)