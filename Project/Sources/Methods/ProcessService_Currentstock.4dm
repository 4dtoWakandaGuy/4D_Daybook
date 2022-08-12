//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Currentstock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2010 08:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Delete; $_bo_Ok; $0; DB_bo_NotFound)
	C_LONGINT:C283($_l_GiveUp; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_CutOffTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Currentstock")
Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockLevelValidate") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateStockLevel")
		//May 2011 replacing calls to this with a direct call to
		//TRACE
		
		$_l_GiveUp:=0
		$_l_Retries:=0
		Repeat   //dont do anything till the record exists... its still being created
			$_l_Retries:=$_l_Retries+1
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				$_bo_Ok:=False:C215  //Test semaphore("NoINDEXING")
				DelayTicks(4*$_l_Retries)
				If (Not:C34($_bo_Ok))
					$_l_GiveUp:=$_l_GiveUp+1
				End if 
			End if 
			If ([PROCESSES_TO_HANDLE:115]RecordNumber:7=0)
				$_l_GiveUp:=1000
			End if 
		Until ((Records in selection:C76([CURRENT_STOCK:62])>0) | (<>SYS_bo_QuitCalled) | ($_l_GiveUp>100))
		If ($_l_GiveUp<100)
			$_l_Retries:=0
			While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(4*$_l_Retries)
			End while 
			
			STK_PostUpdateCSLevel([CURRENT_STOCK:62]X_ID:13)
			$0:=True:C214
		Else 
			$_bo_Delete:=False:C215
			If ([PROCESSES_TO_HANDLE:115]DateCreated:4=Current date:C33(*))
				$_ti_CutOffTime:=(Current time:C178*1)-(60*60)
				If ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_CutOffTime)
					$_bo_Delete:=True:C214
				End if 
			Else 
				If (Current time:C178>?01:00:00?)
					$_bo_Delete:=True:C214
				End if 
			End if 
			If ([PROCESSES_TO_HANDLE:115]RecordNumber:7=0)
				$0:=True:C214
			Else 
				If ($_bo_Delete)
					DB_bo_NotFound:=False:C215
					$0:=False:C215
				Else 
					DB_bo_NotFound:=True:C214
					$0:=False:C215
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		
End case 
ERR_MethodTrackerReturn("ProcessService_Currentstock"; $_t_oldMethodName)