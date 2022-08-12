If (False:C215)
	//object Method Name: Object Name:      [CURRENCIES].Currency_In.oCurRates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_LBCont;0)
	//ARRAY BOOLEAN(CUR_abo_CurrencyModified;0)
	//ARRAY BOOLEAN(CUR_lb_Rates;0)
	//ARRAY DATE(CUR_ad_CurrencyDate;0)
	//ARRAY DATE(CUR_ad_CurrencyPeriodFrom;0)
	//ARRAY LONGINT(CUR_al_CurrencyPeriodIDS;0)
	//ARRAY LONGINT(Cur_al_CurrencyRecIDs;0)
	//ARRAY REAL(CUR_ar_CurrencyRates;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_CurrencyPeriods;0)
	//ARRAY TEXT(CUR_at_CurrencyToCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToNames;0)
	C_BOOLEAN:C305($_bo_Update)
	C_DATE:C307(CUR_D_CurrencyMaxDate)
	C_LONGINT:C283($_l_Column; $_l_CurrencyRateOLD; $_l_CurrencyRow; $_l_event; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_SelectedCurrencyPeriod; $_l_SelectedRateRow; $_l_TableNumber; CUR_l_CurrencyPeriod)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vProcaMod; Xcancel; Xnext)
	C_REAL:C285($_r_RequestedRate)
	C_TEXT:C284($_t_CurrencyCode; $_t_oldMethodName; $_t_VariableName; CUR_t_CurrencyPeriod)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENCIES].Currency_In.oCurRates"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->CUR_lb_Rates; $_t_VariableName)
			
			Case of 
				: ($_l_Column=4)
					CUR_ar_CurrencyRates:=$_l_Row
					vProcaMod:=22
					MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
					If (MOD_l_CurrentModuleAccess#3)
						If (CUR_ar_CurrencyRates>0)
							$_r_RequestedRate:=Num:C11(Request:C163("Enter New Rate"; String:C10(CUR_ar_CurrencyRates{CUR_ar_CurrencyRates})))
							If (OK=1)
								If ($_r_RequestedRate>0)
									$_l_CurrencyRateOLD:=CUR_ar_CurrencyRates{CUR_ar_CurrencyRates}
									CUR_ar_CurrencyRates{CUR_ar_CurrencyRates}:=$_r_RequestedRate
									CUR_abo_CurrencyModified{CUR_ar_CurrencyRates}:=True:C214
									If ($_l_CurrencyRateOLD#$_r_RequestedRate)
										If ($_r_RequestedRate>0)
											$_l_CurrencyRateOLD:=CUR_ar_CurrencyRates{CUR_ar_CurrencyRates}
											$_l_SelectedRateRow:=CUR_ar_CurrencyRates
											$_t_CurrencyCode:=CUR_at_CurrencyToCodes{CUR_ar_CurrencyRates}
											If (CUR_ar_CurrencyRates>1) | (CUR_at_CurrencyPeriods>1)
												Gen_Confirm3("Changes Subsequent Rates"; "Yes"; "No"; "If "+String:C10($_l_CurrencyRateOLD))
												Case of 
													: (Xnext=1)
														//1only if amount is same
														For ($_l_Index; 1; $_l_SelectedRateRow-1)
															If (CUR_ar_CurrencyRates{$_l_Index}=$_l_CurrencyRateOLD) & ($_t_CurrencyCode=CUR_at_CurrencyToCodes{$_l_Index})
																CUR_ar_CurrencyRates{$_l_Index}:=$_r_RequestedRate
																CUR_abo_CurrencyModified{$_l_Index}:=True:C214
															End if 
															
														End for 
														CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
														//```
														$_l_SelectedCurrencyPeriod:=CUR_at_CurrencyPeriods
														For ($_l_Index; ($_l_SelectedCurrencyPeriod-1); 1; -1)
															QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
															QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_al_CurrencyPeriodIDS{$_l_Index})
															If (Records in selection:C76([CURRENCY_RATES:72])>0)
																ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																	$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																	CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																End for 
																$_bo_Update:=False:C215
																For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
																	If (CUR_at_CurrencyCodes{$_l_Index}#[CURRENCIES:71]Currency_Code:1)
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
																		If ($_l_CurrencyRow<0)
																			$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_al_CurrencyPeriodIDS{$_l_Index})
																		End if 
																	End if 
																End for 
																If ($_bo_Update)  //new stuff was created
																	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_al_CurrencyPeriodIDS{$_l_Index})
																	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																	End for 
																End if 
																
																ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
																ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
																
																
																For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyToCodes))
																	If (CUR_ar_CurrencyRates{$_l_Index}=$_l_CurrencyRateOLD) & ($_t_CurrencyCode=CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_ar_CurrencyRates{$_l_Index}:=$_r_RequestedRate
																		CUR_abo_CurrencyModified{$_l_Index}:=True:C214
																	End if 
																	
																End for 
																CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_al_CurrencyPeriodIDS{$_l_Index})
															End if 
														End for 
														CUR_at_CurrencyPeriods:=$_l_SelectedCurrencyPeriod
														If ([CURRENCIES:71]X_ID:3#0)
															If (CUR_at_CurrencyPeriods>0)
																CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
																If (CUR_ad_CurrencyPeriodFrom{CUR_at_CurrencyPeriods}<CUR_D_CurrencyMaxDate)
																	CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{CUR_at_CurrencyPeriods}
																	CUR_l_CurrencyPeriod:=CUR_al_CurrencyPeriodIDS{CUR_at_CurrencyPeriods}
																	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
																	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																	End for 
																	$_bo_Update:=False:C215
																	For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
																		If (CUR_at_CurrencyCodes{$_l_Index}#[CURRENCIES:71]Currency_Code:1)
																			$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
																			If ($_l_CurrencyRow<0)
																				$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_l_CurrencyPeriod)
																			End if 
																		End if 
																	End for 
																	If ($_bo_Update)  //new stuff was created
																		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
																		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																		ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																		For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																			$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																			CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																		End for 
																	End if 
																	
																	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
																	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
																	
																Else 
																	Gen_Alert("Currency rates cannot be set for future dates!")
																End if 
															End if 
														End if 
														
														//``
													: (Xcancel=1)
														
													Else 
														//all
														For ($_l_Index; 1; $_l_SelectedRateRow-1)
															If ($_t_CurrencyCode=CUR_at_CurrencyToCodes{$_l_Index})
																CUR_ar_CurrencyRates{$_l_Index}:=$_r_RequestedRate
																CUR_abo_CurrencyModified{$_l_Index}:=True:C214
															End if 
															
														End for 
														CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
														//```
														$_l_SelectedCurrencyPeriod:=CUR_at_CurrencyPeriods
														For ($_l_Index; ($_l_SelectedCurrencyPeriod-1); 1; -1)
															QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
															QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_al_CurrencyPeriodIDS{$_l_Index})
															If (Records in selection:C76([CURRENCY_RATES:72])>0)
																ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																	$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																	CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																End for 
																$_bo_Update:=False:C215
																For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
																	If (CUR_at_CurrencyCodes{$_l_Index}#[CURRENCIES:71]Currency_Code:1)
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
																		If ($_l_CurrencyRow<0)
																			$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_al_CurrencyPeriodIDS{$_l_Index})
																		End if 
																	End if 
																End for 
																If ($_bo_Update)  //new stuff was created
																	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_al_CurrencyPeriodIDS{$_l_Index})
																	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																	End for 
																End if 
																
																ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
																ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
																
																
																For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyToCodes))
																	If ($_t_CurrencyCode=CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_ar_CurrencyRates{$_l_Index}:=$_r_RequestedRate
																		CUR_abo_CurrencyModified{$_l_Index}:=True:C214
																	End if 
																	
																End for 
																CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_al_CurrencyPeriodIDS{$_l_Index})
															End if 
															
														End for 
														CUR_at_CurrencyPeriods:=$_l_SelectedCurrencyPeriod
														If ([CURRENCIES:71]X_ID:3#0)
															If (CUR_at_CurrencyPeriods>0)
																CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
																If (CUR_ad_CurrencyPeriodFrom{CUR_at_CurrencyPeriods}<CUR_D_CurrencyMaxDate)
																	CUR_t_CurrencyPeriod:=CUR_at_CurrencyPeriods{CUR_at_CurrencyPeriods}
																	CUR_l_CurrencyPeriod:=CUR_al_CurrencyPeriodIDS{CUR_at_CurrencyPeriods}
																	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
																	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																	SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																	ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																	For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																		$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																		CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																	End for 
																	$_bo_Update:=False:C215
																	For ($_l_Index; 1; Size of array:C274(CUR_at_CurrencyCodes))
																		If (CUR_at_CurrencyCodes{$_l_Index}#[CURRENCIES:71]Currency_Code:1)
																			$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyToCodes; CUR_at_CurrencyCodes{$_l_Index})
																			If ($_l_CurrencyRow<0)
																				$_bo_Update:=CUR_CheckRate([CURRENCY_RATES:72]Currency_From:1; [CURRENCY_RATES:72]Currency_To:2; CUR_l_CurrencyPeriod)
																			End if 
																		End if 
																	End for 
																	If ($_bo_Update)  //new stuff was created
																		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=[CURRENCIES:71]Currency_Code:1; *)
																		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
																		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
																		SELECTION TO ARRAY:C260([CURRENCY_RATES:72]Currency_To:2; CUR_at_CurrencyToCodes; [CURRENCY_RATES:72]Rate:3; CUR_ar_CurrencyRates; [CURRENCY_RATES:72]Date:4; CUR_ad_CurrencyDate; [CURRENCY_RATES:72]X_ID:6; Cur_al_CurrencyRecIDs)
																		ARRAY TEXT:C222(CUR_at_CurrencyToNames; Size of array:C274(CUR_ad_CurrencyDate))
																		For ($_l_Index; 1; Size of array:C274(CUR_ad_CurrencyDate))
																			$_l_CurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; CUR_at_CurrencyToCodes{$_l_Index})
																			CUR_at_CurrencyToNames{$_l_Index}:=CUR_at_CurrencyNames{$_l_CurrencyRow}
																		End for 
																	End if 
																	
																	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; 0)
																	ARRAY BOOLEAN:C223(CUR_abo_CurrencyModified; Size of array:C274(CUR_ad_CurrencyDate))
																	
																Else 
																	Gen_Alert("Currency rates cannot be set for future dates!")
																End if 
															End if 
														End if 
														
												End case 
												
											End if 
											
										End if 
										
									End if 
								End if 
								
							End if 
						End if 
					End if 
			End case 
			
		Else 
			LISTBOX SELECT ROW:C912(CON_lb_LBCont; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CURRENCIES].Currency_In.oCurRates"; $_t_oldMethodName)
