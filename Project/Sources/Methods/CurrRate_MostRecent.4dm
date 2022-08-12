//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRate_MostRecent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2010 13:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EarliestRateFromDate; $_d_FirstRateFromDate; $_d_LatestPossibleRateFromDate; $_d_MaxPeriodToDate; $3)
	C_LONGINT:C283($_l_CountParameters; $_l_Dayof; $_l_MaxPeriodID; CUR_l_CurrencyPeriod)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRate_MostRecent")
If (False:C215)
	$_l_CountParameters:=Count parameters:C259
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
	If ($_l_CountParameters>2)
		If (($3#!00-00-00!) & ($3<<>DB_d_CurrentDate))
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4<=$3; *)
		End if 
	End if 
	If ($_l_CountParameters>3)
		If (($4#"") & ($4#"*Any*"))
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Rate_Type:5=$4; *)
		End if 
	End if 
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
	CREATE SET:C116([CURRENCY_RATES:72]; "Extra5")
	
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
	If ($_l_CountParameters>2)
		If (($3#!00-00-00!) & ($3<<>DB_d_CurrentDate))
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4<=$3; *)
		End if 
	End if 
	If ($_l_CountParameters>3)
		If (($4#"") & ($4#"*Any*"))
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Rate_Type:5=$4; *)
		End if 
	End if 
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$1)
	CREATE SET:C116([CURRENCY_RATES:72]; "Extra4")
	
	UNION:C120("Extra5"; "Extra4"; "Extra5")
	USE SET:C118("Extra5")
	MESSAGES OFF:C175
	ORDER BY:C49([CURRENCY_RATES:72]Date:4; <)
	MESSAGES ON:C181
	FIRST RECORD:C50([CURRENCY_RATES:72])
	If (Records in selection:C76([CURRENCY_RATES:72])=0)
		If ($1#$2)
			Gen_Alert("No Currency Rate has been found for "+$2+" - it will be set to parity"; "")
		End if 
	End if 
	
Else 
	
	If ($1#$2)
		CUR_CheckRate($1; $2)  //this makes sure we have rates to the base currency upto date
		If (Count parameters:C259<3)
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
			
		Else 
			If ($3#!00-00-00!)  //most recent cannot return future rates! -this causes future rates to be created in the system which messes it all up.
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
				If ([PERIODS:33]x_ID:10#CUR_l_CurrencyPeriod)
					QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=CUR_l_CurrencyPeriod)
				End if 
				$_l_MaxPeriodID:=CUR_l_CurrencyPeriod
				$_d_MaxPeriodToDate:=[PERIODS:33]To_Date:4
				
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($3); Year of:C25($3)))
				If ([PERIODS:33]x_ID:10#CUR_l_CurrencyPeriod)
					QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=CUR_l_CurrencyPeriod)
				End if 
				If ([PERIODS:33]To_Date:4>$_d_MaxPeriodToDate)
					QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_MaxPeriodID)
				End if 
				If (CUR_l_CurrencyPeriod=0)
					ALL RECORDS:C47([PERIODS:33])
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
					FIRST RECORD:C50([PERIODS:33])
					$_d_EarliestRateFromDate:=[PERIODS:33]From_Date:3
					$_d_LatestPossibleRateFromDate:=$3
					Repeat 
						IDLE:C311
						$_l_Dayof:=Day of:C23($_d_LatestPossibleRateFromDate)
						$_d_FirstRateFromDate:=$_d_LatestPossibleRateFromDate-($_l_Dayof-1)
						$_d_LatestPossibleRateFromDate:=$_d_FirstRateFromDate-1
						CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($_d_LatestPossibleRateFromDate); Year of:C25($_d_LatestPossibleRateFromDate)))
					Until (CUR_l_CurrencyPeriod>0) | ($_d_LatestPossibleRateFromDate<$_d_EarliestRateFromDate)
				End if 
			Else 
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
			End if 
		End if 
		
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		Case of 
			: (Records in selection:C76([CURRENCY_RATES:72])>1)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				FIRST RECORD:C50([CURRENCY_RATES:72])
			: (Records in selection:C76([CURRENCY_RATES:72])=1)
			Else 
				If ($1#$2)
					Gen_Alert("No Currency Rate has been found for "+$2+" - it will be set to parity"; "")
				End if 
				
		End case 
	Else 
		REDUCE SELECTION:C351([CURRENCY_RATES:72]; 0)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("CurrRate_MostRecent"; $_t_oldMethodName)