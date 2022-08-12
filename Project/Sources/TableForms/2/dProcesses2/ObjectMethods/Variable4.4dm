If (False:C215)
	//object Name: [COMPANIES]dProcesses2.Variable4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dProcesses2.Variable4"; Form event code:C388)
If (Size of array:C274(PRC_al_ProcessNum)>0)
	If ((PRC_at_ProcessName>0) & (Size of array:C274(PRC_al_ProcessNum)>=PRC_at_ProcessName))
	Else 
		PRC_at_ProcessName:=1
	End if 
	If (PRC_at_ProcessName{PRC_at_ProcessName}#"Telephony@")
		SHOW PROCESS:C325(PRC_al_ProcessNum{PRC_at_ProcessName})
		BRING TO FRONT:C326(PRC_al_ProcessNum{PRC_at_ProcessName})
		RESUME PROCESS:C320(PRC_al_ProcessNum{PRC_at_ProcessName})
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dProcesses2.Variable4"; $_t_oldMethodName)
