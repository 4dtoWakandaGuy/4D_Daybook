//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_InTesting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:               20/12/2011 16:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CheckItemIDThisTIme; 0)
	ARRAY LONGINT:C221($_al_IgnoreMovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_SplitQuantitiesIDS; 0)
	ARRAY LONGINT:C221($_al_StockitemChecked; 0)
	ARRAY LONGINT:C221($_al_StockItemCheckedStamp; 0)
	ARRAY LONGINT:C221($_al_StockItemIDS; 0)
	ARRAY LONGINT:C221($_al_ValidFromIDS; 0)
	ARRAY LONGINT:C221($_al_ValidRecordCounts; 0)
	ARRAY LONGINT:C221($_al_RecordCountsOLD; 0)
	ARRAY REAL:C219($_ar_AllocatedFromStockCount; 0)
	ARRAY REAL:C219($_ar_CurrentCStockCount; 0)
	ARRAY REAL:C219($_ar_CurrentOStockCount; 0)
	ARRAY REAL:C219($_ar_CurrentPAllocCount; 0)
	ARRAY REAL:C219($_ar_CurrentPFreeCount; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelCAlloc; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelFree; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelOAlloc; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelOFree; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelpAlloc; 0)
	ARRAY REAL:C219($_ar_CurrentStockLevelpFree; 0)
	ARRAY REAL:C219($_ar_DeliveredToCustomerCount; 0)
	ARRAY REAL:C219($_ar_DeliveredToOtherCount; 0)
	ARRAY REAL:C219($_ar_PreAllocatedFromOnOrder; 0)
	ARRAY REAL:C219($_ar_SplitQuantitiesKeep; 0)
	ARRAY REAL:C219($_ar_SplitQuantitiesSplit; 0)
	ARRAY REAL:C219($_ar_TotalInstockCount; 0)
	ARRAY REAL:C219($_ar_TotalOnOrderCount; 0)
	ARRAY TEXT:C222($_at_ALOMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_ALOMovementTypes; 0)
	ARRAY TEXT:C222($_at_ASSMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_ASSMovementTypes; 0)
	ARRAY TEXT:C222($_at_DELMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_DELMovementTypes; 0)
	ARRAY TEXT:C222($_at_IgnoreProductCodes; 0)
	ARRAY TEXT:C222($_at_ISOMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_ISOMovementTypes; 0)
	ARRAY TEXT:C222($_at_POMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_POMovementTypes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_UNAMovementsStockPlus; 0)
	ARRAY TEXT:C222($_at_UNAMovementTypes; 0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>SYS_bo_QuitCalled; $_bo_Append; $_bo_Edit; $_bo_FirstPass; $_bo_IsAllocation; $_bo_isStockReceipt; $_bo_isUnallocation; $_bo_MayBeinTransaction; $_bo_NoTrack; $_bo_Redo)
	C_BOOLEAN:C305($_bo_UseONlyallocated; $_bo_UseOnlyFree; $_bo_Validate; $_bo_Validated; ST_bo_conversionCompleted; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; SYS_bo_NoTrack)
	C_DATE:C307(STK_d_StartDate)
	C_LONGINT:C283($_l_AddtoCurrentStockID; $_l_AddtoItemID; $_l_CopiedFromID; $_l_CountProducts; $_l_CountSMIRecords; $_l_CountStockMovementItems; $_l_CurrentRow; $_l_DuplicateIDS; $_l_GetItemNumber; $_l_ItemNumber; $_l_LastTimeStampOLD)
	C_LONGINT:C283($_l_LasttTimeStamp; $_l_NewSMIIndex; $_l_NextTimeStamp; $_l_offset; $_l_PreferenceID; $_l_RecordNumber; $_l_Repeats; $_l_Retries; $_l_SizeofArray; $_l_SMIIndex; $_l_SMIIndexp)
	C_LONGINT:C283($_l_SplitIDRow; $_l_SplitIndex; $_l_StockItemID1; $_l_StockitemRow; $_l_ValidationProcess; STK_l_PreviousItemNumber)
	C_REAL:C285($_r_CalledOffQuantity; $_r_CalledOffThisOne; $_r_CostPrice; $_r_Keep; $_r_KeepQuantity; $_r_Max; $_r_Split; $_r_SplitQuantity; $_r_Total)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentUserName; $_t_AnalysisCode; $_t_CopiedFromStockType; $_t_CurrencyCode; $_t_DocumentsPath)
	C_TEXT:C284($_t_EmailAttachment; $_t_EmailFromAddress; $_t_EmailID2; $_t_EmailSentTo; $_t_ErrorString; $_t_LayerCode; $_t_Location; $_t_LocationOnPrevious; $_t_oldMethodName; $_t_Packet; $_t_ProductCode)
	C_TEXT:C284($_t_SerialNumber)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_InTesting")
$_bo_FirstPass:=True:C214
//TRACE
//Open window(20;60;500;200;-Palette window)
//
//This method will run while we are testing. This will create a document with a stock report and as data is added.modified on the system will report and look for anomolies
//$_ti_DocumentRef:=Create document("";"TEXT")
ARRAY LONGINT:C221($_al_StockitemChecked; 0)
ARRAY LONGINT:C221($_al_StockItemCheckedStamp; 0)
If (Current time:C178>?01:00:00?)
	$_l_LasttTimeStamp:=GEN_TimeDateStamp(Current date:C33; ?00:00:00?)
Else 
	$_l_LasttTimeStamp:=GEN_TimeDateStamp(Current date:C33-1; ?00:00:00?)
End if 

READ ONLY:C145([PREFERENCES:116])
MESSAGES OFF:C175
QUERY BY FORMULA:C48([PRODUCTS:9]; STK_IsProductAnalysed([PRODUCTS:9]Product_Code:1))
MESSAGES ON:C181
If (False:C215)
	If (Records in selection:C76([PRODUCTS:9])<Records in table:C83([PRODUCTS:9]))
		$_l_PreferenceID:=PREF_GetPreferenceID("Stock Upate Preferences")
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			Repeat 
				DelayTicks(30*60)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			Until (Records in selection:C76([PREFERENCES:116])>0)
		End if 
		Repeat 
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; STK_d_StartDate; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ST_bo_conversionCompleted; $_l_offset)
			End if 
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (ST_bo_conversionCompleted=False:C215)
				DelayTicks(30*60)
			End if 
			
		Until (ST_bo_conversionCompleted) | (True:C214)
		
	End if 
	//
End if 

$_l_Repeats:=0
$_bo_MayBeinTransaction:=True:C214  //set this to true-if we get a mismatch between stock items and current stock this could be because there is a record being processed
//as updating is quite sever-updating all the current stock records and stock items its better to hold off and come back
Repeat 
	If ($_l_Repeats=0)
		MESSAGES OFF:C175
		//QUERY([PRODUCTS];[PRODUCTS]Product Code="S-1339/10mm col 15";*)
		
		//[STOCK_MOVEMENT_ITEMS]Product_Code="AB-09/48MM COL 1"
		QUERY BY FORMULA:C48([PRODUCTS:9]; STK_IsProductAnalysed([PRODUCTS:9]Product_Code:1))
		//QUERY([PRODUCTS];[PRODUCTS]Product_Code="AB-09/48MM COL 1")
		
		UNLOAD RECORD:C212([PRODUCTS:9])
		MESSAGES ON:C181
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "AnalysedProducts")
		ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "Before")
		If (Current time:C178>?01:00:00?)
			$_l_NextTimeStamp:=GEN_TimeDateStamp(Current date:C33; ?00:00:00?)
		Else 
			$_l_NextTimeStamp:=GEN_TimeDateStamp(Current date:C33-1; ?00:00:00?)
		End if 
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
		$_l_DuplicateIDS:=0
		If (False:C215)
			$_l_CountStockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			If (True:C214)
				For ($_l_SMIIndex; 1; $_l_CountStockMovementItems)
					
					USE NAMED SELECTION:C332("$Temp")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
					$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_PreferenceID)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
						
						For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ($_l_SMIIndexp>1)
								While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(2)
								End while 
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
								
							End if 
						End for 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						
					End if 
				End for 
			End if 
			If (True:C214)
				$_bo_Redo:=False:C215
				Repeat 
					$_bo_Redo:=False:C215
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
					DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
					//TRACE
					For ($_l_SMIIndex; 1; Size of array:C274($_al_ValidFromIDS))
						//MESSAGE(String($_l_SMIIndex))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
						$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							//these would be WRONG stock movement items
							//TRACE
							For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
								While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(2)
								End while 
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
								$_bo_Redo:=True:C214
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							End for 
							
						End if 
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
						$_r_CalledOffQuantity:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_ValidFromIDS{$_l_SMIIndex})
						
						
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
						Case of 
							: ($_r_CalledOffQuantity>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								$_r_Max:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
									//TRACE  //. This would be something i want to catch
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
									ARRAY REAL:C219($_ar_SplitQuantitiesKeep; 0)
									ARRAY REAL:C219($_ar_SplitQuantitiesSplit; 0)
									ARRAY LONGINT:C221($_al_SplitQuantitiesIDS; 0)
									
									$_r_Total:=0
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "CopiedFrom")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Max)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
										$_r_Total:=$_r_Max
										REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
									End if 
									DIFFERENCE:C122("CopiedFrom"; "LeaveThese"; "CopiedFrom")
									USE SET:C118("CopiedFrom")
									For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										Case of 
											: ($_r_Total>=$_r_Max)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
											: (($_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>=$_r_Max)
												
												$_r_Keep:=$_r_Max-$_r_Total
												$_r_Split:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Keep
												If ($_l_SplitIndex=0)
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
												Else 
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
													APPEND TO ARRAY:C911($_al_SplitQuantitiesIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_ar_SplitQuantitiesKeep; $_r_Keep)
													APPEND TO ARRAY:C911($_ar_SplitQuantitiesSplit; $_r_Split)
													
													
												End if 
												$_r_Total:=$_r_Max
										End case 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									If (Records in set:C195("Splitthisone")>0)
										//TRACE
										USE SET:C118("Splitthisone")
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
										For ($_l_SplitIndex; 1; Size of array:C274($_al_StockItemIDS))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockItemIDS{$_l_SplitIndex})
											$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_StockItemIDS{$_l_SplitIndex})
											
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockItemIDS{$_l_SplitIndex})
											While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
												DelayTicks(2)
											End while 
											$_l_SplitIDRow:=Find in array:C230($_al_SplitQuantitiesIDS; $_al_StockItemIDS{$_l_SplitIndex})
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesKeep{$_l_SplitIDRow}
											If ($_r_CalledOffThisOne>$_ar_SplitQuantitiesKeep{$_l_SplitIDRow})  //all called off then
												$_bo_Redo:=True:C214
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												//TRACE
												[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											End if 
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
											[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
											[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesSplit{$_l_SplitIDRow}
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											
										End for 
									End if 
									If (Records in set:C195("FindNewFrom")>0)
										USE SET:C118("FindNewFrom")
										//TRACE
										For ($_l_NewSMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
											While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
												DelayTicks(2)
											End while 
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											
											NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											
										End for 
									End if 
								Else 
									//split the item
									If ($_r_Max>0)
										//TRACE
										$_l_StockItemID1:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										$_r_KeepQuantity:=$_r_Max
										$_r_SplitQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Max
										//TRACE  // i would want to catch this!!
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockItemID1)
										$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_StockItemID1)
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID1)
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_KeepQuantity
										If ($_r_CalledOffThisOne>$_r_KeepQuantity)
											$_bo_Redo:=True:C214
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										End if 
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SplitQuantity
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										
										
									Else 
										//TRACE
										$_bo_Redo:=False:C215
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
									End if 
									
									
								End if 
							: ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
								//TRACE
								While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(2)
								End while 
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							: ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
								While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(2)
								End while 
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						End case 
					End for 
				Until ($_bo_Redo=False:C215)
			End if 
			//TRACE
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ReversedMovementItems")
				$_l_CountSMIRecords:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				
				For ($_l_SMIIndex; 1; $_l_CountSMIRecords)
					$_bo_Edit:=False:C215
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
					USE NAMED SELECTION:C332("$ReversedMovementItems")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					End if 
					$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
					$_bo_isUnallocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
					$_bo_isStockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
					$_bo_UseONlyallocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
					$_bo_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
						
						//
						//this is an oxymoron!!- it really cant be negative and move from P to P (
						
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
						[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						$_bo_Edit:=True:C214
						
					Else 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							Case of 
								: ($_bo_IsAllocation)
									If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)
										$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										
										If ($_l_AddtoItemID=0)
											If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24>0)
												[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24
											Else 
												STK_l_PreviousItemNumber:=0
												STK_bo_PreviousItemNumberTested:=False:C215
												$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 512000; "Get Allocation Item number"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												DB_WaitforProcessToEnd($_l_GetItemNumber; "Get Allocation Item number"; 60; "STK_bo_PreviousItemNumberTested")
												SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
												$_l_AddtoItemID:=STK_l_PreviousItemNumber
												STK_l_PreviousItemNumber:=0
												[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_AddtoItemID
											End if 
											$_bo_Edit:=True:C214
										End if 
										
										
									Else 
										//a negative ALO should add to a P free so this is ok
										$_l_AddtoItemID:=0
									End if 
								: ($_bo_isUnallocation)
									
									$_l_AddtoItemID:=0
								Else 
									$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							End case 
							
							$_l_AddtoCurrentStockID:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_l_AddtoItemID; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
							
							
							If ($_l_AddtoCurrentStockID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
								
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
								$_bo_Edit:=True:C214
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
									[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_AddtoCurrentStockID
									$_bo_Edit:=True:C214
								End if 
							End if 
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
							
							
							$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
							$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
							$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
							$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
							$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
							$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
							$_t_LocationOnPrevious:=""
							If ($_bo_isUnallocation)
								$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
								
							Else 
								$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
								$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#"")
								$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#"")
								$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
								$_t_LocationOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#"")
								$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#"")
								$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41
							End if 
							If (Not:C34([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33))
								$_t_SerialNumber:=""
							End if 
							If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
								//TRACE
								$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
								If ($_bo_IsAllocation)
									$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								Else 
									//what about a negative un-allocation..well that would be an allocation so the copied from ID should have a zero
								End if 
								$_t_CopiedFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromID)
								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#$_t_CopiedFromStockType) | ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#$_l_AddtoItemID) | ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#$_r_CostPrice) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#$_t_CurrencyCode) | ([STOCK_MOVEMENT_ITEMS:27]Location:7#$_t_Location) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#$_t_AnalysisCode) | ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#$_t_LayerCode)
									$_bo_Redo:=True:C214
									USE NAMED SELECTION:C332("$ReversedMovementItems")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
									If ($_bo_Redo)
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									End if 
								Else 
									USE NAMED SELECTION:C332("$ReversedMovementItems")
									GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
									
								End if 
								
								If (Not:C34(STK_VerifyCopiedFrom(0; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; $_r_CostPrice; $_t_CurrencyCode; $_t_Location; $_t_AnalysisCode; $_t_LayerCode)))
									//TRACE  //this would be an extreme exception
									$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
									COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
									$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
									STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
									If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])#$_l_RecordNumber)
										USE NAMED SELECTION:C332("$CS")
										GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
									End if 
									$_bo_Edit:=True:C214
								End if 
							End if 
						End if 
					End if 
					
					If ($_bo_Edit)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					End if 
					
					
				End for 
				
			End if 
			
			$_bo_Redo:=False:C215
			Repeat 
				$_bo_Redo:=False:C215
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#0)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ValidFromIDS)
				
				For ($_l_SMIIndex; 1; Size of array:C274($_al_ValidFromIDS))
					//MESSAGE(String($_l_SMIIndex))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
					$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						//TRACE  //i would want to catch this-the stock item is seriously wrong!
						For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(2)
							End while 
							$_bo_Redo:=False:C215
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
					$_r_CalledOffQuantity:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_ValidFromIDS{$_l_SMIIndex})
					
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
						Case of 
							: ($_r_CalledOffQuantity>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								$_r_Max:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
									CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
									ARRAY REAL:C219($_ar_SplitQuantitiesKeep; 0)
									ARRAY REAL:C219($_ar_SplitQuantitiesSplit; 0)
									ARRAY LONGINT:C221($_al_SplitQuantitiesIDS; 0)
									
									$_r_Total:=0
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "CopiedFrom")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Max)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
										$_r_Total:=$_r_Max
										REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
										ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
									End if 
									DIFFERENCE:C122("CopiedFrom"; "LeaveThese"; "CopiedFrom")
									USE SET:C118("CopiedFrom")
									For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										Case of 
											: ($_r_Total>=$_r_Max)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
											: (($_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>=$_r_Max)
												
												$_r_Keep:=$_r_Max-$_r_Total
												$_r_Split:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Keep
												If ($_l_SplitIndex=0)
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
												Else 
													ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
													APPEND TO ARRAY:C911($_al_SplitQuantitiesIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_ar_SplitQuantitiesKeep; $_r_Keep)
													APPEND TO ARRAY:C911($_ar_SplitQuantitiesSplit; $_r_Split)
													
													
												End if 
												$_r_Total:=$_r_Max
										End case 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
									If (Records in set:C195("Splitthisone")>0)
										USE SET:C118("Splitthisone")
										//TRACE
										SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
										For ($_l_SplitIndex; 1; Size of array:C274($_al_StockItemIDS))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockItemIDS{$_l_SplitIndex})
											$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_StockItemIDS{$_l_SplitIndex})
											
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockItemIDS{$_l_SplitIndex})
											While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
												DelayTicks(2)
											End while 
											$_l_SplitIDRow:=Find in array:C230($_al_SplitQuantitiesIDS; $_al_StockItemIDS{$_l_SplitIndex})
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesKeep{$_l_SplitIDRow}
											If ($_r_CalledOffThisOne>$_ar_SplitQuantitiesKeep{$_l_SplitIDRow})
												$_bo_Redo:=True:C214
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												//TRACE
												[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											End if 
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
											[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
											[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesSplit{$_l_SplitIDRow}
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											
										End for 
									End if 
									If (Records in set:C195("FindNewFrom")>0)
										USE SET:C118("FindNewFrom")
										//TRACE
										For ($_l_NewSMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
											While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
												DelayTicks(2)
											End while 
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											
											NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
											
										End for 
									End if 
								Else 
									//split the item
									If ($_r_Max>0)
										//TRACE
										$_l_StockItemID1:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										$_r_KeepQuantity:=$_r_Max
										$_r_SplitQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Max
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockItemID1)
										$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_StockItemID1)
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID1)
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_KeepQuantity
										If ($_r_CalledOffThisOne>$_r_KeepQuantity)
											$_bo_Redo:=True:C214
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										End if 
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SplitQuantity
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										
										
									Else 
										$_bo_Redo:=False:C215
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
									End if 
									
									
								End if 
							: ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							: ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						End case 
						
					Else 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						Repeat 
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						Until (End selection:C36([STOCK_MOVEMENT_ITEMS:27]))
						$_bo_Redo:=True:C214
					End if 
				End for 
			Until ($_bo_Redo=False:C215)
		End if 
	Else 
		//$_l_NextTimeStamp:=GEN_TimeDateStamp (Current date;Current time)
		MESSAGES OFF:C175
		$_l_LastTimeStampOLD:=$_l_NextTimeStamp
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46>=$_l_NextTimeStamp)
		
		
		If (Current time:C178>?01:00:00?)
			$_l_NextTimeStamp:=GEN_TimeDateStamp(Current date:C33; Time:C179(Time string:C180((Current time:C178)-(60*60))))
		Else 
			$_l_NextTimeStamp:=GEN_TimeDateStamp(Current date:C33-1; ?23:00:00?)
		End if 
		
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ModifiedItems")
		ARRAY LONGINT:C221($_al_CheckItemIDThisTIme; 0)
		For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			$_l_StockitemRow:=Find in array:C230($_al_StockitemChecked; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			If ($_l_StockitemRow<0)
				APPEND TO ARRAY:C911($_al_CheckItemIDThisTIme; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911($_al_StockitemChecked; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				APPEND TO ARRAY:C911($_al_StockItemCheckedStamp; [STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46)
			Else 
				If ($_al_StockItemCheckedStamp{$_l_StockitemRow}#[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46)
					APPEND TO ARRAY:C911($_al_CheckItemIDThisTIme; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					$_al_StockItemCheckedStamp{$_l_StockitemRow}:=[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46
				End if 
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		
		For ($_l_SMIIndex; Size of array:C274($_al_StockItemCheckedStamp); 1; -1)
			If ($_al_StockItemCheckedStamp{$_l_SMIIndex}<$_l_LastTimeStampOLD)
				DELETE FROM ARRAY:C228($_al_StockitemChecked; $_l_SMIIndex)
				DELETE FROM ARRAY:C228($_al_StockItemCheckedStamp; $_l_SMIIndex)
			End if 
		End for 
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_CheckItemIDThisTIme)
		
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Now")
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
		$_l_DuplicateIDS:=0
		$_l_CountStockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_SMIIndex; 1; $_l_CountStockMovementItems)
			
			USE NAMED SELECTION:C332("$Temp")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIIndex)
			$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_PreferenceID)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
				For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If ($_l_SMIIndexp>1)
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
							DelayTicks(2)
						End while 
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					End if 
				End for 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				
			End if 
		End for 
		
		If (True:C214)
			$_bo_Redo:=False:C215
			Repeat 
				$_bo_Redo:=False:C215
				USE SET:C118("$Now")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ValidFromIDS)
				For ($_l_SMIIndex; 1; Size of array:C274($_al_ValidFromIDS))
					//MESSAGE(String($_l_SMIIndex))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
					$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						//TRACE  //i want to catch this it is seriously wrong
						For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(2)
							End while 
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
							[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
							$_bo_Redo:=True:C214
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						
					End if 
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
					$_r_CalledOffQuantity:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_ValidFromIDS{$_l_SMIIndex})
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
					Case of 
						: ($_r_CalledOffQuantity>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							$_r_Max:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
								//TRACE
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
								ARRAY REAL:C219($_ar_SplitQuantitiesKeep; 0)
								ARRAY REAL:C219($_ar_SplitQuantitiesSplit; 0)
								ARRAY LONGINT:C221($_al_SplitQuantitiesIDS; 0)
								
								$_r_Total:=0
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "CopiedFrom")
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Max)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
									$_r_Total:=$_r_Max
									REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
								End if 
								DIFFERENCE:C122("CopiedFrom"; "LeaveThese"; "CopiedFrom")
								USE SET:C118("CopiedFrom")
								For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									Case of 
										: ($_r_Total>=$_r_Max)
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
										: (($_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>=$_r_Max)
											
											$_r_Keep:=$_r_Max-$_r_Total
											$_r_Split:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Keep
											If ($_l_SplitIndex=0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
											Else 
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
												APPEND TO ARRAY:C911($_al_SplitQuantitiesIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												APPEND TO ARRAY:C911($_ar_SplitQuantitiesKeep; $_r_Keep)
												APPEND TO ARRAY:C911($_ar_SplitQuantitiesSplit; $_r_Split)
												
												
											End if 
											$_r_Total:=$_r_Max
									End case 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								If (Records in set:C195("Splitthisone")>0)
									USE SET:C118("Splitthisone")
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
									For ($_l_SplitIndex; 1; Size of array:C274($_al_StockItemIDS))
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockItemIDS{$_l_SplitIndex})
										$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_StockItemIDS{$_l_SplitIndex})
										
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockItemIDS{$_l_SplitIndex})
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										$_l_SplitIDRow:=Find in array:C230($_al_SplitQuantitiesIDS; $_al_StockItemIDS{$_l_SplitIndex})
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesKeep{$_l_SplitIDRow}
										If ($_r_CalledOffThisOne>$_ar_SplitQuantitiesKeep{$_l_SplitIDRow})
											$_bo_Redo:=True:C214
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										End if 
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesSplit{$_l_SplitIDRow}
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
									End for 
								End if 
								If (Records in set:C195("FindNewFrom")>0)
									USE SET:C118("FindNewFrom")
									For ($_l_NewSMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										
									End for 
								End if 
							Else 
								//split the item
								If ($_r_Max>0)
									$_l_StockItemID1:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									$_r_KeepQuantity:=$_r_Max
									$_r_SplitQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Max
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockItemID1)
									$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_StockItemID1)
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID1)
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
										DelayTicks(2)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_KeepQuantity
									If ($_r_CalledOffThisOne>$_r_KeepQuantity)
										$_bo_Redo:=True:C214
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									End if 
									//TRACE
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SplitQuantity
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									//TRACE
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									
									
									
								Else 
									$_bo_Redo:=False:C215
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
										DelayTicks(2)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									
								End if 
								
								
							End if 
						: ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
							While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(2)
							End while 
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						: ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
							While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(2)
							End while 
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					End case 
				End for 
			Until ($_bo_Redo=False:C215)
		End if 
		$_bo_Redo:=False:C215
		Repeat 
			$_bo_Redo:=False:C215
			USE SET:C118("$Now")
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#0)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_ValidFromIDS)
			
			For ($_l_SMIIndex; 1; Size of array:C274($_al_ValidFromIDS))
				//MESSAGE(String($_l_SMIIndex))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
				$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					//TRACE  //catch this-serious problem
					For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
							DelayTicks(2)
						End while 
						$_bo_Redo:=False:C215
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
				
				
				
				$_r_CalledOffQuantity:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_ValidFromIDS{$_l_SMIIndex})
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ValidFromIDS{$_l_SMIIndex})
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
					Case of 
						: ($_r_CalledOffQuantity>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							$_r_Max:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_ValidFromIDS{$_l_SMIIndex})
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
								CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
								ARRAY REAL:C219($_ar_SplitQuantitiesKeep; 0)
								ARRAY REAL:C219($_ar_SplitQuantitiesSplit; 0)
								ARRAY LONGINT:C221($_al_SplitQuantitiesIDS; 0)
								
								$_r_Total:=0
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "CopiedFrom")
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Max)
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
									$_r_Total:=$_r_Max
									REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
									ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
								End if 
								DIFFERENCE:C122("CopiedFrom"; "LeaveThese"; "CopiedFrom")
								USE SET:C118("CopiedFrom")
								For ($_l_SMIIndexp; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									Case of 
										: ($_r_Total>=$_r_Max)
											ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "FindNewFrom")
										: (($_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>=$_r_Max)
											
											$_r_Keep:=$_r_Max-$_r_Total
											$_r_Split:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Keep
											If ($_l_SplitIndex=0)
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "LeaveThese")
											Else 
												ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "Splitthisone")
												APPEND TO ARRAY:C911($_al_SplitQuantitiesIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												APPEND TO ARRAY:C911($_ar_SplitQuantitiesKeep; $_r_Keep)
												APPEND TO ARRAY:C911($_ar_SplitQuantitiesSplit; $_r_Split)
												
												
											End if 
											$_r_Total:=$_r_Max
									End case 
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
								If (Records in set:C195("Splitthisone")>0)
									//TRACE
									USE SET:C118("Splitthisone")
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
									For ($_l_SplitIndex; 1; Size of array:C274($_al_StockItemIDS))
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockItemIDS{$_l_SplitIndex})
										$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_StockItemIDS{$_l_SplitIndex})
										
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockItemIDS{$_l_SplitIndex})
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										$_l_SplitIDRow:=Find in array:C230($_al_SplitQuantitiesIDS; $_al_StockItemIDS{$_l_SplitIndex})
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesKeep{$_l_SplitIDRow}
										If ($_r_CalledOffThisOne>$_ar_SplitQuantitiesKeep{$_l_SplitIDRow})
											$_bo_Redo:=True:C214
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										End if 
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitQuantitiesSplit{$_l_SplitIDRow}
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
									End for 
								End if 
								If (Records in set:C195("FindNewFrom")>0)
									USE SET:C118("FindNewFrom")
									//TRACE
									For ($_l_NewSMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
											DelayTicks(2)
										End while 
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										
									End for 
								End if 
							Else 
								//split the item
								If ($_r_Max>0)
									//TRACE
									$_l_StockItemID1:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
									$_r_KeepQuantity:=$_r_Max
									$_r_SplitQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Max
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockItemID1)
									$_r_CalledOffThisOne:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_l_StockItemID1)
									
									
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID1)
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
										DelayTicks(2)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_KeepQuantity
									If ($_r_CalledOffThisOne>$_r_KeepQuantity)
										$_bo_Redo:=True:C214
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									End if 
									//TRACE
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SplitQuantity
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									//TRACE
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									
									
									
								Else 
									$_bo_Redo:=False:C215
									//TRACE
									While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
										DelayTicks(2)
									End while 
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									
								End if 
								
								
							End if 
						: ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						: ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
							//TRACE
							[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					End case 
					
				Else 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					//TRACE
					Repeat 
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					Until (End selection:C36([STOCK_MOVEMENT_ITEMS:27]))
					$_bo_Redo:=True:C214
				End if 
			End for 
		Until ($_bo_Redo=False:C215)
		USE SET:C118("$Now")
		QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3>0)
		SELECTION TO ARRAY:C260([STK_TransactionHolds:192]XstockMovementItemID:3; $_al_IgnoreMovementItemIDS)
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_IgnoreMovementItemIDS)
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_IgnoreProductCodes)
		QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_IgnoreProductCodes)
		CREATE SET:C116([PRODUCTS:9]; "$ignorethereItems")
		USE SET:C118("$Now")
		MESSAGES OFF:C175
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
		
		QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
		MESSAGES ON:C181
		CREATE SET:C116([PRODUCTS:9]; "$Analisethise")
		DIFFERENCE:C122("$Analisethise"; "$ignorethereItems"; "$Analisethise")
		USE SET:C118("$Analisethise")
		
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "AnalysedProducts")
		ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Before")
		$_l_LasttTimeStamp:=$_l_NextTimeStamp
	End if 
	$_l_Repeats:=$_l_Repeats+1
	$_l_CountProducts:=Records in selection:C76([PRODUCTS:9])
	If ($_l_CountProducts>0)
		//
		
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		MESSAGES OFF:C175
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO"; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<Current date:C33; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37=0; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
		MESSAGES ON:C181
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			MESSAGES OFF:C175
			APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0)
		End if 
		ARRAY TEXT:C222($_at_ProductCodes; 0)
		ARRAY LONGINT:C221($_al_RecordCountsOLD; 0)
		ARRAY LONGINT:C221($_al_ValidRecordCounts; 0)
		ARRAY REAL:C219($_ar_TotalOnOrderCount; 0)
		ARRAY REAL:C219($_ar_PreAllocatedFromOnOrder; 0)
		ARRAY REAL:C219($_ar_TotalInstockCount; 0)
		ARRAY REAL:C219($_ar_AllocatedFromStockCount; 0)
		ARRAY REAL:C219($_ar_DeliveredToCustomerCount; 0)  //these are allocated
		ARRAY REAL:C219($_ar_DeliveredToOtherCount; 0)  //these are other C stock-not allocated
		ARRAY REAL:C219($_ar_CurrentOStockCount; 0)  //from the current stock table
		ARRAY REAL:C219($_ar_CurrentPFreeCount; 0)  //From the current stock table
		ARRAY REAL:C219($_ar_CurrentPAllocCount; 0)
		ARRAY REAL:C219($_ar_CurrentCStockCount; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelOFree; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelOAlloc; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelpFree; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelpAlloc; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelFree; 0)
		ARRAY REAL:C219($_ar_CurrentStockLevelCAlloc; 0)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_POMovementsStockPlus)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ISOMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_ISOMovementsStockPlus)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ALOMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_ALOMovementsStockPlus)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ASSMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_ASSMovementsStockPlus)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UNAMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_UNAMovementsStockPlus)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_DELMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_DELMovementsStockPlus)
		$_bo_Validate:=False:C215
		$_t_ErrorString:=""
		//TRACE
		$_t_ProductCode:=""
		For ($_l_SMIIndex; 1; $_l_CountProducts)
			While (Semaphore:C143("$VerifyinAction"))
				DelayTicks(10)
			End while 
			If (Is compiled mode:C492)
				DelayTicks(2)
			End if 
			//GOTO XY(0;0)
			//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"1")
			
			USE NAMED SELECTION:C332("AnalysedProducts")
			GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_SMIIndex)
			If ($_t_ProductCode="CS-422/66mm COL 212")
				//
			End if 
			
			$_t_ProductCode:=[PRODUCTS:9]Product_Code:1
			$_l_CurrentRow:=Find in array:C230($_at_ProductCodes; $_t_ProductCode)
			$_bo_Append:=False:C215
			
			
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
			//GOTO XY(0;0)
			//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"2")
			
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				//GOTO XY(0;0)
				//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"3")
				
				If ($_l_CurrentRow<0)
					APPEND TO ARRAY:C911($_at_ProductCodes; [PRODUCTS:9]Product_Code:1)
					$_bo_Append:=True:C214
					$_l_CurrentRow:=0
				End if 
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_al_ValidRecordCounts; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				Else 
					$_al_ValidRecordCounts{$_l_CurrentRow}:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=True:C214)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_al_RecordCountsOLD; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				Else 
					$_al_RecordCountsOLD{$_l_CurrentRow}:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "StockItemsSel")
				
				
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_POMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_POMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				APPEND TO ARRAY:C911($_ar_TotalOnOrderCount; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_PreAllocatedFromOnOrder; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_PreAllocatedFromOnOrder{$_l_CurrentRow}:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				End if 
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ISOMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ISOMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39=False:C215)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$StockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$StockCounted")
				End if 
				//SELECTION TO ARRAY([STOCK ITEMS]x_ID;$IDS;[STOCK ITEMS]xstockMovementType;$SMTypes)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_TotalInstockCount; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				End if 
				//....
				USE NAMED SELECTION:C332("StockItemsSel")
				//....
				USE NAMED SELECTION:C332("StockItemsSel")
				
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ISOMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_AllocatedFromStockCount; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_AllocatedFromStockCount{$_l_CurrentRow}:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				End if 
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$alreadyCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$alreadyCounted")
				End if 
				USE NAMED SELECTION:C332("StockItemsSel")
				
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ALOMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ALOMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39=False:C215)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ToCount")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$ToCount")
					
				End if 
				DIFFERENCE:C122("$ToCount"; "$alreadyCounted"; "$ToCount")
				USE SET:C118("$ToCount")
				If ($_bo_Append)
					$_ar_AllocatedFromStockCount{Size of array:C274($_ar_AllocatedFromStockCount)}:=($_ar_AllocatedFromStockCount{Size of array:C274($_ar_AllocatedFromStockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_AllocatedFromStockCount{$_l_CurrentRow}:=($_ar_AllocatedFromStockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
					
				End if 
				
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ISOMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39=True:C214)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				End if 
				DIFFERENCE:C122("$InvertedStockCounted"; "$StockCounted"; "$InvertedStockCounted")
				USE SET:C118("$InvertedStockCounted")
				UNION:C120("$InvertedStockCounted"; "$StockCounted"; "$StockCounted")
				
				
				If ($_bo_Append)
					$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}:=($_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=($_ar_TotalInstockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
					
				End if 
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ALOMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ALOMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39=False:C215)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				End if 
				DIFFERENCE:C122("$InvertedStockCounted"; "$StockCounted"; "$InvertedStockCounted")
				USE SET:C118("$InvertedStockCounted")
				UNION:C120("$InvertedStockCounted"; "$StockCounted"; "$StockCounted")
				
				
				
				If ($_bo_Append)
					$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}:=($_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=($_ar_TotalInstockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
					
				End if 
				//```
				
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ASSMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_ASSMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				End if 
				DIFFERENCE:C122("$InvertedStockCounted"; "$StockCounted"; "$InvertedStockCounted")
				USE SET:C118("$InvertedStockCounted")
				UNION:C120("$InvertedStockCounted"; "$StockCounted"; "$StockCounted")
				
				
				If ($_bo_Append)
					
					$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}:=$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=$_ar_TotalInstockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
				End if 
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_UNAMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_UNAMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				End if 
				DIFFERENCE:C122("$InvertedStockCounted"; "$StockCounted"; "$InvertedStockCounted")
				USE SET:C118("$InvertedStockCounted")
				UNION:C120("$InvertedStockCounted"; "$StockCounted"; "$StockCounted")
				
				If ($_bo_Append)
					$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}:=$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=$_ar_TotalInstockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
				End if 
				
				USE NAMED SELECTION:C332("StockItemsSel")
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_UNAMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				Else 
					CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$InvertedStockCounted")
				End if 
				DIFFERENCE:C122("$InvertedStockCounted"; "$StockCounted"; "$InvertedStockCounted")
				USE SET:C118("$InvertedStockCounted")
				UNION:C120("$InvertedStockCounted"; "$StockCounted"; "$StockCounted")
				
				If ($_bo_Append)
					$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}:=$_ar_TotalInstockCount{Size of array:C274($_ar_TotalInstockCount)}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
				Else 
					$_ar_TotalInstockCount{$_l_CurrentRow}:=$_ar_TotalInstockCount{$_l_CurrentRow}+Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
					
				End if 
				
				
				USE NAMED SELECTION:C332("StockItemsSel")
				
				//QUERY SELECTION WITH ARRAY([STOCK ITEMS]xstockMovementType;$_at_DELMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_DELMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_DeliveredToCustomerCount; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_DeliveredToCustomerCount{$_l_CurrentRow}:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				End if 
				
				USE NAMED SELECTION:C332("StockItemsSel")
				
				//QUERY SELECTION WITH ARRAY([STOCK ITEMS]xstockMovementType;$_at_DELMovementTypes)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_DELMovementsStockPlus)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_DeliveredToOtherCount; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
				Else 
					$_ar_DeliveredToOtherCount{$_l_CurrentRow}:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				End if 
				
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="O")
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentOStockCount; Sum:C1([CURRENT_STOCK:62]Quantity:4))
				Else 
					$_ar_CurrentOStockCount{$_l_CurrentRow}:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentPFreeCount; Sum:C1([CURRENT_STOCK:62]Quantity:4))
				Else 
					$_ar_CurrentPFreeCount{$_l_CurrentRow}:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
				End if 
				
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0)
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentPAllocCount; Sum:C1([CURRENT_STOCK:62]Quantity:4))
				Else 
					$_ar_CurrentPAllocCount{$_l_CurrentRow}:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
				End if 
				
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="C"; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0)
				If ($_bo_Append)
					
					APPEND TO ARRAY:C911($_ar_CurrentCStockCount; Sum:C1([CURRENT_STOCK:62]Quantity:4))
				Else 
					$_ar_CurrentCStockCount{$_l_CurrentRow}:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
				End if 
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="O")
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelOFree; Sum:C1([STOCK_LEVELS:58]Free_Level:3))
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelOAlloc; Sum:C1([STOCK_LEVELS:58]Allocated_Level:4))
				Else 
					$_ar_CurrentStockLevelOFree{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
					$_ar_CurrentStockLevelOAlloc{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Allocated_Level:4)
				End if 
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="P")
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelpFree; Sum:C1([STOCK_LEVELS:58]Free_Level:3))
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelpAlloc; Sum:C1([STOCK_LEVELS:58]Allocated_Level:4))
				Else 
					$_ar_CurrentStockLevelpFree{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
					$_ar_CurrentStockLevelpAlloc{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Allocated_Level:4)
				End if 
				
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="C")
				If ($_bo_Append)
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelFree; Sum:C1([STOCK_LEVELS:58]Free_Level:3))
					APPEND TO ARRAY:C911($_ar_CurrentStockLevelCAlloc; Sum:C1([STOCK_LEVELS:58]Allocated_Level:4))
					
				Else 
					$_ar_CurrentStockLevelFree{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
					$_ar_CurrentStockLevelCAlloc{$_l_CurrentRow}:=Sum:C1([STOCK_LEVELS:58]Allocated_Level:4)
				End if 
				If ($_bo_Append)
					$_l_SizeofArray:=Size of array:C274($_ar_CurrentStockLevelFree)
				Else 
					$_l_SizeofArray:=$_l_CurrentRow
				End if 
				//message(String($_l_SMIIndex)+" Product"+$_t_ProductCode+Char(13))
				$_t_Packet:=""
				//GOTO XY(0;0)
				//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"5")
				
				If ($_ar_CurrentStockLevelFree{$_l_SizeofArray}#$_ar_DeliveredToOtherCount{$_l_SizeofArray})
					//GOTO XY(0;0)
					//message("Product"+$_t_ProductCode+Char(13)+"Investigate Stock Level C Free it is "+String($_ar_CurrentStockLevelFree{$_l_SizeofArray})+Char(13))
					
					//$_t_Packet:=$_t_Packet+"Product"+$_t_ProductCode+Char(9)+"Investigate Stock Level C Free it is "+String($_ar_CurrentStockLevelFree{$_l_SizeofArray})+Char(13)
					
					
					
				End if 
				If (Not:C34($_bo_Validate))
					$_bo_Validated:=False:C215
					$_t_Packet:=""
				End if 
				$_bo_Validate:=False:C215
				
				If ($_ar_CurrentStockLevelCAlloc{$_l_SizeofArray}#$_ar_CurrentCStockCount{$_l_SizeofArray})
					//GOTO XY(0;0)
					//message("Product "+$_t_ProductCode+Char(13)+"v((Does Not match current stock) it is  "+String($_ar_CurrentStockLevelCAlloc{$_l_SizeofArray})+" Current stock is "+String($_ar_CurrentCStockCount{$_l_SizeofArray})+Char(13))
					//TRACE
					//$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char(9)+"Investigate Stock Level C Allocate((Does Not match current stock) it is  "+String($_ar_CurrentStockLevelCAlloc{$_l_SizeofArray})+" Current stock is "+String($_ar_CurrentCStockCount{$_l_SizeofArray})+Char(13)
					$_bo_Validate:=True:C214
				End if 
				If ($_ar_CurrentStockLevelCAlloc{$_l_SizeofArray}#$_ar_DeliveredToCustomerCount{$_l_SizeofArray})
					//GOTO XY(0;0)
					//TRACE
					//message("Product "+$_t_ProductCode+Char(13)+"Investigate Stock Level C Allocate((Does Not match stock items sum) it is  "+String($_ar_CurrentStockLevelFree{$_l_SizeofArray})+" stock items is "+String($_ar_DeliveredToCustomerCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					//$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char(9)+"Investigate Stock Level C Allocate((Does Not match stock items sum) it is  "+String($_ar_CurrentStockLevelCAlloc{$_l_SizeofArray})+" stock items is "+String($_ar_DeliveredToCustomerCount{$_l_SizeofArray})+Char(13)
				End if 
				//````
				If ($_ar_CurrentStockLevelpAlloc{$_l_SizeofArray}#$_ar_CurrentPAllocCount{$_l_SizeofArray})
					//GOTO XY(0;0)
					//TRACE
					//message("Product "+$_t_ProductCode+Char(13)+"Investigate Stock Level C Allocate((Does Not match stock items sum) it is  "+String($_ar_CurrentStockLevelFree{$_l_SizeofArray})+" stock items is "+String($_ar_DeliveredToCustomerCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char:C90(9)+"Investigate Stock Level P Allocate((Does Not match current stock) it is  "+String:C10($_ar_CurrentStockLevelpAlloc{$_l_SizeofArray})+" Current stock is "+String:C10($_ar_CurrentPAllocCount{$_l_SizeofArray})+Char:C90(13)
					
				End if 
				If ($_ar_CurrentStockLevelpAlloc{$_l_SizeofArray}#$_ar_AllocatedFromStockCount{$_l_SizeofArray})
					//TRACE  //GOTO XY(0;0)
					//message("Product "+$_t_ProductCode+Char(13)+"Investigate Stock Level P Allocate((Does Not match stock items ) it is  "+String($_ar_CurrentStockLevelpAlloc{$_l_SizeofArray})+" Stock item is "+String($_ar_AllocatedFromStockCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char:C90(9)+"Investigate Stock Level P Allocate((Does Not match stock items ) it is  "+String:C10($_ar_CurrentStockLevelpAlloc{$_l_SizeofArray})+" Stock item is "+String:C10($_ar_AllocatedFromStockCount{$_l_SizeofArray})+Char:C90(13)
				End if 
				//````
				If ($_ar_CurrentStockLevelpFree{$_l_SizeofArray}#$_ar_CurrentPFreeCount{$_l_SizeofArray})
					//message("Product"+$_t_ProductCode+Char(13)+"Investigate Stock Level P free((Does Not match current stock)it is"+String($_ar_CurrentStockLevelpFree{$_l_SizeofArray})+"Current stock is"+String($_ar_CurrentPFreeCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					//TRACE
					$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char:C90(9)+"Investigate Stock Level P free((Does Not match current stock) it is  "+String:C10($_ar_CurrentStockLevelpFree{$_l_SizeofArray})+" Current stock is "+String:C10($_ar_CurrentPFreeCount{$_l_SizeofArray})+Char:C90(13)
					
				End if 
				If ($_ar_CurrentStockLevelpFree{$_l_SizeofArray}#($_ar_TotalInstockCount{$_l_SizeofArray}))
					//GOTO XY(0;0)
					//message("Product"+$_t_ProductCode+Char(13)+"Investigate Stock Level P FREE((Does Not match stock items)it is"+String($_ar_CurrentStockLevelpFree{$_l_SizeofArray})+"Stock items is"+String($_ar_TotalInstockCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					//TRACE
					$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char:C90(9)+"Investigate Stock Level P free((Does Not match stock items ) it is  "+String:C10($_ar_CurrentStockLevelpFree{$_l_SizeofArray})+" Stock items is "+String:C10($_ar_TotalInstockCount{$_l_SizeofArray})+Char:C90(13)
				End if 
				
				If ($_ar_CurrentStockLevelOFree{$_l_SizeofArray}#$_ar_CurrentOStockCount{$_l_SizeofArray})
					//GOTO XY(0;0)
					//message("Product "+$_t_ProductCode+Char(13)+"Investigate Stock Level O Allocate((Does Not match current stock) it is  "+String($_ar_CurrentStockLevelOFree{$_l_SizeofArray})+" Current stock is "+String($_ar_CurrentOStockCount{$_l_SizeofArray})+Char(13))
					$_bo_Validate:=True:C214
					$_t_Packet:=$_t_Packet+"Product "+$_t_ProductCode+Char:C90(9)+"Investigate Stock Level O Allocate((Does Not match current stock) it is  "+String:C10($_ar_CurrentStockLevelOFree{$_l_SizeofArray})+" Current stock is "+String:C10($_ar_CurrentOStockCount{$_l_SizeofArray})+Char:C90(13)
					//TRACE
				End if 
				//GOTO XY(0;0)
				//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"5")
				
				
				If ($_bo_Validate)
					
					If ($_bo_Validated)
						//TRACE
						//TRACE
						//GOTO XY(0;0)
						//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"7")
						
						
						$_t_ErrorString:=$_t_ErrorString+Char:C90(13)+$_t_Packet+"NOT FIXED"  //
						$_bo_Validated:=False:C215
						$_bo_MayBeinTransaction:=True:C214
						
					Else 
						If ($_bo_MayBeinTransaction)
							DELAY PROCESS:C323(Current process:C322; 60*60)  //wait one minute
							$_bo_MayBeinTransaction:=False:C215
							$_l_SMIIndex:=$_l_SMIIndex-1
							$_t_Packet:=""
						Else 
							$_bo_MayBeinTransaction:=True:C214
							//TRACE
							//GOTO XY(0;0)
							//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"8")
							REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
							
							$_l_ValidationProcess:=New process:C317("STK_ValidateCalledOff"; 128000; "Validate Called Off"; 0; 0; $_t_ProductCode)
							$_l_Retries:=0
							While (Process state:C330($_l_ValidationProcess)>=0) & (Process_Name($_l_ValidationProcess)="Validate Called Off")
								$_l_Retries:=$_l_Retries+1
								DelayTicks(10*$_l_Retries)
							End while 
							//GOTO XY(0;0)
							//message("PRODUCT"+String($_l_SMIIndex)+" OF "+String($_l_CountProducts)+"9")
							
							
							$_t_ErrorString:=$_t_ErrorString+Char:C90(13)+$_t_Packet
							REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
							REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							
							STK_MenuUpdate("stock items"; $_t_ProductCode; True:C214; True:C214)
							REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
							STK_MenuUpdate("stock levels"; $_t_ProductCode; True:C214; True:C214)
							$_bo_Validated:=True:C214
							
							$_l_SMIIndex:=$_l_SMIIndex-1
							If (Is compiled mode:C492)
								DelayTicks(10)
							End if 
						End if 
					End if 
				Else 
					$_bo_MayBeinTransaction:=True:C214
					If (Is compiled mode:C492)
						DelayTicks(99)
					End if 
					
					
					$_bo_Validated:=False:C215
				End if 
				
			End if 
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
			
			
			
			CLEAR SEMAPHORE:C144("$VerifyinAction")
			
		End for 
		$_bo_FirstPass:=False:C215
		
		
		If ($_t_ErrorString#"")
			
			//TRACE
			
			$_t_DocumentsPath:=System folder:C487(Documents folder:K41:18)
			If (Not:C34(Test path name:C476($_t_DocumentsPath+"Stock_ValidationIssues.txt")=Is a document:K24:1))
				$_ti_DocumentRef:=Create document:C266($_t_DocumentsPath+"Stock_ValidationIssues.txt")
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
			End if 
			$_ti_DocumentRef:=Append document:C265($_t_DocumentsPath+"Stock_ValidationIssues.txt")
			SEND PACKET:C103($_ti_DocumentRef; String:C10(Current date:C33)+Char:C90(13)+$_t_ErrorString)
			
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			If (False:C215)
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
					SYS_bo_NoTrack:=True:C214
					
					LOGIN_SetEmail
					
					
					SYS_bo_NoTrack:=$_bo_NoTrack
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				Case of   //Sender Address
					: (<>Per_at_PersonnelNames_EmailFrom#"")
						$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
					: (<>DB_t_UserGrEmailSMTP#"")
						$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
					Else 
						$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
				End case 
				$_t_EmailSentTo:="To"
				$_t_EmailAttachment:=""
				$_t_EmailID2:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Stock CheckError"; ->$_t_EmailAttachment; ->$_t_ErrorString; False:C215)
			End if 
			$_t_ErrorString:=""
			
		End if 
	End if 
	DELAY PROCESS:C323(Current process:C322; 60*60*5)
Until (<>SYS_bo_QuitCalled)

//Close DocUMENT($_ti_DocumentRef)
ERR_MethodTrackerReturn("STK_InTesting"; $_t_oldMethodName)
