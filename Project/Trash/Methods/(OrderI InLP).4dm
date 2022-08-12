//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 12:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORDI_LB_RelatedData;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(ORDI_al_ViewsTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORDI_at_TabNames;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; ORD_bo_IsRevision; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>OrdI_l_OpenonPage; <>ordi_l_TabLabel; $_l_ButtonNumber; $_l_CalledFromProcess; $_l_CharacterPosition; $_l_Event; $_l_Index; $_l_ModuleRow; $_l_NewWindowLeft; $_l_objectBottom; $_l_objectLeft)
	C_LONGINT:C283($_l_objectRight; $_l_objectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK)
	C_LONGINT:C283(ModuleNumber; ORDI_l_LBLevel; ORDI_l_Textlength; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; SD2_l_CallingProcess; SD2_l_TableNum; WS_OLDSORTORDER)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_Field)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; ORDI_t_FalseTab; PAL_BUTTON; SD2_t_TabFunction; vButtDisOI)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "items In13")
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); WIN_t_CurrentInputForm)
		
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
			$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (FORM Get current page:C276>2)
					If (False:C215)  //if and when we make items removable then we can enable this
						In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisOI; "Order Item")
					End if 
				Else 
					In_ButtChkDis(->vButtDisOI; "Order Item")
				End if 
			End if 
		Else 
			In_ButtChkDis(->vButtDisOI; "Order Item")
		End if 
		
		
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "oOrderItemsTab"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
		$_l_NewWindowLeft:=Int:C8($_l_WindowWidth-(ORDI_l_Textlength*8.5))
		
		//MOVE OBJECT(*;"oOrderItemsTab";$_l_NewWindowLeft;$_l_objectTop;($_l_WindowWidth);$_l_objectBottom;*)
		SD2_SetDiaryPopup(->ORDI_al_ViewTableToTable; ->ORDI_at_ViewTabsLabels; ->ORDI_at_TabNames)
		If (Records in selection:C76([ORDER_ITEMS:25])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "items In13")
		
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
			$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (FORM Get current page:C276>2)
					If (False:C215)  //if and when we make items removable then we can enable this
						In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisOI; "Order Item")
					End if 
				Else 
					In_ButtChkDis(->vButtDisOI; "Order Item")
				End if 
			End if 
		Else 
			In_ButtChkDis(->vButtDisOI; "Order Item")
		End if 
		SD2_SetDiaryPopup(->ORDI_al_ViewTableToTable; ->ORDI_at_ViewTabsLabels; ->ORDI_at_TabNames)
		If (Records in selection:C76([ORDER_ITEMS:25])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				inButtSubHandle(FORM Get current page:C276; ->[ORDER_ITEMS:25])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				ORDI_t_FalseTab:=SD2_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[ORDER_ITEMS:25])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
				//Here we must select the records and put them in a longint array then pass them back to the calling process
				If (SD2_l_CallingProcess>0)
					$_l_CalledFromProcess:=SD2_l_CallingProcess
					SD2_l_CallingProcess:=0
					$_t_DummyTab:=SD2_t_TabFunction
					$_l_CharacterPosition:=Position:C15("View "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("View "); Length:C16($_t_DummyTab))
					End if 
					SD2_t_TabFunction:=""
					CREATE SET:C116([DIARY:12]; "ORDIcurrentDiary")  //Just to make sure we keep the selection
					ORDI_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					USE SET:C118("ORDIcurrentDiary")
					CLEAR SET:C117("ORDIcurrentDiary")
				End if 
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("ORDi_inLPA"; "Gen_ItemsLPA"; "OrderI_InDel"; ->[ORDER_ITEMS:25]; ->[ORDERS:24]Order_Code:3; "OrderI"; ""; "OrderI_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisOI; ->ORDI_LB_RelatedData; True:C214)
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "items In13")
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				OrderI_SubLP
				
		End case 
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); WIN_t_CurrentInputForm)
		WS_OLDSORTORDER:=[ORDER_ITEMS:25]Sort_Order:26
		OrderI_InLPB
		OrderI_SubLPB
		If (ORD_bo_IsRevision)
			For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
				$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
				OBJECT SET ENTERABLE:C238($_ptr_Field->; False:C215)
			End for 
			
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "oOrderItemsTab"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
		$_l_NewWindowLeft:=Int:C8($_l_WindowWidth-(ORDI_l_Textlength*8.5))
		
		//MOVE OBJECT(*;"oOrderItemsTab";$_l_NewWindowLeft;$_l_objectTop;($_l_WindowWidth);$_l_objectBottom;*)
		SD2_SetDiaryPopup(->ORDI_al_ViewTableToTable; ->ORDI_at_ViewTabsLabels; ->ORDI_at_TabNames)
		In_ButtChkDis(->vButtDisOI)
		
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "items In13")
		If (Records in selection:C76([ORDER_ITEMS:25])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (<>OrdI_l_OpenonPage>0)
			Case of 
				: (<>OrdI_l_OpenonPage=2)
					FORM GOTO PAGE:C247(2)
					OI_at_OrderItemTabs:=2
					GOTO OBJECT:C206([ORDER_ITEMS:25]Required_Date:10)
					If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
						$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
						If (Size of array:C274($_ptr_ArrayReferences->)>=10)
							$_t_SubItemName:=$_ptr_ArrayReferences->{10}
							If (FORM Get current page:C276>=2)
								In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
							Else 
								In_ButtChkDis(->vButtDisOI; "Order Item")
							End if 
						End if 
					End if 
				: (<>OrdI_l_OpenonPage=1)
					FORM GOTO PAGE:C247(1)
					OI_at_OrderItemTabs:=1
					GOTO OBJECT:C206([ORDER_ITEMS:25]Product_Name:13)
					HIGHLIGHT TEXT:C210([ORDER_ITEMS:25]Product_Name:13; 32000; 32000)
					If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
						$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
						If (Size of array:C274($_ptr_ArrayReferences->)>=10)
							$_t_SubItemName:=$_ptr_ArrayReferences->{10}
							If (FORM Get current page:C276>=2)
								In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
							Else 
								In_ButtChkDis(->vButtDisOI; "Order Item")
							End if 
						End if 
					End if 
					
				: (<>OrdI_l_OpenonPage=3)
					FORM GOTO PAGE:C247(3)
					If (<>ordi_l_TabLabel>0)
						OI_at_OrderItemTabs:=2+<>ordi_l_TabLabel
					Else 
						<>ordi_l_TabLabel:=3
					End if 
					ORDI_at_ViewTabsLabels:=OI_at_OrderItemTabs-2
					LBi_RemoveAll(->ORDI_aptr_ListBoxPointers)
					ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
					ORDI_LoadSubArea(ORDI_l_LBLevel)  //the first window
			End case 
			If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
				$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
				If (Size of array:C274($_ptr_ArrayReferences->)>=10)
					$_t_SubItemName:=$_ptr_ArrayReferences->{10}
					If (OI_at_OrderItemTabs>2)
						If (False:C215)  //if and when we make items removable then we can enable this
							In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisOI; "Order Item")
						End if 
					Else 
						In_ButtChkDis(->vButtDisOI; "Order Item")
					End if 
				End if 
			End if 
			
			
			
		End if 
		
	: ($_l_Event=On Resize:K2:27)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "oOrderItemsTab"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
		$_l_NewWindowLeft:=Int:C8($_l_WindowWidth-(ORDI_l_Textlength*8.5))
		
		//MOVE OBJECT(*;"oOrderItemsTab";$_l_NewWindowLeft;$_l_objectTop;($_l_WindowWidth);$_l_objectBottom;*)
		
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_Event=On Unload:K2:2)
		If (WS_OLDSORTORDER#[ORDER_ITEMS:25]Sort_Order:26) | (WS_OLDSORTORDER=0)
			
			OrderI_SortCalc
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OrderI InLP"; $_t_oldMethodName)
