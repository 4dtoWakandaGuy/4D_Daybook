//%attributes = {}
If (False:C215)
	//Project Method Name:      Currencies_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_abo_CurrencyModified;0)
	//ARRAY BOOLEAN(CUR_lb_Rates;0)
	//ARRAY DATE(CUR_ad_CurrencyDate;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY REAL(WS_SCurrToRate;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; WS_bo_CurrToRateMOD)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_Index; $_l_ModuleRow; CUR_l_BUT1; CUR_l_But2; CUR_l_BUT3; CUR_l_BUT4; CUR_l_BUT5; CUR_l_BUT6; CUR_l_BUT7)
	C_LONGINT:C283(CUR_l_BUT8; CUR_l_BUT9; CUR_l_CurrencyPeriod; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_REAL:C285($1; WS_CurrToRate)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_RateType; BAR_t_Button; CUR_t_COL1; CUR_t_COL2; CUR_t_COL3; CUR_t_COL4; CUR_t_COL5; CUR_t_COL6; CUR_t_COL7)
	C_TEXT:C284(CUR_t_COL8; CUR_t_COL9; CUR_t_HED1; CUR_t_HED2; CUR_t_HED3; CUR_t_HED4; CUR_t_HED5; CUR_t_HED6; CUR_t_HED7; CUR_t_HED8; CUR_t_HED9)
	C_TEXT:C284(DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisCUR; WIN_t_CurrentInputForm; WS_t_CurrToCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currencies_InLP")
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 


Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(2; 425; 520)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[CURRENCIES:71]); "Currency_In")
		OpenHelp(Table:C252(->[CURRENCIES:71]); "Currency_In")
		CCM_ISOCurrencyCodes  //Load the ISO currency codes
		WS_AutoscreenSize(2; 425; 520)
		INT_SetInput(Table:C252(->[CURRENCIES:71]); WIN_t_CurrentInputForm)
		
		If (Records in selection:C76([CURRENCIES:71])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		Currency_inonLoad
		
		LB_SetupListbox(->CUR_lb_Rates; "CUR_t"; "CUR_L"; 1; ->CUR_at_CurrencyToCodes; ->CUR_at_CurrencyToNames; ->CUR_ad_CurrencyDate; ->CUR_ar_CurrencyRates)
		
		LB_SetColumnHeaders(->CUR_lb_Rates; "CUR_L"; 1; "CODE"; "Name"; "From Date"; "Rate")
		
		LB_SetColumnWidths(->CUR_lb_Rates; "CUR_t"; 1; 48; 153; 89; 116)
		
		LB_SetEnterable(->CUR_lb_Rates; False:C215; 0)
		
		
		LB_SetScroll(->CUR_lb_Rates; -3; -2)
		LB_StyleSettings(->CUR_lb_Rates; "Black"; 9; "CUR_t"; ->[ACCOUNTS:32])
		
		vButtDisCUR:="I  PMO  FSSSRCADT"
		Input_Buttons(->[CURRENCIES:71]; ->vButtDisCUR)
		DB_SetInputFormMenu(Table:C252(->[CURRENCIES:71]); "Currency_In")
		If (Records in selection:C76([CURRENCIES:71])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisCUR)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CURRENCIES:71]); "Currency_In")
		OpenHelp(Table:C252(->[CURRENCIES:71]); "Currency_In")
		
		In_ButtChkDis(->vButtDisCUR)
		
		If (Records in selection:C76([CURRENCIES:71])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[CURRENCIES:71]); "Currency_In")
		In_ButtChkDis(->vButtDisCUR)
		If (Records in selection:C76([CURRENCIES:71])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
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
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK"))
				For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyToCodes))
					READ WRITE:C146([CURRENCY_RATES:72])
					If (CUR_abo_CurrencyModified{$_l_Index}=True:C214)
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=CUR_at_CurrencyToCodes{$_l_Index})
						ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
						$_t_RateType:=[CURRENCY_RATES:72]Rate_Type:5
						CREATE RECORD:C68([CURRENCY_RATES:72])
						[CURRENCY_RATES:72]Currency_From:1:=[CURRENCIES:71]Currency_Code:1
						[CURRENCY_RATES:72]Currency_To:2:=CUR_at_CurrencyToCodes{$_l_Index}
						[CURRENCY_RATES:72]Rate:3:=CUR_ar_CurrencyRates{$_l_Index}
						[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
						[CURRENCY_RATES:72]Rate_Type:5:=$_t_RateType
						[CURRENCY_RATES:72]x_PeriodID:7:=CUR_l_CurrencyPeriod
						DB_SaveRecord(->[CURRENCY_RATES:72])
						AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
						//now do the inverse
						Gen_Confirm("Save From "+CUR_at_CurrencyToCodes{$_l_Index}+" to "+[CURRENCIES:71]Currency_Code:1+" as well?"; "Yes"; "No")
						If (OK=1)
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=CUR_at_CurrencyToCodes{$_l_Index}; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=[CURRENCIES:71]Currency_Code:1)
							ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
							$_t_RateType:=[CURRENCY_RATES:72]Rate_Type:5
							CREATE RECORD:C68([CURRENCY_RATES:72])
							[CURRENCY_RATES:72]Currency_From:1:=CUR_at_CurrencyToCodes{$_l_Index}
							[CURRENCY_RATES:72]Currency_To:2:=[CURRENCIES:71]Currency_Code:1
							[CURRENCY_RATES:72]Rate:3:=(100/CUR_ar_CurrencyRates{$_l_Index})/100
							[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
							[CURRENCY_RATES:72]x_PeriodID:7:=CUR_l_CurrencyPeriod
							[CURRENCY_RATES:72]Rate_Type:5:=$_t_RateType
							DB_SaveRecord(->[CURRENCY_RATES:72])
							AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
						End if 
					End if 
					UNLOAD RECORD:C212([CURRENCY_RATES:72])
					READ ONLY:C145([CURRENCY_RATES:72])
				End for 
				
		End case 
		
		In_ButtCall(""; ""; "Minor_Del"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; "Currencies"; "1"; "Currency_inonLoad"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisCUR)
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([CURRENCIES:71]Currency_Code:1))
				RemoveLeadTr([CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Code:1)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CURRENCIES:71]Currency_Code:1)
			: (Modified:C32([CURRENCIES:71]Currency_Name:2))
				[CURRENCIES:71]Currency_Name:2:=Uppers2([CURRENCIES:71]Currency_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CURRENCIES:71]Currency_Name:2)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CURRENCIES:71]); "Currency_In")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Currencies_InLP"; $_t_oldMethodName)