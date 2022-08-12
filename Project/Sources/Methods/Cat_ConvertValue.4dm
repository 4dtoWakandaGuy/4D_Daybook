//%attributes = {}
If (False:C215)
	//Project Method Name:      Cat_ConvertValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($4)
	C_LONGINT:C283(CUR_l_CurrencyPeriod)
	C_REAL:C285($_r_CurrencyRate; $0; $1)
	C_TEXT:C284($_t_oldMethodName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cat_ConvertValue")
//This method will convert an amount from one currency to the other
If (Count parameters:C259>=3)
	If ($3#$2)
		
		If (Count parameters:C259<4)
			
			CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
		Else 
			If ($4#!00-00-00!)
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24($4); Year of:C25($4)))
			Else 
				CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))
			End if 
		End if 
		//now find the rate for this period
		CUR_CheckRate($2; $3)
		//CurrRate_MostRecent ($2;$3;Current date(*)
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
		//the first record will be the correct one
		$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
		If (Records in selection:C76([CURRENCY_RATES:72])>0)
			$0:=Gen_Round((($1*$_r_CurrencyRate)); 2; 2)
		Else 
			$0:=$1
		End if 
	Else 
		//There is not conversion to do
		$0:=$1
	End if 
End if 
ERR_MethodTrackerReturn("Cat_ConvertValue"; $_t_oldMethodName)