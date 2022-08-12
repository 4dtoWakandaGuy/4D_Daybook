//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartWebServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ISTARTUP)
	C_TEXT:C284(<>IWS_t_LogProcess; <>RECTEXT; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartWebServer")

//Method: IWS_StartWebServer
Start_ProcCount
If (Process number:C372(<>IWS_t_LogProcess)>0)
	BRING TO FRONT:C326(Process number:C372(<>IWS_t_LogProcess))
Else 
	IWS_StartServer
End if 

If (<>iStartup=False:C215)
	DelayTicks(60)
	If (<>iStartup=False:C215)
		<>RecText:=""
		Macro2("ITO Startup")
		<>iStartup:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("IWS_StartWebServer"; $_t_oldMethodName)