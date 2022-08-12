//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_MovementIN_LP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2011 14:20 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY LONGINT(AL_al_ModeStock;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; STK_bo_AddItem; STOCK_AutoCancel; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_ButtonPressed; $_l_Event; $_l_MaxWidth; $_l_ModuleRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule)
	C_LONGINT:C283(iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; STOCK_l_CopyProcess)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285($1; vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CheckStockType; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; IP_t_MessageReplySTR; PAL_BUTTON; SF_t_MovementTypeName; SF_t_TypeName)
	C_TEXT:C284(vButtDisMov; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_MovementIN_LP")
//Move_InLP
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->STK_LB_StockItems)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		STK_bo_AddItem:=False:C215
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_MaxWidth:=Screen width:C187-$_l_WindowLeft
		If ($_l_MaxWidth>800)
			$_l_MaxWidth:=800
		End if 
		WS_AutoscreenSize(1; 450; $_l_MaxWidth; Table name:C256(->[SF_STOCKMOVEMENTS:193])+"_"+"Movements_in")
		ARRAY TEXT:C222(SM_at_ModeStockMov; 0)
		ARRAY LONGINT:C221(AL_al_ModeStock; 0)
		LBi_SetListBoxOptions(->SM_at_ModeStockMov; ->AL_al_ModeStock; ->STK_pic_ModeStock)
		INT_SetInput(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		If ([SF_STOCKMOVEMENTS:193]Movement_Type:4="")
			GOTO OBJECT:C206([SF_STOCKMOVEMENTS:193]Movement_Type:4)
		End if 
		SF_MovementIN_LPB
		In_ButtChkDis(->vButtDisMov; "Stock Movement")
		
		DB_SetInputFormMenu(Table:C252(->[SF_STOCKMOVEMENTS:193]); "Movements_n")
		If (Records in selection:C76([SF_STOCKMOVEMENTS:193])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[SF_STOCKMOVEMENTS:193]); "Movements_n")
		OpenHelp(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		If (vTot=1)
			[SF_STOCKMOVEMENTS:193]Total_Cost:21:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7); 2; 2)
			[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41); 2; 2)
			vTot:=0
		End if 
		vFromIn:=After:C31
		If (Size of array:C274(STK_aptr_ItemPreferences)>=9)
			$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				In_ButtChkDis(->vButtDisMov; "Stock Movement"; $_t_SubItemName)
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisMov; "Stock Movement")
			
		End if 
		OpenHelp(Table:C252(->[SF_STOCKMOVEMENTS:193]); "Movements_in")
		INT_SetInput(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		If (Records in selection:C76([SF_STOCKMOVEMENTS:193])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[SF_STOCKMOVEMENTS:193]); "Movements_in")
		OpenHelp(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		If (vTot=1)
			[SF_STOCKMOVEMENTS:193]Total_Cost:21:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7); 2; 2)
			[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41); 2; 2)
			
			vTot:=0
		End if 
		If (Size of array:C274(STK_aptr_ItemPreferences)>=9)
			$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				In_ButtChkDis(->vButtDisMov; "Stock Movement"; $_t_SubItemName)
			End if 
		Else 
			In_ButtChkDis(->vButtDisMov; "Stock Movement")
		End if 
		INT_SetInput(Table:C252(->[SF_STOCKMOVEMENTS:193]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		If (Records in selection:C76([SF_STOCKMOVEMENTS:193])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)  //& (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				inButtSubHandle(FORM Get current page:C276; ->[SF_STOCKMOVEMENTS:193])
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("GetRecordCode"))
				IP_t_MessageReplySTR:=[SF_STOCKMOVEMENTS:193]Movement_Code:2
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				//IP_t_MessageReplySTR:=[SF_STOCKMOVEMENTS]Company From
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				//IP_t_MessageReplySTR:=[SF_STOCKMOVEMENTS]Contact Code
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				If ([SF_STOCKMOVEMENTS:193]X_ID:1=0)
					[SF_STOCKMOVEMENTS:193]X_ID:1:=AA_GetNextIDinMethod(->[SF_STOCKMOVEMENTS:193]X_ID:1)
				End if 
				IP_t_MessageReplySTR:=String:C10([SF_STOCKMOVEMENTS:193]X_ID:1)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("DragCopy"))
				LBi_DragCopy(->STK_aptr_ItemPreferences)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveDragged"))
				If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2#"")
					DB_SaveRecord(->[SF_STOCKMOVEMENT_ITEMS:194])
					AA_CheckFileUnlocked(->[SF_STOCKMOVEMENT_ITEMS:194])
				End if 
				STK_RetrieveDraggedLines(->STK_aptr_ItemPreferences)
				
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				
				
				In_ButtCall("R:SF_MOvementInLPA:D:SF_MovementInCan"; ""; "SF_MovmentInDEL"; ->[SF_STOCKMOVEMENTS:193]; ->[SF_STOCKMOVEMENTS:193]Movement_Code:2; "Movements"; "1 5 6"; "SF_MovementIN_LPB"; "Master"; ""; "Gen_ShowTelCo"; ->[SF_STOCKMOVEMENT_ITEMS:194]; ->vButtDisMov)
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Movement_Code:2))
				RemoveLeadTr(Uppercase:C13([SF_STOCKMOVEMENTS:193]Movement_Code:2); ->[SF_STOCKMOVEMENTS:193]Movement_Code:2)
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Movement_Code:2)
				//: (Modified([SF_STOCKMOVEMENTS]Company From))
				
				//If ([SF_STOCKMOVEMENTS]Company From#"")
				//Check_Company (->[SF_STOCKMOVEMENTS]Company From;->[CONTACTS]Contact Code;->[SF_STOCKMOVEMENTS])
				//DEFAULT TABLE([SF_STOCKMOVEMENTS])
				//vCompName:=[COMPANIES]Company Name
				//Else
				//added NG
				//[SF_STOCKMOVEMENTS]Company From:=Old([SF_STOCKMOVEMENTS]Company From)
				//End if
				//DB_bo_RecordModified:=True
				//Macro_AccTypePt (->[SF_STOCKMOVEMENTS]Company From)
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Movement_Type:4))
				Check_MinorNC(->[SF_STOCKMOVEMENTS:193]Movement_Type:4; "Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
				SF_t_MovementTypeName:=SF_GetStockMovementTypeName
				If ([SF_STOCKMOVEMENTS:193]Movement_Type:4#"")
					If ([MOVEMENT_TYPES:60]Number_Mod:8=False:C215)
						OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3; False:C215)
					End if 
					
				End if 
				
				$_t_CheckStockType:=SF_MovementIN_TypeCheck
				If ($_t_CheckStockType="")
					If ([MOVEMENT_TYPES:60]Number_Name:5#"")
						SF_t_TypeName:=[MOVEMENT_TYPES:60]Number_Name:5
					Else 
						SF_t_TypeName:="Type No"
					End if 
					If ([MOVEMENT_TYPES:60]Serial_Unique:19)
						DB_MenuAction("Functions"; "Copy Current Stock"; 3; "")
					Else 
						DB_MenuAction("Functions"; "Copy Current Stock"; 2; "")
					End if 
				Else 
					Gen_Alert("Stock Type "+$_t_CheckStockType+" does not exist, so this Movement Type cannot be used"; "Try again")
					[SF_STOCKMOVEMENTS:193]Movement_Type:4:=""
					SF_t_TypeName:="Type No"
					SF_t_MovementTypeName:=""
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Movement_Type:4)
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3))
				[SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3:=Uppercase:C13([SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3)
			: (vTot=1)
				If (STK_bo_AddItem)
					If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					End if 
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[SF_STOCKMOVEMENTS:193]Movement_Code:2)
					
				End if 
				[SF_STOCKMOVEMENTS:193]Total_Cost:21:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7); 2; 2)
				[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41); 2; 2)
				
				vTot:=0
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Analysis_Code:18))
				Check_Analysis(->[SF_STOCKMOVEMENTS:193]Analysis_Code:18; "Analysis")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Analysis_Code:18)
				
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Currency_Code:19))
				Check_MinorNC(->[SF_STOCKMOVEMENTS:193]Currency_Code:19; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				If ([SF_STOCKMOVEMENTS:193]Currency_Code:19="")
					[SF_STOCKMOVEMENTS:193]Currency_Code:19:=<>SYS_t_BaseCurrency
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Currency_Code:19)
				
			: (Modified:C32([SF_STOCKMOVEMENTS:193]Layer_Code:17))
				Check_MinorNC(->[SF_STOCKMOVEMENTS:193]Layer_Code:17; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
				Layer_Fill(->[SF_STOCKMOVEMENTS:193]Layer_Code:17)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SF_STOCKMOVEMENTS:193]Layer_Code:17)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[SF_STOCKMOVEMENTS:193]); "Movements_in")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("SF_MovementIN_LP"; $_t_oldMethodName)
