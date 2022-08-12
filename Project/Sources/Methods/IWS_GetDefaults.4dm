//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetDefaults
	//------------------ Method Notes ------------------
	//To work out what is going on here, look at what happens after
	//Case of   : ($Type=1) in IWS_UserInfo. The UserInfo process picks
	//up this message and immediately returns a message which must be parsed
	//into its constituent parts using STR_Param
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>IWS_bo_Shutdown; IWS_bo_SMPTError)
	C_LONGINT:C283(<>IWS_l_UserInfoChannel; $_l_UserInfoProcess; $Local; $Position; IWS_l_Area; IWS_l_HandlerChannel; IWS_l_RemoteIPAddress; IWS_l_Section; IWS_l_User)
	C_TEXT:C284(<>IWS_t_UserInfoProcess; $_t_Message; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetDefaults")
// IWS_GetDefaults
// obtain default values for this connection


IWS_t_CurrentMethodName:="IWS_GetDefaults"

//Used if <>IWS_bo_GetUserInfo is set

IWS_l_User:=0
IWS_l_Area:=0
IWS_l_Section:=0

IWS_bo_SMPTError:=False:C215


$_t_Message:=STR_ParamBlock(String:C10(IWS_l_HandlerChannel); "1"; String:C10(IWS_l_RemoteIPAddress))

IPC_SendMessage(<>IWS_l_UserInfoChannel; $_t_Message)
$_l_UserInfoProcess:=Process number:C372(<>IWS_t_UserInfoProcess)
RESUME PROCESS:C320($_l_UserInfoProcess)
PAUSE PROCESS:C319(Current process:C322)
//The UserInfo process will resume it once it has sent the message
//If (False)
//While (ITK_NbIPCMsg (IWS_l_HandlerChannel)=0)
//Delayticks(2)
//End while
//End if
If (Not:C34(<>IWS_bo_Shutdown)) & (IPC_MessagesInQueue(IWS_l_HandlerChannel)>0)
	$_t_Message:=IPC_RcvMessage(IWS_l_HandlerChannel)
	IWS_l_User:=Num:C11(STR_Param($_t_Message; 1))
	IWS_l_Area:=Num:C11(STR_Param($_t_Message; 2))
	IWS_l_Section:=Num:C11(STR_Param($_t_Message; 3))
End if 
ERR_MethodTrackerReturn("IWS_GetDefaults"; $_t_oldMethodName)