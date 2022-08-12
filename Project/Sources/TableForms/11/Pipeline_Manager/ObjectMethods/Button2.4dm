If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SP_l_tGroupID; SP_l_tPersonelID)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Button2"; Form event code:C388)

SP_NewTarget(False:C215; True:C214; SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Button2"; $_t_oldMethodName)