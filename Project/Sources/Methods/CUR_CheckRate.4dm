//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_CheckRate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 06:16`Method: CUR_CheckRate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CurrencyDates; 0)
	ARRAY DATE:C224($_ad_CurrencyFmBaseDates; 0)
	ARRAY DATE:C224($_ad_CurrencyToBaseDates; 0)
	ARRAY DATE:C224($_ad_periodFromDates; 0)
	ARRAY DATE:C224($_ad_PeriodToDates; 0)
	ARRAY LONGINT:C221($_al_CurrencyFMBasePeriods; 0)
	ARRAY LONGINT:C221($_al_CurrencyFMBaseRecordIDS; 0)
	ARRAY LONGINT:C221($_al_CurrencyPeriodID; 0)
	ARRAY LONGINT:C221($_al_CurrencyRecordID; 0)
	ARRAY LONGINT:C221($_al_CurrencyToBasePeriods; 0)
	ARRAY LONGINT:C221($_al_CurrencyToBaseRecordIDS; 0)
	ARRAY LONGINT:C221($_al_periodIDS; 0)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_DATE:C307($_d_PeriodUpdate)
	C_LONGINT:C283($_l_CurrencyPeriod; $_l_fmCUrrencyRateID; $_l_FoundElement; $_l_FoundElement2; $_l_index; $_l_index2; $_l_toCUrrencyRateID)
	C_REAL:C285($_r_Factor; $_r_Rate; $_r_Rate2; $_r_RateA; $_r_RateB; $3)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CallingMethodName; $_t_CurrencyFrom; $_t_CurrencyTo; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CUR_CheckRate")

$_t_CallingMethodName:=ERR_MethodTracker("CUR_CheckRate")
//this method

//will find(and create records if they are missing
//for a conversion rate from one currency to another
//just double check
$_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24(Current date:C33(*)); Year of:C25(Current date:C33(*))))

QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
If (Records in selection:C76([PERIODS:33])>0)
	READ WRITE:C146([PERIODS:33])
	If (Not:C34(In transaction:C397))
		LOAD RECORD:C52([PERIODS:33])
		DB_lockFile(->[PERIODS:33])
		APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]x_ID:10:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
	Else 
		QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
		For ($_l_index; 1; Records in selection:C76([PERIODS:33]))
			[PERIODS:33]x_ID:10:=AA_GetNextIDinMethod(->[PERIODS:33]x_ID:10)
			DB_SaveRecord(->[PERIODS:33])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
			NEXT RECORD:C51([PERIODS:33])
		End for 
		CUR_CheckUpdate
	End if 
	UNLOAD RECORD:C212([PERIODS:33])
	READ ONLY:C145([PERIODS:33])
	
End if 
If ($_l_CurrencyPeriod>0)
	QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_CurrencyPeriod)
	$_d_PeriodUpdate:=[PERIODS:33]To_Date:4
	QUERY SELECTION:C341([PERIODS:33]; [PERIODS:33]To_Date:4<=$_d_PeriodUpdate)
Else 
	$_d_PeriodUpdate:=Current date:C33(*)
	//ALL RECORDS([PERIODS])
End if 

QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
$0:=False:C215
If (Records in selection:C76([CURRENCY_RATES:72])>0)
	//there are rates
	//so find the correct one
	//NG thi is a post daybook edit
	
	
	QUERY SELECTION:C341([PERIODS:33]; [PERIODS:33]To_Date:4<=$_d_PeriodUpdate)
	SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_periodIDS; [PERIODS:33]From_Date:3; $_ad_periodFromDates; [PERIODS:33]To_Date:4; $_ad_PeriodToDates)
	
	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
	For ($_l_index; 1; Size of array:C274($_al_periodIDS))
		
		$_l_FoundElement:=0
		For ($_l_index2; 1; Size of array:C274($_ad_CurrencyDates))
			If ($_ad_CurrencyDates{$_l_index2}<=$_ad_periodFromDates{$_l_index})
				$_l_FoundElement:=$_l_index2
			End if 
		End for 
		If ($_l_FoundElement>0)
			If ($_ad_CurrencyDates{$_l_FoundElement}=$_ad_periodFromDates{$_l_index})
				//this currency rate co-incides with the start of the period
				If ($_al_CurrencyPeriodID{$_l_FoundElement}=0)  //this is not stored
					READ WRITE:C146([CURRENCY_RATES:72])
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
					[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
					$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index}
					DB_SaveRecord(->[CURRENCY_RATES:72])
					AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
				End if 
			Else   //the date does not coincide
				//so this rate record belongs to previous period
				If ($_al_CurrencyPeriodID{$_l_FoundElement}=0)
					READ WRITE:C146([CURRENCY_RATES:72])
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
					[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index-1}
					$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index-1}
					DB_SaveRecord(->[CURRENCY_RATES:72])
					AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
				Else 
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
				End if 
				$_t_CurrencyTo:=[CURRENCY_RATES:72]Currency_From:1
				$_t_CurrencyFrom:=[CURRENCY_RATES:72]Currency_To:2
				$_r_Rate:=[CURRENCY_RATES:72]Rate:3
				CREATE RECORD:C68([CURRENCY_RATES:72])
				[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyTo
				[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyFrom
				[CURRENCY_RATES:72]Rate:3:=$_r_Rate
				[CURRENCY_RATES:72]Date:4:=$_ad_periodFromDates{$_l_index}
				[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
				DB_SaveRecord(->[CURRENCY_RATES:72])
				AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
			End if 
		End if 
	End for 
	$0:=True:C214
Else 
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$1)
	//there are inverse rates
	If (Records in selection:C76([CURRENCY_RATES:72])>0)
		ALL RECORDS:C47([PERIODS:33])
		SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_periodIDS; [PERIODS:33]From_Date:3; $_ad_periodFromDates; [PERIODS:33]To_Date:4; $_ad_PeriodToDates)
		
		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
		For ($_l_index; 1; Size of array:C274($_al_periodIDS))
			//no rate for that period so create it
			$_l_FoundElement:=0
			For ($_l_index2; 1; Size of array:C274($_ad_CurrencyDates))
				If ($_ad_CurrencyDates{$_l_index2}<=$_ad_periodFromDates{$_l_index})
					$_l_FoundElement:=$_l_index2
				End if 
			End for 
			If ($_l_FoundElement>0)
				If ($_ad_CurrencyDates{$_l_FoundElement}=$_ad_periodFromDates{$_l_index})
					//this currency rate co-incides with the start of the period
					If ($_al_CurrencyPeriodID{$_l_FoundElement}=0)  //this is not stored
						READ WRITE:C146([CURRENCY_RATES:72])
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
						[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
						$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index}
						DB_SaveRecord(->[CURRENCY_RATES:72])
						AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
					End if 
				Else   //the date does not coincide
					//so this rate record belongs to previous period
					If ($_al_CurrencyPeriodID{$_l_FoundElement}=0)
						READ WRITE:C146([CURRENCY_RATES:72])
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
						[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index-1}
						$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index-1}
						DB_SaveRecord(->[CURRENCY_RATES:72])
						AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
					Else 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyRecordID{$_l_FoundElement})
					End if 
					$_t_CurrencyTo:=[CURRENCY_RATES:72]Currency_From:1
					$_t_CurrencyFrom:=[CURRENCY_RATES:72]Currency_To:2
					$_r_Rate:=[CURRENCY_RATES:72]Rate:3
					CREATE RECORD:C68([CURRENCY_RATES:72])
					[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyTo
					[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyFrom
					[CURRENCY_RATES:72]Rate:3:=$_r_Rate
					[CURRENCY_RATES:72]Date:4:=$_ad_periodFromDates{$_l_index}
					[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
					DB_SaveRecord(->[CURRENCY_RATES:72])
					AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
					//and the inverse here
					$_r_Rate2:=Round:C94(((100/$_r_Rate)/100); 4)
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFrom; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyTo; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Rate:3=$_r_Rate2; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_ad_periodFromDates{$_l_index})
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFrom; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyTo; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_ad_periodFromDates{$_l_index})
						If (Records in selection:C76([CURRENCY_RATES:72])=0)
							CREATE RECORD:C68([CURRENCY_RATES:72])
							[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyFrom
							[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyTo
							[CURRENCY_RATES:72]Rate:3:=$_r_Rate2
							[CURRENCY_RATES:72]Date:4:=$_ad_periodFromDates{$_l_index}
							[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
							DB_SaveRecord(->[CURRENCY_RATES:72])
							AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
						Else 
							[CURRENCY_RATES:72]Rate:3:=$_r_Rate2
							DB_SaveRecord(->[CURRENCY_RATES:72])
							AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
						End if 
					End if 
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyTo; *)
					QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyFrom)
					
					SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
				End if 
			End if 
		End for 
		$0:=True:C214
	Else 
		
		//there are no rates between the two currrencies. so we have to find the rates to the base currency for each.
		//QUERY([CURRENCY_RATES];[CURRENCY_RATES]Currency_From=$1;*)
		//QUERY([CURRENCY_RATES]; & ;[CURRENCY_RATES]Currency_To=<>SYS_t_BaseCurrency)
		If ($2#<>SYS_t_BaseCurrency)
			$_bo_OK:=CUR_CheckRate($1; <>SYS_t_BaseCurrency)
			//QUERY([CURRENCY_RATES];[CURRENCY_RATES]Currency_From=$2;*)
			//QUERY([CURRENCY_RATES]; & ;[CURRENCY_RATES]Currency_To=<>SYS_t_BaseCurrency)
			//$_bo_OK:=$_bo_OK & (CUR_CheckRate ($2;<>SYS_t_BaseCurrency))
			
			//so now we know if
			If ($_bo_OK) & (CUR_CheckRate($2; <>SYS_t_BaseCurrency))
				//we can now create a rate from 1 to 2
				ALL RECORDS:C47([PERIODS:33])
				SELECTION TO ARRAY:C260([PERIODS:33]x_ID:10; $_al_periodIDS; [PERIODS:33]From_Date:3; $_ad_periodFromDates; [PERIODS:33]To_Date:4; $_ad_PeriodToDates)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$1; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=<>SYS_t_BaseCurrency)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyFmBaseDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyFMBasePeriods; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyFMBaseRecordIDS)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=<>SYS_t_BaseCurrency; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4)
				SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyToBaseDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyToBasePeriods; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyToBaseRecordIDS)
				
				For ($_l_index; 1; Size of array:C274($_al_periodIDS))
					//no rate for that period so create it
					
					$_l_FoundElement:=0
					For ($_l_index2; 1; Size of array:C274($_ad_CurrencyFmBaseDates))
						If ($_ad_CurrencyFmBaseDates{$_l_index2}<=$_ad_periodFromDates{$_l_index})
							$_l_FoundElement:=$_l_index2
							
						End if 
					End for 
					For ($_l_index2; 1; Size of array:C274($_ad_CurrencyToBaseDates))
						If ($_ad_CurrencytoBaseDates{$_l_index2}<=$_ad_periodFromDates{$_l_index})
							$_l_FoundElement2:=$_l_index2
							
						End if 
					End for 
					
					//TRACE
					//so unlike the above we expect to find a rate for the period in questions
					If ($_l_FoundElement>0) & ($_l_FoundElement2>0)
						If ($_ad_CurrencyFmBaseDates{$_l_FoundElement}=$_ad_periodFromDates{$_l_index}) & ($_ad_CurrencytoBaseDates{$_l_FoundElement2}=$_ad_periodFromDates{$_l_index})
							//this currency rate co-incides with the start of the period
							$_l_fmCUrrencyRateID:=$_al_CurrencyfmBaseRecordIDS{$_l_FoundElement}
							
							If ($_al_CurrencyFMBasePeriods{$_l_FoundElement}=0)  //this is not stored
								READ WRITE:C146([CURRENCY_RATES:72])
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyFMBaseRecordIDS{$_l_FoundElement})
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
								$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index}
								
								DB_SaveRecord(->[CURRENCY_RATES:72])
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							End if 
							$_l_toCUrrencyRateID:=$_al_CurrencytoBaseRecordIDS{$_l_FoundElement2}
							If ($_al_CurrencyToBasePeriods{$_l_FoundElement2}=0)  //this is not stored
								READ WRITE:C146([CURRENCY_RATES:72])
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyToBaseRecordIDS{$_l_FoundElement2})
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
								$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index}
								
								
								DB_SaveRecord(->[CURRENCY_RATES:72])
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							End if 
						Else   //the date does not coincide
							//so this rate record belongs to previous period
							$_l_fmCUrrencyRateID:=$_al_CurrencyfmBaseRecordIDS{$_l_FoundElement}
							
							If ($_al_CurrencyFMBasePeriods{$_l_FoundElement}=0)
								READ WRITE:C146([CURRENCY_RATES:72])
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencyFMBaseRecordIDS{$_l_FoundElement})
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index-1}
								$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index-1}
								DB_SaveRecord(->[CURRENCY_RATES:72])
								
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							Else 
								
								$_l_fmCUrrencyRateID:=$_al_CurrencyFMBaseRecordIDS{$_l_FoundElement}
							End if 
							$_l_toCUrrencyRateID:=$_al_CurrencytoBaseRecordIDS{$_l_FoundElement2}
							
							If ($_al_CurrencytoBasePeriods{$_l_FoundElement2}=0)
								READ WRITE:C146([CURRENCY_RATES:72])
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_al_CurrencytoBaseRecordIDS{$_l_FoundElement2})
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index-1}
								$_al_CurrencyPeriodID{$_l_FoundElement}:=$_al_periodIDS{$_l_index-1}
								DB_SaveRecord(->[CURRENCY_RATES:72])
								
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							Else 
								$_l_toCUrrencyRateID:=$_al_CurrencytoBaseRecordIDS{$_l_FoundElement2}
								
							End if 
						End if 
						
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_l_fmCUrrencyRateID)
						$_r_RateA:=[CURRENCY_RATES:72]Rate:3
						$_r_RateA:=Round:C94(((100/$_r_RateA)/100); 4)  // so if rate is .4351 this gives 2.29
						
						////have to invert this second rate...
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=$_l_toCUrrencyRateID)
						$_r_RateB:=[CURRENCY_RATES:72]Rate:3
						$_r_Factor:=(100/$_r_RateB)/100
						$_r_Rate:=Round:C94($_r_RateA/$_r_Factor; 4)
						//So lets say A=3 and B=2
						//then 1 of base=3 of A
						//and 2 of B=one of base so 2 of b=3 of A
						//so rate=1.5 and inverse.
						//TRACE
						//$_r_Rate:=($_r_RateB/$_r_Rate)//this is the rate from $1 to $2
						$_t_CurrencyFrom:=$2
						$_t_CurrencyTo:=$1
						
						CREATE RECORD:C68([CURRENCY_RATES:72])
						[CURRENCY_RATES:72]Currency_From:1:=$_t_CurrencyFrom
						[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyTo
						[CURRENCY_RATES:72]Rate:3:=$_r_Rate
						[CURRENCY_RATES:72]Date:4:=$_ad_periodFromDates{$_l_index}
						[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
						DB_SaveRecord(->[CURRENCY_RATES:72])
						AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
						//and the inverse here
						$_r_Rate2:=Round:C94(((100/$_r_Rate)/100); 4)
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_Currencyto; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyFrom; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Rate:3=$_r_Rate2; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_ad_periodFromDates{$_l_index})
						If (Records in selection:C76([CURRENCY_RATES:72])=0)
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_Currencyto; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyFrom; *)
							QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=$_ad_periodFromDates{$_l_index})
							If (Records in selection:C76([CURRENCY_RATES:72])=0)
								CREATE RECORD:C68([CURRENCY_RATES:72])
								[CURRENCY_RATES:72]Currency_From:1:=$_t_Currencyto
								[CURRENCY_RATES:72]Currency_To:2:=$_t_CurrencyFrom
								[CURRENCY_RATES:72]Rate:3:=$_r_Rate2
								[CURRENCY_RATES:72]Date:4:=$_ad_periodFromDates{$_l_index}
								[CURRENCY_RATES:72]x_PeriodID:7:=$_al_periodIDS{$_l_index}
								DB_SaveRecord(->[CURRENCY_RATES:72])
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							Else 
								[CURRENCY_RATES:72]Rate:3:=$_r_Rate2
								DB_SaveRecord(->[CURRENCY_RATES:72])
								AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
							End if 
						End if 
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_t_CurrencyFrom; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$_t_CurrencyTo)
						
						SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_CurrencyDates; [CURRENCY_RATES:72]x_PeriodID:7; $_al_CurrencyPeriodID; [CURRENCY_RATES:72]X_ID:6; $_al_CurrencyRecordID)
					End if 
					
				End for 
				
				
			End if 
			
		Else 
			//there is no rate betwen the currency and the base so we have nothing
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CUR_CheckRate"; $_t_CallingMethodName)
