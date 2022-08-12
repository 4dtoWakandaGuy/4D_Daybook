If (False:C215)
	//object Name: [USER]ACC_PeriodControl.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2012 15:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_PeriodGLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodMOD;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodPLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodSLOpen;0)
	//ARRAY DATE(ACC_AD_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	//ARRAY DATE(ACC_AD_PeriodEndDate;0)
	//ARRAY DATE(ACC_AD_PeriodStartDate;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	//ARRAY LONGINT(ACC_Al_PeriodYearID;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_PeriodNames;0)
	//ARRAY TEXT(ACC_at_Yearidents;0)
	C_BOOLEAN:C305($_bo_Update)
	C_DATE:C307(ACC_D_SelectedReference; Acc_D_SelectedYearEndDate; Acc_D_SelectedYearStartDate)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_SizeofArray; $_l_YearFromRow; ACC_l_YearID; BCloseFinancialYear; BCreatePeriods; BCreatePeriodsd)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ACC_PeriodControl.Variable2"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
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
				Else 
					If (Acc_D_SelectedYearStartDate>!00-00-00!) | (Acc_D_SelectedYearEndDate>!00-00-00!)
						Gen_Confirm("Discard added year?"; "Yes"; "No")
						If (OK=1)
							ACC_D_SelectedReference:=!00-00-00!
						Else 
							OK:=1
						End if 
					Else 
						ACC_D_SelectedReference:=!00-00-00!
					End if 
					
				End if 
			Else 
				//modifying an exsting year
				//Any mods made?
				$_bo_Update:=False:C215
				$_l_YearFromRow:=Find in array:C230(ACC_ad_FinancialYearFrom; ACC_D_SelectedReference)
				For ($_l_Index; 1; Size of array:C274(ACC_abo_PeriodMOD))
					If (ACC_abo_PeriodMOD{$_l_Index})
						If ($_bo_Update=False:C215)
							Gen_Confirm("Save changes to "+ACC_at_Yearidents{$_l_YearFromRow}+"?"; "Yes"; "No")
							If (OK=0)
								$_l_Index:=Size of array:C274(ACC_abo_PeriodMOD)+1
								OK:=1
							Else 
								$_bo_Update:=True:C214
							End if 
						End if 
						If ($_bo_Update)
							READ WRITE:C146([PERIODS:33])
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_PeriodCodes{$_l_Index})
							//these are the only bits thsat csn be modified directly on this screen
							[PERIODS:33]PL_Closed:8:=(Not:C34(ACC_abo_PeriodPLOpen{$_l_Index}))
							
							[PERIODS:33]NL_Closed:5:=(Not:C34(ACC_abo_PeriodGLOpen{$_l_Index}))
							[PERIODS:33]SL_Closed:7:=(Not:C34(ACC_abo_PeriodSLOpen{$_l_Index}))
							[PERIODS:33]X_FinancialYearID:11:=((ACC_Al_FinancialYearID{$_l_YearFromRow}))
							SAVE RECORD:C53([PERIODS:33])
							UNLOAD RECORD:C212([PERIODS:33])
							
						End if 
					Else 
						If (ACC_Al_PeriodYearID{$_l_Index}=0)
							READ WRITE:C146([PERIODS:33])
							QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_PeriodCodes{$_l_Index})
							[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_YearFromRow}
							SAVE RECORD:C53([PERIODS:33])
							UNLOAD RECORD:C212([PERIODS:33])
							
						End if 
						
					End if 
					
				End for 
				ACC_D_SelectedReference:=!00-00-00!
			End if 
		End if   // No year loaded
		//Now set the Variables
		ARRAY TEXT:C222(ACC_at_PeriodCodes; 0)
		ARRAY TEXT:C222(ACC_at_PeriodNames; 0)
		ARRAY DATE:C224(ACC_AD_PeriodStartDate; 0)
		ARRAY DATE:C224(ACC_AD_PeriodEndDate; 0)
		ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; 0)
		ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; 0)
		ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; 0)
		ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; 0)
		ARRAY LONGINT:C221(ACC_Al_PeriodYearID; 0)
		
		Acc_D_SelectedYearStartDate:=!00-00-00!
		Acc_D_SelectedYearEndDate:=!00-00-00!
		ACC_D_SelectedReference:=!1980-01-01!
		OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearStartDate; True:C214)
		OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearEndDate; True:C214)
		GOTO OBJECT:C206(Acc_D_SelectedYearStartDate)
		//_O_DISABLE BUTTON(BCloseFinancialYear)
		//_O_ENABLE BUTTON(BCreatePeriodsd)
		//_O_ENABLE BUTTON(BCreatePeriods)
		OBJECT SET ENABLED:C1123(BCloseFinancialYear; True:C214)
		OBJECT SET ENABLED:C1123(BCreatePeriodsd; False:C215)
		
		OBJECT SET ENABLED:C1123(BCreatePeriods; False:C215)
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.Variable2"; $_t_oldMethodName)
