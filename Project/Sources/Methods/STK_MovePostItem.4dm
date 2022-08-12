//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_MovePostItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2012 10:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; <>TrackStockposting; $_bo_AccessMode; $_bo_AllocationAllowed; $_bo_IsAllocatedtype; $_bo_NewCurrentStockRecord; $_bo_Serialisunique; $_bo_StockTypeisAllocated; $5; $6; vMod3)
	C_DATE:C307($_d_MovementDate; $4)
	C_LONGINT:C283($_l_AllocationType; $_l_CurrentStockID; $_l_Retries; $_l_StockItemNumber; $_t_StockNumber; $2)
	C_POINTER:C301($1; $3)
	C_REAL:C285($_r_StockItemCostPrice; $_r_StockItemQuantity; $_r_TotalCost; $11; $14; $16; $17)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_CurrentFormUsage; $_t_CurrentStockAnalysis; $_t_CurrentStockCurrency; $_t_CurrentStockIdentity; $_t_CurrentStockLayer; $_t_InverseStockType; $_t_LayerCode; $_t_oldMethodName; $_t_StockItemLocation)
	C_TEXT:C284($_t_StockProductCode; $_t_StockSerialNo; $_t_StockType; $10; $12; $13; $15; $7; $8; $9; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_MovePostItem")
If (Count parameters:C259>=3)
	$_t_StockType:=$1->
	$_l_AllocationType:=$2
	If (Count parameters:C259>=3)
		$_t_InverseStockType:=$3->
	End if 
	If (Count parameters:C259>=4)
		$_d_MovementDate:=$4
	Else 
		$_d_MovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
	End if 
	If (Count parameters:C259>=5)
		$_bo_Serialisunique:=$5
	Else 
		$_bo_Serialisunique:=[MOVEMENT_TYPES:60]Serial_Unique:19
	End if 
	If (Count parameters:C259>=6)
		$_bo_AccessMode:=$6
	Else 
		$_bo_AccessMode:=vMod3
	End if 
	If (Count parameters:C259>=7)
		$_t_CurrentFormUsage:=$7
	Else 
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	End if 
	If (Count parameters:C259>=8)
		$_t_AnalysisCode:=$8
	Else 
		$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
	End if 
	If (Count parameters:C259>=9)
		$_t_LayerCode:=$9
	Else 
		$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
	End if 
	If (Count parameters:C259>=10)
		$_t_CurrencyCode:=$10
	Else 
		$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
	End if 
	If (Count parameters:C259>=11)
		$_t_StockNumber:=$11
	Else 
		$_t_StockNumber:=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9
	End if 
	If (Count parameters:C259>=12)
		$_t_StockProductCode:=$12
	Else 
		$_t_StockProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
	End if 
	If (Count parameters:C259>=13)
		$_t_StockSerialNo:=$13
	Else 
		$_t_StockSerialNo:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
	End if 
	If (Count parameters:C259>=14)
		$_l_StockItemNumber:=$14
	Else 
		$_l_StockItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
	End if 
	If (Count parameters:C259>=15)
		$_t_StockItemLocation:=$15
	Else 
		$_t_StockItemLocation:=[STOCK_MOVEMENT_ITEMS:27]Location:7
	End if 
	If (Count parameters:C259>=16)
		$_r_StockItemCostPrice:=$16
	Else 
		$_r_StockItemCostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
	End if 
	If (Count parameters:C259>=17)
		$_r_StockItemQuantity:=$17
	Else 
		$_r_StockItemQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	End if 
	$_t_CurrentStockIdentity:=""
	$_l_CurrentStockID:=0
	$_t_CurrentStockAnalysis:=""
	$_t_CurrentStockCurrency:=""
	$_t_CurrentStockLayer:=""
	If (($_t_StockType#"") & (OK=1))
		If ([STOCK_TYPES:59]Type_Code:1#$_t_StockType)
			QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$_t_StockType)
		End if 
		If (Records in selection:C76([STOCK_TYPES:59])>0)
			$_l_Retries:=0
			While (Semaphore:C143("CurrentStock"+$_t_StockProductCode))  //Prevent any other process from creating the same current stock
				ALERT:C41("STK_MovePostItem")
				
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			$_bo_NewCurrentStockRecord:=False:C215
			$_bo_AllocationAllowed:=[STOCK_TYPES:59]Allocation_Allowed:8
			$_t_CurrentStockIdentity:=""
			$_l_CurrentStockID:=0
			If (($_t_StockNumber>0) & ($_l_AllocationType=-1))
				If (<>TrackStockposting)
					STK_PostTracker("Stock No is"+String:C10($_t_StockNumber)+"and we are posting a stock minus")
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Number:7=$_t_StockNumber)
				$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
				$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				$_t_CurrentStockAnalysis:=[CURRENT_STOCK:62]Analysis_Code:10
				$_t_CurrentStockCurrency:=[CURRENT_STOCK:62]Currency_Code:11
				$_t_CurrentStockLayer:=[CURRENT_STOCK:62]Layer_Code:12
			Else 
				
				If (($_l_AllocationType=1) & ($_bo_AllocationAllowed=False:C215))  //do this here for searching purposes - 4.0.036b
					//$0:=0
					$_l_StockItemNumber:=0
					//[STOCK ITEMS]Item Number:=0  `NB: does NOT want to be Saved
					If (<>TrackStockposting)
						STK_PostTracker("Stock item number is temporarilily set to 0 because stock defines allocation as n"+"ot allowed")
					End if 
				End if 
				
				If ($_t_StockSerialNo#"")
					
					If (($_l_AllocationType=1) & ($_bo_Serialisunique))  //Avoid searches if unique Serial Nos are forced
						REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
						$_t_CurrentStockIdentity:=""
						$_l_CurrentStockID:=0
					Else 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_StockProductCode; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
						If (($_l_AllocationType=-1) & ($_bo_Serialisunique))  //Avoid finding 0 & then doing again below if Minus & Serial Unique
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_StockSerialNo; *)
						End if 
						If ($_bo_AccessMode)  //If need to do the ACL search - variable set in MoveInPost
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
							STK_CurrentACLsr($_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode)
							
							//StockCurr_ACLSr
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber)
						End if 
					End if 
					$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				Else 
					
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_StockProductCode; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
					If ([STOCK_TYPES:59]No_Locations:3=False:C215)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$_t_StockItemLocation; *)
					End if 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_r_StockItemCostPrice; *)
					If ($_bo_AccessMode)
						If (<>TrackStockposting)
							STK_PostTracker("Filtering Current stock down by analysis etc")
						End if 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
						STK_CurrentACLsr($_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode)
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber)
					End if 
					$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				End if 
				
				If ($_l_AllocationType=-1)
					//removed 4.0.030 - was making eg -S get stuffed into same slot
					//even if price was wrong
					
					//then put back in in 035, but with the Cost Price line added
					//cos above meant that you got negative On Order Serial Numbered Stock unnec
					If (Records in selection:C76([CURRENT_STOCK:62])=0)  //Try again to find the item to t
						If (<>TrackStockposting)
							STK_PostTracker("No current stock found in standard query  using  cost price query-no location")
						End if 
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_StockProductCode; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_r_StockItemCostPrice; *)
						If ($_bo_AccessMode)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
							STK_CurrentACLsr($_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber)
						End if 
						$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
						$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
					End if 
					If (Records in selection:C76([CURRENT_STOCK:62])=0)
						If (<>TrackStockposting)
							STK_PostTracker("No current stock found insecond query-going to look again but only if item number"+" # 0")
						End if 
					End if 
					If ((Records in selection:C76([CURRENT_STOCK:62])=0) & ($_l_StockItemNumber#0))
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_StockProductCode; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$_r_StockItemCostPrice; *)
						If ($_bo_AccessMode)
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
							STK_CurrentACLsr($_t_AnalysisCode; $_t_LayerCode; $_t_CurrencyCode)
						Else 
							QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
						End if 
						$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
						$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
					End if 
				End if 
				
			End if 
			
			If ($_l_AllocationType=-1)
				If ([STOCK_TYPES:59]Minus_Warning:7)
					If ($_t_CurrentFormUsage="LPA")
						If ((Records in selection:C76([CURRENT_STOCK:62])=0) | ((Round:C94(([CURRENT_STOCK:62]Quantity:4+(Abs:C99($_r_StockItemQuantity)*$_l_AllocationType)); 2))<0))
							If (Application type:C494#4D Server:K5:6)
								Gen_Confirm("Negative Current Stock will be created by this Movement for Product "+$_t_StockProductCode; "Continue"; "Try again")
								If (OK=0)
									$_t_CurrentFormUsage:="TA"
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
			If (OK=1)
				READ WRITE:C146([CURRENT_STOCK:62])
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					If (<>TrackStockposting)
						STK_PostTracker("Creating a current stock record")
					End if 
					$_t_CurrentStockIdentity:=""
					$_l_CurrentStockID:=0
					$_bo_NewCurrentStockRecord:=True:C214
					CREATE RECORD:C68([CURRENT_STOCK:62])
					[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
					[CURRENT_STOCK:62]Product_Code:1:=$_t_StockProductCode
					[CURRENT_STOCK:62]Stock_Type:3:=$_t_StockType
					[CURRENT_STOCK:62]Cost_Price:6:=$_r_StockItemCostPrice
					[CURRENT_STOCK:62]Serial_Number:2:=$_t_StockSerialNo
					If (($_l_AllocationType=1) & ([STOCK_TYPES:59]Allocation_Allowed:8))  //not [STOCK TYPES]Allocated - 4.0.036b
						[CURRENT_STOCK:62]Item_Number:5:=$_l_StockItemNumber
					End if 
					If ($_t_CurrentStockAnalysis="NONE")
						If (<>StockAnal)
							[CURRENT_STOCK:62]Analysis_Code:10:=$_t_AnalysisCode
						End if 
					End if 
					If ($_t_CurrencyCode#"")
						[CURRENT_STOCK:62]Currency_Code:11:=$_t_CurrencyCode
						[CURRENT_STOCK:62]Layer_Code:12:=$_t_LayerCode
					Else 
						If (<>StockAnal)
							[CURRENT_STOCK:62]Analysis_Code:10:=$_t_CurrentStockAnalysis
						End if 
						[CURRENT_STOCK:62]Currency_Code:11:=$_t_CurrentStockCurrency
						[CURRENT_STOCK:62]Layer_Code:12:=$_t_CurrentStockLayer
					End if 
				Else 
					Check_LockMess(->[CURRENT_STOCK:62]; "Current Stock")
				End if 
				If (OK=1)
					
					If ($_l_AllocationType=1)
						[CURRENT_STOCK:62]Cost_Price:6:=$_r_StockItemCostPrice
						If ([STOCK_TYPES:59]No_Locations:3=False:C215)
							[CURRENT_STOCK:62]Location:8:=$_t_StockItemLocation
						End if 
					End if 
					
					[CURRENT_STOCK:62]Quantity:4:=Gen_Round(([CURRENT_STOCK:62]Quantity:4+(Abs:C99($_r_StockItemQuantity)*$_l_AllocationType)); 2; 2)
					[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
					
					If ([CURRENT_STOCK:62]X_ID:13=0)
						[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
					End if 
					
					If ([CURRENT_STOCK:62]Product_Code:1#"")
						[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
					End if 
					
					DB_SaveRecord(->[CURRENT_STOCK:62])
					$_t_CurrentStockIdentity:=[CURRENT_STOCK:62]UniqueConstruct:14
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
					AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
					
					If (($_l_StockItemNumber#0) & (OK=1))
						If ($_t_InverseStockType#"")
							QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$_t_InverseStockType)
							$_bo_IsAllocatedtype:=[STOCK_TYPES:59]Allocated:6
							$_bo_AllocationAllowed:=[STOCK_TYPES:59]Allocation_Allowed:8
							QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$_t_StockType)
							$_bo_StockTypeisAllocated:=[STOCK_TYPES:59]Allocated:6
							If (($_bo_IsAllocatedtype=False:C215) & ($_bo_StockTypeisAllocated))  //
								If ([ORDER_ITEMS:25]Item_Number:27#$_l_StockItemNumber)
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_StockItemNumber)
								End if 
								//RELATE ONE([STOCK ITEMS]Item Number)
								If (Records in selection:C76([ORDER_ITEMS:25])>0)
									If (Check_LockMess(->[ORDER_ITEMS:25]; "Order Items"))
										[ORDER_ITEMS:25]Allocated:28:=Gen_Round(([ORDER_ITEMS:25]Allocated:28+(Abs:C99($_r_StockItemQuantity)*$_l_AllocationType)); 2; 2)
										If ($_l_AllocationType=1)
											[ORDER_ITEMS:25]Received_Date:21:=$_d_MovementDate
										End if 
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
										If ($_t_CurrentStockIdentity#"") | ($_l_CurrentStockID>0)
											//No need to push it
										Else 
											PUSH RECORD:C176([CURRENT_STOCK:62])
										End if 
										
										//clearly for sum reason here
										//when we get a stock received
										//movement there is no item number or something
										OrderI_AllOIUp2($_t_CurrentStockIdentity; $_l_CurrentStockID)
										If ($_t_CurrentStockIdentity#"") | ($_l_CurrentStockID>0)
											If ($_l_CurrentStockID>0)
												If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
													QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
												End if 
											Else 
												If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdentity)
													QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdentity)
												End if 
												
											End if 
											
											
										Else 
											//POP RECORD([CURRENT STOCK])
										End if 
										AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
										UNLOAD RECORD:C212([ORDER_ITEMS:25])
									End if 
								End if 
							Else 
								If (($_bo_IsAllocatedtype) & ($_bo_StockTypeisAllocated) & ($_l_AllocationType=1) & ($_t_StockSerialNo#""))  //if adding Serial No for the first time, add it
									If ([ORDER_ITEMS:25]Item_Number:27#$_l_StockItemNumber)
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_StockItemNumber)
									End if 
									//RELATE ONE([STOCK ITEMS]Item Number)
									If ([ORDER_ITEMS:25]Serial_Number:24#("@"+$_t_StockSerialNo+"@"))
										If (Records in selection:C76([ORDER_ITEMS:25])>0)
											If (Check_LockMess(->[ORDER_ITEMS:25]; "Order Items"))
												If ($_t_CurrentStockIdentity#"") | ($_l_CurrentStockID>0)
													//No need to push it
												Else 
													//PUSH RECORD([CURRENT STOCK]) `no need to do this as the record is not required
												End if 
												OrderI_AllOIUp2($_t_CurrentStockIdentity; $_l_CurrentStockID)
												If ($_t_CurrentStockIdentity#"") | ($_l_CurrentStockID>0)
													If ($_l_CurrentStockID>0)
														If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
														End if 
													Else 
														If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdentity)
															QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdentity)
														End if 
														
													End if 
													
													
												Else 
													POP RECORD:C177([CURRENT_STOCK:62])
												End if 
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					Else 
						If (<>TrackStockposting)
							STK_PostTracker("Stock Item number is 0 so running allocation up2")
						End if 
					End if 
					
					If (OK=1)
						//$0:=STOCK_BuildUnique ($_t_StockProductCode;$_t_CurrencyCode;$_t_LayerCode;[CURRENT STOCK]Stock Type;$_t_AnalysisCode)
						$_r_TotalCost:=Gen_Round(($_r_StockItemCostPrice*Abs:C99($_r_StockItemQuantity)); 2; 2)  //4.0.035/6
						
						STK_MovePostLevelsArray($_t_StockProductCode; $_t_CurrencyCode; $_t_LayerCode; [CURRENT_STOCK:62]Stock_Type:3; $_t_AnalysisCode; $_l_AllocationType; [CURRENT_STOCK:62]Item_Number:5; $_r_StockItemQuantity; $_r_TotalCost)
						//Move_PostLevArr (->[CURRENT STOCK]Stock Type;$_l_AllocationType)
					End if 
					If ($_t_CurrentStockIdentity#"") | ($_l_CurrentStockID>0)
						If ($_l_CurrentStockID>0)
							If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
							End if 
						Else 
							If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdentity)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdentity)
							End if 
							
						End if 
					End if 
					If (Not:C34($_bo_NewCurrentStockRecord))
						If (Records in selection:C76([CURRENT_STOCK:62])=1)
							If ((OK=1) & ([CURRENT_STOCK:62]Quantity:4=0))  //& ([CURRENT STOCK]Item Number=0))
								//DB_DeletionControl (->[CURRENT STOCK])
								
								//DELETE RECORD([CURRENT STOCK])
							End if 
						End if 
						
					End if 
				Else 
					If (<>TrackStockposting)
						STK_PostTracker("OK # 1 (2nd one) so  not going to post to current stock")
					End if 
				End if 
			Else 
				If (<>TrackStockposting)
					STK_PostTracker("OK # 1 so not going to post to current stock")
				End if 
				
			End if 
			CLEAR SEMAPHORE:C144("CurrentStock"+$_t_StockProductCode)
		Else 
			If (<>TrackStockposting)
				STK_PostTracker("No stock type"+$_t_StockType+" is found")
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_MovePostItem"; $_t_oldMethodName)
AA_CloseStates
ERR_MethodTrackerReturn("STK_MovePostItem"; $_t_oldMethodName)