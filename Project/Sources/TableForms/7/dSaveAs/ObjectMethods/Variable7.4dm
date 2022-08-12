If (False:C215)
	//object Name: [DOCUMENTS]dSaveAs.Variable7
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dSaveAs.Variable7"; Form event code:C388)
Letters_SWSave2
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dSaveAs.Variable7"; $_t_oldMethodName)
