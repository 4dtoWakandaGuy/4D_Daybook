//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_CopyPrev
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
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	C_BOOLEAN:C305($_bo_IntoStock)
	C_LONGINT:C283(STOCK_l_Context; STOCK_l_CopyProcess)
	C_TEXT:C284($_t_DragString; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_CopyPrev")
//StockI_CopyPrev

Menu_Record("StockI_CopyPrev"; "Copy Previous Movt")
$_bo_IntoStock:=False:C215
If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
	If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
		$_bo_IntoStock:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
	End if 
	
	//NG May 2004
	//new method..show the stock movement in another process...
	If (STOCK_l_Context>=0)
		$_t_DragString:="STKItems"
		//AL_SetDrgDst (STK_PowerviewITEMS;1;$_t_DragString)  ` todo
		LBI_SetDRGPair(1; ->STK_LB_StockItems; $_t_DragString)
		
		STOCK_l_CopyProcess:=New process:C317("StockI_CopyPrevProcess"; DB_ProcessMemoryinit(6); "Copy Previous to"+String:C10(Current process:C322); String:C10(Current process:C322); [STOCK_MOVEMENTS:40]Company_From:2; [STOCK_MOVEMENTS:40]Movement_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6; ""; "-1"; *)
		SHOW PROCESS:C325(STOCK_l_CopyProcess)
		BRING TO FRONT:C326(STOCK_l_CopyProcess)
	End if 
Else 
	Gen_Alert("You may not copy stock to a movement until the movement type is identified")
End if 
ERR_MethodTrackerReturn("StockI_CopyPrev"; $_t_oldMethodName)
