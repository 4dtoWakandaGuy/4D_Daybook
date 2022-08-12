//%attributes = {}
If (False:C215)
	//Project Method Name:      Currency_inonLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2010 10:02
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
	//ARRAY DATE(CUR_ad_CurrencyPeriodFrom;0)
	//ARRAY LONGINT(CUR_al_CurrencyPeriodIDS;0)
	//ARRAY LONGINT(Cur_al_CurrencyRecIDs;0)
	//ARRAY LONGINT(WS_al_CurrencyIDs;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY REAL(WS_ar_CurrencyToRate;0)
	//ARRAY TEXT(CCM_at_CurrencyCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_CurrencyPeriods;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	//ARRAY TEXT(WS_at_CurrencyCodes;0)
	//ARRAY TEXT(WS_at_CurrencyNames;0)
	//ARRAY TEXT(WS_at_CurrencyToCode;0)
	//ARRAY TEXT(WS_at_CurrencyToName;0)
	C_BOOLEAN:C305($_bo_Update; WS_bo_CurrToRateMOD)
	C_DATE:C307($_d_EarliestRateFromDate; $_d_FirstRateFromDate; $_d_LatestPossibleRateFromDate; CUR_D_CurrencyMaxDate)
	C_LONGINT:C283($_l_CurrencyID; $_l_CurrencyRow; $_l_Dayof; $_l_Index; $_l_SelectedRecordNumber; CUR_l_CurrencyMaxPeriod; CUR_l_CurrencyPeriod; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_CurrencyCode; $_t_oldMethodName; CUR_t_CurrencyPeriod; CUR_t_CurrencyPeriods; CUR_t_ISoCurrencyName; WS_t_ConvCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currency_inonLoad")
ARRAY TEXT:C222(WS_at_CurrencyNames; 0)
ARRAY LONGINT:C221(WS_al_CurrencyIDs; 0)
ARRAY TEXT:C222(WS_at_CurrencyCodes; 0)

WS_bo_CurrToRateMOD:=False:C215


$_l_CurrencyID:=[CURRENCIES:71]X_ID:3
$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
COPY NAMED SELECTION:C331([CURRENCIES:71]; "$Temp")
$_l_SelectedRecordNumber:=Selected record number:C246([CURRENCIES:71])

PUSH RECORD:C176([CURRENCIES:71])
//WS_LoadEuroCurr

ALL RECORDS:C47([CURRENCIES:71])
QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]De_ActivatedCurrency:9=False:C215; *)
QUERY:C277([CURRENCIES:71];  & ; [CURRENCIES:71]Currency_Code:1#$_t_CurrencyCode)
SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Name:2; WS_at_CurrencyNames; [CURRENCIES:71]X_ID:3; WS_al_CurrencyIDs; [CURRENCIES:71]Currency_Code:1; WS_at_CurrencyCodes)
POP RECORD:C177([CURRENCIES:71])
ONE RECORD SELECT:C189([CURRENCIES:71])
USE NAMED SELECTION:C332("$Temp")
GOTO SELECTED RECORD:C245([CURRENCIES:71]; $_l_SelectedRecordNumber)

$_l_CurrencyRow:=Find in array:C230(WS_al_CurrencyIDs; $_l_CurrencyID)
If ($_l_CurrencyRow>0)  //it had better be
	DELETE FROM ARRAY:C228(WS_al_CurrencyIDs; $_l_CurrencyRow; 1)
	DELETE FROM ARRAY:C228(WS_at_CurrencyNames; $_l_CurrencyRow; 1)
	DELETE FROM ARRAY:C228(WS_at_CurrencyCodes; $_l_CurrencyRow; 1)
End if 

MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_MultiCurrency)
ARRAY TEXT:C222(WS_at_CurrencyToCode; 0)
ARRAY TEXT:C222(WS_at_CurrencyToName; 0)
ARRAY REAL:C219(WS_ar_CurrencyToRate; 0)
If (MOD_l_CurrentModuleAccess>0)
	ALL RECORDS:C47([PERIODS:33])
	ARRAY TEXT:C222(CUR_at_CurrencyPeriods; 0)
	ARRAY LONGINT:C221(CUR_al_CurrencyPeriodIDS; 0)
	ARRAY TEXT:C222(CUR_at_CurrencyToCodes; 0)
	ARRAY TEXT:C222(CUR_at_CurrencyToNames; 0)
	ARRAY REAL:C219(CUR_ar_CurrencyRates; 0)
	ARRAY DATE:C224(CUR_ad_CurrencyDate; 0)
	
	SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; CUR_at_CurrencyPeriods; [PERIODS:33]x_ID:10; CUR_al_CurrencyPeriodIDS; [PERIODS:33]From_Date:3; CUR_ad_CurrencyPeriodFrom; [PERIODS:33]To_Date:4; CUR_ad_CurrencyPeriodDateTo)
	SORT ARRAY:C229(CUR_at_CurrencyPeriods; CUR_al_CurrencyPeriodIDS; CUR_ad_CurrencyPeriodFrom; CUR_ad_CurrencyPeriodDateTo; <)
	//get the current period here
	//CUR_CheckUpdate
	CUR_l_CurrencyMaxPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
	If (CUR_l_CurrencyMaxPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
		FIRST RECORD:C50([PERIODS:33])
		$_d_EarliestRateFromDate:=[PERIODS:33]From_Date:3
		$_d_LatestPossibleRateFromDate:=Current date:C33(*)
		Repeat 
			IDLE:C311
			$_l_Dayof:=Day of:C23($_d_LatestPossibleRateFromDate)
			$_d_FirstRateFromDate:=$_d_LatestPossibleRateFromDate-($_l_Dayof-1)
			$_d_LatestPossibleRateFromDate:=$_d_FirstRateFromDate-1
			CUR_l_CurrencyMaxPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestPossibleRateFromDate); Year of:C25($_d_LatestPossibleRateFromDate)))
		Until (CUR_l_CurrencyMaxPeriod>0) | ($_d_LatestPossibleRateFromDate<$_d_EarliestRateFromDate)
	End if 
	
	CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
	If (CUR_l_CurrencyPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
		FIRST RECORD:C50([PERIODS:33])
		$_d_EarliestRateFromDate:=[PERIODS:33]From_Date:3
		$_d_LatestPossibleRateFromDate:=Current date:C33(*)
		Repeat 
			IDLE:C311
			$_l_Dayof:=Day of:C23($_d_LatestPossibleRateFromDate)
			$_d_FirstRateFromDate:=$_d_LatestPossibleRateFromDate-($_l_Dayof-1)
			$_d_LatestPossibleRateFromDate:=$_d_FirstRateFromDate-1
			CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestPossibleRateFromDate); Year of:C25($_d_LatestPossibleRateFromDate)))
		Until (CUR_l_CurrencyPeriod>0) | ($_d_LatestPossibleRateFromDate<$_d_EarliestRateFromDate)
	End if 
	CUR_t_CurrencyPeriods:=CUR_at_CurrencyPeriods{Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)}
	CUR_at_CurrencyPeriods:=Find in array:C230(CUR_al_CurrencyPeriodIDS; CUR_l_CurrencyPeriod)
	CUR_D_CurrencyMaxDate:=CUR_ad_CurrencyPeriodDateTo{CUR_at_CurrencyPeriods}
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
		$_l_CurrencyRow:=Find in array:C230(WS_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
		If ($_l_CurrencyRow>0)
			CUR_at_CurrencyToNames{$_l_Index}:=WS_at_CurrencyNames{$_l_CurrencyRow}
		Else 
			CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyToCodes{$_l_Index}
		End if 
		
	End for 
	$_bo_Update:=False:C215
	For ($_l_Index; 1; Size of array:C274(WS_at_CurrencyCodes))
		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; WS_at_CurrencyCodes{$_l_Index})
		If ($_l_CurrencyRow<0)
			$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_l_CurrencyPeriod)
		End if 
	End for 
	
	If ($_bo_Update)  //new stuff was created
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
		ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
		For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
			$_l_CurrencyRow:=Find in array:C230(WS_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
			CUR_at_CurrencyToNames{$_l_Index}:=WS_at_CurrencyNames{$_l_CurrencyRow}
		End for 
		
	End if 
	
	WS_AutoscreenSize(2; 266; 460)
Else 
	WS_AutoscreenSize(2; 146; 460)
	OBJECT SET VISIBLE:C603(WS_at_CurrencyToCode; False:C215)
	OBJECT SET VISIBLE:C603(WS_at_CurrencyToName; False:C215)
	OBJECT SET VISIBLE:C603(WS_ar_CurrencyToRate; False:C215)
End if 
ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
//this is loaded in the on load form method

$_l_CurrencyRow:=Find in array:C230(CCM_at_CurrencyCodes; [CURRENCIES:71]ISO_Currency_Code:8)
If ($_l_CurrencyRow<0)
	CUR_t_ISoCurrencyName:=""
Else 
	CUR_t_ISoCurrencyName:=CCM_at_CurrencyNames{$_l_CurrencyRow}
End if 

If ([CURRENCIES:71]Currency_Code:1#"")
	GOTO OBJECT:C206([CURRENCIES:71]Currency_Name:2)
End if 
ERR_MethodTrackerReturn("Currency_inonLoad"; $_t_oldMethodName)