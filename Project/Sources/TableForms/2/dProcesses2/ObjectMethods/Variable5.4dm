If (False:C215)
	//object Name: [COMPANIES]dProcesses2.Variable5
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
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dProcesses2.Variable5"; Form event code:C388)
If (Size of array:C274(PRC_al_ProcessNum)>0)
	If ((PRC_at_ProcessName>0) & (Size of array:C274(PRC_al_ProcessNum)>=PRC_at_ProcessName))
		SHOW PROCESS:C325(PRC_al_ProcessNum{PRC_at_ProcessName})
	Else 
		Process_GenAll("Show"; 0)
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dProcesses2.Variable5"; $_t_oldMethodName)
