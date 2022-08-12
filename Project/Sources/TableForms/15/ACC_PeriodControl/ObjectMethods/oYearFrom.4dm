If (False:C215)
	//object Name: [USER]ACC_PeriodControl.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_NominalLedgerClosed; 0)
	ARRAY BOOLEAN:C223($_abo_PurchaseLedgerClosed; 0)
	ARRAY BOOLEAN:C223($_abo_SalesLedgerClosed; 0)
	//ARRAY BOOLEAN(ACC_abo_PeriodMOD;0)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_ad_FinancialYearto;0)
	//ARRAY DATE(ACC_AD_PeriodEndDate;0)
	//ARRAY DATE(ACC_AD_PeriodStartDate;0)
	//ARRAY INTEGER(ACC_Ai_Period_GLOpen;0)
	//ARRAY INTEGER(ACC_Ai_Period_PLOpen;0)
	//ARRAY INTEGER(ACC_Ai_Period_SLOpen;0)
	//ARRAY LONGINT(ACC_Al_PeriodYearID;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_PeriodNames;0)
	//ARRAY TEXT(ACC_at_YearIdents;0)
	C_DATE:C307(Acc_D_SelectedYearEndDate; Acc_D_SelectedYearStartDate)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Acc_D_SelectedYearEndDate>!00-00-00!)
			If (Acc_D_SelectedYearStartDate>Acc_D_SelectedYearEndDate)
				Gen_Alert("The year start must precede the year end")
				Acc_D_SelectedYearStartDate:=!00-00-00!
				
			End if 
		End if 
		If (Acc_D_SelectedYearStartDate>!00-00-00!)
			For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
				If (Acc_D_SelectedYearStartDate>=ACC_ad_FinancialYearFrom{$_l_Index}) & (Acc_D_SelectedYearStartDate<ACC_ad_FinancialYearto{$_l_Index})
					Gen_Alert("Sorry your financial years may not overlap. You already have a year "+ACC_at_YearIdents{$_l_Index})
					Acc_D_SelectedYearStartDate:=!00-00-00!
					$_l_Index:=9999999
					
				End if 
				
			End for 
			If (Acc_D_SelectedYearStartDate>!00-00-00!) & (Acc_D_SelectedYearEndDate>!00-00-00!)
				READ ONLY:C145([PERIODS:33])
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Acc_D_SelectedYearStartDate; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=Acc_D_SelectedYearEndDate)
				SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes; [PERIODS:33]Period_Name:2; ACC_at_PeriodNames; [PERIODS:33]From_Date:3; ACC_AD_PeriodStartDate; [PERIODS:33]To_Date:4; ACC_AD_PeriodEndDate; [PERIODS:33]NL_Closed:5; $_abo_NominalLedgerClosed; [PERIODS:33]SL_Closed:7; $_abo_SalesLedgerClosed; [PERIODS:33]PL_Closed:8; $_abo_PurchaseLedgerClosed; [PERIODS:33]X_FinancialYearID:11; ACC_Al_PeriodYearID)
				UNLOAD RECORD:C212([PERIODS:33])
				ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; 0)
				ARRAY INTEGER:C220(ACC_Ai_Period_SLOpen; 0)
				ARRAY INTEGER:C220(ACC_Ai_Period_PLOpen; 0)
				ARRAY INTEGER:C220(ACC_Ai_Period_GLOpen; 0)
				$_l_SizeofArray:=Size of array:C274(ACC_at_PeriodCodes)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; $_l_SizeofArray)
				ARRAY INTEGER:C220(ACC_Ai_Period_SLOpen; $_l_SizeofArray)
				ARRAY INTEGER:C220(ACC_Ai_Period_PLOpen; $_l_SizeofArray)
				ARRAY INTEGER:C220(ACC_Ai_Period_GLOpen; $_l_SizeofArray)
				For ($_l_Index; 1; $_l_SizeofArray)
					ACC_Ai_Period_SLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_SalesLedgerClosed{$_l_Index}))-1)
					ACC_Ai_Period_PLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_PurchaseLedgerClosed{$_l_Index}))-1)
					ACC_Ai_Period_GLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_NominalLedgerClosed{$_l_Index}))-1)
				End for 
				SORT ARRAY:C229(ACC_AD_PeriodStartDate; ACC_AD_PeriodEndDate; ACC_at_PeriodCodes; ACC_at_PeriodNames; ACC_Ai_Period_SLOpen; ACC_Ai_Period_PLOpen; ACC_Ai_Period_GLOpen; ACC_Al_PeriodYearID; ACC_abo_PeriodMOD)
				
				
			Else 
				GOTO OBJECT:C206(Acc_D_SelectedYearEndDate)
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.Variable8"; $_t_oldMethodName)
