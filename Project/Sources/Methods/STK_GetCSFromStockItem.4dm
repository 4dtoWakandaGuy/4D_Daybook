//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetCSFromStockItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/02/2011 17:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_CSset; STK_bo_CSReceived)
	C_LONGINT:C283($_l_CurrentStockID; $_l_Retries; $1; $2; $3; DB_l_CSID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetCSFromStockItem")
If (Count parameters:C259>=3)
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	If ($3>0)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$3)
		Case of 
			: ($2=1)  //get the current stock added to
				$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
			Else 
				$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
		End case 
		STK_bo_CSReceived:=False:C215
		SET PROCESS VARIABLE:C370($1; DB_l_CSID; $_l_CurrentStockID)
		SET PROCESS VARIABLE:C370($1; DB_bo_CSset; True:C214)
		$_l_Retries:=0
		Repeat 
			$_l_Retries:=$_l_Retries+1
			RESUME PROCESS:C320($1)
			DelayTicks(2*$_l_Retries)
			
		Until (STK_bo_CSReceived)
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetCSFromStockItem"; $_t_oldMethodName)
