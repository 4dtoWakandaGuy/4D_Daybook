If (False:C215)
	//object Name: [USER]ACC_PeriodControl.oLBYearIdents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2012 14:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_NIClosed; 0)
	ARRAY BOOLEAN:C223($_abo_PIClosed; 0)
	ARRAY BOOLEAN:C223($_abo_SIClosed; 0)
	//ARRAY BOOLEAN(ACC_abo_PeriodGLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodMOD;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodPLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodSLOpen;0)
	//ARRAY BOOLEAN(YRP_lb_ACCPERIODS;0)
	//ARRAY DATE(ACC_AD_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	//ARRAY DATE(ACC_AD_PeriodEndDate;0)
	//ARRAY DATE(ACC_AD_PeriodStartDate;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	//ARRAY LONGINT(ACC_Al_PeriodYearID;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_PeriodNames;0)
	//ARRAY TEXT(ACC_at_Yearidents;0)
	C_BOOLEAN:C305($_bo_PeriodOpen; $_bo_Update; ACC_bo_YearOpen)
	C_DATE:C307(ACC_D_CURRENTOPENYEAREND; ACC_D_CURRENTOPENYEARSTART; ACC_D_SelectedReference; Acc_D_SelectedYearEndDate; Acc_D_SelectedYearStartDate)
	C_LONGINT:C283($_l_ArraySize; $_l_Column; $_l_event; $_l_FInancialYearPosition; $_l_Index; $_l_ModuleAccess; $_l_Row; $_l_Selected; ACC_l_PerReadWrite; ACC_l_YearID; BAddYear)
	C_LONGINT:C283(BCloseFinancialYear; BCreatePeriods; BCreatePeriodsd)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.oLBYearIdents"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(*; "oLBYearIdents"; $_l_Column; $_l_Row)
		ACC_at_Yearidents:=$_l_Row
		If (ACC_at_Yearidents>0)
			$_l_Selected:=ACC_at_Yearidents
			If (ACC_D_SelectedReference>!00-00-00!)
				If (ACC_D_SelectedReference=!1980-01-01!)  //For creating a new one
					If (Acc_D_SelectedYearStartDate>!00-00-00!) & (Acc_D_SelectedYearEndDate>!00-00-00!)
						$_l_ArraySize:=Size of array:C274(ACC_AD_FinancialYearFrom)+1
						INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; $_l_ArraySize)
						INSERT IN ARRAY:C227(ACC_AD_FinancialYearTo; $_l_ArraySize)
						INSERT IN ARRAY:C227(ACC_at_Yearidents; $_l_ArraySize)
						INSERT IN ARRAY:C227(ACC_Al_FinancialYearID; $_l_ArraySize)
						ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
						ACC_ad_FinancialYearFrom{$_l_ArraySize}:=Acc_D_SelectedYearStartDate
						ACC_AD_FinancialYearTo{$_l_ArraySize}:=Acc_D_SelectedYearEndDate
						ACC_at_Yearidents{$_l_ArraySize}:=String:C10(ACC_ad_FinancialYearFrom{$_l_ArraySize}; 4)+"-"+String:C10(ACC_ad_FinancialYearTo{$_l_ArraySize}; 4)
						ACC_Al_FinancialYearID{$_l_ArraySize}:=ACC_l_YearID
						SORT ARRAY:C229(ACC_ad_FinancialYearFrom; ACC_AD_FinancialYearTo; ACC_Al_FinancialYearID; ACC_at_Yearidents)
						//SaVE THE BLOB
						ACC_D_SelectedReference:=!00-00-00!
						
						
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
					$_l_FInancialYearPosition:=Find in array:C230(ACC_ad_FinancialYearFrom; ACC_D_SelectedReference)
					For ($_l_Index; 1; Size of array:C274(ACC_abo_PeriodMOD))
						If (ACC_abo_PeriodMOD{$_l_Index})
							If ($_bo_Update=False:C215)
								Gen_Confirm("Save changes to "+ACC_at_Yearidents{$_l_FInancialYearPosition}+"?"; "Yes"; "No")
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
								//TRACE
								//these are the only bits thsat csn be modified directly on this screen
								[PERIODS:33]PL_Closed:8:=(Not:C34(ACC_abo_PeriodPLOpen{$_l_Index}))
								[PERIODS:33]NL_Closed:5:=(Not:C34(ACC_abo_PeriodGLOpen{$_l_Index}))
								[PERIODS:33]SL_Closed:7:=(Not:C34(ACC_abo_PeriodSLOpen{$_l_Index}))
								[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_FInancialYearPosition}
								SAVE RECORD:C53([PERIODS:33])
								UNLOAD RECORD:C212([PERIODS:33])
								READ ONLY:C145([PERIODS:33])
							End if 
						Else 
							If (ACC_Al_PeriodYearID{$_l_Index}=0)
								READ WRITE:C146([PERIODS:33])
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_PeriodCodes{$_l_Index})
								[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_FInancialYearPosition}
								SAVE RECORD:C53([PERIODS:33])
								UNLOAD RECORD:C212([PERIODS:33])
								READ ONLY:C145([PERIODS:33])
							End if 
							
						End if 
						
					End for 
					ACC_D_SelectedReference:=!00-00-00!
				End if 
			End if   // No year loaded
			If (ACC_D_SelectedReference=!00-00-00!)
				ACC_at_YearIdents:=$_l_Selected
				READ ONLY:C145([PERIODS:33])
				ACC_D_SelectedReference:=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=ACC_ad_FinancialYearTo{ACC_at_YearIdents})
				QUERY SELECTION:C341([PERIODS:33]; [PERIODS:33]X_FinancialYearID:11=0)
				If (Records in selection:C76([PERIODS:33])>0)
					REDUCE SELECTION:C351([PERIODS:33]; 0)
					READ WRITE:C146([PERIODS:33])
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=ACC_ad_FinancialYearTo{ACC_at_YearIdents}; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]X_FinancialYearID:11=0)
					For ($_l_Index; 1; Records in selection:C76([PERIODS:33]))
						[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{ACC_at_YearIdents}
						SAVE RECORD:C53([PERIODS:33])
						NEXT RECORD:C51([PERIODS:33])
					End for 
					UNLOAD RECORD:C212([PERIODS:33])
					READ ONLY:C145([PERIODS:33])
				End if 
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=ACC_ad_FinancialYearTo{ACC_at_YearIdents})
				SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes; [PERIODS:33]Period_Name:2; ACC_at_PeriodNames; [PERIODS:33]From_Date:3; ACC_AD_PeriodStartDate; [PERIODS:33]To_Date:4; ACC_AD_PeriodEndDate; [PERIODS:33]NL_Closed:5; $_abo_NIClosed; [PERIODS:33]SL_Closed:7; $_abo_SIClosed; [PERIODS:33]PL_Closed:8; $_abo_PIClosed; [PERIODS:33]X_FinancialYearID:11; ACC_Al_PeriodYearID)
				UNLOAD RECORD:C212([PERIODS:33])
				ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; 0)
				
				ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; 0)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; 0)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; 0)
				$_l_ArraySize:=Size of array:C274(ACC_at_PeriodCodes)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; $_l_ArraySize)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; $_l_ArraySize)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; $_l_ArraySize)
				ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; $_l_ArraySize)
				$_bo_PeriodOpen:=False:C215
				
				For ($_l_Index; 1; $_l_ArraySize)
					If (Not:C34($_abo_SIClosed{$_l_Index})) | (Not:C34($_abo_PIClosed{$_l_Index})) | (Not:C34($_abo_NIClosed{$_l_Index}))
						$_bo_PeriodOpen:=True:C214
					End if 
					ACC_abo_PeriodSLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_SIClosed{$_l_Index}))-1))=1)
					ACC_abo_PeriodPLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_PIClosed{$_l_Index}))-1))=1)
					ACC_abo_PeriodGLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_NIClosed{$_l_Index}))-1))=1)
				End for 
				
				
				SORT ARRAY:C229(ACC_AD_PeriodStartDate; ACC_AD_PeriodEndDate; ACC_at_PeriodCodes; ACC_at_PeriodNames; ACC_abo_PeriodSLOpen; ACC_abo_PeriodPLOpen; ACC_abo_PeriodGLOpen; ACC_Al_PeriodYearID; ACC_abo_PeriodMOD)
				//we ignore the $ arrays
				OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearStartDate; False:C215)
				OBJECT SET ENTERABLE:C238(Acc_D_SelectedYearEndDate; False:C215)
				//_O_DISABLE BUTTON(BCloseFinancialYear)
				OBJECT SET ENABLED:C1123(BCloseFinancialYear; False:C215)
				//
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
					
					//_O_ENABLE BUTTON(BCreatePeriodsd)
					//_O_ENABLE BUTTON(BCreatePeriods)
					//Can modify periods
					ACC_bo_YearOpen:=True:C214
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
					If (($_l_ModuleAccess<2) | ($_l_ModuleAccess=3))
						LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 5)
						LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 6)
						LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 7)
						
					Else 
						
						LB_SetEnterable(->YRP_lb_ACCPERIODS; True:C214; 5)
						LB_SetEnterable(->YRP_lb_ACCPERIODS; True:C214; 6)
						LB_SetEnterable(->YRP_lb_ACCPERIODS; True:C214; 7)
					End if 
				Else 
					LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 5)
					LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 6)
					LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 7)
					
					
				End if 
				
				If (ACC_l_PerReadWrite=0)
					OBJECT SET ENABLED:C1123(BCreatePeriodsd; False:C215)
					OBJECT SET ENABLED:C1123(BCreatePeriods; False:C215)
					OBJECT SET ENABLED:C1123(BAddYear; False:C215)
					OBJECT SET ENABLED:C1123(BCloseFinancialYear; False:C215)
					
					//_O_DISABLE BUTTON(BAddYear)
					//_O_DISABLE BUTTON(BCloseFinancialYear)
					//_O_DISABLE BUTTON(BCreatePeriodsd)
					//_O_DISABLE BUTTON(BCreatePeriods)
				End if 
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.oLBYearIdents"; $_t_oldMethodName)
