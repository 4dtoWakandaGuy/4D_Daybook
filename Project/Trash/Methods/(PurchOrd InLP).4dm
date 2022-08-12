//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PurchOrd_InLP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_LB_PurchaseOrderItems;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PO_al_Mode;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY REAL(STK_ar_CopiedProductQuantites;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(PO_at_ModePO;0)
	//ARRAY TEXT(PO_at_TabNames;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	//ARRAY TEXT(STK_at_CopiedProductCodes;0)
	//ARRAY TEXT(STK_at_DeliveryLocCodes;0)
	//ARRAY TEXT(STK_at_DeliveryLocNames;0)
	//ARRAY TEXT(STK_at_PossibleLocationNames;0)
	//ARRAY TEXT(STK_at_PossibleLocations;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>SalesItemDP; $_bo_LocationFound; $_bo_ReadOnly; $_bo_Set; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; PO_bo_AddItem)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_ButtonNumber; $_l_CalledFromProcess; $_l_CharacterPosition; $_l_Column; $_l_CommentObjectRight; $_l_CopyLinesIndex; $_l_CurrentWinRefOLD; $_l_Event; $_l_FieldNumber; $_l_Index)
	C_LONGINT:C283($_l_ModuleRow; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop)
	C_LONGINT:C283($_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectWidth; $_l_Row; $_l_SizeofArray; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $1)
	C_LONGINT:C283(baddressModify; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; SD2_l_CallingProcess)
	C_LONGINT:C283(SD2_l_TableNum; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286(PO_pic_EditMode)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_FocusObject; $_ptr_LBTable; $_Ptr_ThisColumnArray)
	C_REAL:C285(PO_l_ItemId; vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_CompNameC; $_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_PurchaseCompanyCode; $_t_SubItemName; $_t_VariableName; $_t_WindowTitle; BAR_t_Button)
	C_TEXT:C284(COM_t_TelephoneNumberFormat; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; PO_t_AddressLine1; PO_t_AddressLine2; PO_t_Country; PO_t_County; PO_t_DeliveryAddress; PO_t_FalseTab; PO_t_PostalCode)
	C_TEXT:C284(PO_t_RelatedRecord; PO_t_RelatedRecordOLD; PO_t_TabFunction; PO_t_Town; SD2_t_TabFunction; STK_at_DeliveryLocationNAME; STK_t_DeliveryLocationNAME; vButtDisInv; vCompNameA; vCompNameC; vContNameA)
	C_TEXT:C284(vContNameC; vDetails; vExtnA; vExtnC; vTelA; vTelC; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_InLP")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 


Case of 
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->PO_LB_PurchaseOrderItems)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar
		PO_bo_AddItem:=False:C215
		ARRAY TEXT:C222(PO_at_ModePO; 0)
		ARRAY LONGINT:C221(PO_al_Mode; 0)
		LBi_SetListBoxOptions(->PO_at_ModePO; ->PO_al_Mode; ->PO_pic_EditMode; True:C214)
		PurchOrd_InLPB
		PurchOrd_InLPß("B")
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); "Purch Ord In13")
		WS_AutoscreenSize(1; 560; 800; Table name:C256(->[PURCHASE_ORDERS:57])+"_"+"Purch Ord In13")
		INT_SetInput(Table:C252(->[PURCHASE_ORDERS:57]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup(->PO_al_ViewTableToTable; ->PO_at_ViewTabsLabels; ->PO_at_TabNames)
		OBJECT GET COORDINATES:C663(*; "oFieldPlayerCode"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oFieldAnalCode"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
		OBJECT GET COORDINATES:C663(*; "oLocationNameSelector"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ObjectWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		OBJECT MOVE:C664(*; "oLocationNameSelector"; $_l_ObjectRight+2; $_l_ObjectTop2; ($_l_ObjectRight+2)+$_l_ObjectWidth; $_l_ObjectBottom2-2; *)
		
		OBJECT GET COORDINATES:C663(*; "oLocationDelivery"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ObjectWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		OBJECT MOVE:C664(*; "oLocationDelivery"; $_l_ObjectLeft3; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2; *)
		OBJECT GET COORDINATES:C663(*; "oStdAddressLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oLocationDeliverylabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ObjectWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		OBJECT MOVE:C664(*; "oLocationDeliverylabel"; $_l_ObjectRight-$_l_ObjectWidth; $_l_ObjectTop2; $_l_ObjectLeft3-8; $_l_ObjectBottom2; *)
		$_l_CommentObjectRight:=($_l_ObjectRight-$_l_ObjectWidth)-8
		OBJECT GET COORDINATES:C663(*; "oFieldComment"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ObjectWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		OBJECT MOVE:C664(*; "oFieldComment"; $_l_CommentObjectRight-$_l_ObjectWidth; $_l_ObjectTop2; $_l_CommentObjectRight; $_l_ObjectBottom2; *)
		If (Size of array:C274(POI_aptr_LBSetup)>=9)
			
			$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)  //this is only here as a precaution
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])) | (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //if and when we make other  items removable then we can enable other items
					In_ButtChkDis(->vButtDisInv; "Purchase Order"; $_t_SubItemName)
				Else 
					In_ButtChkDis(->vButtDisInv; "Purchase Order")
				End if 
				
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisInv)
			
		End if 
		
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS:57]); "Purch Ord In13")
		If (Records in selection:C76([PURCHASE_ORDERS:57])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		Case of 
			: ([PURCHASE_ORDERS:57]Purchase_Order_Date:3<Current date:C33)
				GOTO OBJECT:C206([PURCHASE_ORDERS:57]Comments:8)
				
			: ([PURCHASE_ORDERS:57]Company_Code:1="")
				GOTO OBJECT:C206([PURCHASE_ORDERS:57]Company_Code:1)
			: ([PURCHASE_ORDERS:57]Contact_Code:5="")
				GOTO OBJECT:C206([PURCHASE_ORDERS:57]Contact_Code:5)
			: ([PURCHASE_ORDERS:57]Comments:8="")
				GOTO OBJECT:C206([PURCHASE_ORDERS:57]Comments:8)
		End case 
	: ($_l_Event=On Activate:K2:9)  //| (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS:57]); "Purch Ord In13")
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup(->PO_al_ViewTableToTable; ->PO_at_ViewTabsLabels; ->PO_at_TabNames)
		If (Size of array:C274(POI_aptr_LBSetup)>=9)
			
			$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)  //this is only here as a precaution
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])) | (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //if and when we make other  items removable then we can enable other items
					In_ButtChkDis(->vButtDisInv; "Purchase Order"; $_t_SubItemName)
				Else 
					In_ButtChkDis(->vButtDisInv; "Purchase Order")
				End if 
				
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisInv)
			
		End if 
		If (Records in selection:C76([PURCHASE_ORDERS:57])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)  //| (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS:57]); "Purch Ord In13")
		SD2_SetDiaryPopup(->PO_al_ViewTableToTable; ->PO_at_ViewTabsLabels; ->PO_at_TabNames)
		If (Size of array:C274(POI_aptr_LBSetup)>=9)
			
			$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)  //this is only here as a precaution
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])) | (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //if and when we make other  items removable then we can enable other items
					In_ButtChkDis(->vButtDisInv; "Purchase Order"; $_t_SubItemName)
				Else 
					In_ButtChkDis(->vButtDisInv; "Purchase Order")
				End if 
				
			End if 
		Else 
			
			In_ButtChkDis(->vButtDisInv)
			
		End if 
		If (Records in selection:C76([PURCHASE_ORDERS:57])<=1)
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
				
				inButtSubHandle(FORM Get current page:C276; ->[PURCHASE_ORDERS:57])
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("CopyProduct"))
				
				//Receive a copied product
				If (Size of array:C274(STK_at_CopiedProductCodes)>0)
					For ($_l_CopyLinesIndex; 1; Size of array:C274(STK_at_CopiedProductCodes))
						
						CREATE RECORD:C68([PURCHASE_ORDERS_ITEMS:169])
						PO_l_ItemId:=0
						[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
						[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
						[PURCHASE_ORDERS_ITEMS:169]POitemID:16:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
						[PURCHASE_ORDERS_ITEMS:169]Product_Code:1:=STK_at_CopiedProductCodes{$_l_CopyLinesIndex}
						PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
						[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=STK_ar_CopiedProductQuantites{$_l_CopyLinesIndex}
						PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
						If (([PURCHASE_ORDERS_ITEMS:169]Product_Name:2="") & ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#""))
							RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
							[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=[PRODUCTS:9]Product_Name:2
						End if 
						
						If ([PURCHASE_ORDERS_ITEMS:169]Quantity:3=0)
							[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=1
						End if 
						If ([PURCHASE_ORDERS_ITEMS:169]Price_Per:12=0)
							[PURCHASE_ORDERS_ITEMS:169]Price_Per:12:=1
						End if 
						If ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7="")
							PurchOrd_Tax
						End if 
						[PURCHASE_ORDERS_ITEMS:169]Print_Description:14:=<>SalesItemDP
						$_ptr_ArrayReferences:=POI_aptr_LBSetup{1}
						LISTBOX GET CELL POSITION:C971($_ptr_ArrayReferences->; $_l_Column; $_l_Row)
						$_l_AddedLineNumber:=LBi_xPlus(->POI_aptr_LBSetup; ->PO_at_ModePO; $_l_Row; $_l_Column)
						//put the cursor in the correct place
						$_ptr_ArrayofArrayPointers:=POI_aptr_LBSetup{3}
						$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
						$_ptr_EnterabilityArray:=POI_aptr_LBSetup{14}
						$_ptr_LBTable:=POI_aptr_LBSetup{10}
						$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
						If ($_l_AddedLineNumber>0)
							$_l_SizeofArray:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								
								LB_GoToCell($_ptr_ArrayReferences; $_l_Index; $_l_SizeofArray)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
								$_bo_Set:=True:C214
							End if 
						End for 
						DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
						
					End for 
				End if 
				
				ARRAY TEXT:C222(STK_at_CopiedProductCodes; 0)
				ARRAY REAL:C219(STK_ar_CopiedProductQuantites; 0)
				
				
				DB_l_ButtonClickedFunction:=0
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				
				
				PO_t_FalseTab:=PO_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[PURCHASE_ORDERS:57])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				DB_l_ButtonClickedFunction:=0
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				//$_bo_Exit:=(DB_l_ButtonClickedFunction=DB_GetButtonFunction ("Close")) | (iOK=1) | (iCancel=1) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction ("OK")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction ("Cancel")) | (DDB_l_ButtonClickedFunction=DuttonFunction ("Delete")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction ("Last")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction ("First")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction ("Previous")) | (DB_l_ButtonClickedFunction=DB_uttonFunction ("Next"))
				
				
				
				In_ButtCall("PurchOrd_InLPA"; ""; "Minor_DelSin"; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Company_Code:1; "Purchase Orders"; "1 2"; "PurchOrd_InLPß"; ""; ""; "PurchOrd_InTel"; ->[IDENTIFIERS:16]; ->vButtDisInv; ->POI_aptr_LBSetup; True:C214)
				
				
				
				
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
					CREATE SET:C116([DIARY:12]; "ORDcurrentDiary")  //Just to make sure we keep the selection
					PO_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					USE SET:C118("ORDcurrentDiary")
					CLEAR SET:C117("ORDcurrentDiary")
				End if 
				
				
				
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			
			Case of 
					
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Company_Code:1))
					$_t_CompNameC:=vCompNameC
					Check_Company(->[PURCHASE_ORDERS:57]Company_Code:1; ->[PURCHASE_ORDERS:57]Contact_Code:5; ->[PURCHASE_ORDERS:57])
					
					vCompNameA:=[COMPANIES:2]Company_Name:2
					vTelA:=[COMPANIES:2]Telephone:9
					If ([COMPANIES:2]Country:8#"")
						If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
							QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
							COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
						End if 
					Else 
						COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
					End if 
					If (COM_t_TelephoneNumberFormat#"")
						OBJECT SET FORMAT:C236(vTelA; COM_t_TelephoneNumberFormat)
					End if 
					vCompNameC:=$_t_CompNameC
					If ([PURCHASE_ORDERS:57]Company_Code:1#"")
						Check_ContDef(->[PURCHASE_ORDERS:57]Company_Code:1; ->[PURCHASE_ORDERS:57]Contact_Code:5)
						vContNameA:=[CONTACTS:1]Contact_Name:31
						vExtnA:=[CONTACTS:1]Extn:9
						Layer_InDDef(->[PURCHASE_ORDERS:57]Layer_Code:17)
						If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])=0)
							Currency_InDDefault(->[PURCHASE_ORDERS:57]Currency_Code:16)
						End if 
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Company_Code:1)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Contact_Code:5))
					$_t_PurchaseCompanyCode:=[PURCHASE_ORDERS:57]Company_Code:1
					Check_Contact(->[PURCHASE_ORDERS:57]Contact_Code:5; ->[PURCHASE_ORDERS:57]Company_Code:1; ->[PURCHASE_ORDERS:57])
					vCompNameA:=[COMPANIES:2]Company_Name:2
					vTelA:=[COMPANIES:2]Telephone:9
					vContNameA:=[CONTACTS:1]Contact_Name:31
					vExtnA:=[CONTACTS:1]Extn:9
					If (($_t_PurchaseCompanyCode="") & ([PURCHASE_ORDERS:57]Company_Code:1#""))
						Layer_InDDef(->[PURCHASE_ORDERS:57]Layer_Code:17)
						If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])=0)
							Currency_InDDefault(->[PURCHASE_ORDERS:57]Currency_Code:16)
						End if 
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Contact_Code:5)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Deliver_to_Company:6))
					Check_Company(->[PURCHASE_ORDERS:57]Deliver_to_Company:6; ->[PURCHASE_ORDERS:57]Deliver_to_Contact:7; ->[PURCHASE_ORDERS:57])
					
					vCompNameC:=[COMPANIES:2]Company_Name:2
					vTelC:=[COMPANIES:2]Telephone:9
					If ([COMPANIES:2]Country:8#"")
						If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
							QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
							COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
						End if 
					Else 
						COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
					End if 
					If (COM_t_TelephoneNumberFormat#"")
						OBJECT SET FORMAT:C236(vTelC; COM_t_TelephoneNumberFormat)
					End if 
					If ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
						Check_ContDef(->[PURCHASE_ORDERS:57]Deliver_to_Company:6; ->[PURCHASE_ORDERS:57]Deliver_to_Contact:7)
						vContNameC:=[CONTACTS:1]Contact_Name:31
						vExtnC:=[CONTACTS:1]Extn:9
						PO_t_DeliveryAddress:=""
						OBJECT SET ENTERABLE:C238(PO_t_DeliveryAddress; False:C215)
						OBJECT SET VISIBLE:C603(PO_t_DeliveryAddress; True:C214)
						OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
						OBJECT SET VISIBLE:C603(baddressModify; True:C214)
						PO_t_AddressLine1:=""
						PO_t_AddressLine2:=""
						PO_t_Town:=""
						PO_t_County:=""
						PO_t_PostalCode:=""
						PO_t_Country:=""
						
						Case of 
							: ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20>0)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
								QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[PURCHASE_ORDERS:57]x_DeliveryAddressID:20)
								PO_t_DeliveryAddress:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
								RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
							: ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Contact:7)
								MCont_Add("L")
								PO_t_DeliveryAddress:=vDetails
								RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
							Else 
								PO_t_DeliveryAddress:=DB_GetOrganisationAddress
						End case 
						
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Deliver_to_Company:6)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Deliver_to_Contact:7))
					Check_Contact(->[PURCHASE_ORDERS:57]Deliver_to_Contact:7; ->[PURCHASE_ORDERS:57]Deliver_to_Company:6; ->[PURCHASE_ORDERS:57])
					vCompNameC:=[COMPANIES:2]Company_Name:2
					vTelC:=[COMPANIES:2]Telephone:9
					vContNameC:=[CONTACTS:1]Contact_Name:31
					vExtnC:=[CONTACTS:1]Extn:9
					DB_bo_RecordModified:=True:C214
					If ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
						Check_ContDef(->[PURCHASE_ORDERS:57]Deliver_to_Company:6; ->[PURCHASE_ORDERS:57]Deliver_to_Contact:7)
						vContNameC:=[CONTACTS:1]Contact_Name:31
						vExtnC:=[CONTACTS:1]Extn:9
						PO_t_DeliveryAddress:=""
						OBJECT SET ENTERABLE:C238(PO_t_DeliveryAddress; False:C215)
						Case of 
							: ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20>0)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
								QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[PURCHASE_ORDERS:57]x_DeliveryAddressID:20)
								PO_t_DeliveryAddress:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
								RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
							: ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
								
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Contact:7)
								MCont_Add("L")
								PO_t_DeliveryAddress:=vDetails
								RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
								RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
							Else 
								PO_t_DeliveryAddress:=DB_GetOrganisationAddress
						End case 
						
					End if 
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Deliver_to_Contact:7)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Date:3))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Purchase_Order_Date:3)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Comments:8))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Comments:8)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Supply_by_Date:10))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Supply_by_Date:10)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Finance_Method:11))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Finance_Method:11)
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Supplier_Ref:12))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Supplier_Ref:12)
					
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Analysis_Code:15))
					Check_Analysis(->[PURCHASE_ORDERS:57]Analysis_Code:15; "Analysis")
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Analysis_Code:15)
					
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Currency_Code:16))
					Check_MinorNC(->[PURCHASE_ORDERS:57]Currency_Code:16; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
					If ([PURCHASE_ORDERS:57]Currency_Code:16="")
						[PURCHASE_ORDERS:57]Currency_Code:16:=<>SYS_t_BaseCurrency
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Currency_Code:16)
					
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Layer_Code:17))
					Check_MinorNC(->[PURCHASE_ORDERS:57]Layer_Code:17; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
					Layer_Fill(->[PURCHASE_ORDERS:57]Layer_Code:17)
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Layer_Code:17)
					
				: ($_l_FieldNumber=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
					RemoveLeadTr(Uppercase:C13([PURCHASE_ORDERS:57]Purchase_Order_Number:2); ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
				: (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
			End case 
		End if 
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS:57]); "Purch Ord In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: ($_t_VariableName="STK_t_DeliveryLocationNAME")
				$_bo_LocationFound:=False:C215
				If (<>DB_bo_NewStockActive)
					ARRAY TEXT:C222(STK_at_PossibleLocations; 0)
					ARRAY TEXT:C222(STK_at_PossibleLocationNames; 0)
					For ($_l_Index; 1; Size of array:C274(STK_at_DeliveryLocCodes))
						If (STK_t_DeliveryLocationNAME=STK_at_DeliveryLocCodes{$_l_Index})
							[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=STK_at_DeliveryLocCodes{$_l_Index}
							STK_at_DeliveryLocationNAME:=STK_at_DeliveryLocNames{$_l_Index}
							ARRAY TEXT:C222(STK_at_PossibleLocations; 0)
							ARRAY TEXT:C222(STK_at_PossibleLocationNames; 0)
							$_l_Index:=Size of array:C274(STK_at_DeliveryLocCodes)
							$_bo_LocationFound:=True:C214
						Else 
							If (STK_t_DeliveryLocationNAME=STK_at_DeliveryLocNames{$_l_Index})
								[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=STK_at_DeliveryLocCodes{$_l_Index}
								STK_at_DeliveryLocationNAME:=STK_at_DeliveryLocNames{$_l_Index}
								ARRAY TEXT:C222(STK_at_PossibleLocations; 0)
								ARRAY TEXT:C222(STK_at_PossibleLocationNames; 0)
								$_l_Index:=Size of array:C274(STK_at_DeliveryLocCodes)
								$_bo_LocationFound:=True:C214
							Else 
								
								If (Position:C15(STK_t_DeliveryLocationNAME; STK_at_DeliveryLocCodes{$_l_Index})>0) | (Position:C15(STK_t_DeliveryLocationNAME; STK_at_DeliveryLocNames{$_l_Index})>0)
									APPEND TO ARRAY:C911(STK_at_PossibleLocations; STK_at_DeliveryLocCodes{$_l_Index})
									APPEND TO ARRAY:C911(STK_at_PossibleLocationNames; STK_at_DeliveryLocNames{$_l_Index})
								End if 
							End if 
						End if 
					End for 
					If (Size of array:C274(STK_at_PossibleLocationNames)>0)
						If (Size of array:C274(STK_at_PossibleLocationNames)=1)
							[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=STK_at_PossibleLocations{1}
							STK_at_DeliveryLocationNAME:=STK_at_PossibleLocationNames{1}
							ARRAY TEXT:C222(STK_at_PossibleLocations; 0)
							ARRAY TEXT:C222(STK_at_PossibleLocationNames; 0)
							
						Else 
							//Ask user
							$_t_WindowTitle:="Select a Location"
							Array_LCx(1)
							QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; STK_at_PossibleLocations)
							SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; GEN_at_Identity; [LOCATIONS:61]Location_Name:2; GEN_at_Name)
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
							OBJECT GET COORDINATES:C663(STK_t_DeliveryLocationNAME; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
							If ($_l_windowTop+$_l_ObjectTop<($_l_WindowBottom-200))
								$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
								WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+$_l_ObjectLeft; $_l_windowTop+$_l_ObjectTop; ($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop); -1986; $_t_WindowTitle; "Close_Cancel")
							Else 
								$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
								WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+$_l_ObjectLeft; $_l_WindowBottom-200; ($_l_WindowLeft+$_l_ObjectLeft); $_l_WindowBottom-200; -1986; $_t_WindowTitle; "Close_Cancel")
							End if 
							DIALOG:C40([COMPANIES:2]; "dRelate List")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Code:1=GEN_at_Identity{GEN_at_Identity})
							[PURCHASE_ORDERS:57]X_DeliveryLocation:9:=GEN_at_Identity{GEN_at_Identity}
							STK_t_DeliveryLocationNAME:=[LOCATIONS:61]Location_Name:2
							ARRAY TEXT:C222(STK_at_PossibleLocations; 0)
							ARRAY TEXT:C222(STK_at_PossibleLocationNames; 0)
							UNLOAD RECORD:C212([LOCATIONS:61])
							
						End if 
					Else 
						If (Not:C34($_bo_LocationFound))
							//[PURCHASE ORDERS]xDeliveryLocation:=""
							STK_t_DeliveryLocationNAME:=""
						End if 
					End if 
				End if 
			: (vTot=1)
				If (PO_bo_AddItem)
					DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
				End if 
				PO_bo_AddItem:=False:C215
				
				QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
				
				[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
				DB_bo_RecordModified:=True:C214
				vTot:=0
			: (PO_t_RelatedRecord#PO_t_RelatedRecordOLD) | ($_t_VariableName="PO_t_relatedRecord")
				//Beep
				//entered an event code(for the moment--may actually be other relations
				
				//Check_MinorNC (->PO_t_relatedRecord;"Event";->[EVENTS];->[EVENTS]Event Code;->[EVENTS]Event Name)
				
				
		End case 
	: ($_l_Event=On Deactivate:K2:10)
End case 
ERR_MethodTrackerReturn("PurchOrd_InLP"; $_t_oldMethodName)
