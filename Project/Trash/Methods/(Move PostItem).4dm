//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move PostItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; <>TrackStockposting; $_bo_AllocationAllowed; $_bo_AllocationAllowed2; $_bo_AllocationType; $_bo_AllocationType2; $_bo_NewCurrentStockRecord; vMod3)
	C_LONGINT:C283($_l_CurrentStockID; $2)
	C_POINTER:C301($1; $3)
	C_TEXT:C284($_t_CurrentStockIdent; $_t_oldMethodName; $_t_productCode; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalysis; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move PostItem")
If (($1->#"") & (OK=1))
	If ([STOCK_TYPES:59]Type_Code:1#$1->)
		QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$1->)
	End if 
	If (Records in selection:C76([STOCK_TYPES:59])>0)
		$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
		While (Semaphore:C143("CurrentStock"+$_t_productCode))  //Prevent any other process from creating the same current stock
			DelayTicks(2)
			ALERT:C41("in Move PostItem")
			
			
		End while 
		$_bo_NewCurrentStockRecord:=False:C215
		$_bo_AllocationAllowed:=[STOCK_TYPES:59]Allocation_Allowed:8
		$_t_CurrentStockIdent:=""
		$_l_CurrentStockID:=0
		If (([STOCK_MOVEMENT_ITEMS:27]Stock_Number:9>0) & ($2=-1))
			
			If (<>TrackStockposting)
				STK_PostTracker("Stock No is"+String:C10([STOCK_MOVEMENT_ITEMS:27]Stock_Number:9)+"and we are posting a stock minus")
			End if 
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Number:7=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9)
			$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
			$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
			vAnalysis:=[CURRENT_STOCK:62]Analysis_Code:10
			ACC_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
			vLayer:=[CURRENT_STOCK:62]Layer_Code:12
		Else 
			
			If (($2=1) & ($_bo_AllocationAllowed=False:C215))  //do this here for searching purposes - 4.0.036b
				[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0  //NB: does NOT want to be Saved
				If (<>TrackStockposting)
					STK_PostTracker("Stock item number is temporarilily set to 0 because stock defines allocation as n"+"ot allowed")
				End if 
			End if 
			
			If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
				
				If (($2=1) & ([MOVEMENT_TYPES:60]Serial_Unique:19))  //Avoid searches if unique Serial Nos are forced
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
					$_t_CurrentStockIdent:=""
					$_l_CurrentStockID:=0
				Else 
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$1->; *)
					If (($2=-1) & ([MOVEMENT_TYPES:60]Serial_Unique:19))  //Avoid finding 0 & then doing again below if Minus & Serial Unique
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; *)
					End if 
					If (vMod3)  //If need to do the ACL search - variable set in MoveInPost
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; *)
						StockCurr_ACLSr
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
					End if 
				End if 
				$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
				$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
			Else 
				
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$1->; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
				If ([STOCK_TYPES:59]No_Locations:3=False:C215)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=[STOCK_MOVEMENT_ITEMS:27]Location:7; *)
				End if 
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
				If (vMod3)
					If (<>TrackStockposting)
						STK_PostTracker("Filtering Current stock down by analysis etc")
					End if 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; *)
					StockCurr_ACLSr
				Else 
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
				End if 
				$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
				$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
			End if 
			
			If ($2=-1)
				//removed 4.0.030 - was making eg -S get stuffed into same slot
				//even if price was wrong
				
				//then put back in in 035, but with the Cost Price line added
				//cos above meant that you got negative On Order Serial Numbered Stock unnec
				If (Records in selection:C76([CURRENT_STOCK:62])=0)  //Try again to find the item to t
					If (<>TrackStockposting)
						STK_PostTracker("No current stock found in standard query  using  cost price query-no location")
					End if 
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$1->; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
					If (vMod3)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; *)
						StockCurr_ACLSr
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
					End if 
					$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				End if 
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					If (<>TrackStockposting)
						STK_PostTracker("No current stock found insecond query-going to look again but only if item number"+" # 0")
					End if 
				End if 
				If ((Records in selection:C76([CURRENT_STOCK:62])=0) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0))
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$1->; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=""; *)
					QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; *)
					If (vMod3)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
						StockCurr_ACLSr
					Else 
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
					End if 
					$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				End if 
			End if 
			
		End if 
		
		If ($2=-1)
			If ([STOCK_TYPES:59]Minus_Warning:7)
				If (DB_t_CurrentFormUsage="LPA")
					If ((Records in selection:C76([CURRENT_STOCK:62])=0) | ((Round:C94(([CURRENT_STOCK:62]Quantity:4+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2))<0))
						Gen_Confirm("Negative Current Stock will be created by this Movement for Product "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; "Continue"; "Try again")
						If (OK=0)
							DB_t_CurrentFormUsage:="TA"
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
				$_t_CurrentStockIdent:=""
				$_l_CurrentStockID:=0
				$_bo_NewCurrentStockRecord:=True:C214
				CREATE RECORD:C68([CURRENT_STOCK:62])
				[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
				[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
				[CURRENT_STOCK:62]Stock_Type:3:=$1->
				[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
				[CURRENT_STOCK:62]Serial_Number:2:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
				If (($2=1) & ([STOCK_TYPES:59]Allocation_Allowed:8))  //not [STOCK TYPES]Allocated - 4.0.036b
					[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
				End if 
				If (vAnalysis="NONE")
					If (<>StockAnal)
						[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENTS:40]Analysis_Code:9
					End if 
					[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENTS:40]Currency_Code:10
					[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENTS:40]Layer_Code:11
				Else 
					If (<>StockAnal)
						[CURRENT_STOCK:62]Analysis_Code:10:=vAnalysis
					End if 
					[CURRENT_STOCK:62]Currency_Code:11:=ACC_t_CurrencyCode
					[CURRENT_STOCK:62]Layer_Code:12:=vLayer
				End if 
			Else 
				Check_LockMess(->[CURRENT_STOCK:62]; "Current Stock")
			End if 
			If (OK=1)
				
				If ($2=1)
					[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					If ([STOCK_TYPES:59]No_Locations:3=False:C215)
						[CURRENT_STOCK:62]Location:8:=[STOCK_MOVEMENT_ITEMS:27]Location:7
					End if 
				End if 
				//TRACE
				[CURRENT_STOCK:62]Quantity:4:=Gen_Round(([CURRENT_STOCK:62]Quantity:4+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2; 2)
				[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
				
				If ([CURRENT_STOCK:62]X_ID:13=0)
					[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
				End if 
				
				If ([CURRENT_STOCK:62]Product_Code:1#"")
					[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
				End if 
				
				DB_SaveRecord(->[CURRENT_STOCK:62])
				$_t_CurrentStockIdent:=[CURRENT_STOCK:62]UniqueConstruct:14
				$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
				AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
				
				If (([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0) & (OK=1))
					If (Count parameters:C259=3)
						QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$3->)
						$_bo_AllocationType:=[STOCK_TYPES:59]Allocated:6
						$_bo_AllocationAllowed2:=[STOCK_TYPES:59]Allocation_Allowed:8
						QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$1->)
						$_bo_AllocationType2:=[STOCK_TYPES:59]Allocated:6
						If (($_bo_AllocationType=False:C215) & ($_bo_AllocationType2))  // & ($2=1)) | (($_bo_AllocationType) & ($_bo_AllocationType2=False) & ($2=-1)))
							RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								If (Check_LockMess(->[ORDER_ITEMS:25]; "Order Items"))
									[ORDER_ITEMS:25]Allocated:28:=Gen_Round(([ORDER_ITEMS:25]Allocated:28+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2; 2)
									If ($2=1)
										[ORDER_ITEMS:25]Received_Date:21:=[STOCK_MOVEMENTS:40]Movement_Date:5
									End if 
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									If ($_t_CurrentStockIdent#"") | ($_l_CurrentStockID>0)
										//No need to push it
									Else 
										PUSH RECORD:C176([CURRENT_STOCK:62])
									End if 
									
									//clearly for sum reason here
									//when we get a stock received
									//movement there is no item number or something
									OrderI_AllOIUp2($_t_CurrentStockIdent; $_l_CurrentStockID)
									If ($_t_CurrentStockIdent#"") | ($_l_CurrentStockID>0)
										If ($_l_CurrentStockID>0)
											If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
												QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
											End if 
										Else 
											If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdent)
												QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdent)
											End if 
											
										End if 
										
										
									Else 
										POP RECORD:C177([CURRENT_STOCK:62])
									End if 
									
									//  If (([CURRENT STOCK]Item Number#0) & ($2=-1))
									// If ($_bo_AllocationAllowed2=False)
									// [CURRENT STOCK]Item Number:=0
									//  DB_SaveRecord(->[CURRENT STOCK])
									AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
									//  End if
									//  End if
									UNLOAD RECORD:C212([ORDER_ITEMS:25])
								End if 
							End if 
						Else 
							If (($_bo_AllocationType) & ($_bo_AllocationType2) & ($2=1) & ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#""))  //if adding Serial No for the first time, add it
								RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
								If ([ORDER_ITEMS:25]Serial_Number:24#("@"+[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4+"@"))
									If (Records in selection:C76([ORDER_ITEMS:25])>0)
										If (Check_LockMess(->[ORDER_ITEMS:25]; "Order Items"))
											If ($_t_CurrentStockIdent#"") | ($_l_CurrentStockID>0)
												//No need to push it
											Else 
												PUSH RECORD:C176([CURRENT_STOCK:62])
											End if 
											OrderI_AllOIUp2($_t_CurrentStockIdent; $_l_CurrentStockID)
											If ($_t_CurrentStockIdent#"") | ($_l_CurrentStockID>0)
												If ($_l_CurrentStockID>0)
													If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
														QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
													End if 
												Else 
													If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdent)
														QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdent)
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
					// If (($2=-1) & ($_bo_AllocationAllowed=True) & ([STOCK ITEMS]Item Number#0)
					// & ([CURRENT STOCK]Item Number=0))
					//temporarily reinstates the Alloc to allow neg posting of Level - 4.0.036b
					//  [CURRENT STOCK]Item Number:=[STOCK ITEMS]Item Number
					//NB: does NOT want to be Saved
					// End if
					Move_PostLevArr(->[CURRENT_STOCK:62]Stock_Type:3; $2)
				End if 
				If ($_t_CurrentStockIdent#"") | ($_l_CurrentStockID>0)
					If ($_l_CurrentStockID>0)
						If ([CURRENT_STOCK:62]X_ID:13#$_l_CurrentStockID)
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
						End if 
					Else 
						If ([CURRENT_STOCK:62]UniqueConstruct:14#$_t_CurrentStockIdent)
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_CurrentStockIdent)
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
		CLEAR SEMAPHORE:C144("CurrentStock"+$_t_productCode)
	Else 
		If (<>TrackStockposting)
			STK_PostTracker("No stock type"+$1->+" is found")
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Move PostItem"; $_t_oldMethodName)
