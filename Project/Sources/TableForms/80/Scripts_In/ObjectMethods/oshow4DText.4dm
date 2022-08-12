If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Oshow4DText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/12/2011 17:20
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Oshow4DText"; Form event code:C388)

FORM GOTO PAGE:C247(1)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Oshow4DText"; $_t_oldMethodName)