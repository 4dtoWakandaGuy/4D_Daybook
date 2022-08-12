//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:35 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; vButtDisCRT; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRates_InLP")
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(2; 200; 540)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WS_AutoscreenSize(2; 200; 540)
		OpenHelp(Table:C252(->[CURRENCY_RATES:72]); "Rates_in")
		CurrRates_InLPB
		INT_SetInput(Table:C252(->[CURRENCY_RATES:72]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisCRT)
		SD2_SetDiaryPopup
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[CURRENCY_RATES:72]); "Rates_in")
		
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; "Minor_DelSin"; ->[CURRENCY_RATES:72]; ->[CURRENCY_RATES:72]Currency_From:1; "Currency Rates"; "1 2 3 4"; "CurrRates_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisCRT)
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([CURRENCY_RATES:72]Currency_From:1))
				Check_MinorNC(->[CURRENCY_RATES:72]Currency_From:1; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				Macro_AccTypePt(->[CURRENCY_RATES:72]Currency_From:1)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CURRENCY_RATES:72]Currency_To:2))
				Check_MinorNC(->[CURRENCY_RATES:72]Currency_To:2; "Layer"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2; "Currency")
				Macro_AccTypePt(->[CURRENCY_RATES:72]Currency_To:2)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CURRENCY_RATES:72]Date:4))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CURRENCY_RATES:72]Date:4)
			: (Modified:C32([CURRENCY_RATES:72]Rate:3))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CURRENCY_RATES:72]Rate:3)
			: (Modified:C32([CURRENCY_RATES:72]Rate_Type:5))
				Check_Lists(->[CURRENCY_RATES:72]Rate_Type:5; "Rate Types")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CURRENCY_RATES:72]Rate_Type:5)
		End case 
	: ($_l_Event=On Activate:K2:9)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("CurrRates_InLP"; $_t_oldMethodName)