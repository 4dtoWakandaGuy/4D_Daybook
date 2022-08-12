If (False:C215)
	//object Name: [CURRENCIES]Currency_In.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 10:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_abo_CurrencyModified;0)
	//ARRAY DATE(CUR_ad_CurrencyDate;0)
	//ARRAY DATE(CUR_ad_CurrencyPeriodFrom;0)
	//ARRAY LONGINT(CUR_al_CurrencyPeriodIDS;0)
	//ARRAY LONGINT(Cur_al_CurrencyRecIDs;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(WS_al_CurrencyIDs;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(WS_at_CurrencyCodes;0)
	//ARRAY TEXT(WS_at_CurrencyNames;0)
	C_BOOLEAN:C305($_bo_MultiRate; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrencyRow; $_l_CurrentWinRefOLD; CUR_l_CurrencyPeriod; MOD_l_CurrentModuleAccess; vProcaMod; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($_r_NewCurrencyRate)
	C_TEXT:C284($_t_oldMethodName; DB_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENCIES].Currency_In.Variable5"; Form event code:C388)
vProcaMod:=22
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
If (MOD_l_CurrentModuleAccess#3)
	//here we show a pop-up
	//of the currencies
	//and allow the user to select a currency to put a new rate in for
	//if this is a currency for which no currenct rate exists
	//then the start date will be the beginning of the period
	//if it is one that already exists, check they want
	//a second rate and start it from today(let them change the dates)
	ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
	COPY ARRAY:C226(WS_at_CurrencyNames; GEN_at_DropDownMenu)
	ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(GEN_at_DropDownMenu))
	COPY ARRAY:C226(WS_al_CurrencyIDs; GEN_al_DropDownMenuID)
	DB_t_WindowTitle:="Select Currency for rate to"
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
	GEN_Bo_ShowCreate:=False:C215
	
	DIALOG:C40([USER:15]; "Gen_PopUpChoice")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (GEN_at_DropDownMenu>0)
		//a currency was selected
		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; WS_at_CurrencyCodes{GEN_at_DropDownMenu})
		If ($_l_CurrencyRow>0)
			//change this to allow/dissalow multiple rates!??:)
			$_bo_MultiRate:=True:C214
			If ($_bo_MultiRate)
				Gen_Confirm("Are sure you wish to enter another rate for "+WS_at_CurrencyNames{GEN_at_DropDownMenu}+" for this period."; "No"; "Yes")
				If (OK=0)
					// a second rate is wanted
					$_r_NewCurrencyRate:=Num:C11(Request:C163("Enter New Rate"; String:C10(CUR_ar_CurrencyRates{$_l_CurrencyRow})))
					If ($_r_NewCurrencyRate>0) & (OK=1)
						APPEND TO ARRAY:C911(CUR_at_CurrencyToCodes; WS_at_CurrencyCodes{GEN_at_DropDownMenu})
						APPEND TO ARRAY:C911(CUR_at_CurrencyToNames; WS_at_CurrencyNames{GEN_at_DropDownMenu})
						APPEND TO ARRAY:C911(CUR_abo_CurrencyModified; True:C214)
						APPEND TO ARRAY:C911(Cur_al_CurrencyRecIDs; -(AA_GetNextIDinMethod(->[CURRENCY_RATES:72]X_ID:6)))
						APPEND TO ARRAY:C911(CUR_ar_CurrencyRates; $_r_NewCurrencyRate)
						APPEND TO ARRAY:C911(CUR_ad_CurrencyDate; Current date:C33(*))
					End if 
				End if 
				
			Else 
				Gen_Alert("Sorry, you cannot set multiple rates for a single period!")
			End if 
			
		Else 
			//no current rates for this
			$_r_NewCurrencyRate:=Num:C11(Request:C163("Enter New Rate"; "0.00"))
			If ($_r_NewCurrencyRate>0) & (OK=1)
				APPEND TO ARRAY:C911(CUR_at_CurrencyToCodes; WS_at_CurrencyCodes{GEN_at_DropDownMenu})
				APPEND TO ARRAY:C911(CUR_ar_CurrencyRates; $_r_NewCurrencyRate)
				APPEND TO ARRAY:C911(CUR_ad_CurrencyDate; CUR_ad_CurrencyPeriodFrom{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)})
				APPEND TO ARRAY:C911(Cur_al_CurrencyRecIDs; -(AA_GetNextIDinMethod(->[CURRENCY_RATES:72]X_ID:6)))
				APPEND TO ARRAY:C911(CUR_at_CurrencyToNames; WS_at_CurrencyNames{GEN_at_DropDownMenu})
				APPEND TO ARRAY:C911(CUR_abo_CurrencyModified; True:C214)
			End if 
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ:Currency_In,bPlus"; $_t_oldMethodName)
