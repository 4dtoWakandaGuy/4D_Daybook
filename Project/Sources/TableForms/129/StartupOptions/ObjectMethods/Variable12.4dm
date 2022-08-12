If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Variable12
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
	//Array TEXT(GEN_at_Servers;0)
	C_BOOLEAN:C305(<>SQL_bo_Debug; <>SYS_bo_ConnectToOracle; <>SYS_bo_LogicServer; <>SYS_bo_MACOptimize; <>SYS_bo_StartWebServer; <>SYS_bo_UseMonitor)
	C_LONGINT:C283(GEN_cb_1)
	C_TEXT:C284(<>SQL_s_CentralServerName; $_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Variable12"; Form event code:C388)

Case of 
		
	: (GEN_cb_1=1) & (GEN_at_Servers=0)
		
		ALERT:C41("If you connect to Oracle, you must specify a Server.")
		
	Else 
		
		<>SYS_bo_ConnectToOracle:=(GEN_cb_1=1)
		<>SYS_bo_LogicServer:=(rb_BeMonitor=0)  //if we're not being a Monitor, we're a logic server
		<>SYS_bo_UseMonitor:=(rb_ConnectToMonitor=1)
		<>SQL_s_CentralServerName:=GEN_at_Servers{GEN_at_Servers}
		<>SYS_bo_StartWebServer:=(GEN_cb_2=1)
		<>SYS_bo_MACOptimize:=(GEN_cb_3=1)
		<>SQL_bo_Debug:=(GEN_cb_4=1)
		//NB: See also SYS_StartupOptionsGetFromFile
		
		ACCEPT:C269
		
End case 
//end
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].StartupOptions.Variable12"; $_t_oldMethodName)