If (False:C215)
	//object Name: Object Name:      ASK_Person_2.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 12:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Name;0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ASK_Person_2.Variable4")

$_t_oldMethodName:=ERR_MethodTracker("OBJ ASK_Person_2.Variable4"; Form event code:C388)
If (GEN_at_Name<Size of array:C274(GEN_at_Name))
	GEN_at_Name:=GEN_at_Name+1
	<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{GEN_at_Name}
End if 
ERR_MethodTrackerReturn("OBJ ASK_Person_2.Variable4"; $_t_oldMethodName)
