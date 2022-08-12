//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_2011SetInverted
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      07/01/2011 15:35 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StockItemsIDSToMove; 0)
	ARRAY TEXT:C222($_at_allocationStockMovements; 0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	ARRAY TEXT:C222($_at_DuplicatedMovements; 0)
	ARRAY TEXT:C222($_at_DuplicatedNewMovements; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	ARRAY TEXT:C222($_at_UnAllocationMoveTypes; 0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_ItemRow; $_l_ItemsIndex; $_l_ItemsIndex2; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_2011SetInverted")
//This method will change any stock movements that have a negative quantity to positive and mark the inverted type
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_UnAllocationMoveTypes)
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
If (Count parameters:C259>=1)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
End if 
If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
	CREATE SET:C116([STOCK_MOVEMENTS:40]; "$allmovements")
	
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_AllocationTypes)
	If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
		
		CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_AllocationTypes")
		SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_allocationStockMovements)
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_allocationStockMovements)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
		ARRAY LONGINT:C221($_al_StockItemsIDSToMove; 0)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsIDSToMove)
			//These items will need to be moved from the 'unallocation' we are about to create and put on another alloction..i doubt we will find any
		End if 
		
		READ WRITE:C146([STOCK_MOVEMENTS:40])
		LOAD RECORD:C52([STOCK_MOVEMENTS:40])
		For ($_l_ItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
			If ($_l_ItemsIndex=91)
				
			End if 
			$_l_Retries:=0
			While (Not:C34(Check_Locked(->[STOCK_MOVEMENTS:40]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*$_l_Retries)
				If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
					//GOTO XY(0;0)
					//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" Locked")
					
				End if 
				
			End while 
			If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
				//GOTO XY(0;0)
				//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS])))
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				
				For ($_l_ItemsIndex2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
						//GOTO XY(0;0)
						//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" "+String($_l_ItemsIndex2)+" of "+String(Records in selection([STOCK ITEMS]))+" items")
					End if 
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(60*$_l_Retries)
						If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
							//GOTO XY(0;0)
							//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" "+String($_l_ItemsIndex2)+" of "+String(Records in selection([STOCK ITEMS]))+" items"+" Locked")
						End if 
					End while 
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
				[STOCK_MOVEMENTS:40]Movement_Type:6:="UNA"
				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
				
			Else 
				If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
					//GOTO XY(0;0)
					//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" Items already inverted")
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				For ($_l_ItemsIndex2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					$_l_ItemRow:=Find in array:C230($_al_StockItemsIDSToMove; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					If ($_l_ItemRow>0)
						DELETE FROM ARRAY:C228($_al_StockItemsIDSToMove; $_l_ItemRow)
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
				
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENTS:40])
		End for 
		If (Size of array:C274($_al_StockItemsIDSToMove)>0)
			
			ARRAY TEXT:C222($_at_DuplicatedMovements; 0)
			ARRAY TEXT:C222($_at_DuplicatedNewMovements; 0)
			
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsIDSToMove)
			For ($_l_ItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(60*$_l_Retries)
					If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
						//GOTO XY(0;0)
						//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK ITEMS]))+" items"+" Locked")
					End if 
				End while 
				$_l_ItemRow:=Find in array:C230($_at_DuplicatedMovements; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				If ($_l_ItemRow<0)
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					DUPLICATE RECORD:C225([STOCK_MOVEMENTS:40])
					[STOCK_MOVEMENTS:40]Movement_Type:6:="ALO"
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="ALO")
					
					[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
					[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
					[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
					SAVE RECORD:C53([STOCK_MOVEMENTS:40])
					APPEND TO ARRAY:C911($_at_DuplicatedMovements; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					APPEND TO ARRAY:C911($_at_DuplicatedNewMovements; [STOCK_MOVEMENTS:40]Movement_Code:1)
					$_l_ItemRow:=Size of array:C274($_at_DuplicatedMovements)
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=$_at_DuplicatedNewMovements{$_l_ItemRow}
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			
		End if 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
		If (Count parameters:C259>=1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
		End if 
	End if 
	//``
	//SELECTION TO ARRAY([STOCK ITEMS]Movement Code;$_at_StockMovementCodes)
	//QUERY WITH ARRAY([STOCK MOVEMENTS]Movement Code;$_at_StockMovementCodes)
	USE SET:C118("$allmovements")
	
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_UnAllocationMoveTypes)
	If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
		If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
			//GOTO XY(0;0)
			//MESSAGE(String(Records in selection([STOCK MOVEMENTS]))+"unAllocation Movements")
		End if 
		
		CREATE SET:C116([STOCK_MOVEMENTS:40]; "$_at_AllocationTypes")
		SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_allocationStockMovements)
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_allocationStockMovements)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
		ARRAY LONGINT:C221($_al_StockItemsIDSToMove; 0)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsIDSToMove)
			//These items will need to be moved from the 'allocation' we are about to create and put on another unalloction..i doubt we will find any
		End if 
		
		READ WRITE:C146([STOCK_MOVEMENTS:40])
		LOAD RECORD:C52([STOCK_MOVEMENTS:40])
		For ($_l_ItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
			$_l_Retries:=0
			While (Not:C34(Check_Locked(->[STOCK_MOVEMENTS:40]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*$_l_Retries)
				If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
					//GOTO XY(0;0)
					//MESSAGE("(UnAllocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" Locked")
				End if 
			End while 
			If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
				//GOTO XY(0;0)
				//MESSAGE("(UnAllocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS])))
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				For ($_l_ItemsIndex2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
						//GOTO XY(0;0)
						//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" "+String($_l_ItemsIndex2)+" of "+String(Records in selection([STOCK ITEMS]))+" items")
					End if 
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(60*$_l_Retries)
						If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
							//GOTO XY(0;0)
							//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" "+String($_l_ItemsIndex2)+" of "+String(Records in selection([STOCK ITEMS]))+" items"+" Locked")
						End if 
					End while 
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
				//[STOCK MOVEMENTS]Movement Type:="ALO"
				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
				
			Else 
				If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
					//GOTO XY(0;0)
					//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+" Items already inverted")
				End if 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				For ($_l_ItemsIndex2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					$_l_ItemRow:=Find in array:C230($_al_StockItemsIDSToMove; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					If ($_l_ItemRow>0)
						DELETE FROM ARRAY:C228($_al_StockItemsIDSToMove; $_l_ItemRow)
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
				
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENTS:40])
		End for 
		If (Size of array:C274($_al_StockItemsIDSToMove)>0) & (False:C215)
			If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
				//GOTO XY(0;0)
				//MESSAGE("Moving stock items to new movements")
				
			End if 
			ARRAY TEXT:C222($_at_DuplicatedMovements; 0)
			ARRAY TEXT:C222($_at_DuplicatedNewMovements; 0)
			
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemsIDSToMove)
			For ($_l_ItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(60*$_l_Retries)
				End while 
				$_l_ItemRow:=Find in array:C230($_at_DuplicatedMovements; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				If ($_l_ItemRow<0)
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(60*$_l_Retries)
						If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
							//GOTO XY(0;0)
							//MESSAGE("(Allocation Movements "+[STOCK MOVEMENTS]Movement Code+" "+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK MOVEMENTS]))+String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK ITEMS]))+" items"+" Locked")
						End if 
					End while 
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					DUPLICATE RECORD:C225([STOCK_MOVEMENTS:40])
					[STOCK_MOVEMENTS:40]Movement_Type:6:="UNA"
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="UNA")
					
					[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
					[STOCK_MOVEMENTS:40]Movement_Code:1:=Gen_CodePref(10; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
					[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
					SAVE RECORD:C53([STOCK_MOVEMENTS:40])
					APPEND TO ARRAY:C911($_at_DuplicatedMovements; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					APPEND TO ARRAY:C911($_at_DuplicatedNewMovements; [STOCK_MOVEMENTS:40]Movement_Code:1)
					$_l_ItemRow:=Size of array:C274($_at_DuplicatedMovements)
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=$_at_DuplicatedNewMovements{$_l_ItemRow}
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			
		End if 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
		If (Count parameters:C259>=1)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
		End if 
	End if 
	MESSAGES ON:C181
	
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Apply")
	Repeat 
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214)
		USE SET:C118("LockedSet")
	Until (Records in set:C195("LockedSet")=0)
	USE NAMED SELECTION:C332("$Apply")
	Repeat 
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		USE SET:C118("LockedSet")
	Until (Records in set:C195("LockedSet")=0)
	USE NAMED SELECTION:C332("$Apply")
	Repeat 
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		USE SET:C118("LockedSet")
	Until (Records in set:C195("LockedSet")=0)
	USE NAMED SELECTION:C332("$Apply")
	Repeat 
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2))
		USE SET:C118("LockedSet")
	Until (Records in set:C195("LockedSet")=0)
	USE NAMED SELECTION:C332("$Apply")
	
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	For ($_l_ItemsIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(60*$_l_Retries)
			If (Application type:C494=4D Server:K5:6) & (Count parameters:C259=0)
				//GOTO XY(0;0)
				//MESSAGE(String($_l_ItemsIndex)+" of "+String(Records in selection([STOCK ITEMS])))
				
			End if 
			
		End while 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="")
			QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
		End if 
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
		[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
End if 
ERR_MethodTrackerReturn("STK_2011SetInverted"; $_t_oldMethodName)
