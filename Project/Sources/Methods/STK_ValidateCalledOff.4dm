//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ValidateCalledOff
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     31/12/2011 18:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_IDsNEW; 0)
	ARRAY LONGINT:C221($_al_IDsNEW1; 0)
	ARRAY LONGINT:C221($_al_IDsOLD; 0)
	ARRAY LONGINT:C221($_al_IDsOLD1; 0)
	ARRAY REAL:C219($_ar_KeepQuantities; 0)
	ARRAY REAL:C219($_ar_KeepQuantities1; 0)
	ARRAY REAL:C219($_ar_ResetQuantities; 0)
	ARRAY REAL:C219($_ar_ResetQuantities1; 0)
	C_BOOLEAN:C305($_bo_Edit; $_bo_OK)
	C_LONGINT:C283($_l_ChidrenIndex; $_l_CorrectRecordNum; $_l_Delay; $_l_IDNEW; $_l_IDOLD; $_l_KeepIndex; $_l_MoveItemIndex; $_l_RecordsinSelection; $_l_Repeats; $_l_StockItemAddTOCSID; $_l_StockItemID)
	C_LONGINT:C283(STK_l_OrderItemNumber)
	C_REAL:C285($_r_BreakOff; $_r_KeepQuantity; $_r_OKQuantity; $_r_QuantitySoFar; $_r_QuantityToReset; $_r_RecordsinSelection2; $_r_RecordsinSelection3; $_r_SplitOff; $_r_Sum; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ValidateCalledOff")
//C_LONGINT(<>`messageOFFSET)


If (Count parameters:C259>0)
	//GOTO XY(0;0)
	//message("PROCESS-"+String(Current process))
	$_l_StockItemAddTOCSID:=$1
	REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
	
	If ($_l_StockItemAddTOCSID>0)
		//GOTO XY(0;0)
		//message("PROCESS-"+String(Current process)+"STOCK ITEMS ADDED TO CURRENT STOCK ID "+String($_l_StockItemAddTOCSID))
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_StockItemAddTOCSID)
	End if 
	If (Count parameters:C259>=3)
		If ($3#"")
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$3)
			//GOTO XY(0;0)
			//message("PROCESS-"+String(Current process)+"PRODUCT "+$3)
		End if 
	End if 
	If (Count parameters:C259>=2)
		If ($2>0)
			//GOTO XY(0;0)
			//message("PROCESS-"+String(Current process)+"STOCK ITEMS IDS "+String($2))
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$2)
		End if 
	End if 
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ToCorrect")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_CorrectRecordNum; 1; $_l_RecordsinSelection)
		//GOTO XY(0;0)
		//message("PROCESS-"+String(Current process)+"STOCK ITEM "+String($_l_CorrectRecordNum)+" of "+String($_l_RecordsinSelection))
		
		USE NAMED SELECTION:C332("$ToCorrect")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CorrectRecordNum)
		$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
		$_l_StockItemAddTOCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				//GOTO XY(0;0)
				//message("PROCESS-"+String(Current process)+"Current stock does not exist ")
				
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
				[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				$_l_StockItemAddTOCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
			End if 
			
		End if 
		REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
		REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
			
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				//GOTO XY(0;0)
				//message("PROCESS-"+String(Current process)+"Current stock does not exist 2 ")
				
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			End if 
		End if 
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		$_bo_Edit:=False:C215
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockItemID)
		$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#$_l_StockItemAddTOCSID)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
			For ($_l_MoveItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
				[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				$_bo_Edit:=True:C214
			End for 
			
		End if 
		USE NAMED SELECTION:C332("$ToCorrect")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CorrectRecordNum)
		If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0) | ($_r_Sum>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			//TRACE
			//GOTO XY(0;0)
			//message("PROCESS-"+String(Current process)+"Residual Stock wrong ")
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			//LOAD RECORD([STOCK ITEMS])
			//$_l_Repeats:=0
			//$_l_Delay:=0
			//Repeat
			//$_l_Repeats:=$_l_Repeats+1
			//$_bo_OK:=Check_Locked (->[STOCK ITEMS];1)
			//If (Not($_bo_OK))
			//If (($_l_Repeats/10)=(Int($_l_Repeats/10)))
			//only increase every 10 tries
			//$_l_Delay:=$_l_Delay+1  `increase the delay factor by 1
			//End if
			//DelayTicks (2*$_l_Delay)
			//End if
			//Until ($_bo_OK=True)
			
			$_r_BreakOff:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
			//[STOCK ITEMS]Moved_Quantity:=[STOCK ITEMS]Moved_Quantity-$_r_BreakOff
			//[STOCK ITEMS]Quantity:=[STOCK ITEMS]Quantity-$_r_BreakOff
			//[STOCK ITEMS]Total Cost:=Gen_Round (([STOCK ITEMS]Cost Price*Abs([STOCK ITEMS]Quantity));2;2)  `4.0.035/6
			//SAVE RECORD([STOCK ITEMS])
			//DUPLICATE RECORD([STOCK ITEMS])
			//`STOCK ITEMS]CalledOffQuantity:=0
			//[STOCK ITEMS]Moved_Quantity:=$_r_BreakOff
			//[STOCK ITEMS]Quantity:=$_r_BreakOff
			//[STOCK ITEMS]Item Number:=0
			//[STOCK ITEMS]Order Code:=""
			//[STOCK ITEMS]Company To:=""
			//[STOCK ITEMS]x_ID:=0
			//[STOCK ITEMS]x_ID:=AA_GetNextID (->[STOCK ITEMS]x_ID)
			//[STOCK ITEMS]XResidualStockQuantity:=[STOCK ITEMS]Quantity
			//[STOCK ITEMS]Total Cost:=Gen_Round (([STOCK ITEMS]Cost Price*Abs([STOCK ITEMS]Quantity));2;2)  `4.0.035/6
			//SAVE RECORD([STOCK ITEMS])
			//$_l_IDNEW:=[STOCK ITEMS]x_ID
			$_r_QuantityToReset:=$_r_BreakOff
			USE NAMED SELECTION:C332("$ToCorrect")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_CorrectRecordNum)
			$_l_IDOLD:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			$_r_OKQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_IDOLD)
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$FIX")
			$_r_RecordsinSelection2:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			ARRAY LONGINT:C221($_al_IDsOLD; 1)
			ARRAY LONGINT:C221($_al_IDsNEW; 1)
			ARRAY REAL:C219($_ar_ResetQuantities; 1)
			ARRAY REAL:C219($_ar_KeepQuantities; 1)
			$_al_IDsOLD{1}:=$_l_IDOLD
			$_al_IDsNEW{1}:=0
			$_ar_ResetQuantities{1}:=$_r_QuantityToReset
			$_ar_KeepQuantities{1}:=$_r_OKQuantity
			
			Repeat 
				COPY ARRAY:C226($_al_IDsOLD; $_al_IDsOLD1)
				COPY ARRAY:C226($_al_IDsNEW; $_al_IDsNEW1)
				COPY ARRAY:C226($_ar_ResetQuantities; $_ar_ResetQuantities1)
				COPY ARRAY:C226($_ar_KeepQuantities; $_ar_KeepQuantities1)
				ARRAY LONGINT:C221($_al_IDsOLD; 0)
				ARRAY LONGINT:C221($_al_IDsNEW; 0)
				ARRAY REAL:C219($_ar_ResetQuantities; 0)
				ARRAY REAL:C219($_ar_KeepQuantities; 0)
				For ($_l_ChidrenIndex; 1; Size of array:C274($_al_IDsOLD1))
					//GOTO XY(0;0)
					//message("PROCESS-"+String(Current process)+"change copied from ID Children:"+String($_l_ChidrenIndex))
					
					$_r_OKQuantity:=$_ar_KeepQuantities1{$_l_ChidrenIndex}
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_IDsOLD1{$_l_ChidrenIndex})
					$_l_IDNEW:=$_al_IDsNEW1{$_l_ChidrenIndex}
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$FIX")
					$_r_RecordsinSelection3:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					$_r_QuantitySoFar:=0
					For ($_l_KeepIndex; 1; $_r_RecordsinSelection3)
						//GOTO XY(0;0)
						//message("PROCESS-"+String(Current process)+"change copied from ID Children:"+String($_l_ChidrenIndex)+"KEEP"+String($_l_KeepIndex))
						
						USE NAMED SELECTION:C332("$FIX")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_KeepIndex)
						UNLOAD RECORD:C212([CURRENT_STOCK:62])
						$_l_Repeats:=0
						$_l_Delay:=0
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
							
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						If (([STOCK_MOVEMENT_ITEMS:27]Quantity:12+$_r_QuantitySoFar)>$_r_OKQuantity)
							If ($_r_QuantitySoFar<$_r_OKQuantity)
								//WE HAVE NOT REACHED THE LMIIT BUT THIS WILL EXCEED THE LIMIT SO WE HAVE TO SPLIT THIS ITEM....
								$_r_SplitOff:=$_r_OKQuantity-$_r_QuantitySoFar
								[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40-$_r_SplitOff
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_SplitOff
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
								
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
								$_l_IDOLD:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								$_r_KeepQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								//WE WILL RECALL THIS PROCESS SO THAT THIS ITEM NOW GETS ANY CHILDREN CHECKED....
								STK_ItemDuplicate
								STK_SetCreatedStockItem(0; ($_r_SplitOff); $_l_IDNEW; 0; STK_l_OrderItemNumber)
								APPEND TO ARRAY:C911($_al_IDsOLD; $_l_IDOLD)
								APPEND TO ARRAY:C911($_al_IDsNEW; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								APPEND TO ARRAY:C911($_ar_ResetQuantities; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								APPEND TO ARRAY:C911($_ar_KeepQuantities; $_r_KeepQuantity)
								
								$_r_QuantitySoFar:=$_r_OKQuantity
							Else 
								//WE HAVE ALREADY REACHED THE LIMIT SO JUST CHANGE THE COPIED FROM ON THIS ONE
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_IDNEW
								Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							End if 
						Else 
							$_r_QuantitySoFar:=$_r_QuantitySoFar+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						End if 
						
					End for 
				End for 
				
				
				
			Until (Size of array:C274($_al_IDsOLD)=0)
		End if 
		If ($_bo_Edit)
			STK_UpdateCalledOffQuantity
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
		End if 
		
		
	End for 
End if 
ERR_MethodTrackerReturn("STK_ValidateCalledOff"; $_t_oldMethodName)
