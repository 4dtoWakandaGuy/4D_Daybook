//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_Cons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 16:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_SLAllocatedCost; 0)
	ARRAY REAL:C219($_ar_SLAllocatedLevel; 0)
	ARRAY REAL:C219($_ar_SLFreeCost; 0)
	ARRAY REAL:C219($_ar_SLFreeLevel; 0)
	ARRAY TEXT:C222($_at_CSAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CSCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CSLayerCodes; 0)
	ARRAY TEXT:C222($_at_SLProductCodes; 0)
	ARRAY TEXT:C222($_at_SLStockType; 0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_CountRecords; $_l_Index; vPu)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_productCode; $_t_CurrentOutputform; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_Cons")
//StockLev_Cons
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Gen_Confirm("This Utility consolidates Stock Levels, putting together Levels"+" of the same Product Code and Stock Type"+", irrespective of Analysis, Currency or Layer")
If (OK=1)
	Gen_Confirm("Please do not run this Utility while any other users are using Stock Control")
	If (OK=1)
		If (StockLev_File)
			While (vPu=1)
				//DBI_MenuSelectRecords ("STOCK LEVELS")
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_LEVELS:58])))
				If (OK=1)
					Gen_Confirm("Are you sure you want to proceed?")
					If (OK=1)
						READ WRITE:C146([STOCK_LEVELS:58])
						ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1; >; [STOCK_LEVELS:58]Stock_Type:2; >)
						ARRAY TEXT:C222($_at_SLProductCodes; 0)
						ARRAY TEXT:C222($_at_SLStockType; 0)
						ARRAY REAL:C219($_ar_SLFreeLevel; 0)
						ARRAY REAL:C219($_ar_SLAllocatedLevel; 0)
						ARRAY REAL:C219($_ar_SLFreeCost; 0)
						ARRAY REAL:C219($_ar_SLAllocatedCost; 0)
						SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Product_Code:1; $_at_SLProductCodes; [STOCK_LEVELS:58]Stock_Type:2; $_at_SLStockType; [STOCK_LEVELS:58]Free_Level:3; $_ar_SLFreeLevel; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_SLAllocatedLevel; [STOCK_LEVELS:58]Free_Cost:5; $_ar_SLFreeCost; [STOCK_LEVELS:58]Allocated_Cost:6; $_ar_SLAllocatedCost)
						If (OK=1)
							//  START TRANSACTION
							
							StartTransaction  // 13/05/02 pb
							
							DELETE SELECTION:C66([STOCK_LEVELS:58])
							$_l_CountRecords:=Size of array:C274($_at_SLProductCodes)
							$_l_Index:=1
							While ($_l_Index<=$_l_CountRecords)
								$_t_productCode:=$_at_SLProductCodes{$_l_Index}
								While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
									DelayTicks(2)
								End while 
								CREATE RECORD:C68([STOCK_LEVELS:58])
								[STOCK_LEVELS:58]Product_Code:1:=$_at_SLProductCodes{$_l_Index}
								[STOCK_LEVELS:58]Stock_Type:2:=$_at_SLStockType{$_l_Index}
								[STOCK_LEVELS:58]Free_Level:3:=$_ar_SLFreeLevel{$_l_Index}
								[STOCK_LEVELS:58]Allocated_Level:4:=$_ar_SLAllocatedLevel{$_l_Index}
								[STOCK_LEVELS:58]Free_Cost:5:=$_ar_SLFreeCost{$_l_Index}
								[STOCK_LEVELS:58]Allocated_Cost:6:=$_ar_SLAllocatedCost{$_l_Index}
								[STOCK_LEVELS:58]Currency_Code:8:=<>SYS_t_BaseCurrency
								[STOCK_LEVELS:58]Layer_Code:9:=DB_GetLedgerActualLayer
								$_l_Index:=$_l_Index+1
								If ($_l_Index<=$_l_CountRecords)
									While (($_l_Index<$_l_CountRecords) & ([STOCK_LEVELS:58]Product_Code:1=$_at_SLProductCodes{$_l_Index}) & ([STOCK_LEVELS:58]Stock_Type:2=$_at_SLStockType{$_l_Index}))
										[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+$_ar_SLFreeLevel{$_l_Index}); 2)
										[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+$_ar_SLAllocatedLevel{$_l_Index}); 2)
										[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+$_ar_SLFreeCost{$_l_Index}); 2)
										[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+$_ar_SLAllocatedCost{$_l_Index}); 2)
										$_l_Index:=$_l_Index+1
									End while 
									If ($_l_Index=$_l_CountRecords)
										If (([STOCK_LEVELS:58]Product_Code:1=$_at_SLProductCodes{$_l_Index}) & ([STOCK_LEVELS:58]Stock_Type:2=$_at_SLStockType{$_l_Index}))
											[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+$_ar_SLFreeLevel{$_l_Index}); 2)
											[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+$_ar_SLAllocatedLevel{$_l_Index}); 2)
											[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+$_ar_SLFreeCost{$_l_Index}); 2)
											[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+$_ar_SLAllocatedCost{$_l_Index}); 2)
											$_l_Index:=$_l_Index+1
										End if 
									End if 
								End if 
								DB_SaveRecord(->[STOCK_LEVELS:58])
								AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
								CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
								
							End while 
							ARRAY TEXT:C222($_at_SLProductCodes; 0)
							ARRAY TEXT:C222($_at_SLStockType; 0)
							ARRAY REAL:C219($_ar_SLFreeLevel; 0)
							ARRAY REAL:C219($_ar_SLAllocatedLevel; 0)
							ARRAY REAL:C219($_ar_SLFreeCost; 0)
							ARRAY REAL:C219($_ar_SLAllocatedCost; 0)
							If (OK=1)
								//             VALIDATE TRANSACTION
								Transact_End  // 13/05/02 pb
								READ WRITE:C146([USER:15])
								$_bo_Unload:=(Records in selection:C76([USER:15])=0)
								If (<>SYS_l_LoggedInaccount=0)
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
								Else 
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
								End if 
								If (Not:C34(Locked:C147([USER:15])))
									[USER:15]Stock Analysis:193:=False:C215
									<>StockAnal:=False:C215
									DB_SaveRecord(->[USER:15])
								Else 
									Gen_Alert("Please ensure that the Stock Analysis Preference is turned off")
								End if 
								If ($_bo_Unload)
									UNLOAD RECORD:C212([USER:15])
								End if 
								
								READ WRITE:C146([CURRENT_STOCK:62])
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10#""; *)
								QUERY:C277([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Currency_Code:11#<>SYS_t_BaseCurrency; *)
								QUERY:C277([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Layer_Code:12#"")
								$_l_CountRecords:=Records in selection:C76([CURRENT_STOCK:62])
								ARRAY TEXT:C222($_at_CSAnalysisCodes; $_l_CountRecords)
								ARRAY TEXT:C222($_at_CSLayerCodes; $_l_CountRecords)
								ARRAY TEXT:C222($_at_CSCurrencyCodes; $_l_CountRecords)
								For ($_l_Index; 1; $_l_CountRecords)
									$_at_CSAnalysisCodes{$_l_Index}:=""
									$_at_CSLayerCodes{$_l_Index}:=DB_GetLedgerActualLayer
									$_at_CSCurrencyCodes{$_l_Index}:=<>SYS_t_BaseCurrency
								End for 
								ARRAY TO SELECTION:C261($_at_CSAnalysisCodes; [CURRENT_STOCK:62]Analysis_Code:10; $_at_CSLayerCodes; [CURRENT_STOCK:62]Layer_Code:12; $_at_CSCurrencyCodes; [CURRENT_STOCK:62]Currency_Code:11)
								
							Else 
								//              CANCEL TRANSACTION
								Transact_End  // 13/05/02 pb
								Gen_Alert("That didn't work")
							End if 
						Else 
							Gen_Alert("Insufficient memory")
						End if 
					End if 
				End if 
				
				vPu:=0
			End while 
		End if 
	End if 
	
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("StockLev_Cons"; $_t_oldMethodName)