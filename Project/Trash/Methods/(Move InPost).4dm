//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move InPost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 20:41`Method: Move InPost
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_STIMovementDate; 0)
	ARRAY LONGINT:C221($_al_STIItemNumber; 0)
	ARRAY LONGINT:C221($_al_STIStockNumber; 0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY REAL:C219($_ar_STStockCostPrice; 0)
	ARRAY REAL:C219($_ar_STStockQuantity; 0)
	//ARRAY REAL(STK_ar_AllocatedCost;0)
	//ARRAY REAL(STK_ar_LevelAllocated;0)
	//ARRAY REAL(STK_ar_LevelFree;0)
	//ARRAY REAL(STK_ar_LevelFreeCost;0)
	//ARRAY REAL(STKL_ar_StockAllocatedCost;0)
	//ARRAY REAL(STKL_ar_StockAllocatedQuantity;0)
	//ARRAY REAL(STKL_ar_StockFreeCost;0)
	//ARRAY REAL(STKL_ar_StockFreeQuantity;0)
	ARRAY TEXT:C222($_at_STIAnalysisCode; 0)
	ARRAY TEXT:C222($_at_STICompanyTo; 0)
	ARRAY TEXT:C222($_at_STICurrency; 0)
	ARRAY TEXT:C222($_at_STILayerCode; 0)
	ARRAY TEXT:C222($_at_STIProductCodes; 0)
	ARRAY TEXT:C222($_at_STISerialNumbers; 0)
	ARRAY TEXT:C222($_at_STStockLocation; 0)
	ARRAY TEXT:C222($_at_TKPostHeadersAnalysisRange; 0)
	ARRAY TEXT:C222($_at_TKPostHeadersCurrenciesRang; 0)
	ARRAY TEXT:C222($_at_TKPostHeadersLayersRange; 0)
	//ARRAY TEXT(STK_at_LevelsProductCode;0)
	//ARRAY TEXT(STK_at_LevelstoPost;0)
	//ARRAY TEXT(STKL_at_StockLevelident;0)
	C_BOOLEAN:C305(<>StockAnal; <>SYS_bo_CurrentWindowModal; <>TrackStockposting; $_bo_HideStockMessages; $_bo_MovementSerialUnique; $_bo_Saved; $_bo_ShowProgress; $_bo_UseAnalysisCodes; $3; STK_bo_InvertTransactionType; STK_bo_LevelsArraysInited)
	C_BOOLEAN:C305(STK_bo_ReversedPosting; WIN_bo_TrackerInited)
	C_DATE:C307($_d_MovementDate)
	C_LONGINT:C283(<>ReserveIDs; $_l_AnalysisRow; $_l_CUrrencyRow; $_l_Index; $_l_LayersRow; $_l_LevelsToPost; $_l_NumberofStockLevelRecords; $_l_PostIndex; $_l_Postindex1; $_l_Postindex2; $_l_PostIndex3)
	C_LONGINT:C283($_l_PostIndex4; $_l_ReserveIDS; $_l_WindowReferenceRow; $_l_WIndowRow; Vadd; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_StockMovementTotalCost)
	C_TEXT:C284(<>StockAss; <>SYS_t_BaseCurrency; $_t_AccountingPeriod; $_t_AnalysisCode; $_t_CheckMovementType; $_t_Currency; $_t_CurrencyCode; $_t_CurrentFormUsage; $_t_ExtractAnalysisCode; $_t_ExtractCUrrencyCode; $_t_ExtractLayerCode)
	C_TEXT:C284($_t_ExtractProductCode; $_t_ExtractStockTypeCode; $_t_Layer; $_t_LayerCode; $_t_MovementCompanyFrom; $_t_MovementType; $_t_MovementTypeCode; $_t_MovementTypeNumberName; $_t_MovementTypesNo; $_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract)
	C_TEXT:C284($_t_MovementTypeStockSubtract2; $_t_MovementTypesTransCode; $_t_oldMethodName; $_t_ProductCode; $_t_StockMovementCode; $_t_Type; $1; $2; $4; $5)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Move InPost")

If (Count parameters:C259>=1)
	$_t_StockMovementCode:=$1
	$_t_MovementTypeCode:=$2
	If ([STOCK_MOVEMENTS:40]Movement_Code:1#$_t_StockMovementCode)
		
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_t_StockMovementCode)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_StockMovementCode)
	End if 
	If (Count parameters:C259>=2)
		If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementTypeCode)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementTypeCode)
		End if 
	End if 
Else 
	$_t_StockMovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
End if 
//Move InPost
If (Count parameters:C259>=3)
	$_bo_ShowProgress:=$3
Else 
	If (Application type:C494#4D Server:K5:6)
		
		$_bo_ShowProgress:=True:C214
	Else 
		$_bo_ShowProgress:=False:C215
	End if 
End if 
If (Count parameters:C259>=4)
	$_t_CurrentFormUsage:=$4
Else 
	$_t_CurrentFormUsage:=""
End if 
If (Count parameters:C259>=5)
	$_t_AccountingPeriod:=$5
Else 
	$_t_AccountingPeriod:=""
End if 
$_t_CheckMovementType:=Move_InTypeChk
If ($_t_CheckMovementType="")
	<>SYS_bo_CurrentWindowModal:=True:C214
	Vadd:=0
	
	$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
	$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
	$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
	$_d_MovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
	$_r_StockMovementTotalCost:=[STOCK_MOVEMENTS:40]Total_Cost:8
	$_t_MovementTypesNo:=[STOCK_MOVEMENTS:40]Type_Number:4
	$_t_MovementCompanyFrom:=[STOCK_MOVEMENTS:40]Company_From:2
	
	$_t_MovementType:=[MOVEMENT_TYPES:60]Type_Code:1
	$_bo_MovementSerialUnique:=[MOVEMENT_TYPES:60]Serial_Unique:19
	$_t_MovementTypeNumberName:=[MOVEMENT_TYPES:60]Number_Name:5
	$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
	$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
	$_t_MovementTypesTransCode:=[MOVEMENT_TYPES:60]Trans_Code:17
	
	If (Application type:C494#4D Server:K5:6) & ($_bo_ShowProgress)
		
		Open_AnyTypeWindow(200; 340; 5; Term_NLWT("Stock Posting"))
		$_bo_HideStockMessages:=False:C215
	Else 
		$_bo_HideStockMessages:=True:C214
	End if 
	If (Not:C34($_bo_HideStockMessages))
		MESSAGE:C88(Char:C90(13)+"   Processing Movement No "+[STOCK_MOVEMENTS:40]Movement_Code:1+Char:C90(13))
		MESSAGE:C88("   "+$_t_MovementTypeNumberName+" "+[STOCK_MOVEMENTS:40]Type_Number:4+Char:C90(13))
	End if 
	$_bo_UseAnalysisCodes:=((<>StockAnal) | (DB_GetModuleSettingByNUM(Module_MultiCurrency)>0) | (DB_GetModuleSettingByNUM(Module_MultiLayer)>0))
	
	READ WRITE:C146([ORDER_ITEMS:25])
	READ WRITE:C146([ORDERS:24])
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	ARRAY TEXT:C222($_at_STIProductCodes; 0)
	ARRAY TEXT:C222($_at_STISerialNumbers; 0)
	ARRAY TEXT:C222($_at_STICompanyTo; 0)
	ARRAY LONGINT:C221($_al_STIStockNumber; 0)
	ARRAY LONGINT:C221($_al_STIItemNumber; 0)
	ARRAY TEXT:C222($_at_STStockLocation; 0)
	ARRAY REAL:C219($_ar_STStockCostPrice; 0)
	ARRAY REAL:C219($_ar_STStockQuantity; 0)
	
	//$_l_ReserveIDS:=(AA_GetNextIDinMethod (->[CURRENT STOCK]XREC_ID;-Records in selection([STOCK ITEMS]);False))-Records in selection([STOCK ITEMS])
	If (STK_bo_ReversedPosting)
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_STIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_STISerialNumbers; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; $_at_STICompanyTo; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9; $_al_STIStockNumber; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_STIItemNumber; [STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34; $_at_STStockLocation; [STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; $_ar_STStockCostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_STStockQuantity)
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42; $_at_STIAnalysisCode; [STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41; $_at_STILayerCode; [STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36; $_at_STICurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_STIMovementDate)
		
	Else 
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_STIProductCodes; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_STISerialNumbers; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; $_at_STICompanyTo; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9; $_al_STIStockNumber; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_STIItemNumber; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_STStockLocation; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_STStockCostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_STStockQuantity)
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; $_at_STIAnalysisCode; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_at_STILayerCode; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_STICurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_STIMovementDate)
		
	End if 
	For ($_l_PostIndex; 1; Size of array:C274($_at_STIProductCodes))
		While (Semaphore:C143("StockLevel"+$_at_STIProductCodes{$_l_PostIndex}))  //Prevent any other process from creating the same stock level-not this could set a LOT of semahores
			
			DelayTicks(2)
		End while 
		//While ((Not(End selection([STOCK ITEMS]))) & (OK=1))
		If ($_at_STIProductCodes{$_l_PostIndex}#"")
			If (Not:C34($_bo_HideStockMessages))
				MESSAGE:C88(Char:C90(13)+"   "+$_at_STIProductCodes{$_l_PostIndex}+" "+$_at_STISerialNumbers{$_l_PostIndex})
			End if 
			$_t_AnalysisCode:="NONE"
			$_t_Currency:="NONE"
			$_t_Layer:="NONE"
			//$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
			//Hav e to pass vMod3 to post item and DB_t_CurrentFormUsage to post item
			//need to pass some stock movement values-check StockCurr_ACLSr
			If (Not:C34(STK_IsProductAnalysed($_at_STIProductCodes{$_l_PostIndex})))
				Case of 
						
					: ($_at_STICompanyTo{$_l_PostIndex}="*PLUS")
						$_t_MovementTypeStockSubtract2:=""
						STK_MovePostItem(->$_t_MovementTypeStockAdd; 1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
						//Move_PostItem (->[MOVEMENT TYPES]Stock Plus;1)
						If (<>TrackStockposting)
							STK_PostTracker("Stock Item to is •Plus")
						End if 
					: ($_at_STICompanyTo{$_l_PostIndex}="*MINUS")
						If (<>StockAss#"")
							$_t_MovementTypeStockSubtract2:=""
							STK_MovePostItem(-><>StockAss; 1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
							
							//Move_PostItem (->z◊StockAss;1)
							If (<>TrackStockposting)
								STK_PostTracker("Stock Item to is an assembly")
							End if 
						End if 
						$_t_MovementTypeStockSubtract2:=""
						STK_MovePostItem(->$_t_MovementTypeStockSubtract; -1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
						
						//Move_PostItem (->$_t_MovementTypeStockSubtract;-1)
						If (<>TrackStockposting)
							STK_PostTracker("Stock Item to is •minus")
						End if 
					: ($_at_STICompanyTo{$_l_PostIndex}="-PLUS")
						If (<>StockAss#"")
							$_t_MovementTypeStockSubtract2:="'"
							STK_MovePostItem(-><>StockAss; -1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
							
							//Move_PostItem (->◊StockAss;-1)
							If (<>TrackStockposting)
								STK_PostTracker("Stock Item to is assembly")
							End if 
						End if 
						$_t_MovementTypeStockSubtract2:=""
						STK_MovePostItem(->$_t_MovementTypeStockAdd; 1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
						//Move_PostItem (->[MOVEMENT TYPES]Stock Plus;1)
						If (<>TrackStockposting)
							STK_PostTracker("Stock Item to is -plus")
						End if 
					: ($_at_STICompanyTo{$_l_PostIndex}="-MINUS")
						$_t_MovementTypeStockSubtract2:=""
						STK_MovePostItem(->$_t_MovementTypeStockAdd; -1; ->$_t_MovementTypeStockSubtract2; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
						//Move_PostItem (->[MOVEMENT TYPES]Stock Plus;-1)
						If (<>TrackStockposting)
							STK_PostTracker("Stock Item to is -minus")
						End if 
					Else 
						
						If ($_ar_STStockQuantity{$_l_PostIndex}<0)  //post backwards if negative
							
							If ($_t_MovementTypeStockAdd#"")
								
								STK_MovePostItem(->$_t_MovementTypeStockAdd; -1; ->$_t_MovementTypeStockSubtract; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
								
								//Move_PostItem (->[MOVEMENT TYPES]Stock Plus;-1;->[MOVEMENT TYPES]Stock Minus)  `incl if want to make negative do an unallocate
								If (<>TrackStockposting)
									STK_PostTracker("Plus  is"+[MOVEMENT_TYPES:60]Stock_Plus:3)
								End if 
							End if 
							
							If ($_t_MovementTypeStockSubtract#"") & ($_t_MovementTypeStockSubtract#$_t_MovementTypeStockAdd)
								STK_MovePostItem(->$_t_MovementTypeStockSubtract; 1; ->$_t_MovementTypeStockAdd; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
								
								//Move_PostItem (->[MOVEMENT TYPES]Stock Minus;1;->[MOVEMENT TYPES]Stock Plus)
								If (<>TrackStockposting)
									STK_PostTracker("minus  is"+[MOVEMENT_TYPES:60]Stock_Minus:4)
								End if 
							Else 
								If (<>TrackStockposting)
									If ([MOVEMENT_TYPES:60]Stock_Minus:4#"")
										STK_PostTracker("Plus and minus are the same so only do the negative plus")
									Else 
										STK_PostTracker("minus  is nothing")
									End if 
								End if 
							End if 
						Else 
							If ($_t_MovementTypeStockSubtract#"") & ($_t_MovementTypeStockSubtract#$_t_MovementTypeStockAdd)
								STK_MovePostItem(->$_t_MovementTypeStockSubtract; -1; ->$_t_MovementTypeStockAdd; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
								
								//Move_PostItem (->[MOVEMENT TYPES]Stock Minus;-1;->[MOVEMENT TYPES]Stock Plus)
								If (<>TrackStockposting)
									STK_PostTracker("Minus  is"+$_t_MovementTypeStockSubtract)
								End if 
							End if 
							If ($_t_MovementTypeStockAdd#"")
								STK_MovePostItem(->$_t_MovementTypeStockAdd; 1; ->$_t_MovementTypeStockSubtract; $_d_MovementDate; $_bo_MovementSerialUnique; $_bo_UseAnalysisCodes; $_t_CurrentFormUsage; $_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode; $_al_STIStockNumber{$_l_PostIndex}; $_at_STIProductCodes{$_l_PostIndex}; $_at_STISerialNumbers{$_l_PostIndex}; $_al_STIItemNumber{$_l_PostIndex}; $_at_STStockLocation{$_l_PostIndex}; $_ar_STStockCostPrice{$_l_PostIndex}; $_ar_STStockQuantity{$_l_PostIndex})
								
								//Move_PostItem (->[MOVEMENT TYPES]Stock Plus;1;->[MOVEMENT TYPES]Stock Minus)
								If (<>TrackStockposting)
									STK_PostTracker("Plus  is"+[MOVEMENT_TYPES:60]Stock_Plus:3)
								End if 
							End if 
						End if 
						
				End case 
			End if 
		Else 
			
		End if 
		//NEXT RECORD([STOCK ITEMS])
		//$_l_ReserveIDS:=$_l_ReserveIDS+1
		//End while
	End for 
	//TRACE
	
	<>ReserveIDs:=0
	If (Not:C34(STK_bo_LevelsArraysInited))
		ARRAY TEXT:C222(STK_at_LevelstoPost; 0)
		ARRAY TEXT:C222(STK_at_LevelsProductCode; 0)
		
		ARRAY REAL:C219(STK_ar_LevelFree; 0)
		ARRAY REAL:C219(STK_ar_LevelFreeCost; 0)
		ARRAY REAL:C219(STK_ar_LevelAllocated; 0)
		ARRAY REAL:C219(STK_ar_AllocatedCost; 0)
		STK_bo_LevelsArraysInited:=True:C214
	End if 
	
	
	$_l_ReserveIDS:=0
	
	If (OK=1) & (Not:C34(STK_IsProductAnalysed(STK_at_LevelsProductCode{$_l_Index})))
		$_l_LevelsToPost:=Size of array:C274(STK_at_LevelstoPost)
		If ($_l_LevelsToPost>0)
			READ WRITE:C146([STOCK_LEVELS:58])
			If (Not:C34($_bo_HideStockMessages))
				MESSAGE:C88(Char:C90(13)+"   Posting Levels")
			End if 
			$_l_Index:=1
			While (($_l_Index<=$_l_LevelsToPost) & (OK=1))
				$_t_ProductCode:=STK_at_LevelsProductCode{$_l_Index}
				//While (Semaphore("StockLevel"+$_t_ProductCode))  `Prevent any other process from creating the same stock level
				//DelayTicks (5)
				//End while
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=STK_at_LevelstoPost{$_l_Index})
				If (Records in selection:C76([STOCK_LEVELS:58])=0)
					$_t_Currency:=""
					$_t_Layer:=""
					$_t_Type:=""
					$_t_AnalysisCode:=""
					$_t_ProductCode:=""
					STK_ReverseUnique(STK_at_LevelstoPost{$_l_Index}; ->$_t_Currency; ->$_t_Layer; ->$_t_Type; ->$_t_AnalysisCode; ->$_t_ProductCode)
					If (False:C215)
						//have to reverse the construct
						$_t_ExtractProductCode:=RemoveTrail2(Substring:C12(STKL_at_StockLevelident{$_l_Index}; 1; 25))
						$_t_ExtractStockTypeCode:=RemoveTrail2(Substring:C12(STKL_at_StockLevelident{$_l_Index}; 26; 5))
						$_t_ExtractAnalysisCode:=RemoveTrail2(Substring:C12(STKL_at_StockLevelident{$_l_Index}; 31; 5))
						$_t_ExtractCUrrencyCode:=RemoveTrail2(Substring:C12(STKL_at_StockLevelident{$_l_Index}; 36; 5))
						$_t_ExtractLayerCode:=RemoveTrail2(Substring:C12(STKL_at_StockLevelident{$_l_Index}; 41; 3))
					End if 
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode+"@"; *)
					If (<>StockAnal)
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_Type; *)
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
					Else 
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_Type)
					End if 
					$_l_NumberofStockLevelRecords:=Records in selection:C76([STOCK_LEVELS:58])
					
					If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
						
						If ($_l_NumberofStockLevelRecords>0)
							If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
								If ($_l_NumberofStockLevelRecords=1)
									If (([STOCK_LEVELS:58]Currency_Code:8#$_t_Currency) & ([STOCK_LEVELS:58]Currency_Code:8#""))
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_Currency; *)
									QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
								End if 
							Else 
								If ($_l_NumberofStockLevelRecords=1)
									If ([STOCK_LEVELS:58]Currency_Code:8#$_t_Currency)
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_Currency)
								End if 
							End if 
							$_l_NumberofStockLevelRecords:=Records in selection:C76([STOCK_LEVELS:58])
						End if 
					End if 
					
					If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
						
						If ($_l_NumberofStockLevelRecords>0)
							If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
								If ($_l_NumberofStockLevelRecords=1)
									If (([STOCK_LEVELS:58]Layer_Code:9#$_t_Layer) & ([STOCK_LEVELS:58]Layer_Code:9#""))
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_Layer; *)
									QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
								End if 
							Else 
								If ($_l_NumberofStockLevelRecords=1)
									If ([STOCK_LEVELS:58]Layer_Code:9#$_t_Layer)
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_Layer)
								End if 
							End if 
							$_l_NumberofStockLevelRecords:=Records in selection:C76([STOCK_LEVELS:58])
						End if 
					End if 
					
					If ($_l_NumberofStockLevelRecords=0)
						CREATE RECORD:C68([STOCK_LEVELS:58])
						[STOCK_LEVELS:58]Product_Code:1:=$_t_ProductCode
						[STOCK_LEVELS:58]Stock_Type:2:=$_t_Type
						If (<>StockAnal)
							[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
						End if 
						[STOCK_LEVELS:58]Currency_Code:8:=$_t_Currency
						[STOCK_LEVELS:58]Layer_Code:9:=$_t_Layer
						[STOCK_LEVELS:58]Free_Level:3:=STK_ar_LevelFree{$_l_Index}
						[STOCK_LEVELS:58]Free_Cost:5:=STK_ar_LevelFreeCost{$_l_Index}
						[STOCK_LEVELS:58]Allocated_Level:4:=STK_ar_LevelAllocated{$_l_Index}
						[STOCK_LEVELS:58]Allocated_Cost:6:=STK_ar_AllocatedCost{$_l_Index}
						[STOCK_LEVELS:58]X_ID:10:=$_l_ReserveIDS
						$_l_ReserveIDS:=$_l_ReserveIDS+1
						If ([STOCK_LEVELS:58]X_ID:10=0)
							[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
						End if 
						
						DB_SaveRecord(->[STOCK_LEVELS:58])
						AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
					Else 
						If (Application type:C494#4D Server:K5:6)
							
							
							If (Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level"))
								[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+STK_ar_LevelFree{$_l_Index}); 2)
								[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+STK_ar_LevelFreeCost{$_l_Index}); 2)
								[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+STK_ar_LevelAllocated{$_l_Index}); 2)
								[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+STK_ar_AllocatedCost{$_l_Index}); 2)
								
								If ([STOCK_LEVELS:58]X_ID:10=0)
									[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
								End if 
								
								DB_SaveRecord(->[STOCK_LEVELS:58])
								AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
							Else 
								
								Gen_Alert("A Level could not be saved.  The Posting will be cancelled."; "Cancel")
								
								OK:=0
							End if 
						Else 
							Repeat 
								$_bo_Saved:=False:C215
								If (Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level"))
									[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+STK_ar_LevelFree{$_l_Index}); 2)
									[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+STK_ar_LevelFreeCost{$_l_Index}); 2)
									[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+STK_ar_LevelAllocated{$_l_Index}); 2)
									[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+STK_ar_AllocatedCost{$_l_Index}); 2)
									If ([STOCK_LEVELS:58]X_ID:10=0)
										[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
									End if 
									
									DB_SaveRecord(->[STOCK_LEVELS:58])
									$_bo_Saved:=True:C214
									AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
								End if 
							Until ($_bo_Saved)
							
						End if 
					End if 
				Else 
					If (Application type:C494#4D Server:K5:6)
						
						
						If (Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level"))
							[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+STK_ar_LevelFree{$_l_Index}); 2)
							[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+STK_ar_LevelFreeCost{$_l_Index}); 2)
							[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+STK_ar_LevelAllocated{$_l_Index}); 2)
							[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+STK_ar_AllocatedCost{$_l_Index}); 2)
							
							If ([STOCK_LEVELS:58]X_ID:10=0)
								[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
							End if 
							
							DB_SaveRecord(->[STOCK_LEVELS:58])
							AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
						Else 
							
							Gen_Alert("A Level could not be saved.  The Posting will be cancelled."; "Cancel")
							
							OK:=0
						End if 
					Else 
						Repeat 
							$_bo_Saved:=False:C215
							If (Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level"))
								[STOCK_LEVELS:58]Free_Level:3:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+STK_ar_LevelFree{$_l_Index}); 2)
								[STOCK_LEVELS:58]Free_Cost:5:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+STK_ar_LevelFreeCost{$_l_Index}); 2)
								[STOCK_LEVELS:58]Allocated_Level:4:=Round:C94(([STOCK_LEVELS:58]Allocated_Level:4+STK_ar_LevelAllocated{$_l_Index}); 2)
								[STOCK_LEVELS:58]Allocated_Cost:6:=Round:C94(([STOCK_LEVELS:58]Allocated_Cost:6+STK_ar_AllocatedCost{$_l_Index}); 2)
								If ([STOCK_LEVELS:58]X_ID:10=0)
									[STOCK_LEVELS:58]X_ID:10:=AA_GetNextIDinMethod(->[STOCK_LEVELS:58]X_ID:10)
								End if 
								
								DB_SaveRecord(->[STOCK_LEVELS:58])
								$_bo_Saved:=True:C214
								AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
							End if 
						Until ($_bo_Saved)
						
					End if 
					
				End if 
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				//CLEAR SEMAPHORE("StockLevel"+$_t_ProductCode)
				$_l_Index:=$_l_Index+1
				$_l_ReserveIDS:=$_l_ReserveIDS+1
			End while 
		End if 
	End if 
	If (Not:C34($_bo_HideStockMessages))
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
	End if 
	For ($_l_PostIndex; 1; Size of array:C274($_at_STIProductCodes))  //clear the semaphores that were set protecting the stock level records.
		
		
		CLEAR SEMAPHORE:C144("StockLevel"+$_at_STIProductCodes{$_l_PostIndex})
		//Prevent any other process from creating the same stock level-not this could set a LOT of semahores
	End for 
	If (STK_bo_ReversedPosting)
		//These may come from multipe currencies/layers/analysis..we need to to do a seperate posting for each
		ARRAY TEXT:C222($_at_TKPostHeadersCurrenciesRang; 0)
		ARRAY TEXT:C222($_at_TKPostHeadersLayersRange; 0)
		ARRAY TEXT:C222($_at_TKPostHeadersAnalysisRange; 0)
		For ($_l_Index; 1; Size of array:C274($_at_STIAnalysisCode))
			$_l_AnalysisRow:=Find in array:C230($_at_TKPostHeadersAnalysisRange; $_at_STIAnalysisCode{$_l_Index})
			If ($_l_AnalysisRow<0)
				APPEND TO ARRAY:C911($_at_TKPostHeadersAnalysisRange; $_at_STIAnalysisCode{$_l_Index})
				
			End if 
			$_l_LayersRow:=Find in array:C230($_at_TKPostHeadersLayersRange; $_at_STILayerCode{$_l_Index})
			If ($_l_LayersRow<0)
				APPEND TO ARRAY:C911($_at_TKPostHeadersLayersRange; $_at_STILayerCode{$_l_Index})
			End if 
			$_l_CUrrencyRow:=Find in array:C230($_at_TKPostHeadersCurrenciesRang; $_at_STICurrency{$_l_Index})
			If ($_l_CUrrencyRow<0)
				APPEND TO ARRAY:C911($_at_TKPostHeadersCurrenciesRang; $_at_STICurrency{$_l_Index})
			End if 
		End for 
		For ($_l_Postindex1; 1; Size of array:C274($_at_TKPostHeadersCurrenciesRang))
			For ($_l_Postindex2; 1; Size of array:C274($_at_TKPostHeadersLayersRange))
				For ($_l_PostIndex3; 1; Size of array:C274($_at_TKPostHeadersAnalysisRange))
					$_r_StockMovementTotalCost:=0
					For ($_l_PostIndex4; 1; Size of array:C274($_at_STIProductCodes))
						If ($_at_STIAnalysisCode{$_l_PostIndex4}=$_at_TKPostHeadersAnalysisRange{$_l_PostIndex3}) & ($_at_STILayerCode{$_l_PostIndex4}=$_at_TKPostHeadersLayersRange{$_l_Postindex2}) & ($_at_STICurrency{$_l_PostIndex4}=$_at_TKPostHeadersCurrenciesRang{$_l_Postindex1})
							$_r_StockMovementTotalCost:=$_r_StockMovementTotalCost+($_ar_STStockCostPrice{$_l_PostIndex4}*$_ar_STStockQuantity{$_l_PostIndex4})
						End if 
					End for 
					STK_bo_InvertTransactionType:=True:C214
					Move_PostNom($_t_StockMovementCode; $_d_MovementDate; $_t_MovementTypesNo; $_t_MovementTypesTransCode; $_t_MovementTypeNumberName; $_r_StockMovementTotalCost; $_t_MovementCompanyFrom; $_at_TKPostHeadersAnalysisRange{$_l_PostIndex3}; $_at_TKPostHeadersCurrenciesRang{$_l_Postindex1}; $_at_TKPostHeadersLayersRange{$_l_Postindex2}; $_t_AccountingPeriod)
					STK_bo_InvertTransactionType:=False:C215
				End for 
			End for 
		End for 
	Else 
		Move_PostNom($_t_StockMovementCode; $_d_MovementDate; $_t_MovementTypesNo; $_t_MovementTypesTransCode; $_t_MovementTypeNumberName; $_r_StockMovementTotalCost; $_t_MovementCompanyFrom; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_AccountingPeriod)
		
	End if 
	
	UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
	UNLOAD RECORD:C212([CURRENT_STOCK:62])
	UNLOAD RECORD:C212([STOCK_LEVELS:58])
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		If (Table:C252(Current default table:C363)#Table:C252(->[ORDERS:24]))
			UNLOAD RECORD:C212([ORDERS:24])
		End if 
	Else 
		UNLOAD RECORD:C212([ORDERS:24])
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
	End if 
	ARRAY TEXT:C222(STKL_at_StockLevelident; 0)
	ARRAY REAL:C219(STKL_ar_StockFreeQuantity; 0)
	ARRAY REAL:C219(STKL_ar_StockFreeCost; 0)
	ARRAY REAL:C219(STKL_ar_StockAllocatedQuantity; 0)
	ARRAY REAL:C219(STKL_ar_StockAllocatedCost; 0)
	<>SYS_bo_CurrentWindowModal:=False:C215
Else 
	Gen_Alert("Stock Type "+$_t_CheckMovementType+" does not exist, so this Movement cannot be posted"; "Cancel")
	OK:=0
End if 
ERR_MethodTrackerReturn("Move InPost"; $_t_oldMethodName)
