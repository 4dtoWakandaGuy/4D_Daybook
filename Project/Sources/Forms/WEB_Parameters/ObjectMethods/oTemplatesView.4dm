If (False:C215)
	//object Name: Object Name:      WEB_Parameters.oTemplatesView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 11:24
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/WEB_Parameters/oTemplatesView"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ WEB_Parameters.oTemplatesView"; $_t_oldMethodName)