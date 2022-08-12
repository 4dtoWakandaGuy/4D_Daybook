If (False:C215)
	//object Name: [USER]DaskSelect.Column1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:26
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DaskSelect.Column1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].DaskSelect.Column1"; $_t_oldMethodName)