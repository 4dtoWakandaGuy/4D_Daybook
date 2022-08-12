//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_ConvertValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    30/03/2011 22:31 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_DATE:C307($_d_EarliestDate; $_d_FirstDate; $_d_LatestDate)
	C_LONGINT:C283($_l_CurrencyPeriod; $_l_Day; $_l_PeriodIndex; CUR_l_CurrencyPeriod)
	C_REAL:C285($_r_CurrencyRate; $0; $1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyA; $_t_CurrencyB; $_t_oldMethodName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_ConvertValue")
//this routine is only used with aged debtors and aged creditors
// it replaces CurrConv_Convert
//this converts the value of invoices/p invoices
//previously this provided an option to convert at the rate at the time of posting
//actually that is irrelavant as the converted value of the debt
//should always be at the current rate!
//the only reason to do a historical conversion would be to compare
//    vTotal:=CurrConv_Convert (vTotal;[INVOICES]Invoice Date;[INVOICES]Currency Code

If ($2="")
	$_t_CurrencyA:=<>SYS_t_BaseCurrency
Else 
	$_t_CurrencyA:=$2
	
End if 
If ($3="")
	$_t_CurrencyB:=<>SYS_t_BaseCurrency
Else 
	$_t_CurrencyB:=$3
	
End if 

If ($_t_CurrencyA#$_t_CurrencyB)
	Case of 
		: (CB_bo_ConvertAtOlderRate)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
			If (Records in selection:C76([ORDER_ITEMS:25])>=1)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([ORDERS:24]Order_Date:4); Year of:C25([ORDERS:24]Order_Date:4)))
			Else 
				
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([INVOICES:39]Invoice_Date:4); Year of:C25([INVOICES:39]Invoice_Date:4)))
			End if 
			
		: (CB_bo_ConvertAtOldRate)
			CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([INVOICES:39]Invoice_Date:4); Year of:C25([INVOICES:39]Invoice_Date:4)))
			
		Else 
			CUR_CheckRate($_t_CurrencyA; $_t_CurrencyB)  //this makes sure we have rates to the base currency upto date
			
			CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
	End case 
	If (CUR_l_CurrencyPeriod=0)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
		FIRST RECORD:C50([PERIODS:33])
		$_d_EarliestDate:=[PERIODS:33]From_Date:3
		$_d_LatestDate:=Current date:C33(*)
		Repeat 
			IDLE:C311
			$_l_Day:=Day of:C23($_d_LatestDate)
			$_d_FirstDate:=$_d_LatestDate-($_l_Day-1)
			$_d_LatestDate:=$_d_FirstDate-1
			CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestDate); Year of:C25($_d_LatestDate)))
		Until (CUR_l_CurrencyPeriod>0) | ($_d_LatestDate<$_d_EarliestDate)
	End if 
	
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyA; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyB; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
	Case of 
		: (Records in selection:C76([CURRENCY_RATES:72])>1)
			ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
			
			FIRST RECORD:C50([CURRENCY_RATES:72])
			$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
			$0:=Round:C94(($1*$_r_CurrencyRate); 2)
		: (Records in selection:C76([CURRENCY_RATES:72])=1)
			$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
			$0:=Round:C94(($1*$_r_CurrencyRate); 2)
		Else 
			//no rates for the period
			//so try working back
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
			SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
			For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
				$_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyA; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyB; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
				If (Records in selection:C76([CURRENCY_RATES:72])>0)
					$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
				End if 
			End for 
			If (Records in selection:C76([CURRENCY_RATES:72])=0)
				//still nothing!!
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Current date:C33(*))
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
				SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
				For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
					$_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyA; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyB; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_CurrencyPeriod)
					If (Records in selection:C76([CURRENCY_RATES:72])>0)
						$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
					End if 
				End for 
			End if 
			If (Records in selection:C76([CURRENCY_RATES:72])=0)
				//TRACE
			Else 
				$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
				$0:=Round:C94(($1*$_r_CurrencyRate); 2)
			End if 
			
	End case 
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("CUR_ConvertValue"; $_t_oldMethodName)