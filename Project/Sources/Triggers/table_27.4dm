If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:STOCK_MOVEMENT_ITEMS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 


C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		End if 
		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		If (DB_TableTriggerEnabled)
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0) | ([STOCK_MOVEMENT_ITEMS:27]x_ID:16<0)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		End if 
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
		[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		//TRACE
		[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		End if 
		If (DB_TableTriggerEnabled)
			
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0) | ([STOCK_MOVEMENT_ITEMS:27]x_ID:16<0)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
				End if 
				
			End if 
			//TRACE
			[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
		End if 
		If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17))#0) & ((Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17))#[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
			[STOCK_MOVEMENT_ITEMS:27]x_OLDCOPIEDFROMID:48:=Old:C35([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
		End if 
		If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#0) & ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
			[STOCK_MOVEMENT_ITEMS:27]X_OLDADDTOCSID:49:=Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
		End if 
		If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))#0) & ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
			[STOCK_MOVEMENT_ITEMS:27]X_OLDTAKEFROMCSID:50:=Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
		End if 
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
		[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		
		
End case 

ERR_MethodTrackerReturn("TRIGGER [STOCK_MOVEMENT_ITEMS]"; $_t_oldMethodName)
