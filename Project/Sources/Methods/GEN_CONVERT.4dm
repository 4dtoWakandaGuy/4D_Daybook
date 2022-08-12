//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_CONVERT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EarliestRateFromDate; $_d_FirstRateFromDate; $_d_LatestPossibleRateFromDate; $3)
	C_LONGINT:C283($_l_Dayof; CUR_l_CurrencyPeriod)
	C_REAL:C285($0; $2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_outputCurrency; $1; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_CONVERT")
//GEN_CONVERT ([TRANSACTIONS]Currency Code;[TRANSACTIONS]Tax Amount;[TRANSACTIONS]
MESSAGES OFF:C175
If (Count parameters:C259>=4)
	$_t_outputCurrency:=$4
Else 
	$_t_outputCurrency:=<>SYS_t_BaseCurrency
End if 
CUR_CheckRate($1; <>SYS_t_BaseCurrency)  //this makes sure we have rates to the base currency upto date
CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($3); Year of:C25($3)))
If (CUR_l_CurrencyPeriod=0)
	ALL RECORDS:C47([PERIODS:33])
	ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
	FIRST RECORD:C50([PERIODS:33])
	$_d_EarliestRateFromDate:=$3
	$_d_LatestPossibleRateFromDate:=Current date:C33(*)
	Repeat 
		IDLE:C311
		$_l_Dayof:=Day of:C23($_d_LatestPossibleRateFromDate)
		$_d_FirstRateFromDate:=$_d_LatestPossibleRateFromDate-($_l_Dayof-1)
		$_d_LatestPossibleRateFromDate:=$_d_FirstRateFromDate-1
		CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestPossibleRateFromDate); Year of:C25($_d_LatestPossibleRateFromDate)))
	Until (CUR_l_CurrencyPeriod>0) | ($_d_LatestPossibleRateFromDate<$_d_EarliestRateFromDate)
End if 
QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_outputCurrency; *)
QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
If (Records in selection:C76([CURRENCY_RATES:72])>0)
	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; >)
	//we now have the rates in order and it will be the last record we want
	LAST RECORD:C200([CURRENCY_RATES:72])
	$0:=$2*[CURRENCY_RATES:72]Rate:3
Else 
	// ALERT("NO RATE TO CONVERT BY!!!")
	Gen_Alert("NO RATE TO CONVERT BY!!!")
	$0:=$2
End if 
ERR_MethodTrackerReturn("GEN_CONVERT"; $_t_oldMethodName)