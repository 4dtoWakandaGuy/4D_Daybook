//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ItemsResetCalledFrom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 15:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_SplitKeep; 0)
	ARRAY REAL:C219($_ar_SplitQuantity; 0)
	C_BOOLEAN:C305($_bo_GiveUp; STK_bo_Continue)
	C_LONGINT:C283($_l_CopiedFromID; $_l_Index; $_l_Process; $2; $3; STK_l_ID)
	C_REAL:C285($_r_MaxCalledoff; $_r_MaxThisLine; $_r_SplitQuantity; $_r_Sum; $_r_Total; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ItemsResetCalledFrom")
STK_bo_Continue:=False:C215
$_r_MaxCalledoff:=$1
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$2)
$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($2))

If ($_r_Sum>$_r_MaxCalledoff)
	$_r_Total:=0
	CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$toReset")
	CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$toSplit")
	ARRAY REAL:C219($_ar_SplitQuantity; 0)
	ARRAY REAL:C219($_ar_SplitKeep; 0)
	For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		If (([STOCK_MOVEMENT_ITEMS:27]Quantity:12+$_r_Total)>$_r_MaxCalledoff)
			If ($_r_Total<$_r_MaxCalledoff)
				//split this item
				$_r_MaxThisLine:=$_r_MaxCalledoff-$_r_Total
				APPEND TO ARRAY:C911($_ar_SplitQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_MaxThisLine)
				APPEND TO ARRAY:C911($_ar_SplitKeep; $_r_MaxThisLine)
				ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$toSplit")
			Else 
				ADD TO SET:C119([STOCK_MOVEMENT_ITEMS:27]; "$toReset")
				
			End if 
		End if 
		
		$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		
	End for 
	$_bo_GiveUp:=False:C215
	If (Records in set:C195("$toSplit")>0)
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		
		USE SET:C118("$tosplit")
		$_r_SplitQuantity:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_Index; 1; $_r_SplitQuantity)
			USE SET:C118("$tosplit")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0; False:C215))) & ($_bo_GiveUp=False:C215)
				DelayTicks(2)
			End while 
			STK_ItemDuplicate
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
			STK_SetCreatedStockItem(0; ($_ar_SplitQuantity{$_l_Index}); 0; 0; 0)
			If ($_l_CopiedFromID>0)
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
			End if 
			//DB_SaveRecord (->[STOCK_MOVEMENT_ITEMS])
			USE SET:C118("$tosplit")
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=$_ar_SplitKeep{$_l_Index}
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_SplitKeep{$_l_Index}
			//TRACE
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
				//call this method to split those children
				$_l_Process:=New process:C317("STK_ItemsResetCalledFrom"; 256000; "Change called from"; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				While (Process state:C330($_l_Process)>=0)
					DelayTicks(3)
				End while 
			End if 
		End for 
	End if 
	If (Records in set:C195("$toReset")>0)
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		USE SET:C118("$toReset")
		
		For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			USE SET:C118("$toReset")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
			If ($_l_CopiedFromID>0)
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
				STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
			End if 
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			
		End for 
		STK_UpdateCalledOffQuantity(-$2)
		
		
	End if 
	
	
End if 
If (Count parameters:C259>=3)
	DELAY PROCESS:C323(Current process:C322; (10*60))
	SET PROCESS VARIABLE:C370($3; STK_bo_Continue; True:C214)
	RESUME PROCESS:C320($3)
End if 
ERR_MethodTrackerReturn("STK_ItemsResetCalledFrom"; $_t_oldMethodName)
