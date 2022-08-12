If (False:C215)
	//Table Form Method Name: [USER]CUR_ConversionRates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2012 07:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_lb_ConversionRates;0)
	//ARRAY DATE(CUR_ad_CurrencyDate;0)
	//ARRAY DATE(CUR_ad_CurrencyPeriodDateTo;0)
	//ARRAY DATE(CUR_ad_CurrencyPeriodFrom;0)
	//ARRAY LONGINT(CUR_al_CurrencyIDs;0)
	//ARRAY LONGINT(CUR_al_CurrencyPeriodIDS;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_CurrencyPeriods;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	C_BOOLEAN:C305(CUR_bo_CurrencyModify; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; CUR_l_BUT1; CUR_l_But2; CUR_l_BUT3; CUR_l_BUT4; CUR_l_BUT5; CUR_l_BUT6; CUR_l_BUT7; CUR_l_BUT8)
	C_LONGINT:C283(CUR_l_BUT9; CUR_l_SelectedCurrencyCode; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; CUR_S5_CurrencyCode2; CUR_t_COL1; CUR_t_COL2; CUR_t_COL3; CUR_t_COL4; CUR_t_COL5; CUR_t_COL6; CUR_t_COL7)
	C_TEXT:C284(CUR_t_COL8; CUR_t_COL9; CUR_t_CurrencyName2; CUR_t_HED1; CUR_t_HED2; CUR_t_HED3; CUR_t_HED4; CUR_t_HED5; CUR_t_HED6; CUR_t_HED7; CUR_t_HED8)
	C_TEXT:C284(CUR_t_HED9; PAL_BUTTON; vButtDisConv)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CUR_ConversionRates"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[USER:15]); "CUR_ConversionRates")
		WS_AutoscreenSize(2; 384; 651)
		
		ARRAY TEXT:C222(CUR_at_CurrencyNames; 0)
		ARRAY LONGINT:C221(CUR_al_CurrencyIDs; 0)
		ARRAY TEXT:C222(CUR_at_CurrencyCodes; 0)
		
		CUR_CheckUpdate
		
		CUR_l_SelectedCurrencyCode:=0
		CUR_bo_CurrencyModify:=False:C215
		READ WRITE:C146([CURRENCIES:71])
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=0)
		DB_lockFile(->[CURRENCIES:71])
		APPLY TO SELECTION:C70([CURRENCIES:71]; [CURRENCIES:71]X_ID:3:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENCIES:71]))
		UNLOAD RECORD:C212([CURRENCIES:71])
		READ WRITE:C146([PERIODS:33])
		QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
		DB_lockFile(->[PERIODS:33])
		APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]x_ID:10:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
		UNLOAD RECORD:C212([PERIODS:33])
		
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Name:2; CUR_at_CurrencyNames; [CURRENCIES:71]X_ID:3; CUR_al_CurrencyIDs; [CURRENCIES:71]Currency_Code:1; CUR_at_CurrencyCodes)
		ALL RECORDS:C47([PERIODS:33])
		ARRAY TEXT:C222(CUR_at_CurrencyPeriods; 0)
		ARRAY LONGINT:C221(CUR_al_CurrencyPeriodIDS; 0)
		SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; CUR_at_CurrencyPeriods; [PERIODS:33]x_ID:10; CUR_al_CurrencyPeriodIDS; [PERIODS:33]From_Date:3; CUR_ad_CurrencyPeriodFrom; [PERIODS:33]To_Date:4; CUR_ad_CurrencyPeriodDateTo)
		SORT ARRAY:C229(CUR_at_CurrencyPeriods; CUR_al_CurrencyPeriodIDS; CUR_ad_CurrencyPeriodFrom; CUR_ad_CurrencyPeriodDateTo; <)
		CUR_LoadConversions(CUR_l_SelectedCurrencyCode)
		
		INT_SetDialog
		vButtDisConv:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisConv)
		In_ButtChkDis(->vButtDisConv)
		DB_AppendInputMenu(9)
		//CUR_lb_ConversionRates
		
		LB_SetupListbox(->CUR_lb_ConversionRates; "CUR_t"; "CUR_L"; 1; ->CUR_at_CurrencyToCodes; ->CUR_at_CurrencyToNames; ->CUR_ad_CurrencyDate; ->CUR_ar_CurrencyRates)
		
		LB_SetColumnHeaders(->CUR_lb_ConversionRates; "CUR_L"; 1; "To Currency"; ""; "Date"; "Rate")
		
		LB_SetColumnWidths(->CUR_lb_ConversionRates; "CUR_t"; 1; 49; 154; 90; 117)
		LB_SetScroll(->CUR_lb_ConversionRates; -3; -2)
		LB_StyleSettings(->CUR_lb_ConversionRates; "Black"; 9; "CUR_t"; ->[ACCOUNTS:32])
		LB_SetEnterable(->CUR_lb_ConversionRates; False:C215; 0)
	: ($_l_event=On Activate:K2:9)
		In_ButtChkDis(->vButtDisConv)
	: ($_l_event=On Outside Call:K2:11)
		If (DB_l_ButtonClickedFunction#0) | (iOK=1) | (iCancel=1)
			
			Case of 
				: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1))
					//save and exit
					CUR_SaveExisting(CUR_l_SelectedCurrencyCode)
					CANCEL:C270
					
				: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (iCancel=1))
					//no save just exit
					CANCEL:C270
			End case 
			
		End if 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_AppendInputMenu(9)
					
				End if 
				BAR_t_Button:=""
				
			Else 
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:CUR_ConversionRates"; $_t_oldMethodName)
