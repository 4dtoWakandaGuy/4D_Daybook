If (False:C215)
	//object Name: [CONTACTS]LAB_SelectL7160.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(LAB_l_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].LAB_SelectL7160.Variable22"; Form event code:C388)

LAB_l_Continue:=1
ERR_MethodTrackerReturn("OBJ [CONTACTS].LAB_SelectL7160.Variable22"; $_t_oldMethodName)
