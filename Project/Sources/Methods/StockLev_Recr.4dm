//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_Recr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 11:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CSItemNumbers; 0)
	ARRAY REAL:C219($_ar_CSCostPrices; 0)
	ARRAY REAL:C219($_ar_CSQuantities; 0)
	ARRAY TEXT:C222($_at_CSAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CSCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CSLayerCodes; 0)
	ARRAY TEXT:C222($_at_CSStockType; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283($_l_CurrentStockRow; $_l_NumberofCurrentStock; $_l_NumberofProductCodes; $_l_ProductRow; vPu)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_productCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_Recr")
//StockLev_Recreate
Start_Process
Gen_Confirm("This Utility recreates all Stock Levels from the records in the Current Stock fi"+"le.  All existing Levels will first be deleted.")
If (OK=1)
	Gen_Confirm("Please do not run this Utility while any other users are using Stock Control")
	If (OK=1)
		If (StockLev_File)
			While (vPu=1)
				Open_Pro_Window("Recreate Stock Levels")
				Gen_Confirm("Are you sure you want to proceed?")
				If (OK=1)
					//  START TRANSACTION
					StartTransaction  // 13/05/02 pb
					
					READ WRITE:C146([STOCK_LEVELS:58])
					ALL RECORDS:C47([STOCK_LEVELS:58])
					MESSAGE:C88(Char:C90(13)+"   Deleting Existing Levels"+Char:C90(13))
					DELETE SELECTION:C66([STOCK_LEVELS:58])
					If (OK=1)
						ALL RECORDS:C47([CURRENT_STOCK:62])
						ARRAY TEXT:C222($_at_ProductCodes; 0)
						MESSAGE:C88(Char:C90(13)+"   Building Table of Products"+Char:C90(13))
						DISTINCT VALUES:C339([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes)
						$_l_NumberofProductCodes:=Size of array:C274($_at_ProductCodes)
						$_l_ProductRow:=1
						MESSAGES OFF:C175
						MESSAGE:C88(Char:C90(13)+"   Processing ..."+Char:C90(13))
						While ((OK=1) & ($_l_ProductRow<=$_l_NumberofProductCodes))
							
							MESSAGE:C88(Char:C90(13)+"      "+$_at_ProductCodes{$_l_ProductRow})
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_ProductRow})
							ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3; >; [CURRENT_STOCK:62]Currency_Code:11; >; [CURRENT_STOCK:62]Layer_Code:12; >; [CURRENT_STOCK:62]Analysis_Code:10; >)
							ARRAY TEXT:C222($_at_CSStockType; 0)
							ARRAY REAL:C219($_ar_CSQuantities; 0)
							ARRAY LONGINT:C221($_al_CSItemNumbers; 0)
							ARRAY REAL:C219($_ar_CSCostPrices; 0)
							ARRAY TEXT:C222($_at_CSAnalysisCodes; 0)
							ARRAY TEXT:C222($_at_CSCurrencyCodes; 0)
							ARRAY TEXT:C222($_at_CSLayerCodes; 0)
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; $_at_CSStockType; [CURRENT_STOCK:62]Quantity:4; $_ar_CSQuantities; [CURRENT_STOCK:62]Item_Number:5; $_al_CSItemNumbers; [CURRENT_STOCK:62]Cost_Price:6; $_ar_CSCostPrices; [CURRENT_STOCK:62]Analysis_Code:10; $_at_CSAnalysisCodes; [CURRENT_STOCK:62]Currency_Code:11; $_at_CSCurrencyCodes; [CURRENT_STOCK:62]Layer_Code:12; $_at_CSLayerCodes)
							If (OK=1)
								
								$_l_NumberofCurrentStock:=Size of array:C274($_at_CSStockType)
								$_l_CurrentStockRow:=1
								While ((OK=1) & ($_l_CurrentStockRow<=$_l_NumberofCurrentStock))
									$_t_productCode:=$_at_ProductCodes{$_l_ProductRow}
									While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
										DelayTicks(2)
									End while 
									
									CREATE RECORD:C68([STOCK_LEVELS:58])
									[STOCK_LEVELS:58]Product_Code:1:=$_at_ProductCodes{$_l_ProductRow}
									[STOCK_LEVELS:58]Stock_Type:2:=$_at_CSStockType{$_l_CurrentStockRow}
									If ($_al_CSItemNumbers{$_l_CurrentStockRow}=0)
										[STOCK_LEVELS:58]Free_Level:3:=$_ar_CSQuantities{$_l_CurrentStockRow}
										[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
									Else 
										[STOCK_LEVELS:58]Allocated_Level:4:=$_ar_CSQuantities{$_l_CurrentStockRow}
										[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
									End if 
									If (<>StockAnal)
										[STOCK_LEVELS:58]Analysis_Code:7:=$_at_CSAnalysisCodes{$_l_CurrentStockRow}
									End if 
									If ($_at_CSCurrencyCodes{$_l_CurrentStockRow}="")
										[STOCK_LEVELS:58]Currency_Code:8:=<>SYS_t_BaseCurrency
									Else 
										[STOCK_LEVELS:58]Currency_Code:8:=$_at_CSCurrencyCodes{$_l_CurrentStockRow}
									End if 
									If ($_at_CSLayerCodes{$_l_CurrentStockRow}="")
										[STOCK_LEVELS:58]Layer_Code:9:=DB_GetLedgerActualLayer
									Else 
										[STOCK_LEVELS:58]Layer_Code:9:=$_at_CSLayerCodes{$_l_CurrentStockRow}
									End if 
									$_l_CurrentStockRow:=$_l_CurrentStockRow+1
									If ($_l_CurrentStockRow<=$_l_NumberofCurrentStock)
										While (($_l_CurrentStockRow<$_l_NumberofCurrentStock) & ([STOCK_LEVELS:58]Stock_Type:2=$_at_CSStockType{$_l_CurrentStockRow}) & (([STOCK_LEVELS:58]Analysis_Code:7=$_at_CSAnalysisCodes{$_l_CurrentStockRow}) | (<>StockAnal=False:C215)) & (([STOCK_LEVELS:58]Currency_Code:8=$_at_CSCurrencyCodes{$_l_CurrentStockRow}) | (([STOCK_LEVELS:58]Currency_Code:8="") & ($_at_CSCurrencyCodes{$_l_CurrentStockRow}=<>SYS_t_BaseCurrency)) | (([STOCK_LEVELS:58]Currency_Code:8=<>SYS_t_BaseCurrency) & ($_at_CSCurrencyCodes{$_l_CurrentStockRow}=""))) & (([STOCK_LEVELS:58]Layer_Code:9=$_at_CSLayerCodes{$_l_CurrentStockRow}) | (([STOCK_LEVELS:58]Layer_Code:9="") & ($_at_CSLayerCodes{$_l_CurrentStockRow}=DB_GetLedgerActualLayer)) | (([STOCK_LEVELS:58]Layer_Code:9=DB_GetLedgerActualLayer) & ($_at_CSLayerCodes{$_l_CurrentStockRow}=""))))
											If ($_al_CSItemNumbers{$_l_CurrentStockRow}=0)
												[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
												[STOCK_LEVELS:58]Free_Cost:5:=Round:C94([STOCK_LEVELS:58]Free_Cost:5+($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
											Else 
												[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
												[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94([STOCK_LEVELS:58]Allocated_Cost:6+($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
											End if 
											$_l_CurrentStockRow:=$_l_CurrentStockRow+1
										End while 
										If ($_l_CurrentStockRow=$_l_NumberofCurrentStock)
											If (([STOCK_LEVELS:58]Stock_Type:2=$_at_CSStockType{$_l_CurrentStockRow}) & (([STOCK_LEVELS:58]Analysis_Code:7=$_at_CSAnalysisCodes{$_l_CurrentStockRow}) | (<>StockAnal=False:C215)) & (([STOCK_LEVELS:58]Currency_Code:8=$_at_CSCurrencyCodes{$_l_CurrentStockRow}) | (([STOCK_LEVELS:58]Currency_Code:8="") & ($_at_CSCurrencyCodes{$_l_CurrentStockRow}=<>SYS_t_BaseCurrency)) | (([STOCK_LEVELS:58]Currency_Code:8=<>SYS_t_BaseCurrency) & ($_at_CSCurrencyCodes{$_l_CurrentStockRow}=""))) & (([STOCK_LEVELS:58]Layer_Code:9=$_at_CSLayerCodes{$_l_CurrentStockRow}) | (([STOCK_LEVELS:58]Layer_Code:9="") & ($_at_CSLayerCodes{$_l_CurrentStockRow}=DB_GetLedgerActualLayer)) | (([STOCK_LEVELS:58]Layer_Code:9=DB_GetLedgerActualLayer) & ($_at_CSLayerCodes{$_l_CurrentStockRow}=""))))
												If ($_al_CSItemNumbers{$_l_CurrentStockRow}=0)
													[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
													[STOCK_LEVELS:58]Free_Cost:5:=Round:C94([STOCK_LEVELS:58]Free_Cost:5+($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
												Else 
													[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
													[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94([STOCK_LEVELS:58]Allocated_Cost:6+($_ar_CSCostPrices{$_l_CurrentStockRow}*$_ar_CSQuantities{$_l_CurrentStockRow}); 2)
												End if 
												$_l_CurrentStockRow:=$_l_CurrentStockRow+1
											End if 
										End if 
									End if 
									DB_SaveRecord(->[STOCK_LEVELS:58])
									AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
									CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
								End while 
								
							End if 
							$_l_ProductRow:=$_l_ProductRow+1
						End while 
						
						MESSAGES ON:C181
						If (OK=1)
							//            VALIDATE TRANSACTION
							//           FLUSH BUFFERS
							Transact_End  // 13/05/02 pb
						Else 
							//           CANCEL TRANSACTION
							Transact_End  // 13/05/02 pb
							Gen_Alert("The Recreation has been cancelled")
						End if 
					Else 
						Gen_Alert("Insufficient memory")
					End if 
				End if 
				Close_ProWin
				vPu:=0
			End while 
		End if 
	End if 
	
End if 
Process_End
ERR_MethodTrackerReturn("StockLev_Recr"; $_t_oldMethodName)