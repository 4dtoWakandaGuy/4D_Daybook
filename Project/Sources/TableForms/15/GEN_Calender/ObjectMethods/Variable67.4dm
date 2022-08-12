If (False:C215)
	//object Name: [USER]GEN_Calender.Variable67
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].GEN_Calender.Variable67"; Form event code:C388)
CAL_ButtonHandler(Self:C308)
ERR_MethodTrackerReturn("OBJ [USER].GEN_Calender.Variable67"; $_t_oldMethodName)