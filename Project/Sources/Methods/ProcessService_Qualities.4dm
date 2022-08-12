//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Qualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 06:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Qualities")
//ProcessService_Qualities
// 16/04/02 pb
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateSet")
		If ([PROCESSES_TO_HANDLE:115]Data4Boolean:11)
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10; [PROCESSES_TO_HANDLE:115]Data4Boolean:11)
		Else 
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10)
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateSet2")
		If ([PROCESSES_TO_HANDLE:115]Data4Boolean:11)
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10; [PROCESSES_TO_HANDLE:115]Data4Boolean:11; 2)
		Else 
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10; False:C215; 2)
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateSet3")
		If ([PROCESSES_TO_HANDLE:115]Data4Boolean:11)
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10; [PROCESSES_TO_HANDLE:115]Data4Boolean:11; 3)
		Else 
			$0:=QV_UpdateSet([PROCESSES_TO_HANDLE:115]Data1Longint:8; [PROCESSES_TO_HANDLE:115]Data2Longint:9; [PROCESSES_TO_HANDLE:115]Data3Longint:10; False:C215; 3)
		End if 
End case 

UNLOAD RECORD:C212([INFORMATION:55])
UNLOAD RECORD:C212([COMPANIES:2])
UNLOAD RECORD:C212([USER_SETS:105])
ERR_MethodTrackerReturn("ProcessService_Qualities"; $_t_oldMethodName)
