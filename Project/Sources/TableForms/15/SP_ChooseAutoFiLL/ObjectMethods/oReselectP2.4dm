If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable22"; Form event code:C388)
FORM GOTO PAGE:C247(1)
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable22"; $_t_oldMethodName)