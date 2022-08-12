
If (False:C215)
	//Object Name:      [PERSONNEL].Personnel_In.oMail Setup
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL]Personnel_In.oMail Setup"; Form event code:C388)
FORM GOTO PAGE:C247(7)
ERR_MethodTrackerReturn("OBJ [PERSONNEL]Personnel_In.oMail Setup"; $_t_oldMethodName)