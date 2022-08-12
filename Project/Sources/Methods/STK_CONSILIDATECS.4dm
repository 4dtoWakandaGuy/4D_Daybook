//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CONSILIDATECS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:               31/01/2011 18:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StockItemNumbers; 0)
	ARRAY POINTER:C280($_aptr_Fields; 0)
	ARRAY REAL:C219($_ar_CostPrices; 0)
	ARRAY TEXT:C222($_at_AnalysisCodes; 0)
	ARRAY TEXT:C222($_at_ConcolidateProductCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_StockLayers; 0)
	ARRAY TEXT:C222($_at_StockLocations; 0)
	ARRAY TEXT:C222($_at_StockTypes; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_Save)
	C_LONGINT:C283($_l_CSID; $_l_CSIDShouldBe; $_l_CurrentStockIndex; $_l_MovementItemIndex; $_l_ProductsIndex; $_l_SMIIndex; $_l_SMIIndex2; $_l_SMIIndex3; $_l_SMIIndex4; $_l_SMIIndex6; $_l_SMIIndex7)
	C_LONGINT:C283($_l_SMIIndex8; $_l_SMIIndex9; $_l_StockItemIndex)
	C_REAL:C285($_r_Quantity)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_CONSILIDATECS")

If (Count parameters:C259>=1)
	
	READ WRITE:C146([CURRENT_STOCK:62])
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
	//SELECTION TO ARRAY([CURRENT STOCK]Product Code;$_at_ConcolidateProductCodes)
	DISTINCT VALUES:C339([CURRENT_STOCK:62]Product_Code:1; $_at_ConcolidateProductCodes)
	
Else 
	ALL RECORDS:C47([CURRENT_STOCK:62])
	READ WRITE:C146([CURRENT_STOCK:62])
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	DISTINCT VALUES:C339([CURRENT_STOCK:62]Product_Code:1; $_at_ConcolidateProductCodes)
End if 

//Should be validating layer etc but for this one they only use one...
For ($_l_ProductsIndex; 1; Size of array:C274($_at_ConcolidateProductCodes))
	ARRAY POINTER:C280($_aptr_Fields; 2)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_type")
	ARRAY POINTER:C280($_aptr_Fields; 3)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_type")
	ARRAY POINTER:C280($_aptr_Fields; 4)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Analysis_Code:10
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_Anal_type")
	
	ARRAY POINTER:C280($_aptr_Fields; 5)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Analysis_Code:10
	$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_Anal__Lay_type")
	
	ARRAY POINTER:C280($_aptr_Fields; 6)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Analysis_Code:10
	$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
	$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Location:8
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_Anal__Lay_Loc_type")
	
	ARRAY POINTER:C280($_aptr_Fields; 7)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Analysis_Code:10
	$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
	$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Location:8
	$_aptr_Fields{7}:=->[CURRENT_STOCK:62]Cost_Price:6
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_Anal__Lay_Loc_cost_type")
	
	ARRAY POINTER:C280($_aptr_Fields; 8)
	$_aptr_Fields{1}:=->[CURRENT_STOCK:62]Product_Code:1
	$_aptr_Fields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
	$_aptr_Fields{3}:=->[CURRENT_STOCK:62]Currency_Code:11
	$_aptr_Fields{4}:=->[CURRENT_STOCK:62]Analysis_Code:10
	$_aptr_Fields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
	$_aptr_Fields{6}:=->[CURRENT_STOCK:62]Location:8
	$_aptr_Fields{7}:=->[CURRENT_STOCK:62]Cost_Price:6
	$_aptr_Fields{8}:=->[CURRENT_STOCK:62]Item_Number:5
	CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_Fields; Standard BTree index:K58:3; "CS_Product_Currency_Anal__Lay_Loc_cost_item_type")
	
	
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex})
	DISTINCT VALUES:C339([CURRENT_STOCK:62]Stock_Type:3; $_at_StockTypes)
	For ($_l_SMIIndex2; 1; Size of array:C274($_at_StockTypes))
		//MESSAGE($_at_ConcolidateProductCodes{$_l_ProductsIndex}+" "+$_at_StockTypes{$_l_SMIIndex2})
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2})
		DISTINCT VALUES:C339([CURRENT_STOCK:62]Currency_Code:11; $_at_CurrencyCodes)
		For ($_l_SMIIndex6; 1; Size of array:C274($_at_CurrencyCodes))
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6})
			DISTINCT VALUES:C339([CURRENT_STOCK:62]Analysis_Code:10; $_at_AnalysisCodes)
			For ($_l_SMIIndex7; 1; Size of array:C274($_at_AnalysisCodes))
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6}; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_at_AnalysisCodes{$_l_SMIIndex7})
				DISTINCT VALUES:C339([CURRENT_STOCK:62]Layer_Code:12; $_at_StockLayers)
				For ($_l_SMIIndex8; 1; Size of array:C274($_at_StockLayers))
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6}; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_at_AnalysisCodes{$_l_SMIIndex7}; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_at_StockLayers{$_l_SMIIndex8})
					
					DISTINCT VALUES:C339([CURRENT_STOCK:62]Location:8; $_at_StockLocations)
					For ($_l_SMIIndex9; 1; Size of array:C274($_at_StockLocations))
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6}; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_at_AnalysisCodes{$_l_SMIIndex7}; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_at_StockLayers{$_l_SMIIndex8}; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_at_StockLocations{$_l_SMIIndex9})
						DISTINCT VALUES:C339([CURRENT_STOCK:62]Cost_Price:6; $_ar_CostPrices)
						For ($_l_SMIIndex3; 1; Size of array:C274($_ar_CostPrices))
							//MESSAGE($_at_ConcolidateProductCodes{$_l_ProductsIndex}+" "+$_at_StockTypes{$_l_SMIIndex2}+" "+String($_ar_CostPrices{$_l_SMIIndex3}))
							
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_at_AnalysisCodes{$_l_SMIIndex7}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_at_StockLayers{$_l_SMIIndex8}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_at_StockLocations{$_l_SMIIndex9}; *)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CostPrices{$_l_SMIIndex3})
							DISTINCT VALUES:C339([CURRENT_STOCK:62]Item_Number:5; $_al_StockItemNumbers)
							
							For ($_l_SMIIndex4; 1; Size of array:C274($_al_StockItemNumbers))
								//MESSAGE($_at_ConcolidateProductCodes{$_l_ProductsIndex}+" "+$_at_StockTypes{$_l_SMIIndex2}+" "+String($_ar_CostPrices{$_l_SMIIndex3})+" "+String($_al_StockItemNumbers{$_l_SMIIndex4})+":"+String($_l_ProductsIndex)+" "+String($_l_SMIIndex2)+":"+String($_l_SMIIndex3)+":"+String($_l_SMIIndex4))
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_at_ConcolidateProductCodes{$_l_ProductsIndex}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$_at_CurrencyCodes{$_l_SMIIndex6}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_at_AnalysisCodes{$_l_SMIIndex7}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_at_StockLayers{$_l_SMIIndex8}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_at_StockLocations{$_l_SMIIndex9}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CostPrices{$_l_SMIIndex3}; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_al_StockItemNumbers{$_l_SMIIndex4})
								If (Records in selection:C76([CURRENT_STOCK:62])>1)
									If ([CURRENT_STOCK:62]Product_Code:1[[1]]="_")
										
									Else 
										FIRST RECORD:C50([CURRENT_STOCK:62])
										$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
										$_r_Quantity:=[CURRENT_STOCK:62]Quantity:4
										For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
											If ([CURRENT_STOCK:62]X_ID:13#$_l_CSID)
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
												For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
													[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_CSID
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
												End for 
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
												For ($_l_StockItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
													[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_CSID
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
												End for 
												If ([CURRENT_STOCK:62]X_ID:13#$_l_CSID)
													[CURRENT_STOCK:62]Product_Code:1:="_"+[CURRENT_STOCK:62]Product_Code:1
												End if 
												$_r_Quantity:=$_r_Quantity+[CURRENT_STOCK:62]Quantity:4
												DB_SaveRecord(->[CURRENT_STOCK:62])
												
											End if 
											NEXT RECORD:C51([CURRENT_STOCK:62])
										End for 
										FIRST RECORD:C50([CURRENT_STOCK:62])
										[CURRENT_STOCK:62]Quantity:4:=$_r_Quantity
										DB_SaveRecord(->[CURRENT_STOCK:62])
									End if 
								Else 
									If ([CURRENT_STOCK:62]Product_Code:1#"")
										If ([CURRENT_STOCK:62]Product_Code:1[[1]]="_")
											$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
											$_bo_Exit:=False:C215
											Repeat 
												If ($_t_productCode#"")
													If ($_t_productCode[[1]]="_")
														$_t_productCode:=Substring:C12($_t_productCode; 2)
													Else 
														$_bo_Exit:=True:C214
													End if 
												Else 
													$_bo_Exit:=True:C214
												End if 
											Until ($_bo_Exit)
											If ($_t_productCode#"")
												$_l_CSID:=[CURRENT_STOCK:62]X_ID:13
												QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
												QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_at_StockTypes{$_l_SMIIndex2}; *)
												QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_ar_CostPrices{$_l_SMIIndex3}; *)
												QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_al_StockItemNumbers{$_l_SMIIndex4})
												$_l_CSIDShouldBe:=[CURRENT_STOCK:62]X_ID:13
												If ($_l_CSIDShouldBe#0)
													$_bo_Save:=False:C215
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CSID)
													For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
														$_bo_Save:=True:C214
														[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$_l_CSIDShouldBe
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
														NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
													End for 
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CSID)
													For ($_l_SMIIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
														$_bo_Save:=True:C214
														[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_CSIDShouldBe
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
														NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
													End for 
													If ($_bo_Save)
														DB_SaveRecord(->[CURRENT_STOCK:62])
														QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CSID)
														DB_SaveRecord(->[CURRENT_STOCK:62])
													End if 
												End if 
											End if 
										End if 
										
									End if 
								End if 
							End for 
						End for 
					End for 
				End for 
			End for 
		End for 
	End for 
End for 
ERR_MethodTrackerReturn("STK_CONSILIDATECS"; $_t_oldMethodName)
