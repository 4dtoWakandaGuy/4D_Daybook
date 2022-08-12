//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_SaveRateChanges
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
	//ARRAY LONGINT(Cur_al_CurrencyRecIDs;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	C_LONGINT:C283($_l_Index; $2)
	C_REAL:C285($_r_Rate)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_SaveRateChanges")
//this method is called
//from the currency screens
//it will update the records
For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyToCodes))
	If (CUR_abo_CurrencyModified{$_l_Index}=True:C214)
		READ WRITE:C146([CURRENCY_RATES:72])
		If (Cur_al_CurrencyRecIDs{$_l_Index}<0)
			CREATE RECORD:C68([CURRENCY_RATES:72])
			[CURRENCY_RATES:72]Currency_From:1:=$1
			[CURRENCY_RATES:72]Currency_To:2:=CUR_at_CurrencyToCodes{$_l_Index}
			[CURRENCY_RATES:72]Rate:3:=CUR_ar_CurrencyRates{$_l_Index}
			[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
			[CURRENCY_RATES:72]X_ID:6:=Abs:C99(Cur_al_CurrencyRecIDs{$_l_Index})
			[CURRENCY_RATES:72]x_PeriodID:7:=$2
			DB_SaveRecord(->[CURRENCY_RATES:72])
			AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
			//and do the inverse rate
			$_r_Rate:=(100/[CURRENCY_RATES:72]Rate:3)/100
			CREATE RECORD:C68([CURRENCY_RATES:72])
			[CURRENCY_RATES:72]Currency_From:1:=CUR_at_CurrencyToCodes{$_l_Index}
			[CURRENCY_RATES:72]Currency_To:2:=$1
			[CURRENCY_RATES:72]Rate:3:=$_r_Rate
			[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
			[CURRENCY_RATES:72]x_PeriodID:7:=$2
			DB_SaveRecord(->[CURRENCY_RATES:72])
			AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
		Else 
			QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]X_ID:6=Cur_al_CurrencyRecIDs{$_l_Index})
			[CURRENCY_RATES:72]Rate:3:=CUR_ar_CurrencyRates{$_l_Index}
			[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
			DB_SaveRecord(->[CURRENCY_RATES:72])
			AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
			//find the inverse
			QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=CUR_at_CurrencyToCodes{$_l_Index}; *)
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$1; *)
			QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Date:4=CUR_ad_CurrencyDate{$_l_Index})
			If (Records in selection:C76([CURRENCY_RATES:72])=0)
				$_r_Rate:=Round:C94((100/CUR_ar_CurrencyRates{$_l_Index})/100; 4)
				CREATE RECORD:C68([CURRENCY_RATES:72])
				[CURRENCY_RATES:72]Currency_From:1:=CUR_at_CurrencyToCodes{$_l_Index}
				[CURRENCY_RATES:72]Currency_To:2:=$1
				[CURRENCY_RATES:72]Rate:3:=$_r_Rate
				[CURRENCY_RATES:72]Date:4:=CUR_ad_CurrencyDate{$_l_Index}
				[CURRENCY_RATES:72]x_PeriodID:7:=$2
				DB_SaveRecord(->[CURRENCY_RATES:72])
				AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
			Else 
				$_r_Rate:=Round:C94((100/CUR_ar_CurrencyRates{$_l_Index})/100; 4)
				//just align the changed rate
				[CURRENCY_RATES:72]Rate:3:=$_r_Rate
				DB_SaveRecord(->[CURRENCY_RATES:72])
				AA_CheckFileUnlocked(->[CURRENCY_RATES:72]X_ID:6)
			End if 
		End if 
	End if 
End for 
UNLOAD RECORD:C212([CURRENCY_RATES:72])
READ ONLY:C145([CURRENCY_RATES:72])
ERR_MethodTrackerReturn("CUR_SaveRateChanges"; $_t_oldMethodName)