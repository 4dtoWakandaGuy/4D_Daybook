//%attributes = {}
If (False:C215)
	//Project Method Name:
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 11:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_TransactionIDS; 0)
	ARRAY LONGINT:C221($_al_TransactionIDs2; 0)
	ARRAY REAL:C219($_ar_PostedAmounts; 0)
	ARRAY REAL:C219($_ar_PostedAmounts2; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	ARRAY TEXT:C222($_at_PeriodCodes2; 0)
	ARRAY TEXT:C222($_at_PeriodsCodes; 0)
	ARRAY TEXT:C222($_at_PeriodsCodes2; 0)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_Create; $_bo_OK; $_bo_Update)
	C_LONGINT:C283($_l_BatchNumber; $_l_Check; $_l_DelayAmount; $_l_Index; $_l_Index2; $_l_OtherSideID; $_l_RecordsInSelection; $_l_RepeatsCount; $_l_Retries; $_l_TransactionID; $_l_TransactionsIndex)
	C_REAL:C285($_r_Amount; $_r_Balance; $_r_NotPL; $_r_SubBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_AutoPostBFProfit")
//Before running this method make sure all the figures are posted to the P&L YTD
// for this analysis(see ACC_AutoPostBFProfit)
//This method will not test if the figures are correct
READ WRITE:C146([ACCOUNT_BALANCES:34])
If (Count parameters:C259>=4)
	$_t_AnalysisCode:=$2
	$_t_LayerCode:=$3
	$_t_CurrencyCode:=$4
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$1; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerProfitACC; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_AnalysisCode; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
	If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
		QUERY:C277([ACCOUNT_BALANCES:34])
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
	Else 
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
	End if 
	$_r_Balance:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)
	
	$_r_NotPL:=0  //to count back in manual posting to P&LBFWD in this period
	$_r_SubBalance:=0
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=$1; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerBroughtforwardACC; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode; *)
	QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode; *)
	If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
		QUERY:C277([TRANSACTIONS:29])
		If (Records in selection:C76([TRANSACTIONS:29])>0)
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode; *)
			QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
		End if 
		
	Else 
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
	End if 
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		//Need to check these are not manual postings to P&L
		CREATE SET:C116([TRANSACTIONS:29]; "$tTemp")
		
		For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
			USE SET:C118("$tTemp")
			GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_TransactionsIndex)
			$_l_TransactionID:=[TRANSACTIONS:29]Transaction_ID:31
			If ([TRANSACTIONS:29]Transaction_OtherSideID:32>0)
				$_l_TransactionID:=[TRANSACTIONS:29]Transaction_ID:31
				$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_OtherSideID)
				If ([TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
					$_r_NotPL:=$_r_NotPL+[TRANSACTIONS:29]Total:17
				End if 
			Else 
				If (Records in selection:C76([TRANSACTION_BATCHES:30])=0)
					$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
					//The batch does not exist
					//    so we have to do a pseudo batch
					//First Check the transactions match
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerBroughtforwardACC)
					CREATE SET:C116([TRANSACTIONS:29]; "TOCHECK")
					$_l_RecordsInSelection:=Records in selection:C76([TRANSACTIONS:29])
					//`````
					For ($_l_Index; 1; $_l_RecordsInSelection)
						USE SET:C118("TOCHECK")
						GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
						If ([TRANSACTIONS:29]Transaction_ID:31=0)
							READ WRITE:C146([TRANSACTIONS:29])
							$_bo_OK:=False:C215
							$_l_RepeatsCount:=0
							$_l_DelayAmount:=1
							Repeat 
								$_l_RepeatsCount:=$_l_RepeatsCount+1
								$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 0)
								If (Not:C34($_bo_OK))
									If (($_l_RepeatsCount/10)=(Int:C8($_l_RepeatsCount/10)))
										//only increase every 10 tries
										$_l_DelayAmount:=$_l_DelayAmount+1  //increase the delay factor by 1
									End if 
									DelayTicks(2*$_l_DelayAmount)
								End if 
							Until ($_bo_OK=True:C214)
							
							[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
							$_l_Retries:=0
							While (Semaphore:C143("TRANSACTIONUPDATE"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*(1+$_l_Retries))
							End while 
							<>TransactionDisableValidation:=True:C214
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							DB_SaveRecord(->[TRANSACTIONS:29])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
							
							<>TransactionDisableValidation:=False:C215
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
							UNLOAD RECORD:C212([TRANSACTIONS:29])
							READ ONLY:C145([TRANSACTIONS:29])
							USE SET:C118("TOCHECK")
							GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
						End if 
					End for 
					ARRAY REAL:C219($_ar_PostedAmounts; 0)
					ARRAY LONGINT:C221($_al_TransactionIDS; 0)
					ARRAY TEXT:C222($_at_PeriodCodes; 0)
					
					ARRAY REAL:C219($_ar_PostedAmounts2; 0)
					ARRAY LONGINT:C221($_al_TransactionIDs2; 0)
					ARRAY TEXT:C222($_at_PeriodCodes2; 0)
					//````
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Amount:6; $_ar_PostedAmounts; [TRANSACTIONS:29]Transaction_ID:31; $_al_TransactionIDS; [TRANSACTIONS:29]Period_Code:12; $_at_PeriodsCodes)
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7#$_l_BatchNumber; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerBroughtforwardACC)
					CREATE SET:C116([TRANSACTIONS:29]; "TOCHECK")
					$_l_RecordsInSelection:=Records in selection:C76([TRANSACTIONS:29])
					//`````
					For ($_l_Index; 1; $_l_RecordsInSelection)
						USE SET:C118("TOCHECK")
						GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
						If ([TRANSACTIONS:29]Transaction_ID:31=0)
							READ WRITE:C146([TRANSACTIONS:29])
							Repeat 
								
								$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
								If (Not:C34($_bo_OK))
									DelayTicks
								End if 
							Until ($_bo_OK)
							[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
							$_l_Retries:=0
							While (Semaphore:C143("TRANSACTIONUPDATE"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*(1+$_l_Retries))
							End while 
							<>TransactionDisableValidation:=True:C214
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							DB_SaveRecord(->[TRANSACTIONS:29])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
							
							<>TransactionDisableValidation:=False:C215
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
							UNLOAD RECORD:C212([TRANSACTIONS:29])
							READ ONLY:C145([TRANSACTIONS:29])
							USE SET:C118("TOCHECK")
							GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
							
						End if 
					End for 
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Amount:6; $_ar_PostedAmounts2; [TRANSACTIONS:29]Transaction_ID:31; $_al_TransactionIDs2; [TRANSACTIONS:29]Period_Code:12; $_at_PeriodsCodes2)
					For ($_l_Check; 1; Size of array:C274($_ar_PostedAmounts))
						If ($_al_TransactionIDS{$_l_Check}=$_l_TransactionID)
							$_r_Amount:=-$_ar_PostedAmounts{$_l_Check}
							For ($_l_Index2; 1; Size of array:C274($_ar_PostedAmounts2))
								If ($_ar_PostedAmounts2{$_l_Index2}=$_r_Amount) & ($_at_PeriodsCodes2{$_l_Index2}=$_at_PeriodsCodes{$_l_Check})
									If ([TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
										$_r_NotPL:=$_r_NotPL+[TRANSACTIONS:29]Total:17
									End if 
									
									$_l_Index2:=999999
									$_l_Check:=999999
								End if 
								
							End for 
							
							
						End if 
					End for 
					
					
				Else 
					$_r_SubBalance:=$_r_SubBalance+ACC_ReportCheckBatch([TRANSACTIONS:29]Batch_Number:7; [TRANSACTIONS:29]BatchItem_X_ID:30; [TRANSACTIONS:29]Total:17)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
					$_l_OtherSideID:=[TRANSACTIONS:29]Transaction_OtherSideID:32
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_OtherSideID)
					If ([TRANSACTIONS:29]Account_Code:3#DB_GetLedgerProfitACC)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_TransactionID)
						$_r_NotPL:=$_r_NotPL+[TRANSACTIONS:29]Total:17
					End if 
				End if 
				
			End if 
			
		End for 
	End if 
	
	
	$_r_Balance:=$_r_Balance+$_r_NotPL  //the P&L BFWD Gets this added on
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerBroughtforwardACC; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$1; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_AnalysisCode; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
	If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
		QUERY:C277([ACCOUNT_BALANCES:34])
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
	Else 
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
	End if 
	$_bo_Update:=True:C214
	$_bo_Create:=False:C215
	If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
		$_bo_Create:=True:C214
		While (Semaphore:C143("UPDATEBALANCE"+DB_GetLedgerBroughtforwardACC))
			DelayTicks
		End while 
		//Need to check a posting was not made across multiple analysis codes
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerBroughtforwardACC; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$1; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
		
		If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
			QUERY:C277([ACCOUNT_BALANCES:34])
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
		Else 
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
		End if 
		$_bo_Update:=True:C214
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			[ACCOUNT_BALANCES:34]Balance:3:=0
			DB_SaveRecord(->[ACCOUNT_BALANCES:34])
		End if 
		CLEAR SEMAPHORE:C144("UPDATEBALANCE"+DB_GetLedgerBroughtforwardACC)
		
	End if 
	$_l_Retries:=0
	While (Semaphore:C143("UPDATEBALANCE"+DB_GetLedgerBroughtforwardACC))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	If ($_bo_Create)
		If ($_r_Balance#0)
			CREATE RECORD:C68([ACCOUNT_BALANCES:34])
			[ACCOUNT_BALANCES:34]Account_Code:2:=DB_GetLedgerBroughtforwardACC
			[ACCOUNT_BALANCES:34]Analysis_Code:1:=$_t_AnalysisCode
			[ACCOUNT_BALANCES:34]Currency_Code:6:=$_t_CurrencyCode
			[ACCOUNT_BALANCES:34]Layer_Code:5:=$_t_LayerCode
			[ACCOUNT_BALANCES:34]Period_Code:4:=$1
			[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1
			DB_SaveRecord(->[ACCOUNT_BALANCES:34])
		Else 
			$_bo_Update:=False:C215
		End if 
		
	End if 
	
	
	
	
	If ($_bo_Update)
		[ACCOUNT_BALANCES:34]Balance:3:=$_r_Balance
		
		DB_SaveRecord(->[ACCOUNT_BALANCES:34])
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$1; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerProfitACC; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_AnalysisCode; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=$_t_LayerCode; *)
		If ($_t_CurrencyCode=<>SYS_t_BaseCurrency) | ($_t_CurrencyCode="")
			QUERY:C277([ACCOUNT_BALANCES:34])
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode; *)
			QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
		Else 
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=$_t_CurrencyCode)
		End if 
		Case of 
			: (Records in selection:C76([ACCOUNT_BALANCES:34])=1)
				[ACCOUNT_BALANCES:34]Balance:3:=0
				DB_SaveRecord(->[ACCOUNT_BALANCES:34])
			: (Records in selection:C76([ACCOUNT_BALANCES:34])>1)
				APPLY TO SELECTION:C70([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Balance:3:=0)
			Else 
				
		End case 
	End if 
	CLEAR SEMAPHORE:C144("UPDATEBALANCE"+DB_GetLedgerBroughtforwardACC)
End if 
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
ERR_MethodTrackerReturn("ACC_AutoPostBFProfit"; $_t_oldMethodName)