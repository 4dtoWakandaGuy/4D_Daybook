//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartTestClients
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_LastMS;0)
	//ARRAY LONGINT(<>IWS_al_Ms;0)
	//ARRAY LONGINT(<>IWS_l_TestClients;0)
	ARRAY LONGINT:C221($_al_PageRequests; 0)
	ARRAY LONGINT:C221($_al_ProcessNumber; 0)
	ARRAY LONGINT:C221($_al_TotalPageMS; 0)
	//ARRAY LONGINT(IWS_al_PagesReceived;0)
	//ARRAY LONGINT(IWS_al_BytesReceived;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>IWS_at_TestPages;0)
	//ARRAY TEXT(IWS_at_ProcessName;0)
	C_BOOLEAN:C305(<>IWS_bo_StopTestClients; $_bo_AllFinished; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>IWS_l_ClientTestChannel; <>IWS_l_PagesReceived; <>IWS_l_StartTicks; <>IWS_StartTestClientsProc; $_l_BytesReceived; $_l_CurrentProcess; $_l_Index; $_l_IndexRow; $_l_MessageCount; $_l_MessageNumber; $_l_ProcessSize)
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_REAL:C285(<>IWS_r_BytesReceived)
	C_TEXT:C284(<>IWS_t_Hostname; <>IWS_t_TestPages; <>Web_t_ServerHandler; $_t_Answer; $_t_Message; $_t_oldMethodName; IWS_t_ProcessName; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartTestClients")
IWS_StartProcess
//LOG_SetMethod ("IWS_StartTestClients")
//added by John, 4/28/99




$_l_CurrentProcess:=Current process:C322
//Process number("$Start Test Clients")

//If ($_l_CurrentProcess=1)
// $ID:=New process("IWS_StartTestClients";DB_ProcessMemoryinit(1);"$Start Test Clients")
//Else



DB_SetMenuBar(""; 1)


//◊IWS_t_TestPages:="PING"  ` Axel disabled 1/2/2001

//First clear out existing test results from this machine
//READ WRITE([TestClientLog_4D])
//QUERY([TestClientLog_4D];[TestClientLog_4D]Machine=<>SYS_s_MachineName)
//DELETE SELECTION([TestClientLog_4D])
// READ ONLY([TestClientLog_4D])

// Axel
// UTI_WinCenter (500;500;-1984;"Server Test")
// DIALOG([DIALOG];"WebTest_d")
//CLOSE WINDOW



If (<>IWS_StartTestClientsProc<1)
	<>IWS_StartTestClientsProc:=New process:C317("IWS_StartTestClients"; DB_ProcessMemoryinit(1); "$Start Test Clients")
Else 
	RESUME PROCESS:C320(<>IWS_StartTestClientsProc)
	BRING TO FRONT:C326(<>IWS_StartTestClientsProc)
End if 


//If (bTest=1)


$_t_Answer:=IWS_GetPage(<>IWS_t_Hostname; "PING"; True:C214)
If ($_t_Answer#"@PING OK@")
	
	ALERT:C41("The web server is either not running"+" or not responding to requests!")
Else 
	// <>IWS_ti_TestDoc:=Create document("Test Client Log "+String(Tickcount))
	ARRAY TEXT:C222(<>IWS_at_TestPages; 0)
	STR_Text2Array(<>IWS_t_TestPages; -><>IWS_at_TestPages)
	$_l_ProcessSize:=Size of array:C274(<>IWS_at_TestPages)
	ARRAY LONGINT:C221(<>IWS_al_LastMS; $_l_ProcessSize)
	ARRAY LONGINT:C221(<>IWS_al_Ms; $_l_ProcessSize)
	ARRAY LONGINT:C221($_al_PageRequests; $_l_ProcessSize)
	ARRAY LONGINT:C221($_al_TotalPageMS; $_l_ProcessSize)
	
	<>IWS_bo_StopTestClients:=False:C215
	ARRAY LONGINT:C221($_al_ProcessNumber; <>IWS_l_TestClients)
	ARRAY TEXT:C222(IWS_at_ProcessName; <>IWS_l_TestClients)
	ARRAY LONGINT:C221(IWS_al_PagesReceived; <>IWS_l_TestClients)
	ARRAY LONGINT:C221(IWS_al_BytesReceived; <>IWS_l_TestClients)
	
	For ($_l_Index; 1; <>IWS_l_TestClients)
		IWS_t_ProcessName:="$Test Client "+String:C10($_l_Index; "000")
		$_al_ProcessNumber{$_l_Index}:=New process:C317("IWS_TestClient"; DB_ProcessMemoryinit(1); IWS_t_ProcessName; *)
		IWS_at_ProcessName{$_l_Index}:=IWS_t_ProcessName
		IWS_al_PagesReceived{$_l_Index}:=0
		IWS_al_BytesReceived{$_l_Index}:=0
		
		DelayTicks(<>IWS_l_StartTicks)
	End for 
	SORT ARRAY:C229(IWS_at_ProcessName; IWS_al_PagesReceived; IWS_al_BytesReceived)
	If (Records in table:C83([WEBSETUP_4D:129])=0)
		CREATE RECORD:C68([WEBSETUP_4D:129])
		AA_CheckUUID(Table:C252(->[WEBSETUP_4D:129]))
		
		SAVE RECORD:C53([WEBSETUP_4D:129])
	End if 
	ALL RECORDS:C47([WEBSETUP_4D:129])
	FORM SET INPUT:C55([WEBSETUP_4D:129]; "WebTestProgress_d")
	
	$_bo_AllFinished:=False:C215
	UTI_WinCenter(320; 560; -1984; "Test Clients")
	ON EVENT CALL:C190("IWS_StopTestClients")
	<>IWS_l_PagesReceived:=0
	<>IWS_r_BytesReceived:=0
	
	While (Not:C34($_bo_AllFinished))
		DelayTicks(60)
		$_bo_AllFinished:=True:C214  //will be set to false if any are still running
		Case of 
			: (<>Web_t_ServerHandler="ITK")
				//$_l_MessageCount:=ITK_NbIPCMsg (◊IWS_l_ClientTestChannel))ITK OUT AUgust 2009
				
			: (<>Web_t_ServerHandler="NTK")
				$_l_MessageCount:=IPC Count Messages(<>IWS_l_ClientTestChannel)
			Else 
				
		End case 
		
		For ($_l_Index; 1; $_l_MessageCount)
			Case of 
				: (<>Web_t_ServerHandler="ITK")
					//$_t_Message:=ITK_RcvIPCMsg (◊IWS_l_ClientTestChannel))ITK OUT AUgust 2009
				: (<>Web_t_ServerHandler="NTK")
					IPC Receive(<>IWS_l_ClientTestChannel; $_t_Message)
				Else 
					
			End case 
			
			
			IWS_t_ProcessName:=STR_Param($_t_Message; 1)
			$_l_BytesReceived:=Num:C11(STR_Param($_t_Message; 2))
			IWS_t_URL:=STR_Param($_t_Message; 3)
			$_l_MessageNumber:=Num:C11(STR_Param($_t_Message; 4))
			$_l_IndexRow:=UTI_ArraySearch(->IWS_at_ProcessName; ->IWS_t_ProcessName)
			If ($_l_IndexRow>0)
				IWS_al_PagesReceived{$_l_IndexRow}:=IWS_al_PagesReceived{$_l_IndexRow}+1
				IWS_al_BytesReceived{$_l_IndexRow}:=IWS_al_BytesReceived{$_l_IndexRow}+$_l_BytesReceived
				<>IWS_l_PagesReceived:=<>IWS_l_PagesReceived+1
				<>IWS_r_BytesReceived:=<>IWS_r_BytesReceived+$_l_BytesReceived
			End if 
			$_l_IndexRow:=UTI_ArraySearch(-><>IWS_at_TestPages; ->IWS_t_URL)
			If ($_l_IndexRow>0)
				$_al_PageRequests{$_l_IndexRow}:=$_al_PageRequests{$_l_IndexRow}+1
				$_al_TotalPageMS{$_l_IndexRow}:=$_al_TotalPageMS{$_l_IndexRow}+$_l_MessageNumber
				<>IWS_al_LastMS{$_l_IndexRow}:=$_l_MessageNumber
				<>IWS_al_Ms{$_l_IndexRow}:=$_al_TotalPageMS{$_l_IndexRow}\$_al_PageRequests{$_l_IndexRow}
			End if 
			
		End for 
		
		For ($_l_Index; 1; <>IWS_l_TestClients)
			
			If (Process state:C330($_al_ProcessNumber{$_l_Index})>=0)
				$_bo_AllFinished:=False:C215
			End if 
		End for 
		
		DISPLAY RECORD:C105([WEBSETUP_4D:129])
		// DIALOG([Websetup_4D];"WebTestProgress_d")  ` Axel
	End while 
	ON EVENT CALL:C190("")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
End if 
//End if
//End if

// <>IWS_ti_TestDoc:=Create document("Test Client Log "+String(Tickcount))
ARRAY TEXT:C222(<>IWS_at_TestPages; 0)

ARRAY LONGINT:C221(<>IWS_al_LastMS; 0)
ARRAY LONGINT:C221(<>IWS_al_Ms; 0)

ARRAY TEXT:C222(IWS_at_ProcessName; 0)
ARRAY LONGINT:C221(IWS_al_PagesReceived; 0)
ARRAY LONGINT:C221(IWS_al_BytesReceived; 0)

<>IWS_StartTestClientsProc:=0
CLOSE WINDOW:C154
//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_StartTestClients"; $_t_oldMethodName)