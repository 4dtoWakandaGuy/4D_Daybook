//%attributes = {}

If (False:C215)
	//Project Method Name:      ProcessServices_CreateRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>STK_AL_UpCallingProcess;0)
	//ARRAY LONGINT(<>STK_AL_UpstockID;0)
	//ARRAY LONGINT(<>STK_AL_UpStocktable;0)
	ARRAY LONGINT:C221($_AL_AutoAllocateOI; 0)
	ARRAY LONGINT:C221($_al_RemoveFromItemIDS; 0)
	ARRAY REAL:C219($_ar_AutoAllocateQuantity; 0)
	//ARRAY TEXT(<>STK_At_UpCallFUnction;0)
	C_BLOB:C604($_blb_DataBLOB)
	C_BOOLEAN:C305(<>ProcessToRun; <>STK_bo_UpStocktableintited; $_bo_Boolean1; $_bo_Continue; $_bo_ProcessVisible; $_bo_ReuseProcessedRecord; $_bo_SemaphoreStarted; $_bo_SHowMessages; $7; PS_bo_ShowMessages)
	C_LONGINT:C283(<>DB_l_ProcessServerCreator; <>PER_l_CurLoggedinDataOwnerID; <>STK_l_LocalProcessService; $_l_ApplicationType; $_l_Holding; $_l_Index; $_l_Longint1; $_l_Longint2; $_l_Longint3; $_l_offset; $_l_Process)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_RecordNumber; $_l_RecordNumber2; $_l_Retries; $_l_SelectedRecordNumber; $_l_TableNumber; $_l_TimeTaken; $_l_UniqueProcessID; PS_l_RecordID; STK_l_PSCallingProcess)
	C_POINTER:C301($1; $2; $8)
	C_REAL:C285($_r_MSecondsNOW2; $4; $5; $6)
	C_TEXT:C284($_t_BlobasText; $_t_oldMethodName; $_t_ProcessName; $_t_ServiceName; $3; DB_t_Methodname; STK_t_ProcessMessage)
	C_TIME:C306(<>STK_ti_DocumentReference; $_ti_DocumentRef; $_ti_Time; $_ti_Time2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_CreateRecord")



$_ti_Time:=Current time:C178
$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_CreateRecord")

If (PS_bo_ShowMessages)
	$_bo_SHowMessages:=True:C214
End if 
PS_bo_ShowMessages:=False:C215
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 1")
	$_ti_DocumentRef:=<>STK_ti_DocumentReference
	$_ti_Time2:=Current time:C178
	$_l_TimeTaken:=$_ti_Time2-$_ti_Time
	
	SEND PACKET:C103($_ti_DocumentRef; "Time taken at start of process"+String:C10($_l_TimeTaken)+Char:C90(13))
	$_ti_Time:=Current time:C178
	
End if 

DB_t_Methodname:=Current method name:C684
//ProcessServices_CreateRecord
//16/4/02 pb
//may be called from any trigger
//Parameters:$1=pointer to the table
//$2=pointer to the record number field
//$3=the type of process to run
//$4=(optional)data to save-longint
//$5=(optional)data to save-longint
//$6=(optional)data to save-longint
//$7=(optional)data to save-Boolean
//$8=(optional)data to save-blob--can be any no. of
//variables. This must be passed as a pointer.
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 2")
End if 
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 3")
End if 
$_bo_Continue:=True:C214
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 4")
End if 
$_l_ApplicationType:=Application type:C494
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 5")
End if 
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 6")
End if 

$_r_MSecondsNOW2:=0
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 7")
End if 
STK_t_ProcessMessage:=""
If (Not:C34(<>STK_bo_UpStocktableintited))
	ARRAY LONGINT:C221(<>STK_AL_UpStocktable; 0)
	ARRAY LONGINT:C221(<>STK_AL_UpstockID; 0)
	ARRAY LONGINT:C221(<>STK_AL_UpCallingProcess; 0)
	ARRAY TEXT:C222(<>STK_At_UpCallFUnction; 0)
	<>STK_bo_UpStocktableintited:=True:C214
End if 
If ($_bo_SHowMessages)
	GOTO XY:C161(0; 0)
	MESSAGE:C88("ProcessServices_CreateRecord 8")
End if 
If (In transaction:C397) | (STK_l_PSCallingProcess>0)
	If ($_bo_SHowMessages)
		SEND PACKET:C103($_ti_DocumentRef; "IN TRANSACTION"+Char:C90(13))
	End if 
	If ($_bo_SHowMessages)
		GOTO XY:C161(0; 0)
		MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 9")
	End if 
	//`Open window(120;Screen height-400;220;Screen height-200;-Palette window )
	//`GOTO XY(0;0)
	//`MESSAGE("Process Record Handler")
	If (Count parameters:C259>=3)
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 10")
		End if 
		
		$_t_ProcessName:=Process_Name(Current process:C322)
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 10")
		End if 
		If (Count parameters:C259>=3) & ($_t_ProcessName#"Create Process Record") & ($_l_ApplicationType#4D Server:K5:6) & ($_t_ProcessName#"SP for Table@") & ($_t_ProcessName#"Validate Stock") & ($_t_ProcessName#"ValidateCalledoff") & ($_t_ProcessName#"Setup Stock") & ($_t_ProcessName#"Verify Stock")
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 11")
			End if 
			
			
			
			
			
			Case of 
				: ($3="StockUpdateCS")
					$_l_Retries:=0
					While (Semaphore:C143("L_LockCSArrays"))
						//GOTO XY(0;0)
						//MESSAGE("waiting for Semaphore(L_LockCSArrays)"+"Tries"+String($_l_Retries))
						$_l_Retries:=$_l_Retries+$_l_Retries
						DelayTicks(9*$_l_Retries)
					End while 
					$_r_MSecondsNOW2:=Milliseconds:C459
					$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
					If (<>STK_l_LocalProcessService#$_l_Process)
						<>STK_l_LocalProcessService:=$_l_Process
						DelayTicks(60)
					Else 
						RESUME PROCESS:C320($_l_Process)
					End if 
					
					
					APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
					APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
					If (STK_l_PSCallingProcess>0)
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -STK_l_PSCallingProcess)
					Else 
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -(Current process:C322))
					End if 
					$_l_Retries:=0
					RESUME PROCESS:C320($_l_Process)
					CLEAR SEMAPHORE:C144("L_LockCSArrays")
					$_bo_Continue:=True:C214
					//MESSAGE("8")
					
				: ($3="StockUpdateCurrentStock")
					$_l_Retries:=0
					While (Semaphore:C143("L_LockCSArrays"))
						$_l_Retries:=$_l_Retries+$_l_Retries
						DelayTicks(9*$_l_Retries)
					End while 
					$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
					If (<>STK_l_LocalProcessService#$_l_Process)
						<>STK_l_LocalProcessService:=$_l_Process
						DelayTicks(60)
					Else 
						RESUME PROCESS:C320($_l_Process)
					End if 
					APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[CURRENT_STOCK:62]))
					APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
					APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
					If (STK_l_PSCallingProcess>0)
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -STK_l_PSCallingProcess)
					Else 
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -(Current process:C322))
					End if 
					RESUME PROCESS:C320($_l_Process)
					CLEAR SEMAPHORE:C144("L_LockCSArrays")
					$_bo_Continue:=True:C214
				: ($3="UpdateStockLevel")
					$_l_Retries:=0
					While (Semaphore:C143("L_LockCSArrays"))
						$_l_Retries:=$_l_Retries+$_l_Retries
						DelayTicks(9*$_l_Retries)
					End while 
					$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
					If (<>STK_l_LocalProcessService#$_l_Process)
						<>STK_l_LocalProcessService:=$_l_Process
						DelayTicks(60)
					Else 
						RESUME PROCESS:C320($_l_Process)
					End if 
					APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_LEVELS:58]))
					APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
					APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
					If (STK_l_PSCallingProcess>0)
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -STK_l_PSCallingProcess)
					Else 
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -(Current process:C322))
					End if 
					RESUME PROCESS:C320($_l_Process)
					CLEAR SEMAPHORE:C144("L_LockCSArrays")
					$_bo_Continue:=True:C214
				: ($3="StockLevelsUpdate")
					$_l_Retries:=0
					While (Semaphore:C143("L_LockCSArrays"))
						$_l_Retries:=$_l_Retries+$_l_Retries
						DelayTicks(9*$_l_Retries)
					End while 
					$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
					If (<>STK_l_LocalProcessService#$_l_Process)
						<>STK_l_LocalProcessService:=$_l_Process
						DelayTicks(60)
					Else 
						RESUME PROCESS:C320($_l_Process)
					End if 
					APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_LEVELS:58]))
					APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $4)
					APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
					If (STK_l_PSCallingProcess>0)
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -STK_l_PSCallingProcess)
					Else 
						APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; -(Current process:C322))
					End if 
					RESUME PROCESS:C320($_l_Process)
					CLEAR SEMAPHORE:C144("L_LockCSArrays")
					$_bo_Continue:=True:C214
				Else 
					$_bo_Continue:=True:C214
					If ($_bo_SHowMessages)
						GOTO XY:C161(0; 0)
						MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 12")
						$_ti_Time2:=Current time:C178
						$_l_TimeTaken:=$_ti_Time2-$_ti_Time
						
						SEND PACKET:C103($_ti_DocumentRef; "Time To Point of $_bo_Continue(1)"+String:C10($_l_TimeTaken)+Char:C90(13))
						$_ti_Time:=Current time:C178
						
					End if 
			End case 
		Else 
			$_bo_Continue:=True:C214
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("ProcessServices_CreateRecord In Transaction or(STK_l_PSCallingProcess>0) 13")
				$_ti_Time2:=Current time:C178
				$_l_TimeTaken:=$_ti_Time2-$_ti_Time
				
				SEND PACKET:C103($_ti_DocumentRef; "Time To Point of $_bo_Continue(2)"+String:C10($_l_TimeTaken)+Char:C90(13))
				$_ti_Time:=Current time:C178
				
			End if 
		End if 
		$_r_MSecondsNOW2:=Milliseconds:C459
		If ($_bo_Continue)
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("14")
			End if 
			
			$_l_TableNumber:=Table:C252($1)
			$_l_RecordNumber:=$2->
			If ($_l_RecordNumber=0)
				If (PS_l_RecordID>0)
					$_l_RecordNumber:=PS_l_RecordID
					
				End if 
			End if 
			PS_l_RecordID:=0
			$_t_ServiceName:=$3
			If (Count parameters:C259>=4)
				$_l_Longint1:=$4
			Else 
				$_l_Longint1:=0
			End if 
			If (Count parameters:C259>=5)
				$_l_Longint2:=$5
			Else 
				$_l_Longint2:=0
			End if 
			If (Count parameters:C259>=6)
				$_l_Longint3:=$6
			Else 
				$_l_Longint3:=0
			End if 
			If (Count parameters:C259>=7)
				$_bo_Boolean1:=$7
			Else 
				$_bo_Boolean1:=False:C215
			End if 
			If (Count parameters:C259>=8)
				$_t_BlobasText:=BLOB to text:C555($8->; Mac text without length:K22:10)
				
			Else 
				$_t_BlobasText:=""
				
			End if 
			//TRACE
			//GOTO XY(0;0)
			//MESSAGE("Process Record Handler-Create Record")
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("14")
			End if 
			While (Semaphore:C143("protectServiceCreatorVar"))
				DelayTicks(2)
			End while 
			
			If (<>DB_l_ProcessServerCreator=0)
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("15-a")
				End if 
				
				<>DB_l_ProcessServerCreator:=New process:C317("ProcessServices_CreateFromTrans"; 256000; "Create Process Record"; $_l_TableNumber; $_l_RecordNumber; $_t_ServiceName; $_l_Longint1; $_l_Longint2; $_l_Longint3; $_bo_Boolean1; $_t_BlobasText)
			Else 
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("15-b")
				End if 
				$_l_Holding:=0
				While (Semaphore:C143("PSBusy"))
					If ($_bo_SHowMessages)
						GOTO XY:C161(0; 0)
						MESSAGE:C88("14-"+String:C10($_l_Holding))
						
					End if 
					$_l_Holding:=$_l_Holding+1
					
					DelayTicks(2)
				End while 
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_TableNumber; $_l_TableNumber)
				
				
				//TRACE
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_t_ServiceName; $_t_ServiceName)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long1; $_l_Longint1)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long2; $_l_Longint2)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long3; $_l_Longint3)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_bo_Boolean1; $_bo_Boolean1)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_t_BlobasText; $_t_BlobasText)
				SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_RecordID; $_l_RecordNumber)
				
				RESUME PROCESS:C320(<>DB_l_ProcessServerCreator)
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("15")
				End if 
				
				CLEAR SEMAPHORE:C144("PSBusy")
				
				
				
				
			End if 
			CLEAR SEMAPHORE:C144("protectServiceCreatorVar")
			
			
		End if 
	End if 
	
	
Else 
	If ($_bo_SHowMessages)
		GOTO XY:C161(0; 0)
		MESSAGE:C88("9-not in transaction")
		
		SEND PACKET:C103($_ti_DocumentRef; "NOT IN TRANSACTON"+String:C10($_l_TimeTaken)+Char:C90(13))
		
	End if 
	$_t_ProcessName:=Process_Name(Current process:C322)
	If (Count parameters:C259>=3) & ($_t_ProcessName#"Create Process Record") & ($_l_ApplicationType#4D Server:K5:6) & ($_t_ProcessName#"SP for Table@") & ($_t_ProcessName#"Validate Stock") & ($_t_ProcessName#"ValidateCalledoff")
		
		
		
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("10")
		End if 
		
		
		Case of 
			: ($3="StockUpdateCS")
				$_l_Retries:=0
				While (Semaphore:C143("L_LockCSArrays"))
					$_l_Retries:=$_l_Retries+$_l_Retries
					DelayTicks(9*$_l_Retries)
				End while 
				$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
				If (<>STK_l_LocalProcessService#$_l_Process)
					<>STK_l_LocalProcessService:=$_l_Process
					DelayTicks(60)
				Else 
					RESUME PROCESS:C320($_l_Process)
				End if 
				
				APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
				APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
				APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; Current process:C322)
				RESUME PROCESS:C320($_l_Process)
				CLEAR SEMAPHORE:C144("L_LockCSArrays")
				$_bo_Continue:=True:C214
			: ($3="StockUpdateCurrentStock")
				$_l_Retries:=0
				While (Semaphore:C143("L_LockCSArrays"))
					$_l_Retries:=$_l_Retries+$_l_Retries
					DelayTicks(9*$_l_Retries)
				End while 
				$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
				If (<>STK_l_LocalProcessService#$_l_Process)
					<>STK_l_LocalProcessService:=$_l_Process
					DelayTicks(60)
				Else 
					RESUME PROCESS:C320($_l_Process)
				End if 
				APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[CURRENT_STOCK:62]))
				APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
				APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
				APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; Current process:C322)
				RESUME PROCESS:C320($_l_Process)
				CLEAR SEMAPHORE:C144("L_LockCSArrays")
				$_bo_Continue:=True:C214
			: ($3="UpdateStockLevel")
				$_l_Retries:=0
				While (Semaphore:C143("L_LockCSArrays"))
					$_l_Retries:=$_l_Retries+$_l_Retries
					DelayTicks(9*$_l_Retries)
				End while 
				$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
				If (<>STK_l_LocalProcessService#$_l_Process)
					<>STK_l_LocalProcessService:=$_l_Process
					DelayTicks(60)
				Else 
					RESUME PROCESS:C320($_l_Process)
				End if 
				<>STK_l_LocalProcessService:=$_l_Process
				APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_LEVELS:58]))
				APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $5)
				APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
				APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; Current process:C322)
				RESUME PROCESS:C320($_l_Process)
				CLEAR SEMAPHORE:C144("L_LockCSArrays")
				$_bo_Continue:=True:C214
			: ($3="StockLevelsUpdate")
				$_l_Retries:=0
				While (Semaphore:C143("L_LockCSArrays"))
					DelayTicks(9*$_l_Retries)
				End while 
				$_l_Process:=New process:C317("STK_LocalProcessServices"; 128000; "Validate Stock"; *)
				If (<>STK_l_LocalProcessService#$_l_Process)
					<>STK_l_LocalProcessService:=$_l_Process
					DelayTicks(60)
				Else 
					RESUME PROCESS:C320($_l_Process)
				End if 
				
				APPEND TO ARRAY:C911(<>STK_AL_UpStocktable; Table:C252(->[STOCK_LEVELS:58]))
				APPEND TO ARRAY:C911(<>STK_AL_UpstockID; $4)
				APPEND TO ARRAY:C911(<>STK_At_UpCallFUnction; $3)
				APPEND TO ARRAY:C911(<>STK_AL_UpCallingProcess; Current process:C322)
				RESUME PROCESS:C320($_l_Process)
				CLEAR SEMAPHORE:C144("L_LockCSArrays")
				$_bo_Continue:=True:C214
			Else 
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("11")
					$_ti_Time2:=Current time:C178
					$_l_TimeTaken:=$_ti_Time2-$_ti_Time
					
					SEND PACKET:C103($_ti_DocumentRef; "Time To Point of $_bo_Continue(3)"+String:C10($_l_TimeTaken)+Char:C90(13))
					$_ti_Time:=Current time:C178
					
				End if 
				$_bo_Continue:=True:C214
		End case 
	Else 
		$_bo_Continue:=True:C214
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("11")
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			SEND PACKET:C103($_ti_DocumentRef; "Time To Point of $_bo_Continue(4)"+String:C10($_l_TimeTaken)+Char:C90(13))
			$_ti_Time:=Current time:C178
			
		End if 
	End if 
	If ($_bo_Continue)
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("12")
		End if 
		$_ti_Time2:=Current time:C178
		$_l_TimeTaken:=$_ti_Time2-$_ti_Time
		
		If ($_bo_SHowMessages)
			SEND PACKET:C103($_ti_DocumentRef; "Time to Get selected Record number"+String:C10($_l_TimeTaken)+Char:C90(13))
		End if 
		$_ti_Time:=Current time:C178
		
		$_l_SelectedRecordNumber:=Selected record number:C246([PROCESSES_TO_HANDLE:115])  //added 08/3/7-kmw
		$_ti_Time2:=Current time:C178
		$_l_TimeTaken:=$_ti_Time2-$_ti_Time
		
		If ($_bo_SHowMessages)
			SEND PACKET:C103($_ti_DocumentRef; "Time to Copy named selection"+String:C10($_l_TimeTaken)+Char:C90(13))
		End if 
		$_ti_Time:=Current time:C178
		
		COPY NAMED SELECTION:C331([PROCESSES_TO_HANDLE:115]; "Processes_To_Handle")  //added 08/3/7-kmw
		If ($_bo_SHowMessages)
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			SEND PACKET:C103($_ti_DocumentRef; "Time to Get selected Record number"+String:C10($_l_TimeTaken)+Char:C90(13))
			$_ti_Time:=Current time:C178
		End if 
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("13")
		End if 
		
		
		START_SEMAPHORE("Processes_To_HandleQueue2")
		$_ti_Time2:=Current time:C178
		$_l_TimeTaken:=$_ti_Time2-$_ti_Time
		
		If ($_bo_SHowMessages)
			SEND PACKET:C103($_ti_DocumentRef; "Time taken to Start_Semaphore(1)"+String:C10($_l_TimeTaken)+Char:C90(13))
		End if 
		$_ti_Time:=Current time:C178
		
		
		$_bo_ReuseProcessedRecord:=(Not:C34(Test semaphore:C652("Processes_To_HandleQueue")))  //bsw 91104
		
		
		//TRACE
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("14")
		End if 
		
		$_bo_SemaphoreStarted:=False:C215
		If ($_bo_ReuseProcessedRecord)
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("15")
			End if 
			$_bo_SemaphoreStarted:=True:C214
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Time to start of set semaphore 2-reuse record"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			
			START_SEMAPHORE("Processes_To_HandleQueue")  //bsw 91104
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Time taken to Start_Semaphore 2-reuse record"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("16")
				
			End if 
		End if 
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("17")
		End if 
		Stop_Semaphore("Processes_To_HandleQueue2")
		$_ti_Time2:=Current time:C178
		$_l_TimeTaken:=$_ti_Time2-$_ti_Time
		
		If ($_bo_SHowMessages)
			SEND PACKET:C103($_ti_DocumentRef; "Time to Stop_Semaphore(1)"+String:C10($_l_TimeTaken)+Char:C90(13))
		End if 
		$_ti_Time:=Current time:C178
		
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("18")
		End if 
		READ WRITE:C146([PROCESSES_TO_HANDLE:115])
		If (Not:C34($_bo_ReuseProcessedRecord))
			
			
			SET QUERY LIMIT:C395(1)
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Time at start of query"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			
			QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)  //2 status means processed record so re use record for other purpose
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Time taken for query"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			
			SET QUERY LIMIT:C395(0)
			$_bo_ReuseProcessedRecord:=(Records in selection:C76([PROCESSES_TO_HANDLE:115])=1)
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("19")
			End if 
			
		End if 
		If (Not:C34($_bo_ReuseProcessedRecord))
			CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
			[PROCESSES_TO_HANDLE:115]x_UUID:14:=Generate UUID:C1066
		Else 
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Start of load record"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			//While (Not(Check_Locked (->[PROCESSES_TO_HANDLE];1))) & ($_bo_ReuseProcessedRecord)
			
			DelayTicks(2)
			//SET QUERY LIMIT(1)
			
			QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)  //2 status means processed record so re use record for other purpose
			
			SET QUERY LIMIT:C395(0)
			$_bo_ReuseProcessedRecord:=(Records in selection:C76([PROCESSES_TO_HANDLE:115])>=1)
			If (Not:C34(Check_Locked(->[PROCESSES_TO_HANDLE:115]; 1)))
				$_bo_ReuseProcessedRecord:=False:C215
			End if 
			
			//End if
			If (Not:C34($_bo_ReuseProcessedRecord))
				CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
				[PROCESSES_TO_HANDLE:115]x_UUID:14:=Generate UUID:C1066
			End if 
			//End while
			If (Records in selection:C76([PROCESSES_TO_HANDLE:115])=0)
				CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
				[PROCESSES_TO_HANDLE:115]x_UUID:14:=Generate UUID:C1066
			End if 
			$_ti_Time2:=Current time:C178
			$_l_TimeTaken:=$_ti_Time2-$_ti_Time
			
			If ($_bo_SHowMessages)
				SEND PACKET:C103($_ti_DocumentRef; "Time taken to load/create record"+String:C10($_l_TimeTaken)+Char:C90(13))
			End if 
			$_ti_Time:=Current time:C178
			
		End if 
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("20")
		End if 
		SET BLOB SIZE:C606($_blb_DataBLOB; 0)
		[PROCESSES_TO_HANDLE:115]Comments:3:=""
		
		[PROCESSES_TO_HANDLE:115]TableNumber:1:=0
		[PROCESSES_TO_HANDLE:115]Status:2:=0
		[PROCESSES_TO_HANDLE:115]DateCreated:4:=!00-00-00!
		[PROCESSES_TO_HANDLE:115]TimeCreated:5:=?00:00:00?
		[PROCESSES_TO_HANDLE:115]ServiceType:6:=""
		
		[PROCESSES_TO_HANDLE:115]RecordNumber:7:=0
		[PROCESSES_TO_HANDLE:115]Data1Longint:8:=0
		[PROCESSES_TO_HANDLE:115]Data2Longint:9:=0
		[PROCESSES_TO_HANDLE:115]Data3Longint:10:=0
		[PROCESSES_TO_HANDLE:115]Data4Boolean:11:=False:C215
		SET BLOB SIZE:C606([PROCESSES_TO_HANDLE:115]Data5Blob:12; 0)
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("21")
		End if 
		DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
		If ($_bo_SHowMessages)
			GOTO XY:C161(0; 0)
			MESSAGE:C88("22")
		End if 
		If (Count parameters:C259>=3)
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("23")
				SEND PACKET:C103($_ti_DocumentRef; "Process Record re-used or created had these values before"+String:C10($_l_TimeTaken)+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; [PROCESSES_TO_HANDLE:115]x_UUID:14+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10([PROCESSES_TO_HANDLE:115]RecordNumber:7)+" "+String:C10([PROCESSES_TO_HANDLE:115]Data1Longint:8)+Char:C90(13))
				
			End if 
			DB_t_Methodname:="IN PROCESSSERVICES CREATE RECORD"
			If ($3="")
				//TRACE
			End if 
			If (GenValidatePointer($1)) & (GenValidatePointer($2))
				[PROCESSES_TO_HANDLE:115]Comments:3:=""
				
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("24")
				End if 
				
				[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252($1)
				
				[PROCESSES_TO_HANDLE:115]Status:2:=1
				[PROCESSES_TO_HANDLE:115]DateCreated:4:=Current date:C33
				[PROCESSES_TO_HANDLE:115]TimeCreated:5:=Current time:C178
				[PROCESSES_TO_HANDLE:115]ServiceType:6:=$3
				[PROCESSES_TO_HANDLE:115]RecordNumber:7:=$2->
				If ([PROCESSES_TO_HANDLE:115]RecordNumber:7=0)
					If (PS_l_RecordID>0)
						[PROCESSES_TO_HANDLE:115]RecordNumber:7:=PS_l_RecordID
					End if 
				End if 
				[PROCESSES_TO_HANDLE:115]Data1Longint:8:=0
				[PROCESSES_TO_HANDLE:115]Data2Longint:9:=0
				[PROCESSES_TO_HANDLE:115]Data3Longint:10:=0
				[PROCESSES_TO_HANDLE:115]Data4Boolean:11:=False:C215
				[PROCESSES_TO_HANDLE:115]Data5Blob:12:=$_blb_DataBLOB
				If (Count parameters:C259>3)
					[PROCESSES_TO_HANDLE:115]Data1Longint:8:=$4
					If (Count parameters:C259>4)  //NG August 2003
						
						[PROCESSES_TO_HANDLE:115]Data2Longint:9:=$5
						If (Count parameters:C259>5)  //NG August 2003
							
							[PROCESSES_TO_HANDLE:115]Data3Longint:10:=$6
						End if 
					End if 
				End if 
				
				If (Count parameters:C259>=7)
					[PROCESSES_TO_HANDLE:115]Data4Boolean:11:=$7
				End if 
				If (Count parameters:C259>7)  //anything more, must be in a blob
					
					//If (GenValidatePointer ($8))
					
					[PROCESSES_TO_HANDLE:115]Data5Blob:12:=$8->
					//End if
				End if 
				
				If (Application type:C494#4D Server:K5:6)
					
					[PROCESSES_TO_HANDLE:115]DataOwnerID:13:=<>PER_l_CurLoggedinDataOwnerID
				End if 
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("25")
				End if 
				Case of 
					: ([PROCESSES_TO_HANDLE:115]ServiceType:6="create revision") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="AutoAllocate")
						If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[ORDERS:24]))
							[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[ORDERS:24])
							[PROCESSES_TO_HANDLE:115]Status:2:=1
						End if 
						
					: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockLevelsUpdate")
						If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[STOCK_LEVELS:58]))
							[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[STOCK_LEVELS:58])
							[PROCESSES_TO_HANDLE:115]Status:2:=1
						End if 
					: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateStockLevel")
						If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[CURRENT_STOCK:62]))
							[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[CURRENT_STOCK:62])
							[PROCESSES_TO_HANDLE:115]Status:2:=1
						End if 
					: ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCS") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="StockUpdateCurrentSt@")
						If ([PROCESSES_TO_HANDLE:115]TableNumber:1#Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							[PROCESSES_TO_HANDLE:115]TableNumber:1:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
							
							[PROCESSES_TO_HANDLE:115]Status:2:=1
						End if 
				End case 
				
				SAVE RECORD:C53([PROCESSES_TO_HANDLE:115])
				$_ti_Time2:=Current time:C178
				$_l_TimeTaken:=$_ti_Time2-$_ti_Time
				
				If ($_bo_SHowMessages)
					SEND PACKET:C103($_ti_DocumentRef; "Time taken to save"+String:C10($_l_TimeTaken)+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; [PROCESSES_TO_HANDLE:115]x_UUID:14+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; String:C10([PROCESSES_TO_HANDLE:115]RecordNumber:7)+" "+String:C10([PROCESSES_TO_HANDLE:115]Data1Longint:8)+Char:C90(13))
					ARRAY LONGINT:C221($_AL_AutoAllocateOI; 0)
					ARRAY REAL:C219($_ar_AutoAllocateQuantity; 0)
					ARRAY LONGINT:C221($_al_RemoveFromItemIDS; 0)
					$_l_offset:=0
					//These are the allocations for ONE order
					BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_AL_AutoAllocateOI; $_l_offset)
					BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_ar_AutoAllocateQuantity; $_l_offset)
					BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_al_RemoveFromItemIDS; $_l_offset)
					For ($_l_Index; 1; Size of array:C274($_AL_AutoAllocateOI))
						SEND PACKET:C103($_ti_DocumentRef; String:C10($_AL_AutoAllocateOI{$_l_Index})+" "+String:C10($_ar_AutoAllocateQuantity{$_l_Index})+" "+String:C10($_al_RemoveFromItemIDS{$_l_Index})+Char:C90(13))
					End for 
					
					
					
				End if 
				$_ti_Time:=Current time:C178
				
				
				
				UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("26")
				End if 
				
				If ($_bo_ReuseProcessedRecord)
					Stop_Semaphore("Processes_To_HandleQueue")  //bsw 91104
					If ($_bo_SHowMessages)
						GOTO XY:C161(0; 0)
						MESSAGE:C88("27")
						
					End if 
				End if 
				
				//◊ProcessToRun:=True
				PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
				If ($_l_UniqueProcessID<0)  //it is running on the server--called from a trigger
					
					<>ProcessToRun:=True:C214
				Else   //must have been called from a client
					
					//$_l_UniqueProcessID:=$_l_UniqueProcessID*-1
					SET PROCESS VARIABLE:C370(-1; <>ProcessToRun; True:C214)
				End if 
				//End if
				
				//**********************replaces below 08/3/7-kmw*********************
				USE NAMED SELECTION:C332("Processes_To_Handle")
				GOTO SELECTED RECORD:C245([PROCESSES_TO_HANDLE:115]; $_l_SelectedRecordNumber)
				CLEAR NAMED SELECTION:C333("Processes_To_Handle")
				//*****************************************************************
				If (False:C215)  //blocked out 08/3/7-kmw
					
					//************added 01/3/7-kmw-nicked from ProcessServices method*********
					$_l_RecordNumber2:=Record number:C243([PROCESSES_TO_HANDLE:115])
					If ($_l_RecordNumber#$_l_RecordNumber2)
						
						If (Not:C34(Read only state:C362([PROCESSES_TO_HANDLE:115])))  //if in read write mode then load record
							
							
							GOTO RECORD:C242([PROCESSES_TO_HANDLE:115]; $_l_RecordNumber)
							While (Not:C34(Check_Locked(->[PROCESSES_TO_HANDLE:115]; 1)))
								DelayTicks(60)
							End while 
						End if 
						
					End if 
					//**************************************************************
				End if 
			End if 
		End if 
		If ($_bo_SemaphoreStarted)
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("28")
			End if 
			Stop_Semaphore("Processes_To_HandleQueue")
			If ($_bo_SHowMessages)
				GOTO XY:C161(0; 0)
				MESSAGE:C88("29")
			End if 
		End if 
		Case of 
			: (Application type:C494=4D Server:K5:6)
				$_l_Process:=New process:C317("ProcessServices"; 128*1024; "Service Process"; *)  //12/2/03 BSW only starts if Process_Not running
				
				
				
			: (ApplicationType_isSingleUser)
				$_l_Process:=New process:C317("ProcessServices"; 128*1024; "Service Process"; *)
				
			Else 
				//Do nothing
				If ($_bo_SHowMessages)
					GOTO XY:C161(0; 0)
					MESSAGE:C88("29")
				End if 
				
				$_l_Process:=Execute on server:C373("ProcessServices"; 128*1024; "Service Process"; *)
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("ProcessServices_CreateRecord"; $_t_oldMethodName)
