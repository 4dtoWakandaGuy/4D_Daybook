//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrConv_Ask
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_TempDates; 0)
	//ARRAY DATE(aPrevEventDate;0)
	//ARRAY LONGINT(aLinkedValue;0)
	//ARRAY LONGINT(aPre;0)
	//ARRAY LONGINT(aPreConversionRateID;0)
	//ARRAY LONGINT(aPrevTypeID;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(aPrevEvent2;0)
	//ARRAY TEXT(aPrevTypeC;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307($_d_Qdate; $_d_StartDate; SRCH_d_EntryDateFrom)
	C_LONGINT:C283($_l_CountParameters; $_l_CurrencyRateID; $_l_CurrentFromRow; $_l_CurrentToRow; $_l_Index; $_l_OK; $_l_WindowReferenceRow; $1; ch0; ch1; ch2)
	C_LONGINT:C283(r0; r1; WIN_l_CurrentWinRef; WS_l_CurrencyLinked)
	C_OBJECT:C1216($_obj_FormData; $_obj_periods)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; vCallCode; WS_t_CurrencyFIXED; WS_t_EuroCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrConv_Ask")
//CurrConv_Ask

$_l_CountParameters:=Count parameters:C259
WS_l_CurrencyLinked:=0

READ ONLY:C145([CURRENCIES:71])
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
	If (Character code:C91(ACC_t_CurrencyCode)=64)
		ACC_t_CurrencyCode:=""
	End if 
	//vCallCode:=""
	//$_obj_FormData.RateType:="*Any*"
	Open_AnyTypeWindow(170; 395; 5; "Currency Conversion Options")
	$_obj_FormData:=New object:C1471("RateType"; "*Any*"; "CurrencyCode"; ""; "FromCurrencyCode"; ACC_t_CurrencyCode)
	
	DIALOG:C40([ACCOUNT_BALANCES:34]; "dCurrConv"; $_obj_FormData)
	
	$_l_OK:=Num:C11($_obj_FormData.ExitFunction="Accept")
	OK:=1
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If ($_l_OK=1)
		If (($_obj_FormData.Convert=1) & ($_obj_FormData.CurrencyCode=""))
			$_obj_FormData.DoNotConvert:=1
			$_obj_FormData.Convert:=0
		End if 
		If ($_obj_FormData.Convert=1)
			Case of 
				: ($_obj_FormData.CurrentRate=1)
					If ($_obj_FormData.FromCurrencyCode#"")
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_obj_FormData.FromCurrencyCode)
						If ([CURRENCIES:71]Fixed_Convertion_Rate:4)
							//we dont look for conversion rates
							$_l_CurrencyRateID:=[CURRENCIES:71]Parent_Conversion_RateID:6
							QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$_l_CurrencyRateID)
							WS_l_CurrencyLinked:=1
							WS_t_CurrencyFIXED:=[CURRENCIES:71]Currency_Code:1
							WS_t_EuroCurrency:=[CURRENCIES:71]EURO_DESIGNATION:7
							CurrRate_MostRecent(WS_t_CurrencyFIXED; $_obj_FormData.CurrencyCode; !00-00-00!; $_obj_FormData.RateType)
						Else 
							CurrRate_MostRecent(ACC_t_CurrencyCode; $_obj_FormData.CurrencyCode; !00-00-00!; $_obj_FormData.RateType)
						End if 
					Else 
						//Load array of current rates
						MESSAGES OFF:C175
						//    SEARCH([CURRENCIES];[CURRENCIES]Currency Code#vCallCode)
						ALL RECORDS:C47([CURRENCIES:71])
						ARRAY TEXT:C222(aPrevTypeC; Records in selection:C76([CURRENCIES:71]))
						ARRAY LONGINT:C221(aPrevTypeID; Records in selection:C76([CURRENCIES:71]))
						ARRAY LONGINT:C221(aPreConversionRateID; Records in selection:C76([CURRENCIES:71]))
						SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; aPrevTypeC; [CURRENCIES:71]X_ID:3; aPrevTypeID; [CURRENCIES:71]Parent_Conversion_RateID:6; aPreConversionRateID)
						If ($_l_CountParameters=1)  //if not Acc Balances
							Case of 
								: ($1=37)
									DISTINCT VALUES:C339([PURCHASE_INVOICES:37]Currency_Code:23; SVS_at_PreviewNote)
								: ($1=39)
									DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; SVS_at_PreviewNote)
								Else 
									DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; SVS_at_PreviewNote)
							End case 
						Else 
							DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; SVS_at_PreviewNote)
						End if 
						ARRAY REAL:C219(GEN_ar_Value; Records in selection:C76([CURRENCIES:71]))
						ARRAY LONGINT:C221(aLinkedValue; Records in selection:C76([CURRENCIES:71]))
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_obj_FormData.CurrencyCode; *)
						QUERY:C277([CURRENCY_RATES:72];  | ; [CURRENCY_RATES:72]Currency_To:2=$_obj_FormData.CurrencyCode)
						If (($_obj_FormData.RateType#"") & ($_obj_FormData.RateType#"*Any*"))
							QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Rate_Type:5=$_obj_FormData.RateType)
						End if 
						ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
						MESSAGES ON:C181
						FIRST RECORD:C50([CURRENCY_RATES:72])
						SRCH_d_EntryDateFrom:=[CURRENCY_RATES:72]Date:4
						$_l_Index:=0
						While ((Not:C34(End selection:C36([CURRENCY_RATES:72]))) & ($_l_Index<(Size of array:C274(aPrevTypeC)-1)))
							If ([CURRENCY_RATES:72]Currency_From:1=$_obj_FormData.CurrencyCode)
								$_l_CurrentToRow:=Find in array:C230(aPrevTypeC; [CURRENCY_RATES:72]Currency_To:2)
								If ($_l_CurrentToRow>0)
									If (GEN_ar_Value{$_l_CurrentToRow}=0)
										$_l_Index:=$_l_Index+1
										GEN_ar_Value{$_l_CurrentToRow}:=Round:C94((1/[CURRENCY_RATES:72]Rate:3); 8)
									End if 
								End if 
							Else 
								$_l_CurrentFromRow:=Find in array:C230(aPrevTypeC; [CURRENCY_RATES:72]Currency_From:1)
								If ($_l_CurrentFromRow>0)
									If (GEN_ar_Value{$_l_CurrentFromRow}=0)
										$_l_Index:=$_l_Index+1
										GEN_ar_Value{$_l_CurrentFromRow}:=Round:C94([CURRENCY_RATES:72]Rate:3; 8)
									End if 
								End if 
							End if 
							NEXT RECORD:C51([CURRENCY_RATES:72])
						End while 
						CurrConv_ChkNoRate
					End if 
				: ($_obj_FormData.AverageRate=1)
					ALL RECORDS:C47([CURRENCIES:71])
					
				: ($_obj_FormData.PostingDateRate=1)
					
					//Load all rates into big arrays
					//Find the start date for the report
					MESSAGES OFF:C175
					If ($_l_CountParameters=1)  //if not Acc Balances
						Case of 
							: ($1=37)
								ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
								$_d_StartDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
								DISTINCT VALUES:C339([PURCHASE_INVOICES:37]Currency_Code:23; aPrevTypeC)
							: ($1=39)
								ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Date:4; >)
								$_d_StartDate:=[INVOICES:39]Invoice_Date:4
								DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; aPrevTypeC)
							Else 
								$_d_StartDate:=!00-00-00!
						End case 
					Else 
						If (ACC_t_PeriodFrom#"")
							$_obj_periods:=ds:C1482.PERIODS.query("Period_Code >=:1 or Period_Code <=:2"; ACC_t_PeriodFrom; ACC_t_PeriodTo).orderBy("Period_Code asc")
							If ($_obj_periods.length>0)
								$_d_StartDate:=$_obj_periods[0].From_Date
								//QUERY([PERIODS]; [PERIODS]Period_Code>=ACC_t_PeriodFrom; *)
								//QUERY([PERIODS]; [PERIODS]Period_Code<=ACC_t_PeriodTo)
								//ORDER BY([PERIODS]; [PERIODS]Period_Code; >)
								//FIRST RECORD([PERIODS])
								//$_d_StartDate:=[PERIODS]From_Date
							Else 
								$_d_StartDate:=!00-00-00!
							End if 
						Else 
							$_d_StartDate:=!00-00-00!
						End if 
						
						//Find the Currency Rates, other than that being converted to, that have been used
						DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; aPrevTypeC)
					End if 
					ARRAY LONGINT:C221(aPrevTypeID; Size of array:C274(aPrevTypeC))
					ARRAY LONGINT:C221(aPreConversionRateID; Size of array:C274(aPrevTypeC))
					CREATE EMPTY SET:C140([CURRENCY_RATES:72]; "Rates")
					$_l_Index:=1
					While ($_l_Index<=Size of array:C274(aPrevTypeC))
						If (aPrevTypeC{$_l_Index}#"")  //(aPrevTypeC{$_l_Index}#vCallCode) &
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=aPrevTypeC{$_l_Index}; *)
							QUERY:C277([CURRENCY_RATES:72];  | ; [CURRENCY_RATES:72]Currency_To:2=aPrevTypeC{$_l_Index})
							If (($_obj_FormData.RateType#"") & ($_obj_FormData.RateType#"*Any*"))
								QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Rate_Type:5=$_obj_FormData.RateType)
							End if 
							CREATE SET:C116([CURRENCY_RATES:72]; "Extra")
							UNION:C120("Rates"; "Extra"; "Rates")
						End if 
						$_l_Index:=$_l_Index+1
					End while 
					// SEARCH([CURRENCIES];[CURRENCIES]Currency Code#vCallCode)
					//NG apparently a fault in this
					
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$_obj_FormData.CurencyCode; *)
					QUERY:C277([CURRENCY_RATES:72];  | ; [CURRENCY_RATES:72]Currency_To:2=$_obj_FormData.CurencyCode)
					If (($_obj_FormData.RateType#"") & ($_obj_FormData.RateType#"*Any*"))
						QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Rate_Type:5=$_obj_FormData.RateType)
					End if 
					SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_TempDates)
					If ($_d_StartDate#!00-00-00!)
						SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Date:4; $_ad_TempDates)
						SORT ARRAY:C229($_ad_TempDates; >)
						$_d_Qdate:=$_d_StartDate
						For ($_l_Index; 1; Size of array:C274($_ad_TempDates))
							
							Case of 
								: ($_ad_TempDates{$_l_Index}>$_d_StartDate)  //this is the effective rate at the start
									
									$_d_Qdate:=$_ad_TempDates{$_l_Index-1}
									//if $_l_Index=1 this will be 00/00/00!!-which means no rate known!!
									$_l_Index:=9999999
								: ($_ad_TempDates{$_l_Index}=$_d_StartDate)  //that is the effective rate at the start
									
									$_d_Qdate:=$_ad_TempDates{$_l_Index}
									$_l_Index:=9999999
							End case 
						End for 
						If ($_d_Qdate=!00-00-00!)
							// ALERT("There is no conversion rate effective at "+String($_d_StartDate))
							Gen_Alert("There is no conversion rate effective at "+String:C10($_d_StartDate))
							$_d_Qdate:=$_d_StartDate
						End if 
						QUERY SELECTION:C341([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4>=$_d_Qdate)
					End if 
					CREATE SET:C116([CURRENCY_RATES:72]; "Extra")
					INTERSECTION:C121("Rates"; "Extra"; "Rates")
					USE SET:C118("Rates")
					ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; >)
					MESSAGES ON:C181
					
					ARRAY TEXT:C222(SVS_at_PreviewEvent; Records in selection:C76([CURRENCY_RATES:72]))
					ARRAY TEXT:C222(aPrevEvent2; Records in selection:C76([CURRENCY_RATES:72]))
					ARRAY DATE:C224(aPrevEventDate; Records in selection:C76([CURRENCY_RATES:72]))
					ARRAY REAL:C219(GEN_ar_Value; Records in selection:C76([CURRENCY_RATES:72]))
					
					FIRST RECORD:C50([CURRENCY_RATES:72])
					SRCH_d_EntryDateFrom:=[CURRENCY_RATES:72]Date:4
					$_l_Index:=1
					While (Not:C34(End selection:C36([CURRENCY_RATES:72])))
						If ([CURRENCY_RATES:72]Currency_From:1=vCallCode)
							SVS_at_PreviewEvent{$_l_Index}:=Date_YYMMDD([CURRENCY_RATES:72]Date:4)+[CURRENCY_RATES:72]Currency_To:2
							aPrevEvent2{$_l_Index}:=Date_YYYYMMDD([CURRENCY_RATES:72]Date:4)+[CURRENCY_RATES:72]Currency_To:2
							
							aPrevEventDate{$_l_Index}:=[CURRENCY_RATES:72]Date:4
							GEN_ar_Value{$_l_Index}:=Round:C94((1/[CURRENCY_RATES:72]Rate:3); 8)
						Else 
							SVS_at_PreviewEvent{$_l_Index}:=Date_YYMMDD([CURRENCY_RATES:72]Date:4)+[CURRENCY_RATES:72]Currency_From:1
							aPrevEvent2{$_l_Index}:=Date_YYYYMMDD([CURRENCY_RATES:72]Date:4)+[CURRENCY_RATES:72]Currency_From:1
							
							
							aPrevEventDate{$_l_Index}:=[CURRENCY_RATES:72]Date:4
							GEN_ar_Value{$_l_Index}:=Round:C94([CURRENCY_RATES:72]Rate:3; 8)
						End if 
						$_l_Index:=$_l_Index+1
						NEXT RECORD:C51([CURRENCY_RATES:72])
					End while 
					
					CLEAR SET:C117("Rates")
					
			End case 
		End if 
	End if 
Else 
	r0:=1
	r1:=0
	ch0:=1
	ch1:=0
	ch2:=0
	vCallCode:=""
End if 
ERR_MethodTrackerReturn("CurrConv_Ask"; $_t_oldMethodName)
