//%attributes = {}
If (False:C215)
	//Project Method Name:      Movement_CodeUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 11:41`Method: Movement_CodeUp
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StockMovementIDS; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	C_LONGINT:C283($_l_BlankIDRow; $_l_index)
	C_TEXT:C284($_t_MovementCode; $_t_MovementTypeNumber; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movement_CodeUp")
If ([STOCK_MOVEMENTS:40]Movement_Code:1="*T@")
	$_t_MovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
	$_t_MovementTypeNumber:=[STOCK_MOVEMENTS:40]Type_Number:4
	Movement_Code
	If (OK=1)
		If ([STOCK_MOVEMENTS:40]Type_Number:4="*TBA")
			[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [STOCK_MOVEMENTS:40]Movement_Type:6; [STOCK_MOVEMENTS:40]Movement_Type:6)
		End if 
		//i have added the xID thingy here
		//this is so the IDs of the records get loaded
		//if they are 0 and in a transaction
		//the ids must be updated before
		//we 'save' the records as the trigger locks up the record and then crashes itself
		//i think thats a 4D bug!!!!
		If (OK=1)
			If ([STOCK_MOVEMENTS:40]x_ID:22=0)
				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
			End if 
			
			ARRAY TEXT:C222($_at_StockMovementCodes; 0)
			ARRAY LONGINT:C221($_al_StockMovementIDS; 0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_MovementCode)
			
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockMovementIDS; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
			
			$_l_BlankIDRow:=Find in array:C230($_al_StockMovementIDS; 0)
			If ($_l_BlankIDRow>0)
				For ($_l_index; $_l_BlankIDRow; Size of array:C274($_at_StockMovementCodes))
					$_at_StockMovementCodes{$_l_index}:=[STOCK_MOVEMENTS:40]Movement_Code:1
					
					If ($_al_StockMovementIDS{$_l_index}=0)
						$_al_StockMovementIDS{$_l_index}:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					End if 
					
				End for 
			Else 
				For ($_l_index; 1; Size of array:C274($_at_StockMovementCodes))
					$_at_StockMovementCodes{$_l_index}:=[STOCK_MOVEMENTS:40]Movement_Code:1
				End for 
				
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_MovementCode)
			ARRAY TO SELECTION:C261($_at_StockMovementCodes; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_al_StockMovementIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
		Else 
			[STOCK_MOVEMENTS:40]Movement_Code:1:=$_t_MovementCode
			[STOCK_MOVEMENTS:40]Type_Number:4:=$_t_MovementTypeNumber
			ABORT:C156
		End if 
	Else 
		[STOCK_MOVEMENTS:40]Movement_Code:1:=$_t_MovementCode
		[STOCK_MOVEMENTS:40]Type_Number:4:=$_t_MovementTypeNumber
		ABORT:C156
	End if 
End if 
ERR_MethodTrackerReturn("Movement_CodeUp"; $_t_oldMethodName)
