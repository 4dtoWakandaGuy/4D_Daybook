//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Personnel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 00:08`Method: ProcessService_Personnel
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

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Personnel")
//ProcessService_Personnel
// 16/04/02 pb
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="CheckUsers")
		PW_CHECKUSERS
		$0:=True:C214
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="ChangePW")
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		
		PW_CHANGEPW
		$0:=True:C214
End case 
ERR_MethodTrackerReturn("ProcessService_Personnel"; $_t_oldMethodName)
