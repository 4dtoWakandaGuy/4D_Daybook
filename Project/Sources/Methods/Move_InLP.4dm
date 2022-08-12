//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 00:13`Method: Move_InLP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(iCancel)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_BUTTON_4)
	//C_UNKNOWN(PAL_BUTTON_5)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//C_UNKNOWN(STOCK_AutoCancel)
	//C_UNKNOWN(vButtDisMov)
	//C_UNKNOWN(vCompName)
	//C_UNKNOWN(vFromIn)
	//C_UNKNOWN(vName)
	//C_UNKNOWN(vTot)
	//C_UNKNOWN(vType)
	ARRAY BOOLEAN:C223($_abo_2DboolanData; 0; 0)
	//ARRAY BOOLEAN(STK_abo_Used;0)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY DATE:C224($_ad_2DDateData; 0; 0)
	ARRAY INTEGER:C220($_ai_2DIntegerData; 0; 0)
	ARRAY LONGINT:C221($_al_2DLongintData; 0; 0)
	ARRAY LONGINT:C221($_al_LongintData; 0)
	//ARRAY LONGINT(AL_al_ModeStock;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY REAL:C219($_ar_2DLongintData; 0; 0)
	ARRAY REAL:C219($_ar_2DRealData; 0; 0)
	ARRAY TEXT:C222($_at_2DAlphatData; 0; 0)
	ARRAY TEXT:C222($_at_2DTextData; 0; 0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	ARRAY TIME:C1223($_ati_2DTImeData; 0; 0)
	C_BLOB:C604(STK_BL_DataBlob)
	C_BOOLEAN:C305($_bo_ReadOnly; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; STK_bo_AddItem; STK_bo_DataPointer; STK_bo_LineTrackerActive; STOCK_AutoCancel; vFromIn; $_bo_ReadOnly; DB_bo_NoLoad)
	C_BOOLEAN:C305(DB_bo_RecordModified; PAL_bo_ButtonSubFunction; STK_bo_AddItem; STK_bo_DataPointer; STK_bo_LineTrackerActive)
	C_DATE:C307(STK_D_DataPointer)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_ArraySize; $_l_ButtonNumber; $_l_ButtonPressed; $_l_ColumnsIndex; $_l_FormEvent; $_l_index; $_l_LastFieldNumber; $_l_LineAddedNumber; $_l_MaxWidth; $_l_ModuleRow)
	C_LONGINT:C283($_l_MovementItemIndex; $_l_offset; $_l_RecordCount; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel)
	C_LONGINT:C283(IP_l_Message; LB_l_ColumnNumber; LB_l_RowNumber; ModuleNumber; PAL_but_LastRecord; PAL_BUTTON_4; PAL_BUTTON_5; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; STK_l_DataPointer)
	C_LONGINT:C283(STK_l_DupID; STK_l_NewStockItemID; STK_l_REcallID; STOCK_l_CopyProcess; $_l_AddedLineNumber; $_l_ArraySize; $_l_ButtonNumber; $_l_ButtonPressed; $_l_ColumnsIndex; $_l_FormEvent; $_l_index)
	C_LONGINT:C283($_l_LastFieldNumber; $_l_LineAddedNumber; $_l_MaxWidth; $_l_ModuleRow; $_l_MovementItemIndex; $_l_offset; $_l_RecordCount; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_LONGINT:C283($1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iOK; IP_l_Message; LB_l_ColumnNumber; LB_l_RowNumber; STK_l_DataPointer; STK_l_DupID; STK_l_NewStockItemID; STK_l_REcallID)
	C_LONGINT:C283(STOCK_l_CopyProcess)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_Field; $_ptr_LBTable; $_Ptr_ThisColumnArray; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_Field; $_ptr_LBTable; $_Ptr_ThisColumnArray)
	C_REAL:C285(STK_r_BreakQuantity; STK_R_DataPointer; vTot; STK_r_BreakQuantity; STK_R_DataPointer)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_LastSavedTableName; $_t_CheckStockType; $_t_MovementClass; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR)
	C_TEXT:C284(PAL_BUTTON; STK_t_CurrentStockType; STK_t_DataPointer; vButtDisMov; vCompName; vName; vType; WIN_t_CurrentInputForm; <>SYS_t_BaseCurrency; <>SYS_t_LastSavedTableName; $_t_CheckStockType)
	C_TEXT:C284($_t_MovementClass; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; STK_t_CurrentStockType; STK_t_DataPointer; WIN_t_CurrentInputForm)
	C_TIME:C306(STK_ti_DataPointer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLP")
//Move_InLP
If (Count parameters:C259>=1)
	$_l_FormEvent:=$1
Else 
	$_l_FormEvent:=Form event code:C388
End if 

Case of 
	: ($_l_FormEvent=On Resize:K2:27)
		
		LBI_Scrollonresize(->STK_LB_StockItems)
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		STK_bo_AddItem:=False:C215
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_MaxWidth:=Screen width:C187-$_l_WindowLeft
		If ($_l_MaxWidth>800)
			$_l_MaxWidth:=800
		End if 
		WS_AutoscreenSize(1; 450; $_l_MaxWidth; Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+"Movements_in")
		ARRAY TEXT:C222(SM_at_ModeStockMov; 0)
		ARRAY LONGINT:C221(AL_al_ModeStock; 0)
		LBi_SetListBoxOptions(->SM_at_ModeStockMov; ->AL_al_ModeStock; ->STK_pic_ModeStock)
		INT_SetInput(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		If ([STOCK_MOVEMENTS:40]Movement_Type:6="")
			GOTO OBJECT:C206([STOCK_MOVEMENTS:40]Movement_Type:6)
		End if 
		Move_InLPB
		In_ButtChkDis(->vButtDisMov; "Stock Movement")
		
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_in")
		If (Records in selection:C76([STOCK_MOVEMENTS:40])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
			End if 
			If ([MOVEMENT_TYPES:60]PreventAddLine:37) | ([MOVEMENT_TYPES:60]PreventManualEntry:38)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_4; False:C215)
			End if 
			If ([MOVEMENT_TYPES:60]PreventManualEntry:38)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_5; False:C215)
			End if 
		End if 
		
	: (($_l_FormEvent=On Activate:K2:9) | (vFromIn))
		
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_in")
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		If (vTot=1)
			[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
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
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_in")
		INT_SetInput(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		If (Records in selection:C76([STOCK_MOVEMENTS:40])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
			End if 
			If ([MOVEMENT_TYPES:60]PreventAddLine:37) | ([MOVEMENT_TYPES:60]PreventManualEntry:38)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_4; False:C215)
			End if 
			If ([MOVEMENT_TYPES:60]PreventManualEntry:38)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_5; False:C215)
			End if 
		End if 
	: ($_l_FormEvent=On Menu Selected:K2:14)
		
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_in")
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		If (vTot=1)
			[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
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
		INT_SetInput(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		If (Records in selection:C76([STOCK_MOVEMENTS:40])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_FormEvent=On Outside Call:K2:11)  //& (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				inButtSubHandle(FORM Get current page:C276; ->[STOCK_MOVEMENTS:40])
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("GetRecordCode"))
				IP_t_MessageReplySTR:=[STOCK_MOVEMENTS:40]Movement_Code:1
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=[STOCK_MOVEMENTS:40]Company_From:2
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				IP_t_MessageReplySTR:=[STOCK_MOVEMENTS:40]Contact_Code:3
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				If ([STOCK_MOVEMENTS:40]x_ID:22=0)
					[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextIDinMethod(->[STOCK_MOVEMENTS:40]x_ID:22)
				End if 
				IP_t_MessageReplySTR:=String:C10([STOCK_MOVEMENTS:40]x_ID:22)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("DragCopy"))
				LBi_DragCopy(->STK_aptr_ItemPreferences)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveDragged"))
				If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				End if 
				STK_RetrieveDraggedLines(->STK_aptr_ItemPreferences)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("StockItemSplit"))
				If (STK_l_DupID>0)
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_l_DupID)
					SET BLOB SIZE:C606(STK_BL_DataBlob; 0)
					For ($_l_MovementItemIndex; 1; Get last field number:C255(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
						
						$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_MovementItemIndex)
						DB_Data_to_Blob($_ptr_Field; ->STK_BL_DataBlob; -1)
					End for 
					
					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
					
					StockI_SubLPB
					$_l_LastFieldNumber:=Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27])
					ARRAY LONGINT:C221($_al_2DLongintData; $_l_LastFieldNumber; 0)
					ARRAY TEXT:C222($_at_2DAlphatData; $_l_LastFieldNumber; 0)
					ARRAY TEXT:C222($_at_2DTextData; $_l_LastFieldNumber; 0)
					ARRAY REAL:C219($_ar_2DRealData; $_l_LastFieldNumber; 0)
					ARRAY TIME:C1223($_ati_2DTImeData; $_l_LastFieldNumber; 0)
					ARRAY INTEGER:C220($_ai_2DIntegerData; $_l_LastFieldNumber; 0)
					ARRAY DATE:C224($_ad_2DDateData; $_l_LastFieldNumber; 0)
					ARRAY BOOLEAN:C223($_abo_2DboolanData; $_l_LastFieldNumber; 0)
					$_l_offset:=0
					$_l_RecordCount:=0
					ARRAY BOOLEAN:C223(STK_abo_Used; $_l_RecordCount)
					Repeat 
						If (BLOB size:C605(STK_BL_DataBlob)>$_l_offset)  //the blob is named this way because
							
							//it was originally used for orders
							$_l_RecordCount:=$_l_RecordCount+1
							ARRAY LONGINT:C221($_al_2DLongintData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TEXT:C222($_at_2DAlphatData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TEXT:C222($_at_2DTextData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY REAL:C219($_ar_2DRealData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TIME:C1223($_ati_2DTImeData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY INTEGER:C220($_ai_2DIntegerData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY DATE:C224($_ad_2DDateData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY BOOLEAN:C223($_abo_2DboolanData; $_l_LastFieldNumber; $_l_RecordCount)
							For ($_l_index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
								If (BLOB size:C605(STK_BL_DataBlob)>$_l_offset)
									$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_index)
									
									
									Case of 
										: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
											
											STK_t_DataPointer:=""
											$_l_offset:=DB_Blob_to_Data(->STK_t_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_at_2DAlphatData{$_l_index}{$_l_RecordCount}:=STK_t_DataPointer
										: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
											
											STK_bo_DataPointer:=False:C215
											$_l_offset:=DB_Blob_to_Data(->STK_bo_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_abo_2DboolanData{$_l_index}{$_l_RecordCount}:=STK_bo_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is date:K8:7)
											
											STK_D_DataPointer:=!00-00-00!
											$_l_offset:=DB_Blob_to_Data(->STK_D_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ad_2DDateData{$_l_index}{$_l_RecordCount}:=STK_D_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is integer:K8:5)
											
											STK_l_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_l_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214; Is longint:K8:6)
											
											$_ai_2DIntegerData{$_l_index}{$_l_RecordCount}:=STK_l_DataPointer
										: (Type:C295($_ptr_Field->)=Is longint:K8:6)
											
											STK_l_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_l_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ar_2DLongintData{$_l_index}{$_l_RecordCount}:=STK_l_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is picture:K8:10)
										: (Type:C295($_ptr_Field->)=Is real:K8:4)
											
											
											STK_R_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_R_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ar_2DRealData{$_l_index}{$_l_RecordCount}:=STK_R_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
										: (Type:C295($_ptr_Field->)=Is text:K8:3)
											
											
											STK_T_DataPointer:=""
											$_l_offset:=DB_Blob_to_Data(->STK_T_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_at_2DTextData{$_l_index}{$_l_RecordCount}:=STK_T_DataPointer
										: (Type:C295($_ptr_Field->)=Is time:K8:8)
											
											STK_ti_DataPointer:=?00:00:00?
											$_l_offset:=DB_Blob_to_Data(->STK_ti_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ati_2DTImeData{$_l_index}{$_l_RecordCount}:=(STK_ti_DataPointer)
										Else 
									End case 
								End if 
							End for 
						End if 
						
					Until (BLOB size:C605(STK_BL_DataBlob)<=($_l_offset+5))
					ARRAY BOOLEAN:C223(STK_abo_Used; Size of array:C274($_ai_2DIntegerData{1}))
					
					For ($_l_ColumnsIndex; 1; Size of array:C274($_ai_2DIntegerData{1}))
						If (STK_abo_Used{$_l_ColumnsIndex}=False:C215)
							
							For ($_l_index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
								$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_index)
								//``
								Case of 
									: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
										
										$_ptr_Field->:=$_at_2DAlphatData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
										
										$_ptr_Field->:=$_abo_2DboolanData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is date:K8:7)
										
										$_ptr_Field->:=$_ad_2DDateData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is integer:K8:5)
										
										$_ptr_Field->:=$_ai_2DIntegerData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is longint:K8:6)
										
										$_ptr_Field->:=$_ar_2DLongintData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is picture:K8:10)
									: (Type:C295($_ptr_Field->)=Is real:K8:4)
										
										
										$_ptr_Field->:=$_ar_2DRealData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
									: (Type:C295($_ptr_Field->)=Is text:K8:3)
										
										
										$_ptr_Field->:=$_at_2DTextData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is time:K8:8)
										
										$_ptr_Field->:=$_ati_2DTImeData{$_l_index}{$_l_ColumnsIndex}
										
									Else 
										
								End case 
							End for 
						End if 
					End for 
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_r_BreakQuantity
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=0
					<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
					If (STK_bo_LineTrackerActive)
						$_l_ModuleRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						If ($_l_ModuleRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					End if 
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{1}
					LB_l_RowNumber:=LB_GetLine($_ptr_ArrayReferences)
					LB_l_ColumnNumber:=LB_GetColumn($_ptr_ArrayReferences)
					$_l_LineAddedNumber:=LBi_xPlus(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; LB_l_RowNumber; LB_l_ColumnNumber; ->STK_pic_ModeStock; LB_l_RowNumber)  //`````<------???
					
					
					
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{1}
					$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
					$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
					$_ptr_LBTable:=STK_aptr_ItemPreferences{10}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
					$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
					If ($_l_LineAddedNumber>0)
						$_l_ArraySize:=$_l_LineAddedNumber
					End if 
					$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
					For ($_l_index; 1; Size of array:C274($_ptr_EnterabilityArray->))
						If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_index}))
							LB_GoToCell($_ptr_ArrayReferences; $_l_index; $_l_ArraySize)
							$_l_index:=Size of array:C274($_ptr_EnterabilityArray->)
						End if 
					End for 
					STK_r_BreakQuantity:=0
					STK_l_DupID:=0
				End if 
				DB_l_ButtonClickedFunction:=0
			: (IP_l_Message=((Table:C252(->[STOCK_MOVEMENTS:40])+100)+1))
				//ALERT("9a")
				//TRACE
				//auto add a line-used for splitting off a line on the stock movement
				If (STK_l_DupID>0)
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_l_DupID)
					If (STK_bo_LineTrackerActive)
						$_l_ModuleRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						If ($_l_ModuleRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					End if 
					
					SET BLOB SIZE:C606(STK_BL_DataBlob; 0)
					For ($_l_MovementItemIndex; 1; Get last field number:C255(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
						
						$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_MovementItemIndex)
						DB_Data_to_Blob($_ptr_Field; ->STK_BL_DataBlob; -1)
					End for 
					
					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
					
					StockI_SubLPB
					$_l_LastFieldNumber:=Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27])
					ARRAY LONGINT:C221($_al_2DLongintData; $_l_LastFieldNumber; 0)
					ARRAY TEXT:C222($_at_2DAlphatData; $_l_LastFieldNumber; 0)
					ARRAY TEXT:C222($_at_2DTextData; $_l_LastFieldNumber; 0)
					ARRAY REAL:C219($_ar_2DRealData; $_l_LastFieldNumber; 0)
					ARRAY TIME:C1223($_ati_2DTImeData; $_l_LastFieldNumber; 0)
					ARRAY INTEGER:C220($_ai_2DIntegerData; $_l_LastFieldNumber; 0)
					ARRAY DATE:C224($_ad_2DDateData; $_l_LastFieldNumber; 0)
					ARRAY BOOLEAN:C223($_abo_2DboolanData; $_l_LastFieldNumber; 0)
					$_l_offset:=0
					$_l_RecordCount:=0
					ARRAY BOOLEAN:C223(STK_abo_Used; $_l_RecordCount)
					Repeat 
						If (BLOB size:C605(STK_BL_DataBlob)>$_l_offset)  //the blob is named this way because
							
							//it was originally used for orders
							$_l_RecordCount:=$_l_RecordCount+1
							ARRAY LONGINT:C221($_al_2DLongintData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TEXT:C222($_at_2DAlphatData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TEXT:C222($_at_2DTextData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY REAL:C219($_ar_2DRealData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY TIME:C1223($_ati_2DTImeData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY INTEGER:C220($_ai_2DIntegerData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY DATE:C224($_ad_2DDateData; $_l_LastFieldNumber; $_l_RecordCount)
							ARRAY BOOLEAN:C223($_abo_2DboolanData; $_l_LastFieldNumber; $_l_RecordCount)
							For ($_l_index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
								If (BLOB size:C605(STK_BL_DataBlob)>$_l_offset)
									$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_index)
									
									
									Case of 
										: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
											
											STK_t_DataPointer:=""
											$_l_offset:=DB_Blob_to_Data(->STK_t_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_at_2DAlphatData{$_l_index}{$_l_RecordCount}:=STK_t_DataPointer
										: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
											
											STK_bo_DataPointer:=False:C215
											$_l_offset:=DB_Blob_to_Data(->STK_bo_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_abo_2DboolanData{$_l_index}{$_l_RecordCount}:=STK_bo_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is date:K8:7)
											
											STK_D_DataPointer:=!00-00-00!
											$_l_offset:=DB_Blob_to_Data(->STK_D_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ad_2DDateData{$_l_index}{$_l_RecordCount}:=STK_D_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is integer:K8:5)
											
											STK_l_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_l_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214; Is longint:K8:6)
											
											$_ai_2DIntegerData{$_l_index}{$_l_RecordCount}:=STK_l_DataPointer
										: (Type:C295($_ptr_Field->)=Is longint:K8:6)
											
											STK_l_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_l_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_al_2DLongintData{$_l_index}{$_l_RecordCount}:=STK_l_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is picture:K8:10)
										: (Type:C295($_ptr_Field->)=Is real:K8:4)
											
											
											STK_R_DataPointer:=0
											$_l_offset:=DB_Blob_to_Data(->STK_R_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ar_2DRealData{$_l_index}{$_l_RecordCount}:=STK_R_DataPointer
											
										: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
										: (Type:C295($_ptr_Field->)=Is text:K8:3)
											
											
											STK_T_DataPointer:=""
											$_l_offset:=DB_Blob_to_Data(->STK_T_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_at_2DTextData{$_l_index}{$_l_RecordCount}:=STK_T_DataPointer
										: (Type:C295($_ptr_Field->)=Is time:K8:8)
											
											STK_ti_DataPointer:=?00:00:00?
											$_l_offset:=DB_Blob_to_Data(->STK_ti_DataPointer; ->STK_BL_DataBlob; $_l_offset; True:C214)
											$_ati_2DTImeData{$_l_index}{$_l_RecordCount}:=(STK_ti_DataPointer*1)
										Else 
									End case 
								End if 
							End for 
						End if 
						
					Until (BLOB size:C605(STK_BL_DataBlob)<=($_l_offset+5))
					ARRAY BOOLEAN:C223(STK_abo_Used; Size of array:C274($_ai_2DIntegerData{1}))
					
					For ($_l_ColumnsIndex; 1; Size of array:C274($_ai_2DIntegerData{1}))
						If (STK_abo_Used{$_l_ColumnsIndex}=False:C215)
							
							For ($_l_index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
								$_ptr_Field:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_index)
								//``
								Case of 
									: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
										
										$_ptr_Field->:=$_at_2DAlphatData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
										
										$_ptr_Field->:=$_abo_2DboolanData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is date:K8:7)
										
										$_ptr_Field->:=$_ad_2DDateData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is integer:K8:5)
										
										$_ptr_Field->:=$_ai_2DIntegerData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is longint:K8:6)
										
										$_ptr_Field->:=$_al_2DLongintData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is picture:K8:10)
									: (Type:C295($_ptr_Field->)=Is real:K8:4)
										
										
										$_ptr_Field->:=$_ar_2DRealData{$_l_index}{$_l_ColumnsIndex}
										
									: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
									: (Type:C295($_ptr_Field->)=Is text:K8:3)
										
										
										$_ptr_Field->:=$_at_2DTextData{$_l_index}{$_l_ColumnsIndex}
									: (Type:C295($_ptr_Field->)=Is time:K8:8)
										
										$_ptr_Field->:=$_ati_2DTImeData{$_l_index}{$_l_ColumnsIndex}
									Else 
										
								End case 
							End for 
						End if 
					End for 
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_NewStockItemID
					STK_l_NewStockItemID:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=STK_r_BreakQuantity
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=STK_GetPOItemNumber([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					//[STOCK_MOVEMENT_ITEMS]Order_Code:=""
					//[STOCK_MOVEMENT_ITEMS]Company_To:=""
					
					<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
					Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
						//While (Test semaphore("$SettingCalledOff"))
						//DelayTicks (3)
						//End while
						//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
						//While (Test semaphore("$SettingCalledOff"))
						//DelayTicks (3)
						//End while
					End if 
					APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					If (STK_bo_LineTrackerActive)
						$_l_ModuleRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						If ($_l_ModuleRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					End if 
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{1}
					LB_l_RowNumber:=LB_GetLine($_ptr_ArrayReferences)
					LB_l_ColumnNumber:=LB_GetColumn($_ptr_ArrayReferences)
					$_l_AddedLineNumber:=LBi_xPlus(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; LB_l_RowNumber; LB_l_ColumnNumber)  //`````<------???
					
					
					
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{1}
					$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
					$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
					$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
					$_ptr_LBTable:=STK_aptr_ItemPreferences{10}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
					$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
					If ($_l_AddedLineNumber>0)
						$_l_ArraySize:=$_l_AddedLineNumber
					End if 
					$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
					For ($_l_index; 1; Size of array:C274($_ptr_EnterabilityArray->))
						If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_index}))
							LB_GoToCell($_ptr_ArrayReferences; $_l_index; $_l_ArraySize)
							$_l_index:=Size of array:C274($_ptr_EnterabilityArray->)
						End if 
					End for 
					STK_r_BreakQuantity:=0
					STK_l_DupID:=0
				End if 
				//ALERT("10a")
			: (IP_l_Message=((Table:C252(->[STOCK_MOVEMENTS:40])+100)+2))
				If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#STK_l_REcallID)
					FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
					For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						
						If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16#STK_l_REcallID)
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						Else 
							$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
							
						End if 
					End for 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_l_REcallID)
					If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
						If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
							If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
							End if 
							Case of 
								: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
									//ask about updating the PO
									STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; False:C215)
									
									
								: ([MOVEMENT_TYPES:60]UseForStockReceipt:33)  // this is the only type you can modify if it is copied from
									
									//so here we need to find the previous item(maybe multiple choices at this point
									Case of 
										: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											$_t_MovementClass:=STK_GetMovementClass([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; True:C214)
											If ($_t_MovementClass="Purchase Order")
												STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; True:C214)
											End if 
											
										: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
											
									End case 
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										Gen_Alert("You may not change the quantity on this stock movment item. ")
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
										
									End if 
									
							End case   //
							
						End if 
					End if 
					
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					If (STK_bo_LineTrackerActive)
						$_l_ModuleRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						If ($_l_ModuleRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					End if 
					<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
				End if 
				STK_l_REcallID:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("AutoCLose"))
				STOCK_AutoCancel:=True:C214
				CANCEL:C270
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				
				
				In_ButtCall("R:Move_InLPA:D:Stock_InCan"; ""; "Stock_inDelete"; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "Movements"; "1 5 6"; "Move_InLPB"; "Master"; ""; "Gen_ShowTelCo"; ->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisMov)
				If (STOCK_l_CopyProcess>0)
					SET PROCESS VARIABLE:C370(STOCK_l_CopyProcess; IP_l_Message; 1)
					
					POST OUTSIDE CALL:C329(STOCK_l_CopyProcess)
					STOCK_l_CopyProcess:=0
				End if 
				
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_FormEvent=On Data Change:K2:15)
		
		Case of 
			: (Modified:C32([STOCK_MOVEMENTS:40]Movement_Code:1))
				RemoveLeadTr(Uppercase:C13([STOCK_MOVEMENTS:40]Movement_Code:1); ->[STOCK_MOVEMENTS:40]Movement_Code:1)
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Movement_Code:1)
			: (Modified:C32([STOCK_MOVEMENTS:40]Company_From:2))
				
				If ([STOCK_MOVEMENTS:40]Company_From:2#"")
					Check_Company(->[STOCK_MOVEMENTS:40]Company_From:2; ->[CONTACTS:1]Contact_Code:2; ->[STOCK_MOVEMENTS:40])
					
					vCompName:=[COMPANIES:2]Company_Name:2
				Else 
					//added NG
					[STOCK_MOVEMENTS:40]Company_From:2:=Old:C35([STOCK_MOVEMENTS:40]Company_From:2)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Company_From:2)
			: (Modified:C32([STOCK_MOVEMENTS:40]Movement_Type:6))
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					//HIGHLIGHT TEXT([STOCK MOVEMENTS]Movement Type;0;9999)
					
					[STOCK_MOVEMENTS:40]Movement_Type:6:=STK_t_CurrentStockType
					OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
					
					Gen_Alert("Once items are added to a stock movement you cannot change the type of the movement")
				Else 
					
					Check_MinorNC(->[STOCK_MOVEMENTS:40]Movement_Type:6; "Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
					If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
						If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
						End if 
						If ([MOVEMENT_TYPES:60]PreventManualEntry:38)
							Gen_Alert("Sorry this movement type may not be used for a manual stock movement entry!")
							[STOCK_MOVEMENTS:40]Movement_Type:6:=""
							REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)
							
						End if 
					End if 
					
					Move_InType
					
					//DEFAULT TABLE([STOCK MOVEMENTS])
					$_t_CheckStockType:=Move_InTypeChk
					If ($_t_CheckStockType="")
						STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
						If ([MOVEMENT_TYPES:60]Number_Name:5#"")
							vName:=[MOVEMENT_TYPES:60]Number_Name:5
							//If (Old([STOCK MOVEMENTS]Type No)="")
							// [STOCK MOVEMENTS]Type No:=String(MovementTypes_No )
							// End if
						Else 
							vName:="Type No"
						End if 
						If ([MOVEMENT_TYPES:60]Serial_Unique:19)
							DB_MenuAction("Functions"; "Copy Current Stock"; 3; "")
							// DISABLE MENU ITEM(2;3)  `Functions: Copy Current Stock
						Else 
							DB_MenuAction("Functions"; "Copy Current Stock"; 2; "")
							//  ENABLE MENU ITEM(2;3)
						End if 
					Else 
						Gen_Alert("Stock Type "+$_t_CheckStockType+" does not exist, so this Movement Type cannot be used"; "Try again")
						REJECT:C38([STOCK_MOVEMENTS:40]Movement_Type:6)
						vType:=""
					End if 
					STK_t_CurrentStockType:=[STOCK_MOVEMENTS:40]Movement_Type:6
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Movement_Type:6)
					If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
						If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
						End if 
						If ([MOVEMENT_TYPES:60]PreventAddLine:37) | ([MOVEMENT_TYPES:60]PreventManualEntry:38)
							OBJECT SET ENABLED:C1123(PAL_BUTTON_4; False:C215)
						End if 
						If ([MOVEMENT_TYPES:60]PreventManualEntry:38)
							OBJECT SET ENABLED:C1123(PAL_BUTTON_5; False:C215)
						End if 
					End if 
					If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
						OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
					End if 
				End if 
			: (Modified:C32([STOCK_MOVEMENTS:40]Type_Number:4))
				[STOCK_MOVEMENTS:40]Type_Number:4:=Uppercase:C13([STOCK_MOVEMENTS:40]Type_Number:4)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Type_Number:4)
			: (vTot=1)
				If (STK_bo_AddItem)
					If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					End if 
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
					
				End if 
				[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
				vTot:=0
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Analysis_Code:9))
				Check_Analysis(->[STOCK_MOVEMENTS:40]Analysis_Code:9; "Analysis")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Analysis_Code:9)
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Currency_Code:10))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Currency_Code:10; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				If ([STOCK_MOVEMENTS:40]Currency_Code:10="")
					[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Currency_Code:10)
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Layer_Code:11))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Layer_Code:11; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
				Layer_Fill(->[STOCK_MOVEMENTS:40]Layer_Code:11)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[STOCK_MOVEMENTS:40]Layer_Code:11)
		End case 
	: ($_l_FormEvent=On Clicked:K2:4)
		
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_in")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_FormEvent=On Deactivate:K2:10)
		
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Move_InLP"; $_t_oldMethodName)
