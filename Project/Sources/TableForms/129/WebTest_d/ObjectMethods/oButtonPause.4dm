If (False:C215)
	//object Name: [WEBSETUP_4D]WebTest_d.Button1
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
	ARRAY TEXT:C222($_at_IWSProcessName; 0)
	C_LONGINT:C283(<>IWS_StartTestClientsProc; $_l_IWSProcessIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTest_d.Button1"; Form event code:C388)
ARRAY TEXT:C222($_at_IWSProcessName; 0)


GET PROCESS VARIABLE:C371(<>IWS_StartTestClientsProc; IWS_at_ProcessName; $_at_IWSProcessName)

For ($_l_IWSProcessIndex; 1; Size of array:C274($_at_IWSProcessName))
	
	PAUSE PROCESS:C319(Process number:C372($_at_IWSProcessName{$_l_IWSProcessIndex}))
	
End for 

PAUSE PROCESS:C319(<>IWS_StartTestClientsProc)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTest_d.Button1"; $_t_oldMethodName)
