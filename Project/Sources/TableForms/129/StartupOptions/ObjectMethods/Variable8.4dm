If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Servers;0)
	C_BOOLEAN:C305(<>SYS_bo_FullAccess; <>SYS_bo_MACOptimize; DB_bo_NoLoad)
	C_LONGINT:C283(GEN_cb_1; GEN_cb_2; GEN_cb_4; rb_BeMonitor; rb_ConnectToMonitor; rb_NeitherMonitor; xCancel)
	C_TEXT:C284(<>SQL_s_CentralServerName; <>SYS_s_CurrentUser; $_t_oldMethodName; sDLG_Message)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Variable8"; Form event code:C388)
//Object Method: GEN_btn_OnLoad
// b10 LNH 19990616 - Added code to make the trace button invisible if compiled


If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	If (<>SYS_bo_FullAccess)
		_sDLG_Message:=<>SYS_s_CurrentUser+" has complete system access."
	Else 
		_sDLG_Message:=""
	End if 
	
	GEN_cb_1:=1  //connect to Oracle
	
	rb_BeMonitor:=0
	rb_ConnectToMonitor:=0
	rb_NeitherMonitor:=1  //default is to neither connect to nor be a monitor
	
	LIST TO ARRAY:C288("OracleServers"; GEN_at_Servers)
	
	GEN_at_Servers:=Find in array:C230(GEN_at_Servers; <>SQL_s_CentralServerName)
	
	If (GEN_at_Servers>0)  //if the default server was found (and it should be)
		If (Is Windows:C1573)
			// Axel 7/6/2000 exclude PC
			GEN_cb_2:=1
		Else 
			GEN_cb_2:=0
		End if 
		GEN_cb_1:=1  //connect to Oracle
	Else 
		GEN_cb_2:=0
		GEN_cb_1:=0  //DO NOT connect to Oracle
	End if 
	
	GEN_cb_3:=Num:C11(<>SYS_bo_MACOptimize)
	
	GEN_cb_4:=0
	
	If ((Is compiled mode:C492) | (Is Windows:C1573))  //Rollo 6/15/99 `Axel 6/5/00 exclude PC
		OBJECT SET VISIBLE:C603(xCancel; False:C215)  //Rollo 6/15/99
	End if   //Rollo 6/15/99
	
End if 
//end
ERR_MethodTrackerReturn("OBJ:StartupOptions,GEN_btn_OnLoad"; $_t_oldMethodName)