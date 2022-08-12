//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_CheckUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CurrencyDates; 0)
	ARRAY DATE:C224($_ad_PeriodFromDates; 0)
	ARRAY DATE:C224($_ad_PeriodToDates; 0)
	ARRAY LONGINT:C221($_al_CurrencyPeriodIDS; 0)
	ARRAY LONGINT:C221($_al_CurrencyRecordIDS; 0)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	ARRAY REAL:C219($_ar_CurrencyRates; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyFromCode; 0)
	ARRAY TEXT:C222($_at_CurrencytoCode; 0)
	C_BOOLEAN:C305($_bo_Reload)
	C_DATE:C307($_d_CurrencyDate)
	C_LONGINT:C283($_l_CurrentElement; $_l_Index; $_l_Index2; $_l_Index3; $_l_Index4; $_l_PeriodID; $_l_RecordCount)
	C_REAL:C285($_r_CurrencyRate)
	C_TEXT:C284($_t_CurrencyFrom; $_t_CurrencyFromCode; $_t_CurrencyTo; $_t_CurrencytoCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_CheckUpdate")
//this method here will update conversion
// rates stored in the data to the new system
QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]x_PeriodID:7=0)

If (Records in selection:C76([CURRENCY_RATES:72])>0)
	// PUSH RECORD([CURRENCIES])
	//SOMETHING HAS NOT BEEN UPDATED
	READ WRITE:C146([PERIODS:33])
	QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
	If (Records in selection:C76([PERIODS:33])>0)
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[PERIODS:33])
			APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]x_ID:10:=0)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
		Else 
			FIRST RECORD:C50([PERIODS:33])
			For ($_l_Index; 1; Records in selection:C76([PERIODS:33]))
				[PERIODS:33]x_ID:10:=0
				DB_SaveRecord(->[PERIODS:33])
				AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
				NEXT RECORD:C51([PERIODS:33])
			End for 
		End if 
		
	End if 
	//THAT ENSURES ALL PERIODS HAVE AN ID
	READ WRITE:C146([CURRENCIES:71])
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=0)
	If (Records in selection:C76([CURRENCIES:71])>0)
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[CURRENCIES:71])
			APPLY TO SELECTION:C70([CURRENCIES:71]; [CURRENCIES:71]X_ID:3:=0)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENCIES:71]))
		Else 
			FIRST RECORD:C50([CURRENCIES:71])
			For ($_l_Index; 1; Records in selection:C76([CURRENCIES:71]))
				[CURRENCIES:71]X_ID:3:=0
				DB_SaveRecord(->[CURRENCIES:71])
				AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
				NEXT RECORD:C51([CURRENCIES:71])
			End for 
		End if 
	End if 
	READ WRITE:C146([CURRENCY_RATES:72])
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]x_PeriodID:7=0)
	For ($_l_Index; 1; Records in selection:C76([CURRENCY_RATES:72]))
		$_l_PeriodID:=Check_Period(Date_FromNums(1; Month of:C24([CURRENCY_RATES:72]Date:4); Year of:C25([CURRENCY_RATES:72]Date:4)))
		If ($_l_PeriodID>0)
			[CURRENCY_RATES:72]x_PeriodID:7:=$_l_PeriodID
		Else 
			//ERROR???
		End if 
		DB_SaveRecord(->[CURRENCY_RATES:72])
		AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
		NEXT RECORD:C51([CURRENCY_RATES:72])
	End for 
End if 

//NOW THAT ENSURES EVERY RATE HAS A PERIOD ID ON THEM
//NOW MAKE SURE EVERY RATE HAS AN INVERSE RATE
ALL RECORDS:C47([CURRENCY_RATES:72])
SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_From:1; $_at_CurrencyFromCode; [CURRENCY_RATES:72]Currency_To:2; $_at_CurrencytoCode; [CURRENCY_RATES:72]Rate:3; $_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodIDS)
$_bo_Reload:=False:C215
For ($_l_Index; Size of array:C274($_at_CurrencyFromCode); 1; -1)
	READ WRITE:C146([CURRENCY_RATES:72])
	$_t_CurrencyFromCode:=$_at_CurrencyFromCode{$_l_Index}
	$_t_CurrencytoCode:=$_at_CurrencytoCode{$_l_Index}
	$_d_CurrencyDate:=$_ad_CurrencyDates{$_l_Index}
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFromCode; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencytoCode; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_d_CurrencyDate)
	If (Records in selection:C76([CURRENCY_RATES:72])>1)
		$_l_RecordCount:=Records in selection:C76([CURRENCY_RATES:72])-1
		REDUCE SELECTION:C351([CURRENCY_RATES:72]; $_l_RecordCount)
		DELETE SELECTION:C66([CURRENCY_RATES:72])
		$_bo_Reload:=True:C214
	End if 
End for 
If ($_bo_Reload)
	ALL RECORDS:C47([CURRENCY_RATES:72])
	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_From:1; $_at_CurrencyFromCode; [CURRENCY_RATES:72]Currency_To:2; $_at_CurrencytoCode; [CURRENCY_RATES:72]Rate:3; $_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodIDS)
End if 

For ($_l_Index; 1; Size of array:C274($_at_CurrencyFromCode))
	$_t_CurrencyFromCode:=$_at_CurrencytoCode{$_l_Index}
	$_t_CurrencytoCode:=$_at_CurrencyFromCode{$_l_Index}
	//invert the rate
	$_r_CurrencyRate:=Round:C94((100/$_ar_CurrencyRates{$_l_Index})/100; 4)
	$_d_CurrencyDate:=$_ad_CurrencyDates{$_l_Index}
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFromCode; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencytoCode; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Rate:3=$_r_CurrencyRate; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_d_CurrencyDate)
	If (Records in selection:C76([CURRENCY_RATES:72])=0)
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFromCode; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencytoCode; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_d_CurrencyDate)
		If (Records in selection:C76([CURRENCY_RATES:72])=0)
			CREATE RECORD:C68([CURRENCY_RATES:72])
			[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyFromCode
			[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencytoCode
			[CURRENCY_RATES:72]Rate:3:=$_r_CurrencyRate
			[CURRENCY_RATES:72]Date:4:=$_d_CurrencyDate
			[CURRENCY_RATES:72]x_PeriodID:7:=$_al_CurrencyPeriodIDS{$_l_Index}
			DB_SaveRecord(->[CURRENCY_RATES:72])
			AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
		Else 
			[CURRENCY_RATES:72]Rate:3:=$_r_CurrencyRate
			DB_SaveRecord(->[CURRENCY_RATES:72])
			AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
		End if 
		
	End if 
End for 
//now each rate has an inverse
//check there is a rate for each period
ALL RECORDS:C47([PERIODS:33])
SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_PeriodIDS; [PERIODS:33]From_Date:3; $_ad_PeriodFromDates; [PERIODS:33]To_Date:4; $_ad_PeriodToDates)
SORT ARRAY:C229($_ad_PeriodFromDates; $_al_PeriodIDS; $_ad_PeriodToDates; >)
ALL RECORDS:C47([CURRENCIES:71])
SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; $_at_CurrencyCodes)
For ($_l_Index; 1; Size of array:C274($_at_CurrencyCodes))
	For ($_l_Index2; 1; Size of array:C274($_at_CurrencyCodes))
		If ($_at_CurrencyCodes{$_l_Index}#$_at_CurrencyCodes{$_l_Index2}) & ($_at_CurrencyCodes{$_l_Index}#"") & ($_at_CurrencyCodes{$_l_Index2}#"")
			//Repeat
			QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_CurrencyCodes{$_l_Index}; *)
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_at_CurrencyCodes{$_l_Index2})
			If (Records in selection:C76([CURRENCY_RATES:72])>0)
				//there are rates between these currencies
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
				
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodIDS; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordIDS)
				For ($_l_Index3; 1; Size of array:C274($_al_PeriodIDS))
					If ($_ad_PeriodFromDates{$_l_Index3}<=Current date:C33(*))
						//no rate for that period so create it
						$_l_CurrentElement:=0
						For ($_l_Index4; Size of array:C274($_ad_CurrencyDates); 1; -1)
							If ($_ad_CurrencyDates{$_l_Index4}<=$_ad_PeriodFromDates{$_l_Index3})
								$_l_CurrentElement:=$_l_Index4
								$_l_Index4:=0
							End if 
						End for 
						If ($_l_CurrentElement>0)
							If ($_ad_CurrencyDates{$_l_CurrentElement}=$_ad_PeriodFromDates{$_l_Index3})
								//this currency rate co-incides with the start of the period
								If ($_al_CurrencyPeriodIDS{$_l_CurrentElement}=0)
									//this is not stored
									READ WRITE:C146([CURRENCY_RATES:72])
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordIDS{$_l_CurrentElement})
									[CURRENCY_RATES:72]x_PeriodID:7:=$_al_PeriodIDS{$_l_Index3}
									$_al_CurrencyPeriodIDS{$_l_CurrentElement}:=$_al_PeriodIDS{$_l_Index3}
									DB_SaveRecord(->[CURRENCY_RATES:72])
									AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
								End if 
							Else 
								//the date does not coincide
								//so this rate record belongs to previous period
								If ($_al_CurrencyPeriodIDS{$_l_CurrentElement}=0)
									READ WRITE:C146([CURRENCY_RATES:72])
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordIDS{$_l_CurrentElement})
									[CURRENCY_RATES:72]x_PeriodID:7:=$_al_PeriodIDS{$_l_Index3-1}
									$_al_CurrencyPeriodIDS{$_l_CurrentElement}:=$_al_PeriodIDS{$_l_Index3-1}
									DB_SaveRecord(->[CURRENCY_RATES:72])
									AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
								Else 
									QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordIDS{$_l_CurrentElement})
								End if 
								$_t_CurrencyFrom:=[CURRENCY_RATES:72]Currency_From:1
								$_t_CurrencyTo:=[CURRENCY_RATES:72]Currency_To:2
								$_r_CurrencyRate:=[CURRENCY_RATES:72]Rate:3
								CREATE RECORD:C68([CURRENCY_RATES:72])
								[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyFrom
								[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyTo
								[CURRENCY_RATES:72]Rate:3:=$_r_CurrencyRate
								[CURRENCY_RATES:72]Date:4:=$_ad_PeriodFromDates{$_l_Index3}
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_PeriodIDS{$_l_Index3}
								DB_SaveRecord(->[CURRENCY_RATES:72])
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_at_CurrencyCodes{$_l_Index}; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_at_CurrencyCodes{$_l_Index2})
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
								SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodIDS; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordIDS)
								$_l_Index3:=0
							End if 
						End if 
					End if 
					
				End for 
				
			Else 
				//dont do anything
				
			End if 
			
		End if 
		
	End for 
End for 
ERR_MethodTrackerReturn("CUR_CheckUpdate"; $_t_oldMethodName)