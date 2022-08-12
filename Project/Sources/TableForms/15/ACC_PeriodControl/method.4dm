If (False:C215)
	//Table Form Method Name: [USER]ACC_PeriodControl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_NIClosed; 0)
	ARRAY BOOLEAN:C223($_abo_PLClosed; 0)
	ARRAY BOOLEAN:C223($_abo_SLClosed; 0)
	//ARRAY BOOLEAN(ACC_abo_PeriodGLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodMOD;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodPLOpen;0)
	//ARRAY BOOLEAN(ACC_abo_PeriodSLOpen;0)
	//ARRAY BOOLEAN(YRP_lb_ACCPERIODS;0)
	//ARRAY BOOLEAN(YRP_lb_YearIdents;0)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_ad_FinancialYearTo;0)
	//ARRAY DATE(ACC_AD_PeriodEndDate;0)
	//ARRAY DATE(ACC_AD_PeriodStartDate;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	//ARRAY LONGINT(ACC_Al_PeriodYearID;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_PeriodNames;0)
	//ARRAY TEXT(ACC_at_YearIdents;0)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_Stop; $_bo_Update; ACC_bo_YearOpen; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_DATE:C307(ACC_D_CURRENTOPENYEAREND; ACC_D_CURRENTOPENYEARSTART; ACC_D_SelectedReference; Acc_D_SelectedYearEndDate; Acc_D_SelectedYearStartDate)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_ButtonNumber; $_l_ButtonPressed; $_l_CountMenuItems; $_l_event; $_l_Index; $_l_ModuleRow; $_l_NumberOfPeriods; $_l_Process; $_l_YearIdentRow; ACC_l_PerReadWrite)
	C_LONGINT:C283(ACC_l_YearID; ACP_l_BUT1; ACP_l_But2; ACP_l_BUT3; ACP_l_BUT4; ACP_l_BUT5; ACP_l_BUT6; ACP_l_BUT7; ACP_l_BUT8; ACP_l_BUT9; BAddYear)
	C_LONGINT:C283(BCloseFinancialYear; BCreatePeriods; BCreatePeriodsd; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; xnext; YRP_l_BUT1; YRP_l_But2)
	C_LONGINT:C283(YRP_l_BUT3; YRP_l_BUT4; YRP_l_BUT5; YRP_l_BUT6; YRP_l_BUT7; YRP_l_BUT8; YRP_l_BUT9)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_EndString; $_t_oldMethodName; $_t_PalletButtonName; $_t_StartString; $_t_YearReferenceString; ACP_t_COL1; ACP_t_COL2; ACP_t_COL3; ACP_t_COL4)
	C_TEXT:C284(ACP_t_COL5; ACP_t_COL6; ACP_t_COL7; ACP_t_COL8; ACP_t_COL9; ACP_t_HED1; ACP_t_HED2; ACP_t_HED3; ACP_t_HED4; ACP_t_HED5; ACP_t_HED6)
	C_TEXT:C284(ACP_t_HED7; ACP_t_HED8; ACP_t_HED9; BAR_t_Button; DB_t_CUrrentMenuReference; PAL_BUTTON; vButtDisO; WIN_t_CurrentInputForm; YRP_t_COL1; YRP_t_COL2; YRP_t_COL3)
	C_TEXT:C284(YRP_t_COL4; YRP_t_COL5; YRP_t_COL6; YRP_t_COL7; YRP_t_COL8; YRP_t_COL9; YRP_t_HED1; YRP_t_HED2; YRP_t_HED3; YRP_t_HED4; YRP_t_HED5)
	C_TEXT:C284(YRP_t_HED6; YRP_t_HED7; YRP_t_HED8; YRP_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].ACC_PeriodControl"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[USER:15]); "ACC_PeriodControl")
		WS_AutoscreenSize(3; 500; 750)
		UNLOAD RECORD:C212([PERIODS:33])
		READ ONLY:C145([PERIODS:33])
		ACC_LoadFinancialYears(True:C214)
		INT_SetInput(Table:C252(->[PERIODS:33]); WIN_t_CurrentInputForm)
		
		ARRAY TEXT:C222(ACC_at_YearIdents; Size of array:C274(ACC_ad_FinancialYearFrom))
		For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
			ACC_at_YearIdents{$_l_Index}:=String:C10(ACC_ad_FinancialYearFrom{$_l_Index}; 4)+"-"+String:C10(ACC_ad_FinancialYearTo{$_l_Index}; 4)
		End for 
		ACC_D_CURRENTOPENYEARSTART:=!00-00-00!
		If (<>YrPerF#"")
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
		Else 
			REDUCE SELECTION:C351([PERIODS:33]; 0)
		End if 
		
		$_bo_Stop:=False:C215
		For ($_l_Index; Size of array:C274(ACC_ad_FinancialYearFrom); 1; -1)
			If (ACC_ad_FinancialYearFrom{$_l_Index}=!00-00-00!) & (ACC_AD_FinancialYearTo{$_l_Index}#!00-00-00!)
				
				Gen_Confirm("You have a financial year with a start date of 00/00/0000. Do you wish to delete it?"; "Yes"; "No")
				If (OK=1)
					DELETE FROM ARRAY:C228(ACC_ad_FinancialYearFrom; $_l_Index)
					DELETE FROM ARRAY:C228(ACC_AD_FinancialYearTo; $_l_Index)
					DELETE FROM ARRAY:C228(ACC_at_Yearidents; $_l_Index)
					DELETE FROM ARRAY:C228(ACC_Al_FinancialYearID; $_l_Index)
					//ACC_LoadFinancialYears
				End if 
				OK:=1
			Else 
				If ($_l_Index<Size of array:C274(ACC_ad_FinancialYearFrom))
					If (ACC_AD_FinancialYearTo{$_l_Index}>=ACC_AD_FinancialYearTo{$_l_Index+1})
						xnext:=0
						Gen_Confirm3("The financial year(A) "+ACC_at_Yearidents{$_l_Index}+" Overlaps with (B) "+ACC_at_Yearidents{$_l_Index+1}+" You make keep both or delete one"; "Keep"; "Delete A"; "Delete B")
						$_bo_OK:=(OK=1)
						If (xnext=0)
							If ($_bo_OK)
								//Delete A
								DELETE FROM ARRAY:C228(ACC_ad_FinancialYearFrom; $_l_Index)
								DELETE FROM ARRAY:C228(ACC_AD_FinancialYearTo; $_l_Index)
								DELETE FROM ARRAY:C228(ACC_at_Yearidents; $_l_Index)
								DELETE FROM ARRAY:C228(ACC_Al_FinancialYearID; $_l_Index)
								
							Else 
								//do nothing
							End if 
						Else 
							//Delete B
							DELETE FROM ARRAY:C228(ACC_ad_FinancialYearFrom; $_l_Index+1)
							DELETE FROM ARRAY:C228(ACC_AD_FinancialYearTo; $_l_Index+1)
							DELETE FROM ARRAY:C228(ACC_at_Yearidents; $_l_Index+1)
							DELETE FROM ARRAY:C228(ACC_Al_FinancialYearID; $_l_Index+1)
							
						End if 
						
					End if 
				End if 
			End if 
		End for 
		ACC_LoadFinancialYears
		For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
			If (ACC_ad_FinancialYearFrom{$_l_Index}=[PERIODS:33]From_Date:3)
				//We have found the Year that can be closed
				ACC_D_CURRENTOPENYEARSTART:=ACC_ad_FinancialYearFrom{$_l_Index}
				ACC_D_CURRENTOPENYEAREND:=ACC_ad_FinancialYearTo{$_l_Index}
			Else 
				If (ACC_ad_FinancialYearFrom{$_l_Index}<[PERIODS:33]From_Date:3) & (ACC_ad_FinancialYearFrom{$_l_Index}>=[PERIODS:33]To_Date:4)
					//The year end is in the middle of a period
					$_t_StartString:=(String:C10(ACC_ad_FinancialYearFrom{$_l_Index}; 4))
					$_t_EndString:=(String:C10([PERIODS:33]From_Date:3; 4))
					Gen_Confirm("The Financial year is set as starting "+$_t_StartString+". However this does not match the start date of period "+[PERIODS:33]Period_Code:1+" Which starts "+$_t_EndString+" Which is correct?"; $_t_StartString; $_t_EndString)
					If (OK=1)
						Gen_Confirm("This will modify the PERIODS record. Are you sure you wish to continue?"; "Yes"; "No")
						If (ok=1)
							READ WRITE:C146([PERIODS:33])
							LOAD RECORD:C52([PERIODS:33])
							[PERIODS:33]From_Date:3:=ACC_ad_FinancialYearFrom{$_l_Index}
							[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_Index}
							DB_SaveRecord(->[PERIODS:33])
							UNLOAD RECORD:C212([PERIODS:33])
							READ ONLY:C145([PERIODS:33])
							If (<>YrPerF#"")
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
							Else 
								REDUCE SELECTION:C351([PERIODS:33]; 0)
							End if 
							
							ACC_D_CURRENTOPENYEARSTART:=ACC_ad_FinancialYearFrom{$_l_Index}
							ACC_D_CURRENTOPENYEAREND:=ACC_ad_FinancialYearTo{$_l_Index}
						Else 
							$_bo_Stop:=True:C214
						End if 
					Else 
						If (False:C215)  //not needed
							Gen_Confirm("This will modify the PREFERENCES record. Are you sure you wish to continue?"; "Yes"; "No")
							If (OK=1)
								READ WRITE:C146([USER:15])
								If (<>SYS_l_LoggedInaccount=0)
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
								Else 
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
								End if 
								//◊YrPerF:=ACC_ad_FinancialYearFrom{$_l_Index}
								DB_SaveRecord(->[USER:15])
								If (Application type:C494=4)
									
									UNLOAD RECORD:C212([USER:15])
									READ ONLY:C145([USER:15])
									$_l_Process:=Execute on server:C373("User_Details"; 32000; "Update Variables"; 1; <>SYS_l_LoggedInaccount)
									
								Else 
									UNLOAD RECORD:C212([USER:15])
									READ ONLY:C145([USER:15])
									//TRACE
									User_Details
								End if 
								ACC_D_CURRENTOPENYEARSTART:=ACC_ad_FinancialYearFrom{$_l_Index}
								ACC_D_CURRENTOPENYEAREND:=ACC_ad_FinancialYearTo{$_l_Index}
							Else 
								$_bo_Stop:=True:C214
							End if 
						End if 
						
					End if 
				End if 
			End if 
		End for 
		If ($_bo_Stop)
			CANCEL:C270
		Else 
			If (ACC_D_CURRENTOPENYEARSTART=!00-00-00!)
				If (<>YrPerF#"") & (<>YrPerT#"")
					//The year did not exist or the periods dont start on the correct date or the periods have not been created
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
					ACC_D_CURRENTOPENYEARSTART:=[PERIODS:33]From_Date:3
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerT)
					ACC_D_CURRENTOPENYEAREND:=[PERIODS:33]To_Date:4
					$_t_YearReferenceString:=String:C10(ACC_D_CURRENTOPENYEARSTART; 4)+"-"+String:C10(ACC_D_CURRENTOPENYEAREND; 4)
					$_l_YearIdentRow:=Find in array:C230(ACC_at_YearIdents; $_t_YearReferenceString)
					
					If ($_l_YearIdentRow<0)
						$_l_NumberOfPeriods:=Size of array:C274(ACC_AD_FinancialYearFrom)+1
						INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; $_l_NumberOfPeriods)
						INSERT IN ARRAY:C227(ACC_AD_FinancialYearTo; $_l_NumberOfPeriods)
						INSERT IN ARRAY:C227(ACC_at_Yearidents; $_l_NumberOfPeriods)
						INSERT IN ARRAY:C227(ACC_Al_FinancialYearID; $_l_NumberOfPeriods)
						ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
						ACC_ad_FinancialYearFrom{$_l_NumberOfPeriods}:=ACC_D_CURRENTOPENYEARSTART
						ACC_AD_FinancialYearTo{$_l_NumberOfPeriods}:=ACC_D_CURRENTOPENYEAREND
						ACC_at_Yearidents{$_l_NumberOfPeriods}:=String:C10(ACC_ad_FinancialYearFrom{$_l_NumberOfPeriods}; 4)+"-"+String:C10(ACC_ad_FinancialYearTo{$_l_NumberOfPeriods}; 4)
						ACC_Al_FinancialYearID{$_l_NumberOfPeriods}:=ACC_l_YearID
						SORT ARRAY:C229(ACC_ad_FinancialYearFrom; ACC_AD_FinancialYearTo; ACC_Al_FinancialYearID; ACC_at_Yearidents)
						//SaVE THE BLOB
						ACC_LoadFinancialYears
						READ WRITE:C146([PERIODS:33])
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=ACC_ad_FinancialYearFrom{ACC_at_YearIdents}; *)
						QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=ACC_ad_FinancialYearTo{ACC_at_YearIdents})
						APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]X_FinancialYearID:11:=ACC_l_YearID)
						UNLOAD RECORD:C212([PERIODS:33])
						READ ONLY:C145([PERIODS:33])
						
						
					End if 
				End if 
				
				
				
			End if 
			ACC_bo_YearOpen:=False:C215
			ARRAY TEXT:C222(ACC_at_PeriodCodes; 0)
			ARRAY TEXT:C222(ACC_at_PeriodNames; 0)
			ARRAY DATE:C224(ACC_AD_PeriodStartDate; 0)
			ARRAY DATE:C224(ACC_AD_PeriodEndDate; 0)
			ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; 0)
			ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; 0)
			ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; 0)
			ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; 0)
			ARRAY LONGINT:C221(ACC_Al_PeriodYearID; 0)
			ACC_at_YearIdents:=0
			ACC_D_SelectedReference:=!00-00-00!
			OBJECT SET ENABLED:C1123(BCloseFinancialYear; False:C215)
			OBJECT SET ENABLED:C1123(BCreatePeriodsd; False:C215)
			OBJECT SET ENABLED:C1123(BCreatePeriods; False:C215)
			If (ACC_l_PerReadWrite=0)
				OBJECT SET ENABLED:C1123(BAddYear; False:C215)
			End if 
			
			//ACC_l_PerReadWrite is 0 if read only
			
			//INT_SetLongintCheckFormat (->ACC_Ai_Period_SLOpen)
			//INT_SetLongintCheckFormat (->ACC_Ai_Period_PLOpen)
			//INT_SetLongintCheckFormat (->ACC_Ai_Period_GLOpen)
			
			
		End if 
		WS_GETPALLETEBUTTONS
		
		vButtDisO:="O              DT"
		Out_Buttons(->[PERIODS:33])
		In_ButtChkDis(->vButtDisO)
		
		DB_t_CUrrentMenuReference:=Get menu bar reference:C979
		$_l_CountMenuItems:=Count menu items:C405(DB_t_CUrrentMenuReference)
		
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_CountMenuItems+1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
				$_l_CountMenuItems:=$_l_CountMenuItems+1
			End for 
		End if 
		//ACC_ad_FinancialYearFrom
		
		
		LB_SetupListbox(->YRP_lb_YearIdents; "YRP_t"; "YRP_L"; 1; ->ACC_at_YearIdents; ->ACC_ad_FinancialYearFrom; ->ACC_ad_FinancialYearTo)
		LB_SetColumnHeaders(->YRP_lb_YearIdents; "YRP_L"; 1; "Statement Field"; "Associated Daybook Field")
		LB_SetColumnWidths(->YRP_lb_YearIdents; "ABC_t"; 1; 150; 0; 0)
		LB_SetEnterable(->YRP_lb_YearIdents; False:C215; 0)
		
		LB_SetScroll(->YRP_lb_YearIdents; -3; -2)
		LB_StyleSettings(->YRP_lb_YearIdents; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		
		
		
		
		LB_SetupListbox(->YRP_lb_ACCPERIODS; "ACP_t"; "ACP_L"; 1; ->ACC_at_PeriodCodes; ->ACC_at_PeriodNames; ->ACC_AD_PeriodStartDate; ->ACC_AD_PeriodEndDate; ->ACC_abo_PeriodSLOpen; ->ACC_abo_PeriodPLOpen; ->ACC_abo_PeriodGLOpen; ->ACC_Al_PeriodYearID; ->ACC_abo_PeriodMOD)
		LB_SetColumnHeaders(->YRP_lb_ACCPERIODS; "ACP_L"; 1; "Period Code"; "Names"; "From Date"; "To Date"; "SL Open"; "PL Open"; "GL Open"; ""; "")
		LB_SetColumnWidths(->YRP_lb_ACCPERIODS; "ABC_t"; 1; 71; 176; 68; 68; 30; 30; 30; 0)
		LB_SetEnterable(->YRP_lb_ACCPERIODS; False:C215; 0)
		
		LB_SetScroll(->YRP_lb_ACCPERIODS; -3; -2)
		LB_StyleSettings(->YRP_lb_ACCPERIODS; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		
	: ($_l_event=On Resize:K2:27)
		
		INT_SetInput(Table:C252(->[PERIODS:33]); WIN_t_CurrentInputForm)
		
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[USER:15]); "ACC_PeriodControl")
		vButtDisO:="O              DT"
		Out_Buttons(->[PERIODS:33])
		
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_t_CUrrentMenuReference:=Get menu bar reference:C979
					$_l_CountMenuItems:=Count menu items:C405(DB_t_CUrrentMenuReference)
					
					If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
						For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
							INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_CountMenuItems+1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
							$_l_CountMenuItems:=$_l_CountMenuItems+1
						End for 
					End if 
				End if 
				BAR_t_Button:=""
				
				
			End if 
			
		End if 
		
		
	: ($_l_event=On Outside Call:K2:11)
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Case of 
			: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
				If (ACC_D_SelectedReference>!00-00-00!)
					If (ACC_D_SelectedReference=!1980-01-01!)  //For creating a new one
						If (Acc_D_SelectedYearStartDate>!00-00-00!) & (Acc_D_SelectedYearEndDate>!00-00-00!)
							$_l_NumberOfPeriods:=Size of array:C274(ACC_AD_FinancialYearFrom)+1
							INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; $_l_NumberOfPeriods)
							INSERT IN ARRAY:C227(ACC_AD_FinancialYearTo; $_l_NumberOfPeriods)
							INSERT IN ARRAY:C227(ACC_at_Yearidents; $_l_NumberOfPeriods)
							INSERT IN ARRAY:C227(ACC_Al_FinancialYearID; $_l_NumberOfPeriods)
							ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
							ACC_ad_FinancialYearFrom{$_l_NumberOfPeriods}:=Acc_D_SelectedYearStartDate
							ACC_AD_FinancialYearTo{$_l_NumberOfPeriods}:=Acc_D_SelectedYearEndDate
							ACC_at_Yearidents{$_l_NumberOfPeriods}:=String:C10(ACC_ad_FinancialYearFrom{$_l_NumberOfPeriods}; 4)+"-"+String:C10(ACC_ad_FinancialYearTo{$_l_NumberOfPeriods}; 4)
							ACC_Al_FinancialYearID{$_l_NumberOfPeriods}:=ACC_l_YearID
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
						$_l_ModuleRow:=Find in array:C230(ACC_ad_FinancialYearFrom; ACC_D_SelectedReference)
						For ($_l_Index; 1; Size of array:C274(ACC_abo_PeriodMOD))
							If (ACC_abo_PeriodMOD{$_l_Index})
								If ($_bo_Update=False:C215)
									Gen_Confirm("Save changes to "+ACC_at_Yearidents{$_l_ModuleRow}+"?"; "Yes"; "No")
									If (OK=0)
										$_l_Index:=Size of array:C274(ACC_abo_PeriodMOD)+1
										OK:=1
									Else 
										$_bo_Update:=True:C214
									End if 
								End if 
								If ($_bo_Update)
									READ WRITE:C146([PERIODS:33])
									//TRACE
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_PeriodCodes{$_l_Index})
									//these are the only bits thsat csn be modified directly on this screen
									[PERIODS:33]PL_Closed:8:=Not:C34(ACC_abo_PeriodPLOpen{$_l_Index})
									[PERIODS:33]NL_Closed:5:=Not:C34(ACC_abo_PeriodGLOpen{$_l_Index})
									[PERIODS:33]SL_Closed:7:=Not:C34(ACC_abo_PeriodSLOpen{$_l_Index})
									[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_ModuleRow}
									SAVE RECORD:C53([PERIODS:33])
									UNLOAD RECORD:C212([PERIODS:33])
									READ ONLY:C145([PERIODS:33])
								End if 
							Else 
								If (ACC_Al_PeriodYearID{$_l_Index}=0)
									READ WRITE:C146([PERIODS:33])
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_at_PeriodCodes{$_l_Index})
									[PERIODS:33]X_FinancialYearID:11:=ACC_Al_FinancialYearID{$_l_ModuleRow}
									SAVE RECORD:C53([PERIODS:33])
									UNLOAD RECORD:C212([PERIODS:33])
									READ ONLY:C145([PERIODS:33])
								End if 
								
							End if 
							
						End for 
						ACC_D_SelectedReference:=!00-00-00!
					End if 
				End if   // No year loaded
				//Transact_End (True)
				CANCEL:C270
			: (($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				OK:=0
				CANCEL:C270
			: ($_l_ButtonPressed=DB_GetButtonFunction("Add"))
				
			: ($_l_ButtonPressed=DB_GetButtonFunction("RefreshPeriods"))
				If (ACC_D_SelectedReference#!00-00-00!)
					If (Acc_D_SelectedYearStartDate>!00-00-00!) & (Acc_D_SelectedYearEndDate>!00-00-00!)
						READ ONLY:C145([PERIODS:33])
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=Acc_D_SelectedYearStartDate; *)
						QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4<=Acc_D_SelectedYearEndDate)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes; [PERIODS:33]Period_Name:2; ACC_at_PeriodNames; [PERIODS:33]From_Date:3; ACC_AD_PeriodStartDate; [PERIODS:33]To_Date:4; ACC_AD_PeriodEndDate; [PERIODS:33]NL_Closed:5; $_abo_NIClosed; [PERIODS:33]SL_Closed:7; $_abo_SLClosed; [PERIODS:33]PL_Closed:8; $_abo_PLClosed; [PERIODS:33]X_FinancialYearID:11; ACC_Al_PeriodYearID)
						UNLOAD RECORD:C212([PERIODS:33])
						ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; 0)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; 0)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; 0)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; 0)
						$_l_NumberOfPeriods:=Size of array:C274(ACC_at_PeriodCodes)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodMOD; $_l_NumberOfPeriods)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodSLOpen; $_l_NumberOfPeriods)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodPLOpen; $_l_NumberOfPeriods)
						ARRAY BOOLEAN:C223(ACC_abo_PeriodGLOpen; $_l_NumberOfPeriods)
						For ($_l_Index; 1; $_l_NumberOfPeriods)
							ACC_abo_PeriodSLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_SLClosed{$_l_Index}))-1))=1)
							ACC_abo_PeriodPLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_PLClosed{$_l_Index}))-1))=1)
							ACC_abo_PeriodGLOpen{$_l_Index}:=((Abs:C99((Num:C11($_abo_NIClosed{$_l_Index}))-1))=1)
						End for 
						SORT ARRAY:C229(ACC_AD_PeriodStartDate; ACC_AD_PeriodEndDate; ACC_at_PeriodCodes; ACC_at_PeriodNames; ACC_abo_PeriodSLOpen; ACC_abo_PeriodPLOpen; ACC_abo_PeriodGLOpen; ACC_Al_PeriodYearID; ACC_abo_PeriodMOD)
						
						
					End if 
					
				End if 
				DB_l_ButtonClickedFunction:=0
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
End case 
ERR_MethodTrackerReturn("FM:ACC_PeriodControl"; $_t_oldMethodName)
