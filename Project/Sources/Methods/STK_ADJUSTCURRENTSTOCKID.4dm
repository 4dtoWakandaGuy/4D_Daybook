//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ADJUSTCURRENTSTOCKID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/12/2010 10:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_IDDeleted; $_l_IDNew; $_l_Index; $_l_Retries; $1; $2)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ADJUSTCURRENTSTOCKID")
//THIS METHOD IS CALLED IN A PROCESS WHEN WE DELETE CURRENT STOCK RECORDS(TO MERGE THEM(WHICH SHOULD NOT REALLY HAPPEN)
If (Count parameters:C259>=2)
	
	$_l_IDDeleted:=$1
	$_l_IDNew:=$2
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$1)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
		Repeat 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
				For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(30*$_l_Retries)
					End while 
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$2
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
				//APPLY TO SELECTION([STOCK ITEMS];[STOCK ITEMS]xAddtoCurrentStockID:=$2)
			Else 
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(30*$_l_Retries)
				End while 
				[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$2
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			End if 
			If (Records in set:C195("LockedSet")>0)
				DelayTicks(90)
				USE SET:C118("LockedSet")
			End if 
			
			
			
			
		Until (Records in set:C195("LockedSet")=0)
	Else 
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(30*$_l_Retries)
		End while 
		[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$2
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	End if 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$1)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
		Repeat 
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
				//APPLY TO SELECTION([STOCK ITEMS];[STOCK ITEMS]xTakeFromCurrentStockID:=$2)
				For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(30*$_l_Retries)
					End while 
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$2
					<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				End for 
			Else 
				$_l_Retries:=0
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(30*$_l_Retries)
				End while 
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$2
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			End if 
			If (Records in set:C195("LockedSet")>0)
				DelayTicks(90)
				USE SET:C118("LockedSet")
			End if 
			
			
			
			
		Until (Records in set:C195("LockedSet")=0)
	Else 
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(30*$_l_Retries)
		End while 
		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$2
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	End if 
	
End if 
ERR_MethodTrackerReturn("STK_ADJUSTCURRENTSTOCKID"; $_t_oldMethodName)
