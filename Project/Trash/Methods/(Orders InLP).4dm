//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2010 15:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	//ARRAY TEXT(ORD_at_SubAreaContext;0)
	//ARRAY TEXT(ORD_at_SubAreaContextUsage;0)
	//ARRAY TEXT(ORD_at_TabNames;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BLOB:C604(<>ORD_BL_DataBlob)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; Gen_bo_StateModified; ORD_bo_InitPointers; ORD_bo_OrderModified; ORD_bo_QuickAddMode; PAL_bo_ButtonSubFunction; PROD_bo_Exit; vFromIn)
	C_LONGINT:C283(<>AutoProc; $_l_ButtonNumber; $_l_CallFromProcess; $_l_Event; $_l_FrontmostWindow; $_l_Index; $_l_ModuleRow; $_l_NextSort; $_l_ProcessIndex; $_l_ProcessRow; $_l_Sizeofarray)
	C_LONGINT:C283($_l_ViewPosition; $_l_WindowRef; $nul; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; DF_l_ContactCentric; iCancel; iOK; ModuleNumber; ORD_l_quickaddprocess; PAL_BUTTON_10)
	C_LONGINT:C283(PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; PROD_l_SelectorPallette; SD_l_DragSource; SD2_l_CallingProcess; SD2_l_TableNum; vAB; vAccessSwNo; vAdd; vALLevels)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WS_OLDSORTORDER)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListBoxSetup)
	C_REAL:C285($_r_Quantity; ORD_r_SubSelection; vTot)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; $_t_oldMethodName2; $_t_PalletButtonName; $_t_ProductCode; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; ORD_t_FalseTab)
	C_TEXT:C284(ORD_t_TabFunction; PAL_BUTTON; SD2_t_TabFunction; vButtDisOrd; vStPrev; VstPrevOLD; WIN_t_CurrentInputForm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Orders_InLP")

//Orders_InLP

$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Gen_bo_StateModified:=False:C215
		If (Not:C34(ORD_bo_InitPointers))
			ARRAY POINTER:C280(ORD_aptr_SubAreaPointers; 0)
			ARRAY LONGINT:C221(ORD_al_SubAreaTables; 0)
			ARRAY TEXT:C222(ORD_at_SubAreaContext; 0)
			ARRAY TEXT:C222(ORD_at_SubAreaContextUsage; 0)
			ORD_bo_InitPointers:=True:C214
		End if 
		
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
		
		
		//Orders_InLPB   `NG modified April 2007 it get called twice!!!
		//   vBefore2:=True
		//  Gen_PostKey (1;92;256)
		// : (vBefore2)
		//  vBefore2:=False
		Orders_InLPß("B")
		vStPrevOLD:=[ORDERS:24]State:15
		Case of 
			: ([ORDERS:24]Company_Code:1="")
				If (DF_l_ContactCentric=0)
					GOTO OBJECT:C206([ORDERS:24]Company_Code:1)
				Else 
					GOTO OBJECT:C206([ORDERS:24]Contact_Code:2)
				End if 
			: ([ORDERS:24]Contact_Code:2="")
				GOTO OBJECT:C206([ORDERS:24]Contact_Code:2)
			Else 
				GOTO OBJECT:C206([ORDERS:24]Order_Type:43)
		End case 
		
		vStPrev:=[ORDERS:24]State:15
		SD2_SetDiaryPopup(->ORD_al_ViewTableToTable; ->ORD_at_ViewTabsLabels; ->ORD_at_TabNames)
		In_ButtChkDis(->vButtDisOrd)
		
		//WIN_t_CurrentInputForm="Orders_In13"
		DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Orders_In13")
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		
		//TRACE
		If (vFromIn)
			//TRACE
			//DB_SetInputFormMenu (Table(->[ORDERS]);"Orders_In13")
		End if 
		vFromIn:=False:C215
		In_ButtChkDis(->vButtDisOrd)
		$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
		
		$_l_WindowRef:=0
		If ($_l_ProcessRow>0)  //It should be
			
			If (<>PRC_al_ProcessCalledBy{$_l_ProcessRow}=Current process:C322)
				//TRACE
				For ($_l_ProcessIndex; $_l_ProcessRow+1; Size of array:C274(<>PRC_al_ProcessCalledBy))
					If (<>PRC_al_ProcessCalledBy{$_l_ProcessIndex}#Current process:C322)
						$_l_ProcessRow:=$_l_ProcessIndex
						$_l_ProcessIndex:=Size of array:C274(<>PRC_al_ProcessCalledBy)
					End if 
				End for 
			End if 
			$_l_WindowRef:=<>PRC_al_WindowReference{$_l_ProcessRow}
			
		End if 
		$_l_FrontmostWindow:=Frontmost window:C447
		If ($_l_WindowRef=WIN_l_CurrentWinRef) | ($_l_WindowRef=0)
			
			OpenHelp(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
			If (vAccessSwNo=-1)
				vAccessSwNo:=0
			Else 
				If (vTot=1)
					vTot:=0
					//  If (Count parameters=1)  `temporary
					Orders_InLPOI  //this is here for the AL Pro method only
					
					//   Else
					//  Orders_InLPTot   `this is done within the above
					//  End if
				End if 
				vFromIn:=After:C31
			End if 
			States_CUArr(->[ORDERS:24]State:15)
			SD2_SetDiaryPopup(->ORD_al_ViewTableToTable; ->ORD_at_ViewTabsLabels; ->ORD_at_TabNames)
			If (ORD_at_ViewTabsLabels>0)
				$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
				If ($_l_ModuleRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
					If (Size of array:C274($_ptr_ListBoxSetup->)>=9)
						
						$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
						If (Size of array:C274($_ptr_ArrayReferences->)>=10)
							$_t_SubItemName:=$_ptr_ArrayReferences->{10}
							Case of 
								: (ORD_at_OrdersTab=1)
									If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //if and when we make other  items removable then we can enable other items
										
										In_ButtChkDis(->vButtDisOrd; "Order"; $_t_SubItemName)
									Else 
										TRACE:C157
										
										In_ButtChkDis(->vButtDisOrd; "Order")
									End if 
								: (ORD_at_OrdersTab=2)
									In_ButtChkDis(->vButtDisOrd; "Order")
							End case 
						End if 
					Else 
						
						
						In_ButtChkDis(->vButtDisOrd; "Order")
						
					End if 
				End if 
			End if 
		End if 
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)  //& (((◊ButtPress#"")) | (iOK=1) | (iCancel=1))
		
		If (DB_l_ButtonClickedFunction>0)
			//TRACE
		End if 
		Case of 
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("MenuReset"))
				
				DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Orders_In13")
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("PlusOption")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				inButtSubHandle(FORM Get current page:C276; ->[ORDERS:24])
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=[ORDERS:24]Company_Code:1
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				IP_t_MessageReplySTR:=[ORDERS:24]Contact_Code:2
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				If ([ORDERS:24]x_ID:58=0)
					[ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58)
				End if 
				IP_t_MessageReplySTR:=String:C10([ORDERS:24]x_ID:58)
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("DragCopy"))
				//Get highlighted lines and call the parent process
				$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_ModuleRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
					LBi_DragCopy($_ptr_ListBoxSetup; ->[ORDER_ITEMS:25]Item_Number:27; ""; "ORD_SelectedRelated")
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveDragged"))
				$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				//TRACE
				If ($_l_ModuleRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
					ORD_RetrieveDraggedLines($_ptr_ListBoxSetup)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("RetreiveDraggedOrderLines"))
				//order header(may include lines)
				ORD_RetrieveOrderHeader
				If (BLOB size:C605(<>ORD_BL_DataBlob)>0)
					$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
					
					If ($_l_ModuleRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
						
						ORD_RetrieveDraggedLines($_ptr_ListBoxSetup)
					End if 
				Else 
					Orders_InLPTot
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("CopyProduct"))
				$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_ModuleRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
					
					ORD_RetrieveProductInfo($_ptr_ListBoxSetup)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReloadAuths"))
				//TRACE
				CCM_LoadOrderAuths([ORDERS:24]x_ID:58)
				If (FORM Get current page:C276=2)
					ORD_SetFormObjects(201)
					
					
				End if 
				
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReloadOrderItems"))
				Orders_InLPOI(vAB)
				Orders_InLPß("S1")
				DB_bo_RecordModified:=True:C214
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Add Line Quick Add"))
				DB_l_ButtonClickedFunction:=0
				If (((ORD_AT_QuickAddProdCode{1}#"") | (ORD_AT_QuickAddProdName{1}#"")) & (ORD_ar_QuickAddQuantity{1}#0))
					LISTBOX INSERT ROWS:C913(ORD_lb_ArraySelection; 0)
					LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
				End if 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Add Line Quick Repeat"))
				DB_l_ButtonClickedFunction:=0
				If (((ORD_AT_QuickAddProdCode{1}#"") | (ORD_AT_QuickAddProdName{1}#"")) & (ORD_ar_QuickAddQuantity{1}#0))
					$_t_ProductCode:=ORD_AT_QuickAddProdCode{1}
					$_r_Quantity:=ORD_ar_QuickAddQuantity{1}
					LISTBOX INSERT ROWS:C913(ORD_lb_ArraySelection; 0)
					ORD_AT_QuickAddProdCode{1}:=$_t_ProductCode
					ORD_ar_QuickAddQuantity{1}:=$_r_Quantity
					LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
				End if 
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Clear Line Quick Add"))
				DB_l_ButtonClickedFunction:=0
				If (Size of array:C274(ORD_AT_QuickAddProdCode)>1)
					LISTBOX DELETE ROWS:C914(ORD_lb_ArraySelection; 1)
					
					LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
				End if 
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel Quick Add"))
				DB_l_ButtonClickedFunction:=0
				QuickAdd_Arr(0)
				ORD_bo_QuickAddMode:=False:C215
				OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems2"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems1"; True:C214)
				If (ORD_l_quickaddprocess>0)
					POST OUTSIDE CALL:C329(ORD_l_quickaddprocess)
				End if 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Save Quick Add"))
				DB_l_ButtonClickedFunction:=0
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; <)
				$_l_NextSort:=[ORDER_ITEMS:25]Sort_Order:26+1
				
				$_l_Sizeofarray:=Size of array:C274(ORD_AT_QuickAddProdCode)
				For ($_l_Index; $_l_Sizeofarray; 1; -1)
					If (((ORD_AT_QuickAddProdCode{$_l_Index}#"") | (ORD_AT_QuickAddProdName{$_l_Index}#"")) & (ORD_ar_QuickAddQuantity{$_l_Index}#0))
						CREATE RECORD:C68([ORDER_ITEMS:25])
						OrderI_SubLPB
						[ORDER_ITEMS:25]Quantity:3:=ORD_ar_QuickAddQuantity{$_l_Index}
						[ORDER_ITEMS:25]Product_Code:2:=ORD_AT_QuickAddProdCode{$_l_Index}
						RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
						OrderI_SubLPPC
						[ORDER_ITEMS:25]Product_Name:13:=ORD_AT_QuickAddProdName{$_l_Index}
						[ORDER_ITEMS:25]Serial_Number:24:=ORD_AT_QuickAddSerialNo{$_l_Index}
						[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextSort
						
						$_l_NextSort:=$_l_NextSort+1
						
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					End if 
				End for 
				Orders_InLPOI(vAB)
				Orders_InLPß("S1")
				DB_bo_RecordModified:=True:C214
				QuickAdd_Arr(0)
				ORD_bo_QuickAddMode:=False:C215
				If (ORD_l_quickaddprocess>0)
					POST OUTSIDE CALL:C329(ORD_l_quickaddprocess)
				End if 
				OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems2"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems1"; True:C214)
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				ORD_t_FalseTab:=ORD_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[ORDERS:24])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
				//Here we must select the records and put them in a longint array then pass them back to the calling process
				If (SD2_l_CallingProcess>0)
					$_l_CallFromProcess:=SD2_l_CallingProcess
					SD2_l_CallingProcess:=0
					$_t_DummyTab:=SD2_t_TabFunction
					$_l_ViewPosition:=Position:C15("View "; $_t_DummyTab)
					If ($_l_ViewPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_ViewPosition+Length:C16("View "); Length:C16($_t_DummyTab))
					End if 
					SD2_t_TabFunction:=""
					CREATE SET:C116([DIARY:12]; "ORDcurrentDiary")  //Just to make sure we keep the selection
					
					ORD_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CallFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CallFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					USE SET:C118("ORDcurrentDiary")
					CLEAR SET:C117("ORDcurrentDiary")
				End if 
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				If (ORD_bo_QuickAddMode)
					Case of 
						: (DB_l_ButtonClickedFunction=1) | (iCancel=1)  //cancel
							
							DB_l_ButtonClickedFunction:=0
							iCancel:=0
							QuickAdd_Arr(0)
							ORD_bo_QuickAddMode:=False:C215
							If (ORD_l_quickaddprocess>0)
								POST OUTSIDE CALL:C329(ORD_l_quickaddprocess)
							End if 
							OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems2"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems1"; True:C214)
							
						: (DB_l_ButtonClickedFunction=2) | (iok=1)  //Save
							
							DB_l_ButtonClickedFunction:=0
							iok:=0
							$_l_Sizeofarray:=Size of array:C274(ORD_AT_QuickAddProdCode)
							For ($_l_Index; 1; $_l_Sizeofarray)
								If (((ORD_AT_QuickAddProdCode{$_l_Index}#"") | (ORD_AT_QuickAddProdName{$_l_Index}#"")) & (ORD_ar_QuickAddQuantity{$_l_Index}#0))
									CREATE RECORD:C68([ORDER_ITEMS:25])
									OrderI_SubLPB
									[ORDER_ITEMS:25]Quantity:3:=ORD_ar_QuickAddQuantity{$_l_Index}
									[ORDER_ITEMS:25]Product_Code:2:=ORD_AT_QuickAddProdCode{$_l_Index}
									RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
									OrderI_SubLPPC
									[ORDER_ITEMS:25]Product_Name:13:=ORD_AT_QuickAddProdName{$_l_Index}
									[ORDER_ITEMS:25]Serial_Number:24:=ORD_AT_QuickAddSerialNo{$_l_Index}
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
								End if 
							End for 
							Orders_InLPOI(vAB)
							Orders_InLPß("S1")
							DB_bo_RecordModified:=True:C214
							QuickAdd_Arr(0)
							ORD_bo_QuickAddMode:=False:C215
							If (ORD_l_quickaddprocess>0)
								POST OUTSIDE CALL:C329(ORD_l_quickaddprocess)
							End if 
							
							OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems2"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems1"; True:C214)
					End case 
					
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("Orders_InLP"+String:C10(DB_l_ButtonClickedFunction))
					
					If ((iOK=1) | (iCancel=1))
						If (PROD_l_SelectorPallette>0)
							$_t_oldMethodName2:=ERR_MethodTracker("Orders_InLP+"+"Waiting for product selector palette")
							//tell it to end
							While (Semaphore:C143("$SelectorBusy"))
								DelayTicks(20)
							End while 
							SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_bo_Exit; True:C214)
							POST OUTSIDE CALL:C329(PROD_l_SelectorPallette)
							CLEAR SEMAPHORE:C144("$SelectorBusy")
						End if 
						
					End if 
					$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ModuleRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
						//TRACE
						In_ButtCall("R:Orders_InLPA:D:Orders_InCan"; ""; "Order_InDel"; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Orders"; ("1 "*vAdd)+"3"; "Orders_InLPß"; "OrMaster"; "Orders_Sel"; ""; ->[ORDER_ITEMS:25]; ->vButtDisOrd; $_ptr_ListBoxSetup; True:C214)
					End if 
				End if 
				DB_l_ButtonClickedFunction:=0
			Else 
				
				$_t_oldMethodName2:=ERR_MethodTracker("Orders_InLP+"+"Calling Gen outside call")
				Gen_OutsideCoCo(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
				<>AutoProc:=0
				
				
		End case 
		
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Plug in Area:K2:16) | ($_l_Event=On Menu Selected:K2:14)
		
		
		If ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Clicked:K2:4)
			
			
			//This is here because we often do  a precautionary save this causes all the fields to think they are modified
			Case of 
				: (BAR_t_Button#"")
					$_l_ButtonNumber:=Num:C11(BAR_t_Button)
					If ($_l_ButtonNumber>1)
						ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
						$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
						DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
						DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Orders_In13")
					End if 
					BAR_t_Button:=""
				: (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				: (Vtot=1)
					vTot:=0
					If (vALLevels#0)
						Orders_InLPOI  //this is here for the AL Pro method only
						
						ORD_bo_OrderModified:=True:C214
					Else 
						Orders_InLPTot  //this is done within the above
						
						ORD_bo_OrderModified:=True:C214
					End if 
					If ([ORDERS:24]Credit_Card_No:49#"")
						[ORDERS:24]CC_Auth:56:="Required"
						ORD_bo_OrderModified:=True:C214
					End if 
				: (vTot=2)
					vTot:=0
					REDRAW:C174([ORDER_ITEMS:25])
					
				: ($_l_Event=On Menu Selected:K2:14)
					//TRACE
					
					DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Orders_In13")
					In_ButtChkDis(->vButtDisOrd)
					$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
					
					$_l_WindowRef:=0
					If ($_l_ProcessRow>0)  //It should be
						
						If (<>PRC_al_ProcessCalledBy{$_l_ProcessRow}=Current process:C322)
							//TRACE
							For ($_l_ProcessIndex; $_l_ProcessRow+1; Size of array:C274(<>PRC_al_ProcessCalledBy))
								If (<>PRC_al_ProcessCalledBy{$_l_ProcessIndex}#Current process:C322)
									$_l_ProcessRow:=$_l_ProcessIndex
									$_l_ProcessIndex:=Size of array:C274(<>PRC_al_ProcessCalledBy)
								End if 
							End for 
						End if 
						$_l_WindowRef:=<>PRC_al_WindowReference{$_l_ProcessRow}
						
					End if 
					$_l_FrontmostWindow:=Frontmost window:C447
					If ($_l_WindowRef=WIN_l_CurrentWinRef) | ($_l_WindowRef=0)
						
						If (vAccessSwNo=-1)
							vAccessSwNo:=0
						Else 
							If (vTot=1)
								vTot:=0
								//  If (Count parameters=1)  `temporary
								Orders_InLPOI  //this is here for the AL Pro method only
								
								//   Else
								//  Orders_InLPTot   `this is done within the above
								//  End if
							End if 
							vFromIn:=After:C31
						End if 
						States_CUArr(->[ORDERS:24]State:15)
						SD2_SetDiaryPopup(->ORD_al_ViewTableToTable; ->ORD_at_ViewTabsLabels; ->ORD_at_TabNames)
						If (ORD_at_ViewTabsLabels>0)
							$_l_ModuleRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
							If ($_l_ModuleRow>0)
								$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ModuleRow}
								If (Size of array:C274($_ptr_ListBoxSetup->)>=9)
									
									$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
									If (Size of array:C274($_ptr_ArrayReferences->)>=10)
										$_t_SubItemName:=$_ptr_ArrayReferences->{10}
										Case of 
											: (ORD_at_OrdersTab=1)
												If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //if and when we make other  items removable then we can enable other items
													
													In_ButtChkDis(->vButtDisOrd; "Order"; $_t_SubItemName)
												Else 
													In_ButtChkDis(->vButtDisOrd; "Order")
												End if 
											: (ORD_at_OrdersTab=2)
												In_ButtChkDis(->vButtDisOrd; "Order")
										End case 
									End if 
								Else 
									
									
									In_ButtChkDis(->vButtDisOrd; "Order")
									
								End if 
							End if 
						End if 
					End if 
					If (Records in selection:C76([ORDERS:24])<=1)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
						OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
					
					
			End case 
			If ($_l_Event=On Menu Selected:K2:14)
				DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Orders_In13")
			End if 
		Else 
			Orders_InLPD
		End if 
		
		vStPrev:=[ORDERS:24]State:15  //because this get updated elsewhere
		
		vStPrevOLD:=[ORDERS:24]State:15
		
		In_ButtChkDis(->vButtDisOrd)
		
		
	: ($_l_Event=On Deactivate:K2:10)
	: ($_l_Event=On Resize:K2:27)
		
		
		
	: ($_l_Event=On Unload:K2:2)
		
		If (WS_OLDSORTORDER#[ORDER_ITEMS:25]Sort_Order:26) | (WS_OLDSORTORDER=0)
			OrderI_SortCalc
		End if 
		
End case 
ERR_MethodTrackerReturn("Orders_InLP"; $_t_oldMethodName)
