If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Column2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:03
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Column2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Column2"; $_t_oldMethodName)