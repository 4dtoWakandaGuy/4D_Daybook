//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_Manage2011Updates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_DoNotCorrect; 0)
	ARRAY BOOLEAN:C223($_abo_DoORDNotCorrect; 0)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	ARRAY LONGINT:C221($_al_AfterID; 0)
	ARRAY LONGINT:C221($_al_CheckMovementItemNumbers; 0)
	ARRAY LONGINT:C221($_al_CSAllocatedTo; 0)
	ARRAY LONGINT:C221($_al_CSAllocatedToAFTER; 0)
	ARRAY LONGINT:C221($_al_CSBeforeIDS; 0)
	ARRAY LONGINT:C221($_al_CSUpdatedIDS; 0)
	ARRAY LONGINT:C221($_al_PreviousMovementCSID; 0)
	ARRAY LONGINT:C221($_al_PreviousMovementIDS; 0)
	ARRAY LONGINT:C221($_al_SLAfterIDS; 0)
	ARRAY LONGINT:C221($_al_SMIAddedToCSID; 0)
	ARRAY LONGINT:C221($_al_SMICopiedFromID; 0)
	ARRAY LONGINT:C221($_al_SMIIDS; 0)
	ARRAY LONGINT:C221($_al_SMIItemNumbers; 0)
	ARRAY LONGINT:C221($_al_SMITakeFromCSIDS; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
	ARRAY LONGINT:C221($_al_StockItemNumbers; 0)
	ARRAY LONGINT:C221($_al_StockLevelsBeforeIDS; 0)
	ARRAY LONGINT:C221($_al_StockMovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_StockOInumbersToDelete; 0)
	ARRAY LONGINT:C221($_al_StockONOrderOItoDelete; 0)
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY LONGINT(STK_al_PreviousMovementCSID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	ARRAY POINTER:C280($_aPtr_Fields; 0)
	ARRAY REAL:C219($_ar_AllocationItemstoDeleteQuan; 0)
	ARRAY REAL:C219($_ar_CheckMaxQuantities; 0)
	ARRAY REAL:C219($_ar_CSBeforeQuantities; 0)
	ARRAY REAL:C219($_ar_PreviousMovementQTY; 0)
	ARRAY REAL:C219($_ar_SCSAfterQTY; 0)
	ARRAY REAL:C219($_ar_SLAfterAllocated; 0)
	ARRAY REAL:C219($_ar_SLAfterFree; 0)
	ARRAY REAL:C219($_ar_SMICostPrices; 0)
	ARRAY REAL:C219($_ar_SMIQuantities; 0)
	ARRAY REAL:C219($_ar_SMIResidualQuantities; 0)
	ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
	ARRAY REAL:C219($_ar_StockLEvelsBeforeAllocated; 0)
	ARRAY REAL:C219($_ar_StockLEvelsBeforeFree; 0)
	ARRAY REAL:C219($_ar_StockONORDOItoDeleteQuantit; 0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	ARRAY TEXT:C222($_at_AfterUniqueID; 0)
	ARRAY TEXT:C222($_at_AllocatedStockTypes; 0)
	ARRAY TEXT:C222($_at_AnalysisRange; 0)
	ARRAY TEXT:C222($_at_CSAfterType; 0)
	ARRAY TEXT:C222($_at_CSBeforeType; 0)
	ARRAY TEXT:C222($_at_CSBeforeUniqueID; 0)
	ARRAY TEXT:C222($_at_CSStockType; 0)
	ARRAY TEXT:C222($_at_CSStockTypeAFTER; 0)
	ARRAY TEXT:C222($_at_CurrenciesRange; 0)
	ARRAY TEXT:C222($_at_MovementTypesFilter; 0)
	ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
	ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SLAfterInfor; 0)
	ARRAY TEXT:C222($_at_SLAfterType; 0)
	ARRAY TEXT:C222($_at_SMIHeaderCurrency; 0)
	ARRAY TEXT:C222($_at_SMILocationCodes; 0)
	ARRAY TEXT:C222($_at_SMIMovementCodes; 0)
	ARRAY TEXT:C222($_at_SMIProductCodes; 0)
	ARRAY TEXT:C222($_at_SMMovementCodes2; 0)
	ARRAY TEXT:C222($_at_StockLevelBeforeInfo; 0)
	ARRAY TEXT:C222($_at_StockLevelsBeforeType; 0)
	ARRAY TEXT:C222($_at_StockLevelsTypes; 0)
	ARRAY TEXT:C222($_at_UpdatedProductCodes; 0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	//ARRAY TEXT(STK_at_PeriodCodes;0)
	//ARRAY TEXT(STK_at_PreviousMovementAnalysis;0)
	//ARRAY TEXT(STK_at_PreviousMovementCurrency;0)
	//ARRAY TEXT(STK_at_PreviousMovementLayer;0)
	//ARRAY TEXT(STK_at_PreviousMovementLocation;0)
	//ARRAY TEXT(STK_at_SendProductCodes;0)
	C_BOOLEAN:C305(<>DB_bo_HoldPS; <>Email_bo_Enabled; <>Email_bo_PersonInited; <>STK_bo_ClientCanStart; <>STK_bo_NotFirstPass; <>Stk_bo_Pause; <>Stk_bo_PauseWorking; <>Stk_bo_PauseWorkingClient; <>STOCK_bo_NoSplit; <>STOCK_bo_NoSuperSplit; <>StockAnal)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; <>TellMe; $_bo_AllocationFirstTry; $_bo_ApplyHasRun; $_bo_Complete; $_bo_ConsolidateCS; $_bo_Continue; $_bo_ContinuePastHere; $_bo_CSIDMatch; $_bo_DateMatch; $_bo_Edit)
	C_BOOLEAN:C305($_bo_Edits; $_bo_Exit; $_bo_IgnoreOStock; $_bo_InvertedChecked; $_bo_IsAllocation; $_bo_IsDocument; $_bo_IsOK; $_bo_IsSourceStockType; $_bo_IsUNAllocation; $_bo_LastPassWasZero; $_bo_NoAdjust)
	C_BOOLEAN:C305($_bo_NoAnyDate; $_bo_NoCorrection; $_bo_NoExit; $_bo_NoOStockChange; $_bo_NoPstockChange; $_bo_NoSuperSplit; $_bo_OscFIrstTry; $_bo_PriceMatch; $_bo_ProcessVisible; $_bo_ReportToday; $_bo_ShouldbeDateMatch)
	C_BOOLEAN:C305($_bo_SkipIt; $_bo_Split; $_bo_SplitChildren; $_bo_SplitItem; $_bo_StockItemAnyRemainingIndexe; $_bo_StockItemUncopiedIndexed; $_bo_TakeOffItemNumber; $_bo_UseOnlyAllocated; $_bo_Wait; $CSChecked; DB_bo_IgnoreProductStatus)
	C_BOOLEAN:C305(ST_bo_conversionCompleted; STK_bo_CheckStockItemFreeIndex; STK_bo_DataReading; STK_bo_isAllocation; STK_bo_isUnallocation; STK_bo_NOProcess; STK_bo_NoRemaining; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; STK_bo_PreviousSet; STK_bo_ProductserverIdle)
	C_BOOLEAN:C305(STK_bo_UseOnlyAllocated)
	C_DATE:C307($_d_EightMonthsAgo; $_d_HeaderDate; $_d_StartDate; STK_d_pTakeFrommaxHeaderDate; STK_d_StartDate)
	C_LONGINT:C283(<>STK_l_PreviousProcess; <>STK_l_ProductServer; $_l_AddtoCSIDShouldBe; $_l_AddToCurrentStockID; $_l_AdjustmentsMade; $_l_AnalysisIndex; $_l_ApplicationType; $_l_CheckItemsIndex; $_l_CheckMovementItemID; $_l_ConsolidationProcess; $_l_CopiedFromID)
	C_LONGINT:C283($_l_CopiedFromIndex; $_l_CreateIndex; $_l_CSIDRow; $_l_CSRow; $_l_CurrenciesIndex; $_l_CurrentMovementItemRecord; $_l_CurrentStockRow; $_l_Days; $_l_DaysRemaining; $_l_DeletionIndex; $_l_DeletionRow)
	C_LONGINT:C283($_l_EditCount; $_l_EightMonths; $_l_FilterTypesIndex; $_l_GetItemProcess; $_l_Hours; $_l_Indexy; $_l_InvertionProcess; $_l_ItemIndex; $_l_ItemNumber; $_l_ItemNumbersIndex; $_l_LoadProductsIndex)
	C_LONGINT:C283($_l_MovementItemIDCopiedFrom; $_l_MovementItemIndex; $_l_MovementItemRecords; $_l_MovementItemsIndex; $_l_offset; $_l_P1Unique; $_l_P2Unique; $_l_P3Unique; $_l_Passes; $_l_PauseCount; $_l_PreferenceID)
	C_LONGINT:C283($_l_Process; $_l_Processed; $_l_ProcessedProducts; $_l_ProcessedSMIRecords; $_l_ProcessedSMIRecordsAtstart; $_l_ProcessIndex; $_l_ProcessState; $_l_ProcessTime; $_l_ProductServer; $_l_ProductsTableNumber; $_l_RecordNumber)
	C_LONGINT:C283($_l_RecordsInSelectionMovementIt; $_l_RecordsInTable; $_l_RecordsInTableStockItems; $_l_Retries; $_l_RetriesCount; $_l_SelectedCSRecord; $_l_SMICopiedFromID; $_l_SMICurrentID; $_l_SMICurrentRecord; $_l_SMISelectedRecord2; $_l_SplitChildrenOF)
	C_LONGINT:C283($_l_StockItemsEditCount; $_l_StockLevelID; $_l_StockLevelIndex; $_l_StockLevelRow; $_l_StockLevelsIndex; $_l_StockSetIDProcess; $_l_TableNumber; $_l_TakeFromCSID; $_l_TakeFromItemID; $_l_TimeDays; $_l_TimeHours)
	C_LONGINT:C283($_l_TotalProcessedRecords; $_l_UniqueProcessID; $_l_UpdateProductsCount; $_l_ValidateCurrentStockProcess; $_l_ZeroLongint; $2; $3; $Filter; $Start; STK_l_AnytoCopyFrom; STK_l_MaxElements)
	C_LONGINT:C283(STK_l_pCallBackProcess; STK_l_pCopiedFromID; STK_l_pNotFromSIID; STK_l_PreviousItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber; STK_l_ProdCallBackProcess; STK_l_pTakeFromCSID; STK_l_pTakeFromItemID; STK_l_Remaining; STK_l_SomeCalledOff)
	C_REAL:C285($_r_ChangeOStockSUM; $_r_Cost; $_r_CostPrice; $_r_CurrAPStockQty; $_r_CurrentStockFree; $_r_CurrentStockQuantity; $_r_CurrOStockQty; $_r_Difference; $_r_isODQuantity; $_r_ISOQuantity; $_r_LevelsQuantity)
	C_REAL:C285($_r_Net; $_r_OIQuantity; $_r_OriginalQuantity; $_r_Over; $_r_OverQuantity; $_r_QBefore; $_r_QuantityOOtoDelete; $_r_QuantityStillRequired; $_r_QuantityToDelete; $_r_Remainder; $_r_Select)
	C_REAL:C285($_r_SIQuantity; $_r_SubtractPStock; $_r_SubtractToStock; $_r_Sum; $_r_Sum2; $_r_TimePerRecord; $_r_TimeRemaining; $_r_TimeTaken; $_r_TotalAllocationsToDelete; $_r_TotalAllocationsToIgnore; $_r_TotalOStock)
	C_REAL:C285($_r_TotalOstockAllocatedBefore; $_r_TotalOStockBefore; $_r_TotalPAllocatedAfter; $_r_TotalPAllocatedBefore; $_r_TotalPFreeAfter; $_r_TotalPFreeBefore; $_r_TotalPStock; $_r_TotalPstockAllocatedBefore; $_r_TotalPStockBefore; $_r_TotoalOAfter; $_r_TotoalOBefore)
	C_REAL:C285($_r_ZeroReal; STK_R_PreviousCostPrice; STK_r_pTakeFromCostPrice; STK_r_pTakeQuantity)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentUserName; <>SYS_t_BaseCurrency; $_t_AddToTypesShouldBe; $_t_AnalysisCode; $_t_CostPriceString)
	C_TEXT:C284($_t_CurrencyCode; $_t_CurrentString; $_t_DocumentPath; $_t_EmailAttachment; $_t_EmailFromAddress; $_t_EmailID; $_t_EmailSentTo; $_t_FilterToMovementType; $_t_FurthFieldUniqueCode; $_t_HeaderDateString; $_t_LayerCode)
	C_TEXT:C284($_t_Location; $_t_LocationisOnPrevious; $_t_MovementType; $_t_Note; $_t_NoteAdd; $_t_oldMethodName; $_t_Packet; $_t_PassMessage; $_t_ProcessName; $_t_productCode; $_t_ProductCodeLoad)
	C_TEXT:C284($_t_SelectedPeriod; $_t_Serial; $_t_SMMovementTypeCode; $_t_SplitMessage; $_t_StockType; $_t_StockUniqueReference; $_t_TakeFromStockType; $_t_TakeFromTypeShouldBe; $_t_TimeRemainingMessage; $1; $4)
	C_TEXT:C284(EMAIL_t_EmailType; STK_t_pProductCode; STK_T_PreviousStockItemAnal; STK_T_PreviousStockItemCurrency; STK_T_PreviousStockItemLayer; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial; STK_t_pTakeFromAnalysis; STK_t_pTakeFromCurrency; STK_t_pTakeFromLayer; STK_t_pTakeFromStockType)
	C_TIME:C306($_ti_DocumentRef; $_ti_StartTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_Manage2011Updates")








//TRACE

If (False:C215)
	$_l_PreferenceID:=PREF_GetPreferenceID("Stock Upate Preferences")
	If (True:C214) | (Count parameters:C259>=1)
		ST_bo_conversionCompleted:=False:C215
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
			
			ALL RECORDS:C47([PERIODS:33])
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
			SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; STK_at_PeriodCodes)
			If (Records in selection:C76([PERIODS:33])>0)
				$_t_SelectedPeriod:=Gen_RequestWithList("Select The period to update stock from"; ""; "Continue"; "Stop"; 0; 0; "Set Start of conversion"; 0; ""; "STK_at_PeriodCodes")
			Else 
				$_t_SelectedPeriod:=STK_at_PeriodCodes{Size of array:C274(STK_at_PeriodCodes)}
			End if 
			If ($_t_SelectedPeriod#"")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_SelectedPeriod)
				STK_d_StartDate:=[PERIODS:33]From_Date:3
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
				VARIABLE TO BLOB:C532(STK_d_StartDate; [PREFERENCES:116]DataBlob:2; *)
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
		Else 
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; STK_d_StartDate; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ST_bo_conversionCompleted; $_l_offset)
			Else 
				ST_bo_conversionCompleted:=False:C215
			End if 
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215)
			If (Records in selection:C76([PRODUCTS:9])>0)
				ST_bo_conversionCompleted:=False:C215
			End if 
		End if 
		//TRACE
		If (Not:C34(ST_bo_conversionCompleted))
			$_bo_NoAnyDate:=False:C215
			Gen_Confirm("Handle Dates in strict sequence(do not use stock received after allocation for example)"; "No"; "Yes")
			If (OK=0)
				$_bo_NoAnyDate:=True:C214
			End if 
			If (Gen_Option)
				ALL RECORDS:C47([PERIODS:33])
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
				SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; STK_at_PeriodCodes)
				If (Records in selection:C76([PERIODS:33])>0)
					$_t_SelectedPeriod:=Gen_RequestWithList("Select The period to update stock from"; ""; "Continue"; "Stop"; 0; 0; "Set Start of conversion"; 0; ""; "STK_at_PeriodCodes")
				Else 
					$_t_SelectedPeriod:=STK_at_PeriodCodes{Size of array:C274(STK_at_PeriodCodes)}
				End if 
				If ($_t_SelectedPeriod#"")
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_SelectedPeriod)
					STK_d_StartDate:=[PERIODS:33]From_Date:3
					READ WRITE:C146([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
					LOAD RECORD:C52([PREFERENCES:116])
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					VARIABLE TO BLOB:C532(STK_d_StartDate; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532(ST_bo_conversionCompleted; [PREFERENCES:116]DataBlob:2; *)
					SAVE RECORD:C53([PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					
					
				End if 
			End if 
			
			OK:=1
			<>DB_bo_HoldPS:=True:C214
			SET DATABASE PARAMETER:C642(28; 0)
			SET DATABASE PARAMETER:C642(45; 0)
			READ WRITE:C146([MOVEMENT_TYPES:60])
			$_l_TableNumber:=Table:C252(->[MOVEMENT_TYPES:60])
			If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
				<>DB_al_TriggerTable{$_l_TableNumber}:=-1
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="UNA")
			If ([MOVEMENT_TYPES:60]Unalloc_Type:13=False:C215)
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=True:C214
				[MOVEMENT_TYPES:60]UseAllocatedStock:27:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			//
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="PO")
			If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11=False:C215)
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OSC")
			If ([MOVEMENT_TYPES:60]Delivery_Type:12=False:C215)
				[MOVEMENT_TYPES:60]Delivery_Type:12:=True:C214
				[MOVEMENT_TYPES:60]UseAllocatedStock:27:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			//
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISS")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISO")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISC")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISA")
			If ([MOVEMENT_TYPES:60]Assembly_Type:23=False:C215)
				[MOVEMENT_TYPES:60]Assembly_Type:23:=True:C214
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ILC")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="AP")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="AO")
			If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11=False:C215)
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ALO")
			If ([MOVEMENT_TYPES:60]Alloc_Type:10=False:C215)
				[MOVEMENT_TYPES:60]Alloc_Type:10:=True:C214
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="AL")
			
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ASTIN")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ASTDE")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OSD")
			
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OSM")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISD")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISM")
			If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=False:C215)
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ST")
			If ([MOVEMENT_TYPES:60]UseForLocationMove:29=False:C215)
				[MOVEMENT_TYPES:60]UseForLocationMove:29:=True:C214
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
				[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
				[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
				[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
				[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
				[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
				[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
				[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
				[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
				[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
				
				SAVE RECORD:C53([MOVEMENT_TYPES:60])
				
			End if 
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISH")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISHC")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			
			
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="SCD")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="TPIV")
			
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="TIVIN")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OSS")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISHE")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=True:C214
			[MOVEMENT_TYPES:60]UseForLocationMove:29:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			SAVE RECORD:C53([MOVEMENT_TYPES:60])
			$_l_TableNumber:=Table:C252(->[MOVEMENT_TYPES:60])
			If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
				<>DB_al_TriggerTable{$_l_TableNumber}:=0
			End if 
			
			
			If (STK_d_StartDate#!00-00-00!)
				ARRAY TEXT:C222($_at_MovementTypesFilter; 20)
				$_at_MovementTypesFilter{1}:="PO"
				$_at_MovementTypesFilter{2}:="ISS"
				$_at_MovementTypesFilter{3}:="ISO"
				$_at_MovementTypesFilter{4}:="ISA"
				$_at_MovementTypesFilter{5}:="ALO"
				$_at_MovementTypesFilter{6}:="OSC"
				
				//If we are dealing with UNA after OSC then we cannot select UNA as the type
				$_at_MovementTypesFilter{7}:="UNA"
				$_at_MovementTypesFilter{8}:="OSM"
				$_at_MovementTypesFilter{9}:="OSD"
				$_at_MovementTypesFilter{10}:="ALO"
				$_at_MovementTypesFilter{11}:="OSC"
				$_at_MovementTypesFilter{12}:="TPIV"
				$_at_MovementTypesFilter{13}:="TPINV"
				$_at_MovementTypesFilter{14}:="OSS"
				
				$_at_MovementTypesFilter{15}:="ISC"  //
				$_at_MovementTypesFilter{16}:="ILC"
				$_at_MovementTypesFilter{17}:="ISD"
				$_at_MovementTypesFilter{18}:="ISM"
				$_at_MovementTypesFilter{19}:="TIVIN"
				$_at_MovementTypesFilter{20}:=""
				
				If (Application type:C494=4D Server:K5:6)
					//STK_FIXOCA_2
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
					READ WRITE:C146([CURRENT_STOCK:62])
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="UNA")
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_SMICopiedFromID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_SMITakeFromCSIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SMIIDS; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_SMIQuantities)
					$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
					If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
						<>DB_al_TriggerTable{$_l_TableNumber}:=-1
					End if 
					For ($_l_CopiedFromIndex; 1; Size of array:C274($_al_SMICopiedFromID))
						If ($_al_SMICopiedFromID{$_l_CopiedFromIndex}>0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SMICopiedFromID{$_l_CopiedFromIndex})
							If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#$_al_SMITakeFromCSIDS{$_l_CopiedFromIndex})
									$_l_AddtoCSIDShouldBe:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_AddtoCSIDShouldBe)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
									$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_AddtoCSIDShouldBe)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
									$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									$_r_Net:=$_r_Sum-$_r_Sum2
									If ($_r_Net-$_ar_SMIQuantities{$_l_CopiedFromIndex}>=0)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SMIIDS{$_l_CopiedFromIndex})
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddtoCSIDShouldBe
										
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_AddtoCSIDShouldBe)
										STK_UpdateCurrentStock2011
									Else 
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SMIIDS{$_l_CopiedFromIndex})
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SMICopiedFromID{$_l_CopiedFromIndex})
										STK_UpdateCalledOffQuantity
										QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_AddtoCSIDShouldBe)
										STK_UpdateCurrentStock2011
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SMIIDS{$_l_CopiedFromIndex})
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										
									End if 
								End if 
							End if 
						End if 
					End for 
					$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
					If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
						<>DB_al_TriggerTable{$_l_TableNumber}:=-1
					End if 
					//QUERY([CURRENT STOCK];[CURRENT STOCK]Item Number#0)
					//APPLY TO SELECTION([CURRENT STOCK];STK_UpdateCurrentStock2011 )
					
				End if 
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Source_Stock:10=True:C214)
				If (Records in selection:C76([STOCK_TYPES:59])=0) & (Application type:C494=4D Server:K5:6)
					READ WRITE:C146([STOCK_TYPES:59])
					QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1="S")
					[STOCK_TYPES:59]Source_Stock:10:=True:C214
					SAVE RECORD:C53([STOCK_TYPES:59])
					UNLOAD RECORD:C212([STOCK_TYPES:59])
					READ ONLY:C145([STOCK_TYPES:59])
					
					ALERT:C41("There are no stock types set as source stock(supplier), setting this will improve the stock maintainance")
				End if 
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				DISTINCT VALUES:C339([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AllocatedStockTypes)
				
				$_bo_Complete:=False:C215
				$_l_ApplicationType:=Application type:C494
				If ($_l_ApplicationType=4D Local mode:K5:1)
					$_l_ApplicationType:=4D Server:K5:6
				End if 
				If (Count parameters:C259>=1)
					$_l_ApplicationType:=4D Server:K5:6
				End if 
				If ($_l_ApplicationType=4D Server:K5:6)
					Open window:C153(20; 60; Screen width:C187-20; 160; -720)
					//$_t_DocumentPath:=
				End if 
				
				$_t_DocumentPath:=DB_GetDocumentPath
				
				$_bo_IsDocument:=(Test path name:C476($_t_DocumentPath+"StockChanges2011.txt")=Is a document:K24:1)
				If (Not:C34($_bo_IsDocument))
					$_ti_DocumentRef:=Create document:C266($_t_DocumentPath+"StockChanges2011.txt")
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
				End if 
				
				$_bo_IsDocument:=(Test path name:C476($_t_DocumentPath+"StockDailyLog.txt")=Is a document:K24:1)
				If (Not:C34($_bo_IsDocument))
					$_ti_DocumentRef:=Create document:C266($_t_DocumentPath+"StockDailyLog.txt")
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					CREATE EMPTY SET:C140([PRODUCTS:9]; "SIReported")
					SAVE SET:C184("SIReported"; "SIReported")
				Else 
					LOAD SET:C185([PRODUCTS:9]; "SIReported"; "SIReported")
				End if 
				$_bo_ReportToday:=False:C215
				$_d_StartDate:=Current date:C33(*)
				$_ti_StartTime:=Current time:C178(*)
				READ ONLY:C145([PRODUCTS:9])
				$_l_ProcessedSMIRecordsAtstart:=1
				If ($_l_ApplicationType#4D Remote mode:K5:5)
					QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1="N")
					If (Records in selection:C76([STOCK_TYPES:59])=0)
						CREATE RECORD:C68([STOCK_TYPES:59])
						[STOCK_TYPES:59]Type_Code:1:="N"
						[STOCK_TYPES:59]Type_Name:2:="NULL Stock type"
						SAVE RECORD:C53([STOCK_TYPES:59])
					End if 
					UNLOAD RECORD:C212([STOCK_TYPES:59])
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
					If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
						CREATE RECORD:C68([MOVEMENT_TYPES:60])
						[MOVEMENT_TYPES:60]Type_Code:1:="ADJ"
						[MOVEMENT_TYPES:60]Type_Name:2:="Adjustment Stock Reduction"
						[MOVEMENT_TYPES:60]Stock_Plus:3:="N"
						[MOVEMENT_TYPES:60]Stock_Minus:4:="P"
						SAVE RECORD:C53([MOVEMENT_TYPES:60])
					End if 
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
					If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
						CREATE RECORD:C68([MOVEMENT_TYPES:60])
						[MOVEMENT_TYPES:60]Type_Code:1:="OCA"
						[MOVEMENT_TYPES:60]Type_Name:2:="Cancel on order"
						[MOVEMENT_TYPES:60]Stock_Plus:3:="S"
						[MOVEMENT_TYPES:60]Stock_Minus:4:="O"
						SAVE RECORD:C53([MOVEMENT_TYPES:60])
					End if 
					
					
					
					
					
					
					
					$_l_RecordsInTable:=Records in table:C83([PRODUCTS:9])
					$_l_RecordsInTableStockItems:=Records in table:C83([STOCK_MOVEMENT_ITEMS:27])
					
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
					$_l_ProcessedSMIRecordsAtstart:=Records in selection:C76([PRODUCTS:9])
					If ($_l_ProcessedSMIRecordsAtstart=0)
						
						
						READ WRITE:C146([STOCK_MOVEMENTS:40])
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9="RC@"; *)
						QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Analysis_Code:9#"RC")
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
							[STOCK_MOVEMENTS:40]Analysis_Code:9:="RC"
							SAVE RECORD:C53([STOCK_MOVEMENTS:40])
							NEXT RECORD:C51([STOCK_MOVEMENTS:40])
						End for 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10="RC@"; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10#"RC")
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
							[CURRENT_STOCK:62]Analysis_Code:10:="RC"
							SAVE RECORD:C53([CURRENT_STOCK:62])
							NEXT RECORD:C51([CURRENT_STOCK:62])
						End for 
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7="RC@"; *)
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7#"RC")
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
							[STOCK_LEVELS:58]Analysis_Code:7:="RC"
							SAVE RECORD:C53([STOCK_LEVELS:58])
							NEXT RECORD:C51([STOCK_LEVELS:58])
						End for 
						ALL RECORDS:C47([STOCK_LEVELS:58])
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
							Repeat 
								$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
								If ($_t_productCode#"")
									If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
										$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
									Else 
										$_bo_Continue:=True:C214
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
							Until ($_bo_Continue)
							If ([STOCK_LEVELS:58]Product_Code:1#$_t_productCode)
								[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
								SAVE RECORD:C53([STOCK_LEVELS:58])
							End if 
							NEXT RECORD:C51([STOCK_LEVELS:58])
						End for 
						ALL RECORDS:C47([STOCK_LEVELS:58])
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
							Repeat 
								$_t_productCode:=[STOCK_LEVELS:58]Product_Code:1
								If ($_t_productCode#"")
									If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
										$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
									Else 
										$_bo_Continue:=True:C214
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
							Until ($_bo_Continue)
							If ([STOCK_LEVELS:58]Product_Code:1#$_t_productCode)
								[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
								SAVE RECORD:C53([STOCK_LEVELS:58])
							End if 
							NEXT RECORD:C51([STOCK_LEVELS:58])
						End for 
						ALL RECORDS:C47([CURRENT_STOCK:62])
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
							Repeat 
								$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
								If ($_t_productCode#"")
									If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
										$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
									Else 
										$_bo_Continue:=True:C214
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
							Until ($_bo_Continue)
							If ([CURRENT_STOCK:62]Product_Code:1#$_t_productCode)
								[CURRENT_STOCK:62]Product_Code:1:=$_t_productCode
								SAVE RECORD:C53([CURRENT_STOCK:62])
							End if 
							NEXT RECORD:C51([CURRENT_STOCK:62])
						End for 
						ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
						$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
						If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
							<>DB_al_TriggerTable{$_l_TableNumber}:=-1
						End if 
						For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							Repeat 
								$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
								If ($_t_productCode#"")
									If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
										$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
									Else 
										$_bo_Continue:=True:C214
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
							Until ($_bo_Continue)
							If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_productCode)
								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_t_productCode
								
								
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
								
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
						If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
							<>DB_al_TriggerTable{$_l_TableNumber}:=0
						End if 
					Else 
						//af ($_l_ApplicationType=4D Server
						//zCONFIRM("RESET-this will remake connections."
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#0)
					$_l_ProcessedSMIRecordsAtstart:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					
				Else 
					If (Count parameters:C259=0)
						GET PROCESS VARIABLE:C371(-1; <>STK_bo_ClientCanStart; <>STK_bo_ClientCanStart)
						If (Not:C34(<>STK_bo_ClientCanStart))
							Repeat 
								DelayTicks(60*60)
								GET PROCESS VARIABLE:C371(-1; <>STK_bo_ClientCanStart; <>STK_bo_ClientCanStart)
							Until (<>STK_bo_ClientCanStart)
						End if 
					End if 
				End if 
				
				$_l_InvertionProcess:=0
				$_l_ValidateCurrentStockProcess:=0
				$_l_ConsolidationProcess:=0
				Repeat 
					
					
					//TRACE
					If (True:C214) & (Count parameters:C259=0)
						STK_l_MaxElements:=0
						STK_l_ProdCallBackProcess:=Current process:C322
						STK_bo_ProductserverIdle:=False:C215
						
						$_l_ProductServer:=<>STK_l_ProductServer
						<>STK_l_ProductServer:=Execute on server:C373("STK_UPDATEPRODUCTSERVER"; 51200; "STK_ProductsManager"; *)
						If (<>STK_l_ProductServer#$_l_ProductServer)
							DelayTicks(60*60)
						End if 
						//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
						$_l_Retries:=0
						While (Test semaphore:C652("◊ServerControl"))
							//GOTO XY(0;0)
							// ("Waiting for semaphore  "+"◊ServerControl"+String($_l_Retries))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2+$_l_Retries)
						End while 
						$_l_Retries:=0
						While (Semaphore:C143("◊ClientControl"))
							//GOTO XY(0;0)
							//MESSAGE("Waiting for semaphore  "+"◊ClientControl"+String($_l_Retries))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2+$_l_Retries)
						End while 
						//CLOSE WINDOW
						SET PROCESS VARIABLE:C370(<>STK_l_ProductServer; STK_l_ProdCallBackProcess; Current process:C322)
						SET PROCESS VARIABLE:C370(<>STK_l_ProductServer; STK_bo_ProductserverIdle; False:C215)
						RESUME PROCESS:C320(<>STK_l_ProductServer)
						GET PROCESS VARIABLE:C371(<>STK_l_ProductServer; STK_bo_DataReading; STK_bo_DataReading)
						//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
						$_l_Retries:=0
						While (STK_bo_DataReading)
							//GOTO XY(0;0)
							//MESSAGE("Waiting for Flag  "+"STK_bo_DataReading"+String($_l_Retries))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(30+$_l_Retries)
							GET PROCESS VARIABLE:C371(<>STK_l_ProductServer; STK_bo_DataReading; STK_bo_DataReading)
						End while 
						//CLOSE WINDOW
						GET PROCESS VARIABLE:C371(<>STK_l_ProductServer; STK_l_MaxElements; STK_l_MaxElements)
						ARRAY TEXT:C222($_at_ProductCodes; 0)
						ARRAY TEXT:C222(STK_at_SendProductCodes; 0)
						
						For ($_l_LoadProductsIndex; 1; STK_l_MaxElements)
							GET PROCESS VARIABLE:C371(<>STK_l_ProductServer; STK_at_SendProductCodes{$_l_LoadProductsIndex}; $_t_ProductCodeLoad)
							APPEND TO ARRAY:C911($_at_ProductCodes; $_t_ProductCodeLoad)
							
						End for 
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						CLEAR SEMAPHORE:C144("◊ClientControl")
						
					Else 
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
						//QUERY([PRODUCTS];[PRODUCTS]Product Code="5-104 COL 7")
						//TRACE
						
						DISTINCT VALUES:C339([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					End if 
					
					
					If (Records in selection:C76([PRODUCTS:9])=0)
						$_bo_Complete:=True:C214
					End if 
					
					$Start:=1
					If (Size of array:C274($_at_ProductCodes)>0)
						If ($_l_ApplicationType=4D Server:K5:6)
							//Open window(20;60;Screen width-20;160;-720)
							//$_t_DocumentPath:=
						End if 
					End if 
					For ($_l_UpdateProductsCount; $Start; Size of array:C274($_at_ProductCodes))
						
						If (Not:C34(<>SYS_bo_QuitCalled))
							
							If (Application type:C494=4D Remote mode:K5:5) & (Count parameters:C259<1)
								//here wait if any user processes with interface
								$_bo_Wait:=False:C215
								Repeat 
									COPY ARRAY:C226(<>PRC_at_ProcessName; PRC_at_ProcessName)
									COPY ARRAY:C226(<>PRC_al_ProcessNum; PRC_al_ProcessNum)
									For ($_l_ProcessIndex; 1; Size of array:C274(PRC_at_ProcessName))
										If (Position:C15("View "; PRC_at_ProcessName{$_l_ProcessIndex})>0)
											If (Process state:C330(PRC_al_ProcessNum{$_l_ProcessIndex})>=0)
												$_bo_Wait:=True:C214
												$_l_ProcessIndex:=999999
											End if 
										Else 
											If (Position:C15("Enter "; PRC_at_ProcessName{$_l_ProcessIndex})>0)
												If (Process state:C330(PRC_al_ProcessNum{$_l_ProcessIndex})>=0)
													$_bo_Wait:=True:C214
													$_l_ProcessIndex:=999999
												End if 
											End if 
										End if 
									End for 
									If ($_bo_Wait)
										DelayTicks(60*60)
									End if 
								Until (Not:C34($_bo_Wait))
								
							End if 
							
							
							If ($_l_ApplicationType=4D Server:K5:6)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#0)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
								$_l_ProcessedProducts:=Records in selection:C76([PRODUCTS:9])
								
								$_l_ProcessedSMIRecords:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								If (Current date:C33(*)=$_d_StartDate)
									$_r_TimeTaken:=Current time:C178(*)-$_ti_StartTime
									
								Else 
									$_l_Days:=Current date:C33(*)-$_d_StartDate
									$_r_TimeTaken:=?23:59:00?-$_ti_StartTime
									$_r_TimeTaken:=$_r_TimeTaken+(Current time:C178-?00:00:00?)+($_l_Days*(24*60*60))
								End if 
								$_l_TotalProcessedRecords:=$_l_ProcessedProducts  //-$_l_ProcessedSMIRecordsAtstart
								$_l_Processed:=$_l_ProcessedSMIRecords-$_l_ProcessedSMIRecordsAtstart
								If ($_l_Processed>0)
									$_r_TimePerRecord:=$_r_TimeTaken/$_l_Processed
								Else 
									$_r_TimePerRecord:=1
								End if 
								$_r_TimeRemaining:=(($_l_RecordsInTableStockItems-$_l_ProcessedSMIRecords)*$_r_TimePerRecord)
								$_l_DaysRemaining:=Int:C8($_r_TimeRemaining/(24*60*60))
								$_l_TimeDays:=$_l_DaysRemaining*(24*60*60)
								$_r_Remainder:=$_r_TimeRemaining-$_l_TimeDays
								$_l_Hours:=Int:C8($_r_Remainder/(60*60))
								$_l_TimeHours:=$_l_Hours*(60*60)
								$_r_Remainder:=$_r_Remainder-$_l_TimeHours
								$_t_TimeRemainingMessage:="Processed "+String:C10($_l_TotalProcessedRecords)+" of "+String:C10($_l_RecordsInTable)+" Estimated time to end= "+String:C10($_l_DaysRemaining)+" Days "+String:C10($_l_Hours)+" Hours "
								//GOTO XY(0;0)
								//MESSAGE($_t_TimeRemainingMessage+" Checking Product: "+$_at_ProductCodes{$_l_UpdateProductsCount})
							End if 
							//READ WRITE([STOCK_LEVELS])
							//QUERY([STOCK_LEVELS];[STOCK_LEVELS]Product Code=$_at_ProductCodes{$_l_UpdateProductsCount})
							//APPLY TO SELECTION([STOCK_LEVELS];STK_ValidateLevel )
							//UNLOAD RECORD([STOCK_LEVELS])
							READ ONLY:C145([STOCK_LEVELS:58])
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
							SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Stock_Type:2; $_at_StockLevelsBeforeType; [STOCK_LEVELS:58]UniqueConstruct:11; $_at_StockLevelBeforeInfo; [STOCK_LEVELS:58]Free_Level:3; $_ar_StockLEvelsBeforeFree; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_StockLEvelsBeforeAllocated; [STOCK_LEVELS:58]X_ID:10; $_al_StockLevelsBeforeIDS; [STOCK_LEVELS:58]Stock_Type:2; $_at_StockLevelsTypes)
							$_ti_DocumentRef:=Append document:C265($_t_DocumentPath+"StockChanges2011.txt")
							If (Records in selection:C76([STOCK_LEVELS:58])>0)
								
								CREATE SET:C116([STOCK_LEVELS:58]; "$_1")
								$_t_Packet:=""
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="S")
								
								$_t_Packet:=Char:C90(13)+"Product:"+Char:C90(9)+$_at_ProductCodes{$_l_UpdateProductsCount}+" "+String:C10(Current date:C33(*))+" "+String:C10(Current time:C178(*))+Char:C90(13)
								$_t_Packet:=$_t_Packet+"STOCK LEVELS BEFORE "+Char:C90(13)+Char:C90(9)+"Stock Type"+Char:C90(9)+"Free Qty"+Char:C90(9)+"Free Value"+Char:C90(9)+"Allocated Qty"+Char:C90(9)+"Allocated Value"+Char:C90(9)+"Record ID"+Char:C90(9)+"Combined info"+Char:C90(13)
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
									NEXT RECORD:C51([STOCK_LEVELS:58])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="O")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
									NEXT RECORD:C51([STOCK_LEVELS:58])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="P")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
									NEXT RECORD:C51([STOCK_LEVELS:58])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="C")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
									NEXT RECORD:C51([STOCK_LEVELS:58])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"C")
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"P")
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"O")
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"S")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
									NEXT RECORD:C51([STOCK_LEVELS:58])
								End for 
							End if 
							$_t_Packet:=$_t_Packet+Char:C90(13)
							$_r_TotalPFreeBefore:=0
							$_r_TotalPAllocatedBefore:=0
							$_r_TotoalOBefore:=0
							
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
							//``````````````````````````
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
							
							If (Records in selection:C76([CURRENT_STOCK:62])=1)
								$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
							Else 
								$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
							End if 
							READ WRITE:C146([CUSTOM_FIELDS:98])
							$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
							$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
							
							If ($_t_FurthFieldUniqueCode#"")
								READ WRITE:C146([CUSTOM_FIELDS:98])
								QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
								QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Pre Conversion Qty")
								If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								Else 
									READ WRITE:C146([CUSTOM_FIELDS:98])
									//If the Further Field records were not attached, create them
									CREATE RECORD:C68([CUSTOM_FIELDS:98])
									[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
									[CUSTOM_FIELDS:98]Field_Name:3:="Pre Conversion Qty"
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								End if 
								
							End if 
							$_r_CurrentStockFree:=$_r_CurrentStockQuantity
							//```
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
							
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5#0)
							
							
							If (Records in selection:C76([CURRENT_STOCK:62])=1)
								$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
							Else 
								$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
							End if 
							READ WRITE:C146([CUSTOM_FIELDS:98])
							$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
							$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
							
							If ($_t_FurthFieldUniqueCode#"")
								READ WRITE:C146([CUSTOM_FIELDS:98])
								QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
								QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Pre-Conv AlloQty")
								If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								Else 
									READ WRITE:C146([CUSTOM_FIELDS:98])
									//If the Further Field records were not attached, create them
									CREATE RECORD:C68([CUSTOM_FIELDS:98])
									[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
									[CUSTOM_FIELDS:98]Field_Name:3:="Pre-Conv AlloQty"
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								End if 
							End if 
							$_r_CurrAPStockQty:=$_r_CurrentStockQuantity
							
							//````
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
							
							QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O")
							
							
							If (Records in selection:C76([CURRENT_STOCK:62])=1)
								$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
							Else 
								$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
							End if 
							READ WRITE:C146([CUSTOM_FIELDS:98])
							$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
							$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
							
							If ($_t_FurthFieldUniqueCode#"")
								READ WRITE:C146([CUSTOM_FIELDS:98])
								QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
								QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Pre-Conv O Qty")
								If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								Else 
									READ WRITE:C146([CUSTOM_FIELDS:98])
									//If the Further Field records were not attached, create them
									CREATE RECORD:C68([CUSTOM_FIELDS:98])
									[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
									[CUSTOM_FIELDS:98]Field_Name:3:="Pre-Conv O Qty"
									[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
									SAVE RECORD:C53([CUSTOM_FIELDS:98])
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
								End if 
							End if 
							$_r_CurrOStockQty:=$_r_CurrentStockQuantity
							
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
							
							ARRAY REAL:C219($_ar_CSBeforeQuantities; 0)
							
							//`````````````````````````````
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; $_at_CSBeforeType; [CURRENT_STOCK:62]Quantity:4; $_ar_CSBeforeQuantities; [CURRENT_STOCK:62]UniqueConstruct:14; $_at_CSBeforeUniqueID; [CURRENT_STOCK:62]X_ID:13; $_al_CSBeforeIDS; [CURRENT_STOCK:62]Stock_Type:3; $_at_CSStockType; [CURRENT_STOCK:62]Item_Number:5; $_al_CSAllocatedTo)
							$_t_Packet:=$_t_Packet+"CURRENT STOCK BEFORE"+Char:C90(13)+Char:C90(9)+"Stock Type"+Char:C90(9)+"Qty"+Char:C90(9)+"Unit Cost"+Char:C90(9)+"Record ID"+Char:C90(9)+"Combined info"+Char:C90(9)+"Sales Order Item Number+Char(13)"
							
							If (Records in selection:C76([CURRENT_STOCK:62])>0)
								CREATE SET:C116([CURRENT_STOCK:62]; "$_1")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="S")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
									If ([CURRENT_STOCK:62]Quantity:4>0)
										$_r_TotoalOBefore:=$_r_TotoalOBefore+[CURRENT_STOCK:62]Quantity:4
									End if 
									$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
									If ([CURRENT_STOCK:62]Item_Number:5#0)
										If ([CURRENT_STOCK:62]Quantity:4>0)
											$_r_TotalPAllocatedBefore:=$_r_TotalPAllocatedBefore+[CURRENT_STOCK:62]Quantity:4
										End if 
									Else 
										If ([CURRENT_STOCK:62]Quantity:4>0)
											$_r_TotalPFreeBefore:=$_r_TotalPFreeBefore+[CURRENT_STOCK:62]Quantity:4
										End if 
									End if 
									$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="C")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE SET:C118("$_1")
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"C")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"P")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"O")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"S")
								For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
									$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								SEND PACKET:C103($_ti_DocumentRef; $_t_Packet)
							End if 
							SEND PACKET:C103($_ti_DocumentRef; Char:C90(13)+"Expected P  stock="+String:C10($_r_TotalPFreeBefore)+" Free "+String:C10($_r_TotalPAllocatedBefore)+" Allocated"+Char:C90(13)+"Expected 0 stock="+String:C10($_r_TotoalOBefore)+Char:C90(13))
							
							CLOSE DOCUMENT:C267($_ti_DocumentRef)
							
							Repeat 
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "RelevantItems")
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_SMIMovementCodes)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_SMIMovementCodes)
								CREATE SET:C116([STOCK_MOVEMENTS:40]; "RelevantMovements")
								QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5<STK_d_StartDate)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_SMMovementCodes2)
								QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_SMMovementCodes2)
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38:=True:C214)
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=-1)
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=-1)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>=0)
								
								//`````
								$_l_StockItemsEditCount:=0
								
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$_1")
								ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
								//$_t_Packet:=$_t_Packet+"STOCK ITEMS BEFORE"+Char(9)+"MOVEMENT CODE"+Char(9)+"MOVEMENT TYPE"+Char(9)+"ADD TO STOCK TYPE"+Char(9)+"TAKE FROM STOCK TYPE"+Char(9)+"DATE"+Char(9)+"QUANTITY"+Char(9)+"ID"+Char(13)
								If (Not:C34($_bo_InvertedChecked)) & ($_l_ProcessedSMIRecordsAtstart=0) & (Application type:C494#4D Remote mode:K5:5)
									$_l_InvertionProcess:=New process:C317("STK_2011Setinverted"; 512000; "Set Inverted"; *)
									PROCESS PROPERTIES:C336($_l_InvertionProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
									$_l_P1Unique:=$_l_UniqueProcessID
									$_bo_InvertedChecked:=True:C214
								End if 
								STK_2011SetInverted($_at_ProductCodes{$_l_UpdateProductsCount})
								If (Not:C34($CSChecked)) & ($_l_ProcessedSMIRecordsAtstart=0) & (Application type:C494#4D Remote mode:K5:5)
									$_l_ValidateCurrentStockProcess:=New process:C317("STK_2011ValidateCSIDS"; 512000; "TestCSIDS"; *)
									PROCESS PROPERTIES:C336($_l_ValidateCurrentStockProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
									$_l_P2Unique:=$_l_UniqueProcessID
									$CSChecked:=True:C214
								End if 
								STK_2011ValidateCSIDS($_at_ProductCodes{$_l_UpdateProductsCount})
								If (Not:C34($_bo_ConsolidateCS)) & ($_l_ProcessedSMIRecordsAtstart=0) & (Application type:C494#4D Remote mode:K5:5)
									$_l_ConsolidationProcess:=New process:C317("STK_CONSILIDATECS"; 512000; "ConsolidateIDS"; *)
									PROCESS PROPERTIES:C336($_l_ConsolidationProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
									$_l_P3Unique:=$_l_UniqueProcessID
									$_bo_ConsolidateCS:=True:C214
								End if 
								STK_CONSILIDATECS($_at_ProductCodes{$_l_UpdateProductsCount})
								READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
								READ WRITE:C146([CURRENT_STOCK:62])
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
								
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
								
								$_l_RecordsInSelectionMovementIt:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
								
								
								$_t_productCode:=""
								$_bo_Continue:=False:C215
								If ($_l_InvertionProcess>0)
									$_bo_Continue:=False:C215
									PROCESS PROPERTIES:C336($_l_InvertionProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
									If ($_l_P1Unique=$_l_UniqueProcessID)
										If ($_l_ProcessState<0)
											$_bo_Continue:=True:C214
										End if 
									Else 
										$_l_InvertionProcess:=0
										$_bo_Continue:=True:C214
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
								If ($_bo_Continue)
									$_bo_Continue:=False:C215
									If ($_l_ValidateCurrentStockProcess>0)
										PROCESS PROPERTIES:C336($_l_ValidateCurrentStockProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
										If ($_l_P2Unique=$_l_UniqueProcessID)
											If ($_l_ProcessState<0)
												$_bo_Continue:=True:C214
											End if 
										Else 
											$_l_ValidateCurrentStockProcess:=0
											$_bo_Continue:=True:C214
										End if 
									Else 
										$_bo_Continue:=True:C214
									End if 
								End if 
								If (Not:C34($_bo_ApplyHasRun))
									If ($_bo_Continue)
										$_bo_Continue:=False:C215
										If ($_l_ConsolidationProcess>0)
											PROCESS PROPERTIES:C336($_l_ConsolidationProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
											If ($_l_P3Unique=$_l_UniqueProcessID)
												If ($_l_ProcessState<0)
													$_bo_Continue:=True:C214
												End if 
											Else 
												$_l_ConsolidationProcess:=0
												$_bo_Continue:=True:C214
											End if 
										Else 
											$_bo_Continue:=True:C214
										End if 
									End if 
									
									
									If ($_bo_Continue) & (Application type:C494#4D Remote mode:K5:5)
										<>STK_bo_ClientCanStart:=True:C214
										$_bo_ApplyHasRun:=True:C214
										$_l_StockSetIDProcess:=New process:C317("STK_APPLYADDEDTOID"; 256000; "STK_SETID"; *)
									End if 
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[CURRENT_STOCK:62])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_LEVELS:58])
								
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								For ($_l_CopiedFromIndex; 1; $_l_RecordsInSelectionMovementIt)
									
									$_l_StockItemsEditCount:=$_l_StockItemsEditCount+1
									If (Not:C34(<>SYS_bo_QuitCalled))
										If ($_l_ApplicationType=4D Server:K5:6)
											GOTO XY:C161(0; 0)
											MESSAGE:C88($_t_TimeRemainingMessage+" Checking Product: "+$_at_ProductCodes{$_l_UpdateProductsCount})
											GOTO XY:C161(0; 1)
											MESSAGE:C88("Marking added to current stock id on "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt))
											//Goto xy(0;2)
											//MESSAGE(String([STOCK ITEMS]x_ID)+" "+"Add to stock typ"
										End if 
										$_bo_Edits:=False:C215
										USE NAMED SELECTION:C332("ALL")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CopiedFromIndex)
										//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
										$_l_Retries:=0
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
											//GOTO XY(0;0)
											//MESSAGE("Waiting for Record unlock Stock items  "+String($_l_Retries))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(6+$_l_Retries)
										End while 
										//CLOSE WINDOW
										If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
											If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
												QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
											End if 
											$_bo_Edits:=STK_SetHeaderInfo
											$_bo_Edits:=$_bo_Edits | $_bo_Edits
											$_bo_TakeOffItemNumber:=False:C215
											If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
												QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
											End if 
											$_bo_IsUNAllocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
											$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
											$_bo_UseOnlyAllocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
											//if this is an unallocation type and the [stock items]item number is filled it should be moved to the correct field
											Case of 
												: ($_bo_IsUNAllocation) | (($_bo_IsAllocation) & ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
													If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
														[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
														[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
														If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
															//
															STK_l_PreviousItemNumber:=0
															STK_bo_PreviousItemNumberTested:=False:C215
															$_l_GetItemProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
															//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
															$_l_Retries:=0
															While (Not:C34(STK_bo_PreviousItemNumberTested))
																//GOTO XY(0;0)
																//MESSAGE("Waiting for flag  STK_bo_PreviousItemNumberTested"+String($_l_Retries))
																$_l_Retries:=$_l_Retries+1
																DelayTicks((3+$_l_Retries)*60)
															End while 
															//CLOSE WINDOW
															SET PROCESS VARIABLE:C370($_l_GetItemProcess; STK_bo_PreviousCAllback; True:C214)
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=STK_l_PreviousItemNumber
														End if 
														SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
														$_bo_Edits:=True:C214
														
													End if 
													
												: ($_bo_IsAllocation)
													If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
														If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
															SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
															$_bo_Edits:=True:C214
														End if 
													End if 
											End case 
											
											
											If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
												If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
													$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
													STK_bo_NOProcess:=True:C214
													[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
													STK_bo_NOProcess:=False:C215
													If ($_l_PreferenceID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
														If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
															//QUERY([CURRENT STOCK];[CURRENT STOCK]XREC_ID=[STOCK ITEMS]xAddtoCurrentStockID)
															[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
														End if 
														$_bo_Edits:=True:C214
													End if 
												End if 
												
												
												If ($_bo_Edits)
													SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
												End if 
											End if 
										End if 
									End if 
								End for 
								
								If (Not:C34(<>SYS_bo_QuitCalled))
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
										APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
									End if 
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>=0)
									MESSAGES OFF:C175
									<>TellMe:=True:C214
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									<>TellMe:=False:C215
									MESSAGES ON:C181
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ISO"; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>=0)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$CheckIsod")
									DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_CheckMovementItemNumbers)
									ARRAY REAL:C219($_ar_CheckMaxQuantities; 0)
									ARRAY REAL:C219($_ar_CheckMaxQuantities; Size of array:C274($_al_CheckMovementItemNumbers))
									If (Size of array:C274($_al_CheckMovementItemNumbers)>0)
										For ($_l_CheckItemsIndex; 1; Size of array:C274($_al_CheckMovementItemNumbers))
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_CheckMovementItemNumbers{$_l_CheckItemsIndex})
											If ([ORDER_ITEMS:25]Quantity:3>0)
												$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}:=Abs:C99([ORDER_ITEMS:25]Quantity:3)
											End if 
										End for 
										For ($_l_CheckItemsIndex; 1; Size of array:C274($_al_CheckMovementItemNumbers))
											USE SET:C118("$CheckIsod")
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_CheckMovementItemNumbers{$_l_CheckItemsIndex})
											$_r_isODQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
											If ($_r_isODQuantity>$_ar_CheckMaxQuantities{$_l_CheckItemsIndex})
												FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
													If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_ar_CheckMaxQuantities{$_l_CheckItemsIndex})
														If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)
															If ($_ar_CheckMaxQuantities{$_l_CheckItemsIndex}>0)
																//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																$_l_Retries:=0
																While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																	//GOTO XY(0;0)
																	//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																	$_l_Retries:=$_l_Retries+1
																	DelayTicks(60*$_l_Retries)
																End while 
																//CLOSE WINDOW
																
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
																[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
																$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}:=0
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
															Else 
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
															End if 
														Else 
															If ($_ar_CheckMaxQuantities{$_l_CheckItemsIndex}<0)
																//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																$_l_Retries:=0
																While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																	//GOTO XY(0;0)
																	//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																	$_l_Retries:=$_l_Retries+1
																	
																	DelayTicks(60*$_l_Retries)
																End while 
																//CLOSE WINDOW
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99($_ar_CheckMaxQuantities{$_l_CheckItemsIndex})
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
																[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
																$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}:=0
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
															Else 
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
															End if 
														End if 
													Else 
														$_r_Over:=$_r_isODQuantity-$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}
														For ($_l_MovementItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
															If ($_r_Over>0)
																If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>$_r_Over)
																	//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																	$_l_Retries:=0
																	While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																		//GOTO XY(0;0)
																		//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																		$_l_Retries:=$_l_Retries+1
																		DelayTicks(60*$_l_Retries)
																	End while 
																	//CLOSE WINDOW
																	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Over
																	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	
																	SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																	
																	DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
																	[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Over
																	[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																	SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																Else 
																	If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>0)
																		//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																		$_l_Retries:=0
																		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																			//GOTO XY(0;0)
																			//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																			$_l_Retries:=$_l_Retries+1
																			DelayTicks(60*$_l_Retries)
																		End while 
																		//CLOSE WINDOW
																		[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		$_r_Over:=$_r_Over-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	End if 
																End if 
															End if 
															NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
															
														End for 
														
													End if 
													
												Else 
													$_r_Over:=$_r_isODQuantity-$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}
													//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
													$_l_Retries:=0
													While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
														//GOTO XY(0;0)
														//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
														$_l_Retries:=$_l_Retries+1
														DelayTicks(60*$_l_Retries)
													End while 
													//CLOSE WINDOW
													[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_CheckMaxQuantities{$_l_CheckItemsIndex}
													[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
													DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
													[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Over
													[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
													[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
													[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
													[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
													SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
													
												End if 
											End if 
										End for 
									End if 
									$_bo_OscFIrstTry:=True:C214
									$_bo_AllocationFirstTry:=True:C214
									For ($_l_FilterTypesIndex; 1; Size of array:C274($_at_MovementTypesFilter))
										$_t_FilterToMovementType:=$_at_MovementTypesFilter{$_l_FilterTypesIndex}
										
										$_l_EditCount:=1
										For ($_l_Passes; 1; 4)
											
											If ($_l_Passes=3) & ($_bo_NoAnyDate)
												$_l_Passes:=4
											End if 
											If ($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry) & ($_l_Passes=4)
												$_bo_SkipIt:=True:C214
											Else 
												$_bo_SkipIt:=False:C215
											End if 
											If (Not:C34($_bo_SkipIt))
												$_bo_LastPassWasZero:=False:C215
												If ($_l_EditCount=0)
													$_bo_LastPassWasZero:=True:C214
												End if 
												$_l_EditCount:=0
												If (Not:C34($_bo_StockItemUncopiedIndexed))
													//DELETE INDEX("StockItemUncopied")
													ARRAY POINTER:C280($_aPtr_Fields; 5)
													$_aPtr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
													$_aPtr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
													$_aPtr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
													$_aPtr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
													$_aPtr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
													CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aPtr_Fields; Standard BTree index:K58:3; "StockItemUncopied")
													$_bo_StockItemUncopiedIndexed:=True:C214
												End if 
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#""; *)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>=0)
												If ($_t_FilterToMovementType#"")
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_t_FilterToMovementType)
												End if 
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
													$_t_TakeFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
													
													STK_l_AnytoCopyFrom:=0
													If ($_l_Passes<4) & ($_t_FilterToMovementType#"PO")  //& (Not(($_t_FilterToMovementType="OSC") & ($_bo_OscFIrstTry)))
														
														
														
														If (Not:C34($_bo_StockItemAnyRemainingIndexe))
															//DELETE INDEX("StockItemsAvailable")
															ARRAY POINTER:C280($_aPtr_Fields; 6)
															$_aPtr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
															$_aPtr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
															$_aPtr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
															$_aPtr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
															$_aPtr_Fields{5}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
															$_aPtr_Fields{6}:=->[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
															CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aPtr_Fields; Standard BTree index:K58:3; "StockItemsAvailable")
															$_bo_StockItemAnyRemainingIndexe:=True:C214
														End if 
														SET QUERY DESTINATION:C396(Into variable:K19:4; STK_l_AnytoCopyFrom)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#""; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_TakeFromStockType; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#$_t_FilterToMovementType)
														SET QUERY DESTINATION:C396(Into current selection:K19:1)
													Else 
														STK_l_AnytoCopyFrom:=1
													End if 
													If (STK_l_AnytoCopyFrom>0)
														ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
														COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
														$_l_RecordsInSelectionMovementIt:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
														<>STK_bo_NotFirstPass:=True:C214
														CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Problems")
														For ($_l_CopiedFromIndex; 1; $_l_RecordsInSelectionMovementIt)
															$_l_StockItemsEditCount:=$_l_StockItemsEditCount+1
															USE NAMED SELECTION:C332("ALL")
															GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CopiedFromIndex)
															//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
															$_l_Retries:=0
															While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																//GOTO XY(0;0)
																//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																$_l_Retries:=$_l_Retries+1
																DelayTicks(60*$_l_Retries)
															End while 
															//CLOSE WINDOW
															If ($_l_ApplicationType=4D Server:K5:6)
																Case of 
																	: ($_l_Passes=1)
																		$_t_PassMessage:=" "+$_t_FilterToMovementType+" (1st pass) "
																		
																	: ($_l_Passes=2)
																		$_t_PassMessage:=" "+$_t_FilterToMovementType+"(2nd pass) "
																		
																	: ($_l_Passes=3)
																		$_t_PassMessage:=" "+$_t_FilterToMovementType+"(3rd pass) "
																		
																	: ($_l_Passes=4)
																		$_t_PassMessage:=" "+$_t_FilterToMovementType+"(4th pass) "
																		
																End case 
																$_t_PassMessage:=$_t_PassMessage+String:C10($_l_EditCount)+" Edits so far"
																GOTO XY:C161(0; 0)
																MESSAGE:C88($_t_TimeRemainingMessage+" Checking Product: "+$_at_ProductCodes{$_l_UpdateProductsCount}+$_t_PassMessage)
																GOTO XY:C161(0; 1)
																MESSAGE:C88("Marking taken from previous movement item "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt))
																
															End if 
															
															If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
																QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
															End if 
															If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
																QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
															End if 
															$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
															$_bo_IsUNAllocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
															$_bo_UseOnlyAllocated:=([MOVEMENT_TYPES:60]Delivery_Type:12) | ([MOVEMENT_TYPES:60]UseAllocatedStock:27)
															$_bo_Edit:=False:C215
															If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
																If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & (([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="") | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32=""))
																	$_bo_Edits:=STK_SetHeaderInfo
																	$_bo_Edits:=$_bo_Edits | $_bo_Edits
																	If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
																		If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
																			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
																		End if 
																		[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
																		[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
																		[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																	End if 
																End if 
																$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
																$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
																If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)) & (Old:C35([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)#"")
																	[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
																	[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																	[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																End if 
																$_bo_Edit:=False:C215
																$_bo_SplitItem:=False:C215
																
																If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
																	$_bo_Continue:=False:C215
																	$_bo_Split:=True:C214
																	$_bo_NoSuperSplit:=True:C214
																	$_bo_PriceMatch:=True:C214
																	$_bo_DateMatch:=True:C214
																	$_bo_CSIDMatch:=True:C214
																	Case of 
																		: ($_l_Passes=1)
																			
																			
																		: ($_l_Passes=2) & ($_bo_LastPassWasZero)
																			$_bo_PriceMatch:=False:C215
																		: ($_l_Passes=3) & ($_bo_LastPassWasZero)
																			$_bo_CSIDMatch:=False:C215
																			$_bo_DateMatch:=True:C214
																			$_bo_PriceMatch:=True:C214
																		: ($_l_Passes=4) & ($_bo_LastPassWasZero)
																			$_bo_Split:=False:C215
																			$_bo_PriceMatch:=True:C214
																			$_bo_DateMatch:=True:C214
																			$_bo_CSIDMatch:=True:C214
																	End case 
																	$_bo_Exit:=False:C215
																	$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
																	$_bo_ShouldbeDateMatch:=False:C215
																	If (Not:C34($_bo_IsSourceStockType))
																		Repeat 
																			Repeat 
																				STK_T_PreviousStockItemAnal:=""
																				STK_T_PreviousStockItemLayer:=""
																				STK_T_PreviousStockItemCurrency:=""
																				STK_l_PreviousStockItemNumber:=0
																				STK_l_PreviousMovementID:=0
																				STK_t_PreviousStockLocation:=""
																				STK_t_PreviousStockSerial:=""
																				STK_R_PreviousCostPrice:=0
																				
																				Case of 
																					: ($_bo_IsUNAllocation) | (($_bo_IsAllocation) & ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
																						$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
																						If ($_l_TakeFromItemID=0)  //
																							STK_l_PreviousItemNumber:=0
																							STK_bo_PreviousItemNumberTested:=False:C215
																							$_l_GetItemProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
																							//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																							$_l_Retries:=0
																							While (Not:C34(STK_bo_PreviousItemNumberTested))
																								//GOTO XY(0;0)
																								//MESSAGE("Waiting for flag "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
																								$_l_Retries:=$_l_Retries+1
																								DelayTicks((3+$_l_Retries)*60)
																							End while 
																							//CLOSE WINDOW
																							SET PROCESS VARIABLE:C370($_l_GetItemProcess; STK_bo_PreviousCAllback; True:C214)
																							$_l_TakeFromItemID:=STK_l_PreviousItemNumber
																							[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_TakeFromItemID
																							$_bo_Edit:=True:C214
																						End if 
																						
																					: ($_bo_IsAllocation)
																						$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
																						
																					Else 
																						$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
																				End case 
																				ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
																				ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
																				ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
																				ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
																				ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
																				ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
																				ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
																				STK_bo_PreviousSet:=False:C215
																				//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																				$_l_Retries:=0
																				$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
																				While (Semaphore:C143("PSC"+$_t_productCode))
																					//GOTO XY(0;0)
																					//MESSAGE("Waiting for Semaphore "+" PSC"+[STOCK ITEMS]Product Code+String($_l_Retries))
																					$_l_Retries:=$_l_Retries+1
																					DelayTicks(2+$_l_Retries)
																				End while 
																				//CLOSE WINDOW
																				<>STOCK_bo_NoSplit:=$_bo_Split
																				If (<>STOCK_bo_NoSplit)
																					$_t_SplitMessage:=" No splitting"
																				Else 
																					$_t_SplitMessage:=" Allow splitting"
																				End if 
																				<>STOCK_bo_NoSuperSplit:=$_bo_NoSuperSplit
																				If (<>STOCK_bo_NoSuperSplit=False:C215)
																					<>STOCK_bo_NoSplit:=False:C215
																				End if 
																				If (<>STOCK_bo_NoSplit)
																					$_t_SplitMessage:=" No splitting"
																				Else 
																					$_t_SplitMessage:=" Allow splitting"
																				End if 
																				If (<>STOCK_bo_NoSuperSplit=False:C215)
																					$_t_SplitMessage:=$_t_SplitMessage+" With part quantity unfound"
																				End if 
																				STK_bo_NoRemaining:=False:C215
																				$_bo_NoExit:=True:C214
																				Repeat 
																					If ($_l_ApplicationType=4D Server:K5:6)
																						GOTO XY:C161(0; 0)
																						MESSAGE:C88($_t_TimeRemainingMessage+" Checking Product: "+$_at_ProductCodes{$_l_UpdateProductsCount}+$_t_PassMessage)
																						GOTO XY:C161(0; 1)
																						MESSAGE:C88("Marking taken from previous movement item on item "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt))
																					End if 
																					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0)
																						$_bo_CSIDMatch:=False:C215
																					End if 
																					Case of 
																						: ($_bo_PriceMatch)  //is date match or CSID Match on
																							$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
																							
																							Case of 
																								: ($_bo_DateMatch)
																									$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
																									If ($_bo_CSIDMatch)
																										If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																											$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																										Else 
																											$_l_TakeFromCSID:=$_l_ZeroLongint
																										End if 
																										
																										If ($_l_ApplicationType=4D Server:K5:6)
																											GOTO XY:C161(0; 2)
																											MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":-    Price Match"+",    Date Match"+",    Current stock take from Match "+$_t_SplitMessage)
																										End if 
																									Else 
																										$_l_TakeFromCSID:=$_l_ZeroLongint
																										If ($_l_ApplicationType=4D Server:K5:6)
																											GOTO XY:C161(0; 2)
																											MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":-    Price Match"+",    Date Match"+", NO Current stock take from Match "+$_t_SplitMessage)
																											
																										End if 
																									End if 
																								Else 
																									$_d_HeaderDate:=!00-00-00!
																									If ($_bo_CSIDMatch)
																										If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																											$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																										Else 
																											$_l_TakeFromCSID:=$_l_ZeroLongint
																										End if 
																										
																										If ($_l_ApplicationType=4D Server:K5:6)
																											GOTO XY:C161(0; 2)
																											MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":-    Price Match"+", NO Date Match"+",    Current stock take from Match "+$_t_SplitMessage)
																										End if 
																									Else 
																										$_l_TakeFromCSID:=$_l_ZeroLongint
																										If ($_l_ApplicationType=4D Server:K5:6)
																											GOTO XY:C161(0; 2)
																											
																											MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":-    Price Match"+", NO Date Match"+", NO Current stock take from Match "+$_t_SplitMessage)
																										End if 
																									End if 
																							End case 
																						: ($_bo_DateMatch)  //price match is off is CS ID match on
																							$_r_CostPrice:=$_r_ZeroReal
																							$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
																							If ($_bo_CSIDMatch)
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																									$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																								Else 
																									$_l_TakeFromCSID:=$_l_ZeroLongint
																								End if 
																								
																								If ($_l_ApplicationType=4D Server:K5:6)
																									GOTO XY:C161(0; 2)
																									MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":- NO Price Match"+",    Date Match"+",    Current stock take from Match "+$_t_SplitMessage)
																								End if 
																							Else 
																								$_l_TakeFromCSID:=$_l_ZeroLongint
																								If ($_l_ApplicationType=4D Server:K5:6)
																									GOTO XY:C161(0; 2)
																									
																									MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":- NO Price Match"+",    Date Match"+", NO Current stock take from Match "+$_t_SplitMessage)
																								End if 
																							End if 
																						: ($_bo_CSIDMatch)  //Price match and  Date match are off
																							$_r_CostPrice:=$_r_ZeroReal
																							$_d_HeaderDate:=!00-00-00!
																							If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																								$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																							Else 
																								$_l_TakeFromCSID:=$_l_ZeroLongint
																							End if 
																							
																							If ($_l_ApplicationType=4D Server:K5:6)
																								GOTO XY:C161(0; 2)
																								
																								MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":-    Price Match"+",    Date Match"+",    Current stock take from Match "+$_t_SplitMessage)
																							End if 
																							
																						Else 
																							$_r_CostPrice:=$_r_ZeroReal
																							$_d_HeaderDate:=!00-00-00!
																							$_l_TakeFromCSID:=$_l_ZeroLongint
																							If ($_l_ApplicationType=4D Server:K5:6)
																								GOTO XY:C161(0; 0)
																								MESSAGE:C88($_t_TimeRemainingMessage+" Checking Product: "+$_at_ProductCodes{$_l_UpdateProductsCount}+$_t_PassMessage)
																								GOTO XY:C161(0; 1)
																								MESSAGE:C88("Marking taken from previous movement item "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt))
																								
																								GOTO XY:C161(0; 2)
																								MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+":- NO Price Match"+", NO Date Match"+", NO Current stock take from Match "+$_t_SplitMessage)
																							End if 
																							
																					End case 
																					If ($_l_ApplicationType=4D Server:K5:6)
																						GOTO XY:C161(0; 3)
																						If ($_r_CostPrice=0)
																							$_t_CostPriceString:="Any cost price"
																						Else 
																							$_t_CostPriceString:=String:C10($_r_CostPrice)
																						End if 
																						$_t_CostPriceString:=$_t_CostPriceString+(" "*(14-Length:C16($_t_CostPriceString)))
																						If ($_d_HeaderDate#!00-00-00!)
																							$_t_HeaderDateString:=String:C10($_d_HeaderDate; Internal date long:K1:5)
																						Else 
																							$_t_HeaderDateString:="Any date"
																						End if 
																						$_t_HeaderDateString:=$_t_HeaderDateString+(" "*(14-Length:C16($_t_HeaderDateString)))
																						If ($_l_TakeFromCSID#0)
																							$_t_CurrentString:="Added to current stock ID"+String:C10($_l_TakeFromCSID)
																							
																						Else 
																							$_t_CurrentString:="Any current stock ID"
																						End if 
																						
																						MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" "+[STOCK_MOVEMENTS:40]Movement_Type:6+" "+"Take from Stock type "+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+" Quantity "+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+" Cost Price "+$_t_CostPriceString+" Before Date "+$_t_HeaderDateString+" "+$_t_CurrentString)
																					End if 
																					
																					
																					
																					
																					//````
																					//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																					$_l_Retries:=0
																					While (Test semaphore:C652("GetPrevious"))
																						//GOTO XY(0;0)
																						//MESSAGE("Waiting for Semaphore "+" GetPrevious"+String($_l_Retries))
																						$_l_Retries:=$_l_Retries+1
																						DelayTicks(2+$_l_Retries)
																					End while 
																					//CLOSE WINDOW
																					
																					STK_l_Remaining:=1
																					If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry))
																						$_t_StockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
																						If ($_t_StockType="P")
																							If (Not:C34(STK_bo_CheckStockItemFreeIndex))
																								ARRAY POINTER:C280($_aPtr_Fields; 4)
																								$_aPtr_Fields{1}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
																								$_aPtr_Fields{2}:=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
																								$_aPtr_Fields{3}:=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
																								$_aPtr_Fields{4}:=->[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
																								
																								CREATE INDEX:C966([STOCK_MOVEMENT_ITEMS:27]; $_aPtr_Fields; Standard BTree index:K58:3; "StockitemFree")
																								STK_bo_CheckStockItemFreeIndex:=True:C214
																							End if 
																							SET QUERY DESTINATION:C396(Into variable:K19:4; STK_l_Remaining)
																							$_t_StockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
																							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_StockType; *)
																							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
																							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
																							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"UNA"; *)
																							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"ALO")
																							SET QUERY DESTINATION:C396(Into current selection:K19:1)
																						End if 
																					End if 
																					If (STK_l_Remaining>0)
																						If (<>STK_l_PreviousProcess=0)
																							<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 512000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_l_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_d_HeaderDate; $_r_CostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUNAllocation; $_l_TakeFromItemID; $_bo_UseOnlyAllocated; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; *)
																							DelayTicks(3*60)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
																						Else 
																							//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																							$_l_Retries:=0
																							While (Semaphore:C143("STK_GetPrevious"))
																								//GOTO XY(0;0)
																								//MESSAGE("Waiting for Semaphore "+"STK_GetPrevious"+String($_l_Retries))
																								$_l_Retries:=$_l_Retries+1
																								DelayTicks(10+$_l_Retries)
																							End while 
																							$_l_Retries:=0
																							While (Test semaphore:C652("GetPrevious"))
																								//GOTO XY(0;0)
																								//MESSAGE("Waiting for Semaphore "+"GetPrevious"+String($_l_Retries))
																								$_l_Retries:=$_l_Retries+1
																								
																								DelayTicks(10+$_l_Retries)
																							End while 
																							//CLOSE WINDOW
																							
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_TakeFromCSID)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUNAllocation)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyAllocated)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
																							RESUME PROCESS:C320(<>STK_l_PreviousProcess)
																							DelayTicks(30*60)
																							SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
																							CLEAR SEMAPHORE:C144("STK_GetPrevious")
																							//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																							$_l_Retries:=0
																							While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
																								//GOTO XY(0;0)
																								//MESSAGE("Waiting for Semaphore "+"STK_GetPrevious"+String($_l_Retries))
																								$_l_Retries:=$_l_Retries+1
																								SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
																								DelayTicks(30)
																							End while 
																							//CLOSE WINDOW
																							
																						End if 
																						$_bo_NoExit:=False:C215
																						$_l_RetriesCount:=0
																						//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																						$_l_Retries:=0
																						While (STK_bo_PreviousSet=False:C215) & ($_l_RetriesCount<100)
																							//GOTO XY(0;0)
																							//MESSAGE("Waiting for Semaphore "+"STK_GetPrevious"+String($_l_Retries))
																							$_l_Retries:=$_l_Retries+1
																							DelayTicks(3+$_l_Retries)
																							$_l_RetriesCount:=$_l_RetriesCount+1
																						End while 
																						//CLOSE WINDOW
																					Else 
																						$_bo_NoExit:=False:C215
																						STK_bo_PreviousSet:=True:C214
																						STK_bo_NoRemaining:=True:C214
																					End if 
																				Until (STK_bo_PreviousSet)
																				
																				CLEAR SEMAPHORE:C144("PSC"+$_t_productCode)
																				<>STOCK_bo_NoSplit:=False:C215
																				If ($_bo_NoExit=False:C215)
																					$_bo_Continue:=True:C214
																				End if 
																				If ($_bo_ShouldbeDateMatch)
																					$_bo_DateMatch:=False:C215
																					$_bo_ShouldbeDateMatch:=False:C215
																				End if 
																				
																				If (STK_l_PreviousMovementID=0)
																					Case of 
																						: ($_bo_PriceMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0) & (STK_bo_NoRemaining=False:C215)
																							If ($_l_Passes>1)
																								$_bo_PriceMatch:=False:C215
																							Else 
																								$_bo_PriceMatch:=True:C214
																								$_bo_Exit:=True:C214
																							End if 
																						: ($_bo_DateMatch) & (Not:C34($_bo_NoAnyDate)) & (Size of array:C274(STK_al_PreviousMovementIDS)=0) & (STK_bo_NoRemaining=False:C215)
																							If ($_l_Passes>2)
																								If (Not:C34($_bo_NoAnyDate))
																									$_bo_DateMatch:=False:C215
																								Else 
																									$_bo_ShouldbeDateMatch:=True:C214
																								End if 
																								$_bo_PriceMatch:=True:C214
																							Else 
																								$_bo_Exit:=True:C214  //2nd pass-data match break out
																							End if 
																						: ($_bo_CSIDMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0) & (STK_bo_NoRemaining=False:C215)
																							If ($_l_Passes>2)
																								$_bo_CSIDMatch:=False:C215
																								$_bo_DateMatch:=True:C214
																								$_bo_PriceMatch:=True:C214
																							Else 
																								$_bo_Exit:=True:C214  //2nd pass-data match break out
																							End if 
																							
																						: ($_bo_Split=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0) & (STK_bo_NoRemaining=False:C215)
																							If ($_l_Passes>3)
																								//If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry)) | (($_bo_OscFIrstTry) & ($_t_FilterToMovementType="OSC"))
																								//dont try to split these
																								//$_bo_Exit:=True  `2nd pass-data match break out
																								//Else
																								$_bo_Split:=False:C215
																								$_bo_PriceMatch:=True:C214
																								$_bo_DateMatch:=True:C214
																								$_bo_CSIDMatch:=True:C214
																								//End if
																							Else 
																								$_bo_Exit:=True:C214  //2nd pass-data match break out
																							End if 
																						: ($_bo_NoSuperSplit) & (Size of array:C274(STK_al_PreviousMovementIDS)=0) & (STK_bo_NoRemaining=False:C215)
																							If ($_l_Passes>3)
																								//If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry)) | (($_bo_OscFIrstTry) & ($_t_FilterToMovementType="OSC"))
																								//actually this should never get here... but dont try super split on these`
																								//Exit:=True  `2nd pass-data match break out
																								//Else
																								$_bo_NoSuperSplit:=False:C215
																								$_bo_Split:=False:C215
																								$_bo_PriceMatch:=True:C214
																								$_bo_DateMatch:=True:C214
																								$_bo_CSIDMatch:=True:C214
																								//End if
																							Else 
																								$_bo_Exit:=True:C214
																							End if 
																						Else 
																							//all are false and we tried spliting
																							
																							If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																								
																								$_bo_Exit:=True:C214
																							Else 
																								$_bo_Exit:=True:C214
																							End if 
																							
																					End case 
																					If ($_bo_NoAnyDate)
																						$_bo_DateMatch:=True:C214
																					End if 
																					
																				Else 
																					If (STK_l_PreviousMovementID=-9999)
																						//TRACE
																						STK_l_PreviousMovementID:=0
																					Else 
																						$_l_EditCount:=$_l_EditCount+1
																					End if 
																					
																					$_bo_Exit:=True:C214
																				End if 
																			Until ($_bo_Continue)
																			
																		Until ($_bo_Exit)
																		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#STK_l_PreviousMovementID)
																			$_bo_Edit:=True:C214
																		End if 
																		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_PreviousMovementID
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#STK_l_PreviousStockItemNumber)
																			$_bo_Edit:=True:C214
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#STK_l_PreviousStockItemNumber)
																			$_bo_Edit:=True:C214
																		End if 
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																			//
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#STK_t_PreviousStockLocation)
																			$_bo_Edit:=True:C214
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#STK_T_PreviousStockItemAnal) & (STK_T_PreviousStockItemAnal#"") & (STK_T_PreviousStockItemAnal#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
																			$_bo_Edit:=True:C214
																			[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=STK_T_PreviousStockItemAnal
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#STK_T_PreviousStockItemLayer) & (STK_T_PreviousStockItemLayer#"") & (STK_T_PreviousStockItemLayer#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
																			$_bo_Edit:=True:C214
																			[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=STK_T_PreviousStockItemLayer
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#STK_T_PreviousStockItemCurrency) & (STK_T_PreviousStockItemCurrency#"") & (STK_T_PreviousStockItemCurrency#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																			$_bo_Edit:=True:C214
																			[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=STK_T_PreviousStockItemCurrency
																		End if 
																		[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=STK_t_PreviousStockLocation
																		If ([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33#(STK_t_PreviousStockSerial#""))
																			
																			$_bo_Edit:=True:C214
																		End if 
																		[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=(STK_t_PreviousStockSerial#"")
																		If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
																			If (STK_R_PreviousCostPrice#0)
																				$_bo_Edit:=True:C214
																			End if 
																			[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=STK_R_PreviousCostPrice
																		Else 
																			If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#STK_R_PreviousCostPrice)
																				$_bo_Edit:=True:C214
																				[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=STK_R_PreviousCostPrice
																			End if 
																		End if 
																		
																		ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
																		ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
																		ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
																		ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
																		ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
																		ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
																		ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
																		COPY ARRAY:C226(STK_al_PreviousMovementIDS; $_al_PreviousMovementIDS)
																		COPY ARRAY:C226(STK_ar_PreviousMovementQTY; $_ar_PreviousMovementQTY)
																		COPY ARRAY:C226(STK_al_PreviousMovementCSID; $_al_PreviousMovementCSID)
																		
																		COPY ARRAY:C226(STK_at_PreviousMovementLocation; $_at_PreviousMovementLocation)
																		COPY ARRAY:C226(STK_at_PreviousMovementCurrency; $_at_PreviousMovementCurrency)
																		COPY ARRAY:C226(STK_at_PreviousMovementAnalysis; $_at_PreviousMovementAnalysis)
																		COPY ARRAY:C226(STK_at_PreviousMovementLayer; $_at_PreviousMovementLayer)
																		
																		$_bo_SplitChildren:=False:C215
																		$_l_SplitChildrenOF:=0
																		$_r_OriginalQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																		If (Size of array:C274(STK_al_PreviousMovementIDS)>0)
																			$_l_EditCount:=$_l_EditCount+1
																			
																			$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
																			
																			SET QUERY DESTINATION:C396(Into variable:K19:4; STK_l_SomeCalledOff)
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_PreferenceID)
																			SET QUERY DESTINATION:C396(Into current selection:K19:1)
																			If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0) | (STK_l_SomeCalledOff>0)
																				$_bo_SplitChildren:=True:C214
																				$_l_SplitChildrenOF:=([STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																				APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																				APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; $_ar_PreviousMovementQTY{1})
																				APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; $_al_PreviousMovementCSID{1})
																			End if 
																			
																			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{1}
																			[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{1}
																			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{1}
																			
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																			//```````````````
																			If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{1}) & ($_at_PreviousMovementLocation{1}#"") & ($_at_PreviousMovementLocation{1}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
																				[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{1}
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{1}) & ($_at_PreviousMovementAnalysis{1}#"") & ($_at_PreviousMovementAnalysis{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
																				[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{1}
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{1}) & ($_at_PreviousMovementLayer{1}#"") & ($_at_PreviousMovementLayer{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
																				$_bo_Edit:=True:C214
																				[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{1}
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{1}) & ($_at_PreviousMovementCurrency{1}#"") & ($_at_PreviousMovementCurrency{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																				$_bo_Edit:=True:C214
																				[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{1}
																			End if 
																			//``````````````
																			//this item needs to be split
																			$_bo_SplitItem:=True:C214
																			$_bo_Edit:=True:C214
																			$_r_QuantityStillRequired:=$_r_OriginalQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																			$_bo_SplitItem:=True:C214
																			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#0) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
																				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																				If ([CURRENT_STOCK:62]Item_Number:5#[STOCK_MOVEMENT_ITEMS:27]Item_Number:8) & ([CURRENT_STOCK:62]Item_Number:5#0)
																					//
																				End if 
																			End if 
																		End if 
																	End if 
																	
																End if 
																If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=0) & ($_l_Passes>3)
																	If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry)) | (($_bo_OscFIrstTry) & ($_t_FilterToMovementType="OSC"))
																		
																		//do not mark this as not found..we will come back when the unaloocations are done and may find it then
																	Else 
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
																			$_l_EditCount:=$_l_EditCount+1
																			$_r_Cost:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
																			$_t_Serial:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
																			$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
																			$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
																			$_t_LocationisOnPrevious:=""
																			If ($_bo_IsUNAllocation) | (($_bo_IsAllocation) & ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
																				$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
																				If ($_l_ItemNumber=0)
																					
																					STK_l_PreviousItemNumber:=0
																					STK_bo_PreviousItemNumberTested:=False:C215
																					$_l_GetItemProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
																					//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																					$_l_Retries:=0
																					While (Not:C34(STK_bo_PreviousItemNumberTested))
																						//GOTO XY(0;0)
																						//MESSAGE("Waiting for Semaphore "+"STK_GetPrevious"+String($_l_Retries))
																						$_l_Retries:=$_l_Retries+1
																						DelayTicks(($_l_Retries+3)*60)
																					End while 
																					//CLOSE WINDOW
																					SET PROCESS VARIABLE:C370($_l_GetItemProcess; STK_bo_PreviousCAllback; True:C214)
																					$_l_ItemNumber:=STK_l_PreviousItemNumber
																					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_ItemNumber
																					$_bo_Edit:=True:C214
																				End if 
																				
																			Else 
																				$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
																				$_r_Cost:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#"")
																				$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#"")
																				$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
																				$_t_LocationisOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
																			End if 
																			If (Not:C34([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33))
																				$_t_Serial:=""
																			End if 
																			COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
																			$_l_SelectedCSRecord:=Selected record number:C246([CURRENT_STOCK:62])
																			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_GetTakeFromCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_t_CurrencyCode; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_r_Cost; $_l_ItemNumber; $_t_Location; $_t_Serial; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; [STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33; $_t_LocationisOnPrevious)
																			$_bo_Edit:=True:C214
																			USE NAMED SELECTION:C332("$TempCS")
																			GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedCSRecord)
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																			$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
																			If (Not:C34($_bo_IsSourceStockType))
																				$_t_SMMovementTypeCode:=[MOVEMENT_TYPES:60]Type_Code:1
																				$_t_StockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
																				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_StockType)
																				If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
																					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=-(Abs:C99([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))
																					$_bo_Edit:=True:C214
																				End if 
																				If ($_t_SMMovementTypeCode#"")
																					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_SMMovementTypeCode)
																				End if 
																			End if 
																		End if 
																	End if 
																Else 
																	If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#"")
																		$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
																		If ($_bo_IsSourceStockType)
																			$_l_EditCount:=$_l_EditCount+1
																			$_r_Cost:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
																			$_t_Serial:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
																			$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
																			$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
																			$_t_LocationisOnPrevious:=""
																			If ($_bo_IsUNAllocation) | (($_bo_IsAllocation) & ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
																				$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
																				If ($_l_ItemNumber=0)
																					
																					STK_l_PreviousItemNumber:=0
																					STK_bo_PreviousItemNumberTested:=False:C215
																					$_l_GetItemProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
																					//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																					$_l_Retries:=0
																					While (Not:C34(STK_bo_PreviousItemNumberTested))
																						//GOTO XY(0;0)
																						//MESSAGE("Waiting for flag "+"STK_bo_PreviousItemNumberTested"+String($_l_Retries))
																						$_l_Retries:=$_l_Retries+1
																						DelayTicks(($_l_Retries+3)*60)
																					End while 
																					//CLOSE WINDOW
																					SET PROCESS VARIABLE:C370($_l_GetItemProcess; STK_bo_PreviousCAllback; True:C214)
																					$_l_ItemNumber:=STK_l_PreviousItemNumber
																					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_ItemNumber
																					$_bo_Edit:=True:C214
																				End if 
																				
																			Else 
																				$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
																				$_r_Cost:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#"")
																				$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#"")
																				$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
																				$_t_LocationisOnPrevious:=[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34
																			End if 
																			If (Not:C34([STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33))
																				$_t_Serial:=""
																			End if 
																			COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
																			$_l_SelectedCSRecord:=Selected record number:C246([CURRENT_STOCK:62])
																			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_GetTakeFromCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_t_CurrencyCode; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_r_Cost; $_l_ItemNumber; $_t_Location; $_t_Serial; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; [STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33; $_t_LocationisOnPrevious)
																			$_bo_Edit:=True:C214
																			USE NAMED SELECTION:C332("$TempCS")
																			GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedCSRecord)
																			//because this is source type..this will save a bit of time
																		End if 
																	End if 
																	
																	
																	
																End if 
																If ($_bo_Edit)
																	If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#0) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
																		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																		If ([CURRENT_STOCK:62]Item_Number:5#[STOCK_MOVEMENT_ITEMS:27]Item_Number:8) & ([CURRENT_STOCK:62]Item_Number:5#0)
																			//
																		End if 
																	End if 
																	SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																	If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
																		$_l_SMICurrentRecord:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
																		$_l_SMICurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
																		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SIA")
																		$_l_SMICopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
																		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICopiedFromID)
																		$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SMICopiedFromID)
																		
																		//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																		$_l_Retries:=0
																		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																			//GOTO XY(0;0)
																			//MESSAGE("Waiting for record unlocked stock items"+String($_l_Retries))
																			$_l_Retries:=$_l_Retries+1
																			DelayTicks(60*$_l_Retries)
																		End while 
																		//CLOSE WINDOW
																		//TRACE
																		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																		If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																			
																		End if 
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		//DB_SaveRecord (->[STOCK ITEMS])
																		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
																		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICurrentID)
																		$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																		USE NAMED SELECTION:C332("$SIA")
																		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMICurrentRecord)
																		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																		If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																			
																		End if 
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		
																	End if 
																	
																	
																End if 
																
																If ($_bo_SplitItem)
																	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
																	$_l_SMISelectedRecord2:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
																	
																	SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																	$_l_CurrentMovementItemRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																	For ($_l_Indexy; 2; Size of array:C274($_ar_PreviousMovementQTY))
																		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
																		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{$_l_Indexy}
																		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{$_l_Indexy}
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{$_l_Indexy}
																		If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{$_l_Indexy}) & ($_at_PreviousMovementLocation{$_l_Indexy}#"") & ($_at_PreviousMovementLocation{$_l_Indexy}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
																			[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{$_l_Indexy}
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{$_l_Indexy}) & ($_at_PreviousMovementAnalysis{$_l_Indexy}#"") & ($_at_PreviousMovementAnalysis{$_l_Indexy}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
																			[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{$_l_Indexy}
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{$_l_Indexy}) & ($_at_PreviousMovementLayer{$_l_Indexy}#"") & ($_at_PreviousMovementLayer{$_l_Indexy}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
																			
																			[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{$_l_Indexy}
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{$_l_Indexy}) & ($_at_PreviousMovementCurrency{$_l_Indexy}#"") & ($_at_PreviousMovementCurrency{$_l_Indexy}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
																			
																			[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{$_l_Indexy}
																		End if 
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		If ($_bo_SplitChildren)
																			//TRACE
																			APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																			APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; $_ar_PreviousMovementQTY{$_l_Indexy})
																			APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; $_al_PreviousMovementCSID{$_l_Indexy})
																		End if 
																		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																		DB_bo_IgnoreProductStatus:=True:C214
																		If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry)) | (($_bo_OscFIrstTry) & ($_t_FilterToMovementType="OSC"))
																		Else 
																			
																			DB_PseudoTrigger(Record number:C243([STOCK_MOVEMENT_ITEMS:27]); Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
																		End if 
																		DB_bo_IgnoreProductStatus:=False:C215
																		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
																		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
																			$_l_SMICurrentRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																			$_l_SMICurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
																			//COPY NAMED SELECTION([STOCK ITEMS];"$SIA")
																			$_l_SMICopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICopiedFromID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SMICopiedFromID)
																			//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																			$_l_Retries:=0
																			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																				//GOTO XY(0;0)
																				//MESSAGE("Waiting for record unlocked stock items"+String($_l_Retries))
																				$_l_Retries:=$_l_Retries+1
																				DelayTicks(60*$_l_Retries)
																			End while 
																			//CLOSE WINDOW
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																				//TRACE
																			End if 
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			//DB_SaveRecord (->[STOCK ITEMS])
																			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICurrentID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			//USE NAMED SELECTION("$SIA")
																			GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_SMICurrentRecord)
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			
																		End if 
																		
																	End for 
																	If ($_r_QuantityStillRequired>0)
																		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																		DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
																		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityStillRequired
																		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
																		$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																		DB_bo_IgnoreProductStatus:=True:C214
																		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																		If ($_bo_SplitChildren)
																			//TRACE
																			APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																			APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																		End if 
																		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																		If (($_t_FilterToMovementType="ALO") & ($_bo_AllocationFirstTry)) | (($_bo_OscFIrstTry) & ($_t_FilterToMovementType="OSC"))
																		Else 
																			DB_PseudoTrigger(Record number:C243([STOCK_MOVEMENT_ITEMS:27]); Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
																		End if 
																		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordNumber)
																		DB_bo_IgnoreProductStatus:=False:C215
																		
																		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
																			$_l_SMICurrentRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																			$_l_SMICurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
																			//COPY NAMED SELECTION([STOCK ITEMS];"$SIA")
																			$_l_SMICopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICopiedFromID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SMICopiedFromID)
																			//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																			$_l_Retries:=0
																			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																				//GOTO XY(0;0)
																				//MESSAGE("Waiting for record unlocked stock items"+String($_l_Retries))
																				$_l_Retries:=$_l_Retries+1
																				DelayTicks(60*$_l_Retries)
																			End while 
																			//CLOSE WINDOW
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																				
																			End if 
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			//DB_SaveRecord (->[STOCK ITEMS])
																			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICurrentID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			//USE NAMED SELECTION("$SIA")
																			GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_SMICurrentRecord)
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																				
																			End if 
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			
																		End if 
																		
																		
																	End if 
																	If ($_bo_SplitChildren)
																		
																		STK_SplitChildren($_l_SplitChildrenOF; ->$_ar_SplitChildrenQuantity; ->$_al_SplitChildrenParentID; ->$_al_SplitChildrenFromCSID)
																		USE NAMED SELECTION:C332("$CS")
																		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMISelectedRecord2)
																		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
																			$_l_SMICurrentRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
																			$_l_SMICurrentID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
																			//COPY NAMED SELECTION([STOCK ITEMS];"$SIA")
																			$_l_SMICopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICopiedFromID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SMICopiedFromID)
																			
																			//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
																			$_l_Retries:=0
																			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
																				//GOTO XY(0;0)
																				//MESSAGE("Waiting for Record unlock Stock items"+String($_l_Retries))
																				$_l_Retries:=$_l_Retries+1
																				
																				DelayTicks(60*$_l_Retries)
																			End while 
																			//CLOSE WINDOW
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																				//TRACE
																			End if 
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			//DB_SaveRecord (->[STOCK ITEMS])
																			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
																			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SMICurrentID)
																			$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																			//USE NAMED SELECTION("$SIA")
																			GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_SMICurrentRecord)
																			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
																			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
																			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
																				//TRACE
																			End if 
																			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
																			
																		End if 
																		
																	End if 
																	USE NAMED SELECTION:C332("$CS")
																	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMISelectedRecord2)
																	
																End if 
																
															End if 
															If (STK_bo_NoRemaining) & ($_l_Passes<4)
																$_l_CopiedFromIndex:=$_l_RecordsInSelectionMovementIt
															End if 
															STK_bo_NoRemaining:=False:C215
														End for 
													Else 
														//There will be non found to copy from so wast of time looking
														$_l_Passes:=3
														If ($_bo_AllocationFirstTry) | ($_bo_OscFIrstTry)
															$_l_Passes:=4
														End if 
													End if 
												End if 
												
												
											End if 
											
										End for 
										If ($_t_FilterToMovementType="ALO")
											$_bo_AllocationFirstTry:=False:C215
										End if 
										If ($_t_FilterToMovementType="OSC")
											$_bo_OscFIrstTry:=False:C215
										End if 
									End for 
									
									
									<>STK_bo_NotFirstPass:=False:C215
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>=0)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ALLForProd")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="OSC")
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ALLOSC")
									DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_StockItemNumbers)
									For ($_l_ItemNumbersIndex; 1; Size of array:C274($_al_StockItemNumbers))
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
										$_r_OIQuantity:=[ORDER_ITEMS:25]Quantity:3
										USE SET:C118("ALLOSC")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
										$_r_SIQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										If ($_r_OIQuantity>$_r_SIQuantity)
											$_r_SIQuantity:=$_r_OIQuantity
										End if 
										//this is the max quantiy that can be ISOd or POd for this item.
										USE SET:C118("$ALLForProd")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ISO"; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
											$_r_ISOQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
											If ($_r_ISOQuantity>$_r_SIQuantity)
												//there are too many isod.
												CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ISODforprod")
												$_r_OverQuantity:=$_r_ISOQuantity-$_r_SIQuantity
												QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_OverQuantity)
												If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
													//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
													$_l_Retries:=0
													While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
														//GOTO XY(0;0)
														//MESSAGE("Waiting for record unlocked stock items"+String($_l_Retries))
														$_l_Retries:=$_l_Retries+1
														DelayTicks(60*$_l_Retries)
													End while 
													//CLOSE WINDOW
													CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$set2")
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40=$_r_OverQuantity)
													If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
														
														USE SET:C118("$Set2")
														QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>=0)
														[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_OverQuantity
														[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
														[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
														$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
														
														DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
													Else 
														$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
													End if 
													[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
													[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_OverQuantity
													[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
													[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
													[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
													[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
													
													If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
														STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
													End if 
													If ($_l_PreferenceID#0)
														STK_UpdateCalledOffQuantity
													Else 
														//
													End if 
												Else 
													//TRACE
												End if 
											End if 
										End if 
										
									End for 
									USE SET:C118("$ALLForProd")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ALLALO")
									DIFFERENCE:C122("ALLALO"; "ALLOSC"; "ALLOLO")  // so we only get the ones with no osc
									DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_StockItemNumbers)
									
									For ($_l_ItemNumbersIndex; 1; Size of array:C274($_al_StockItemNumbers))
										If ($_al_StockItemNumbers{$_l_ItemNumbersIndex}#0)
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
											$_r_OIQuantity:=[ORDER_ITEMS:25]Quantity:3
											USE SET:C118("ALLALO")
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
											$_r_SIQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
											If ($_r_OIQuantity>$_r_SIQuantity)
												$_r_SIQuantity:=$_r_OIQuantity
											End if 
											//this is the max quantiy that can be ISOd or POd for this item.
											USE SET:C118("$ALLForProd")
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ISO"; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_StockItemNumbers{$_l_ItemNumbersIndex})
											If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
												$_r_ISOQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
												If ($_r_ISOQuantity>$_r_SIQuantity)
													//there are too many isod.
													CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ISODforprod")
													$_r_OverQuantity:=$_r_ISOQuantity-$_r_SIQuantity
													QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_OverQuantity)
													If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
														//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
														$_l_Retries:=0
														While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
															//GOTO XY(0;0)
															//MESSAGE("Waiting for record unlocked stock items"+String($_l_Retries))
															$_l_Retries:=$_l_Retries+1
															DelayTicks(60*$_l_Retries)
														End while 
														//CLOSE WINDOW
														CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$set2")
														QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_OverQuantity)
														If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
															USE SET:C118("$Set2")
															QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>=0)
															[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_OverQuantity
															[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															
															DUPLICATE RECORD:C225([STOCK_MOVEMENT_ITEMS:27])
														Else 
															$_l_PreferenceID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
														End if 
														[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
														[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
														[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_OverQuantity
														[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
														[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
														[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
														[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
														[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
														
														If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
															STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
														End if 
														If ($_l_PreferenceID#0)
															STK_UpdateCalledOffQuantity
														Else 
															
														End if 
														
													Else 
														
													End if 
												End if 
											End if 
										End if 
									End for 
									
									READ WRITE:C146([PRODUCTS:9])
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									If ($_l_ApplicationType=4D Server:K5:6)
										GOTO XY:C161(0; 0)
										MESSAGE:C88("Setting product "+[PRODUCTS:9]Product_Code:1+" to new stock setup")
									End if 
									//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
									$_l_Retries:=0
									While (Not:C34(Check_Locked(->[PRODUCTS:9]))) & (Not:C34(<>SYS_bo_QuitCalled))
										//GOTO XY(0;0)
										//MESSAGE("Waiting for record unlocked products"+String($_l_Retries))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(60*$_l_Retries)
									End while 
									//CLOSE WINDOW
									[PRODUCTS:9]x_Product_Stock_is_Setup:59:=True:C214
									SAVE RECORD:C53([PRODUCTS:9])
									If ($_l_ApplicationType=4D Server:K5:6)
										GOTO XY:C161(0; 1)
										MESSAGE:C88("Setting called off quantity on all stock items for product "+[PRODUCTS:9]Product_Code:1)
									End if 
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
									
									MESSAGES OFF:C175
									<>TellMe:=True:C214
									APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
									<>TellMe:=False:C215
									MESSAGES ON:C181
								End if 
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
								$_bo_ContinuePastHere:=True:C214
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									$_bo_ContinuePastHere:=False:C215
									STK_ClearDownSetup($_at_ProductCodes{$_l_UpdateProductsCount})
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[CURRENT_STOCK:62])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_LEVELS:58])
								
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
							Until ($_bo_ContinuePastHere)
							If (Not:C34(<>SYS_bo_QuitCalled))
								If ($_l_ApplicationType=4D Server:K5:6)
									GOTO XY:C161(0; 2)
									MESSAGE:C88("Updating current stock and stock levels for product "+[PRODUCTS:9]Product_Code:1)
								End if 
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								READ WRITE:C146([STOCK_LEVELS:58])
								COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "ALLCS")
								$_l_RecordsInSelectionMovementIt:=Records in selection:C76([CURRENT_STOCK:62])
								If ($_l_StockItemsEditCount=0)
									$_l_RecordsInSelectionMovementIt:=0
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[CURRENT_STOCK:62])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_LEVELS:58])
								
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=-1
								End if 
								For ($_l_CopiedFromIndex; 1; $_l_RecordsInSelectionMovementIt)
									
									USE NAMED SELECTION:C332("ALLCS")
									GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CopiedFromIndex)
									If ($_l_ApplicationType=4D Server:K5:6)
										GOTO XY:C161(0; 3)
										MESSAGE:C88("Current stock  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+" "+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" "+String:C10([CURRENT_STOCK:62]Quantity:4))
										
									End if 
									
									//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
									$_l_Retries:=0
									While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]))) & (Not:C34(<>SYS_bo_QuitCalled))
										//GOTO XY(0;0)
										//MESSAGE("Waiting for record unlocked current stock"+String($_l_Retries))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(60*$_l_Retries)
									End while 
									//CLOSE WINDOW
									$_l_PreferenceID:=[CURRENT_STOCK:62]X_ID:13
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_PreferenceID)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
									$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_PreferenceID)
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
									
									$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
									$_r_Net:=$_r_Sum-$_r_Sum2
									If ($_r_Net#[CURRENT_STOCK:62]Quantity:4)
										If ([CURRENT_STOCK:62]Quantity:4=0)
											MESSAGE:C88("Current sto1")
											[CURRENT_STOCK:62]Quantity:4:=$_r_Net
											[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
											If ($_l_ApplicationType=4D Server:K5:6)
												GOTO XY:C161(0; 4)
												MESSAGE:C88("Current stock(Set to)  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+" "+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" Quantity="+String:C10([CURRENT_STOCK:62]Quantity:4))
											End if 
											MESSAGE:C88("Current sto3")
											SAVE RECORD:C53([CURRENT_STOCK:62])
											
											
										Else 
											MESSAGE:C88("Current sto2")
											[CURRENT_STOCK:62]Quantity:4:=$_r_Net
											[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
											If ($_l_ApplicationType=4D Server:K5:6)
												GOTO XY:C161(0; 4)
												MESSAGE:C88("Current stock(change to)  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+" "+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" Quantity= "+String:C10([CURRENT_STOCK:62]Quantity:4))
											End if 
											MESSAGE:C88("Current sto4")
											SAVE RECORD:C53([CURRENT_STOCK:62])
										End if 
									End if 
									$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
									$_t_StockType:=[CURRENT_STOCK:62]Stock_Type:3
									$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
									$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
									$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
									$_t_StockUniqueReference:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10)
									
									
									//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
									$_l_Retries:=0
									While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
										//GOTO XY(0;0)
										//MESSAGE("Waiting for record semahore StockLevel"+$_t_productCode+String($_l_Retries))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(60*$_l_Retries)
									End while 
									//CLOSE WINDOW
									READ WRITE:C146([STOCK_LEVELS:58])
									If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
										QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=$_t_StockUniqueReference)
									Else 
										QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
									End if 
									//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
									$_l_Retries:=0
									While (Not:C34(Check_Locked(->[STOCK_LEVELS:58])))
										//GOTO XY(0;0)
										//MESSAGE("Waiting for record unlocked StockLevel"+String($_l_Retries))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(60*$_l_Retries)
									End while 
									//CLOSE WINDOW
									If (Records in selection:C76([STOCK_LEVELS:58])=0)
										QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_productCode+"@"; *)
										If (<>StockAnal)
											QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType; *)
											QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
										Else 
											QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType)
										End if 
										$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
										
										If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
											If ($_l_CurrentMovementItemRecord>0)
												If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
													If ($_l_CurrentMovementItemRecord=1)
														If (([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode) & ([STOCK_LEVELS:58]Currency_Code:8#""))
															REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
														End if 
													Else 
														QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
														QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
													End if 
												Else 
													If ($_l_CurrentMovementItemRecord=1)
														If ([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode)
															REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
														End if 
													Else 
														QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
													End if 
												End if 
												$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
											End if 
										End if 
										$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
										If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
											If ($_l_CurrentMovementItemRecord>0)
												If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
													If ($_l_CurrentMovementItemRecord=1)
														If (([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode) & ([STOCK_LEVELS:58]Layer_Code:9#""))
															REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
														End if 
													Else 
														QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
														QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
													End if 
												Else 
													If ($_l_CurrentMovementItemRecord=1)
														If ([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode)
															REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
														End if 
													Else 
														QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
													End if 
												End if 
												$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
											End if 
										End if 
									End if 
									$_l_StockLevelID:=0
									Case of 
										: (Records in selection:C76([STOCK_LEVELS:58])=0)
											CREATE RECORD:C68([STOCK_LEVELS:58])
											[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
											[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
											If (<>StockAnal)
												[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
											End if 
											[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
											[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
											[STOCK_LEVELS:58]Free_Level:3:=0
											[STOCK_LEVELS:58]Free_Cost:5:=0
											[STOCK_LEVELS:58]Allocated_Level:4:=0
											[STOCK_LEVELS:58]Allocated_Cost:6:=0
											[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
											$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
											SAVE RECORD:C53([STOCK_LEVELS:58])
											STK_ValidateLevel
											AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
										: (Records in selection:C76([STOCK_LEVELS:58])>1)
											DELETE SELECTION:C66([STOCK_LEVELS:58])
											CREATE RECORD:C68([STOCK_LEVELS:58])
											[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
											[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
											If (<>StockAnal)
												[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
											End if 
											[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
											[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
											[STOCK_LEVELS:58]Free_Level:3:=0
											[STOCK_LEVELS:58]Free_Cost:5:=0
											[STOCK_LEVELS:58]Allocated_Level:4:=0
											[STOCK_LEVELS:58]Allocated_Cost:6:=0
											[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
											SAVE RECORD:C53([STOCK_LEVELS:58])
											STK_ValidateLevel
											$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
											AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
											
										Else 
											$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
											STK_ValidateLevel
											SAVE RECORD:C53([STOCK_LEVELS:58])
									End case 
									UNLOAD RECORD:C212([STOCK_LEVELS:58])
									
									CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
									
									//```
									
									USE NAMED SELECTION:C332("ALLCS")
									GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CopiedFromIndex)
									[CURRENT_STOCK:62]x_Stock_Level_ID:15:=$_l_StockLevelID
									SAVE RECORD:C53([CURRENT_STOCK:62])
									
									
									
								End for 
								If ($_l_StockItemsEditCount>0)
									READ WRITE:C146([STOCK_LEVELS:58])
									QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
									APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_ValidateLevel)
								End if 
								ARRAY REAL:C219($_ar_SCSAfterQTY; 0)
								QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Stock_Type:2; $_at_SLAfterType; [STOCK_LEVELS:58]UniqueConstruct:11; $_at_SLAfterInfor; [STOCK_LEVELS:58]Free_Level:3; $_ar_SLAfterFree; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_SLAfterAllocated; [STOCK_LEVELS:58]X_ID:10; $_al_SLAfterIDS)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Stock_Type:3; $_at_CSAfterType; [CURRENT_STOCK:62]Quantity:4; $_ar_SCSAfterQTY; [CURRENT_STOCK:62]UniqueConstruct:14; $_at_AfterUniqueID; [CURRENT_STOCK:62]X_ID:13; $_al_AfterID; [CURRENT_STOCK:62]Stock_Type:3; $_at_CSStockTypeAFTER; [CURRENT_STOCK:62]Item_Number:5; $_al_CSAllocatedToAFTER)
								If ([PRODUCTS:9]Product_Code:1#$_at_ProductCodes{$_l_UpdateProductsCount})
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								End if 
								
								//Note on O stock. Before the quantity may have been in Allocated but it will be in the free -even if it is really allocated
								$_bo_NoAdjust:=False:C215
								//TRACE
								If ([PRODUCTS:9]x_Product_No_longer_Available:54<0) | (([PRODUCTS:9]Actual_End_Date:49<=Current date:C33(*)) & ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!)) | ($_l_StockItemsEditCount=0)
									
									$_bo_NoAdjust:=True:C214
								End if 
								If (Not:C34($_bo_NoAdjust))
									$_t_Note:=""
									//
									For ($_l_ItemNumbersIndex; 1; Size of array:C274($_at_SLAfterType))
										If ($_at_SLAfterType{$_l_ItemNumbersIndex}="P") | ($_at_SLAfterType{$_l_ItemNumbersIndex}="O")
											$_l_StockLevelRow:=Find in array:C230($_al_StockLevelsBeforeIDS; $_al_SLAfterIDS{$_l_ItemNumbersIndex})
											If ($_l_StockLevelRow<0)
												If ($_ar_SLAfterFree{$_l_ItemNumbersIndex}#0) | ($_ar_SLAfterAllocated{$_l_ItemNumbersIndex}#0)
													$_t_NoteAdd:=$_at_SLAfterInfor{$_l_ItemNumbersIndex}+" "+String:C10($_ar_SLAfterFree{$_l_ItemNumbersIndex})+" "+String:C10($_ar_SLAfterAllocated{$_l_ItemNumbersIndex})
													If ($_l_ApplicationType=4D Server:K5:6)
														//GOTO XY(0;0)
														//MESSAGE($_t_NoteAdd)
													End if 
													$_t_Note:=$_t_Note+"Stock Level Added "+$_t_NoteAdd+Char:C90(13)
												End if 
												$_r_LevelsQuantity:=$_ar_SLAfterFree{$_l_ItemNumbersIndex}
											Else 
												If ($_ar_SLAfterFree{$_l_ItemNumbersIndex}#$_ar_StockLEvelsBeforeFree{$_l_StockLevelRow})
													$_t_NoteAdd:=$_at_SLAfterInfor{$_l_ItemNumbersIndex}+" From(Free)"+String:C10($_ar_StockLEvelsBeforeFree{$_l_StockLevelRow})+" to "+String:C10($_ar_SLAfterFree{$_l_ItemNumbersIndex})+" From(Allocated) "+String:C10($_ar_StockLEvelsBeforeAllocated{$_l_StockLevelRow})+" to "+String:C10($_ar_SLAfterAllocated{$_l_ItemNumbersIndex})
													
													If ($_l_ApplicationType=4D Server:K5:6)
														//GOTO XY(0;0)
														//MESSAGE($_t_NoteAdd)
													End if 
													$_t_Note:=$_t_Note+"Stock Level Changed "+$_t_NoteAdd+Char:C90(13)
													
												Else 
													If ($_ar_StockLEvelsBeforeAllocated{$_l_StockLevelRow}#$_ar_SLAfterAllocated{$_l_ItemNumbersIndex})
														$_t_NoteAdd:=$_at_SLAfterInfor{$_l_ItemNumbersIndex}+" From(Free)"+String:C10($_ar_StockLEvelsBeforeFree{$_l_StockLevelRow})+" to "+String:C10($_ar_SLAfterFree{$_l_ItemNumbersIndex})+" From(Allocated) "+String:C10($_ar_StockLEvelsBeforeAllocated{$_l_StockLevelRow})+" to "+String:C10($_ar_SLAfterAllocated{$_l_ItemNumbersIndex})
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														$_t_Note:=$_t_Note+"Stock Level Changed "+$_t_NoteAdd+Char:C90(13)
													End if 
												End if 
											End if 
										End if 
									End for 
									For ($_l_StockLevelsIndex; 1; Size of array:C274($_al_StockLevelsBeforeIDS))
										If ($_at_StockLevelsBeforeType{$_l_StockLevelsIndex}="P") | ($_at_StockLevelsBeforeType{$_l_StockLevelsIndex}="O")
											$_l_StockLevelRow:=Find in array:C230($_al_SLAfterIDS; $_al_StockLevelsBeforeIDS{$_l_StockLevelsIndex})
											If ($_l_StockLevelRow<0)
												$_t_NoteAdd:=$_at_StockLevelBeforeInfo{$_l_StockLevelsIndex}+" "+String:C10($_ar_StockLEvelsBeforeFree{$_l_StockLevelsIndex})+" "+String:C10($_ar_StockLEvelsBeforeAllocated{$_l_StockLevelsIndex})
												If ($_l_ApplicationType=4D Server:K5:6)
													//GOTO XY(0;0)
													//MESSAGE($_t_NoteAdd)
												End if 
												$_t_Note:=$_t_Note+"Stock Level Deleted "+$_t_NoteAdd+Char:C90(13)
											End if 
										End if 
									End for 
									$_r_TotalPStock:=0
									$_r_TotalAllocationsToDelete:=0
									ARRAY LONGINT:C221($_al_StockONOrderOItoDelete; 0)
									ARRAY REAL:C219($_ar_StockONORDOItoDeleteQuantit; 0)
									ARRAY BOOLEAN:C223($_abo_DoORDNotCorrect; 0)
									ARRAY LONGINT:C221($_al_StockOInumbersToDelete; 0)
									ARRAY REAL:C219($_ar_AllocationItemstoDeleteQuan; 0)
									ARRAY BOOLEAN:C223($_abo_DoNotCorrect; 0)
									$_r_TotalOStock:=0
									For ($_l_DeletionIndex; 1; Size of array:C274($_al_AfterID))
										If ($_at_CSAfterType{$_l_DeletionIndex}="P")  //| ($_at_CSAfterType{$_l_DeletionIndex}="O")
											
											If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)  //This is an allocated item number
												
												$_l_CurrentStockRow:=Find in array:C230($_al_CSBeforeIDS; $_al_AfterID{$_l_DeletionIndex})
												If ($_l_CurrentStockRow<0)
													$_L_DeletionRow:=Find in array:C230($_al_StockOInumbersToDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
													If ($_L_DeletionRow<0)
														If ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0)
															APPEND TO ARRAY:C911($_al_StockOInumbersToDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															APPEND TO ARRAY:C911($_ar_AllocationItemstoDeleteQuan; $_ar_SCSAfterQTY{$_l_DeletionIndex})
															APPEND TO ARRAY:C911($_abo_DoNotCorrect; False:C215)
														End if 
													Else 
														//already 'not found'-multiple P lines after
														$_ar_AllocationItemstoDeleteQuan{$_L_DeletionRow}:=$_ar_AllocationItemstoDeleteQuan{$_L_DeletionRow}+$_ar_SCSAfterQTY{$_l_DeletionIndex}
														
													End if 
												Else 
													//Line is found before does quantity match
													$_bo_NoCorrection:=False:C215
													$_r_QBefore:=0
													If ($_ar_CSBeforeQuantities{$_l_CurrentStockRow}>=0)  //so we dont set it to minus figures
														$_r_QBefore:=$_ar_CSBeforeQuantities{$_l_CurrentStockRow}
													End if 
													$_r_QuantityToDelete:=$_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QBefore
													If ($_r_QuantityToDelete#0)
														If ($_r_QuantityToDelete>0)  //MORE ALLOCATED NOW THAN BEFORE
															
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															If (Records in selection:C76([ORDER_ITEMS:25])=0)
																$_bo_NoCorrection:=False:C215
															Else 
																QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
																If (Records in selection:C76([ORDERS:24])=0)
																	$_bo_NoCorrection:=False:C215
																Else 
																	If ([ORDERS:24]State:15>="02450")
																		$_bo_NoCorrection:=False:C215
																	Else 
																		$_bo_NoCorrection:=True:C214
																	End if 
																	
																End if 
															End if 
														Else 
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															If (Records in selection:C76([ORDER_ITEMS:25])=0)
																$_bo_NoCorrection:=True:C214
															Else 
																QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
																If (Records in selection:C76([ORDERS:24])=0)
																	$_bo_NoCorrection:=True:C214
																Else 
																	If ([ORDERS:24]State:15>="02450")
																		$_bo_NoCorrection:=True:C214
																	End if 
																	
																End if 
															End if 
														End if 
													Else 
														$_bo_NoCorrection:=True:C214
													End if 
													
													$_r_QuantityToDelete:=$_ar_SCSAfterQTY{$_l_DeletionIndex}-$_ar_CSBeforeQuantities{$_l_CurrentStockRow}
													$_L_DeletionRow:=Find in array:C230($_al_StockOInumbersToDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
													If ($_L_DeletionRow<0)
														APPEND TO ARRAY:C911($_al_StockOInumbersToDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
														APPEND TO ARRAY:C911($_ar_AllocationItemstoDeleteQuan; $_r_QuantityToDelete)
														APPEND TO ARRAY:C911($_abo_DoNotCorrect; $_bo_NoCorrection)
														//note that the deletion quantity could be zero
													Else 
														//already 'not found'-multiple P lines after
														$_ar_AllocationItemstoDeleteQuan{$_L_DeletionRow}:=$_ar_AllocationItemstoDeleteQuan{$_L_DeletionRow}+$_ar_SCSAfterQTY{$_l_DeletionIndex}
														//note that we could end up with a deletion quantiy of zero
													End if 
													
												End if 
											Else 
												$_r_TotalPStock:=$_r_TotalPStock+$_ar_SCSAfterQTY{$_l_DeletionIndex}
											End if 
										End if 
										If ($_at_CSAfterType{$_l_DeletionIndex}="O")  //| ($_at_CSAfterType{$_l_DeletionIndex}="O")
											
											If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)  //This is an allocated item number
												//$Ref:=Find in array($_al_CSAllocatedTo;$_al_CSAllocatedToAFTER{$_l_DeletionIndex})
												$_l_CSIDRow:=Find in array:C230($_al_CSBeforeIDS; $_al_AfterID{$_l_DeletionIndex})
												If ($_l_CSIDRow<0)  //this is unlkely to be
													$_l_DeletionRow:=Find in array:C230($_al_StockONOrderOItoDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
													If ($_l_DeletionRow<0)
														If ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0)
															APPEND TO ARRAY:C911($_al_StockONOrderOItoDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															APPEND TO ARRAY:C911($_ar_StockONORDOItoDeleteQuantit; $_ar_SCSAfterQTY{$_l_DeletionIndex})
															APPEND TO ARRAY:C911($_abo_DoORDNotCorrect; False:C215)
														End if 
													Else 
														//already 'not found'-multiple P lines after
														$_ar_StockONORDOItoDeleteQuantit{$_l_DeletionRow}:=$_ar_StockONORDOItoDeleteQuantit{$_l_DeletionRow}+$_ar_SCSAfterQTY{$_l_DeletionIndex}
														
													End if 
												Else 
													//Line is found before does quantity match
													$_bo_NoCorrection:=False:C215
													$_r_QBefore:=0
													If ($_ar_CSBeforeQuantities{$_l_CurrentStockRow}>=0)  //so we dont set it to minus figures
														$_r_QBefore:=$_ar_CSBeforeQuantities{$_l_CurrentStockRow}
													End if 
													$_r_QuantityToDelete:=$_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QBefore  //this is because the AFTER will be zero
													If ($_r_QuantityToDelete#0)
														If ($_r_QuantityToDelete>0)  //Very unlikely -error it we this is so
															
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															If (Records in selection:C76([ORDER_ITEMS:25])=0)
																$_bo_NoCorrection:=False:C215
															Else 
																QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
																If (Records in selection:C76([ORDERS:24])=0)
																	$_bo_NoCorrection:=False:C215
																Else 
																	If ([ORDERS:24]State:15>="02450") & ($_r_QuantityToDelete>0)
																		$_bo_NoCorrection:=False:C215
																	Else 
																		$_bo_NoCorrection:=True:C214
																	End if 
																	
																End if 
															End if 
														Else 
															QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_CSAllocatedToAFTER{$_l_DeletionIndex})
															If (Records in selection:C76([ORDER_ITEMS:25])=0)
																$_bo_NoCorrection:=True:C214
															Else 
																QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
																If (Records in selection:C76([ORDERS:24])=0)
																	$_bo_NoCorrection:=True:C214
																Else 
																	If ([ORDERS:24]State:15>="02450") & ($_r_QuantityToDelete>0)
																		$_bo_NoCorrection:=True:C214
																	End if 
																	
																End if 
															End if 
														End if 
													Else 
														$_bo_NoCorrection:=True:C214
													End if 
													
													$_r_QuantityToDelete:=$_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QBefore
													$_l_DeletionRow:=Find in array:C230($_al_StockONOrderOItoDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
													If ($_l_DeletionRow<0)
														APPEND TO ARRAY:C911($_al_StockONOrderOItoDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
														APPEND TO ARRAY:C911($_ar_StockONORDOItoDeleteQuantit; $_r_QuantityToDelete)
														APPEND TO ARRAY:C911($_abo_DoORDNotCorrect; $_bo_NoCorrection)
														//note that the deletion quantity could be zero
													Else 
														//already 'not found'-multiple P lines after
														$_ar_StockONORDOItoDeleteQuantit{$_l_DeletionRow}:=$_ar_StockONORDOItoDeleteQuantit{$_l_DeletionRow}+$_ar_SCSAfterQTY{$_l_DeletionIndex}
														//note that we could end up with a deletion quantiy of zero
													End if 
													
												End if 
											Else 
												$_r_TotalOStock:=$_r_TotalOStock+$_ar_SCSAfterQTY{$_l_DeletionIndex}
											End if 
										End if 
									End for 
									//Note that we have counted the quantity to correct(the difference between before and after even if after is correct. we will not correct these if $donotCorrectistrue
									$_r_TotalPStockBefore:=0
									$_r_TotalPstockAllocatedBefore:=0
									$_r_TotalOstockAllocatedBefore:=0
									$_r_TotalOStockBefore:=0
									For ($_l_DeletionIndex; 1; Size of array:C274($_al_CSBeforeIDS))
										If ($_at_CSBeforeType{$_l_DeletionIndex}="P")  //| ($_at_CSAfterType{$_l_DeletionIndex}="O")
											If ($_al_CSAllocatedTo{$_l_DeletionIndex}=0)
												$_r_TotalPStockBefore:=$_r_TotalPStockBefore+$_ar_CSBeforeQuantities{$_l_DeletionIndex}
											Else 
												$_r_TotalPstockAllocatedBefore:=$_r_TotalPstockAllocatedBefore+$_ar_CSBeforeQuantities{$_l_DeletionIndex}
											End if 
										End if 
										If ($_at_CSBeforeType{$_l_DeletionIndex}="O")  //| ($_at_CSAfterType{$_l_DeletionIndex}="O")
											If ($_al_CSAllocatedTo{$_l_DeletionIndex}=0)
												If ($_ar_CSBeforeQuantities{$_l_DeletionIndex}>0)
													$_r_TotalOStockBefore:=$_r_TotalOStockBefore+$_ar_CSBeforeQuantities{$_l_DeletionIndex}
												End if 
											Else 
												If ($_ar_CSBeforeQuantities{$_l_DeletionIndex}>0)
													$_r_TotalOstockAllocatedBefore:=$_r_TotalOstockAllocatedBefore+$_ar_CSBeforeQuantities{$_l_DeletionIndex}
												End if 
											End if 
										End if 
									End for 
									$_r_TotalOStockBefore:=$_r_TotalOstockAllocatedBefore+$_r_TotalOStockBefore
									$_r_TotalAllocationsToIgnore:=0
									For ($_l_DeletionIndex; 1; Size of array:C274($_ar_AllocationItemstoDeleteQuan))
										If ($_abo_DoNotCorrect{$_l_DeletionIndex}=False:C215)
											$_r_TotalAllocationsToDelete:=$_r_TotalAllocationsToDelete+$_ar_AllocationItemstoDeleteQuan{$_l_DeletionIndex}
										Else 
											$_r_TotalAllocationsToIgnore:=$_r_TotalAllocationsToIgnore+$_ar_AllocationItemstoDeleteQuan{$_l_DeletionIndex}
										End if 
									End for 
									//so if before we had 50 allocated these were probably offset by 50 not allocated(check the -p stock)
									//but lets say the P stock not allocated is>0..lets say 50.. without the offset it would be 100..well the allocated should be not allocated so that is correct.
									//what we dont want to do here is adjust the unallocated to 50 we want to 'adjust' it to 100...(more than likely no adjustment.
									If ($_r_TotalAllocationsToIgnore#0)
										//TRACE
									End if 
									$_r_TotalPStockBefore:=$_r_TotalPStockBefore  //+$_r_TotalAllocationsToIgnore
									If ($_r_TotalPStockBefore<0)
										$_r_TotalPStockBefore:=0
									End if 
									
									
									$_r_SubtractPStock:=$_r_TotalPStock-$_r_TotalPStockBefore
									
									If ($_r_TotalPStock#$_r_TotalPStockBefore) | ($_r_TotalAllocationsToDelete#0)
										//TRACE
										$_bo_NoPstockChange:=False:C215
										$_r_SubtractPStock:=$_r_TotalPStock-$_r_TotalPStockBefore
									Else 
										$_bo_NoPstockChange:=True:C214
									End if 
									
									//$_r_SubtractPStock:=$_r_SubtractPStock-$_r_TotalAllocationsToDelete
									//Note that P stock is now only P unallocated stock and P stock could be a MINUS
									//$_r_TotalOStock:  `Not that now is only FREE O stock 7/9/2011
									//For ($_l_DeletionIndex;1;Size of array($_al_AfterID))
									//If ($_at_CSAfterType{$_l_DeletionIndex}="O")  `| ($_at_CSAfterType{$_l_DeletionIndex}="O")
									//$_r_TotalOStock:=$_r_TotalOStock+$_ar_SCSAfterQTY{$_l_DeletionIndex}
									//End if
									//End for
									//$_r_TotalOStockBefore:=0
									//For ($_l_DeletionIndex;1;Size of array($_al_CSBeforeIDS))
									//If ($_at_CSBeforeType{$_l_DeletionIndex}="O")  `| ($_at_CSAfterType{$_l_DeletionIndex}="O")
									//If ($_ar_CSBeforeQuantities{$_l_DeletionIndex}>0)
									//$_r_TotalOStockBefore:=$_r_TotalOStockBefore+$_ar_CSBeforeQuantities{$_l_DeletionIndex}
									//End if
									//End if
									//End for
									If ($_r_TotalOStockBefore<0)
										$_r_TotalOStockBefore:=0
									End if 
									
									$_r_SubtractToStock:=$_r_TotalOStock-$_r_TotalOStockBefore
									
									If ($_r_TotalOStock#$_r_TotalOStockBefore)
										//TRACE
										$_bo_NoOStockChange:=False:C215
										//$_r_SubtractToStock:=$_r_TotalOStock-$_r_TotalOStockBefore
									Else 
										$_bo_NoOStockChange:=True:C214
									End if 
									If ($_l_ApplicationType=4D Server:K5:6)
										GOTO XY:C161(0; 2)
										MESSAGE:C88("Posting adjustments for "+$_at_ProductCodes{$_l_UpdateProductsCount})
									End if 
									$_l_AdjustmentsMade:=0
									ARRAY LONGINT:C221($_al_CSUpdatedIDS; 0)
									//``
									//TRACE
									For ($_l_DeletionIndex; 1; Size of array:C274($_al_AfterID))
										If ($_at_CSAfterType{$_l_DeletionIndex}="P") | ($_at_CSAfterType{$_l_DeletionIndex}="O")
											
											$_r_QuantityToDelete:=0
											If ($_at_CSAfterType{$_l_DeletionIndex}="P")
												
												$_l_DeletionRow:=Find in array:C230($_al_StockOInumbersToDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
												If ($_l_DeletionRow>0)
													//this is reecorded in the allocation stock
													If ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0)
														//$_r_SubtractPStock:=$_r_SubtractPStock-$_ar_SCSAfterQTY{$_l_DeletionIndex}
													End if 
													If ($_abo_DoNotCorrect{$_l_DeletionRow}=False:C215)
														$_r_QuantityToDelete:=$_ar_AllocationItemstoDeleteQuan{$_l_DeletionRow}
													Else 
														$_r_QuantityToDelete:=0
													End if 
													If ($_r_QuantityToDelete=0)
														$_l_DeletionRow:=0
													End if 
												Else 
													$_r_QuantityToDelete:=0
													$_l_DeletionRow:=0
												End if 
												//``````
											End if 
											$_r_QuantityOOtoDelete:=0  //allocated quantity-actually this is just going to have moved to un-allocated-this will make sure we dont pick these ones up
											If ($_at_CSAfterType{$_l_DeletionIndex}="O")
												$_L_DeletionRow:=Find in array:C230($_al_StockONOrderOItoDelete; $_al_CSAllocatedToAFTER{$_l_DeletionIndex})
												If ($_L_DeletionRow>0)
													//this is reecorded in the allocation stock
													If ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0)
														//$_r_SubtractPStock:=$_r_SubtractPStock-$_ar_SCSAfterQTY{$_l_DeletionIndex}
													End if 
													If ($_abo_DoORDNotCorrect{$_L_DeletionRow}=False:C215)
														
														$_r_QuantityOOtoDelete:=Abs:C99($_ar_StockONORDOItoDeleteQuantit{$_L_DeletionRow})
													Else 
														$_r_QuantityOOtoDelete:=0
													End if 
													If ($_r_QuantityOOtoDelete=0)
														$_L_DeletionRow:=0
													End if 
												Else 
													$_r_QuantityOOtoDelete:=0
													$_L_DeletionRow:=0
												End if 
											End if 
											//````
											$_l_CurrentStockRow:=Find in array:C230($_al_CSBeforeIDS; $_al_AfterID{$_l_DeletionIndex})
											If ($_l_CurrentStockRow<0)
												If ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0) | ($_r_QuantityToDelete#0) | ($_r_QuantityOOtoDelete#0)
													
													//Checked 3/08/2011
													$_t_NoteAdd:=""
													Case of 
														: ($_r_QuantityToDelete>0)
															If (($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityToDelete)<0)
																$_r_QuantityToDelete:=0
															Else 
																$_t_NoteAdd:="Adjust Allocated(P) Stock on stock item(order item) "+String:C10($_al_CSAllocatedToAFTER{$_l_DeletionIndex})+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityToDelete)
															End if 
														: ($_at_CSAfterType{$_l_DeletionIndex}="P")
															If ($_r_SubtractPStock>0)
																If ($_r_SubtractPStock>$_ar_SCSAfterQTY{$_l_DeletionIndex})
																	$_t_NoteAdd:="Adjust FREE(P) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to Zero"
																Else 
																	If (($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityToDelete)<0)
																		//TRACE
																	End if 
																	$_t_NoteAdd:="Adjust FREE(P) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_SubtractPStock)
																	
																	
																End if 
															Else 
																$_t_NoteAdd:="Increase FREE(P) Stock By "+String:C10(Abs:C99($_r_SubtractPStock))
																
															End if 
														: ($_r_QuantityOOtoDelete<0)
															If (($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityOOtoDelete)<0)
																$_r_QuantityOOtoDelete:=$_ar_SCSAfterQTY{$_l_DeletionIndex}
															Else 
																$_t_NoteAdd:="Adjust Allocated(O) Stock on stock item(order item) "+String:C10($_al_CSAllocatedToAFTER{$_l_DeletionIndex})+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}+$_r_QuantityOOtoDelete)
															End if 
														: ($_at_CSAfterType{$_l_DeletionIndex}="O")
															If ($_r_SubtractToStock>0)
																If ($_r_SubtractToStock>$_ar_SCSAfterQTY{$_l_DeletionIndex})
																	$_t_NoteAdd:="Adjust on order(0) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to Zero"
																Else 
																	If (($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityToDelete)<0)
																		//TRACE
																	End if 
																	$_t_NoteAdd:="Adjust On order(O) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_SubtractToStock)
																	
																	
																End if 
															Else 
																$_t_NoteAdd:="Increase on order(O) Stock By "+String:C10(Abs:C99($_r_SubtractToStock))
															End if 
													End case 
													
													If ($_l_ApplicationType=4D Server:K5:6)
														//GOTO XY(0;0)
														//MESSAGE($_t_NoteAdd)
													End if 
													If ($_t_NoteAdd#"")
														$_t_Note:=$_t_Note+$_t_NoteAdd+Char:C90(13)
													End if 
													
													
													QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
													$_l_RecordsInSelectionMovementIt:=[CURRENT_STOCK:62]Quantity:4
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_AfterID{$_l_DeletionIndex}; *)
													If ($_at_CSAfterType{$_l_DeletionIndex}="P")
														If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}; *)
														Else 
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
														End if 
													End if 
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
													$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
													
													CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$TEMP2")
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
													DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_AnalysisRange)
													Case of 
														: ($_r_QuantityToDelete>0) & ($_at_CSAfterType{$_l_DeletionIndex}="P")
															If ($_l_RecordsInSelectionMovementIt>$_r_QuantityToDelete)
																$_l_RecordsInSelectionMovementIt:=$_r_QuantityToDelete
															End if 
														: ($_r_SubtractPStock>0) & ($_at_CSAfterType{$_l_DeletionIndex}="P")
															If ($_l_RecordsInSelectionMovementIt>$_r_SubtractPStock)
																$_l_RecordsInSelectionMovementIt:=$_r_SubtractPStock
															End if 
														: ($_r_QuantityOOtoDelete<0)
															If ($_l_RecordsInSelectionMovementIt>Abs:C99($_r_QuantityOOtoDelete))
																$_l_RecordsInSelectionMovementIt:=Abs:C99($_r_QuantityOOtoDelete)
															End if 
														: ($_r_SubtractToStock>0) & ($_at_CSAfterType{$_l_DeletionIndex}="O")
															If ($_l_RecordsInSelectionMovementIt>$_r_SubtractToStock)
																$_l_RecordsInSelectionMovementIt:=$_r_SubtractToStock
															End if 
													End case 
													For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
														For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisRange))
															Case of 
																: ($_at_CSAfterType{$_l_DeletionIndex}="P") & (Not:C34($_bo_NoPstockChange))
																	Case of 
																		: ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
																			Case of 
																				: ($_r_QuantityToDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																					
																					USE SET:C118("$TEMP2")
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																						If ($_l_ApplicationType=4D Server:K5:6)
																							GOTO XY:C161(0; 3)
																							MESSAGE:C88("Creating adjustment to allocation -"+String:C10($_r_QuantityToDelete))
																						End if 
																						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
																						CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																						$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																						[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																						[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																						[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																						[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																						[STOCK_MOVEMENTS:40]Movement_Type:6:="ADJ"
																						[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																						[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																						[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																						[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																						SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																						For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																							If ($_r_QuantityToDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																								If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																								Else 
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																								End if 
																								$_r_QuantityToDelete:=$_r_QuantityToDelete-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_ar_AllocationItemstoDeleteQuan{$_l_DeletionRow}:=$_ar_AllocationItemstoDeleteQuan{$_l_DeletionRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																								[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="P"
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ADJ"
																								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																									$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									If ($_l_CurrentStockRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									End if 
																								End if 
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																									$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									If ($_l_CurrentStockRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									End if 
																								End if 
																								
																								If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																									STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																								End if 
																							End if 
																						End for 
																						
																						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																						
																						
																					End if 
																				: ($_r_QuantityToDelete<0)
																					//TRACE
																			End case 
																			
																		: ($_r_SubtractPStock>0) & ($_l_RecordsInSelectionMovementIt>0)
																			
																			USE SET:C118("$TEMP2")
																			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																				If ($_l_ApplicationType=4D Server:K5:6)
																					GOTO XY:C161(0; 3)
																					MESSAGE:C88("Creating adjustment to free -"+String:C10($_r_SubtractPStock))
																				End if 
																				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
																				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																				$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																				[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																				[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																				[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																				[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																				[STOCK_MOVEMENTS:40]Movement_Type:6:="ADJ"
																				//MESSAGE("Stuck 1")
																				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																				//MESSAGE("Stuck 2")
																				[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																				//MESSAGE("Stuck 3")
																				[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																				//MESSAGE("Stuck 4")
																				[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																				For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																					If ($_r_SubtractPStock>0) & ($_l_RecordsInSelectionMovementIt>0)
																						CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																						[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																						[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																						If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																						Else 
																							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																						End if 
																						[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																						$_r_SubtractPStock:=$_r_SubtractPStock-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																						$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																						//MESSAGE("Stuck 5")
																						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)  //
																						//MESSAGE("Stuck 6")
																						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="P"
																						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ADJ"
																						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																						
																						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																							$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																							If ($_l_CurrentStockRow<0)
																								APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																							End if 
																						End if 
																						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																							$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																							If ($_l_CurrentStockRow<0)
																								APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																							End if 
																						End if 
																						If ($_r_SubtractPStock<=0) | ($_l_RecordsInSelectionMovementIt<=0)
																							$_l_CreateIndex:=Size of array:C274($_al_StockMovementItemIDS)
																						End if 
																						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																							//MESSAGE("Stuck 7")
																							STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																							//MESSAGE("Stuck 8")
																						End if 
																					End if 
																				End for 
																				//MESSAGE("Stuck 9")
																				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																				//MESSAGE("Stuck 10")
																				
																			End if 
																			//```
																			
																			
																			//This is an iso..create some p stock
																		: ($_r_SubtractPStock<0)
																			If ($_l_ApplicationType=4D Server:K5:6)
																				GOTO XY:C161(0; 3)
																				MESSAGE:C88("Creating adjustment to free +"+String:C10($_r_SubtractPStock))
																			End if 
																			//TRACE
																			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISO")
																			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
																			CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																			$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																			[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																			[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
																			[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
																			[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																			[STOCK_MOVEMENTS:40]Movement_Type:6:="ISO"
																			[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																			[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																			[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																			[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																			SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																			$_r_Select:=$_r_Difference
																			If ($_r_Select>0)
																				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																				[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																				[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
																				[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
																				[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
																				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99($_r_SubtractPStock)  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
																				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																				[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
																				[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-$_r_SubtractPStock
																				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="P"
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
																				[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
																				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																				[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ISO"
																				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																					$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																					If ($_l_CurrentStockRow<0)
																						APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																					End if 
																				End if 
																				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																					$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																					If ($_l_CurrentStockRow<0)
																						APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																					End if 
																				End if 
																				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
																				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																				$_r_ChangeOStockSUM:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																				
																				If ($_r_ChangeOStockSUM#0)
																					$_r_SubtractToStock:=$_r_SubtractToStock-$_r_ChangeOStockSUM
																				End if 
																				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
																				
																			End if 
																			$_r_SubtractPStock:=0
																			
																			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																	End case 
																	
																	
																	
																: ($_at_CSAfterType{$_l_DeletionIndex}="O") & (Not:C34($_bo_NoOStockChange)) & (False:C215)
																	Case of 
																		: ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0) & ($_r_QuantityOOtoDelete#0)
																			If (False:C215)
																				Case of 
																					: ($_r_QuantityOOtoDelete<0) & ($_l_RecordsInSelectionMovementIt>0)
																						
																						USE SET:C118("$TEMP2")
																						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																							If ($_l_ApplicationType=4D Server:K5:6)
																								GOTO XY:C161(0; 3)
																								MESSAGE:C88("Creating adjustment to allocation -"+String:C10($_r_QuantityToDelete))
																							End if 
																							SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
																							CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																							$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																							[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																							[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																							[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																							[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																							[STOCK_MOVEMENTS:40]Movement_Type:6:="OCA"
																							[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																							[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																							[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																							[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																							SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																							For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																								If ($_r_QuantityOOtoDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																									CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																									[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																									[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																									If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																									Else 
																										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																									End if 
																									$_r_QuantityOOtoDelete:=$_r_QuantityOOtoDelete-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																									$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																									$_ar_StockONORDOItoDeleteQuantit{$_L_DeletionRow}:=$_ar_StockONORDOItoDeleteQuantit{$_L_DeletionRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																									[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																									[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																									[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																									//[STOCK ITEMS]xSalesOrderItemifUnallocate:=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}
																									[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																									[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																									[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="OCA"
																									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																										$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																										If ($_l_CurrentStockRow<0)
																											APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																										End if 
																									End if 
																									If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																										$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																										If ($_l_CurrentStockRow<0)
																											APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																										End if 
																									End if 
																									
																									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																										STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																									End if 
																								End if 
																							End for 
																							
																							DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																							
																							
																						End if 
																					: ($_r_QuantityOOtoDelete<0)
																						//TRACE
																				End case 
																			End if 
																		: ($_r_SubtractToStock>0) & (False:C215)
																			
																			USE SET:C118("$TEMP2")
																			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																			
																			
																			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
																				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																				$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																				If ($_l_ApplicationType=4D Server:K5:6)
																					GOTO XY:C161(0; 3)
																					MESSAGE:C88("Creating adjustment to on order(OCA) -"+String:C10($_r_SubtractToStock))
																				End if 
																				[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																				[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																				[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																				[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																				[STOCK_MOVEMENTS:40]Movement_Type:6:="OCA"
																				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																				[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																				[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																				[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																				For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																					If ($_al_SMIItemNumbers{$_l_CreateIndex}#0)
																						$_bo_IsOK:=((Find in array:C230($_al_StockONOrderOItoDelete; $_al_SMIItemNumbers{$_l_CreateIndex}))=-1)
																					Else 
																						$_bo_IsOK:=True:C214
																					End if 
																					If ($_bo_IsOK)
																						
																						CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																						[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																						[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																						If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_r_SubtractToStock)
																							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																						Else 
																							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SubtractToStock
																						End if 
																						$_r_SubtractToStock:=$_r_SubtractToStock-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																						[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="S"
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																						[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																						[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																						[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="OCA"
																						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																							$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																							If ($_l_CurrentStockRow<0)
																								APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																							End if 
																						End if 
																						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																							$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																							If ($_l_CurrentStockRow<0)
																								APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																							End if 
																						End if 
																						If ($_r_SubtractToStock<=0)
																							$_l_CreateIndex:=Size of array:C274($_al_StockMovementItemIDS)
																						End if 
																					End if 
																				End for 
																				
																				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																				
																			End if 
																			
																			//add to o stock
																		: ($_r_SubtractToStock<0) & (False:C215)
																			If ($_l_ApplicationType=4D Server:K5:6)
																				GOTO XY:C161(0; 3)
																				MESSAGE:C88("Creating adjustment to on order(PO) +"+String:C10($_r_SubtractToStock))
																			End if 
																			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
																			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="PO")
																			CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																			$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																			//TRACE
																			[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																			[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
																			[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
																			[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																			[STOCK_MOVEMENTS:40]Movement_Type:6:="PO"
																			[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																			[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																			[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																			[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																			SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																			
																			$_r_Select:=$_r_Difference
																			
																			If ($_r_Select>0)
																				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																				[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																				[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
																				[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
																				[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
																				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SubtractToStock  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
																				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="O"
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																				[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
																				[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
																				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="S"
																				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																				[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="PO"
																				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																					$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																					If ($_l_CurrentStockRow<0)
																						APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																					End if 
																				End if 
																				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																					$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																					If ($_l_CurrentStockRow<0)
																						APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																					End if 
																				End if 
																			End if 
																			$_r_SubtractToStock:=0
																			//TRACE
																			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																			
																			
																			
																	End case 
																	
															End case 
														End for 
													End for 
													
													
												End if 
											Else 
												$_t_NoteAdd:=""
												Case of 
													: ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0) & ($_r_SubtractPStock>0) & ($_r_QuantityToDelete=0) & ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}=0) & ($_at_CSAfterType{$_l_DeletionIndex}="P")
														//subtract some stock p free
														If ($_r_SubtractPStock>0)
															If ($_r_SubtractPStock>$_ar_SCSAfterQTY{$_l_DeletionIndex})
																$_t_NoteAdd:="Adjust FREE(P) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to Zero"
															Else 
																$_t_NoteAdd:="Adjust FREE(P) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_SubtractPStock)
																
																
															End if 
															
															
														End if 
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
														$_l_RecordsInSelectionMovementIt:=[CURRENT_STOCK:62]Quantity:4
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_AfterID{$_l_DeletionIndex}; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
														$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
														
														CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$TEMP2")
														DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
														DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_AnalysisRange)
														If ($_l_RecordsInSelectionMovementIt<$_r_SubtractPStock)
														Else 
															$_l_RecordsInSelectionMovementIt:=$_r_SubtractPStock
														End if 
														For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
															For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisRange))
																If ($_at_CSAfterType{$_l_DeletionIndex}="P") & (Not:C34($_bo_NoPstockChange))
																	If ($_l_RecordsInSelectionMovementIt>0)
																		
																		USE SET:C118("$TEMP2")
																		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
																			CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																			$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																			[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																			[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																			[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																			[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																			[STOCK_MOVEMENTS:40]Movement_Type:6:="ADJ"
																			[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																			[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																			[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																			[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																			SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																			For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																				If ($_r_SubtractPStock>0) & ($_l_RecordsInSelectionMovementIt>0)
																					If ($_l_ApplicationType=4D Server:K5:6)
																						GOTO XY:C161(0; 3)
																						MESSAGE:C88("Creating adjustment to  free stock -"+String:C10($_r_SubtractPStock))
																					End if 
																					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																					[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																					If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																					Else 
																						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																					End if 
																					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																					$_r_SubtractPStock:=$_r_SubtractPStock-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																					$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="P"
																					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ADJ"
																					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																						$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																						If ($_l_CurrentStockRow<0)
																							APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																						End if 
																					End if 
																					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																						$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																						If ($_l_CurrentStockRow<0)
																							APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																						End if 
																					End if 
																					If ($_r_SubtractPStock<=0) | ($_l_RecordsInSelectionMovementIt<=0)
																						$_l_CreateIndex:=Size of array:C274($_al_StockMovementItemIDS)
																					End if 
																					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																						STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																					End if 
																				End if 
																			End for 
																			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																		End if 
																		//```
																		
																		
																		
																	End if 
																End if 
															End for 
														End for 
													: ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0) & ($_r_SubtractToStock>0) & ($_r_QuantityOOtoDelete=0) & ($_at_CSAfterType{$_l_DeletionIndex}="O") & (False:C215)
														//subtract some stock O free
														If ($_r_SubtractToStock>0)
															If ($_r_SubtractToStock>$_ar_SCSAfterQTY{$_l_DeletionIndex})
																$_t_NoteAdd:="Adjust on order0) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to Zero"
															Else 
																$_t_NoteAdd:="Adjust On order(O) Stock "+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_SubtractPStock)
																
																
															End if 
															
														End if 
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
														$_l_RecordsInSelectionMovementIt:=[CURRENT_STOCK:62]Quantity:4
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_AfterID{$_l_DeletionIndex}; *)
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
														$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
														
														CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$TEMP2")
														DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
														DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_AnalysisRange)
														If ($_r_SubtractToStock<$_l_RecordsInSelectionMovementIt)
															$_l_RecordsInSelectionMovementIt:=$_r_SubtractToStock
														End if 
														For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
															For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisRange))
																
																If ($_at_CSAfterType{$_l_DeletionIndex}="O") & (Not:C34($_bo_NoOStockChange))
																	If ($_r_SubtractToStock>0) & ($_l_RecordsInSelectionMovementIt>0)
																		If ($_l_ApplicationType=4D Server:K5:6)
																			GOTO XY:C161(0; 3)
																			MESSAGE:C88("Creating adjustment to on order stock -"+String:C10($_r_SubtractToStock))
																		End if 
																		
																		USE SET:C118("$TEMP2")
																		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
																			CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																			$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																			[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																			[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																			[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																			[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																			[STOCK_MOVEMENTS:40]Movement_Type:6:="OCA"
																			[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																			[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																			[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																			[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																			SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																			For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																				If ($_al_SMIItemNumbers{$_l_CreateIndex}#0)
																					$_bo_IsOK:=((Find in array:C230($_al_StockONOrderOItoDelete; $_al_SMIItemNumbers{$_l_CreateIndex}))=-1)
																				Else 
																					$_bo_IsOK:=True:C214
																				End if 
																				If ($_bo_IsOK)
																					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																					[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																					If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																					Else 
																						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																					End if 
																					$_r_SubtractToStock:=$_r_SubtractToStock-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																					$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt--[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="S"
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																					[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																					[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																					[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="OCA"
																					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																						$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																						If ($_l_CurrentStockRow<0)
																							APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																						End if 
																					End if 
																					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																						$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																						If ($_l_CurrentStockRow<0)
																							APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																						End if 
																					End if 
																					If ($_r_SubtractToStock<=0) | ($_l_RecordsInSelectionMovementIt<=0)
																						
																						$_l_CreateIndex:=Size of array:C274($_al_StockMovementItemIDS)
																					End if 
																				End if 
																			End for 
																			
																			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																			
																		End if 
																		//```
																		
																	End if 
																	
																End if 
															End for 
														End for 
													: ($_ar_CSBeforeQuantities{$_l_CurrentStockRow}#0) & ($_r_SubtractPStock<0) & ($_r_QuantityToDelete=0) & ($_al_CSAllocatedTo{$_l_CurrentStockRow}=0) & ($_at_CSBeforeType{$_l_CurrentStockRow}="P")
														//add some stock P free
														$_t_NoteAdd:="Increase FREE(P) Stock By "+String:C10(Abs:C99($_r_SubtractPStock))
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														
														If ($_r_SubtractPStock<0)
															//TRACE
															QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ISO")
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
															CREATE RECORD:C68([STOCK_MOVEMENTS:40])
															$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
															If ($_l_ApplicationType=4D Server:K5:6)
																GOTO XY:C161(0; 3)
																MESSAGE:C88("Creating adjustment to free stock +"+String:C10($_r_SubtractPStock))
															End if 
															[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
															[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
															[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
															[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
															[STOCK_MOVEMENTS:40]Movement_Type:6:="ISO"
															[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
															[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
															[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
															[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
															SAVE RECORD:C53([STOCK_MOVEMENTS:40])
															//$_r_Select:=$_r_Difference
															If ($_r_SubtractPStock<0)
																CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
																[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
																[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
																[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99($_r_SubtractPStock)  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
																$_r_SubtractPStock:=$_r_SubtractPStock+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
																[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="P"
																[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
																[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
																[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
																[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ISO"
																DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																	$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																	If ($_l_CurrentStockRow<0)
																		APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																	End if 
																End if 
																If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																	$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																	If ($_l_CurrentStockRow<0)
																		APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																	End if 
																End if 
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																$_r_ChangeOStockSUM:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
																If ($_r_ChangeOStockSUM#0)
																	$_r_SubtractToStock:=$_r_SubtractToStock-$_r_ChangeOStockSUM
																End if 
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
																
															End if 
															$_r_SubtractPStock:=0
															
															DB_SaveRecord(->[STOCK_MOVEMENTS:40])
														End if 
														
													: ($_ar_CSBeforeQuantities{$_l_CurrentStockRow}#0) & ($_r_SubtractToStock<0) & ($_at_CSAfterType{$_l_DeletionIndex}="O") & (False:C215)
														//add some stock o free
														$_t_NoteAdd:="Increase On Order(O) Stock By "+String:C10(Abs:C99($_r_SubtractToStock))
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														
														
														//add to o stock
														If ($_r_SubtractToStock<0)
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
															QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="PO")
															CREATE RECORD:C68([STOCK_MOVEMENTS:40])
															$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
															If ($_l_ApplicationType=4D Server:K5:6)
																GOTO XY:C161(0; 3)
																MESSAGE:C88("Creating adjustment to on order stock(PO) "+String:C10($_r_SubtractToStock))
															End if 
															[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
															[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
															[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
															[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
															[STOCK_MOVEMENTS:40]Movement_Type:6:="PO"
															[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
															[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
															[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
															[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
															SAVE RECORD:C53([STOCK_MOVEMENTS:40])
															
															
															CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
															[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
															[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
															[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
															[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
															[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99($_r_SubtractToStock)  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
															[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
															[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
															[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
															[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="O"
															[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
															[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
															[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
															[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
															[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
															[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="S"
															[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
															[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="PO"
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																If ($_l_CurrentStockRow<0)
																	APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																End if 
															End if 
															If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																If ($_l_CurrentStockRow<0)
																	APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																End if 
															End if 
															$_r_SubtractToStock:=0
															
															DB_SaveRecord(->[STOCK_MOVEMENTS:40])
															
														End if 
														
														
														
														
													: ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0) & ($_r_QuantityToDelete>0) & ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0) & ($_at_CSAfterType{$_l_DeletionIndex}="P")
														//subtract some stock P allocated
														$_t_NoteAdd:="Adjust Allocated(P) Stock on stock item(order item) "+String:C10($_al_CSAllocatedToAFTER{$_l_DeletionIndex})+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityToDelete)
														If ($_l_ApplicationType=4D Server:K5:6)
															//GOTO XY(0;0)
															//MESSAGE($_t_NoteAdd)
														End if 
														If (Not:C34($_bo_NoPstockChange)) | (Not:C34($_bo_NoOStockChange))
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
															$_l_RecordsInSelectionMovementIt:=[CURRENT_STOCK:62]Quantity:4
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_AfterID{$_l_DeletionIndex}; *)
															If ($_at_CSAfterType{$_l_DeletionIndex}="P")
																If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}; *)
																Else 
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
																End if 
															End if 
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
															$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
															
															CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$TEMP2")
															DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
															DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_AnalysisRange)
															If ($_r_QuantityToDelete<$_l_RecordsInSelectionMovementIt)
																$_l_RecordsInSelectionMovementIt:=$_r_QuantityToDelete
															End if 
															For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
																For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisRange))
																	If ($_at_CSAfterType{$_l_DeletionIndex}="P") & (Not:C34($_bo_NoPstockChange))
																		If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
																			Case of 
																				: ($_r_QuantityToDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																					
																					USE SET:C118("$TEMP2")
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
																						CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																						$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																						If ($_l_ApplicationType=4D Server:K5:6)
																							GOTO XY:C161(0; 3)
																							MESSAGE:C88("Creating adjustment to allocated "+String:C10($_r_QuantityToDelete))
																						End if 
																						[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																						[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																						[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																						[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																						[STOCK_MOVEMENTS:40]Movement_Type:6:="ADJ"
																						[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																						[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																						[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																						[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																						SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																						For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																							If ($_r_QuantityToDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																								If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																								Else 
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																								End if 
																								$_r_QuantityToDelete:=$_r_QuantityToDelete-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_ar_AllocationItemstoDeleteQuan{$_l_DeletionRow}:=$_ar_AllocationItemstoDeleteQuan{$_l_DeletionRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																								[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="P"
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ADJ"
																								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																									$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									If ($_l_CurrentStockRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									End if 
																								End if 
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																									$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									If ($_l_CurrentStockRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									End if 
																								End if 
																								
																								If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																									STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																								End if 
																							End if 
																						End for 
																						
																						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																						
																						
																					End if 
																				: ($_r_QuantityToDelete<0)
																					//TRACE
																			End case 
																			
																		End if 
																	End if 
																End for 
															End for 
															
														End if 
													: ($_ar_SCSAfterQTY{$_l_DeletionIndex}#0) & ($_r_QuantityOOtoDelete>0) & ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0) & ($_at_CSAfterType{$_l_DeletionIndex}="O") & (False:C215)
														//subtract some stock O allocated
														If (False:C215)
															$_t_NoteAdd:="Adjust Allocated(O) Stock on stock item(order item) "+String:C10($_al_CSAllocatedToAFTER{$_l_DeletionIndex})+" From "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex})+" to "+String:C10($_ar_SCSAfterQTY{$_l_DeletionIndex}-$_r_QuantityOOtoDelete)
															If ($_l_ApplicationType=4D Server:K5:6)
																//GOTO XY(0;0)
																//MESSAGE($_t_NoteAdd)
															End if 
															
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_AfterID{$_l_DeletionIndex})
															$_l_RecordsInSelectionMovementIt:=[CURRENT_STOCK:62]Quantity:4
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_AfterID{$_l_DeletionIndex}; *)
															If ($_at_CSAfterType{$_l_DeletionIndex}="O")
																If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}; *)
																Else 
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
																End if 
															End if 
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
															$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
															
															CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$TEMP2")
															DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
															DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_AnalysisRange)
															If ($_r_QuantityOOtoDelete<$_l_RecordsInSelectionMovementIt)
																$_l_RecordsInSelectionMovementIt:=$_r_QuantityOOtoDelete
															End if 
															For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
																For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisRange))
																	If ($_at_CSAfterType{$_l_DeletionIndex}="O") & ($_r_QuantityOOtoDelete#0)
																		If ($_al_CSAllocatedToAFTER{$_l_DeletionIndex}#0)
																			Case of 
																				: ($_r_QuantityOOtoDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																					
																					USE SET:C118("$TEMP2")
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_at_AnalysisRange{$_l_AnalysisIndex}; *)
																					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
																					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
																						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_SMIAddedToCSID; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_SMIHeaderCurrency; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SMIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_SMIItemNumbers; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIResidualQuantities; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocationCodes)
																						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="OCA")
																						CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																						$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																						If ($_l_ApplicationType=4D Server:K5:6)
																							GOTO XY:C161(0; 3)
																							MESSAGE:C88("Creating adjustment to allocated(0) "+String:C10($_r_QuantityToDelete))
																						End if 
																						[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																						[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_at_AnalysisRange{$_l_AnalysisIndex}
																						[STOCK_MOVEMENTS:40]Currency_Code:10:=$_at_CurrenciesRange{$_l_CurrenciesIndex}
																						[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																						[STOCK_MOVEMENTS:40]Movement_Type:6:="OCA"
																						[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																						[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																						[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																						[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																						SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																						For ($_l_CreateIndex; 1; Size of array:C274($_al_StockMovementItemIDS))
																							If ($_r_QuantityOOtoDelete>0) & ($_l_RecordsInSelectionMovementIt>0)
																								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_at_SMIProductCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_SMIItemNumbers{$_l_CreateIndex}
																								If ($_ar_SMIResidualQuantities{$_l_CreateIndex}<$_l_RecordsInSelectionMovementIt)
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SMIResidualQuantities{$_l_CreateIndex}
																								Else 
																									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_RecordsInSelectionMovementIt
																								End if 
																								$_r_QuantityOOtoDelete:=$_r_QuantityOOtoDelete-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_l_RecordsInSelectionMovementIt:=$_l_RecordsInSelectionMovementIt-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								$_ar_StockONORDOItoDeleteQuantit{$_L_DeletionRow}:=$_ar_StockONORDOItoDeleteQuantit{$_L_DeletionRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																								
																								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_StockMovementItemIDS{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																								[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_at_SMIHeaderCurrency{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="O"
																								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_al_CSAllocatedToAFTER{$_l_DeletionIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_at_AnalysisRange{$_l_AnalysisIndex}
																								[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocationCodes{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="O"
																								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_SMIAddedToCSID{$_l_CreateIndex}
																								[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="OCA"
																								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																									$_l_CSRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									If ($_l_CSRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																									End if 
																								End if 
																								If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																									$_l_CSRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									If ($_l_CSRow<0)
																										APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																									End if 
																								End if 
																								
																								If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
																									STK_UpdateCalledOffQuantity(-[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
																								End if 
																							End if 
																						End for 
																						
																						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																						
																						
																					End if 
																				: ($_r_QuantityToDelete<0)
																					//TRACE
																			End case 
																			
																		End if 
																	End if 
																End for 
															End for 
															
														End if 
													: ($_ar_CSBeforeQuantities{$_l_CurrentStockRow}#0) & ($_r_QuantityToDelete<0) & ($_al_CSAllocatedTo{$_l_CurrentStockRow}#0) & ($_at_CSAfterType{$_l_DeletionIndex}="P")
														//TRACE//
														//add some stock P allocated
												End case 
												If ($_t_NoteAdd#"")
													$_t_Note:=$_t_Note+$_t_NoteAdd+Char:C90(13)
												End if 
											End if 
											
										End if 
										
										
									End for 
									For ($_l_DeletionIndex; 1; Size of array:C274($_al_CSBeforeIDS))
										If ($_at_CSBeforeType{$_l_DeletionIndex}="P") | ($_at_CSBeforeType{$_l_DeletionIndex}="O")
											$_l_CSIDRow:=Find in array:C230($_al_AfterID; $_al_CSBeforeIDS{$_l_DeletionIndex})
											If ($_l_CSIDRow<0)
												If ($_al_CSAllocatedTo{$_l_DeletionIndex}#0)
													//TRACE
												End if 
												$_t_NoteAdd:="Current stock Deleted "+"ID"+String:C10($_al_CSBeforeIDS{$_l_DeletionIndex})+" "+$_at_CSBeforeUniqueID{$_l_DeletionIndex}+" "+String:C10($_ar_CSBeforeQuantities{$_l_DeletionIndex})
												If ($_l_ApplicationType=4D Server:K5:6)
													//GOTO XY(0;0)
													//MESSAGE($_t_NoteAdd)
												End if 
												
												$_t_Note:=$_t_Note+$_t_NoteAdd+Char:C90(13)
												
												If (Not:C34($_bo_NoPstockChange)) | (Not:C34($_bo_NoOStockChange))
													$_r_Difference:=$_ar_CSBeforeQuantities{$_l_DeletionIndex}
													$_l_SelectedCSRecord:=0
													If ($_r_Difference#0)
														If (Not:C34($_bo_NoPstockChange)) | (Not:C34($_bo_NoOStockChange))
															//TRACE
															If ($_at_CSBeforeType{$_l_DeletionIndex}="P") & (Not:C34($_bo_NoPstockChange))
																If ($_r_SubtractPStock<0)
																	//TRACE
																	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ADJ")
																	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSBeforeIDS{$_l_DeletionIndex})
																	CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																	$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																	[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																	[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
																	[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
																	[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																	[STOCK_MOVEMENTS:40]Movement_Type:6:="ADJ"
																	[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																	[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																	[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																	[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																	SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																	$_r_Select:=$_r_Difference
																	If ($_r_SubtractPStock<0)
																		
																		CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																		[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																		[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
																		[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
																		[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
																		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99($_r_SubtractPStock)  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
																		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																		[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
																		[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-$_r_SubtractPStock
																		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																		[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="P"
																		[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
																		[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																		[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																		[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
																		[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="N"
																		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																		[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="ADJ"
																		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																			$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																			If ($_l_CurrentStockRow<0)
																				APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																			End if 
																		End if 
																		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																			$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																			If ($_l_CurrentStockRow<0)
																				APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																			End if 
																		End if 
																	End if 
																	$_r_SubtractPStock:=0
																	DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																End if 
																//```
																
																
															End if 
															If ($_at_CSBeforeType{$_l_DeletionIndex}="O") & (Not:C34($_bo_NoOStockChange)) & (False:C215)
																If ($_r_SubtractToStock<0)
																	
																	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSBeforeIDS{$_l_DeletionIndex})
																	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="PO")
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO")
																	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; <)
																	$_bo_IgnoreOStock:=False:C215
																	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<Current date:C33-120)
																		$_bo_IgnoreOStock:=True:C214
																	End if 
																	If (Not:C34($_bo_IgnoreOStock))
																		CREATE RECORD:C68([STOCK_MOVEMENTS:40])
																		$_l_AdjustmentsMade:=$_l_AdjustmentsMade+1
																		[STOCK_MOVEMENTS:40]Layer_Code:11:="A"
																		[STOCK_MOVEMENTS:40]Analysis_Code:9:=[CURRENT_STOCK:62]Analysis_Code:10
																		[STOCK_MOVEMENTS:40]Currency_Code:10:=[CURRENT_STOCK:62]Currency_Code:11
																		[STOCK_MOVEMENTS:40]Movement_Date:5:=Current date:C33(*)
																		[STOCK_MOVEMENTS:40]Movement_Type:6:="PO"
																		[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
																		[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
																		[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
																		[STOCK_MOVEMENTS:40]Posted_Date:7:=Current date:C33(*)
																		SAVE RECORD:C53([STOCK_MOVEMENTS:40])
																		
																		$_r_Select:=$_r_Difference
																		
																		If ($_r_SubtractToStock<0)
																			CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
																			[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
																			[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
																			[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
																			[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[CURRENT_STOCK:62]Item_Number:5
																			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_SubtractToStock  //$_ar_SMIResidualQuantities{$_l_CreateIndex}
																			[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
																			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
																			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
																			[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="O"
																			[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[CURRENT_STOCK:62]Currency_Code:11
																			[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=Current date:C33(*)
																			[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:="A"
																			[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[CURRENT_STOCK:62]Analysis_Code:10
																			[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
																			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="S"
																			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
																			[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:="PO"
																			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
																			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
																				$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																				If ($_l_CurrentStockRow<0)
																					APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
																				End if 
																			End if 
																			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																				$_l_CurrentStockRow:=Find in array:C230($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																				If ($_l_CurrentStockRow<0)
																					APPEND TO ARRAY:C911($_al_CSUpdatedIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
																				End if 
																			End if 
																		End if 
																		
																		DB_SaveRecord(->[STOCK_MOVEMENTS:40])
																	End if 
																	$_r_SubtractToStock:=0
																End if 
																//```
																
																
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End for 
									//```
									If ($_l_AdjustmentsMade>0)
										If (Size of array:C274($_al_CSUpdatedIDS)>0)
											QUERY WITH ARRAY:C644([CURRENT_STOCK:62]X_ID:13; $_al_CSUpdatedIDS)
										Else 
											QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
										End if 
										If ($_l_ApplicationType=4D Server:K5:6)
											GOTO XY:C161(0; 2)
											MESSAGE:C88("Rechecking current stock and stock levels for "+$_at_ProductCodes{$_l_UpdateProductsCount})
										End if 
										//ALL RECORDS([CURRENT STOCK])
										READ WRITE:C146([STOCK_LEVELS:58])
										COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "ALLCS")
										$_l_RecordsInSelectionMovementIt:=Records in selection:C76([CURRENT_STOCK:62])
										
										For ($_l_CopiedFromIndex; 1; $_l_RecordsInSelectionMovementIt)
											
											USE NAMED SELECTION:C332("ALLCS")
											GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CopiedFromIndex)
											If ($_l_ApplicationType=4D Server:K5:6)
												GOTO XY:C161(0; 3)
												MESSAGE:C88("Current stock  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" "+String:C10([CURRENT_STOCK:62]Quantity:4))
												
											End if 
											
											//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
											$_l_Retries:=0
											While (Not:C34(Check_Locked(->[CURRENT_STOCK:62]))) & (Not:C34(<>SYS_bo_QuitCalled))
												//GOTO XY(0;0)
												//MESSAGE("Waiting for record unlocked current stock"+String($_l_Retries))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(60*$_l_Retries)
											End while 
											//CLOSE WINDOW
											$_l_PreferenceID:=[CURRENT_STOCK:62]X_ID:13
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_PreferenceID)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
											$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_PreferenceID)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
											$_r_Sum2:=(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
											$_r_Net:=$_r_Sum-$_r_Sum2
											If ($_r_Net#[CURRENT_STOCK:62]Quantity:4)
												If ([CURRENT_STOCK:62]Quantity:4=0)
													[CURRENT_STOCK:62]Quantity:4:=$_r_Net
													[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
													If ($_l_ApplicationType=4D Server:K5:6)
														GOTO XY:C161(0; 4)
														MESSAGE:C88("Current stock(Set to)  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" "+String:C10([CURRENT_STOCK:62]Quantity:4))
													End if 
													SAVE RECORD:C53([CURRENT_STOCK:62])
													
													
												Else 
													[CURRENT_STOCK:62]Quantity:4:=$_r_Net
													[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
													If ($_l_ApplicationType=4D Server:K5:6)
														GOTO XY:C161(0; 4)
														MESSAGE:C88("Current stock(change to)  "+String:C10($_l_CopiedFromIndex)+" of "+String:C10($_l_RecordsInSelectionMovementIt)+[CURRENT_STOCK:62]UniqueConstruct:14+" "+String:C10([CURRENT_STOCK:62]Item_Number:5)+" "+String:C10([CURRENT_STOCK:62]Quantity:4))
													End if 
													SAVE RECORD:C53([CURRENT_STOCK:62])
												End if 
											End if 
											$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
											$_t_StockType:=[CURRENT_STOCK:62]Stock_Type:3
											$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
											$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
											$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
											$_t_StockUniqueReference:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10)
											//`Open window(20;Screen height-200;120;Screen height-100;-Palette window )
											$_l_Retries:=0
											While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
												//GOTO XY(0;0)
												//MESSAGE("Waiting for semaphore StockLevel"+$_t_productCode+String($_l_Retries))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(30*$_l_Retries)
											End while 
											//CLOSE WINDOW
											READ WRITE:C146([STOCK_LEVELS:58])
											If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
												QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=$_t_StockUniqueReference)
											Else 
												QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
											End if 
											
											//Open window(20;Screen height-200;120;Screen height-100;-Palette window )
											$_l_Retries:=0
											While (Not:C34(Check_Locked(->[STOCK_LEVELS:58])))
												//GOTO XY(0;0)
												//MESSAGE("Waiting for record lock Stock Level"+String($_l_Retries))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(30*$_l_Retries)
											End while 
											//CLOSE WINDOW
											If (Records in selection:C76([STOCK_LEVELS:58])=0)
												QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_productCode+"@"; *)
												If (<>StockAnal)
													QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType; *)
													QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
												Else 
													QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType)
												End if 
												$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
												
												If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
													If ($_l_CurrentMovementItemRecord>0)
														If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
															If ($_l_CurrentMovementItemRecord=1)
																If (([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode) & ([STOCK_LEVELS:58]Currency_Code:8#""))
																	REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
																End if 
															Else 
																QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
																QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
															End if 
														Else 
															If ($_l_CurrentMovementItemRecord=1)
																If ([STOCK_LEVELS:58]Currency_Code:8#$_t_CurrencyCode)
																	REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
																End if 
															Else 
																QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
															End if 
														End if 
														$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
													End if 
												End if 
												$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
												If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
													If ($_l_CurrentMovementItemRecord>0)
														If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
															If ($_l_CurrentMovementItemRecord=1)
																If (([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode) & ([STOCK_LEVELS:58]Layer_Code:9#""))
																	REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
																End if 
															Else 
																QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
																QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
															End if 
														Else 
															If ($_l_CurrentMovementItemRecord=1)
																If ([STOCK_LEVELS:58]Layer_Code:9#$_t_LayerCode)
																	REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
																End if 
															Else 
																QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
															End if 
														End if 
														$_l_CurrentMovementItemRecord:=Records in selection:C76([STOCK_LEVELS:58])
													End if 
												End if 
											End if 
											$_l_StockLevelID:=0
											Case of 
												: (Records in selection:C76([STOCK_LEVELS:58])=0)
													CREATE RECORD:C68([STOCK_LEVELS:58])
													[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
													[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
													If (<>StockAnal)
														[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
													End if 
													[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
													[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
													[STOCK_LEVELS:58]Free_Level:3:=0
													[STOCK_LEVELS:58]Free_Cost:5:=0
													[STOCK_LEVELS:58]Allocated_Level:4:=0
													[STOCK_LEVELS:58]Allocated_Cost:6:=0
													[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
													$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
													SAVE RECORD:C53([STOCK_LEVELS:58])
													STK_ValidateLevel
													AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
												: (Records in selection:C76([STOCK_LEVELS:58])>1)
													DELETE SELECTION:C66([STOCK_LEVELS:58])
													CREATE RECORD:C68([STOCK_LEVELS:58])
													[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
													[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
													If (<>StockAnal)
														[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
													End if 
													[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
													[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
													[STOCK_LEVELS:58]Free_Level:3:=0
													[STOCK_LEVELS:58]Free_Cost:5:=0
													[STOCK_LEVELS:58]Allocated_Level:4:=0
													[STOCK_LEVELS:58]Allocated_Cost:6:=0
													[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
													SAVE RECORD:C53([STOCK_LEVELS:58])
													STK_ValidateLevel
													$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
													AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
													
												Else 
													$_l_StockLevelID:=[STOCK_LEVELS:58]X_ID:10
													STK_ValidateLevel
													SAVE RECORD:C53([STOCK_LEVELS:58])
											End case 
											UNLOAD RECORD:C212([STOCK_LEVELS:58])
											
											CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
											USE NAMED SELECTION:C332("ALLCS")
											GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CopiedFromIndex)
											[CURRENT_STOCK:62]x_Stock_Level_ID:15:=$_l_StockLevelID
											SAVE RECORD:C53([CURRENT_STOCK:62])
										End for 
										READ WRITE:C146([STOCK_LEVELS:58])
										QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
										APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_ValidateLevel)
									End if 
								End if 
								
								//`````
								QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Stock_Type:2; $_at_StockLevelsBeforeType; [STOCK_LEVELS:58]UniqueConstruct:11; $_at_StockLevelBeforeInfo; [STOCK_LEVELS:58]Free_Level:3; $_ar_StockLEvelsBeforeFree; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_StockLEvelsBeforeAllocated; [STOCK_LEVELS:58]X_ID:10; $_al_StockLevelsBeforeIDS; [STOCK_LEVELS:58]Stock_Type:2; $_at_StockLevelsTypes)
								$_ti_DocumentRef:=Append document:C265($_t_DocumentPath+"StockChanges2011.txt")
								If (Records in selection:C76([STOCK_LEVELS:58])>0)
									CREATE SET:C116([STOCK_LEVELS:58]; "$_1")
									$_t_Packet:=""
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="S")
									
									$_t_Packet:=Char:C90(13)+"Product:-after Update"+Char:C90(9)+$_at_ProductCodes{$_l_UpdateProductsCount}+Char:C90(13)
									$_t_Packet:=$_t_Packet+"STOCK LEVELS AFTER"+Char:C90(13)+Char:C90(9)+"Stock Type"+Char:C90(9)+"Free Qty"+Char:C90(9)+"Free Value"+Char:C90(9)+"Allocated Qty"+Char:C90(9)+"Allocated Value"+Char:C90(9)+"Record ID"+Char:C90(9)+"Combined info"+Char:C90(13)
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
										NEXT RECORD:C51([STOCK_LEVELS:58])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="O")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
										NEXT RECORD:C51([STOCK_LEVELS:58])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="P")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
										NEXT RECORD:C51([STOCK_LEVELS:58])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2="C")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
										NEXT RECORD:C51([STOCK_LEVELS:58])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"C")
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"P")
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"O")
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2#"S")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(9)+String:C10([STOCK_LEVELS:58]X_ID:10)+Char:C90(9)+[STOCK_LEVELS:58]UniqueConstruct:11+Char:C90(13)
										NEXT RECORD:C51([STOCK_LEVELS:58])
									End for 
								End if 
								$_r_TotalPFreeAfter:=0
								$_r_TotalPAllocatedAfter:=0
								$_r_TotoalOAfter:=0
								
								$_t_Packet:=$_t_Packet+Char:C90(13)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								$_t_Packet:=$_t_Packet+"CURRENT STOCK AFTER"+Char:C90(13)+Char:C90(9)+"Stock Type"+Char:C90(9)+"Qty"+Char:C90(9)+"Unit Cost"+Char:C90(9)+"Record ID"+Char:C90(9)+"Combined info"+Char:C90(9)+"Sales order item"+Char:C90(13)
								If (Records in selection:C76([CURRENT_STOCK:62])>0)
									CREATE SET:C116([CURRENT_STOCK:62]; "$_1")
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="S")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
										NEXT RECORD:C51([CURRENT_STOCK:62])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
										If ([CURRENT_STOCK:62]Quantity:4>0)
											$_r_TotoalOAfter:=$_r_TotoalOAfter+[CURRENT_STOCK:62]Quantity:4
										End if 
										$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
										NEXT RECORD:C51([CURRENT_STOCK:62])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
										If ([CURRENT_STOCK:62]Item_Number:5#0)
											If ([CURRENT_STOCK:62]Quantity:4>0)
												$_r_TotalPAllocatedAfter:=$_r_TotalPAllocatedAfter+[CURRENT_STOCK:62]Quantity:4
											End if 
										Else 
											If ([CURRENT_STOCK:62]Quantity:4>0)
												$_r_TotalPFreeAfter:=$_r_TotalPFreeAfter+[CURRENT_STOCK:62]Quantity:4
											End if 
										End if 
										$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
										NEXT RECORD:C51([CURRENT_STOCK:62])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="C")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
										NEXT RECORD:C51([CURRENT_STOCK:62])
									End for 
									USE SET:C118("$_1")
									$_t_Packet:=$_t_Packet+Char:C90(13)
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"C")
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"P")
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"O")
									QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3#"S")
									For ($_l_CopiedFromIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
										$_t_Packet:=$_t_Packet+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]X_ID:13)+Char:C90(9)+[CURRENT_STOCK:62]UniqueConstruct:14+Char:C90(9)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13)
										NEXT RECORD:C51([CURRENT_STOCK:62])
									End for 
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(13)+$_t_Packet)
								End if 
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(13)+"Expected P  stock="+String:C10($_r_TotalPFreeAfter)+" Free "+String:C10($_r_TotalPAllocatedAfter)+" Allocated"+Char:C90(13)+"Expected 0 stock="+String:C10($_r_TotoalOAfter)+Char:C90(13))
								
								If (False:C215)
									// //////
									If ($_t_Note#"") & (($_r_TotalPFreeAfter#$_r_TotalPFreeBefore) | ($_r_TotalPAllocatedAfter#$_r_TotalPAllocatedBefore) | ($_r_TotoalOAfter#$_r_TotoalOBefore))
										
										
										Case of   //Sender Address
											: (<>Per_at_PersonnelNames_EmailFrom#"")
												$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
											: (<>DB_t_UserGrEmailSMTP#"")
												$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
											Else 
												$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
										End case 
										If (<>Email_bo_Enabled)
											While (Semaphore:C143("InitEmail"))
												DelayTicks(2)
											End while 
											If (<>Email_bo_PersonInited=False:C215)
												LOGIN_SetEmail
											End if 
											CLEAR SEMAPHORE:C144("InitEmail")
											
											EMAIL_t_EmailType:="To"  //
											
											$_t_EmailSentTo:="To"
											$_t_EmailAttachment:=""
											$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Stock Update Message"; ->$_t_EmailAttachment; ->$_t_Note; False:C215)  //added 04/04/08 -kmw
											
										End if 
									End if 
								End if 
								CLOSE DOCUMENT:C267($_ti_DocumentRef)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
								If (Records in selection:C76([CURRENT_STOCK:62])=1)
									$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
								Else 
									$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								End if 
								If ($_r_CurrentStockFree#$_r_CurrentStockQuantity)
									//TRACE
								End if 
								READ WRITE:C146([CUSTOM_FIELDS:98])
								$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
								$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
								If ($_t_FurthFieldUniqueCode#"")
									READ WRITE:C146([CUSTOM_FIELDS:98])
									QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
									QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Post Conversion Qty")
									If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									Else 
										READ WRITE:C146([CUSTOM_FIELDS:98])
										//If the Further Field records were not attached, create them
										CREATE RECORD:C68([CUSTOM_FIELDS:98])
										[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
										[CUSTOM_FIELDS:98]Field_Name:3:="Post Conversion Qty"
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									End if 
									
								End if 
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5#0)
								If (Records in selection:C76([CURRENT_STOCK:62])=1)
									$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
								Else 
									$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								End if 
								If ($_r_CurrAPStockQty#$_r_CurrentStockQuantity)
									//TRACE
								End if 
								READ WRITE:C146([CUSTOM_FIELDS:98])
								$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
								$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
								If ($_t_FurthFieldUniqueCode#"")
									READ WRITE:C146([CUSTOM_FIELDS:98])
									QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
									QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Post Conv Alloc Qty")
									If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									Else 
										READ WRITE:C146([CUSTOM_FIELDS:98])
										//If the Further Field records were not attached, create them
										CREATE RECORD:C68([CUSTOM_FIELDS:98])
										[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
										[CUSTOM_FIELDS:98]Field_Name:3:="Post Conv Alloc Qty"
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									End if 
									
								End if 
								//``
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O")
								
								If (Records in selection:C76([CURRENT_STOCK:62])=1)
									$_r_CurrentStockQuantity:=[CURRENT_STOCK:62]Quantity:4
								Else 
									$_r_CurrentStockQuantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								End if 
								If ($_r_CurrOStockQty#$_r_CurrentStockQuantity)
									//TRACE
								End if 
								READ WRITE:C146([CUSTOM_FIELDS:98])
								$_l_ProductsTableNumber:=Table:C252(->[PRODUCTS:9])
								$_t_FurthFieldUniqueCode:=STR_LeadZeros(String:C10($_l_ProductsTableNumber); 3)+$_at_ProductCodes{$_l_UpdateProductsCount}
								If ($_t_FurthFieldUniqueCode#"")
									READ WRITE:C146([CUSTOM_FIELDS:98])
									QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_FurthFieldUniqueCode; *)
									QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3="Post-Conv O Qty")
									If (Records in selection:C76([CUSTOM_FIELDS:98])=1)
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									Else 
										READ WRITE:C146([CUSTOM_FIELDS:98])
										//If the Further Field records were not attached, create them
										CREATE RECORD:C68([CUSTOM_FIELDS:98])
										[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_FurthFieldUniqueCode
										[CUSTOM_FIELDS:98]Field_Name:3:="Post-Conv O Qty"
										[CUSTOM_FIELDS:98]Real_or_Integer:5:=$_r_CurrentStockQuantity
										SAVE RECORD:C53([CUSTOM_FIELDS:98])
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									End if 
									
								End if 
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount})
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_UpdateProductsCount}; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="O"; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0; *)
								
								$_l_EightMonths:=Int:C8(365/80)
								$_d_EightMonthsAgo:=Current date:C33-$_l_EightMonths
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26<$_d_EightMonthsAgo)
								
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									$_bo_IsDocument:=(Test path name:C476($_t_DocumentPath+"LongOnOrder.txt")=Is a document:K24:1)
									If (Not:C34($_bo_IsDocument))
										$_ti_DocumentRef:=Create document:C266($_t_DocumentPath+"LongOnOrder.txt")
										CLOSE DOCUMENT:C267($_ti_DocumentRef)
									End if 
									$_ti_DocumentRef:=Append document:C265($_t_DocumentPath+"LongOnOrder.txt")
									For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										SEND PACKET:C103($_ti_DocumentRef; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(13))
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
										
									End for 
									CLOSE DOCUMENT:C267($_ti_DocumentRef)
								End if 
								If (Not:C34($_bo_ReportToday))
									If (Current time:C178>=?07:00:00?)
										
										QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
										CREATE SET:C116([PRODUCTS:9]; "SIReported2")
										LOAD SET:C185([PRODUCTS:9]; "SIReported"; "SIReported")
										DIFFERENCE:C122("SIReported2"; "SIReported"; "SIReported")
										SAVE SET:C184("SIReported2"; "SIReported")
										USE SET:C118("SIreported")
										SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_UpdatedProductCodes)
										QUERY WITH ARRAY:C644([STOCK_LEVELS:58]Product_Code:1; $_at_UpdatedProductCodes)
										ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1; >)
										$_bo_IsDocument:=(Test path name:C476($_t_DocumentPath+"StockDailyLog.txt")=Is a document:K24:1)
										If (Not:C34($_bo_IsDocument))
											$_ti_DocumentRef:=Create document:C266($_t_DocumentPath+"StockDailyLog.txt")
											CLOSE DOCUMENT:C267($_ti_DocumentRef)
										End if 
										$_ti_DocumentRef:=Append document:C265($_t_DocumentPath+"StockDailyLog.txt")
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(13)+String:C10(Current date:C33(*))+" "+String:C10(Current time:C178(*))+Char:C90(13))
										SEND PACKET:C103($_ti_DocumentRef; "Product Code"+Char:C90(9)+"Stock Type"+Char:C90(9)+"Free Level"+Char:C90(9)+"Free Value"+Char:C90(9)+"Allocated Level"+Char:C90(9)+"Allocated Cost")
										For ($_l_StockLevelIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
											If ([STOCK_LEVELS:58]Stock_Type:2="P") | ([STOCK_LEVELS:58]Stock_Type:2="O")
												SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Product_Code:1+Char:C90(9)+[STOCK_LEVELS:58]Stock_Type:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(13))
											End if 
											NEXT RECORD:C51([STOCK_LEVELS:58])
											
										End for 
										CLOSE DOCUMENT:C267($_ti_DocumentRef)
										$_bo_ReportToday:=True:C214
									End if 
								Else 
									If (Current time:C178(*)<?07:00:00?)
										$_bo_ReportToday:=False:C215
									End if 
								End if 
								If (Application type:C494=4D Remote mode:K5:5)
									GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorkingClient; <>Stk_bo_PauseWorkingClient)
									GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorking; <>Stk_bo_PauseWorking)
									GET PROCESS VARIABLE:C371(-1; <>Stk_bo_Pause; <>Stk_bo_Pause)
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[CURRENT_STOCK:62])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[STOCK_LEVELS:58])
								
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
								If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
								End if 
								If (<>Stk_bo_Pause)
									$_l_PauseCount:=0
									Repeat 
										$_l_PauseCount:=$_l_PauseCount+1
										DelayTicks(60*60)
										GET PROCESS VARIABLE:C371(-1; <>Stk_bo_Pause; <>Stk_bo_Pause)
										If ($_l_ApplicationType=4D Server:K5:6)
											//GOTO XY(0;0)
											//MESSAGE("Process Paused "+String($_l_PauseCount))
										End if 
									Until (Not:C34(<>Stk_bo_Pause)) | ((<>SYS_bo_QuitCalled))
								End if 
								If (<>Stk_bo_PauseWorking)
									$_l_PauseCount:=0
									While ((Day number:C114(Current date:C33(*))#1) & (Day number:C114(Current date:C33(*))#7)) & ((Current time:C178(*)>?08:00:00?) & (Current time:C178(*)<?18:30:00?)) & (<>Stk_bo_PauseWorking) & (Not:C34(<>SYS_bo_QuitCalled))
										If (Application type:C494#4D Remote mode:K5:5)
											$_l_PauseCount:=$_l_PauseCount+1
											DelayTicks(60*60)
											GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorking; <>Stk_bo_PauseWorking)
											If ($_l_ApplicationType=4D Server:K5:6)
												GOTO XY:C161(0; 0)
												//MESSAGE("Process Paused "+String($_l_PauseCount))
											End if 
										End if 
									End while 
								End if 
								If (<>Stk_bo_PauseWorkingClient)
									If (Application type:C494=4D Remote mode:K5:5)
										$_l_PauseCount:=0
										While ((Day number:C114(Current date:C33(*))#1) & (Day number:C114(Current date:C33(*))#7)) & ((Current time:C178(*)>?08:00:00?) & (Current time:C178(*)<?18:30:00?)) & (<>Stk_bo_PauseWorkingClient) & (Not:C34(<>SYS_bo_QuitCalled))
											
											$_l_PauseCount:=$_l_PauseCount+1
											DelayTicks(60*60)
											GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorkingClient; <>Stk_bo_PauseWorkingClient)
											If ($_l_ApplicationType=4D Server:K5:6)
												GOTO XY:C161(0; 0)
												//MESSAGE("Process Paused "+String($_l_PauseCount))
											End if 
										End while 
									End if 
								End if 
							End if 
						Else 
							//CANCEL TRANSACTION
							$_l_UpdateProductsCount:=Size of array:C274($_at_ProductCodes)
						End if 
					End for 
					If (Count parameters:C259=1)
						$_bo_Complete:=True:C214
					End if 
					
				Until ($_bo_Complete) | ((<>SYS_bo_QuitCalled))  // | ($_l_ApplicationType=4D Remote Mode )
				If (Count parameters:C259=0) & ($_bo_Complete) & (Not:C34(<>SYS_bo_QuitCalled))
					
					READ WRITE:C146([PREFERENCES:116])
					$_l_PreferenceID:=PREF_GetPreferenceID("Stock Upate Preferences")
					ST_bo_conversionCompleted:=False:C215
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						
					Else 
						$_l_offset:=0
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; STK_d_StartDate; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ST_bo_conversionCompleted; $_l_offset)
						End if 
						ST_bo_conversionCompleted:=True:C214
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215)
						If (Records in selection:C76([PRODUCTS:9])>0)
							ST_bo_conversionCompleted:=False:C215
						End if 
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						VARIABLE TO BLOB:C532(STK_d_StartDate; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(ST_bo_conversionCompleted; [PREFERENCES:116]DataBlob:2; *)
						SAVE RECORD:C53([PREFERENCES:116])
						
					End if 
				End if 
				
				If (Not:C34(<>SYS_bo_QuitCalled))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39=True:C214)
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$_l_CheckMovementItemID")
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
					$_l_MovementItemRecords:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					
					For ($_l_CopiedFromIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						USE NAMED SELECTION:C332("$_l_CheckMovementItemID")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CopiedFromIndex)
						$_t_MovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
						$_t_TakeFromTypeShouldBe:=[MOVEMENT_TYPES:60]Stock_Plus:3
						$_t_AddToTypesShouldBe:=[MOVEMENT_TYPES:60]Stock_Minus:4
						$_l_MovementItemIDCopiedFrom:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
						$_bo_Edit:=False:C215
						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#$_t_AddToTypesShouldBe)
							//MESSAGE("Edit"+[STOCK ITEMS]xAddToStockType+String($_l_CopiedFromIndex))
							$_bo_Edit:=True:C214
							[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=$_t_AddToTypesShouldBe
							[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
							
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_TakeFromTypeShouldBe)
							//MESSAGE("Edit"+[STOCK ITEMS]xTakeFromStockType+String($_l_CopiedFromIndex))
							
							$_bo_Edit:=True:C214
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=$_t_TakeFromTypeShouldBe
							[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
							[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						End if 
						$_l_CheckMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						If ($_bo_Edit)
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							If ($_l_MovementItemIDCopiedFrom>0)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_MovementItemIDCopiedFrom)
								APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
							End if 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CheckMovementItemID)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								//APPLY TO SELECTION([STOCK ITEMS];)
								For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
								End for 
							End if 
						End if 
						
					End for 
				End if 
			End if 
			SET DATABASE PARAMETER:C642(28; 1)
			SET DATABASE PARAMETER:C642(45; 1)
			
		End if 
		<>DB_bo_HoldPS:=False:C215
		If (Application type:C494#4D Remote mode:K5:5)
			$_l_Process:=New process:C317("STK_InTesting"; 180000; "Verify Stock"; *)
		End if 
	Else 
		If (False:C215)
			READ WRITE:C146([PRODUCTS:9])
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=False:C215)
			APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59:=True:C214)
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26>=!2011-08-01!)
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$s2")
			$_l_RecordsInSelectionMovementIt:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			For ($_l_ItemIndex; 1; $_l_RecordsInSelectionMovementIt)
				USE NAMED SELECTION:C332("$s2")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_ItemIndex)
				
				//Open window(20;Screen height-200;120;Screen height-100;-Palette window )
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]))) & (Not:C34(<>SYS_bo_QuitCalled))
					//GOTO XY(0;0)
					//MESSAGE("Waiting for record lock Stock item"+String($_l_Retries))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(30*$_l_Retries)
				End while 
				//CLOSE WINDOW
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			End for 
			READ WRITE:C146([STOCK_LEVELS:58])
			ALL RECORDS:C47([STOCK_LEVELS:58])
			STK_MenuUpdate
		Else 
			//AA_JUNKET
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_Manage2011Updates"; $_t_oldMethodName)
