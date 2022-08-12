//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_StockLevels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2010 10:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Delete; $_bo_OK; $0; DB_bo_NotFound)
	C_LONGINT:C283($_l_GiveUp)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode)
	C_TIME:C306($_ti_CutOff)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_StockLevels")
$0:=False:C215

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockLevelsUpdate")
		
		//| ([PROCESSES_TO_HANDLE]ServiceType="Updatestocklevel")
		If ([PROCESSES_TO_HANDLE:115]ServiceType:6="Updatestocklevel")
			//TRACE
		End if 
		
		If ([PROCESSES_TO_HANDLE:115]RecordNumber:7>0)
			$_l_GiveUp:=0
			Repeat   //dont do anything till the record exists... its still being created
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				If (Records in selection:C76([STOCK_LEVELS:58])=0)
					$_bo_OK:=False:C215  //Test semaphore("NoINDEXING")
					DelayTicks(4)
					If (Not:C34($_bo_OK))
						$_l_GiveUp:=$_l_GiveUp+1
					End if 
				End if 
			Until ((Records in selection:C76([STOCK_LEVELS:58])>0) | (<>SYS_bo_QuitCalled) | ($_l_GiveUp>100))
			If ($_l_GiveUp<100)
				$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
				While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
					DelayTicks(2)
				End while 
				READ WRITE:C146([STOCK_LEVELS:58])
				While (Not:C34(Check_Locked(->[STOCK_LEVELS:58]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					LOAD RECORD:C52([STOCK_LEVELS:58])
					DelayTicks(4)
				End while 
				
				STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10; [STOCK_LEVELS:58]Product_Code:1; [STOCK_LEVELS:58]Currency_Code:8; [STOCK_LEVELS:58]Analysis_Code:7; [STOCK_LEVELS:58]Layer_Code:9; [STOCK_LEVELS:58]Stock_Type:2)
				
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				READ ONLY:C145([STOCK_LEVELS:58])
				$0:=True:C214
				
				CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
			Else 
				$_bo_Delete:=False:C215
				If ([PROCESSES_TO_HANDLE:115]DateCreated:4=Current date:C33(*))
					$_ti_CutOff:=(Current time:C178*1)-(60*60)
					If ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_CutOff)
						$_bo_Delete:=True:C214
					End if 
				Else 
					If (Current time:C178>?01:00:00?)
						$_bo_Delete:=True:C214
					End if 
				End if 
				If ($_bo_Delete)
					DB_bo_NotFound:=False:C215
					$0:=False:C215
				Else 
					DB_bo_NotFound:=True:C214
					$0:=False:C215
				End if 
			End if 
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
		Else 
			$0:=True:C214
		End if 
		
		
		
		
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Check Level")
		If ([PROCESSES_TO_HANDLE:115]RecordNumber:7>0)
			READ ONLY:C145([STOCK_LEVELS:58])
			READ ONLY:C145([CURRENT_STOCK:62])
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			
			$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
			While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
				DelayTicks(2)
			End while 
			
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
			READ WRITE:C146([STOCK_LEVELS:58])
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			While (Not:C34(Check_Locked(->[STOCK_LEVELS:58]; 0)))
				DelayTicks(2)
			End while 
			STK_ValidateLevel
			//STOCK_AutoLevel ([STOCK LEVELS]Product Code;-([STOCK LEVELS]XREC_ID);[STOCK LEVELS]Currency Code;[STOCK LEVELS]Layer Code;[STOCK LEVELS]Stock Type;[STOCK LEVELS]Analysis Code)
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
			READ ONLY:C145([STOCK_LEVELS:58])
			CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
			$0:=True:C214
		Else 
			$0:=True:C214
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCurrentSt@") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="Updatestocklevel")
		If ([PROCESSES_TO_HANDLE:115]ServiceType:6="Updatestocklevel")
			[PROCESSES_TO_HANDLE:115]TableNumber:1:=62
			SAVE RECORD:C53([PROCESSES_TO_HANDLE:115])
			$0:=ProcessService_Currentstock
		Else 
			[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
			
			SAVE RECORD:C53([PROCESSES_TO_HANDLE:115])
			$0:=ProcessService_StockItems
		End if 
		
		
	Else 
		//TRACE
End case 
ERR_MethodTrackerReturn("ProcessService_StockLevels"; $_t_oldMethodName)
