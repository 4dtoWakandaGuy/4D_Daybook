If (False:C215)
	//object Name: [USER]Address_Confirm.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Address_Confirm.Variable16"; Form event code:C388)
FORM GOTO PAGE:C247(1)
ERR_MethodTrackerReturn("OBJ [USER].Address_Confirm.Variable16"; $_t_oldMethodName)