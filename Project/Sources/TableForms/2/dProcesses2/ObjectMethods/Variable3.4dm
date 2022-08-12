If (False:C215)
	//object Name: [COMPANIES]dProcesses2.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dProcesses2.Variable3"; Form event code:C388)

Processes_PopUp(PRC_at_ProcessName; True:C214)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dProcesses2.Variable3"; $_t_oldMethodName)