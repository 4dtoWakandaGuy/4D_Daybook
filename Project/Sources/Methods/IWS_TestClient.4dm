//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_TestClient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>IWS_at_TestPages;0)
	ARRAY TEXT:C222($_at_IWSTestPages; 0)
	C_BOOLEAN:C305(<>IWS_bo_StopTestClients; <>SYS_bo_Quit; $_bo_ProcessVisible; $_bo_Wait)
	C_LONGINT:C283(<>IWS_l_ClientTestChannel; <>IWS_l_PageTicks; <>IWS_l_TestRandom; <>IWS_l_WaitForPage; $_l_Index; $_l_PageCount; $_l_PageIndex; $_l_PagesReceived; $_l_ProcessState; $_l_ProcessTime; $_r_Bytes)
	C_LONGINT:C283($_r_BytesReceived; $_r_Milliseconds)
	C_TEXT:C284(<>IWS_t_Hostname; <>STR_t_CR; <>STR_t_LF; $_t_Answer; $_t_ClientProcessName; $_t_CR; $_t_CRLF; $_t_LF; $_t_Message; $_t_oldMethodName; $_t_Page)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_TestClient")
IWS_StartProcess
//LOG_SetMethod ("IWS_TestClient")
//added by John, 4/28/99


PROCESS PROPERTIES:C336(Current process:C322; $_t_ClientProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
$_t_CR:=<>STR_t_CR
$_t_LF:=<>STR_t_LF
$_t_CRLF:=<>STR_t_CR+<>STR_t_LF

ARRAY TEXT:C222($_at_IWSTestPages; 0)
COPY ARRAY:C226(<>IWS_at_TestPages; $_at_IWSTestPages)

$_l_PageCount:=Size of array:C274($_at_IWSTestPages)


If ($_l_PageCount>0)
	$_l_PagesReceived:=0
	$_r_BytesReceived:=0
	
	If (<>IWS_l_WaitForPage=1)
		$_bo_Wait:=True:C214
	Else 
		$_bo_Wait:=False:C215
	End if 
	
	While (Not:C34(<>SYS_bo_Quit)) & (Not:C34(<>IWS_bo_StopTestClients))
		For ($_l_PageIndex; 1; $_l_PageCount)
			If (<>IWS_l_TestRandom=1)
				$_l_Index:=Random:C100%($_l_PageCount)+1
			Else 
				$_l_Index:=$_l_PageIndex
			End if 
			$_t_Page:=$_at_IWSTestPages{$_l_Index}
			DelayTicks(<>IWS_l_PageTicks)
			//$_r_Milliseconds:=Milliseconds
			$_t_Answer:=IWS_GetPage(<>IWS_t_Hostname; $_t_Page; $_bo_Wait)
			$_r_Milliseconds:=0  //Milliseconds-$_r_Milliseconds
			
			If ($_t_Answer#"")
				$_r_Bytes:=Length:C16($_t_Answer)
				$_r_BytesReceived:=$_r_BytesReceived+$_r_Bytes
				$_l_PagesReceived:=$_l_PagesReceived+1
			Else 
				$_r_Bytes:=0
			End if 
			$_t_Message:=STR_ParamBlock($_t_ClientProcessName; String:C10($_r_BytesReceived); $_t_Page; String:C10($_r_Milliseconds))
			IPC_SendMessage(<>IWS_l_ClientTestChannel; $_t_Message)
			//   CREATE RECORD([TestClientLog_4D])
			//      [TestClientLog_4D]Machine:=<>SYS_s_MachineName
			//      [TestClientLog_4D]Host:=<>IWS_t_Hostname
			//      [TestClientLog_4D]Page:=$_t_Page
			//      [TestClientLog_4D]Bytes:=$_r_Bytes
			//      [TestClientLog_4D]MS Taken:=$_r_Milliseconds
			//      SAVE RECORD([TestClientLog_4D])  `other record data gets filled in by th
			//~e trigger on the server
		End for 
		IDLE:C311
	End while 
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_TestClient"; $_t_oldMethodName)