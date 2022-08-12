//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 19:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY LONGINT(STK_al_AutoAllocateOI;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY REAL(STK_ar_AutoAllocateQTY;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_isCancellation; DB_bo_RecordModified; LBI_bo_NoEdit; STK_bo_AutoAllocateInited; STK_bo_AutoFill; STK_bo_LineTrackerActive; STK_bo_MoveOnOrderAllocation)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_FieldIndex; $_l_Index; $_l_ItemNumber; $_l_Process; $_l_RecordsInSet; $_l_Repeats; $_l_Retries; $_l_SetItemNumber; $_l_StockMovementItemID; $_l_tableNumber)
	C_LONGINT:C283(STK_but_consolidate; STK_l_CompanyID; STOCK_l_Context; vAdd; vPS)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_Field)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_AddToStockType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_CurrentStockMovementType; $_t_DragString; $_t_FromStockMovementCode; $_t_LayerCode; $_t_Location; $_t_oldMethodName; $_t_OrderCode)
	C_TEXT:C284($_t_SerialNumber; $_t_StockMovementType; $_t_SubItemName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_t_MovementParentLabel; STK_t_AddMovementType; STK_t_CopyNote; STK_t_CurrentStockType)
	C_TEXT:C284(STK_t_fromCompany; STK_t_FromContact; STK_t_MovementFromTo; STK_t_MovementParent; vButtDisMov; vCompName; vName; vOrdTitle; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLPB")

If (Not:C34(STK_bo_LineTrackerActive))
	ARRAY LONGINT:C221(STK_al_ModifiedLineIDS; 0)
	STK_bo_LineTrackerActive:=True:C214
End if 
STK_t_CopyNote:=""
LBI_bo_NoEdit:=False:C215
If (STOCK_l_Context<0)  // added NG may 2004 to
	OBJECT SET VISIBLE:C603(STK_but_consolidate; False:C215)
	
	LBI_bo_NoEdit:=True:C214
	//display the lines
	STK_t_CopyNote:="Drag stock items to copy them"
	//we are viewing a stock movement to copy lines
	$_l_tableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
	For ($_l_FieldIndex; 1; Get last field number:C255(->[STOCK_MOVEMENTS:40]))
		If (Is field number valid:C1000($_l_tableNumber; $_l_FieldIndex))
			$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENTS:40]); $_l_FieldIndex)
			OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
		End if 
	End for 
	$_l_tableNumber:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
	For ($_l_FieldIndex; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
		If (Is field number valid:C1000($_l_tableNumber; $_l_FieldIndex))
			
			$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_FieldIndex)
			OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
		End if 
	End for 
	//Disable the copy funcitons here
	DB_MenuAction("Functions"; "Copy Current Stock"; 3; "")
	DB_MenuAction("Functions"; "Copy Previous Movt"; 3; "")
	DB_MenuAction("Functions"; "QuickAdd Items"; 3; "")
	DB_MenuAction("Functions"; "Duplicate Item"; 3; "")
	
Else 
	DB_MenuAction("Functions"; "Copy Current Stock"; 2; "")
	DB_MenuAction("Functions"; "Copy Previous Movt"; 2; "")
	DB_MenuAction("Functions"; "QuickAdd Items"; 2; "")
	DB_MenuAction("Functions"; "Duplicate Item"; 2; "")
	
End if 


If ([STOCK_MOVEMENTS:40]Movement_Code:1="")
	Movement_CodeT
	Move_InLPBDef
End if 
If ([STOCK_MOVEMENTS:40]Movement_Date:5=!00-00-00!)
	[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
End if 
If ([STOCK_MOVEMENTS:40]Company_From:2#[COMPANIES:2]Company_Code:1)
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
End if 
vCompName:=[COMPANIES:2]Company_Name:2
vPS:=1
If (STK_bo_AutoFill) & (vAdd=1)
	If (STK_t_AddMovementType#"")
		[STOCK_MOVEMENTS:40]Movement_Type:6:=STK_t_AddMovementType
		STK_t_CurrentStockType:=[STOCK_MOVEMENTS:40]Movement_Type:6
		
		STK_t_AddMovementType:=""
	End if 
End if 




If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
	Move_InType
Else 
	vType:=""
End if 
If ([STOCK_MOVEMENTS:40]Type_Number:4="")
	[STOCK_MOVEMENTS:40]Type_Number:4:="*TBA"
End if 
If ([MOVEMENT_TYPES:60]Number_Name:5#"")
	vName:=[MOVEMENT_TYPES:60]Number_Name:5
Else 
	vName:="Type No"
End if 

DB_MenuAction("Functions"; "Copy Current Stock"; 1; Term_StoWT("Copy Current Stock"))

If (Not:C34(STK_bo_AutoAllocateInited))
	ARRAY LONGINT:C221(STK_al_AutoAllocateOI; 0)
	ARRAY REAL:C219(STK_ar_AutoAllocateQTY; 0)
	ARRAY LONGINT:C221(STK_al_RemoveFromItemID; 0)
	STK_bo_AutoAllocateInited:=True:C214
End if 
If (STK_bo_AutoFill) & (vAdd=1)
	//TRACE
	If (Records in set:C195("StkAutoCopyFrom")>0)
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		$_l_RecordsInSet:=Records in set:C195("StkAutoCopyFrom")
		//Gen_Alert ("This will check if any of these items are pre-allocated")
		$_t_CurrentStockMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
		For ($_l_Index; 1; $_l_RecordsInSet)
			USE SET:C118("StkAutoCopyFrom")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			$_l_Repeats:=0
			
			
			$_t_FromStockMovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
			$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
			$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
			$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
			$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
			$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
			$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
			$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
			$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
			//`ont forget to take the purchase order code and purchase order item number off or the PO will still think this is expected stock
			//if the serial number is filled in take it off the old record
			$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
			[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
			If ($_l_ItemNumber>0)
				$_bo_isCancellation:=False:C215
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentStockMovementType)
				If ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34=True:C214)
					$_bo_isCancellation:=True:C214
				End if 
				$_t_StockMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
				$_t_CurrentStockMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_StockMovementType)
				If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
					$_l_SetItemNumber:=New process:C317("STK_SetItemNumber"; 128000; "Set Item Number"+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16); [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					APPEND TO ARRAY:C911(STK_al_AutoAllocateOI; $_l_ItemNumber)
					APPEND TO ARRAY:C911(STK_ar_AutoAllocateQTY; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					APPEND TO ARRAY:C911(STK_al_RemoveFromItemID; $_l_StockMovementItemID)
					If ($_bo_isCancellation)
						STK_bo_MoveOnOrderAllocation:=True:C214
					End if 
				Else 
					$_l_ItemNumber:=0  // SO IF COPY FROM AN ALLOCATION WE DONT KEEP THE ALLOCATION ON THE COPIED ITEM
				End if 
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentStockMovementType)
			End if 
			
			
			STK_ItemDuplicate
			
			$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
			
			[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
				
				[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			End if 
			[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
			[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
			[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber
			If ($_t_SerialNumber#"")
				[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=True:C214
			End if 
			//if copied trom an on order types then the
			[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=[STOCK_MOVEMENTS:40]Movement_Date:5
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
			End if 
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
			[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			
			If (Not:C34([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[MOVEMENT_TYPES:60]Stock_Minus:4)
					//although it appears to make this relation here its actually a mistake because the quantity is not firm and if the user changes anything.
					
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_StockMovementItemID
					
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddToCurrentStockID
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
					
				Else 
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[MOVEMENT_TYPES:60]Stock_Minus:4)
					//although it appears to make this relation here its actually a mistake because the quantity is not firm and if the user changes anything.
					
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_StockMovementItemID
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_l_AddToCurrentStockID
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
					
				Else 
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
				End if 
			End if 
			Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			
			[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
			[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
			[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45:=""
			[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_Location
			[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
			[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
			[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
			[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
			[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=0
			[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
			[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
			[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
			<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
			
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			
			//If ([STOCK_MOVEMENT_ITEMS]X_CopiedFromID>0)
			//While (Test semaphore("$SettingCalledOff"))
			//DelayTicks (3)
			//End while
			//$_l_SetItemNumber:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
			//While (Test semaphore("$SettingCalledOff"))
			//DelayTicks (3)
			//End while
			//End if
		End for 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		
		$_l_Process:=New process:C317("STK_GetMovementCompany"; 128000; "Get movement Company"; $_t_FromStockMovementCode; Current process:C322)
		$_l_Retries:=0
		While (Process state:C330($_l_Process)>=0)
			DelayTicks(2*$_l_Retries)
		End while 
		[STOCK_MOVEMENTS:40]Company_From:2:=STK_t_fromCompany
		[STOCK_MOVEMENTS:40]Contact_Code:3:=STK_t_FromContact
		[STOCK_MOVEMENTS:40]xCompanyFromID:25:=STK_l_CompanyID
		[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[PURCHASE_ORDERS:57])
		If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
		End if 
		
		
	End if 
End if 

STK_bo_AutoFill:=False:C215
If (DB_t_CurrentFormUsage="NoACL")
	
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Analysis_Code:9; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAnalysis@"; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCurrency@"; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLayer@"; False:C215)
	vButtDisMov:="I DPMO  FSS R AD "
	If (STOCK_l_Context<0)
		vButtDisMov:="D DPMO  FSS R AD "
	End if 
Else 
	vButtDisMov:="I       FSS R AD "
	If (STOCK_l_Context<0)
		vButtDisMov:="D       FSS R AD "
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
		OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCurrency@"; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
		OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLayer@"; False:C215)
	End if 
	If (Not:C34(<>StockAnal))
		OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Analysis_Code:9; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAnalysis@"; False:C215)
		
	End if 
End if 
If ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!)
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Code:1; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Company_From:2; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Type_Number:4; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Date:5; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Analysis_Code:9; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
	vButtDisMov:=Substring:C12(vButtDisMov; 1; 3)+"PMO"+Substring:C12(vButtDisMov; 7; 99)
	//vButtDisMov≤4≥:="P"
	//vButtDisMov≤5≥:="M"
	//vButtDisMov≤6≥:="O"
	DB_MenuAction("Functions"; "Copy Current Stock"; 1; "Copy Current Inventory")
	
	//DISABLE MENU ITEM(2050;6)
Else 
	If (Read only state:C362([STOCK_MOVEMENT_ITEMS:27]))
		If ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4))
			If (STOCK_l_Context<0)
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				
			Else 
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Code:1; True:C214)
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Company_From:2; True:C214)
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Type_Number:4; True:C214)
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Date:5; True:C214)
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; True:C214)
				OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Analysis_Code:9; True:C214)
				If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
					OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
					OBJECT SET VISIBLE:C603(*; "oCurrency@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oCurrency@"; True:C214)
					OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; True:C214)
				End if 
				If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
					OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
					OBJECT SET VISIBLE:C603(*; "oLayer@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oLayer@"; True:C214)
					OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; True:C214)
					
				End if 
				
				DB_MenuAction("Functions"; "QuickAdd Items"; 2; "")
			End if 
			
			//  ENABLE MENU ITEM(2050;6)
		End if 
	End if 
End if 
If ((DB_GetModuleSettingByNUM(1))=5) | (STOCK_l_Context<0) | ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!)
	
	DB_MenuAction("Functions"; "QuickAdd Items"; 3; "")
	DB_MenuAction("Functions"; "Duplicate Item"; 3; "")
Else 
	DB_MenuAction("Functions"; "QuickAdd Items"; 2; "")
	DB_MenuAction("Functions"; "Duplicate Item"; 2; "")
	//  DISABLE MENU ITEM(2050;6)
	//  DISABLE MENU ITEM(2050;7)
End if 



STK_t_MovementFromTo:=""
If ([STOCK_MOVEMENTS:40]MovementSourceTable:16#0)
	OBJECT SET VISIBLE:C603(*; "oParent@"; True:C214)
	Case of 
		: ([STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[PURCHASE_ORDERS:57]))
			STK_t_MovementParentLabel:="Purchase Order"
			STK_t_MovementFromTo:="Supplier Company"
			STK_t_MovementParent:=[STOCK_MOVEMENTS:40]MovementSourceReference:18
		: ([STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[PURCHASE_INVOICES:37]))
			STK_t_MovementParentLabel:="Purchase Invoice"
			STK_t_MovementFromTo:="Supplier Company"
			STK_t_MovementParent:=[STOCK_MOVEMENTS:40]MovementSourceReference:18
		: ([STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[INVOICES:39]))
			STK_t_MovementParentLabel:="Sales Invoice"
			STK_t_MovementFromTo:="Invoiced to Company"
			STK_t_MovementParent:=[STOCK_MOVEMENTS:40]MovementSourceReference:18
		: ([STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[ORDERS:24]))
			STK_t_MovementParentLabel:="Sales Orders"
			STK_t_MovementFromTo:="Order by Company"
			STK_t_MovementParent:=[STOCK_MOVEMENTS:40]MovementSourceReference:18
	End case 
Else 
	OBJECT SET VISIBLE:C603(*; "oParent@"; False:C215)
End if 
vPS:=1



STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
//SET VISIBLE(STK_l_BDragAll;False)
If (STOCK_l_Context<0)
	OBJECT SET VISIBLE:C603(SM_at_ModeStockMov; False:C215)
	$_t_DragString:="STKItems"
	LBI_SetDRGPair(2; ->STK_LB_StockItems; $_t_DragString)
End if 

vTot:=0
vOrdTitle:=Uppercase:C13(Term_StoWT("Stock Movement"))
If (Size of array:C274(STK_aptr_ItemPreferences)>=9)
	$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		Input_Buttons(->[STOCK_MOVEMENTS:40]; ->vButtDisMov; "Stock Movement"; $_t_SubItemName)
	End if 
Else 
	Input_Buttons(->[STOCK_MOVEMENTS:40]; ->vButtDisMov)
	
End if 
DB_t_CallOnCloseorSave:="R:Move_InLPA:D:Stock_InCan"
If (DB_t_CurrentFormUsage="Mod")  //From by OrderDel StockP
	DB_bo_RecordModified:=True:C214
End if 
If ([STOCK_MOVEMENTS:40]Movement_Type:6="")
	GOTO OBJECT:C206([STOCK_MOVEMENTS:40]Movement_Type:6)
Else 
	GOTO OBJECT:C206([STOCK_MOVEMENTS:40]Movement_Notes:27)
	
	
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[STOCK_MOVEMENTS:40])))
ERR_MethodTrackerReturn("Move_InLPB"; $_t_oldMethodName)
