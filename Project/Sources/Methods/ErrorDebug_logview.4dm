//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 18/02/2011 09:16
	//Method Name: ErrorDebug_logview
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
C_TEXT:C284($1; <>t_ErrorDebugLog)
C_LONGINT:C283(<>Err_l_DebugLogStatus; $_l_Applicationtype; <>_l_StartupTimeLapse)
C_BOOLEAN:C305($_bo_Testing)
C_TEXT:C284($_T_MethodName; $_t_ProcessName)  // Initialize the variables
_O_C_INTEGER:C282($_l_ProcessState)
_O_C_INTEGER:C282($_l_ProcessTime; $_l_debug_processID)
C_LONGINT:C283($totalMemory; $physicalMemory; $freeMemory; $freeStack)
C_LONGINT:C283($_l_DebugProcess)
If (<>Err_l_DebugLogStatus=0)
	$_l_Applicationtype:=Application type:C494  //optimize functions as this method is called from everywhere
	$_bo_Testing:=Test path name:C476(Get 4D folder:C485+"db_testing.txt")=Is a document:K24:1
	If (Not:C34($_bo_Testing))
		$_bo_Testing:=Test path name:C476(Get 4D folder:C485+"db_testing")=Is a document:K24:1
	End if 
	If ($_bo_Testing)
		<>Err_l_DebugLogStatus:=10  //Logging is turned on by a file
	Else 
		<>Err_l_DebugLogStatus:=-10
	End if 
Else 
	
End if 

If (Count parameters:C259>1)
	If ((<>Err_l_DebugLogStatus>0) & ($_l_Applicationtype#4D Server:K5:6))
		$_T_MethodName:=$1
		PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		While (Semaphore:C143("$ErrorDebugger"))
			DelayTicks(3)
		End while 
		C_LONGINT:C283($totalMemory; $physicalMemory; $freeMemory; $freeStack)
		
		//AP AVAILABLE MEMORY ($totalMemory;$physicalMemory;$freeMemory;$freeStack)
		<>t_ErrorDebugLog:=String:C10(Current time:C178)+" | "+$_t_ProcessName+Char:C90(Tab:K15:37)+" | "+$_T_MethodName+" | "+String:C10($freeStack)+Char:C90(13)+<>t_ErrorDebugLog
		If (<>Err_l_DebugLogStatus>1)
			SET TEXT TO PASTEBOARD:C523(<>t_ErrorDebugLog)
		End if 
		C_LONGINT:C283($_l_DebugProcess)
		$_l_DebugProcess:=New process:C317("ErrorDebugLogWindow"; 128*1024; "Error-DebugLog-Window"; *)  //set to 64 26/03/08, kmw
		POST OUTSIDE CALL:C329($_l_DebugProcess)
		CLEAR SEMAPHORE:C144("$ErrorDebugger")
		If (<>Err_l_DebugLogStatus>9) & (Not:C34($_bo_Testing))
			<>Err_l_DebugLogStatus:=0  //Logging was turned on by a file
		End if 
	End if 
End if 