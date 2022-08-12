If (False:C215)
	//object Name: [USER]SP_TargetSetup.Variable3
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
	C_LONGINT:C283(SP_rb_Choice1; SP_rb_Choice2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Variable3"; Form event code:C388)
Case of 
	: (SP_rb_Choice1=1)
		FORM GOTO PAGE:C247(2)
	: (SP_rb_Choice2=1)
		FORM GOTO PAGE:C247(3)
	Else 
		Gen_Alert("You must select which type of target you are entering")
End case 
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Variable3"; $_t_oldMethodName)
