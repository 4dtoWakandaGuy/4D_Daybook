If (False:C215)
	//object Name: [WEBSETUP_4D]WebTest_d.Variable8
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
	C_LONGINT:C283(<>IWS_StartTestClientsProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTest_d.Variable8"; Form event code:C388)
//CALL PROCESS(◊IWS_StartTestClientsProc)

If (<>IWS_StartTestClientsProc<1)
	<>IWS_StartTestClientsProc:=New process:C317("IWS_StartTestClients"; 64000; "$Start Test Clients")
Else 
	RESUME PROCESS:C320(<>IWS_StartTestClientsProc)
	BRING TO FRONT:C326(<>IWS_StartTestClientsProc)
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTest_d.Variable8"; $_t_oldMethodName)
