If (False:C215)
	//object Name: [WEBSETUP_4D]WebTest_d.Variable7
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
	ARRAY TEXT:C222($_at_ProcessName; 0)
	C_BOOLEAN:C305(<>IWS_bo_StopTestClients)
	C_LONGINT:C283(<>IWS_StartTestClientsProc; $_l_IWSProcessIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTest_d.Variable7"; Form event code:C388)
ARRAY TEXT:C222($_at_ProcessName; 0)


GET PROCESS VARIABLE:C371(<>IWS_StartTestClientsProc; IWS_at_ProcessName; $_at_ProcessName)

For ($_l_IWSProcessIndex; 1; Size of array:C274($_at_ProcessName))
	
	RESUME PROCESS:C320(Process number:C372($_at_ProcessName{$_l_IWSProcessIndex}))
	
End for 


SET PROCESS VARIABLE:C370(<>IWS_StartTestClientsProc; <>IWS_bo_StopTestClients; True:C214)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTest_d.Variable7"; $_t_oldMethodName)
