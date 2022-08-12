If (False:C215)
	//object Name: [USER]CAT_Selector.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CAT_l_SaveSettings)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CAT_Selector.Variable3"; Form event code:C388)
CAT_l_SaveSettings:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].CAT_Selector.Variable3"; $_t_oldMethodName)