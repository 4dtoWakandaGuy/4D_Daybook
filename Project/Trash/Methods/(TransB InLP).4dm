//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      TransB InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchItemCreditID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDebitID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY TEXT(ACC_at_AnalysisNames;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditIO;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitIO;0)
	//ARRAY TEXT(ACC_at_BatchItemDescription;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode;0)
	//ARRAY TEXT(ACC_at_BatchItemlayerCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchinvno;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxCode;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxUKEC;0)
	//ARRAY TEXT(ACC_at_BatchItemTransTypeCode;0)
	//ARRAY TEXT(ACC_at_CompanyNames;0)
	//ARRAY TEXT(ACC_at_CreditAccountNames;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME;0)
	//ARRAY TEXT(ACC_at_DebitAccountNames;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_BOOLEAN:C305(<>ItementryOpen; $_bo_Ignore; $_bo_IsNew; $_bo_ProcessVisible; BAT_bo_UseAreaList; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_DATE:C307(ACC_D_TransDate)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CurrentRealLine; $_l_Event; $_l_FirstRealLine; $_l_ModuleRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProcessOrigin; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_SizeofArray; $_l_UniqueProcessID; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $1; ACC_l_BatchItemID; ACC_l_DisplayedItemNumber; ACC_l_ItemEntryProcess)
	C_LONGINT:C283(ACC_l_ItemViewContext; ACC_l_MaxItemNumber; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; MOD_l_CurrentModuleAccess; ModuleNumber)
	C_LONGINT:C283(PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal; vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_processName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName; ACC_t_LayerName; ACC_t_TransChequeNo)
	C_TEXT:C284(ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode)
	C_TEXT:C284(ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTransCode; ACC_t_UKEC; BAR_t_Button; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(IP_t_MessageReplySTR; PAL_BUTTON; SYS_t_AccessType; vButtDisTRNB; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB InLP")

//$_t_oldMethodName:=ERR_MethodTracker ("TransB InLP")
//TransB InLP - see also TransB InLPJ


If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 



Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		TransB_InLPB
		
		
		OpenHelp(Table:C252(->[TRANSACTION_BATCHES:30]); "TransB In13")
		
		WS_AutoscreenSize(1; 560; 2000; Table name:C256(->[TRANSACTION_BATCHES:30])+"_"+"TransB In13")
		
		INT_SetInput(Table:C252(->[TRANSACTION_BATCHES:30]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisTRNB)
		
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_BATCHES:30]); "TransB In13")
		If (Records in selection:C76([TRANSACTION_BATCHES:30])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_BATCHES:30]); "TransB In13")
		OpenHelp(Table:C252(->[TRANSACTION_BATCHES:30]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisTRNB)
		
		SD2_SetDiaryPopup
		If (DB_l_ButtonClickedFunction=0)
			If (ACC_l_ItemEntryProcess>0)
				BRING TO FRONT:C326(ACC_l_ItemEntryProcess)
			End if 
		End if 
		If ([TRANSACTION_BATCHES:30]State:15>0)
			DB_MenuAction("Functions"; "Copy Previous Batch"; 3; "")
			DB_MenuAction("Functions"; "Update Single-Sided Total"; 3; "")
			//DISABLE MENU ITEM(2049;3)
			// DISABLE MENU ITEM(2049;5)
		Else 
			DB_MenuAction("Functions"; "Copy Previous Batch"; 2; "")
			DB_MenuAction("Functions"; "Update Single-Sided Total"; 2; "")
			
		End if 
		If (Records in selection:C76([TRANSACTION_BATCHES:30])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (ACC_l_ItemEntryProcess>0)
			POST OUTSIDE CALL:C329(ACC_l_ItemEntryProcess)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTION_TYPES:31]); "TransT In13")
		In_ButtChkDis(->vButtDisTRNB)
		SD2_SetDiaryPopup
		If (Records in selection:C76([TRANSACTION_TYPES:31])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Outside Call:K2:11)  //& (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		//TRACE
		
		//DB_l_ButtonClickedFunction:=0
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
				
				
				
				inButtSubHandle(FORM Get current page:C276; ->[TRANSACTION_BATCHES:30])
				
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("GetRecordCode"))
				IP_t_MessageReplySTR:=String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=""
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				IP_t_MessageReplySTR:=""
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				
				IP_t_MessageReplySTR:=""
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveDragged"))
				
				
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("AddBatchItem"))  //²
				//Receive batch item
				ACC_BatchAddSubItem(True:C214)
				
				DB_l_ButtonClickedFunction:=0
				TransB_InLPTot(BAT_bo_UseAreaList)
				
				If (DB_GetLedgerRecalcSingleSide)
					TransB_InCalc(BAT_bo_UseAreaList)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("GetNextBatchItem"))  //²
				//Get next/previous item
				If (ACC_l_DisplayedItemNumber>0) & (ACC_l_DisplayedItemNumber<=(Size of array:C274(ACC_ar_BatchItemAmounts)))  //this is the item to get
					$_l_FirstRealLine:=ACC_l_DisplayedItemNumber
					//now load the variables and pass them to the sub process
					ACC_R_TransAmount:=ACC_ar_BatchItemAmounts{$_l_FirstRealLine}
					ACC_t_BatchItemAnalysisCode:=ACC_at_BatchItemAnalysisCode{$_l_FirstRealLine}
					ACC_l_TransBatchItemID:=ACC_al_BatchItemID{$_l_FirstRealLine}  //note this is set from this array
					ACC_t_TransChequeNo:=ACC_at_BatchItemChequeNo{$_l_FirstRealLine}
					ACC_t_TransCoCode:=ACC_at_BatchItemCoCode{$_l_FirstRealLine}
					ACC_t_TransCreditAcc:=ACC_at_BatchItemCreditAcc{$_l_FirstRealLine}
					ACC_t_TransCreditIO:=ACC_at_BatchItemCreditIO{$_l_FirstRealLine}
					ACC_l_TransCreditID:=ACC_al_BatchItemCreditID{$_l_FirstRealLine}
					ACC_t_TransCurrencyCode:=ACC_at_BatchItemCurrencyCode{$_l_FirstRealLine}
					ACC_t_TransDebitAcc:=ACC_at_BatchItemDebitAcc{$_l_FirstRealLine}
					ACC_t_TransDebitIO:=ACC_at_BatchItemDebitIO{$_l_FirstRealLine}
					ACC_l_TransDebitID:=ACC_al_BatchItemDebitID{$_l_FirstRealLine}
					ACC_T_TransDescription:=ACC_at_BatchItemDescription{$_l_FirstRealLine}
					
					ACC_t_TransInvoiceNo:=ACC_at_BatchItemInvoiceNo{$_l_FirstRealLine}
					ACC_t_TransJobCode:=ACC_at_BatchItemJobCode{$_l_FirstRealLine}
					ACC_t_TransLayerCode:=ACC_at_BatchItemlayerCode{$_l_FirstRealLine}
					ACC_t_TransPeriodCode:=ACC_at_BatchItemPeriodCode{$_l_FirstRealLine}
					ACC_t_TransPurchinvno:=ACC_at_BatchItemPurchinvno{$_l_FirstRealLine}
					ACC_t_TransPurchCode:=ACC_at_BatchItemPurchCode{$_l_FirstRealLine}
					ACC_R_TransSecondAmt:=ACC_ar_BatchItemSecondAmt{$_l_FirstRealLine}
					ACC_R_TransTaxAmt:=ACC_ar_BatchItemTaxAmt{$_l_FirstRealLine}
					ACC_t_TransTaxCode:=ACC_at_BatchItemTaxCode{$_l_FirstRealLine}
					ACC_R_TransTotal:=ACC_ar_BatchItemTotal{$_l_FirstRealLine}
					ACC_t_TransTransCode:=ACC_at_BatchItemTransTypeCode{$_l_FirstRealLine}
					ACC_D_TransDate:=ACC_ad_BatchItemTransDate{$_l_FirstRealLine}
					ACC_t_UKEC:=ACC_at_BatchItemTaxUKEC{$_l_FirstRealLine}
					ACC_t_CompanyName:=ACC_at_CompanyNames{$_l_FirstRealLine}  //²
					ACC_t_AnalysisNames:=ACC_at_AnalysisNames{$_l_FirstRealLine}  //²
					ACC_t_LayerName:=ACC_at_LayerNames{$_l_FirstRealLine}
					If (ACC_l_ItemEntryProcess>0)
						PROCESS PROPERTIES:C336(ACC_l_ItemEntryProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
						If ($_l_ProcessState<0) | ($_t_processName#("ItemEntry"+(String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))))
							ACC_l_ItemEntryProcess:=0
						End if 
					End if 
					If (ACC_l_ItemEntryProcess=0)
						//we dont need to test the state of it because it will have been sent already
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						//GET OBJECT RECT(ACC_l_SubItems;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
						OBJECT GET COORDINATES:C663(ACC_LB_SubItems; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						$_l_ObjectTop:=$_l_ObjectTop+50
						<>ItementryOpen:=False:C215
						ACC_l_ItemEntryProcess:=New process:C317("ACC_BatchItemEntry"; 64000; "ItemEntry"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10); Current process:C322; [TRANSACTION_BATCHES:30]Batch_Number:10; 1; [TRANSACTION_BATCHES:30]State:15; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; MOD_l_CurrentModuleAccess; [TRANSACTION_BATCHES:30]Batch_Date:1; SYS_t_AccessType; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectTop)
						Repeat 
							DelayTicks(2)
						Until (<>ItementryOpen)
					End if 
					//it is running now
					While (Semaphore:C143("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)))
						DelayTicks
					End while 
					If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
						SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 3)
					Else 
						SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 2)
					End if 
					
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransAmount; ACC_R_TransAmount)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; ACC_l_TransBatchItemID)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransChequeNo; ACC_t_TransChequeNo)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCoCode; ACC_t_TransCoCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; ACC_t_TransCreditAcc)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditIO; ACC_t_TransCreditIO)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransCreditID; ACC_l_TransCreditID)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; ACC_t_TransDebitAcc)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitIO; ACC_t_TransDebitIO)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransDebitID; ACC_l_TransDebitID)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_T_TransDescription; ACC_T_TransDescription)
					
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransInvoiceNo; ACC_t_TransInvoiceNo)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransJobCode; ACC_t_TransJobCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransLayerCode; ACC_t_TransLayerCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; ACC_t_TransPeriodCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchinvno; ACC_t_TransPurchinvno)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchCode; ACC_t_TransPurchCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransSecondAmt; ACC_R_TransSecondAmt)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTaxAmt; ACC_R_TransTaxAmt)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTaxCode; ACC_t_TransTaxCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTotal; ACC_R_TransTotal)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTransCode; ACC_t_TransTransCode)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_D_TransDate; ACC_D_TransDate)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_UKEC; ACC_t_UKEC)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CURRENCYNAME; ACC_t_CURRENCYNAME)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_DebitAccountName; ACC_t_DebitAccountName)  //²
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CreditAccountName; ACC_t_CreditAccountName)  //²
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CompanyName; ACC_t_CompanyName)  //²
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_AnalysisNames; ACC_t_AnalysisNames)  //²
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_LayerName; ACC_t_LayerName)  //)²
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_BatchItemID; ACC_l_BatchItemID)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_DisplayedItemNumber; $_l_FirstRealLine)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_MaxItemNumber; Size of array:C274(ACC_ar_BatchItemAmounts))
					
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReceiveBatchItem"))
					
					POST OUTSIDE CALL:C329(ACC_l_ItemEntryProcess)
					
					CLEAR SEMAPHORE:C144("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
					
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("DeleteBatchItem"))  //²
				//DELETE CURRENTLY DISPLAYED ITEM
				GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_DisplayedItemNumber; $_l_CurrentRealLine)
				If ($_l_CurrentRealLine>0)
					$_bo_IsNew:=(ACC_al_BatchItemID{$_l_CurrentRealLine}=0)
					If ($_bo_IsNew)  //IT is not a saved item so no need to delete just remove the array items
					Else 
						//it is a real item-put in the deletion array
						INSERT IN ARRAY:C227(ACC_al_BatchItemDelete; Size of array:C274(ACC_al_BatchItemDelete)+1; 1)
						ACC_al_BatchItemDelete{Size of array:C274(ACC_al_BatchItemDelete)}:=ACC_al_BatchItemID{$_l_CurrentRealLine}
					End if 
					DELETE FROM ARRAY:C228(ACC_ar_BatchItemAmounts; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemAnalysisCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_al_BatchItemID; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemChequeNo; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemCoCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemCreditAcc; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemCreditIO; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_al_BatchItemCreditID; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemCurrencyCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemDebitAcc; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemDebitIO; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_al_BatchItemDebitID; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemDescription; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemInvoiceNo; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemJobCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemlayerCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemPeriodCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemPurchinvno; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemPurchCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_ar_BatchItemSecondAmt; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_ar_BatchItemTaxAmt; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemTaxCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_ar_BatchItemTotal; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemTransTypeCode; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_ad_BatchItemTransDate; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_BatchItemTaxUKEC; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_CURRENCYNAME; $_l_CurrentRealLine)
					DELETE FROM ARRAY:C228(ACC_at_DebitAccountNames; $_l_CurrentRealLine)  //²
					DELETE FROM ARRAY:C228(ACC_at_CreditAccountNames; $_l_CurrentRealLine)  //²
					DELETE FROM ARRAY:C228(ACC_at_CompanyNames; $_l_CurrentRealLine)  //²
					DELETE FROM ARRAY:C228(ACC_at_AnalysisNames; $_l_CurrentRealLine)  //²
					DELETE FROM ARRAY:C228(ACC_at_LayerNames; $_l_CurrentRealLine)  //)²
					DELETE FROM ARRAY:C228(ACC_al_BatchItemID; $_l_CurrentRealLine)
					$_l_SizeofArray:=Size of array:C274(ACC_at_LayerNames)
					ACC_TransSetDisplay("Trans_SetDisplay"; $_l_SizeofArray)
				End if 
				TransB_InLPTot(BAT_bo_UseAreaList)
				
				If (DB_GetLedgerRecalcSingleSide)
					TransB_InCalc(BAT_bo_UseAreaList)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				$_bo_Ignore:=False:C215
				If (iOK=1) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) & (ACC_l_ItemEntryProcess>0)
					$_l_ProcessState:=Process state:C330(ACC_l_ItemEntryProcess)
					If ($_l_ProcessState>0)
						//Send the call to that window
						$_bo_Ignore:=True:C214
						
						DB_l_ButtonClickedFunction:=0
					End if 
				End if 
				If (Not:C34($_bo_Ignore))
					
					BRING TO FRONT:C326(Current process:C322)
					In_ButtCall("R:TransB_InLPA:D:TransB_InLPCan"; ""; ""; ->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Batch_Number:10; "TransB"; "1"; "TransB_InLPB"; "Master"; "TransB_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisTRNB)
				End if 
				
				
		End case 
		
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[TRANSACTION_BATCHES:30]); "TransB In13")
					
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_Event=On Data Change:K2:15)
		
		Case of 
			: (vTot=1)
				vTot:=0
				TransB_InLPTot(BAT_bo_UseAreaList)
				If (vTot2=1)
					vTot2:=0
					If (DB_GetLedgerRecalcSingleSide)
						TransB_InCalc(BAT_bo_UseAreaList)
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TRANSACTION_BATCHES:30]Batch_Date:1))
				Check_SecTrB(->[TRANSACTION_BATCHES:30]Batch_Date:1)
				Macro_AccTypePt(->[TRANSACTION_BATCHES:30]Batch_Date:1)
			: (Modified:C32([TRANSACTION_BATCHES:30]Control_Amount:7))
				Check_SecTrB(->[TRANSACTION_BATCHES:30]Control_Amount:7)
				Macro_AccTypePt(->[TRANSACTION_BATCHES:30]Control_Amount:7)
			: (Modified:C32([TRANSACTION_BATCHES:30]Control_Tax:8))
				Check_SecTrB(->[TRANSACTION_BATCHES:30]Control_Tax:8)
				Macro_AccTypePt(->[TRANSACTION_BATCHES:30]Control_Tax:8)
			: (Modified:C32([TRANSACTION_BATCHES:30]Control_Total:9))
				Check_SecTrB(->[TRANSACTION_BATCHES:30]Control_Total:9)
				Macro_AccTypePt(->[TRANSACTION_BATCHES:30]Control_Total:9)
				//    : (Modified([TRANS IN]Reverse))
				//    Check_SecTrB (»[TRANS IN]Reverse)
				// : (Modified([TRANS IN]Desc))
				//   Check_SecTrB (»[TRANS IN]Desc)
		End case 
		If (ACC_l_ItemEntryProcess>0)
			BRING TO FRONT:C326(ACC_l_ItemEntryProcess)
		End if 
		
	: ($_l_Event=On Deactivate:K2:10)
		
		// PAUSE PROCESS(vProc)
End case 
//ERR_MethodTrackerReturn ("TransB InLP";$_t_oldMethodName)
