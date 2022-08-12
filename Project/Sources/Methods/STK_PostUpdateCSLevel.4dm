//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PostUpdateCSLevel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     17/05/2011 16:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; <>SYS_bo_QuitCalled; $_bo_Continue; $_bo_OK; CSStockLevelCompleted; STK_bo_SLCreate)
	C_LONGINT:C283($_l_GiveUp; $_l_Process; $_l_RecordsinSelection; $_l_Retries)
	C_REAL:C285($1; CSStockLevelID)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PostUpdateCSLevel")
$_l_GiveUp:=0
If ([CURRENT_STOCK:62]X_ID:13#$1)
	$_l_Retries:=0
	Repeat   //dont do anything till the record exists... its still being created
		$_l_Retries:=$_l_Retries+1
		If ([CURRENT_STOCK:62]X_ID:13#$1)
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$1)
		End if 
		If (Records in selection:C76([CURRENT_STOCK:62])=0)
			$_bo_OK:=False:C215  //Test semaphore("NoINDEXING")  `This semaphore is set if we are in a transaction. dont give up if there is a transaction still runningx
			DelayTicks(9*$_l_Retries)
			If (Not:C34($_bo_OK))
				$_l_GiveUp:=$_l_GiveUp+1
			End if 
		End if 
		If ($1=0)
			$_l_GiveUp:=1000
		End if 
	Until ((Records in selection:C76([CURRENT_STOCK:62])>0) | (<>SYS_bo_QuitCalled) | ($_l_GiveUp>100))
End if 
If ($_l_GiveUp<100)
	//
	$_bo_Continue:=STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)
	If ($_bo_Continue)
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(4*$_l_Retries)
		End while 
		
		If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
			$_l_Retries:=0
			While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			READ ONLY:C145([STOCK_LEVELS:58])
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
			If (<>StockAnal)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
			End if 
			QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
			
			$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
			
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
				If ($_l_RecordsinSelection>0)
					If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency) | ([CURRENT_STOCK:62]Currency_Code:11="")
						If ($_l_RecordsinSelection=1)
							If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
							QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
						End if 
					Else 
						If ($_l_RecordsinSelection=1)
							If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
						End if 
					End if 
					$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
				End if 
			End if 
			$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
				If ($_l_RecordsinSelection>0)
					If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
						If ($_l_RecordsinSelection=1)
							If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
							QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
						End if 
					Else 
						If ($_l_RecordsinSelection=1)
							If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
								REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							End if 
						Else 
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
						End if 
					End if 
					$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
				End if 
			End if 
			If (Records in selection:C76([STOCK_LEVELS:58])=0)
				CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
				CSStockLevelCompleted:=False:C215
				$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 512000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
				PAUSE PROCESS:C319(Current process:C322)
				$_l_Retries:=0
				While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
					$_l_Retries:=$_l_Retries+1
					If (Not:C34(CSStockLevelCompleted))
						$_t_ProcessName:=Process_Name($_l_Process)
						If ($_t_ProcessName="Create New Stock Level Record")
							DelayTicks((1*$_l_Retries)*60)
						Else 
							$_l_Process:=0
						End if 
					Else 
						SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
					End if 
				End while 
				//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
				DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)  //use this to avoid a recursive call
				$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "ValidateStockLevel"; CSStockLevelID)
				$_l_Retries:=0
				While (Process state:C330($_l_Process)>0) & (Process_Name($_l_Process)="ValidateStockLevel")
					$_l_Retries:=$_l_Retries+1
					DelayTicks(10*$_l_Retries)
				End while 
			Else 
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
				ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)  //use this to avoid a recursive call
				CSStockLevelID:=[CURRENT_STOCK:62]x_Stock_Level_ID:15
				$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "ValidateStockLevel"; CSStockLevelID)
				$_l_Retries:=0
				While (Process state:C330($_l_Process)>0) & (Process_Name($_l_Process)="ValidateStockLevel")
					$_l_Retries:=$_l_Retries+1
					DelayTicks(10*$_l_Retries)
				End while 
			End if 
			CLEAR SEMAPHORE:C144("StockLevel"+[CURRENT_STOCK:62]Product_Code:1)
		Else 
			QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
			If (Records in selection:C76([STOCK_LEVELS:58])=0)
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=0
				DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)
				$_l_Retries:=0
				While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
					
				End while 
				READ ONLY:C145([STOCK_LEVELS:58])
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
				If (<>StockAnal)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
				End if 
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
				
				$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
				
				If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
					If ($_l_RecordsinSelection>0)
						If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency) | ([CURRENT_STOCK:62]Currency_Code:11="")
							If ($_l_RecordsinSelection=1)
								If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
								QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
							End if 
						Else 
							If ($_l_RecordsinSelection=1)
								If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
							End if 
						End if 
						$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
					End if 
				End if 
				$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
				If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
					If ($_l_RecordsinSelection>0)
						If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
							If ($_l_RecordsinSelection=1)
								If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
								QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
							End if 
						Else 
							If ($_l_RecordsinSelection=1)
								If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
							End if 
						End if 
						$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
					End if 
				End if 
				If (Records in selection:C76([STOCK_LEVELS:58])=0)
					CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
					CSStockLevelCompleted:=False:C215
					$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
					
					PAUSE PROCESS:C319(Current process:C322)
					
					$_l_Retries:=0
					While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
						If (Not:C34(CSStockLevelCompleted))
							$_l_Retries:=$_l_Retries+1
							$_t_ProcessName:=Process_Name($_l_Process)
							If ($_t_ProcessName="Create New Stock Level Record")
								DelayTicks(1*60)
							Else 
								$_l_Process:=0
							End if 
						Else 
							SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
						End if 
					End while 
					//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
					[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
					UNLOAD RECORD:C212([STOCK_LEVELS:58])
					DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)  //use this to avoid a recursive call
					$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "ValidateStockLevel"; CSStockLevelID)
					$_l_Retries:=0
					While (Process state:C330($_l_Process)>0) & (Process_Name($_l_Process)="ValidateStockLevel")
						$_l_Retries:=$_l_Retries+1
						DelayTicks(10*$_l_Retries)
					End while 
				Else 
					[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
					//ProcessServices_CreateRecord (->[STOCK LEVELS];->[STOCK LEVELS]XREC_ID;"StockLevelsUpdate";[STOCK LEVELS]XREC_ID)
					UNLOAD RECORD:C212([STOCK_LEVELS:58])
					DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)  //use this to avoid a recursive call
					CSStockLevelID:=[CURRENT_STOCK:62]x_Stock_Level_ID:15
					$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "ValidateStockLevel"; CSStockLevelID)
					$_l_Retries:=0
					While (Process state:C330($_l_Process)>0) & (Process_Name($_l_Process)="ValidateStockLevel")
						$_l_Retries:=$_l_Retries+1
						DelayTicks(10*$_l_Retries)
					End while 
				End if 
				CLEAR SEMAPHORE:C144("StockLevel"+[CURRENT_STOCK:62]Product_Code:1)
			Else 
				CSStockLevelID:=[CURRENT_STOCK:62]x_Stock_Level_ID:15
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				$_l_Process:=New process:C317("STK_UpdateStockLevels"; 128000; "ValidateStockLevel"; CSStockLevelID)
				$_l_Retries:=0
				While (Process state:C330($_l_Process)>0) & (Process_Name($_l_Process)="ValidateStockLevel")
					$_l_Retries:=$_l_Retries+1
					DelayTicks(10*$_l_Retries)
				End while 
			End if 
			
		End if 
	End if 
Else 
	
	
End if 
UNLOAD RECORD:C212([STOCK_LEVELS:58])
ERR_MethodTrackerReturn("STK_PostUpdateCSLevel"; $_t_oldMethodName)
