//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_PostNom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OIItemNumber; 0)
	ARRAY LONGINT:C221($_al_STIitemNumbers; 0)
	ARRAY REAL:C219($_ar_STICostPrices; 0)
	ARRAY REAL:C219($_ar_STIQuantities; 0)
	ARRAY TEXT:C222($_at_OIInvoiceNo; 0)
	ARRAY TEXT:C222($_at_ProductsProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductsPurchaseAccounts; 0)
	ARRAY TEXT:C222($_at_ProductsPurchaseStockAccoun; 0)
	ARRAY TEXT:C222($_at_SIProductCodes; 0)
	C_BOOLEAN:C305(<>PersAnOver; <>StockPostIt; STK_bo_InvertTransactionType)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockMovementDate; $_d_TransDate; $2)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_orderItemRow; $_l_PeriodID; $_l_PostIndex; $_l_ProductCodeRow; $_l_SizeofArray; $_l_StockMovementItems; $_l_TransPostStatus; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_MovementTotalCost; $6)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_AccountCode; $_t_AccountingPeriod; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_MovementCompanyFrom; $_t_MovementTypeNo; $_t_MovementTypesTransCode; $_t_MoveTypeNumberName)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; $_t_ProductPurchAcc; $_t_ProductStockAcc; $_t_StockMovementCode; $1; $10; $11; $3; $4; $5)
	C_TEXT:C284($7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_PostNom")
//Movement Post to Nominal
If (Count parameters:C259>=1)
	$_t_StockMovementCode:=$1
Else 
	$_t_StockMovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
End if 
If (Count parameters:C259>=2)
	$_d_StockMovementDate:=$2
Else 
	$_d_StockMovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
End if 
If (Count parameters:C259>=3)
	$_t_MovementTypeNo:=$3
Else 
	$_t_MovementTypeNo:=[STOCK_MOVEMENTS:40]Type_Number:4
End if 
If (Count parameters:C259>=4)
	$_t_MovementTypesTransCode:=$4
Else 
	$_t_MovementTypesTransCode:=[MOVEMENT_TYPES:60]Trans_Code:17
End if 

If (Count parameters:C259>=5)
	$_t_MoveTypeNumberName:=$5
Else 
	$_t_MoveTypeNumberName:=[MOVEMENT_TYPES:60]Number_Name:5
End if 
If (Count parameters:C259>=6)
	$_r_MovementTotalCost:=$6
Else 
	$_r_MovementTotalCost:=[STOCK_MOVEMENTS:40]Total_Cost:8
End if 
If (Count parameters:C259>=7)
	$_t_MovementCompanyFrom:=$7
Else 
	$_t_MovementCompanyFrom:=[STOCK_MOVEMENTS:40]Company_From:2
End if 
If (Count parameters:C259>=8)
	$_t_AnalysisCode:=$8
Else 
	$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
End if 
If (Count parameters:C259>=9)
	$_t_CurrencyCode:=$9
Else 
	$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
End if 
If (Count parameters:C259>=10)
	$_t_LayerCode:=$10
Else 
	$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
End if 
If (Count parameters:C259>=11)
	$_t_AccountingPeriod:=$11
Else 
	$_t_AccountingPeriod:=""
End if 
If ((OK=1) & ($_t_MovementTypesTransCode#"") & (DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & ($_r_MovementTotalCost#0))
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$_t_MovementTypesTransCode)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$_t_MovementTypesTransCode)
	End if 
	//RELATE ONE([MOVEMENT TYPES]Trans Code)
	If (([TRANSACTION_TYPES:31]Transaction_Type_Code:1#"") & ([TRANSACTION_TYPES:31]Debit_Account:4#"") & ([TRANSACTION_TYPES:31]Credit_Account:5#""))
		
		//vDate:=[STOCK MOVEMENTS]Movement Date
		If ($_t_AccountingPeriod="")
			$_l_PeriodID:=Check_Period($_d_StockMovementDate)
			$_t_PeriodCode:=""
			$_d_TransDate:=$_d_StockMovementDate
			Check_PerClose(->$_t_PeriodCode; ->$_d_TransDate)
		Else 
			$_t_PeriodCode:=$_t_AccountingPeriod
			$_d_TransDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
		End if 
		If ($_d_TransDate=!00-00-00!)
			If (Application type:C494#4D Server:K5:6)
				Gen_Alert("The General Ledger posting of this of "+Term_StoWT("Stock")+" Movement has not taken place:"+" no valid Period found."; "")
			End if 
			OK:=0
		Else 
			$_l_TransPostStatus:=0
			StartTransaction
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			CREATE RECORD:C68([TRANSACTION_BATCHES:30])
			BatchNo
			If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
				If (Application type:C494#4D Server:K5:6)
					Gen_Alert("The General Ledger posting of this of "+Term_StoWT("Stock")+" Movement has not taken place:"+" the Batch could not be created."; "")
				End if 
				OK:=0
				$_l_TransPostStatus:=-1
			Else 
				[TRANSACTION_BATCHES:30]Batch_Date:1:=$_d_StockMovementDate
				[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
				If (STK_bo_InvertTransactionType)
					[TRANSACTION_BATCHES:30]Description:12:="Posting of  "+Term_StoWT("Stock")+" Reversing Movement "+$_t_StockMovementCode+" ("+$_t_MoveTypeNumberName+" "+$_t_MovementTypeNo+")"
				Else 
					[TRANSACTION_BATCHES:30]Description:12:="Posting of  "+Term_StoWT("Stock")+" Movement "+$_t_StockMovementCode+" ("+$_t_MoveTypeNumberName+" "+$_t_MovementTypeNo+")"
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_StockMovementCode)
				$_l_StockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				If (<>StockPostIt)
					
					//FIRST RECORD([STOCK ITEMS])
					$_l_StockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					If (STK_bo_InvertTransactionType)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_STIQuantities; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_STIitemNumbers; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; $_ar_STICostPrices)
						
					Else 
						
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_STIQuantities; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_STIitemNumbers; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_STICostPrices)
					End if 
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_SIProductCodes)
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductsProductCodes; [PRODUCTS:9]Purchase_Account:13; $_at_ProductsPurchaseAccounts; [PRODUCTS:9]Stock_Account:42; $_at_ProductsPurchaseStockAccoun)
					QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_STIitemNumbers)
					SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumber; [ORDER_ITEMS:25]Invoice_Number:17; $_at_OIInvoiceNo)
					$_l_SizeofArray:=Size of array:C274($_at_SIProductCodes)
					$_l_BatchItemReference:=0
					$_l_BatchItemID:=0
					If ($_l_SizeofArray>1)
						$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_SizeofArray))-$_l_SizeofArray
						$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_SizeofArray))-$_l_SizeofArray
					End if 
					
					For ($_l_PostIndex; 1; $_l_SizeofArray)
						//While (Not(End selection([STOCK ITEMS])))
						CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
						If ($_l_BatchItemID>0)
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
							$_l_BatchItemID:=$_l_BatchItemID+1
						Else 
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
						End if 
						
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_t_MovementTypesTransCode
						If (STK_bo_InvertTransactionType)
							[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2+" Reversed :"+$_at_SIProductCodes{$_l_PostIndex}
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2+": "+$_at_SIProductCodes{$_l_PostIndex}
						End if 
						$_t_ProductPurchAcc:=""
						$_t_ProductStockAcc:=""
						If ($_at_SIProductCodes{$_l_PostIndex}#"")
							$_l_ProductCodeRow:=Find in array:C230($_at_ProductsProductCodes; $_at_SIProductCodes{$_l_PostIndex})
							If ($_l_ProductCodeRow>0)
								$_t_ProductPurchAcc:=$_at_ProductsPurchaseAccounts{$_l_ProductCodeRow}
								$_t_ProductStockAcc:=$_at_ProductsPurchaseStockAccoun{$_l_ProductCodeRow}
							End if 
							
						End if 
						
						If ($_t_ProductPurchAcc#"")
							If ([MOVEMENT_TYPES:60]Trans_Credit:20)
								If ((([TRANSACTION_TYPES:31]C_Range_F:11="") & ([TRANSACTION_TYPES:31]C_Range_T:12="")) | ([TRANSACTION_TYPES:31]C_Enforce:14=False:C215) | (($_t_ProductPurchAcc>=[TRANSACTION_TYPES:31]C_Range_F:11) & ($_t_ProductPurchAcc<=[TRANSACTION_TYPES:31]C_Range_T:12)))
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_ProductPurchAcc
								Else 
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
							Else 
								If ((([TRANSACTION_TYPES:31]D_Range_F:9="") & ([TRANSACTION_TYPES:31]D_Range_T:10="")) | ([TRANSACTION_TYPES:31]D_Enforce:13=False:C215) | (($_t_ProductPurchAcc>=[TRANSACTION_TYPES:31]D_Range_F:9) & ($_t_ProductPurchAcc<=[TRANSACTION_TYPES:31]D_Range_T:10)))
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_t_ProductPurchAcc
								Else 
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
							End if 
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
							[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
						End if 
						
						If ($_t_ProductStockAcc#"")
							If ([MOVEMENT_TYPES:60]Trans_Credit:20=False:C215)
								If ((([TRANSACTION_TYPES:31]C_Range_F:11="") & ([TRANSACTION_TYPES:31]C_Range_T:12="")) | ([TRANSACTION_TYPES:31]C_Enforce:14=False:C215) | (($_t_ProductStockAcc>=[TRANSACTION_TYPES:31]C_Range_F:11) & ($_t_ProductStockAcc<=[TRANSACTION_TYPES:31]C_Range_T:12)))
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_ProductStockAcc
								End if 
							Else 
								If ((([TRANSACTION_TYPES:31]D_Range_F:9="") & ([TRANSACTION_TYPES:31]D_Range_T:10="")) | ([TRANSACTION_TYPES:31]D_Enforce:13=False:C215) | (($_t_ProductStockAcc>=[TRANSACTION_TYPES:31]D_Range_F:9) & ($_t_ProductStockAcc<=[TRANSACTION_TYPES:31]D_Range_T:10)))
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_t_ProductStockAcc
								End if 
							End if 
						End if 
						
						If ($_ar_STIQuantities{$_l_PostIndex}<0) | (STK_bo_InvertTransactionType)
							$_t_AccountCode:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
							[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
							[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_AccountCode
						End if 
						
						If ($_t_AnalysisCode#"")
							[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_t_AnalysisCode
						Else 
							If (<>PersAnOver)
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=<>Per_t_CurrentDefaultAnalCode
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
							End if 
						End if 
						If ($_t_CurrencyCode#"")
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_t_CurrencyCode
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
						End if 
						If ($_t_LayerCode#"")
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_t_LayerCode
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
						End if 
						TransB_DC
						[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_t_MovementCompanyFrom
						If ($_al_STIitemNumbers{$_l_PostIndex}>0)
							$_l_orderItemRow:=Find in array:C230($_al_OIItemNumber; $_al_STIitemNumbers{$_l_PostIndex})
							If ($_l_orderItemRow>0)
								[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_OIInvoiceNo{$_l_orderItemRow}
							End if 
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=""
						End if 
						[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=""  //Transferred from Purch Inv / Purch Ord??
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_StockMovementDate
						//TRACE
						[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodCode
						[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
						[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round(($_ar_STICostPrices{$_l_PostIndex}*Abs:C99($_ar_STIQuantities{$_l_PostIndex})); 2; 2)  //[STOCK ITEMS]Total Cost
						[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
						[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6  //[STOCK ITEMS]Total Cost
						[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"  //When would it be E???
						If ($_l_BatchItemReference>0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
							$_l_BatchItemReference:=$_l_BatchItemReference+1
						Else 
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						
						//NEXT RECORD([STOCK ITEMS])
						//End while
					End for 
					
				Else 
					CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
					
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_t_MovementTypesTransCode
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2+": "+String:C10($_l_StockMovementItems)+" Items"
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					If (STK_bo_InvertTransactionType)
						$_t_AccountCode:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
						[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
						[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_AccountCode
					End if 
					
					TransB_DC
					[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_t_MovementCompanyFrom
					[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=""  //Transferred from Invoice?
					[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=""  //Transferred from Purch Inv / Purch Ord??
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_StockMovementDate
					//TRACE
					[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodCode
					[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
					[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_MovementTotalCost
					[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
					[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_r_MovementTotalCost
					[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"  //When would it be E???
					If ($_t_AnalysisCode#"")
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_t_AnalysisCode
					Else 
						If (<>PersAnOver)
							[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=<>Per_t_CurrentDefaultAnalCode
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
						End if 
					End if 
					If ($_t_CurrencyCode#"")
						[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_t_CurrencyCode
					Else 
						[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
					End if 
					If ($_t_LayerCode#"")
						[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_t_LayerCode
					Else 
						[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
					End if 
					
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					
					
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					
				End if 
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				[TRANSACTION_BATCHES:30]Batch_Amount:3:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
				[TRANSACTION_BATCHES:30]Batch_Total:5:=[TRANSACTION_BATCHES:30]Batch_Amount:3
				DB_SaveRecord(->[TRANSACTION_BATCHES:30])
				If (OK=1)
					$_l_TransPostStatus:=TransactionBatch_Post
				End if 
			End if 
			If ($_l_TransPostStatus>=0)
				//VALIDATE TRANSACTION
				Transact_End(True:C214)
			Else 
				Gen_Alert("The General Ledger posting of this of "+Term_StoWT("Stock")+" Movement has not taken place:"+" the posting of account balances failed"; "")
				//CANCEL TRANSACTION
				Transact_End(False:C215)
			End if 
		End if 
		
	Else 
		Gen_Alert("The General Ledger posting of this of "+Term_StoWT("Stock")+" Movement has not taken place:"+" the Transaction Type in invalid."; "")
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("Move_PostNom"; $_t_oldMethodName)