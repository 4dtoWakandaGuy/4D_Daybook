//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ChangeANAL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:          28/09/2011 15:22 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	//ARRAY TEXT(INV_at_AnalCodes;0)
	//ARRAY TEXT(INV_at_AnalNAmes;0)
	C_LONGINT:C283($_l_IndexBatchNumbers; $_l_IndexTransactions)
	C_TEXT:C284($_t_CurrentAnalysis; $_t_NewAnalysis; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ChangeANAL")
If ([INVOICES:39]Posted_Date:8#!00-00-00!)
	Gen_Confirm("Are you sure you want to change the Analysis on a posted invoice?"; "No"; "Yes")
	If (OK=0)
		OK:=1
		READ WRITE:C146([TRANSACTIONS:29])
		READ WRITE:C146([INVOICES:39])
		READ WRITE:C146([INVOICES_ITEMS:161])
		LOAD RECORD:C52([INVOICES:39])
		READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
		$_t_CurrentAnalysis:=[INVOICES:39]Analysis_Code:17
		ALL RECORDS:C47([ANALYSES:36])
		SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Name:2; INV_at_AnalNAmes; [ANALYSES:36]Analysis_Code:1; INV_at_AnalCodes)
		SORT ARRAY:C229(INV_at_AnalNAmes; INV_at_AnalCodes)
		$_t_NewAnalysis:=Gen_RequestWithList("Select the new analysis"; $_t_CurrentAnalysis; "Continue"; "Stop"; 0; 0; "Analysis"; 0; ""; "INV_at_AnalNAmes")
		If ($_t_NewAnalysis#"") & ($_t_NewAnalysis#$_t_CurrentAnalysis)
			QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1; *)
			QUERY:C277([INVOICES_ITEMS:161];  & ; [INVOICES_ITEMS:161]Analysis_Code:10=$_t_CurrentAnalysis)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			If (Records in selection:C76([INVOICES_ALLOCATIONS:162])=0)
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
				APPLY TO SELECTION:C70([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_t_NewAnalysis)
				
				DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
				For ($_l_IndexBatchNumbers; 1; Size of array:C274($_al_BatchNumbers))
					//because this batch could post multiple invoices.. we must unport the whole back
					QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$_al_BatchNumbers{$_l_IndexBatchNumbers})
					//QUERY([TRANS IN_TRANS SUB];[TRANS IN_TRANS SUB]Parent_record_code=$_al_BatchNumbers{$_l_IndexBatchNumbers})
					//
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_al_BatchNumbers{$_l_IndexBatchNumbers}; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Batch_Number:7=$_t_CurrentAnalysis)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
					FIRST RECORD:C50([TRANSACTIONS:29])
					For ($_l_IndexTransactions; 1; Records in selection:C76([TRANSACTIONS:29]))
						If ([TRANSACTIONS:29]Amount:6>0)
							[TRANSACTIONS:29]Amount:6:=-[TRANSACTIONS:29]Amount:6
						Else 
							[TRANSACTIONS:29]Amount:6:=Abs:C99([TRANSACTIONS:29]Amount:6)
						End if 
						If ([TRANSACTIONS:29]Tax_Amount:16>0)
							[TRANSACTIONS:29]Tax_Amount:16:=-[TRANSACTIONS:29]Tax_Amount:16
						Else 
							[TRANSACTIONS:29]Tax_Amount:16:=Abs:C99([TRANSACTIONS:29]Tax_Amount:16)
						End if 
						SAVE RECORD:C53([TRANSACTIONS:29])
						Post_Balances
						NEXT RECORD:C51([TRANSACTIONS:29])
					End for 
					FIRST RECORD:C50([TRANSACTIONS:29])
					
					For ($_l_IndexTransactions; 1; Records in selection:C76([TRANSACTIONS:29]))
						[TRANSACTIONS:29]Analysis_Code:2:=$_t_NewAnalysis
						If ([TRANSACTIONS:29]Amount:6>0)
							[TRANSACTIONS:29]Amount:6:=-[TRANSACTIONS:29]Amount:6
						Else 
							[TRANSACTIONS:29]Amount:6:=Abs:C99([TRANSACTIONS:29]Amount:6)
						End if 
						If ([TRANSACTIONS:29]Tax_Amount:16>0)
							[TRANSACTIONS:29]Tax_Amount:16:=-[TRANSACTIONS:29]Tax_Amount:16
						Else 
							[TRANSACTIONS:29]Tax_Amount:16:=Abs:C99([TRANSACTIONS:29]Tax_Amount:16)
						End if 
						SAVE RECORD:C53([TRANSACTIONS:29])
						Post_Balances
						NEXT RECORD:C51([TRANSACTIONS:29])
					End for 
					APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Analysis_Code:10:=$_t_NewAnalysis)
					[INVOICES:39]Analysis_Code:17:=$_t_NewAnalysis
					AA_CheckUUID(Table:C252(->[INVOICES:39]))
					
					SAVE RECORD:C53([INVOICES:39])
					
				End for 
				
				//repost the batch
				
				
			Else 
				Gen_Alert("Sorry-you cant change the analsis on a paid invoice!")
			End if 
		End if 
		
	End if 
	OK:=1
Else 
	Gen_Alert("This is only applicable for posted invoices")
	GOTO OBJECT:C206([INVOICES:39]Analysis_Code:17)
	
End if 
ERR_MethodTrackerReturn("INV_ChangeANAL"; $_t_oldMethodName)