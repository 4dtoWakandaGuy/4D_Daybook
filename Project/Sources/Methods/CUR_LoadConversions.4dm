//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_LoadConversions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_abo_CurrencyModified;0)
	//ARRAY DATE(CUR_ad_CurrencyDate;0)
	//ARRAY DATE(CUR_ad_CurrencyPeriodDateTo;0)
	//ARRAY LONGINT(CUR_al_CurrencyPeriodIDS;0)
	//ARRAY LONGINT(Cur_al_CurrencyRecIDs;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_CurrencyPeriods;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	//ARRAY TEXT(WS_at_CurrencyCodes;0)
	//ARRAY TEXT(WS_at_CurrencyNames;0)
	C_BOOLEAN:C305($_bo_Update; $2; CUR_bo_UpdateCurrencyRecord)
	C_DATE:C307(CUR_D_CurrencyMaxDate)
	C_LONGINT:C283($_l_CUrrencyCodePosition; $_l_CurrencyRow; $_l_Index; CUR_l_CurrencyMaxPeriod; CUR_l_CurrencyPeriod)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; CUR_S5_CurrencyCode2; CUR_t_CurrencyName2; CUR_t_CurrencyPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_LoadConversions")
//this method is for use in the screen [USER];"CUR_ConversionRates"
//it gets the data for a currency
CUR_bo_UpdateCurrencyRecord:=False:C215
If ($1>0)
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$1)
	OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; True:C214)
	OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; True:C214)
	CUR_S5_CurrencyCode2:=[CURRENCIES:71]Currency_Code:1
	CUR_t_CurrencyName2:=[CURRENCIES:71]Currency_Name:2
	CUR_l_CurrencyMaxPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
	If (CUR_l_CurrencyMaxPeriod=0)
		READ ONLY:C145([PERIODS:33])
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
		FIRST RECORD:C50([PERIODS:33])
		CUR_l_CurrencyMaxPeriod:=[PERIODS:33]x_ID:10
	End if 
	
	CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
	If (CUR_l_CurrencyPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
		FIRST RECORD:C50([PERIODS:33])
		CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
	End if 
	CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)}
	CUR_at_CurrencyPeriods:=Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)
	CUR_D_CurrencyMaxDate:=CUR_ad_CurrencyPeriodDateTo{CUR_at_CurrencyPeriods}
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
		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
		If ($_l_CurrencyRow<0)
			$_bo_Update:=CUR_CheckRate([CURRENCIES:71]Currency_Code:1; CUR_at_CurrencyCodes{$_l_Index}; CUR_l_CurrencyPeriod)
		End if 
	End for 
	
	If ($_bo_Update)  //new stuff was created
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
		ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
		For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
			$_l_CurrencyRow:=Find in array:C230(WS_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
			CUR_at_CurrencyToNames{$_l_Index}:=WS_at_CurrencyNames{$_l_CurrencyRow}
		End for 
		
	End if 
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
Else 
	If (Count parameters:C259<2)
		REDUCE SELECTION:C351([CURRENCIES:71]; 0)
		OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; False:C215)
		OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; False:C215)
	Else 
		If ($2)
			REDUCE SELECTION:C351([CURRENCIES:71]; 0)
			OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; False:C215)
			OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; False:C215)
		Else 
			OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; True:C214)
			OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; True:C214)
		End if 
	End if 
	
	CUR_S5_CurrencyCode2:=""
	CUR_t_CurrencyName2:=""
	CUR_l_CurrencyMaxPeriod:=0
	
	CUR_l_CurrencyPeriod:=0
	CUR_t_CurrencyPeriod:=""
	CUR_at_CurrencyPeriods:=0
	CUR_D_CurrencyMaxDate:=!00-00-00!
	ARRAY TEXT:C222(CUR_at_CurrencyToCodes; 0)
	ARRAY REAL:C219(CUR_ar_CurrencyRates; 0)
	ARRAY DATE:C224(CUR_ad_CurrencyDate; 0)
	ARRAY LONGINT:C221(Cur_al_CurrencyRecIDs; 0)
	ARRAY TEXT:C222(CUR_at_CurrencyToNames; 0)
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
	CUR_l_CurrencyMaxPeriod:=Check_Period(Current date:C33(*))
	
	CUR_l_CurrencyPeriod:=Check_Period(Current date:C33(*))
	If (CUR_l_CurrencyPeriod>0)
		CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)}
		CUR_at_CurrencyPeriods:=Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)
		CUR_D_CurrencyMaxDate:=CUR_ad_CurrencyPeriodDateTo{CUR_at_CurrencyPeriods}
	End if 
	
End if 



//this method is for use in the screen [USER];"CUR_ConversionRates"
//it gets the data for a currency
CUR_bo_UpdateCurrencyRecord:=False:C215
If ($1>0)
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$1)
	OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; True:C214)
	OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; True:C214)
	CUR_S5_CurrencyCode2:=[CURRENCIES:71]Currency_Code:1
	CUR_t_CurrencyName2:=[CURRENCIES:71]Currency_Name:2
	CUR_l_CurrencyMaxPeriod:=Check_Period(Current date:C33(*))
	If (CUR_l_CurrencyMaxPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
		FIRST RECORD:C50([PERIODS:33])
		CUR_l_CurrencyMaxPeriod:=[PERIODS:33]x_ID:10
	End if 
	
	CUR_l_CurrencyPeriod:=Check_Period(Current date:C33(*))
	If (CUR_l_CurrencyPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
		FIRST RECORD:C50([PERIODS:33])
		CUR_l_CurrencyPeriod:=[PERIODS:33]x_ID:10
	End if 
	CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)}
	CUR_at_CurrencyPeriods:=Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)
	CUR_D_CurrencyMaxDate:=CUR_ad_CurrencyPeriodDateTo{CUR_at_CurrencyPeriods}
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
		CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
	End for 
	$_bo_Update:=False:C215
	For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
		$_l_CUrrencyCodePosition:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
		If ($_l_CUrrencyCodePosition<0)
			$_bo_Update:=CUR_CheckRate([CURRENCIES:71]Currency_Code:1; CUR_at_CurrencyCodes{$_l_Index}; CUR_l_CurrencyPeriod)
		End if 
	End for 
	
	If ($_bo_Update)  //new stuff was created
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
		ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
		For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
			$_l_CUrrencyCodePosition:=Find in array:C230(WS_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
			CUR_at_CurrencyToNames{$_l_Index}:=WS_at_CurrencyNames{$_l_CUrrencyCodePosition}
		End for 
		
	End if 
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
Else 
	If (Count parameters:C259<2)
		REDUCE SELECTION:C351([CURRENCIES:71]; 0)
		OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; False:C215)
		OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; False:C215)
	Else 
		If ($2)
			REDUCE SELECTION:C351([CURRENCIES:71]; 0)
			OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; False:C215)
			OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; False:C215)
		Else 
			OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; True:C214)
			OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; True:C214)
		End if 
	End if 
	
	CUR_S5_CurrencyCode2:=""
	CUR_t_CurrencyName2:=""
	CUR_l_CurrencyMaxPeriod:=0
	
	CUR_l_CurrencyPeriod:=0
	CUR_t_CurrencyPeriod:=""
	CUR_at_CurrencyPeriods:=0
	CUR_D_CurrencyMaxDate:=!00-00-00!
	ARRAY TEXT:C222(CUR_at_CurrencyToCodes; 0)
	ARRAY REAL:C219(CUR_ar_CurrencyRates; 0)
	ARRAY DATE:C224(CUR_ad_CurrencyDate; 0)
	ARRAY LONGINT:C221(Cur_al_CurrencyRecIDs; 0)
	ARRAY TEXT:C222(CUR_at_CurrencyToNames; 0)
	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
	CUR_l_CurrencyMaxPeriod:=Check_Period(Current date:C33(*))
	
	CUR_l_CurrencyPeriod:=Check_Period(Current date:C33(*))
	If (CUR_l_CurrencyPeriod>0)
		CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)}
		CUR_at_CurrencyPeriods:=Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)
		CUR_D_CurrencyMaxDate:=CUR_ad_CurrencyPeriodDateTo{CUR_at_CurrencyPeriods}
		
	End if 
End if 
ERR_MethodTrackerReturn("CUR_LoadConversions"; $_t_oldMethodName)