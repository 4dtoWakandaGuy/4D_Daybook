If (False:C215)
	//object Name: [JOBS]dJobs_Sel.Variable11
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
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dJobs_Sel.Variable11"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[DIARY:12])
ERR_MethodTrackerReturn("OBJ [JOBS].dJobs_Sel.Variable11"; $_t_oldMethodName)