If (False:C215)
	//object Name: [USER]ACC_PeriodControl.Variable14
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
	//ARRAY DATE(ACC_AD_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	//ARRAY DATE(ACC_AD_PeriodEndDate;0)
	//ARRAY DATE(ACC_AD_PeriodStartDate;0)
	//ARRAY INTEGER(ACC_Ai_Period_GLOpen;0)
	//ARRAY INTEGER(ACC_Ai_Period_PLOpen;0)
	//ARRAY INTEGER(ACC_Ai_Period_SLOpen;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	//ARRAY LONGINT(ACC_Al_PeriodYearID;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_PeriodNames;0)
	//ARRAY TEXT(ACC_at_Yearidents;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_PeriodOpen; ACC_bo_YearOpen)
	C_DATE:C307(ACC_D_CURRENTOPENYEAREND; ACC_D_CURRENTOPENYEARSTART; ACC_D_SelectedReference; Acc_D_SelectedYearEndDate; Acc_D_SelectedYearStartDate)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; ACC_l_PerReadWrite; ACC_l_YearID; BAddYear; BCloseFinancialYear; BCreatePeriods; BCreatePeriodsd)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.Variable14"; Form event code:C388)

If (ACC_D_SelectedReference>!00-00-00!)
	If (ACC_D_SelectedReference=!1980-01-01!)  //For creating a new one
		If (Acc_D_SelectedYearStartDate>!00-00-00!) & (Acc_D_SelectedYearEndDate>!00-00-00!)
			$_l_SizeofArray:=Size of array:C274(ACC_AD_FinancialYearFrom)+1
			INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; $_l_SizeofArray)
			INSERT IN ARRAY:C227(ACC_AD_FinancialYearTo; $_l_SizeofArray)
			INSERT IN ARRAY:C227(ACC_at_Yearidents; $_l_SizeofArray)
			INSERT IN ARRAY:C227(ACC_Al_FinancialYearID; $_l_SizeofArray)
			ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
			ACC_ad_FinancialYearFrom{$_l_SizeofArray}:=Acc_D_SelectedYearStartDate
			ACC_AD_FinancialYearTo{$_l_SizeofArray}:=Acc_D_SelectedYearEndDate
			ACC_at_Yearidents{$_l_SizeofArray}:=String:C10(ACC_ad_FinancialYearFrom{$_l_SizeofArray}; 4)+"-"+String:C10(ACC_ad_FinancialYearTo{$_l_SizeofArray}; 4)
			ACC_Al_FinancialYearID{$_l_SizeofArray}:=ACC_l_YearID
			SORT ARRAY:C229(ACC_ad_FinancialYearFrom; ACC_AD_FinancialYearTo; ACC_Al_FinancialYearID; ACC_at_Yearidents)
			//SaVE THE BLOB
			ACC_LoadFinancialYears
			ACC_D_SelectedReference:=ACC_ad_FinancialYearFrom{Find in array:C230(ACC_Al_FinancialYearID; ACC_l_YearID)}
			
			$_bo_Continue:=True:C214
		Else 
			
			Gen_Alert("Enter start and end date of year first"; "OK")
			
			$_bo_Continue:=False:C215
			
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		Period_Create(Acc_D_SelectedYearStartDate)
		READ ONLY:C145([PERIODS:33])
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Acc_D_SelectedYearStartDate; *)
		QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=Acc_D_SelectedYearEndDate; *)
		QUERY SELECTION:C341([PERIODS:33]; [PERIODS:33]X_FinancialYearID:11=0)
		If (Records in selection:C76([PERIODS:33])>0)
			REDUCE SELECTION:C351([PERIODS:33]; 0)
			READ WRITE:C146([PERIODS:33])
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Acc_D_SelectedYearStartDate; *)
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=Acc_D_SelectedYearEndDate; *)
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]X_FinancialYearID:11=0)
			For ($_l_Index; 1; Records in selection:C76([PERIODS:33]))
				[PERIODS:33]X_FinancialYearID:11:=ACC_l_YearID
				SAVE RECORD:C53([PERIODS:33])
				NEXT RECORD:C51([PERIODS:33])
			End for 
			UNLOAD RECORD:C212([PERIODS:33])
			READ ONLY:C145([PERIODS:33])
		End if 
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}; *)
		QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=ACC_ad_FinancialYearTo{ACC_at_YearIdents})
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
		$_bo_PeriodOpen:=False:C215
		For ($_l_Index; 1; $_l_SizeofArray)
			If (Not:C34($_abo_SalesLedgerClosed{$_l_Index})) | (Not:C34($_abo_PurchaseLedgerClosed{$_l_Index})) | (Not:C34($_abo_NominalLedgerClosed{$_l_Index}))
				$_bo_PeriodOpen:=True:C214
			End if 
			ACC_Ai_Period_SLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_SalesLedgerClosed{$_l_Index}))-1)
			ACC_Ai_Period_PLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_PurchaseLedgerClosed{$_l_Index}))-1)
			ACC_Ai_Period_GLOpen{$_l_Index}:=Abs:C99((Num:C11($_abo_NominalLedgerClosed{$_l_Index}))-1)
		End for 
		
		
		SORT ARRAY:C229(ACC_AD_PeriodStartDate; ACC_AD_PeriodEndDate; ACC_at_PeriodCodes; ACC_at_PeriodNames; ACC_Ai_Period_SLOpen; ACC_Ai_Period_PLOpen; ACC_Ai_Period_GLOpen; ACC_Al_PeriodYearID; ACC_abo_PeriodMOD)
		//we ignore the $ arrays
		ACC_at_YearIdents:=Find in array:C230(ACC_Al_FinancialYearID; ACC_l_YearID)
		OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearStartDate; False:C215)
		OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearEndDate; False:C215)
		//_O_DISABLE BUTTON(BCloseFinancialYear)
		OBJECT SET ENABLED:C1123(BCloseFinancialYear; False:C215)
		
		Acc_D_SelectedYearStartDate:=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}
		Acc_D_SelectedYearEndDate:=ACC_ad_FinancialYearTo{ACC_at_YearIdents}
		ACC_bo_YearOpen:=False:C215
		If ($_bo_PeriodOpen)
			If (Acc_D_SelectedYearEndDate<=ACC_D_CURRENTOPENYEAREND)
				
				If (Current date:C33>ACC_D_CURRENTOPENYEAREND)
					//it is not already closed
					//it is the current year as defined in the prefs or a previous year
					//and we are currently past the date(can't close the CURRENT year until the year is finished)
					OBJECT SET ENABLED:C1123(BCloseFinancialYear; True:C214)
					
					//_O_ENABLE BUTTON(BCloseFinancialYear)
				End if 
				
			End if 
		Else 
			
		End if   // nothing selected
		If (ACC_D_CURRENTOPENYEARSTART<=Acc_D_SelectedYearStartDate)
			OBJECT SET ENABLED:C1123(BCreatePeriodsd; True:C214)
			OBJECT SET ENABLED:C1123(BCreatePeriods; True:C214)
			//Can modify periods
			ACC_bo_YearOpen:=True:C214
		End if 
		
		If (ACC_l_PerReadWrite=0)
			OBJECT SET ENABLED:C1123(BAddYear; False:C215)
			OBJECT SET ENABLED:C1123(BCloseFinancialYear; False:C215)
			OBJECT SET ENABLED:C1123(BCreatePeriodsd; False:C215)
			OBJECT SET ENABLED:C1123(BCreatePeriods; False:C215)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:ACC_PeriodControl,BCreatePeriods"; $_t_oldMethodName)
