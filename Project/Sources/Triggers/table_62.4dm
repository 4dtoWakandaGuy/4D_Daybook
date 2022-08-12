If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:CURRENT_STOCK
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENT_STOCK]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214

Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENT_STOCK]"; $_l_event)
		If (DB_TableTriggerEnabled)
			[CURRENT_STOCK:62]Total_Cost:9:=([CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[CURRENT_STOCK:62]Stock_Number:7; 0)
			
			If ([CURRENT_STOCK:62]Product_Code:1#"")
				[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
				If ([CURRENT_STOCK:62]X_ID:13=0)
					[CURRENT_STOCK:62]X_ID:13:=AA_GetNextID(->[CURRENT_STOCK:62]X_ID:13)
				End if 
			End if 
			
			If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)  //Note this does not set the stock level just ties this record to it.
				
				STK_bo_CalledFromCSTrigger:=True:C214
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
				STK_bo_CalledFromCSTrigger:=False:C215
			End if 
			
			AUTO_AUDIT(->[CURRENT_STOCK:62]; Field:C253(->[CURRENT_STOCK:62]X_ID:13); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENT_STOCK]"; $_l_event)
		If (DB_TableTriggerEnabled)
			[CURRENT_STOCK:62]Total_Cost:9:=([CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4)
			
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[CURRENT_STOCK:62]Stock_Number:7; 1)
			
			[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
			
			If ([CURRENT_STOCK:62]X_ID:13=0)
				[CURRENT_STOCK:62]X_ID:13:=AA_GetNextID(->[CURRENT_STOCK:62]X_ID:13)
			End if 
			If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)  //Note this does not set the stock level just ties this record to it.
				STK_bo_CalledFromCSTrigger:=True:C214
				[CURRENT_STOCK:62]x_Stock_Level_ID:15:=STK_GetStockLevelID([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Location:8)
				STK_bo_CalledFromCSTrigger:=False:C215
			End if 
			AUTO_AUDIT(->[CURRENT_STOCK:62]; Field:C253(->[CURRENT_STOCK:62]X_ID:13); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//ProcessServices_CreateRecord (->[CURRENT STOCK];->[CURRENT STOCK]XREC_ID;"StockLevelValidate")
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENT_STOCK]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			If ([CURRENT_STOCK:62]X_ID:13=0)
				[CURRENT_STOCK:62]X_ID:13:=AA_GetNextID(->[CURRENT_STOCK:62]X_ID:13)
			End if 
			AUTO_AUDIT_DEL(->[CURRENT_STOCK:62]; Field:C253(->[CURRENT_STOCK:62]X_ID:13); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
		
End case 
<>SYS_bo_inTrigger:=False:C215


ERR_MethodTrackerReturn("TRIGGER [CURRENT_STOCK]"; $_t_oldMethodName)
