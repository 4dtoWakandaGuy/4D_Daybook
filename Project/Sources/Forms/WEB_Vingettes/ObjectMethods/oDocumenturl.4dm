If (False:C215)
	//object Name: Object Name:      WEB_Vingettes.oDocumenturl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2012 13:12
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ WEB_Vingettes.oDocumenturl"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oDocumenturl"; $_t_oldMethodName)