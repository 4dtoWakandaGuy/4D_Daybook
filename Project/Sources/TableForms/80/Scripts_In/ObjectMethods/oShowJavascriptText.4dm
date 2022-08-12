If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.OshowJavascriptText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 12:23
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.OshowJavascriptText"; Form event code:C388)

FORM GOTO PAGE:C247(3)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.OshowJavascriptText"; $_t_oldMethodName)