//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_MenuUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     05/07/2011 10:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AddtoCSIDS; 0)
	ARRAY LONGINT:C221($_al_CSIDS; 0)
	ARRAY LONGINT:C221($_al_CSStockLevelIDS; 0)
	ARRAY LONGINT:C221($_al_MovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_StockLevelIDS; 0)
	ARRAY LONGINT:C221($_al_TakeFromCSIDS; 0)
	C_BOOLEAN:C305(<>BShowMessages; $_bo_EditCurrentStock; $_bo_LoadSelection; $_bo_ReadOnlyStateCS; $_bo_ReadOnlyStateLevels; $_bo_ReadOnlyStateMI; $3; $4)
	C_LONGINT:C283($_l_CurrecStockIndex; $_l_CurrentStockID; $_l_CurrentStockIndex; $_l_GetCurrentStockProcess; $_l_MovementItemIndex; $_l_SelectedRecordNumCS; $_l_SelectedRecordNumMI; $_l_SelectedRecordNumSL)
	C_REAL:C285($_r_CSSUm; $_r_Sum; $_r_Sum2)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_MenuUpdate")
$_bo_ReadOnlyStateLevels:=Read only state:C362([STOCK_LEVELS:58])
$_bo_ReadOnlyStateCS:=Read only state:C362([CURRENT_STOCK:62])
$_bo_ReadOnlyStateMI:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])

COPY NAMED SELECTION:C331([STOCK_LEVELS:58]; "$Temp")
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$SCTemp")
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$SITemp")
$_l_SelectedRecordNumMI:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
$_l_SelectedRecordNumCS:=Selected record number:C246([CURRENT_STOCK:62])
$_l_SelectedRecordNumSL:=Selected record number:C246([STOCK_LEVELS:58])
MESSAGES OFF:C175
If (Count parameters:C259>=1)
	Case of 
		: ($1="Current stock")
			If (Count parameters:C259>=2)
				If ($2#"")
					If ([CURRENT_STOCK:62]Product_Code:1#$2)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$2)
					End if 
				End if 
			End if 
			If (Count parameters:C259>=3)
				$_bo_LoadSelection:=$3
			Else 
				$_bo_LoadSelection:=True:C214
			End if 
			If ($_bo_LoadSelection)
				
				DISTINCT VALUES:C339([CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_CSStockLevelIDS)
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_MovementItemIDS{$_l_MovementItemIndex})
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
						DelayTicks(10)
					End while 
					STK_UpdateCalledOffQuantity(-$_al_MovementItemIDS{$_l_MovementItemIndex})
				End for 
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_CSIDS)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_MovementItemIDS{$_l_MovementItemIndex})
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
						DelayTicks(10)
					End while 
					STK_UpdateCalledOffQuantity(-$_al_MovementItemIDS{$_l_MovementItemIndex})
				End for 
				USE NAMED SELECTION:C332("$SCTemp")
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
				For ($_l_MovementItemIndex; 1; Size of array:C274($_al_CSIDS))
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSIDS{$_l_MovementItemIndex})
					
					While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
						DelayTicks(10)
					End while 
					UNLOAD RECORD:C212([CURRENT_STOCK:62])
					STK_UpdateCurrentStock2011($_al_CSIDS{$_l_MovementItemIndex})
				End for 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				READ WRITE:C146([STOCK_LEVELS:58])
				QUERY WITH ARRAY:C644([STOCK_LEVELS:58]X_ID:10; $_al_CSStockLevelIDS)
				APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				
			Else 
				ARRAY LONGINT:C221($_al_CSStockLevelIDS; 0)
				APPEND TO ARRAY:C911($_al_CSStockLevelIDS; [CURRENT_STOCK:62]x_Stock_Level_ID:15)
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
				STK_UpdateCurrentStock2011
				SAVE RECORD:C53([CURRENT_STOCK:62])
				READ WRITE:C146([STOCK_LEVELS:58])
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
				APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				
			End if 
			
			
		: ($1="Stock Items")
			If (Count parameters:C259>=2)
				If ($2#"")
					If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$2)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$2)
					End if 
				End if 
			End if 
			If (Count parameters:C259>=3)
				$_bo_LoadSelection:=$3
			Else 
				$_bo_LoadSelection:=True:C214
			End if 
			If ($_bo_LoadSelection)
				$_bo_EditCurrentStock:=False:C215
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				//MESSAGE("Applying to seleciton "+String(Records in selection([STOCK ITEMS]))+" called off quantities")
				//◊BShowMessages:=True
				$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
				$_r_Sum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				If ($_r_Sum2#$_r_Sum)
					$_bo_EditCurrentStock:=True:C214
				End if 
				<>BShowMessages:=False:C215
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_AddtoCSIDS)
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23; $_al_TakeFromCSIDS)
				For ($_l_MovementItemIndex; Size of array:C274($_al_AddtoCSIDS); 1; -1)
					If ($_al_AddtoCSIDS{$_l_MovementItemIndex}<=0)
						DELETE FROM ARRAY:C228($_al_AddtoCSIDS; $_l_MovementItemIndex)
					End if 
				End for 
				For ($_l_MovementItemIndex; Size of array:C274($_al_TakeFromCSIDS); 1; -1)
					If ($_al_TakeFromCSIDS{$_l_MovementItemIndex}<=0)
						DELETE FROM ARRAY:C228($_al_TakeFromCSIDS; $_l_MovementItemIndex)
					End if 
				End for 
				
			Else 
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				STK_UpdateCalledOffQuantity
				$_bo_EditCurrentStock:=True:C214
				$_r_Sum2:=([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				ARRAY LONGINT:C221($_al_AddtoCSIDS; 0)
				ARRAY LONGINT:C221($_al_TakeFromCSIDS; 0)
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					APPEND TO ARRAY:C911($_al_AddtoCSIDS; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
					APPEND TO ARRAY:C911($_al_AddtoCSIDS; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				End if 
				
			End if 
			$_r_CSSUm:=0
			If (Size of array:C274($_al_AddtoCSIDS)>0)
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]X_ID:13; $_al_AddtoCSIDS)
				$_r_CSSUm:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
				CREATE SET:C116([CURRENT_STOCK:62]; "$t1")
			Else 
				CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "$t1")
			End if 
			If (Size of array:C274($_al_TakeFromCSIDS)>0)
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]X_ID:13; $_al_TakeFromCSIDS)
				CREATE SET:C116([CURRENT_STOCK:62]; "$t2")
			Else 
				CREATE EMPTY SET:C140([CURRENT_STOCK:62]; "$t2")
			End if 
			UNION:C120("$t1"; "$t2"; "$st1")
			USE SET:C118("$st1")
			READ WRITE:C146([CURRENT_STOCK:62])
			//MESSAGE("updating  current stock "+String(Records in selection([CURRENT STOCK]))+"")
			
			If (Count parameters:C259>=4)
				If ($4)
					If ($2#"")
						$_bo_EditCurrentStock:=True:C214
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$2)
					End if 
				End if 
			End if 
			If ($_r_CSSUm#$_r_Sum2)
				$_bo_EditCurrentStock:=True:C214
			End if 
			If ($_bo_EditCurrentStock)
				MESSAGES ON:C181
				//◊BShowMessages:=True
				DISTINCT VALUES:C339([CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_StockLevelIDS)
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
				REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				For ($_l_CurrentStockIndex; 1; Size of array:C274($_al_CSIDS))
					$_l_CurrentStockID:=$_al_CSIDS{$_l_CurrentStockIndex}
					
					
					$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 128000; "ValidateCurrentStock-"+String:C10($_l_CurrentStockID); -$_l_CurrentStockID; 0; 0; 0; *)
					
					
					DelayTicks(10)
					While (Process state:C330($_l_GetCurrentStockProcess)>=0) & ((Process_Name($_l_GetCurrentStockProcess))=("ValidateCurrentStock-"+String:C10($_l_CurrentStockID)))
						DelayTicks(10)
					End while 
					//NEXT RECORD([CURRENT STOCK])
				End for 
				While (Process state:C330($_l_GetCurrentStockProcess)>=0) & ((Process_Name($_l_GetCurrentStockProcess))=("ValidateCurrentStock-"+String:C10($_l_CurrentStockID)))
					
					
					DelayTicks(10)
				End while 
				//APPLY TO SELECTION([CURRENT STOCK];STK_UpdateCurrentStock2011 )
				READ WRITE:C146([STOCK_LEVELS:58])
				QUERY WITH ARRAY:C644([STOCK_LEVELS:58]X_ID:10; $_al_StockLevelIDS)
				APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
				REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
				
				<>BShowMessages:=False:C215
			End if 
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			
		: ($1="Stock levels")
			If (Count parameters:C259>=2)
				If ($2#"")
					//If ([STOCK_LEVELS]Product_Code#$2)
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2)
					//End if
				End if 
			End if 
			COPY NAMED SELECTION:C331([STOCK_LEVELS:58]; "$SLTemp")
			
			If (Count parameters:C259>=3)
				$_bo_LoadSelection:=$3
			Else 
				$_bo_LoadSelection:=True:C214
			End if 
			If ($_bo_LoadSelection)
				DISTINCT VALUES:C339([STOCK_LEVELS:58]X_ID:10; $_al_StockLevelIDS)
				
			Else 
				ARRAY LONGINT:C221($_al_StockLevelIDS; 0)
				APPEND TO ARRAY:C911($_al_StockLevelIDS; [STOCK_LEVELS:58]X_ID:10)
			End if 
			QUERY WITH ARRAY:C644([CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_StockLevelIDS)
			CREATE SET:C116([CURRENT_STOCK:62]; "$s1")
			DISTINCT VALUES:C339([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_MovementItemIDS{$_l_MovementItemIndex})
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
					DelayTicks(10)
				End while 
				STK_UpdateCalledOffQuantity(-$_al_MovementItemIDS{$_l_MovementItemIndex})
			End for 
			//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			USE SET:C118("$s1")
			SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
			For ($_l_MovementItemIndex; 1; Size of array:C274($_al_CSIDS))
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSIDS{$_l_MovementItemIndex})
				
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				STK_UpdateCurrentStock2011($_al_CSIDS{$_l_MovementItemIndex})
			End for 
			//APPLY TO SELECTION([CURRENT_STOCK];STK_UpdateCurrentStock2011 )
			USE NAMED SELECTION:C332("$Temp")
			USE NAMED SELECTION:C332("$SLTemp")
			APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
			
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			
		Else 
			QUERY WITH ARRAY:C644([CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_StockLevelIDS)
			CREATE SET:C116([CURRENT_STOCK:62]; "$s1")
			DISTINCT VALUES:C339([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_MovementItemIDS{$_l_MovementItemIndex})
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
					DelayTicks(10)
				End while 
				STK_UpdateCalledOffQuantity(-$_al_MovementItemIDS{$_l_MovementItemIndex})
			End for 
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			USE SET:C118("$s1")
			SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
			For ($_l_MovementItemIndex; 1; Size of array:C274($_al_CSIDS))
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSIDS{$_l_MovementItemIndex})
				
				While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
					DelayTicks(10)
				End while 
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				STK_UpdateCurrentStock2011($_al_CSIDS{$_l_MovementItemIndex})
			End for 
			USE NAMED SELECTION:C332("$Temp")
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			
	End case 
	
Else 
	QUERY WITH ARRAY:C644([CURRENT_STOCK:62]x_Stock_Level_ID:15; $_al_StockLevelIDS)
	CREATE SET:C116([CURRENT_STOCK:62]; "$s1")
	DISTINCT VALUES:C339([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CSIDS)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_MovementItemIDS{$_l_MovementItemIndex})
		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27])))
			DelayTicks(10)
		End while 
		STK_UpdateCalledOffQuantity(-$_al_MovementItemIDS{$_l_MovementItemIndex})
	End for 
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	USE SET:C118("$s1")
	SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CSIDS)
	For ($_l_CurrecStockIndex; 1; Size of array:C274($_al_CSIDS))
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CSIDS{$_l_CurrecStockIndex})
		
		While (Not:C34(Check_Locked(->[CURRENT_STOCK:62])))
			DelayTicks(10)
		End while 
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		STK_UpdateCurrentStock2011($_al_CSIDS{$_l_CurrecStockIndex})
	End for 
	USE NAMED SELECTION:C332("$Temp")
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_UpdateStockLevels([STOCK_LEVELS:58]X_ID:10))
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	UNLOAD RECORD:C212([CURRENT_STOCK:62])
	
End if 
USE NAMED SELECTION:C332("$Temp")
USE NAMED SELECTION:C332("$SCTemp")
USE NAMED SELECTION:C332("$SITemp")
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
If ($_bo_ReadOnlyStateLevels)
	READ ONLY:C145([STOCK_LEVELS:58])
End if 
If ($_bo_ReadOnlyStateCS)
	READ ONLY:C145([CURRENT_STOCK:62])
End if 
If ($_bo_ReadOnlyStateMI)
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
End if 

If ($_l_SelectedRecordNumMI>=0)
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SelectedRecordNumMI)
End if 
If ($_l_SelectedRecordNumCS>=0)
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedRecordNumCS)
End if 
If ($_l_SelectedRecordNumSL>=0)
	GOTO SELECTED RECORD:C245([STOCK_LEVELS:58]; $_l_SelectedRecordNumSL)
End if 
MESSAGES ON:C181

//DISTINCT VALUES([CURRENT STOCK]xStockLevelID;$_al_CSStockLevelIDS)
ERR_MethodTrackerReturn("STK_MenuUpdate"; $_t_oldMethodName)
