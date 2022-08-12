//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ValidateBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/11/2010 19:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AccBalanceRecords; 0)
	ARRAY LONGINT:C221($_al_AccountsCrossReference; 0; 0)
	//ARRAY LONGINT(VAL_al_Sets_1;0;0)
	//ARRAY LONGINT(VAL_al_Sets_2;0;0)
	//ARRAY LONGINT(VAL_al_Sets_3;0;0)
	//ARRAY LONGINT(VAL_al_Sets_4;0;0)
	//ARRAY LONGINT(VAL_al_Sets_5;0;0)
	//ARRAY REAL(ACC_ar_Imbalances;0;0)
	ARRAY TEXT:C222($_at_ACCuniqueID; 0)
	ARRAY TEXT:C222($_at_ContructedIDS; 0)
	//ARRAY TEXT(VAL_at_AccountCodes;0)
	//ARRAY TEXT(VAL_at_AccountCodes2;0)
	//ARRAY TEXT(VAL_at_AnalysisCodes;0)
	//ARRAY TEXT(VAL_at_Checked;0)
	//ARRAY TEXT(VAL_at_CurrencyCodes;0)
	//ARRAY TEXT(VAL_at_LayerCodes;0)
	//ARRAY TEXT(VAL_at_PeriodCodes;0)
	C_BOOLEAN:C305($_bo_FixData; ACC_bo_CheckAccounts)
	C_LONGINT:C283($_l_AccountCodePosition; $_l_accountCodeRow; $_l_AnalysisCodePosition; $_l_AnalysisCodeRow; $_l_ContructedIDPosition; $_l_CurrencyCodePosition; $_l_CurrencyCodeRow; $_l_CurrentWinRefOLD; $_l_DuplicatePosition; $_l_EmptyPosition; $_l_ErrorCount)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_LayCodeRow; $_l_LayerCodePosition; $_l_LayPosition; $_l_RecordCount; $_l_RecordCountAcounts; $_l_RecordCountPeriods; $_r_Balance; ACC_l_AnalysisnoAutoat; ACC_l_CheckDuplicates)
	C_LONGINT:C283(ACC_l_CheckExistance; ACC_l_CorrectBalances; ACC_l_CreateExistance; ACC_l_DeleteDuplicates; ACC_l_layernoAutoat; ACC_l_MonthlyDetail; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($_r_imbalance; $_r_Totalimbalance)
	C_TEXT:C284($_t_alertMessage; $_t_ContructedID; $_t_oldMethodName; $_t_TaxQuery; $_t_ThisUUID; $_t_UniqueID; $_t_WinCurrentOutputForm; ACC_t_AccountEnd; ACC_t_AccountStart; ACC_t_AnalysisEnd; ACC_t_AnalysisStart)
	C_TEXT:C284(ACC_t_LayerEnd; ACC_t_LayerStart; ACC_t_PeriodEnd; ACC_t_PeriodStart; WIN_t_CurrentOutputform)
	C_TIME:C306($_ti_DocumentRef; $_ti_DocumentRef2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ValidateBalances")

//this method was replaced some while ago with the following method
$_t_WinCurrentOutputForm:=WIN_t_CurrentOutputform
Start_Process

ACC_BalFile

ARRAY TEXT:C222(VAL_at_PeriodCodes; 0)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(40; 40; 40; 40; -1984)
ACC_bo_CheckAccounts:=False:C215
DIALOG:C40([USER:15]; "ACC_BalanceCheck")
If (False:C215)  // we can turn this on if user expectation is the entering
	//a start and no end means theend should be the same as the start
	
	If (ACC_t_LayerEnd="")
		ACC_t_LayerEnd:=ACC_t_LayerStart
	End if 
	If (ACC_t_AnalysisEnd="")
		ACC_t_AnalysisEnd:=ACC_t_AnalysisStart
	End if 
	If (ACC_t_AccountEnd="")
		ACC_t_AccountEnd:=ACC_t_AccountStart
	End if 
	If (ACC_t_PeriodEnd="")
		ACC_t_PeriodEnd:=ACC_t_PeriodStart
	End if 
End if 

//the above make sure we
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (ACC_bo_CheckAccounts)
	$_ti_DocumentRef2:=DB_CreateDocument("Balance Errors"+"_"+Replace string:C233(String:C10(Current time:C178; HH MM SS:K7:1); ":"; ""); "TEXT")
	//This method will check
	//1) do all transactions have a balance to put themselves into
	//If there are missing account balances these will be created
	//remember which ones are created!!
	//this will then go through each period and REPORT
	//differences between the balance and the calculated balance.
	//for the ones that where created the balance will be updated
	//at the end the user will be asked if the want any any updated
	ARRAY TEXT:C222(VAL_at_AccountCodes; 0)
	ALL RECORDS:C47([TRANSACTIONS:29])
	If (ACC_t_AccountStart#"")
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=ACC_t_AccountStart; *)
		If (ACC_t_AccountEnd#"")
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=ACC_t_AccountEnd)
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([TRANSACTIONS:29]; "$accountMatch")
	ALL RECORDS:C47([TRANSACTIONS:29])
	If (ACC_t_LayerStart#"")
		If (ACC_l_layernoAutoat=1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23>=ACC_t_LayerStart; *)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23>=ACC_t_LayerStart+"@"; *)
		End if 
		
		If (ACC_t_LayerEnd#"")
			If (ACC_l_layernoAutoat=1)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23<=ACC_t_LayerEnd)
			Else 
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23<=ACC_t_LayerEnd+"@")
			End if 
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([TRANSACTIONS:29]; "$LayerMatch")
	ALL RECORDS:C47([TRANSACTIONS:29])
	If (ACC_t_AnalysisStart#"")
		If (ACC_l_AnalysisnoAutoat=1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2>=ACC_t_AnalysisStart; *)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2>=ACC_t_AnalysisStart+"@"; *)
		End if 
		
		If (ACC_t_AnalysisEnd#"")
			If (ACC_l_AnalysisnoAutoat=1)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2<=ACC_t_AnalysisEnd)
			Else 
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2<=ACC_t_AnalysisEnd+"@")
			End if 
			
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([TRANSACTIONS:29]; "$AnalysisMatch")
	ALL RECORDS:C47([TRANSACTIONS:29])
	If (ACC_t_PeriodStart#"")
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodStart; *)
		If (ACC_t_PeriodEnd#"")
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodEnd)
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([TRANSACTIONS:29]; "$PeriodMatch")
	INTERSECTION:C121("$AccountMatch"; "$LayerMatch"; "$accountMatch")
	INTERSECTION:C121("$AnalysisMatch"; "$AccountMatch"; "$accountMatch")
	INTERSECTION:C121("$PeriodMatch"; "$AccountMatch"; "$accountMatch")
	USE SET:C118("$accountMatch")
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(40; 50; 350; 120; -1984)
	MESSAGE:C88("Loading account Codes to check")
	If (ACC_l_CheckExistance=1)
		DISTINCT VALUES:C339([TRANSACTIONS:29]Account_Code:3; VAL_at_AccountCodes)
		For ($_l_Index; 1; Size of array:C274(VAL_at_AccountCodes))
			ERASE WINDOW:C160
			MESSAGE:C88("Checking account code: "+VAL_at_AccountCodes{$_l_Index})
			ARRAY TEXT:C222(VAL_at_Checked; 0)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=VAL_at_AccountCodes{$_l_Index})
			
			CREATE SET:C116([TRANSACTIONS:29]; "$Accmatch")
			INTERSECTION:C121("$Accmatch"; "$accountMatch"; "$Accmatch")
			USE SET:C118("$Accmatch")
			$_l_RecordCount:=Records in selection:C76([TRANSACTIONS:29])
			ARRAY TEXT:C222(VAL_at_Checked; Records in selection:C76([TRANSACTIONS:29]))
			ARRAY TEXT:C222($_at_ContructedIDS; 0)
			USE SET:C118("$Accmatch")
			DISTINCT VALUES:C339([TRANSACTIONS:29]Unique_StringIdent:28; $_at_ContructedIDS)
			
			For ($_l_Index2; 1; Size of array:C274($_at_ContructedIDS))
				ERASE WINDOW:C160
				MESSAGE:C88("Checking account code: "+VAL_at_AccountCodes{$_l_Index}+Char:C90(13))
				MESSAGE:C88("Checking Transactions"+Char:C90(13))
				$_t_ContructedID:=$_at_ContructedIDS{$_l_Index2}
				$_l_ContructedIDPosition:=Find in array:C230(VAL_at_Checked; $_t_ContructedID)
				If ($_l_ContructedIDPosition<0)
					While (Semaphore:C143("UPDATEBALANCE"+VAL_at_AccountCodes{$_l_Index}))
						DelayTicks
					End while 
					USE SET:C118("$Accmatch")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_ContructedID)
					ERASE WINDOW:C160
					MESSAGE:C88("Checking account code: "+VAL_at_AccountCodes{$_l_Index}+Char:C90(13))
					MESSAGE:C88("Checking Transactions"+Char:C90(13))
					MESSAGE:C88("Checking:"+$_t_ContructedID+Char:C90(13))
					$_l_ContructedIDPosition:=Find in array:C230(VAL_at_Checked; "")
					VAL_at_Checked{$_l_ContructedIDPosition}:=$_t_ContructedID
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=VAL_at_AccountCodes{$_l_Index}; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=[TRANSACTIONS:29]Period_Code:12; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=[TRANSACTIONS:29]Layer_Code:23; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=[TRANSACTIONS:29]Currency_Code:22)
					If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
						If (ACC_l_CreateExistance=1)
							ERASE WINDOW:C160
							MESSAGE:C88("Checking account code: "+VAL_at_AccountCodes{$_l_Index}+Char:C90(13))
							MESSAGE:C88("Checking Transactions"+Char:C90(13))
							MESSAGE:C88("Checking:"+$_t_ContructedID+Char:C90(13))
							MESSAGE:C88(Char:C90(13)+"Creating new account balance record")
							CREATE RECORD:C68([ACCOUNT_BALANCES:34])
							[ACCOUNT_BALANCES:34]Analysis_Code:1:=[TRANSACTIONS:29]Analysis_Code:2
							[ACCOUNT_BALANCES:34]Account_Code:2:=VAL_at_AccountCodes{$_l_Index}
							[ACCOUNT_BALANCES:34]Period_Code:4:=[TRANSACTIONS:29]Period_Code:12
							[ACCOUNT_BALANCES:34]Layer_Code:5:=[TRANSACTIONS:29]Layer_Code:23
							[ACCOUNT_BALANCES:34]Currency_Code:6:=[TRANSACTIONS:29]Currency_Code:22
							Case of 
								: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
									$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
									$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerVatInputACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueID; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
								: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC)
									$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
									QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
									$_r_Balance:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
									QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueID)
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
								Else 
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=[ACCOUNT_BALANCES:34]Unique_StringIdent:8)
									$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
									If (Records in selection:C76([TRANSACTIONS:29])>0)
										$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									End if 
							End case 
							If (ACC_l_CorrectBalances=1)
								[ACCOUNT_BALANCES:34]Balance:3:=$_r_Balance
							End if 
							//and report it here
							SEND PACKET:C103($_ti_DocumentRef2; "Created missing balance"+[ACCOUNT_BALANCES:34]Account_Code:2+Char:C90(9)+[ACCOUNT_BALANCES:34]Unique_StringIdent:8+Char:C90(13))
							
							DB_SaveRecord(->[ACCOUNT_BALANCES:34])
							AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
							//and report it here
							
						Else 
							//just report it
							SEND PACKET:C103($_ti_DocumentRef2; "Missing balance"+VAL_at_Checked{$_l_ContructedIDPosition}+"NOT CREATED"+Char:C90(13))
							
						End if 
						
					End if 
					CLEAR SEMAPHORE:C144("UPDATEBALANCE"+VAL_at_AccountCodes{$_l_Index})
					
				End if 
				
			End for 
		End for 
	End if 
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	//````
	If (ACC_t_AccountStart#"")
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2>=ACC_t_AccountStart; *)
		If (ACC_t_AccountEnd#"")
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2<=ACC_t_AccountEnd)
		Else 
			QUERY:C277([ACCOUNT_BALANCES:34])
		End if 
	End if 
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$accountMatch")
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	If (ACC_t_LayerStart#"")
		If (ACC_l_layernoAutoat=1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23>=ACC_t_LayerStart; *)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23>=ACC_t_LayerStart+"@"; *)
		End if 
		
		If (ACC_t_LayerEnd#"")
			If (ACC_l_layernoAutoat=1)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23<=ACC_t_LayerEnd)
			Else 
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23<=ACC_t_LayerEnd+"@")
			End if 
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$LayerMatch")
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	If (ACC_t_AnalysisStart#"")
		If (ACC_l_AnalysisnoAutoat=1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2>=ACC_t_AnalysisStart; *)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2>=ACC_t_AnalysisStart+"@"; *)
		End if 
		
		If (ACC_t_AnalysisEnd#"")
			If (ACC_l_AnalysisnoAutoat=1)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2<=ACC_t_AnalysisEnd)
			Else 
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2<=ACC_t_AnalysisEnd+"@")
			End if 
			
		Else 
			QUERY:C277([TRANSACTIONS:29])
		End if 
	End if 
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$AnalysisMatch")
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	If (ACC_t_PeriodStart#"")
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodStart; *)
		If (ACC_t_PeriodEnd#"")
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=ACC_t_PeriodEnd)
		Else 
			QUERY:C277([ACCOUNT_BALANCES:34])
		End if 
	End if 
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$PeriodMatch")
	INTERSECTION:C121("$AccountMatch"; "$LayerMatch"; "$accountMatch")
	INTERSECTION:C121("$AnalysisMatch"; "$AccountMatch"; "$accountMatch")
	INTERSECTION:C121("$PeriodMatch"; "$AccountMatch"; "$accountMatch")
	USE SET:C118("$accountMatch")
	
	If (ACC_l_CheckDuplicates=1)
		USE SET:C118("$accountMatch")
		
		//`````
		SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Unique_StringIdent:8; $_at_ACCuniqueID)
		SORT ARRAY:C229($_at_ACCuniqueID)
		For ($_l_Index; 1; Size of array:C274($_at_ACCuniqueID))
			$_t_ThisUUID:=$_at_ACCuniqueID{$_l_Index}
			If ($_t_ThisUUID="")
				READ WRITE:C146([ACCOUNT_BALANCES:34])
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8="")
				For ($_l_Index; 1; Records in selection:C76([ACCOUNT_BALANCES:34]))
					[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=ACC_Buildunique([ACCOUNT_BALANCES:34]Account_Code:2; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
					DB_SaveRecord(->[ACCOUNT_BALANCES:34])
				End for 
				USE SET:C118("$accountMatch")
				
				//`````
				SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Unique_StringIdent:8; $_at_ACCuniqueID)
				SORT ARRAY:C229($_at_ACCuniqueID)
				$_t_ThisUUID:=$_at_ACCuniqueID{$_l_Index}
			End if 
			$_l_DuplicatePosition:=Find in array:C230($_at_ACCuniqueID; $_t_ThisUUID; $_l_Index+1)
			If ($_l_DuplicatePosition>0)
				If (ACC_l_DeleteDuplicates=1)
					//report it and...
					SEND PACKET:C103($_ti_DocumentRef2; "Deleted Duplicate balances for:"+$_t_ThisUUID+Char:C90(13))
					
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$_t_ThisUUID)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Dups")
					
					ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Balance:3; <)
					If ([ACCOUNT_BALANCES:34]Balance:3>0)
						REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 1)
					Else 
						ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Balance:3; >)
						REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 1)
					End if 
					
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Keep")
					DIFFERENCE:C122("Dups"; "Keep"; "Dups")
					USE SET:C118("Dups")
					DELETE SELECTION:C66([ACCOUNT_BALANCES:34])
				Else 
					//just report it
					SEND PACKET:C103($_ti_DocumentRef2; "Duplicate balances for:"+$_t_ThisUUID+" NOT DELETED"+Char:C90(13))
					
				End if 
				
			End if 
		End for 
	End if 
	
	
	$_bo_FixData:=False:C215
	If (ACC_l_CorrectBalances=1)
		$_bo_FixData:=True:C214
	End if 
	
	//now all transactions have a balance to put them selves into
	$_l_RecordCountAcounts:=Records in table:C83([ACCOUNTS:32])+1
	$_l_RecordCountPeriods:=Records in table:C83([PERIODS:33])+1
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "ALLBAL")
	ALL RECORDS:C47([PERIODS:33])
	If (ACC_t_PeriodStart#"")
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_t_PeriodStart; *)
		If (ACC_t_PeriodEnd#"")
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]Period_Code:1<=ACC_t_PeriodEnd)
		Else 
			QUERY:C277([PERIODS:33])
		End if 
	End if 
	SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; VAL_at_PeriodCodes)
	ALL RECORDS:C47([ACCOUNTS:32])
	ARRAY REAL:C219(ACC_ar_Imbalances; 0; 0)
	If (ACC_t_AccountStart#"")
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2>=ACC_t_AccountStart; *)
		If (ACC_t_AccountEnd#"")
			QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2<=ACC_t_AccountEnd)
		Else 
			QUERY:C277([ACCOUNTS:32])
		End if 
	End if 
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; VAL_at_AccountCodes)
	ARRAY REAL:C219(ACC_ar_Imbalances; $_l_RecordCountPeriods; $_l_RecordCountAcounts)
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "AllUsed")
	$_l_ErrorCount:=0
	ARRAY LONGINT:C221(VAL_al_Sets_1; Size of array:C274(VAL_at_PeriodCodes); 0)
	For ($_l_Index; 1; Size of array:C274(VAL_at_PeriodCodes))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=VAL_at_PeriodCodes{$_l_Index})
		LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_1{$_l_Index})
	End for 
	ARRAY LONGINT:C221(VAL_al_Sets_2; Size of array:C274(VAL_at_PeriodCodes); 0)
	ARRAY TEXT:C222(VAL_at_AnalysisCodes; 100)
	ARRAY TEXT:C222(VAL_at_CurrencyCodes; 100)
	ARRAY TEXT:C222(VAL_at_LayerCodes; 100)
	//ALL RECORDS([ACCOUNT_BALANCES])
	USE SET:C118("$accountMatch")
	SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]; $_al_AccBalanceRecords)
	ARRAY TEXT:C222(VAL_at_accountCodes2; 100)
	ARRAY LONGINT:C221(VAL_al_Sets_2; 100; 0)
	For ($_l_Index; 1; Size of array:C274($_al_AccBalanceRecords))
		ERASE WINDOW:C160
		MESSAGE:C88("Building Required Data lists"+Char:C90(9))
		MESSAGE:C88(String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_al_AccBalanceRecords)))
		GOTO RECORD:C242([ACCOUNT_BALANCES:34]; $_al_AccBalanceRecords{$_l_Index})
		$_l_accountCodeRow:=Find in array:C230(VAL_at_AccountCodes2; [ACCOUNT_BALANCES:34]Account_Code:2)
		If ($_l_accountCodeRow<0)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2)
			$_l_accountCodeRow:=Find in array:C230(VAL_at_AccountCodes2; "")
			If ($_l_accountCodeRow<0)
				$_l_accountCodeRow:=Size of array:C274(VAL_at_AccountCodes2)+1
				INSERT IN ARRAY:C227(VAL_at_AccountCodes2; Size of array:C274(VAL_at_AccountCodes2)+1; 100)
			End if 
			VAL_at_AccountCodes2{$_l_accountCodeRow}:=[ACCOUNT_BALANCES:34]Account_Code:2
			If (Size of array:C274(VAL_al_Sets_2)<$_l_accountCodeRow)
				INSERT IN ARRAY:C227(VAL_al_Sets_2; Size of array:C274(VAL_al_Sets_2)+1; 100)
			End if 
			LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_2{$_l_accountCodeRow})
		End if 
		If ([ACCOUNT_BALANCES:34]Analysis_Code:1#"")
			$_l_AnalysisCodeRow:=Find in array:C230(VAL_at_AnalysisCodes; [ACCOUNT_BALANCES:34]Analysis_Code:1)
			If ($_l_AnalysisCodeRow<0)
				$_l_AnalysisCodeRow:=Find in array:C230(VAL_at_AnalysisCodes; "")
				If ($_l_AnalysisCodeRow<0)
					//all used insert 100 more
					$_l_AnalysisCodeRow:=Size of array:C274(VAL_at_AnalysisCodes)+1
					INSERT IN ARRAY:C227(VAL_at_AnalysisCodes; Size of array:C274(VAL_at_AnalysisCodes)+1; 100)
				End if 
				VAL_at_AnalysisCodes{$_l_AnalysisCodeRow}:=[ACCOUNT_BALANCES:34]Analysis_Code:1
			End if 
		End if 
		If ([ACCOUNT_BALANCES:34]Currency_Code:6#"")
			$_l_CurrencyCodeRow:=Find in array:C230(VAL_at_CurrencyCodes; [ACCOUNT_BALANCES:34]Currency_Code:6)
			If ($_l_CurrencyCodeRow<0)
				$_l_CurrencyCodeRow:=Find in array:C230(VAL_at_CurrencyCodes; "")
				If ($_l_CurrencyCodeRow<0)
					//all used insert 100 more
					$_l_CurrencyCodeRow:=Size of array:C274(VAL_at_CurrencyCodes)+1
					INSERT IN ARRAY:C227(VAL_at_CurrencyCodes; Size of array:C274(VAL_at_CurrencyCodes)+1; 100)
				End if 
				VAL_at_CurrencyCodes{$_l_CurrencyCodeRow}:=[ACCOUNT_BALANCES:34]Currency_Code:6
			End if 
		End if 
		If ([ACCOUNT_BALANCES:34]Layer_Code:5#"")
			$_l_LayCodeRow:=Find in array:C230(VAL_at_LayerCodes; [ACCOUNT_BALANCES:34]Layer_Code:5)
			If ($_l_LayCodeRow<0)
				$_l_LayCodeRow:=Find in array:C230(VAL_at_LayerCodes; "")
				If ($_l_LayCodeRow<0)
					//all used insert 100 more
					$_l_LayCodeRow:=Size of array:C274(VAL_at_LayerCodes)+1
					INSERT IN ARRAY:C227(VAL_at_LayerCodes; Size of array:C274(VAL_at_LayerCodes)+1; 100)
				End if 
				VAL_at_LayerCodes{$_l_LayCodeRow}:=[ACCOUNT_BALANCES:34]Layer_Code:5
			End if 
		End if 
	End for 
	$_l_EmptyPosition:=Find in array:C230(VAL_at_AnalysisCodes; "")
	If ($_l_EmptyPosition>0)
		ARRAY TEXT:C222(VAL_at_AnalysisCodes; $_l_EmptyPosition)
	End if 
	$_l_EmptyPosition:=Find in array:C230(VAL_at_CurrencyCodes; "")
	If ($_l_EmptyPosition>0)
		ARRAY TEXT:C222(VAL_at_CurrencyCodes; $_l_EmptyPosition)
	End if 
	$_l_EmptyPosition:=Find in array:C230(VAL_at_LayerCodes; "")
	If ($_l_EmptyPosition>0)
		ARRAY TEXT:C222(VAL_at_LayerCodes; $_l_EmptyPosition)
	End if 
	ARRAY LONGINT:C221(VAL_al_Sets_3; Size of array:C274(VAL_at_AnalysisCodes)+1; 0)
	For ($_l_Index; 1; Size of array:C274(VAL_at_AnalysisCodes))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=VAL_at_AnalysisCodes{$_l_Index})
		LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_3{$_l_Index})
	End for 
	INSERT IN ARRAY:C227(VAL_at_AnalysisCodes; Size of array:C274(VAL_at_AnalysisCodes)+1; 1)
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2="")
	LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_3{Size of array:C274(VAL_at_AnalysisCodes)})
	ARRAY LONGINT:C221(VAL_al_Sets_4; Size of array:C274(VAL_at_CurrencyCodes)+1; 0)
	For ($_l_Index; 1; Size of array:C274(VAL_at_CurrencyCodes))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=VAL_at_CurrencyCodes{$_l_Index})
		LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_4{$_l_Index})
	End for 
	INSERT IN ARRAY:C227(VAL_at_CurrencyCodes; Size of array:C274(VAL_at_CurrencyCodes)+1; 1)
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22="")
	LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_4{Size of array:C274(VAL_at_CurrencyCodes)})
	ARRAY LONGINT:C221(VAL_al_Sets_5; Size of array:C274(VAL_at_LayerCodes)+1; 0)
	For ($_l_Index; 1; Size of array:C274(VAL_at_LayerCodes))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=VAL_at_LayerCodes{$_l_Index})
		LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_5{$_l_Index})
	End for 
	INSERT IN ARRAY:C227(VAL_at_LayerCodes; Size of array:C274(VAL_at_LayerCodes)+1; 1)
	QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23="")
	LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; VAL_al_Sets_5{Size of array:C274(VAL_at_LayerCodes)})
	ARRAY LONGINT:C221($_al_AccountsCrossReference; 0; 0)
	
	For ($_l_Index2; 1; Size of array:C274(VAL_at_PeriodCodes))
		ERASE WINDOW:C160
		
		MESSAGE:C88("Validating Period: "+VAL_at_PeriodCodes{$_l_Index2}+" Period "+String:C10($_l_Index2)+" of "+String:C10(Size of array:C274(VAL_at_PeriodCodes)))
		If (ACC_l_MonthlyDetail=1)
			$_ti_DocumentRef:=DB_CreateDocument("Report_"+Replace string:C233(VAL_at_PeriodCodes{$_l_Index2}; "/"; "_")+"_"+Replace string:C233(String:C10(Current time:C178; HH MM SS:K7:1); ":"; ""); "TEXT")
			SEND PACKET:C103($_ti_DocumentRef; "Period"+Char:C90(9)+"Account"+Char:C90(9)+"Curr. Bal"+"Char(9)+Sum Bal"+Char:C90(9)+"Difference"+Char:C90(9)+"Running Imbalance"+Char:C90(13))
		End if 
		CREATE SET FROM ARRAY:C641([TRANSACTIONS:29]; VAL_al_Sets_1{$_l_Index2}; "Trans")
		//  QUERY([TRANSACTIONS];[TRANSACTIONS]Period Code=VAL_at_PeriodCodes{$_l_Index2})
		//CREATE SET([TRANSACTIONS];"trans")
		
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=VAL_at_PeriodCodes{$_l_Index2})
		SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]; $_al_AccBalanceRecords)
		$_r_Totalimbalance:=0
		For ($_l_Index; 1; Size of array:C274($_al_AccBalanceRecords))
			If ($_bo_FixData)
				READ WRITE:C146([ACCOUNT_BALANCES:34])
			End if 
			
			GOTO RECORD:C242([ACCOUNT_BALANCES:34]; $_al_AccBalanceRecords{$_l_Index})
			
			$_l_AccountCodePosition:=Find in array:C230(VAL_at_AccountCodes2; [ACCOUNT_BALANCES:34]Account_Code:2)
			If ($_l_AccountCodePosition>0)
				CREATE SET FROM ARRAY:C641([TRANSACTIONS:29]; VAL_al_Sets_2{$_l_AccountCodePosition}; "ACCOUNT")
				//QUERY([TRANSACTIONS];[TRANSACTIONS]Account Code=[ACCOUNT_BALANCES]Account_Code;*)
				$_l_AnalysisCodePosition:=Find in array:C230(VAL_at_AnalysisCodes; [ACCOUNT_BALANCES:34]Analysis_Code:1)
				If ($_l_AnalysisCodePosition>0)
					CREATE SET FROM ARRAY:C641([TRANSACTIONS:29]; VAL_al_Sets_3{$_l_AnalysisCodePosition}; "ANALYSIS")
					//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Analysis Code=[ACCOUNT_BALANCES]Analysis_Code
					$_l_CurrencyCodePosition:=Find in array:C230(VAL_at_CurrencyCodes; [ACCOUNT_BALANCES:34]Currency_Code:6)
					If ($_l_CurrencyCodePosition>0)
						CREATE SET FROM ARRAY:C641([TRANSACTIONS:29]; VAL_al_Sets_4{$_l_CurrencyCodePosition}; "CURRENCY")
						//  QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Currency Code=[ACCOUNT_BALANCES]Currency Co
						$_l_LayerCodePosition:=Find in array:C230(VAL_at_LayerCodes; [ACCOUNT_BALANCES:34]Layer_Code:5)
						If ($_l_LayerCodePosition>0)
							CREATE SET FROM ARRAY:C641([TRANSACTIONS:29]; VAL_al_Sets_5{$_l_LayerCodePosition}; "Layer")
							//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Layer Code=[ACCOUNT_BALANCES]Layer_Code)
							ERASE WINDOW:C160
							
							
							MESSAGE:C88("Validating Period:"+VAL_at_PeriodCodes{$_l_Index2}+" Period "+String:C10($_l_Index2)+" of "+String:C10(Size of array:C274(VAL_at_PeriodCodes))+Char:C90(13))
							MESSAGE:C88("Account Nº:"+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_al_AccBalanceRecords))+Char:C90(13)+"Account Ref:"+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+" "+[ACCOUNT_BALANCES:34]Currency_Code:6)
							
							INTERSECTION:C121("ACCOUNT"; "ANALYSIS"; "ACCOUNT")
							INTERSECTION:C121("ACCOUNT"; "CURRENCY"; "ACCOUNT")
							INTERSECTION:C121("ACCOUNT"; "LAYER"; "ACCOUNT")
							USE SET:C118("ACCOUNT")
							CREATE SET:C116([TRANSACTIONS:29]; "THISACCOUNT")
							INTERSECTION:C121("ThisAccount"; "Trans"; "ThisAccount")
							USE SET:C118("ThisAccount")
							UNION:C120("AllUsed"; "ThisAccount"; "AllUsed")
							If (ACC_l_MonthlyDetail=1)
								SEND PACKET:C103($_ti_DocumentRef; VAL_at_PeriodCodes{$_l_Index2}+Char:C90(9)+[ACCOUNT_BALANCES:34]Unique_StringIdent:8+Char:C90(9))
								//```
							End if 
							Case of 
								: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
									$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
									$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerVatInputACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueID; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
								: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC)
									$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
									QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
									$_r_Balance:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
									QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueID)
									$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
								Else 
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=[ACCOUNT_BALANCES:34]Unique_StringIdent:8)
									$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
									If (Records in selection:C76([TRANSACTIONS:29])>0)
										$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
									End if 
							End case 
							
							//
							If (ACC_l_MonthlyDetail=1)
								SEND PACKET:C103($_ti_DocumentRef; String:C10($_r_Balance)+Char:C90(9))
								SEND PACKET:C103($_ti_DocumentRef; String:C10([ACCOUNT_BALANCES:34]Balance:3)+Char:C90(9))
							End if 
							$_r_imbalance:=$_r_Balance-[ACCOUNT_BALANCES:34]Balance:3
							If (ACC_l_MonthlyDetail=1)
								SEND PACKET:C103($_ti_DocumentRef; String:C10($_r_imbalance)+Char:C90(9))
							End if 
							$_r_Totalimbalance:=$_r_Totalimbalance+$_r_imbalance
							If (ACC_l_MonthlyDetail=1)
								SEND PACKET:C103($_ti_DocumentRef; String:C10($_r_Totalimbalance)+Char:C90(13))
							End if 
							If ([ACCOUNT_BALANCES:34]Balance:3#$_r_Balance)
								
								SEND PACKET:C103($_ti_DocumentRef2; [ACCOUNT_BALANCES:34]Account_Code:2+Char:C90(9)+[ACCOUNT_BALANCES:34]Unique_StringIdent:8+Char:C90(9)+VAL_at_PeriodCodes{$_l_Index2}+"Out by: "+String:C10([ACCOUNT_BALANCES:34]Balance:3-(Sum:C1([TRANSACTIONS:29]Total:17)))+Char:C90(13))
								SEND PACKET:C103($_ti_DocumentRef2; Char:C90(13))
								ERASE WINDOW:C160
								MESSAGE:C88("Validating Period: "+VAL_at_PeriodCodes{$_l_Index2}+" Period "+String:C10($_l_Index2)+" of "+String:C10(Size of array:C274(VAL_at_PeriodCodes))+Char:C90(13))
								MESSAGE:C88("Account Nº:"+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_al_AccBalanceRecords))+Char:C90(13)+"Account Ref:"+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+" "+[ACCOUNT_BALANCES:34]Currency_Code:6)
								MESSAGE:C88([ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Period_Code:4+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+" "+[ACCOUNT_BALANCES:34]Currency_Code:6+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1)
								$_l_AccountCodePosition:=Find in array:C230(VAL_at_AccountCodes; [ACCOUNT_BALANCES:34]Account_Code:2)
								If ($_l_AccountCodePosition>0)  //bsw 11/06/03
									ACC_ar_Imbalances{$_l_Index2}{$_l_AccountCodePosition}:=[ACCOUNT_BALANCES:34]Balance:3-($_r_Balance)
									MESSAGE:C88("Is out by"+String:C10(ACC_ar_Imbalances{$_l_Index2}{$_l_AccountCodePosition}))
								Else 
									$_t_alertMessage:="NOTE: Account balance "+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Period_Code:4+" "+[ACCOUNT_BALANCES:34]Layer_Code:5
									$_t_alertMessage:=$_t_alertMessage+" "+[ACCOUNT_BALANCES:34]Currency_Code:6+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" refers to an account that doesn't exist."
									Gen_Alert($_t_alertMessage)
								End if 
								$_l_ErrorCount:=$_l_ErrorCount+1
								If ($_bo_FixData)
									[ACCOUNT_BALANCES:34]Balance:3:=$_r_Balance
									DB_SaveRecord(->[ACCOUNT_BALANCES:34])
									AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
								End if 
								
							End if 
						End if 
					End if 
				End if 
			End if 
			
			
		End for 
		If (ACC_l_MonthlyDetail=1)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
	End for 
	If ($_l_ErrorCount>0) & (False:C215)
		// ALERT("There are errors, create a document for error summary")
		Gen_Alert("There are errors. Create a document for error summary.")
		$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
		If ($_ti_DocumentRef#?00:00:00?)
			For ($_l_Index; 1; Size of array:C274(ACC_ar_Imbalances))
				For ($_l_Index2; 1; Size of array:C274(ACC_ar_Imbalances{$_l_Index}))
					If (ACC_ar_Imbalances{$_l_Index}{$_l_Index2}#0)
						SEND PACKET:C103($_ti_DocumentRef; VAL_at_AccountCodes{$_l_Index2}+Char:C90(9)+VAL_at_PeriodCodes{$_l_Index}+Char:C90(9)+"Out by: "+String:C10(ACC_ar_Imbalances{$_l_Index}{$_l_Index2})+Char:C90(13))
					End if 
				End for 
			End for 
		End if 
	End if 
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	Gen_Alert("Accounts check completed")
	
End if 
Process_End
ERR_MethodTrackerReturn("ACC_ValidateBalances"; $_t_oldMethodName)
