If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.oUnreconcilledTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABR_abo_UNSelected;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY LONGINT(ACC_al_PartReconcileID;0)
	//ARRAY REAL(ABR_ar_AlreadyReconciledAmount;0)
	//ARRAY REAL(ABR_ar_TRYUNReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_unResolvedTRAmount;0)
	//ARRAY REAL(ACC_ar_PartReconcile;0)
	C_BOOLEAN:C305($_bo_OptionKey; ABC_bo_unResolvedTransactions)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Index; $_l_OK; $_l_ReconcileRow; $_l_ReconcileRow2; $_l_Row; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_REAL:C285($_r_ReconcileAmount; $_r_RemainingAmount; $_r_TransactionTotal; ACC_R_RemainingtoReconcile; ACC_R_SelectedReconcilles)
	C_TEXT:C284($_t_AutoSeachCode; $_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.oUnreconcilledTransactions1")
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Data Change:K2:15)
		//TRACE
		
		LISTBOX GET CELL POSITION:C971(*; "oUnreconcilledTransactions"; $_l_Column; $_l_Row)
		If (ABR_abo_UNSelected{$_l_Row})
			$_bo_OptionKey:=Gen_Option
			If ($_bo_OptionKey)
				
				$_r_TransactionTotal:=ABR_ar_unResolvedTRAmount{$_l_Row}-ABR_ar_AlreadyReconciledAmount{$_l_Row}
				Repeat 
					$_r_ReconcileAmount:=Gen_RequestAmount("Enter the amount to reconcile"; Is real:K8:4; $_r_TransactionTotal)
					If (OK=1)
						$_l_OK:=1
					Else 
						$_r_ReconcileAmount:=0
					End if 
					
				Until (OK=0) | ($_r_ReconcileAmount#0) | (True:C214)
				
				
				
				If ($_r_ReconcileAmount#0)
					Case of 
						: ($_r_ReconcileAmount>0) & ($_r_TransactionTotal<0)
							$_r_ReconcileAmount:=-$_r_ReconcileAmount
						: ($_r_ReconcileAmount<0) & ($_r_TransactionTotal>0)
							$_r_ReconcileAmount:=Abs:C99($_r_ReconcileAmount)
					End case 
					If ($_r_ReconcileAmount#$_r_TransactionTotal) | (ABR_ar_AlreadyReconciledAmount{$_l_Row}#0)
						
						$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
						If ($_l_ReconcileRow<0)
							APPEND TO ARRAY:C911(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
							APPEND TO ARRAY:C911(ACC_ar_PartReconcile; $_r_ReconcileAmount)
						Else 
							ACC_ar_PartReconcile{$_l_ReconcileRow}:=$_r_ReconcileAmount
							
							
						End if 
						ABR_ar_TRYUNReconcilledAmt{$_l_Row}:=$_r_ReconcileAmount
					Else 
						$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
						If ($_l_ReconcileRow>0)
							ACC_al_PartReconcileID{$_l_ReconcileRow}:=0
							ACC_ar_PartReconcile{$_l_ReconcileRow}:=0
						End if 
						ABR_ar_TRYUNReconcilledAmt{$_l_Row}:=$_r_TransactionTotal
					End if 
					//ABR_ar_AlreadyReconciledAmount{$_l_Row}:=ABR_ar_AlreadyReconciledAmount{$_l_Row}+Num($Reconcile)
				End if 
			Else 
				//if the transaction amount is greater than the amount remaining its a partial reconcile anyway
				$_r_RemainingAmount:=ACC_R_RemainingtoReconcile
				$_r_TransactionTotal:=ABR_ar_unResolvedTRAmount{$_l_Row}-ABR_ar_AlreadyReconciledAmount{$_l_Row}
				If ([ACC_Bank_Statements:198]Bank_CreditAmount:9>0)
					$_r_ReconcileAmount:=$_r_TransactionTotal
					If ($_r_ReconcileAmount#0)
						If (ABR_ar_AlreadyReconciledAmount{$_l_Row}#0)
							//this is a partial reconcile
							$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
							If ($_l_ReconcileRow<0)
								APPEND TO ARRAY:C911(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
								APPEND TO ARRAY:C911(ACC_ar_PartReconcile; $_r_ReconcileAmount)
							Else 
								ACC_ar_PartReconcile{$_l_ReconcileRow}:=$_r_ReconcileAmount
								
								
							End if 
						Else 
							$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
							If ($_l_ReconcileRow>0)
								ACC_al_PartReconcileID{$_l_ReconcileRow}:=0
								ACC_ar_PartReconcile{$_l_ReconcileRow}:=0
							End if 
						End if 
						ABR_ar_TRYUNReconcilledAmt{$_l_Row}:=$_r_TransactionTotal
					End if 
				Else 
					//its a debit amount
					$_r_ReconcileAmount:=$_r_TransactionTotal
					If ($_r_ReconcileAmount#0)
						If (ABR_ar_AlreadyReconciledAmount{$_l_Row}#0)
							$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
							If ($_l_ReconcileRow<0)
								APPEND TO ARRAY:C911(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
								APPEND TO ARRAY:C911(ACC_ar_PartReconcile; $_r_ReconcileAmount)
							Else 
								ACC_ar_PartReconcile{$_l_ReconcileRow}:=$_r_ReconcileAmount
							End if 
							
						Else 
							$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
							If ($_l_ReconcileRow>0)
								ACC_al_PartReconcileID{$_l_ReconcileRow}:=0
								ACC_ar_PartReconcile{$_l_ReconcileRow}:=0
							End if 
						End if 
						ABR_ar_TRYUNReconcilledAmt{$_l_Row}:=$_r_TransactionTotal
					End if 
				End if 
			End if 
		Else 
			//Deselect
			$_l_ReconcileRow:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Row})
			If ($_l_ReconcileRow>0)
				ACC_al_PartReconcileID{$_l_ReconcileRow}:=0
				ACC_ar_PartReconcile{$_l_ReconcileRow}:=0
			End if 
			ABR_ar_TRYUNReconcilledAmt{$_l_Row}:=0
		End if 
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=1)
					ACC_R_SelectedReconcilles:=0
					For ($_l_Index; 1; Size of array:C274(ABR_abo_UNSelected))
						$_l_ReconcileRow:=Find in array:C230(ABR_abo_UNSelected; True:C214; $_l_Index)
						If ($_l_ReconcileRow>0)
							$_l_Index:=$_l_ReconcileRow
							$_l_ReconcileRow2:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Index})
							If ($_l_ReconcileRow2<0)
								$_r_TransactionTotal:=ABR_ar_unResolvedTRAmount{$_l_Index}-ABR_ar_AlreadyReconciledAmount{$_l_Index}
								ACC_R_SelectedReconcilles:=ACC_R_SelectedReconcilles+($_r_TransactionTotal)
								ABR_ar_TRYUNReconcilledAmt{$_l_Index}:=$_r_TransactionTotal
							Else 
								If (ACC_ar_PartReconcile{$_l_ReconcileRow2}#0)
									ACC_R_SelectedReconcilles:=ACC_R_SelectedReconcilles+(ACC_ar_PartReconcile{$_l_ReconcileRow2})
									ABR_ar_TRYUNReconcilledAmt{$_l_Index}:=ACC_ar_PartReconcile{$_l_ReconcileRow2}
								Else 
									$_r_TransactionTotal:=ABR_ar_unResolvedTRAmount{$_l_Index}-ABR_ar_AlreadyReconciledAmount{$_l_Index}
									ACC_R_SelectedReconcilles:=ACC_R_SelectedReconcilles+($_r_TransactionTotal)
									ABR_ar_TRYUNReconcilledAmt{$_l_Index}:=$_r_TransactionTotal
								End if 
								
							End if 
							
						Else 
							$_l_Index:=Size of array:C274(ABR_abo_UNSelected)
							
						End if 
					End for 
					If ([ACC_Bank_Statements:198]Bank_CreditAmount:9#0)
						ACC_R_RemainingtoReconcile:=([ACC_Bank_Statements:198]Bank_CreditAmount:9)-(Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11+ACC_R_SelectedReconcilles))
						
					Else 
						ACC_R_RemainingtoReconcile:=([ACC_Bank_Statements:198]Bank_DebitAmount:8)-(Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11+ACC_R_SelectedReconcilles))
						
					End if 
			End case 
		End if 
		
	: ($_l_Event=On Double Clicked:K2:5)
		//TRACE
		LISTBOX GET CELL POSITION:C971(*; "oUnreconcilledTransactions"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (ABR_al_UNTransactionID{$_l_Row}>0)
				$_t_AutoSeachCode:=String:C10(ABR_al_UNTransactionID{$_l_Row})
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Transaction")
				//$_l_Process:=New Process("DBI_DisplayRecord";64000;$_t_ProcessName;Current process;Table(->[TRANSACTIONS]);"";$_t_AutoSeachCode)
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oUnreconcilledTransactions1"; $_t_oldMethodName)
