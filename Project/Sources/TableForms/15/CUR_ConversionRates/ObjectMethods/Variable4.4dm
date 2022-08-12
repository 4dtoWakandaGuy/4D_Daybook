If (False:C215)
	//object Name: [USER]CUR_ConversionRates.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:28
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
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_CurrencyPeriods;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	C_BOOLEAN:C305($_bo_Update)
	C_DATE:C307(CUR_D_CurrencyMaxDate)
	C_LONGINT:C283($_l_CurrencyRow; $_l_Index; CUR_l_CurrencyPeriod)
	C_TEXT:C284($_t_oldMethodName; CUR_t_CurrencyPeriod)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CUR_ConversionRates.Variable4"; Form event code:C388)

If ([CURRENCIES:71]X_ID:3#0)
	If (CUR_at_CurrencyPeriods>0)
		CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
		If (CUR_ad_CurrencyPeriodFrom{CUR_at_CurrencyPeriods}<CUR_D_CurrencyMaxDate)
			CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{CUR_at_CurrencyPeriods}
			CUR_l_CurrencyPeriod:=CUR_al_CurrencyPeriodIDS{CUR_at_CurrencyPeriods}
			QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
			ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
			SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
			ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
			For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
				$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
				CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
			End for 
			$_bo_Update:=False:C215
			For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
				If (CUR_at_CurrencyCodes{$_l_Index}#[CURRENCIES:71]Currency_Code:1)
					$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
					If ($_l_CurrencyRow<0)
						$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_l_CurrencyPeriod)
					End if 
				End if 
			End for 
			If ($_bo_Update)  //new stuff was created
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
				ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
				For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
					$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
					CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
				End for 
			End if 
			
			ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
			ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
			
		Else 
			Gen_Alert("Currency rates cannot be set for future dates!")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].CUR_ConversionRates.Variable4"; $_t_oldMethodName)
