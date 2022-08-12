//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TRANSACTIONMATCHPAIRS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_isSet; 0)
	ARRAY LONGINT:C221($_al_TempPairID; 0)
	ARRAY LONGINT:C221($_al_ToSkip; 0; 0)
	ARRAY LONGINT:C221($_al_ToStart; 0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalance;0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalanceDebit;0)
	//ARRAY LONGINT(ACC_al_TransPairIDs;0)
	//ARRAY LONGINT(ACC_al_TransPairIDsDEB;0)
	//ARRAY REAL(ACC_ar_TransCreditAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditVatAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitVatAwaiting;0)
	C_BOOLEAN:C305($_bo_BreakOut; $_bo_isSet)
	C_LONGINT:C283($_l_ChildBatchItemID; $_l_Current; $_l_CurrentStart; $_l_Index; $_l_Index2; $_l_Index2ax; $_l_Index2ax2; $_l_Index2count; $_l_index3; $_l_NextSkip; $_l_PairsID)
	C_LONGINT:C283($_l_ParentBatchItemID; $_l_ParentID; $_l_SetCount; $_l_SkipQuantity; $_l_SkipRowPosition; $_l_SkipSteps; $_l_tSetIndex; $0)
	C_REAL:C285($_r_Amount; $_r_CreditGrandawaiting; $_r_CreditGrandTotal; $_r_DebitGrandawaiting; $_r_DebitGrandTotal; $_r_DebitGrandTOTAwaiting; $_r_DebitGrandVatAwaiting; $_r_TotalTest; $_r_TransGrandTOTAwaiting; $_r_TransGrandVatAwaiting)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_Period; $_t_Text)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransactionMatchPairs")
$0:=0
//THIS METHOD IS CALLED NOW AT THE END OF ACC_TRANSVALIDATEALL
//THIS WILL FIND THE DEBITS RELATING TO CREDITS AND THEN CREATE
//THE MULTI RELATION RECORDS
If (Size of array:C274(ACC_al_TransAwaitsBalance)>0) & (Size of array:C274(ACC_ar_TransDebitAwaiting)>0)
	Case of 
		: (Size of array:C274(ACC_al_TransAwaitsBalance)=1)
			$_r_CreditGrandawaiting:=0
			$_r_TransGrandVatAwaiting:=0
			$_r_TransGrandTOTAwaiting:=0
			$_r_CreditGrandTotal:=0
			For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalance))
				$_r_CreditGrandawaiting:=$_r_CreditGrandawaiting+ACC_ar_TransCreditAwaiting{$_l_Index}
				$_r_TransGrandVatAwaiting:=$_r_TransGrandVatAwaiting+ACC_ar_TransCreditVatAwaiting{$_l_Index}
				$_r_TransGrandTOTAwaiting:=$_r_TransGrandTOTAwaiting+ACC_ar_TransCreditTotalAwaiting{$_l_Index}
			End for 
			$_r_DebitGrandawaiting:=0
			$_r_DebitGrandVatAwaiting:=0
			$_r_DebitGrandTOTAwaiting:=0
			$_r_DebitGrandTotal:=0
			For ($_l_Index; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))
				$_r_DebitGrandawaiting:=$_r_DebitGrandawaiting+ACC_ar_TransDebitAwaiting{$_l_Index}
				$_r_DebitGrandVatAwaiting:=$_r_DebitGrandVatAwaiting+ACC_ar_TransDebitVatAwaiting{$_l_Index}
				$_r_DebitGrandTOTAwaiting:=$_r_DebitGrandTOTAwaiting+ACC_ar_TransDebitTotalAwaiting{$_l_Index}
			End for 
			If (($_r_DebitGrandTOTAwaiting+$_r_TransGrandTOTAwaiting)=0)
				$_l_ParentID:=ACC_al_TransAwaitsBalance{1}
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
				$_t_AnalysisCode:=[TRANSACTIONS:29]Analysis_Code:2
				$_t_Period:=[TRANSACTIONS:29]Period_Code:12
				$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
				$_t_LayerCode:=[TRANSACTIONS:29]Layer_Code:23
				$_l_ParentBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
				READ WRITE:C146([TRANS_MULTI:128])
				For ($_l_index3; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalanceDebit{$_l_index3})
					If ($_t_AnalysisCode=[TRANSACTIONS:29]Analysis_Code:2) & ($_t_Period=[TRANSACTIONS:29]Period_Code:12) & ($_t_CurrencyCode=[TRANSACTIONS:29]Currency_Code:22) & ($_t_LayerCode=[TRANSACTIONS:29]Layer_Code:23)
						
						$_l_ChildBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
						If ($_l_ChildBatchItemID#0) & (ACC_ar_TransDebitAwaiting{$_l_index3}#0) & ($_l_ParentID#0) & ($_l_ParentBatchItemID#0)
							QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$_l_ParentID; *)
							QUERY:C277([TRANS_MULTI:128];  & ; [TRANS_MULTI:128]x_ManyTransID:5=ACC_al_TransAwaitsBalanceDebit{$_l_index3})
							If (Records in selection:C76([TRANS_MULTI:128])=0)
								CREATE RECORD:C68([TRANS_MULTI:128])
							End if 
							[TRANS_MULTI:128]X_OneTransID:2:=$_l_ParentID
							[TRANS_MULTI:128]x_OneBatchItemID:3:=$_l_ParentBatchItemID
							[TRANS_MULTI:128]x_ManyBatchItemID:4:=$_l_ChildBatchItemID
							[TRANS_MULTI:128]x_ManyTransID:5:=ACC_al_TransAwaitsBalanceDebit{$_l_index3}
							DB_SaveRecord(->[TRANS_MULTI:128])
						End if 
					End if 
				End for 
			End if 
			
			
		: (Size of array:C274(ACC_ar_TransDebitAwaiting)=1)
			$_r_CreditGrandawaiting:=0
			$_r_TransGrandVatAwaiting:=0
			$_r_TransGrandTOTAwaiting:=0
			$_r_CreditGrandTotal:=0
			For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalance))
				$_r_CreditGrandawaiting:=$_r_CreditGrandawaiting+ACC_ar_TransCreditAwaiting{$_l_Index}
				$_r_TransGrandVatAwaiting:=$_r_TransGrandVatAwaiting+ACC_ar_TransCreditVatAwaiting{$_l_Index}
				$_r_TransGrandTOTAwaiting:=$_r_TransGrandTOTAwaiting+ACC_ar_TransCreditTotalAwaiting{$_l_Index}
			End for 
			$_r_DebitGrandawaiting:=0
			$_r_DebitGrandVatAwaiting:=0
			$_r_DebitGrandTOTAwaiting:=0
			$_r_DebitGrandTotal:=0
			For ($_l_Index; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))
				$_r_DebitGrandawaiting:=$_r_DebitGrandawaiting+ACC_ar_TransDebitAwaiting{$_l_Index}
				$_r_DebitGrandVatAwaiting:=$_r_DebitGrandVatAwaiting+ACC_ar_TransDebitVatAwaiting{$_l_Index}
				$_r_DebitGrandTOTAwaiting:=$_r_DebitGrandTOTAwaiting+ACC_ar_TransDebitTotalAwaiting{$_l_Index}
			End for 
			If (($_r_DebitGrandTOTAwaiting+$_r_TransGrandTOTAwaiting)=0)
				$_l_ParentID:=ACC_al_TransAwaitsBalanceDebit{1}
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
				$_t_AnalysisCode:=[TRANSACTIONS:29]Analysis_Code:2
				$_t_Period:=[TRANSACTIONS:29]Period_Code:12
				$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
				$_t_LayerCode:=[TRANSACTIONS:29]Layer_Code:23
				
				$_l_ParentBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
				READ WRITE:C146([TRANS_MULTI:128])
				For ($_l_index3; 1; Size of array:C274(ACC_ar_TransCreditAwaiting))
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalance{$_l_index3})
					If ($_t_AnalysisCode=[TRANSACTIONS:29]Analysis_Code:2) & ($_t_Period=[TRANSACTIONS:29]Period_Code:12) & ($_t_CurrencyCode=[TRANSACTIONS:29]Currency_Code:22) & ($_t_LayerCode=[TRANSACTIONS:29]Layer_Code:23)
						$_l_ChildBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
						If ($_l_ChildBatchItemID#0) & (ACC_ar_TransCreditAwaiting{$_l_index3}#0) & ($_l_ParentID#0) & ($_l_ParentBatchItemID#0)
							QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$_l_ParentID; *)
							QUERY:C277([TRANS_MULTI:128];  & ; [TRANS_MULTI:128]x_ManyTransID:5=ACC_al_TransAwaitsBalance{$_l_index3})
							If (Records in selection:C76([TRANS_MULTI:128])=0)
								CREATE RECORD:C68([TRANS_MULTI:128])
							End if 
							[TRANS_MULTI:128]X_OneTransID:2:=$_l_ParentID
							[TRANS_MULTI:128]x_OneBatchItemID:3:=$_l_ParentBatchItemID
							[TRANS_MULTI:128]x_ManyBatchItemID:4:=$_l_ChildBatchItemID
							[TRANS_MULTI:128]x_ManyTransID:5:=ACC_al_TransAwaitsBalance{$_l_index3}
							DB_SaveRecord(->[TRANS_MULTI:128])
						End if 
					End if 
				End for 
			End if 
			
		Else 
			If (True:C214)  // Ng December 2006. I found this was failing to match frequently just slowing things down instead achieving its intended purpose
				$_bo_BreakOut:=False:C215
				//NOT SO SIMPLE!!!!!
				Case of 
					: (Size of array:C274(ACC_al_TransAwaitsBalance)<=Size of array:C274(ACC_ar_TransDebitAwaiting))
						If (False:C215)
							$_ti_DocumentRef:=DB_CreateDocument("Thebatch.txt"; "TEXT")
							For ($_l_Index; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))
								SEND PACKET:C103($_ti_DocumentRef; String:C10(ACC_ar_TransDebitAwaiting{$_l_Index})+Char:C90(13))
							End for 
							SEND PACKET:C103($_ti_DocumentRef; "----"+Char:C90(13))
							
							For ($_l_Index; 1; Size of array:C274(ACC_ar_TransDebitTotalAwaiting))
								SEND PACKET:C103($_ti_DocumentRef; String:C10(ACC_ar_TransDebitTotalAwaiting{$_l_Index})+Char:C90(13))
							End for 
							SEND PACKET:C103($_ti_DocumentRef; "----"+Char:C90(13))
							For ($_l_Index; 1; Size of array:C274(ACC_ar_TransCreditTotalAwaiting))
								SEND PACKET:C103($_ti_DocumentRef; String:C10(ACC_ar_TransCreditTotalAwaiting{$_l_Index})+Char:C90(13))
							End for 
							SEND PACKET:C103($_ti_DocumentRef; "----"+Char:C90(13))
							CLOSE DOCUMENT:C267($_ti_DocumentRef)
							$_ti_DocumentRef:=DB_OpenDocument("Thebatch.txt")
							RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Text; 32767)
							CREATE RECORD:C68([DIARY:12])
							[DIARY:12]Action_Details:10:=$_t_Text
							DB_SaveRecord(->[DIARY:12])
						End if 
						
						$_l_PairsID:=1
						ARRAY BOOLEAN:C223($_abo_isSet; 0)
						ARRAY LONGINT:C221($_al_ToSkip; 0; 0)
						ARRAY LONGINT:C221($_al_ToStart; 0)
						ARRAY BOOLEAN:C223($_abo_isSet; Size of array:C274(ACC_al_TransAwaitsBalance))
						ARRAY LONGINT:C221($_al_ToSkip; Size of array:C274(ACC_al_TransAwaitsBalance); 0)
						ARRAY LONGINT:C221($_al_ToStart; Size of array:C274(ACC_al_TransAwaitsBalance))
						$_l_SkipSteps:=Size of array:C274(ACC_ar_TransDebitAwaiting)
						$_l_SkipQuantity:=1
						$_bo_BreakOut:=False:C215
						$_l_Index2count:=0
						Repeat   //1
							For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalance))  //1a
								If ($_abo_isSet{$_l_Index}=False:C215)  //2
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalance{$_l_Index})
									$_t_AnalysisCode:=[TRANSACTIONS:29]Analysis_Code:2
									$_t_Period:=[TRANSACTIONS:29]Period_Code:12
									$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
									$_t_LayerCode:=[TRANSACTIONS:29]Layer_Code:23
									
									$_r_Amount:=ACC_ar_TransCreditAwaiting{$_l_Index}
									$_r_TotalTest:=0
									ARRAY LONGINT:C221($_al_TempPairID; 0)
									ARRAY LONGINT:C221($_al_TempPairID; Size of array:C274(ACC_ar_TransDebitAwaiting))
									$_bo_isSet:=False:C215
									For ($_l_Index2; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))  //3
										
										If ($_l_Index2>=$_al_ToStart{$_l_Index})
											$_l_SkipRowPosition:=Find in array:C230($_al_ToSkip{$_l_Index}; $_l_Index2)
											If ($_l_SkipRowPosition<0)
												If (Abs:C99($_r_TotalTest+ACC_ar_TransDebitTotalAwaiting{$_l_Index2})<=Abs:C99(ACC_ar_TransCreditTotalAwaiting{$_l_Index})) & (ACC_al_TransPairIDsDEB{$_l_Index2}=0)  //3a
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalanceDebit{$_l_Index2})
													If ($_t_AnalysisCode=[TRANSACTIONS:29]Analysis_Code:2) & ($_t_Period=[TRANSACTIONS:29]Period_Code:12) & ($_t_CurrencyCode=[TRANSACTIONS:29]Currency_Code:22) & ($_t_LayerCode=[TRANSACTIONS:29]Layer_Code:23)  //4
														$_r_TotalTest:=$_r_TotalTest+ACC_ar_TransDebitTotalAwaiting{$_l_Index2}
														$_al_TempPairID{$_l_Index2}:=$_l_PairsID
														If ((Abs:C99($_r_TotalTest))=(Abs:C99(ACC_ar_TransCreditTotalAwaiting{$_l_Index})))  //5
															ACC_al_TransPairIDs{$_l_Index}:=$_l_PairsID
															For ($_l_index3; 1; Size of array:C274($_al_TempPairID))  //6
																If ($_al_TempPairID{$_l_index3}=$_l_PairsID)  //7
																	ACC_al_TransPairIDsDEB{$_l_index3}:=$_l_PairsID
																	$_l_Index2count:=$_l_Index2count+1  // count the number we have set
																End if   //7
															End for   //6
															$_l_PairsID:=$_l_PairsID+1
															$_l_Index2:=Size of array:C274(ACC_ar_TransDebitAwaiting)
															$_bo_isSet:=True:C214
														End if   //5
													End if   //4
												End if   //3a
											End if 
										End if 
									End for   //3
									If ($_bo_isSet)  //8
										$_abo_isSet{$_l_Index}:=True:C214
										$_l_SkipSteps:=Size of array:C274(ACC_ar_TransDebitAwaiting)
									End if   //8
								End if   //2
							End for   //1a
							$_l_SetCount:=0
							For ($_l_tSetIndex; 1; Size of array:C274($_abo_isSet))  //9
								If ($_abo_isSet{$_l_tSetIndex})  //10
									$_l_SetCount:=$_l_SetCount+1
								End if   //10
							End for   //9
							//$_bo_BreakOut:=True
							If ($_l_SetCount<=Size of array:C274($_abo_isSet))  //11
								For ($_l_Index2; 1; Size of array:C274($_al_ToSkip))  //12
									If ($_abo_isSet{$_l_Index2}=False:C215)  //13
										//this one is not set
										$_l_Index2ax:=Size of array:C274(ACC_al_TransPairIDsDEB)
										$_l_Index2ax2:=Size of array:C274(ACC_al_TransAwaitsBalance)
										If (Size of array:C274($_al_ToSkip{$_l_Index2})>=$_l_Index2ax) | ($_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}>=$_l_Index2ax)  //14
											If ($_l_SkipSteps=1)
												$_bo_BreakOut:=True:C214
											Else 
												$_l_SkipSteps:=$_l_SkipSteps-1
												// we cannot set this one
											End if 
										Else   //14
											$_l_CurrentStart:=$_al_ToStart{$_l_Index2}
											If ($_l_CurrentStart>=$_l_Index2ax)
												$_al_ToStart{$_l_Index2}:=1
												If (Size of array:C274($_al_ToSkip{$_l_Index2})>0)  //15
													$_l_Current:=$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}
													$_l_NextSkip:=$_l_Current+$_l_SkipSteps
													If ($_l_NextSkip<$_l_Index2ax)
														INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_NextSkip
													Else   //15
														INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_Index2ax
													End if 
												Else 
													INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
													If ($_l_Index2<Size of array:C274($_al_ToSkip))
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_Index2+1
													Else 
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=1
													End if 
													
												End if   //15
											Else 
												$_al_ToStart{$_l_Index2}:=$_al_ToStart{$_l_Index2}+1
												If (Size of array:C274($_al_ToSkip{$_l_Index2})>0)
													//   DELETE ELEMENT($_al_ToSkip{$_l_Index2};1;Size of array($_al_ToSkip{$_l_Index2}))
												End if 
												
											End if 
											
										End if   //14
									End if   //13
								End for   //12
							End if   //11
							
						Until ($_l_SetCount=Size of array:C274($_abo_isSet)) | ($_bo_BreakOut)
						If (Not:C34($_bo_BreakOut))
							For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalance))  //1a
								$_l_ParentID:=ACC_al_TransAwaitsBalance{$_l_Index}
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
								$_l_ParentBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
								$_l_PairsID:=ACC_al_TransPairIDs{$_l_Index}
								
								For ($_l_Index2; 1; Size of array:C274(ACC_ar_TransDebitAwaiting))  //3
									If (ACC_al_TransPairIDsDEB{$_l_Index2}=$_l_PairsID)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalanceDebit{$_l_Index2})
										$_l_ChildBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
										If ($_l_ChildBatchItemID#0) & (ACC_al_TransAwaitsBalanceDebit{$_l_Index2}#0) & ($_l_ParentID#0) & ($_l_ParentBatchItemID#0)
											QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=ACC_al_TransAwaitsBalance{$_l_Index}; *)
											QUERY:C277([TRANS_MULTI:128];  & ; [TRANS_MULTI:128]x_ManyTransID:5=ACC_al_TransAwaitsBalanceDebit{$_l_Index2})
											If (Records in selection:C76([TRANS_MULTI:128])=0)
												CREATE RECORD:C68([TRANS_MULTI:128])
											End if 
											[TRANS_MULTI:128]X_OneTransID:2:=ACC_al_TransAwaitsBalance{$_l_Index}
											[TRANS_MULTI:128]x_OneBatchItemID:3:=$_l_ParentBatchItemID
											[TRANS_MULTI:128]x_ManyBatchItemID:4:=$_l_ChildBatchItemID
											[TRANS_MULTI:128]x_ManyTransID:5:=ACC_al_TransAwaitsBalanceDebit{$_l_Index2}
											DB_SaveRecord(->[TRANS_MULTI:128])
										End if 
									End if 
									
								End for 
							End for 
						End if 
						
					: (Size of array:C274(ACC_al_TransAwaitsBalance)>Size of array:C274(ACC_ar_TransDebitAwaiting))
						
						$_l_PairsID:=1
						ARRAY BOOLEAN:C223($_abo_isSet; 0)
						ARRAY LONGINT:C221($_al_ToSkip; 0; 0)
						ARRAY LONGINT:C221($_al_ToStart; 0)
						ARRAY BOOLEAN:C223($_abo_isSet; Size of array:C274(ACC_al_TransAwaitsBalanceDebit))
						ARRAY LONGINT:C221($_al_ToSkip; Size of array:C274(ACC_al_TransAwaitsBalanceDebit); 0)
						ARRAY LONGINT:C221($_al_ToStart; Size of array:C274(ACC_al_TransAwaitsBalanceDebit))
						$_l_SkipSteps:=Size of array:C274(ACC_ar_TransCreditAwaiting)
						$_l_SkipQuantity:=1
						Repeat 
							For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalanceDebit))
								If ($_abo_isSet{$_l_Index}=False:C215)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalanceDebit{$_l_Index})
									$_t_AnalysisCode:=[TRANSACTIONS:29]Analysis_Code:2
									$_t_Period:=[TRANSACTIONS:29]Period_Code:12
									$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
									$_t_LayerCode:=[TRANSACTIONS:29]Layer_Code:23
									
									$_r_Amount:=ACC_ar_TransDebitAwaiting{$_l_Index}
									$_r_TotalTest:=0
									ARRAY LONGINT:C221($_al_TempPairID; 0)
									ARRAY LONGINT:C221($_al_TempPairID; Size of array:C274(ACC_ar_TransCreditAwaiting))
									$_bo_isSet:=False:C215
									For ($_l_Index2; 1; Size of array:C274(ACC_ar_TransCreditAwaiting))
										If ($_l_Index2>=$_al_ToStart{$_l_Index})
											$_l_SkipRowPosition:=Find in array:C230($_al_ToSkip{$_l_Index}; $_l_Index2)
											If ($_l_SkipRowPosition<0)
												If (Abs:C99($_r_TotalTest+ACC_ar_TransCreditTotalAwaiting{$_l_Index2})<=Abs:C99(ACC_ar_TransDebitTotalAwaiting{$_l_Index})) & (ACC_al_TransPairIDs{$_l_Index2}=0)
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalance{$_l_Index2})
													If ($_t_AnalysisCode=[TRANSACTIONS:29]Analysis_Code:2) & ($_t_Period=[TRANSACTIONS:29]Period_Code:12) & ($_t_CurrencyCode=[TRANSACTIONS:29]Currency_Code:22) & ($_t_LayerCode=[TRANSACTIONS:29]Layer_Code:23)
														$_r_TotalTest:=$_r_TotalTest+ACC_ar_TransCreditTotalAwaiting{$_l_Index2}
														$_al_TempPairID{$_l_Index2}:=$_l_PairsID
														If ((Abs:C99($_r_TotalTest))=(Abs:C99(ACC_ar_TransDebitTotalAwaiting{$_l_Index})))
															ACC_al_TransPairIDsDEB{$_l_Index}:=$_l_PairsID
															For ($_l_index3; 1; Size of array:C274($_al_TempPairID))
																If ($_al_TempPairID{$_l_index3}=$_l_PairsID)
																	ACC_al_TransPairIDs{$_l_index3}:=$_l_PairsID
																End if 
															End for 
															$_l_PairsID:=$_l_PairsID+1
															$_l_Index2:=Size of array:C274(ACC_ar_TransCreditAwaiting)
															$_bo_isSet:=True:C214
														End if 
													End if 
												End if 
											End if 
										End if 
										
									End for 
									If ($_bo_isSet)
										$_abo_isSet{$_l_Index}:=True:C214
									End if 
								End if 
							End for 
							$_l_SetCount:=0
							For ($_l_tSetIndex; 1; Size of array:C274($_abo_isSet))
								If ($_abo_isSet{$_l_tSetIndex})
									$_l_SetCount:=$_l_SetCount+1
								End if 
							End for 
							$_bo_BreakOut:=True:C214
							If ($_l_SetCount<=Size of array:C274($_abo_isSet))
								For ($_l_Index2; 1; Size of array:C274($_abo_isSet))
									If ($_abo_isSet{$_l_Index2}=False:C215)
										//this one is not set
										$_l_Index2ax:=Size of array:C274(ACC_al_TransAwaitsBalance)
										$_l_Index2ax2:=Size of array:C274(ACC_al_TransPairIDsDEB)
										If (Size of array:C274($_al_ToSkip{$_l_Index2})>=$_l_Index2ax) | ($_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}>=$_l_Index2ax)
											If ($_l_SkipSteps=1)
												$_bo_BreakOut:=True:C214
												// we cannot set this one
											Else 
												$_l_SkipSteps:=$_l_SkipSteps-1
											End if 
										Else 
											$_l_CurrentStart:=$_al_ToStart{$_l_Index2}
											If ($_l_CurrentStart>=$_l_Index2ax)
												$_al_ToStart{$_l_Index2}:=1
												
												If (Size of array:C274($_al_ToSkip{$_l_Index2})>0)
													$_l_Current:=$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}
													$_l_NextSkip:=$_l_Current+$_l_SkipSteps
													If ($_l_NextSkip<$_l_Index2ax)
														INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_NextSkip
													Else 
														INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_Index2ax
													End if 
												Else 
													INSERT IN ARRAY:C227($_al_ToSkip{$_l_Index2}; Size of array:C274($_al_ToSkip{$_l_Index2})+1; 1)
													If ($_l_Index2<Size of array:C274($_al_ToSkip))
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=$_l_Index2+1
													Else 
														$_al_ToSkip{$_l_Index2}{Size of array:C274($_al_ToSkip{$_l_Index2})}:=1
													End if 
												End if 
											Else 
												$_al_ToStart{$_l_Index2}:=$_al_ToStart{$_l_Index2}+1
												If (Size of array:C274($_al_ToSkip{$_l_Index2})>0)
													//DELETE ELEMENT($_al_ToSkip{$_l_Index2};1;Size of array($_al_ToSkip{$_l_Index2}))
												End if 
											End if 
											
										End if 
									End if 
									
								End for 
							End if 
							
						Until ($_l_SetCount=Size of array:C274($_abo_isSet)) | ($_bo_BreakOut)
						If (Not:C34($_bo_BreakOut))
							For ($_l_Index; 1; Size of array:C274(ACC_al_TransAwaitsBalanceDebit))  //1a
								$_l_ParentID:=ACC_al_TransAwaitsBalanceDebit{$_l_Index}
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
								$_l_ParentBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
								$_l_PairsID:=ACC_al_TransPairIDsDEB{$_l_Index}
								For ($_l_Index2; 1; Size of array:C274(ACC_ar_TransCreditAwaiting))  //3
									If (ACC_al_TransPairIDs{$_l_Index2}=$_l_PairsID)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ACC_al_TransAwaitsBalance{$_l_Index2})
										$_l_ChildBatchItemID:=[TRANSACTIONS:29]BatchItem_X_ID:30
										If ($_l_ChildBatchItemID#0) & (ACC_al_TransAwaitsBalance{$_l_Index2}#0) & ($_l_ParentID#0) & ($_l_ParentBatchItemID#0)
											QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$_l_ParentID; *)
											QUERY:C277([TRANS_MULTI:128];  & ; [TRANS_MULTI:128]x_ManyTransID:5=ACC_al_TransAwaitsBalance{$_l_Index2})
											If (Records in selection:C76([TRANS_MULTI:128])=0)
												CREATE RECORD:C68([TRANS_MULTI:128])
											End if 
											[TRANS_MULTI:128]X_OneTransID:2:=$_l_ParentID
											[TRANS_MULTI:128]x_OneBatchItemID:3:=$_l_ParentBatchItemID
											[TRANS_MULTI:128]x_ManyBatchItemID:4:=$_l_ChildBatchItemID
											[TRANS_MULTI:128]x_ManyTransID:5:=ACC_al_TransAwaitsBalance{$_l_Index2}
											DB_SaveRecord(->[TRANS_MULTI:128])
										End if 
									End if 
									
								End for 
							End for 
						End if 
						
						
				End case 
			End if 
			
	End case 
	
	
End if 
ERR_MethodTrackerReturn("ACC_TRANSACTIONMATCHPAIRS"; $_t_oldMethodName)
