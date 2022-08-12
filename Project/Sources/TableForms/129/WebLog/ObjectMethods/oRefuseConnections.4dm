If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Variable6
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
	C_BOOLEAN:C305(<>IME_bo_Startup; <>IWS_bo_LoadInformerInterrupt; DB_bo_NoLoad)
	C_LONGINT:C283(<>IWS_l_RefuseConnections; xSelect)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Variable6"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Self:C308->:=0
	: (Form event code:C388=On Clicked:K2:4)
		
		If (<>IWS_l_RefuseConnections=1)
			<>IWS_bo_LoadInformerInterrupt:=True:C214
		Else 
			<>IWS_bo_LoadInformerInterrupt:=False:C215
		End if 
		
End case 


//GEN_Confirm ("Ken, Mike! Are you sure you want to do this?";"Yes";"No")
//If (OK=1)

If (<>IWS_l_RefuseConnections=1)
	<>IWS_bo_LoadInformerInterrupt:=True:C214
Else 
	<>IWS_bo_LoadInformerInterrupt:=False:C215
End if 

//End if

If (False:C215)
	If (<>IME_bo_Startup)
		<>IME_bo_Startup:=False:C215
		xSelect:=0
		//Send message to IWS_at_LogText saying ALLOW CONNECTIONS
	Else 
		<>IME_bo_Startup:=True:C214
		xSelect:=1
		//Send message to IWS_at_LogText saying REFUSE CONNECTIONS
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Variable6"; $_t_oldMethodName)
