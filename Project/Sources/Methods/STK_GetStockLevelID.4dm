//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetStockLevelID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/05/2011 13:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; $_bo_ReadOnlyState; CSStockLevelCompleted; STK_bo_CalledFromCSTrigger; STK_bo_SLCreate)
	C_LONGINT:C283($_l_Process; $_l_RecordsInSelection; $_l_Retries; $_l_SelectedRecordNumber; $_l_SOItemNumber; $_l_waiting)
	C_REAL:C285($0; $3; CSStockLevelID)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_LocationCode; $_t_oldMethodName; $_t_ProcessName; $_t_productCode; $_t_StockType; $1; $2)
	C_TEXT:C284($4; $5; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetStockLevelID")
If (Count parameters:C259>=7)
	$_t_productCode:=$1
	$_t_StockType:=$2
	$_l_SOItemNumber:=$3
	$_t_AnalysisCode:=$4
	$_t_LayerCode:=$5
	$_t_CurrencyCode:=$6
	$_t_LocationCode:=$7
	
	$_l_waiting:=0
	While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
		$_l_waiting:=$_l_waiting+1
		
		//GOTO XY(0;4)
		//message("Waiting for semaphore"+("StockLevel"+$_t_productCode))
		
		DelayTicks(9*$_l_waiting)
	End while 
	$_bo_ReadOnlyState:=Read only state:C362([STOCK_LEVELS:58])
	If (Records in selection:C76([STOCK_LEVELS:58])>0)
		CREATE SET:C116([STOCK_LEVELS:58]; "$When")
		$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_LEVELS:58])
	Else 
		CREATE EMPTY SET:C140([STOCK_LEVELS:58]; "$When")
		$_l_SelectedRecordNumber:=-1
	End if 
	If (Not:C34($_bo_ReadOnlyState))
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
	End if 
	READ ONLY:C145([STOCK_LEVELS:58])
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_productCode; *)
	If (<>StockAnal)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode; *)
	End if 
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType)
	
	$_l_RecordsInSelection:=Records in selection:C76([STOCK_LEVELS:58])
	
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
		If ($_l_RecordsInSelection>0)
			If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
				If ($_l_RecordsInSelection=1)
					If (([STOCK_LEVELS:58]Currency_Code:8#<>SYS_t_BaseCurrency) & ([STOCK_LEVELS:58]Currency_Code:8#""))
						REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
					End if 
				Else 
					QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=<>SYS_t_BaseCurrency; *)
					QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
				End if 
			Else 
				If ($_l_RecordsInSelection=1)
					If ([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode)
						REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
					End if 
				Else 
					QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
				End if 
			End if 
			$_l_RecordsInSelection:=Records in selection:C76([STOCK_LEVELS:58])
		End if 
	End if 
	$_l_RecordsInSelection:=Records in selection:C76([STOCK_LEVELS:58])
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
		If ($_l_RecordsInSelection>0)
			If ($_t_LayerCode=DB_GetLedgerActualLayer)
				If ($_l_RecordsInSelection=1)
					If (([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode) & ($_t_LayerCode#""))
						REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
					End if 
				Else 
					QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
					QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
				End if 
			Else 
				If ($_l_RecordsInSelection=1)
					If ([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode)
						REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
					End if 
				Else 
					QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
				End if 
			End if 
			$_l_RecordsInSelection:=Records in selection:C76([STOCK_LEVELS:58])
		End if 
	End if 
	If (Records in selection:C76([STOCK_LEVELS:58])=0)
		If (Not:C34(STK_bo_CalledFromCSTrigger))
			CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
		Else 
			CSStockLevelID:=0
		End if 
		
		//CSStockLevelID:=AA_GetNextID (->[STOCK_LEVELS]XREC_ID)
		//If (Process_Name (Current process)="STK_SETID")
		//GOTO XY(0;4)
		//message("Id obtained")
		//End if
		CSStockLevelCompleted:=False:C215
		$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; $_t_productCode; $_t_AnalysisCode; $_t_LayerCode; $_t_StockType; $_t_CurrencyCode; Current process:C322)
		DelayTicks(30)
		
		
		$_l_Retries:=0
		While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
			If (Not:C34(CSStockLevelCompleted))
				If (Not:C34(CSStockLevelCompleted))
					
					//GOTO XY(0;4)
					//message("Waiting for process"+String($_l_Process))
					
					
					$_t_ProcessName:=Process_Name($_l_Process)
					$_l_Retries:=$_l_Retries+1
					If ($_t_ProcessName="Create New Stock Level Record") & (Process state:C330($_l_Process)>=0)
						DelayTicks(30*$_l_Retries)
					Else 
						$_l_Process:=0
					End if 
				End if 
			Else 
				SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
			End if 
		End while 
		//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
		$0:=CSStockLevelID
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
		CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
		
		//GOTO XY(0;4)
		//message("Creating Process Service Record")
		
		ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		
	Else 
		$0:=[STOCK_LEVELS:58]X_ID:10
		CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
		
		//GOTO XY(0;4)
		//message("Creating Process Service Record")
		
		ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		
		
	End if 
	
	//GOTO XY(0;4)
	//message("Clearing Semaphore StockLevel"+$_t_productCode)
	
	CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
	If ($_bo_ReadOnlyState=False:C215)
		READ WRITE:C146([STOCK_LEVELS:58])
	End if 
	USE SET:C118("$When")
	If ($_l_SelectedRecordNumber>0)
		GOTO SELECTED RECORD:C245([STOCK_LEVELS:58]; $_l_SelectedRecordNumber)
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetStockLevelID"; $_t_oldMethodName)
