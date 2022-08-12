//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_BalConv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(aPrevEvent2)
	//C_UNKNOWN(aPrevTypeC)
	//ARRAY DATE(aPrevEventDate;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Date; $_d_DateC; $_d_PreviousEventDate; SRCH_d_EntryDateFrom)
	C_LONGINT:C283($_l_ArrayPosition; $_l_Index; ch0; ch1; ch2; r1)
	C_REAL:C285($_r_Total; $Bal; vBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_DateString; $_t_EndDateString; $_t_oldMethodName; ACC_t_CurrencyCode; vCallCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_BalConv")
//Calc_BalConv

If ((r1=1) & (vCallCode#""))
	Case of 
			
		: (ch0=1)
			//if only one currency to check against
			If (ACC_t_CurrencyCode#"")
				Calc_BalArr
				If ((ACC_t_CurrencyCode#vCallCode) & (Records in selection:C76([CURRENCY_RATES:72])>0))
					//Find the currency
					
					If ([CURRENCY_RATES:72]Currency_From:1=ACC_t_CurrencyCode)
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_t_CurrencyCode)
						If (Not:C34([CURRENCIES:71]Fixed_Convertion_Rate:4))
							vBalance:=Gen_Round((vBalance*[CURRENCY_RATES:72]Rate:3); 2; 2)
						Else 
							// QUERY
							// vBalance:=WS_LinkedCurrencyConversion(
						End if 
						
					Else 
						vBalance:=Gen_Round((vBalance/[CURRENCY_RATES:72]Rate:3); 2; 2)
					End if 
				End if 
			Else 
				//or if they have to all be checked
				$Bal:=0
				For ($_l_Index; 1; Size of array:C274(aPrevTypeC))
					$_l_ArrayPosition:=Find in array:C230(SVS_at_PreviewNote; aPrevTypeC{$_l_Index})
					If ($_l_ArrayPosition>0)
						USE SET:C118("Extra3")
						If (aPrevTypeC{$_l_Index}=<>SYS_t_BaseCurrency)
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=aPrevTypeC{$_l_Index}; *)
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
						Else 
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=aPrevTypeC{$_l_Index})
						End if 
						If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
							Calc_BalArr
							If (aPrevTypeC{$_l_Index}#vCallCode)
								vBalance:=Gen_Round((vBalance*GEN_ar_Value{$_l_Index}); 2; 2)
							End if 
							$Bal:=Gen_Round(($Bal+vBalance); 2; 2)
						End if 
					End if 
				End for 
				vBalance:=$Bal
			End if 
			
		: (ch1=1)
			vBalance:=0
			
		: (ch2=1)
			vBalance:=0
			FIRST RECORD:C50([ACCOUNT_BALANCES:34])
			While (Not:C34(End selection:C36([ACCOUNT_BALANCES:34])))
				If (([ACCOUNT_BALANCES:34]Currency_Code:6#vCallCode) & (Not:C34(([ACCOUNT_BALANCES:34]Currency_Code:6="") & (vCallCode=<>SYS_t_BaseCurrency))))
					If ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
					Else 
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
					End if 
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6)
					
					FIRST RECORD:C50([TRANSACTIONS:29])
					While (Not:C34(End selection:C36([TRANSACTIONS:29])))
						If ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
							$_r_Total:=[TRANSACTIONS:29]Tax_Amount:16
						Else 
							$_r_Total:=[TRANSACTIONS:29]Amount:6
						End if 
						If ($_r_Total#0)
							$_d_Date:=[TRANSACTIONS:29]Trans_Date:5
							If ($_d_Date<!1990-01-01!)
								$_d_Date:=<>DB_d_CurrentDate
							End if 
							$_t_DateString:=Date_YYYYMMDD($_d_Date)
							$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+[TRANSACTIONS:29]Currency_Code:22)
							If ($_l_ArrayPosition>0)
								vBalance:=Gen_Round((vBalance+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
							Else 
								$_l_Index:=1
								If (Size of array:C274(aPrevEvent2)>0)
									//  $_d_PreviousEventDate may not be correct!00/00/00!!00/00/00!
									//$_d_PreviousEventDate:=Substring(SVS_at_PreviewEvent{1};1;6)
									$_d_PreviousEventDate:=aPrevEventDate{1}
									$_d_DateC:=$_d_Date-$_l_Index
									If ($_d_DateC<$_d_PreviousEventDate)
										$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; "@"+[TRANSACTIONS:29]Currency_Code:22)
										If ($_l_ArrayPosition>0)
											vBalance:=Gen_Round((vBalance+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
										Else 
											vBalance:=Gen_Round((vBalance+$_r_Total); 2; 2)
										End if 
									Else 
										While (($_d_DateC>=$_d_PreviousEventDate) & ($_l_ArrayPosition=-1))
											IDLE:C311  // 03/04/03 pb
											$_d_DateC:=$_d_Date-$_l_Index
											$_t_DateString:=Date_YYYYMMDD($_d_DateC)
											$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+[TRANSACTIONS:29]Currency_Code:22)
											$_l_Index:=$_l_Index+1
										End while 
										If ($_l_ArrayPosition>0)
											vBalance:=Gen_Round((vBalance+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
										Else 
											$_l_Index:=1
											If ($_d_Date<SRCH_d_EntryDateFrom)
												$_d_Date:=SRCH_d_EntryDateFrom
											End if 
											$_t_EndDateString:=Date_YYYYMMDD(<>DB_d_CurrentDate)
											While (($_t_DateString<=$_t_EndDateString) & ($_l_ArrayPosition=-1))
												IDLE:C311  // 03/04/03 pb
												$_d_DateC:=$_d_Date+$_l_Index
												$_t_DateString:=Date_YYYYMMDD($_d_DateC)
												$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+[TRANSACTIONS:29]Currency_Code:22)
												$_l_Index:=$_l_Index+1
											End while 
											If ($_l_ArrayPosition>0)
												vBalance:=Gen_Round((vBalance+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
											Else 
												vBalance:=Gen_Round((vBalance+$_r_Total); 2; 2)
											End if 
										End if 
									End if 
								Else 
									vBalance:=Gen_Round((vBalance+$_r_Total); 2; 2)
								End if 
								
							End if 
						End if 
						NEXT RECORD:C51([TRANSACTIONS:29])
					End while 
					
				Else 
					vBalance:=vBalance+[ACCOUNT_BALANCES:34]Balance:3
				End if 
				NEXT RECORD:C51([ACCOUNT_BALANCES:34])
			End while 
			
	End case 
End if 
ERR_MethodTrackerReturn("Calc_BalConv"; $_t_oldMethodName)
