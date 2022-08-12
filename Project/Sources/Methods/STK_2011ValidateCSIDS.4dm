//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_2011ValidateCSIDS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   06/01/2011 14:35 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CSIndex; $_l_EditCount; $_l_RecordsinSelection; $_l_SMIndex; $_l_StockItemID; $_l_StockItemIDNEW)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_2011ValidateCSIDS")
If (Count parameters:C259>=1)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
Else 
	ALL RECORDS:C47([CURRENT_STOCK:62])
End if 
$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
$_l_EditCount:=0
CREATE SET:C116([CURRENT_STOCK:62]; "ALLCS")
For ($_l_SMIndex; 1; $_l_RecordsinSelection)
	//MESSAGE(String($_l_SMIndex)+" edited "+String($_l_EditCount))
	USE SET:C118("ALLCS")
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SMIndex)
	$_l_StockItemID:=[CURRENT_STOCK:62]X_ID:13
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_StockItemID)
	If (Records in selection:C76([CURRENT_STOCK:62])>1)
		$_l_StockItemIDNEW:=AA_GetNextID(->[CURRENT_STOCK:62]X_ID:13)
		
		FIRST RECORD:C50([CURRENT_STOCK:62])
		//TRACE
		//Gen_Alert (String(Record number([CURRENT STOCK])))
		$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
		NEXT RECORD:C51([CURRENT_STOCK:62])
		For ($_l_CSIndex; 2; Records in selection:C76([CURRENT_STOCK:62]))
			$_l_EditCount:=$_l_EditCount+1
			[CURRENT_STOCK:62]X_ID:13:=0
			$_l_StockItemIDNEW:=AA_GetNextID(->[CURRENT_STOCK:62]X_ID:13)
			[CURRENT_STOCK:62]X_ID:13:=$_l_StockItemIDNEW
			SAVE RECORD:C53([CURRENT_STOCK:62])
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
	End if 
End for 
UNLOAD RECORD:C212([CURRENT_STOCK:62])

//```
If (Count parameters:C259>=1)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
Else 
	ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
End if 

$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
$_l_EditCount:=0
CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ALLSI")
For ($_l_SMIndex; 1; $_l_RecordsinSelection)
	//MESSAGE(String($_l_SMIndex)+" edited "+String($_l_EditCount))
	USE SET:C118("ALLSI")
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SMIndex)
	$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
		FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_CSIndex; 2; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			//TRACE
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
			$_l_StockItemIDNEW:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			$_l_EditCount:=$_l_EditCount+1
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=$_l_StockItemIDNEW
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
	End if 
End for 
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("STK_2011ValidateCSIDS"; $_t_oldMethodName)
