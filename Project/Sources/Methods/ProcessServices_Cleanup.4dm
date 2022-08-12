//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessServices_Cleanup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Deletions; $1)
	C_LONGINT:C283($_l_CountUsers; $_l_LastQuery; $_l_RecordsinTable; $_l_Repeats)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_Cleanup")
// ProcessServices_Cleanup
// Deletes things that have been succesfully handled
// 08/05/02 pb
If (Count parameters:C259>=1)
	$_bo_Deletions:=$1
Else 
	$_bo_Deletions:=False:C215
End if 
$_l_RecordsinTable:=Records in table:C83([PROCESSES_TO_HANDLE:115])
If (Application type:C494=4D Server:K5:6)
	$_l_CountUsers:=Count users:C342-1
Else 
	$_l_CountUsers:=0
End if 

If ($_l_RecordsinTable>1000) | ($_l_CountUsers<1)
	START_SEMAPHORE("ProcessesToHandleQueue2")
	START_SEMAPHORE("ProcessesToHandleQueue")  //bsw 91104
	Stop_Semaphore("ProcessesToHandleQueue2")
	$_l_Repeats:=0
	READ WRITE:C146([PROCESSES_TO_HANDLE:115])
	
	QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)  // handled
	$_l_LastQuery:=Records in selection:C76([PROCESSES_TO_HANDLE:115])
	While ((Records in selection:C76([PROCESSES_TO_HANDLE:115])>0) & (Not:C34(<>SYS_bo_QuitCalled)))
		REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 250)
		DELETE SELECTION:C66([PROCESSES_TO_HANDLE:115])
		FLUSH CACHE:C297
		DelayTicks(60)  // just so we don't hog the processor
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)
		
		$_l_Repeats:=$_l_Repeats+1
		If ($_l_Repeats>10) & ($_l_LastQuery=Records in selection:C76([PROCESSES_TO_HANDLE:115]))
			REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 0)
		End if 
		$_l_LastQuery:=Records in selection:C76([PROCESSES_TO_HANDLE:115])
		
	End while 
	
	REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 0)
	READ ONLY:C145([PROCESSES_TO_HANDLE:115])
	
	If (($_bo_Deletions) & (Not:C34(<>SYS_bo_QuitCalled)))
		//ProcessService_DeleteDuplicates
	End if 
	
	Stop_Semaphore("ProcessesToHandleQueue")  //bsw 91104
	
End if 
ERR_MethodTrackerReturn("ProcessServices_Cleanup"; $_t_oldMethodName)
