//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_Amalgamate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentProcess; $_l_WindowRow; $Batch; $Set; MOD_l_CurrentModuleAccess; vD; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Sum; $Bal; $Tot; $VAT)
	C_TEXT:C284($_t_Alert; $_t_oldMethodName; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_Amalgamate")
//Accounts_Amalgamate
Start_Process
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))

If ((MOD_l_CurrentModuleAccess<2) | (MOD_l_CurrentModuleAccess=3))
	Gen_Alert("You do not have full access to the Nominal Ledger Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT NG Removed 1/6/2004 not required
Else 
	Gen_Confirm("This function amalgamates all Transactions in the selected Period(s)"; ""; "")
	If (OK=1)
		Gen_Confirm("NB: The process should not be run while there are other active users"; ""; "")
		If (OK=1)
			Gen_Confirm("Do you want to delete Journal Batches at the same time?"; "Yes"; "No")
			If (OK=1)
				$Set:=1
			Else 
				$Set:=0
			End if 
			ACC_BalFile
			vTitle:="Amalgamate Transactions"
			ACC_BalSelect
			If (OK=1)
				Are_You_Sure
				If (OK=1)
					READ WRITE:C146([TRANSACTIONS:29])
					$_t_Alert:=""
					ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; >; [ACCOUNT_BALANCES:34]Account_Code:2; >)
					Open_PrD_Window("Amalgamating Transactions")
					<>SYS_l_CancelProcess:=0
					$_l_CurrentProcess:=Current process:C322
					FIRST RECORD:C50([ACCOUNT_BALANCES:34])
					While ((Not:C34(End selection:C36([ACCOUNT_BALANCES:34]))) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5)
						$_r_Sum:=Round:C94(Sum:C1([TRANSACTIONS:29]Amount:6); 2)
						$VAT:=Round:C94(Sum:C1([TRANSACTIONS:29]Tax_Amount:16); 2)
						$Tot:=Round:C94(Sum:C1([TRANSACTIONS:29]Total:17); 2)
						$Bal:=Round:C94([ACCOUNT_BALANCES:34]Balance:3; 2)
						If (($_r_Sum#$Bal) & ($Tot#$Bal))
							If (([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC) | ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatoutputACC) | ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC))
							Else 
								$_t_Alert:="Could not amalgamate: "+[ACCOUNT_BALANCES:34]Period_Code:4+" "+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" "+[ACCOUNT_BALANCES:34]Currency_Code:6+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+" - the balances are out"+Char:C90(13)
							End if 
						Else 
							CREATE SET:C116([TRANSACTIONS:29]; "Master")
							FIRST RECORD:C50([TRANSACTIONS:29])
							ONE RECORD SELECT:C189([TRANSACTIONS:29])
							If (Locked:C147([TRANSACTIONS:29]))
								$_t_Alert:="Could not amalgamate :"+[ACCOUNT_BALANCES:34]Period_Code:4+" "+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" "+[ACCOUNT_BALANCES:34]Currency_Code:6+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+" - record locked"+Char:C90(13)
							Else 
								CREATE SET:C116([TRANSACTIONS:29]; "Extra")
								$_t_Alert:=[ACCOUNT_BALANCES:34]Period_Code:4+" "+[ACCOUNT_BALANCES:34]Account_Code:2+" "+[ACCOUNT_BALANCES:34]Analysis_Code:1+" "+[ACCOUNT_BALANCES:34]Currency_Code:6+" "+[ACCOUNT_BALANCES:34]Layer_Code:5+Char:C90(13)
								While (Semaphore:C143("UpdateTransaction"+[ACCOUNT_BALANCES:34]Account_Code:2))
									DelayTicks(2)
								End while 
								LOAD RECORD:C52([TRANSACTIONS:29])
								RELATE ONE:C42([TRANSACTIONS:29]Period_Code:12)
								[TRANSACTIONS:29]Invoice_Number:4:=""
								[TRANSACTIONS:29]Trans_Date:5:=[PERIODS:33]To_Date:4
								[TRANSACTIONS:29]Transaction_Type_Code:1:="J"
								[TRANSACTIONS:29]Amount:6:=$_r_Sum
								$Batch:=[TRANSACTIONS:29]Batch_Number:7
								[TRANSACTIONS:29]Batch_Number:7:=0
								[TRANSACTIONS:29]Description:8:="Amalgamation"
								[TRANSACTIONS:29]Company_Code:9:=""
								[TRANSACTIONS:29]Entry_Date:11:=<>DB_d_CurrentDate
								[TRANSACTIONS:29]Cheque_Number:13:=""
								[TRANSACTIONS:29]Reconciled:14:=True:C214
								[TRANSACTIONS:29]Other_Side:15:=""
								[TRANSACTIONS:29]Tax_Amount:16:=$VAT
								[TRANSACTIONS:29]Total:17:=$Tot
								[TRANSACTIONS:29]Purchase_invoice_number:19:=""
								DB_SaveRecord(->[TRANSACTIONS:29])
								AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
								CLEAR SEMAPHORE:C144("UpdateTransaction"+[ACCOUNT_BALANCES:34]Account_Code:2)
								UNLOAD RECORD:C212([TRANSACTIONS:29])
								DIFFERENCE:C122("Master"; "Extra"; "Master")
								USE SET:C118("Master")
								DELETE SELECTION:C66([TRANSACTIONS:29])
								If ($Set=1)
									QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$Batch)
									DB_DeletionControl(->[TRANSACTION_BATCHES:30])
									
									DELETE RECORD:C58([TRANSACTION_BATCHES:30])
								End if 
							End if 
						End if 
						MESSAGE:C88($_t_Alert)
						NEXT RECORD:C51([ACCOUNT_BALANCES:34])
						
					End while 
					//    DELETE SELECTION([TRANSACTIONS])
					If ($_l_CurrentProcess=<>SYS_l_CancelProcess)
						MESSAGE:C88("Amalgamation Aborted")
						DelayTicks(360)
					End if 
					READ ONLY:C145([TRANSACTIONS:29])
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
						End if 
					End if 
					WS_KeepFocus
					
				End if 
			End if 
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Accounts_Amalgamate"; $_t_oldMethodName)
