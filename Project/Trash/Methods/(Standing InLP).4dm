//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/10/2010 14:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8)
	C_LONGINT:C283(PAL_BUTTON_9)
	C_REAL:C285($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PalletButtonName; $Man; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisSJ; vCompany; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing InLP")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(2; 490; 590)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[RECURRING_JOURNALS:38]); WIN_t_CurrentInputForm)
		Standing_InLPB
		WS_AutoscreenSize(2; 420; 590)
		INT_SetInput(Table:C252(->[RECURRING_JOURNALS:38]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisSJ)
		
		DB_SetInputFormMenu(Table:C252(->[RECURRING_JOURNALS:38]); "Standing In13")
		If (Records in selection:C76([RECURRING_JOURNALS:38])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[RECURRING_JOURNALS:38]); "Standing In13")
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisSJ)
		SD2_SetDiaryPopup
		If (Records in selection:C76([RECURRING_JOURNALS:38])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[RECURRING_JOURNALS:38]); "Standing In13")
		In_ButtChkDis(->vButtDisSJ)
		SD2_SetDiaryPopup
		If (Records in selection:C76([RECURRING_JOURNALS:38])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		If ([RECURRING_JOURNALS:38]Copy_Batch:13=0)
			$Man:="2 6"
		Else 
			$Man:=""
		End if 
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
			Else 
				
				In_ButtCall("R:Standing_InLPA"; ""; "Minor_Del"; ->[RECURRING_JOURNALS:38]; ->[RECURRING_JOURNALS:38]Transaction_Type_Code:2; "Standing"; $Man; "Standing_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisSJ)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([RECURRING_JOURNALS:38]Company_Code:1))
				Check_CompanyNC(->[RECURRING_JOURNALS:38]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[RECURRING_JOURNALS:38])
				vCompany:=[COMPANIES:2]Company_Name:2
				//DEFAULT TABLE([REC JOURNALS])
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Company_Code:1)
			: (Modified:C32([RECURRING_JOURNALS:38]Transaction_Type_Code:2))
				Check_MinorNC(->[RECURRING_JOURNALS:38]Transaction_Type_Code:2; "Type"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Transaction_Type_Code:2)
			: (Modified:C32([RECURRING_JOURNALS:38]Invoice_Number:9))
				Check_MinorNC(->[RECURRING_JOURNALS:38]Invoice_Number:9; "Invoice"; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2)
				If ([RECURRING_JOURNALS:38]Invoice_Number:9#"")
					If (([RECURRING_JOURNALS:38]Company_Code:1="") | ([RECURRING_JOURNALS:38]Company_Code:1#[INVOICES:39]Company_Code:2))
						[RECURRING_JOURNALS:38]Company_Code:1:=[INVOICES:39]Company_Code:2
						RELATE ONE:C42([RECURRING_JOURNALS:38]Company_Code:1)
						vCompany:=[COMPANIES:2]Company_Name:2
					End if 
					[RECURRING_JOURNALS:38]Currency_Code:11:=[INVOICES:39]Currency_Code:27
					Gen_Alert("NB: Invoice "+[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4+" has "+[INVOICES:39]Currency_Code:27+String:C10([INVOICES:39]Total_Due:7; "|Accounts")+" outstanding"; "")
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Invoice_Number:9)
			: (Modified:C32([RECURRING_JOURNALS:38]Purchase_Invoice_Number:10))
				Check_MinorNC(->[RECURRING_JOURNALS:38]Purchase_Invoice_Number:10; "Invoice"; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2)
				If ([RECURRING_JOURNALS:38]Purchase_Invoice_Number:10#"")
					If (([RECURRING_JOURNALS:38]Company_Code:1="") | ([RECURRING_JOURNALS:38]Company_Code:1#[PURCHASE_INVOICES:37]Company_Code:2))
						[RECURRING_JOURNALS:38]Company_Code:1:=[PURCHASE_INVOICES:37]Company_Code:2
						RELATE ONE:C42([RECURRING_JOURNALS:38]Company_Code:1)
						vCompany:=[COMPANIES:2]Company_Name:2
					End if 
					Gen_Alert("NB: Purchase "+[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17+" has "+<>SYS_t_BaseCurrency+String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")+" outstanding"; "")
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Purchase_Invoice_Number:10)
			: (Modified:C32([RECURRING_JOURNALS:38]Date_Started:3))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Date_Started:3)
			: (Modified:C32([RECURRING_JOURNALS:38]Analysis_Code:4))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Analysis_Code:4)
			: (Modified:C32([RECURRING_JOURNALS:38]Description:5))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Description:5)
			: (Modified:C32([RECURRING_JOURNALS:38]Amount:6))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Amount:6)
			: (Modified:C32([RECURRING_JOURNALS:38]Monthly:8))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Monthly:8)
			: (Modified:C32([RECURRING_JOURNALS:38]Currency_Code:11))
				Check_MinorNC(->[RECURRING_JOURNALS:38]Currency_Code:11; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[RECURRING_JOURNALS:38]Currency_Code:11)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[RECURRING_JOURNALS:38]); "Standing In13")
					
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
ERR_MethodTrackerReturn("Standing InLP"; $_t_oldMethodName)