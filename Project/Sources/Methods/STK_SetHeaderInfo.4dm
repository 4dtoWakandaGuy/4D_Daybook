//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SetHeaderInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/07/2011 16:42 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocClog; $_bo_Edits; $0)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SetHeaderInfo")
$_bo_AllocClog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)
If ($_bo_AllocClog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+Process_Name(Current process:C322)+"set header info start="+String:C10(Current time:C178)
End if 

$_bo_Edits:=False:C215
If ([STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
		[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
		$_bo_Edits:=True:C214
		
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
		[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
		$_bo_Edits:=True:C214
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
		[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
		$_bo_Edits:=True:C214
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
		[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
		$_bo_Edits:=True:C214
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
		[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
		$_bo_Edits:=True:C214
	End if 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
		If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		End if 
		[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
		If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
		End if 
		If ([MOVEMENT_TYPES:60]Assembly_Type:23)
			If ([STOCK_MOVEMENT_ITEMS:27]Component_Qty:15#0) | ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="N") | ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="*MINUS")
				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="N") | ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="*PLUS")
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="N"
					
				End if 
			End if 
		Else 
			
			If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
			Else 
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
			End if 
		End if 
	Else 
		If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
			$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Plus:3
		Else 
			$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
			$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#$_t_MovementTypeStockAdd) | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#$_t_MovementTypeStockSubtract)
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					End if 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					End if 
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Plus:3)
					$_bo_Edits:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					End if 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Minus:4)
					$_bo_Edits:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					End if 
				End if 
			End if 
		Else 
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					End if 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0)
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					End if 
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
					If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#-Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						$_bo_Edits:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					End if 
				Else 
					If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						$_bo_Edits:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					End if 
				End if 
			End if 
			
		End if 
		
		
	End if 
Else 
	If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
		If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			$_bo_Edits:=True:C214
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
				$_bo_Edits:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
			End if 
		End if 
	Else 
		If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			$_bo_Edits:=True:C214
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
				End if 
			End if 
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Minus:4)
					$_bo_Edits:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Plus:3)
					$_bo_Edits:=True:C214
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
				End if 
			End if 
		End if 
	End if 
End if 
$0:=$_bo_Edits
If ($_bo_AllocClog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+Process_Name(Current process:C322)+"set header info end="+String:C10(Current time:C178)
End if 
ERR_MethodTrackerReturn("STK_SetHeaderInfo"; $_t_oldMethodName)
