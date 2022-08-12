//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ConvertForProfit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	ARRAY TEXT:C222($_at_CurrencyRatesChecked; 0)
	C_DATE:C307($_d_FromDate; $_d_ToDate; $10; $11)
	C_LONGINT:C283($_l_ConvertPeriodID; $_l_PeriodID; $_l_PeriodIndex; $8; $CUR_l_CurrencyPeriod)
	C_REAL:C285($_r_CurrencyRate; $_r_TBalance; $0; $5; $6)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $7; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ConvertForProfit")
//this method will convert an amount at the end of the last year end.
//to do this we need to know the 'current period'
//$5=The unconverted amount
//$6=The converted amount
//$0 the profit at the time of posting(or end of year)


$0:=0
If ($8>0)
	$_l_ConvertPeriodID:=$8
	
	//convert at the rate at the end of the period before that
	//anything after just return $6
	Case of 
		: ($4<$9)  //if the transacton is before this year started| ($10>$11)
			If ($2#$3)  //output currency is not same as currency of transation
				ARRAY TEXT:C222($_at_CurrencyRatesChecked; Records in table:C83([CURRENCIES:71]))
				
				//```
				$_r_TBalance:=0
				If ([ACCOUNTS:32]Account_Code:2#$7)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$7)
				End if 
				
				If ([ACCOUNTS:32]Multicurrency_Valuation:10#1)
					$0:=$6  // at the historic rate anyway
					
				Else 
					//the 'current' rate at the the end of the year
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$8)
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$8)
						$_d_FromDate:=[PERIODS:33]From_Date:3
						$_d_ToDate:=[PERIODS:33]To_Date:4
						//no rate for the period `try back wards
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_FromDate)
						ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
						SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
						For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
							$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
							End if 
						End for 
						If (Records in selection:C76([CURRENCY_RATES:72])=0)
							//still nothing!!
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_ToDate)
							ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
							SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
							For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
								$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
								If (Records in selection:C76([CURRENCY_RATES:72])>0)
									$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
								End if 
							End for 
						End if 
					End if 
					
				End if 
				
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				//the first record will be the correct one
				$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
				If (Records in selection:C76([CURRENCY_RATES:72])>0)
					$0:=Gen_Round(((($5)*$_r_CurrencyRate)); 2; 2)
				End if 
				
				//````
			Else 
				$0:=$6
			End if 
		: ($11<$10)  //if the transacton is from previous period
			If ($2#$3)  //output currency is not same as currency of transation
				ARRAY TEXT:C222($_at_CurrencyRatesChecked; Records in table:C83([CURRENCIES:71]))
				
				//```
				$_r_TBalance:=0
				If ([ACCOUNTS:32]Account_Code:2#$7)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$7)
				End if 
				
				If ([ACCOUNTS:32]Multicurrency_Valuation:10#1)
					$0:=$6  // at the historic rate anyway
					
				Else 
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$11; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$11)
					$_l_PeriodID:=[PERIODS:33]x_ID:10
					$_d_FromDate:=[PERIODS:33]From_Date:3
					$_d_ToDate:=[PERIODS:33]To_Date:4
					
					//the 'current' rate at the the end of the year
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$_l_PeriodID)
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						//no rate for the period `try back wards
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<$_d_FromDate)
						ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
						SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
						For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
							$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
							If (Records in selection:C76([CURRENCY_RATES:72])>0)
								$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
							End if 
						End for 
						If (Records in selection:C76([CURRENCY_RATES:72])=0)
							//still nothing!!
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_ToDate)
							ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
							SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS)
							For ($_l_PeriodIndex; 1; Size of array:C274($_al_PeriodIDS))
								$CUR_l_CurrencyPeriod:=$_al_PeriodIDS{$_l_PeriodIndex}
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$3; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=$CUR_l_CurrencyPeriod)
								If (Records in selection:C76([CURRENCY_RATES:72])>0)
									$_l_PeriodIndex:=Size of array:C274($_al_PeriodIDS)+1
								End if 
							End for 
						End if 
					End if 
					
				End if 
				
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				//the first record will be the correct one
				$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
				If (Records in selection:C76([CURRENCY_RATES:72])>0)
					$0:=Gen_Round(((($5)*$_r_CurrencyRate)); 2; 2)
				End if 
				
				//````
			Else 
				$0:=$6
			End if 
			
		Else 
			$0:=$6
	End case 
Else 
	$0:=$6
End if 
ERR_MethodTrackerReturn("ACC_ConvertForProfit"; $_t_oldMethodName)
