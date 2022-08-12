//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Shutdown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_StreamListenMS;0)
	//ARRAY LONGINT(<>IWS_al_StreamListens;0)
	C_BOOLEAN:C305(<>IWS_bo_GetUserInfo; <>IWS_bo_Shutdown; $_bo_Continue; $_bo_ProcessVisible)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_TaskIndex; $_r_TicksWaiting)
	C_TEXT:C284(<>IWS_t_CloserProcess; <>IWS_t_HandlerProcess; <>IWS_t_LogProcess; <>IWS_t_MasterProcess; <>IWS_t_UserInfoProcess; $_t_Message; $_t_oldMethodName; $_t_ProcessName)
	C_TIME:C306(<>IWS_ti_ConnectDoc; <>IWS_ti_Doc; <>IWS_ti_StreamDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Shutdown")
//******************************************************************************
//
//Method: IWS_Shutdown
//
//Written by  John on 17/11/98
//
//Purpose: shuts down web server
//
//$1 - type -purpose
//
// b17 LNH 19990626 - Changed timeout to 1 minute, rather than 500 iterations
//     - through loop
//******************************************************************************
//LOG_SetMethod ("IWS_Shutdown")


//MSG_Send ("Shutting down web server...")
// start shutdown
<>IWS_bo_Shutdown:=True:C214  // issue general shutdown
//LGS_LogicServer ("WebServer";"STOP")  `Ron 12/23/99

POST OUTSIDE CALL:C329(Process number:C372(<>IWS_t_LogProcess))  //it will cancel itself

// wait for master
//MSG_Send ("Waiting for master process to end...")
While (Process state:C330(Process number:C372(<>IWS_t_MasterProcess))>=0)
	DelayTicks(2)
End while 

//MSG_Send ("Waiting for handler processes to end...")
//LOG_SendRemote ("Initiating termination of handler processes..")
//$count inserted by Rollo 11/10/98 cos it DOES go wrong on my Mac
//$count:=1
$_r_TicksWaiting:=Tickcount:C458
Repeat 
	$_bo_Continue:=True:C214
	For ($_l_TaskIndex; 1; Count tasks:C335)
		PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
		If (($_t_ProcessName=(<>IWS_t_HandlerProcess+"@"))) & ($_l_ProcessState>=Executing:K13:4)  // | ($_t_ProcessName=(SQL_s_HandlerProcess+"@"))
			RESUME PROCESS:C320(Process number:C372($_t_ProcessName))  //in case it was PAUSEd
			$_bo_Continue:=False:C215
			$_l_TaskIndex:=Count tasks:C335+1
		End if 
		IDLE:C311
	End for 
	IDLE:C311
	//$count:=$count+1
Until (($_bo_Continue) | (Tickcount:C458-$_r_TicksWaiting>(60*60)))  //($count>500))`Timeout after 1 minute
//MSG_Send ("Waiting for load informer process to end...")
RESUME PROCESS:C320(Process number:C372("$LoadInformer"))

//LOG_SendRemote ("Terminating closer process...")
//MSG_Send ("Waiting for closer process to end...")
RESUME PROCESS:C320(Process number:C372(<>IWS_t_CloserProcess))
$_l_TaskIndex:=1
While ((Process state:C330(Process number:C372(<>IWS_t_CloserProcess))>=0) & ($_l_TaskIndex<1000))
	DelayTicks(2)
	$_l_TaskIndex:=$_l_TaskIndex+1
End while 


If (<>IWS_bo_GetUserInfo)  //only need to do this if the db is set to get user info
	//  MSG_Send ("Waiting for user info process to end...")
	RESUME PROCESS:C320(Process number:C372(<>IWS_t_UserInfoProcess))
	$_l_TaskIndex:=1
	While ((Process state:C330(Process number:C372(<>IWS_t_UserInfoProcess))>=0) & ($_l_TaskIndex<1000))
		DelayTicks(2)
		$_l_TaskIndex:=$_l_TaskIndex+1
	End while 
End if 

//MSG_Send ("Waiting for email process to end...")
RESUME PROCESS:C320(Process number:C372("$MailQueue"))  //allow mailer to finish

//LOG_SendRemote ("Terminating checker process...")
//MSG_Send ("Waiting for checker process to end...")
DelayTicks(0)  //allow checker to clear out as well
//LOG_SendRemote ("Terminating SQL master process...")
//MSG_Send ("Waiting for SQL master process to end...")
//RESUME PROCESS(Process number(SQL_s_MasterProcess))
//$_l_TaskIndex:=1
//While ((Process state(Process number(SQL_s_MasterProcess))>=0) & ($_l_TaskIndex<1000))
//  RESUME PROCESS(Process number(SQL_s_MasterProcess))
//  Delayticks(2)
//  $_l_TaskIndex:=$_l_TaskIndex+1
//End while

$_l_TaskIndex:=1
While ((Process state:C330(Process number:C372("$Client Monitor"))>=0) & ($_l_TaskIndex<1000))
	DelayTicks(2)
	$_l_TaskIndex:=$_l_TaskIndex+1
End while 

$_l_TaskIndex:=1
While ((Process state:C330(Process number:C372("$Notifier"))>=0) & ($_l_TaskIndex<1000))
	DelayTicks(2)
	$_l_TaskIndex:=$_l_TaskIndex+1
End while 

//clear out these variables
If (<>IWS_ti_Doc#?00:00:00?)
	IWS_SendToLog("Closing down web server"; True:C214)  //Flush remaining messages
	CLOSE DOCUMENT:C267(<>IWS_ti_Doc)
	<>IWS_ti_Doc:=?00:00:00?
End if 
If (<>IWS_ti_ConnectDoc#?00:00:00?)
	CLOSE DOCUMENT:C267(<>IWS_ti_ConnectDoc)
	<>IWS_ti_ConnectDoc:=?00:00:00?
End if 
If (<>IWS_ti_StreamDoc#?00:00:00?)
	UTI_ArrayClear(-><>IWS_al_StreamListens; -><>IWS_al_StreamListenMS)
	
	CLOSE DOCUMENT:C267(<>IWS_ti_StreamDoc)
End if 
//MSG_Send ("Server stopped")
//MSG_HideWindow

//LOG_SendRemote ("Web server stopped")
Compiler_IWS_IA  //this is not good here!!!!!

//Compiler_SQL_IA
//***JOHN changed by Rollo 10/21/98
//This messed up John's routines, since they're not restarted
CLOSE WINDOW:C154

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_Shutdown"; $_t_oldMethodName)