//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ModifyTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState; $_bo_Save; $_bo_SaveBATCH; $_bo_UpdateBalance; $10)
	C_LONGINT:C283($1; $2; ACC_l_CBFixTransactionsA; ACC_l_CBFixTransactionsL; ACC_l_CBFixTransactionsV)
	C_POINTER:C301($11)
	C_REAL:C285($_r_Total; $8; $9)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $3; $4; $5; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ModifyTransaction")
ACC_ReportingPrefs

//this is used to fix transactions
$_bo_Save:=False:C215
$_bo_UpdateBalance:=False:C215
$_bo_SaveBATCH:=False:C215

If (Count parameters:C259>=4)
	If ($1>0)
		READ WRITE:C146([TRANSACTIONS:29])
		If ([TRANSACTIONS:29]Transaction_ID:31#$1)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$1)
		End if 
		
		If ($4#"")
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$4)
			If (Records in selection:C76([ACCOUNTS:32])>0)
				If ([TRANSACTIONS:29]Account_Code:3#[ACCOUNTS:32]Account_Code:2)
					[TRANSACTIONS:29]Account_Code:3:=[ACCOUNTS:32]Account_Code:2
					$_bo_Save:=True:C214
					$_bo_UpdateBalance:=True:C214
				End if 
				
			Else 
				//THE BATCH ACCOUNT IS NOT RIGHT
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[TRANSACTIONS:29]Account_Code:3)
				If (Records in selection:C76([ACCOUNTS:32])>0)
					If ([TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$2)
							$_bo_ReadOnlyState:=Read only state:C362([TRANSACTION_BATCH_ITEMS:155])
							If (Not:C34($_bo_ReadOnlyState))
								Case of 
									: ($3="C")
										[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTIONS:29]Account_Code:3
									: ($3="D")
										[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTIONS:29]Account_Code:3
								End case 
								$_bo_SaveBATCH:=True:C214
							End if 
						End if 
					End if 
				Else 
					//this is not gonna work1
					Case of 
						: ($3="C")
							ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 3; -1)
						: ($3="D")
							ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 3; -1)
					End case 
				End if 
				
			End if 
		End if   //$4(ACCOUNT CODE)
		If (Count parameters:C259>=5)
			If ($5#"")  //ANALYSIS
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$5)
				If (Records in selection:C76([ANALYSES:36])>0)
					If ([TRANSACTIONS:29]Analysis_Code:2#[ANALYSES:36]Analysis_Code:1)
						If (ACC_l_CBFixTransactionsA=1)
							[TRANSACTIONS:29]Analysis_Code:2:=[ANALYSES:36]Analysis_Code:1
							$_bo_Save:=True:C214
							$_bo_UpdateBalance:=True:C214
						Else 
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
								$_bo_SaveBatch:=True:C214
								If ($3="C")
									[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
								Else 
									[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
								End if 
							End if 
							ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 2; -1)
						End if 
					End if 
					
				Else 
					//THE BATCH ANALYSES IS NOT RIGHT
					QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2)
					If (Records in selection:C76([ANALYSES:36])>0)
						If ([TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$2)
								If (ACC_l_CBFixTransactionsA=1)
									$_bo_ReadOnlyState:=Read only state:C362([TRANSACTION_BATCHES:30])
									If (Not:C34($_bo_ReadOnlyState))
										[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTIONS:29]Analysis_Code:2
										$_bo_SaveBATCH:=True:C214
									End if 
								Else 
									//just report it
									If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
										$_bo_SaveBatch:=True:C214
										If ($3="C")
											[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
										End if 
									End if 
									
									ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 2; -1)
								End if 
							End if 
						End if 
					Else 
						//this is not gonna work!
						ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 2; -1)
						
					End if 
				End if 
			Else 
				//clear the analyses code
				If ([TRANSACTIONS:29]Analysis_Code:2#"")
					If (ACC_l_CBFixTransactionsA=1)
						[TRANSACTIONS:29]Analysis_Code:2:=""
						$_bo_Save:=True:C214
						$_bo_UpdateBalance:=True:C214
					Else 
						If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
							$_bo_SaveBatch:=True:C214
							If ($3="C")
								[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
							Else 
								[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
							End if 
						End if 
						
						ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 2; -1)
					End if 
					
				End if 
				
			End if   //$5(ANALYSES CODE)
			If (Count parameters:C259>=6)
				If ($6#"")  //LAYER
					QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$6)
					If (Records in selection:C76([LAYERS:76])>0)
						If ([TRANSACTIONS:29]Layer_Code:23#[LAYERS:76]Layer_Code:1)
							If (ACC_l_CBFixTransactionsL=1)
								[TRANSACTIONS:29]Layer_Code:23:=[LAYERS:76]Layer_Code:1
								$_bo_Save:=True:C214
								$_bo_UpdateBalance:=True:C214
							Else 
								If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									$_bo_SaveBatch:=True:C214
									If ($3="C")
										[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
									Else 
										[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
									End if 
								End if 
								ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 20; -1)
							End if 
							
						End if 
					Else 
						//THE BATCH LAYER IS NOT RIGHT
						QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=[TRANSACTIONS:29]Layer_Code:23)
						If (Records in selection:C76([LAYERS:76])>0)
							If ([TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$2)
									If (ACC_l_CBFixTransactionsL=1)
										$_bo_ReadOnlyState:=Read only state:C362([TRANSACTION_BATCHES:30])
										If (Not:C34($_bo_ReadOnlyState))
											[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[TRANSACTIONS:29]Layer_Code:23
											$_bo_SaveBATCH:=True:C214
										End if 
									Else 
										If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
											$_bo_SaveBatch:=True:C214
											If ($3="C")
												[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
											Else 
												[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
											End if 
										End if 
										
										ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 20; -1)
									End if 
								End if 
							End if 
						Else 
							//this is not gonna work!
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
								$_bo_SaveBatch:=True:C214
								If ($3="C")
									[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
								Else 
									[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
								End if 
							End if 
							ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 20; -1)
						End if 
					End if 
				Else 
					//clear the layer code?
					If ([TRANSACTIONS:29]Layer_Code:23#"")
						If (ACC_l_CBFixTransactionsL=1)
							[TRANSACTIONS:29]Layer_Code:23:=""
							$_bo_Save:=True:C214
							$_bo_UpdateBalance:=True:C214
						Else 
							If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
								$_bo_SaveBatch:=True:C214
								If ($3="C")
									[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
								Else 
									[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
								End if 
							End if 
							ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 20; -1)
						End if 
					End if 
					
					
				End if   //$6(LAYER CODE)
				If (Count parameters:C259>=7)
					If ($7#"")  //CURRENCY
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$7)
						If (Records in selection:C76([CURRENCIES:71])>0)
							If ([TRANSACTIONS:29]Currency_Code:22#[CURRENCIES:71]Currency_Code:1)
								If (ACC_l_CBFixTransactionsL=1)
									[TRANSACTIONS:29]Currency_Code:22:=[CURRENCIES:71]Currency_Code:1
									$_bo_Save:=True:C214
									$_bo_UpdateBalance:=True:C214
								Else 
									If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
										$_bo_SaveBatch:=True:C214
										If ($3="C")
											[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
										End if 
									End if 
									ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 19; -1)
								End if 
								
							End if 
							
						Else 
							//THE BATCH CURRENCY IS NOT RIGHT
							QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[TRANSACTIONS:29]Currency_Code:22)
							If (Records in selection:C76([CURRENCIES:71])>0)
								If ([TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
									If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$2)
										$_bo_ReadOnlyState:=Read only state:C362([TRANSACTION_BATCH_ITEMS:155])
										If (ACC_l_CBFixTransactionsL=1)
											If (Not:C34($_bo_ReadOnlyState))
												[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[TRANSACTIONS:29]Currency_Code:22
												$_bo_SaveBATCH:=True:C214
											End if 
										Else 
											If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
												$_bo_SaveBatch:=True:C214
												If ($3="C")
													[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
												Else 
													[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
												End if 
											End if 
											ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 19; -1)
										End if 
										
									End if 
								End if 
							Else 
								If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									$_bo_SaveBatch:=True:C214
									If ($3="C")
										[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
									Else 
										[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
									End if 
								End if 
								ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 19; -1)
							End if 
						End if 
					Else 
						If ([TRANSACTIONS:29]Currency_Code:22#"")
							If (ACC_l_CBFixTransactionsL=1)
								[TRANSACTIONS:29]Currency_Code:22:=<>SYS_t_BaseCurrency
								$_bo_Save:=True:C214
								$_bo_UpdateBalance:=True:C214
							Else 
								If ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
									$_bo_SaveBatch:=True:C214
									If ($3="C")
										[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28:=1
									Else 
										[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29:=1
									End if 
								End if 
								ACC_BATCHREPORTERROR([TRANSACTIONS:29]Batch_Number:7; $2; 2; 19; -1)
							End if 
						End if 
					End if 
					
					If (Count parameters:C259>=8)
						If ($8#0)  //AMOUNT
							If ([TRANSACTIONS:29]Amount:6#$8)
								If (ACC_l_CBFixTransactionsV=1)
									[TRANSACTIONS:29]Amount:6:=$8
									$_r_Total:=[TRANSACTIONS:29]Tax_Amount:16+[TRANSACTIONS:29]Amount:6
									$_bo_Save:=True:C214
									$_bo_UpdateBalance:=True:C214
								Else 
									//no error for this??
								End if 
								
							End if 
							
						End if 
						If (Count parameters:C259>=9)
							//AMOUNT
							If ([TRANSACTIONS:29]Tax_Amount:16#$9)
								If (ACC_l_CBFixTransactionsV=1)
									[TRANSACTIONS:29]Tax_Amount:16:=$9
									$_bo_Save:=True:C214
									$_bo_UpdateBalance:=True:C214
								Else 
									//no error for this
								End if 
								
								
							End if 
							If ($8#(Old:C35([TRANSACTIONS:29]Amount:6))) | ($9#(Old:C35([TRANSACTIONS:29]Tax_Amount:16)))
								//THE TOTAL WILL BE CHANGED
								If (ACC_l_CBFixTransactionsV=1)
									[TRANSACTIONS:29]Total:17:=[TRANSACTIONS:29]Tax_Amount:16+[TRANSACTIONS:29]Amount:6
									$_bo_Save:=True:C214
									$_bo_UpdateBalance:=True:C214
								End if 
								
							End if 
						End if 
						
					End if 
					
				End if 
			End if 
		End if 
	End if 
	
End if 
If ($_bo_SaveBatch=True:C214)
	If (Count parameters:C259<10)
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	Else 
		If ($10)
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		Else 
			$11->:=True:C214
		End if 
		
	End if 
	
End if 
If ($_bo_Save)
	If (Not:C34($_bo_UpdateBalance))
		
	End if 
	
	DB_SaveRecord(->[TRANSACTIONS:29])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	
End if 
ERR_MethodTrackerReturn("ACC_ModifyTransaction"; $_t_oldMethodName)
