//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OpenRecordFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/08/2010 19:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305($_bo_CheckedAccountCode; $_bo_InRecord; $_bo_MoveGrid1; $_bo_OnScreenEdit; $_bo_RecordsinNewProcess; $_bo_UserTable; ACCBAL_Bo_NoCancel; CO_bo_CotypesArrayLoaded; COM_bo_TypesInited; CON_bo_NoCancel; DB_bo_DisplayFilters)
	C_BOOLEAN:C305(DB_bo_InRecord; DB_bo_OnScreenEdit; DB_bo_RecordsinNewProcess; DB_bo_ShowArrayBased; LBI_bo_RowDragged; vFromIn)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_45Bottom; $_l_AreaWidth; $_l_B11Left; $_l_B11Right; $_l_B11Top; $_l_B13Bottom; $_l_B13Left; $_l_B13Right; $_l_B13Top; $_l_B14Bottom)
	C_LONGINT:C283($_l_B14Left; $_l_B14Right; $_l_B14Top; $_l_B15Bottom; $_l_B15Left; $_l_B15Right; $_l_B15Top; $_l_B18Bottom; $_l_B18Left; $_l_B18Right; $_l_B18Top)
	C_LONGINT:C283($_l_B1Bottom; $_l_B1FBottom; $_l_B1FLeft; $_l_B1FRight; $_l_B1FTop; $_l_B1Left; $_l_B1Right; $_l_B1Top; $_l_B2Bottom; $_l_B2FBottom; $_l_B2FLeft)
	C_LONGINT:C283($_l_B2FRight; $_l_B2FTop; $_l_B2Left; $_l_B2Right; $_l_B2Top; $_l_B3Bottom; $_l_B3FBottom; $_l_B3FLeft; $_l_B3FRight; $_l_B3FTop; $_l_B3Left)
	C_LONGINT:C283($_l_B3Right; $_l_B3Top; $_l_B45Left; $_l_B45Right; $_l_B45top; $_l_B4Bottom; $_l_B4Left; $_l_B4Right; $_l_B4Top; $_l_Cancel; $_l_CBBottom)
	C_LONGINT:C283($_l_CBLeft; $_l_CBRight; $_l_CBTop; $_l_Column; $_l_ColumnIndex; $_l_CurrentDisplayedForm; $_l_DropDown; $_l_EditCompanyProcess; $_l_FieldNumber; $_l_FromTableDisplayedForm; $_l_Grid1Bottom)
	C_LONGINT:C283($_l_Grid1Left; $_l_Grid1Right; $_l_Grid1Top; $_l_Grid2Bottom; $_l_Grid2Left; $_l_Grid2Right; $_l_Grid2Top; $_l_ModuleAccess; $_l_NavBottom; $_l_NavLeft; $_l_NavRight)
	C_LONGINT:C283($_l_Navtop; $_l_Object11Bottom; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_Process)
	C_LONGINT:C283($_l_RecordNumber; $_l_Row; $_l_Search; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; $1; $EditACBALProcess)
	C_LONGINT:C283(DB_but_CBFunction1; DB_but_Function1; DB_but_Function2; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_Navigatetoselected; MOD_l_CurrentModuleAccess; PAL_BUTTON_1; PAL_BUTTON_11; PAL_BUTTON_13; PAL_BUTTON_14)
	C_LONGINT:C283(PAL_BUTTON_15; PAL_BUTTON_18; PAL_BUTTON_2; PAL_BUTTON_3; PAL_BUTTON_4; PAL_BUTTON_45)
	C_POINTER:C301($_ptr_ThisArray)
	C_TEXT:C284($_t_AccountCode; $_t_actionType; $_t_AutosearchCode; $_t_CurrentInputForm; $_t_CurrentInputFormWAS; $_t_DiaryForm; $_t_GetRecordCode; $_t_GroupCode; $_t_LayoutReference; $_t_oldMethodName; $_t_ProcessName)
	C_TEXT:C284($_t_VariableName; $_t_WinCurrentInputForm; $_t_WindowName; $_t_WindowTitle; $3; CUR_CompanyTypes; DB_t_CurrentContext; DB_t_CUrrentMenuReference; WIN_t_CurrentInputForm)
End if 
//Code Starts Here
//TRACE
$_t_oldMethodName:=ERR_MethodTracker("DB_OpenRecordFromSelection")
$_bo_OnScreenEdit:=DB_bo_OnScreenEdit  // we can edit in the on screen
If (Count parameters:C259>=1)
	$_l_CurrentDisplayedForm:=$1
Else 
	$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
End if 
If (Count parameters:C259>=2)  //currently this is only no zero when we are opening an account from the balances screen.
	$_l_FromTableDisplayedForm:=$1
Else 
	$_l_FromTableDisplayedForm:=0
End if 
If (Count parameters:C259>=3)  //currently this is only no zero when we are opening an account from the balances screen.
	$_t_GetRecordCode:=$3
Else 
	$_t_GetRecordCode:=""
	
	
	//TRACE
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_1; $_l_B1Left; $_l_B1Top; $_l_B1Right; $_l_B1Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_4; $_l_B4Left; $_l_B4Top; $_l_B4Right; $_l_B4Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_3; $_l_B3Left; $_l_B3Top; $_l_B3Right; $_l_B3Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_13; $_l_B13Left; $_l_B13Top; $_l_B13Right; $_l_B13Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_11; $_l_B11Left; $_l_B11Top; $_l_B11Right; $_l_Object11Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_15; $_l_B15Left; $_l_B15Top; $_l_B15Right; $_l_B15Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_14; $_l_B14Left; $_l_B14Top; $_l_B14Right; $_l_B14Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_18; $_l_B18Left; $_l_B18Top; $_l_B18Right; $_l_B18Bottom)
	OBJECT GET COORDINATES:C663(DB_but_Function1; $_l_B1FLeft; $_l_B1FTop; $_l_B1FRight; $_l_B1FBottom)
	OBJECT GET COORDINATES:C663(DB_but_Function2; $_l_B2FLeft; $_l_B2FTop; $_l_B2FRight; $_l_B2FBottom)
	OBJECT GET COORDINATES:C663(DB_but_CBFunction1; $_l_B3FLeft; $_l_B3FTop; $_l_B3FRight; $_l_B3FBottom)
	
	OBJECT GET COORDINATES:C663(PAL_BUTTON_45; $_l_B45Left; $_l_B45top; $_l_B45Right; $_l_45Bottom)
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavLeft; $_l_Navtop; $_l_NavRight; $_l_NavBottom)
	OBJECT GET COORDINATES:C663(DB_l_LBOutputForm; $_l_Grid1Left; $_l_Grid1Top; $_l_Grid1Right; $_l_Grid1Bottom)
	OBJECT GET COORDINATES:C663(DB_lb_OutputArrays; $_l_Grid2Left; $_l_Grid2Top; $_l_Grid2Right; $_l_Grid2Bottom)
End if 
$_l_ModuleAccess:=MOD_l_CurrentModuleAccess
$_bo_InRecord:=DB_bo_InRecord
DB_bo_InRecord:=True:C214

$_bo_RecordsinNewProcess:=DB_bo_RecordsinNewProcess
Case of 
	: ($_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
		
		
		//COPY NAMED SELECTION([COMPANIES];"$TempSelection")
		If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
			
			READ WRITE:C146([COMPANIES:2])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[COMPANIES:2]; 1))
				
				
				//CREATE SET([COMPANIES];"$temp")
				//USE SET("ListboxSet0")
				//FIRST RECORD([COMPANIES])
				If ($_t_GetRecordCode="")
					$_l_RecordNumber:=Record number:C243([COMPANIES:2])
				Else 
					$_l_RecordNumber:=0
				End if 
				LOAD RECORD:C52([COMPANIES:2])
				If ($_t_GetRecordCode="")
					$_t_AutosearchCode:=[COMPANIES:2]Company_Code:1
				Else 
					$_t_AutosearchCode:=$_t_GetRecordCode
				End if 
				
				UNLOAD RECORD:C212([COMPANIES:2])
				READ ONLY:C145([COMPANIES:2])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Company")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; $_l_CurrentDisplayedForm; DB_t_CurrentContext; $_t_AutosearchCode)
				//USE NAMED SELECTION("$TempSelection")
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
				//DBI_MenuDisplayRecords ("Companies")
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
				
				$_t_WindowTitle:=Get window title:C450
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				READ WRITE:C146([COMPANIES:2])
				READ WRITE:C146([COMPANIES_RECORD_ANALYSIS:146])
				READ WRITE:C146([CONTACTS:1])
				READ WRITE:C146([CONTACTS_COMPANIES:145])
				READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
				READ WRITE:C146([INFORMATION:55])
				
				//GOTO RECORD([COMPANIES];$_l_RecordNumber)
				//PUSH RECORD([COMPANIES])
				
				If (Not:C34(COM_bo_TypesInited))
					ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
					COM_at_CompanyTypes{1}:="Show Companies only"
					COM_at_CompanyTypes{2}:="Show Private Individuals only"
					COM_at_CompanyTypes{3}:="-"
					COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
					COM_at_CompanyTypes:=4
					CUR_CompanyTypes:="Companies and Private Individuals"
					COM_bo_TypesInited:=True:C214
				End if 
				FORM SET INPUT:C55([COMPANIES:2]; "Company_In")  //NG April 2004 removed reference to ◊screen and reference to S
				
				ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
				ARRAY POINTER:C280(COM_aPtr_CoFurthers; 0)
				ARRAY POINTER:C280(QUAL_aptr_Information; 0)
				$_t_WinCurrentInputForm:="Company_In"
				//SET MENU BAR(26)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Company")
				$_t_CurrentInputForm:=WIN_t_CurrentInputForm
				SET WINDOW TITLE:C213($_t_WindowName+" "+[COMPANIES:2]Company_Name:2)
				WIN_t_CurrentInputForm:="Company_In"
				MODIFY RECORD:C57([COMPANIES:2]; *)
				$_t_LayoutReference:="Companies"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				Comp_Unload
				//POP RECORD([COMPANIES])
				
				READ ONLY:C145([COMPANIES:2])
				READ ONLY:C145([COMPANIES_RECORD_ANALYSIS:146])
				READ ONLY:C145([CONTACTS:1])
				READ ONLY:C145([CONTACTS_COMPANIES:145])
				READ ONLY:C145([CONTACTS_RECORD_ANALYSIS:144])
				READ ONLY:C145([INFORMATION:55])
				
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				SET WINDOW TITLE:C213($_t_WindowTitle)
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				WIN_t_CurrentInputForm:=$_t_CurrentInputForm
				
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
		Else 
			Gen_Alert("Sorry you do not have access to company records")
			
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
		COPY NAMED SELECTION:C331([CONTACTS:1]; "$TempSelection")
		//CREATE SET([CONTACTS];"$temp")
		
		
		If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
			
			READ WRITE:C146([CONTACTS:1])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CONTACTS:1]; 1))
				
				LOAD RECORD:C52([CONTACTS:1])
				$_t_AutosearchCode:=[CONTACTS:1]Contact_Code:2
				UNLOAD RECORD:C212([CONTACTS:1])
				READ ONLY:C145([CONTACTS:1])
				UNLOAD RECORD:C212([CONTACTS_COMPANIES:145])
				UNLOAD RECORD:C212([CONTACTS_RECORD_ANALYSIS:144])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contact")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; $_l_CurrentDisplayedForm; DB_t_CurrentContext; $_t_AutosearchCode)
				//USE NAMED SELECTION("$TempSelection")
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
				
				READ WRITE:C146([CONTACTS:1])
				READ WRITE:C146([CONTACTS_COMPANIES:145])
				READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
				LOAD RECORD:C52([CONTACTS:1])
				
				$_t_WindowTitle:=Get window title:C450
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				FORM SET INPUT:C55([CONTACTS:1]; "Contact_In")
				$_t_WinCurrentInputForm:="Contact_In"
				//SET MENU BAR(27)
				CON_bo_NoCancel:=True:C214
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Contact")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CONTACTS:1]Contact_Name:31)
				MODIFY RECORD:C57([CONTACTS:1]; *)
				$_t_LayoutReference:="Companies"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				Cont_Unload
				READ ONLY:C145([CONTACTS:1])
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				//``
				//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
				
				//``
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				
				
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
		//TRACE
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			If ($_l_ModuleAccess=3)
				READ ONLY:C145([ACCOUNT_BALANCES:34])
				READ ONLY:C145([ACCOUNTS:32])
			Else 
				READ WRITE:C146([ACCOUNT_BALANCES:34])
				READ WRITE:C146([ACCOUNTS:32])
			End if 
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
			If (DB_bo_ShowArrayBased)
				LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
				LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				$_bo_CheckedAccountCode:=False:C215
				$_t_AccountCode:=""
				$_t_GroupCode:=""
				
				//USE SET("ListboxSet0")
				If ($_l_Row>0)
					
					For ($_l_ColumnIndex; Size of array:C274($_aptr_ColumnVariables); 1; -1)
						RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ColumnIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						If (Position:C15("Group"; $_t_VariableName)>0)
							If (Position:C15("Codes"; $_t_VariableName)>0)
								$_ptr_ThisArray:=$_aptr_ColumnVariables{$_l_ColumnIndex}
								If (Not:C34($_bo_CheckedAccountCode))  //& ($_l_ColumnIndex=1)
									
									
									$_t_AccountCode:=$_ptr_ThisArray->{$_l_Row}
									$_bo_CheckedAccountCode:=True:C214
								Else 
									$_t_GroupCode:=$_ptr_ThisArray->{$_l_Row}
								End if 
								If ($_t_AccountCode#"") | ($_t_GroupCode#"")
									$_l_ColumnIndex:=0  //Size of array($_aptr_ColumnVariables)
									
								End if 
							End if 
						End if 
					End for 
					//FIRST RECORD([ACCOUNTS])
					If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
						
						READ WRITE:C146([ACCOUNTS:32])
						If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ACCOUNTS:32]; 1))
							If ($_t_AccountCode#"")
								//We could be opening an account or a heading.
								
								
								$_t_AutosearchCode:=[ACCOUNTS:32]Account_Code:2
								UNLOAD RECORD:C212([ACCOUNTS:32])
								READ ONLY:C145([ACCOUNTS:32])
								
								$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Account")
								
								$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[ACCOUNTS:32]); DB_t_CurrentContext; $_t_AccountCode)
								USE SET:C118("$Temp")
								DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
								//ZAccounts_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
							Else 
								If ($_t_GroupCode#"")
								End if 
							End if 
						Else 
							If ($_t_AccountCode#"")
								READ WRITE:C146([ACCOUNTS:32])
								MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
								
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_t_AccountCode)
								GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
								$_t_WindowTitle:=Get window title:C450
								FORM SET INPUT:C55([ACCOUNTS:32]; "Accounts_in")
								$_t_WinCurrentInputForm:="Accounts_in"
								//``SET MENU BAR(9)
								$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Account")
								SET WINDOW TITLE:C213($_t_WindowName+" "+[ACCOUNTS:32]Account_Name:3)
								MODIFY RECORD:C57([ACCOUNTS:32]; *)
								$_t_LayoutReference:="Accounts"+"_"+$_t_WinCurrentInputForm
								INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
								
								UNLOAD RECORD:C212([ACCOUNTS:32])
								READ ONLY:C145([ACCOUNTS:32])
								SET WINDOW TITLE:C213($_t_WindowTitle)
								SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
								//Need to make sure objects end up in the correct place 2
								USE SET:C118("$Temp")  //``
								
								If (DB_bo_ShowArrayBased)
									//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
								Else 
									//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
								End if 
								//``
								SET MENU BAR:C67(DB_t_CUrrentMenuReference)
								DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
							Else 
								If ($_t_GroupCode#"")
									MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
									
									READ WRITE:C146([HEADINGS:84])
									QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_GroupCode)
									GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
									$_t_WindowTitle:=Get window title:C450
									FORM SET INPUT:C55([HEADINGS:84]; "Heading_in")
									$_t_WinCurrentInputForm:="Heading_in"
									
									//`SET MENU BAR(9)
									$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_AccountsHeading")
									
									SET WINDOW TITLE:C213($_t_WindowName+" "+[HEADINGS:84]Heading_Name:2)
									
									MODIFY RECORD:C57([HEADINGS:84]; *)
									$_t_LayoutReference:="Headings"+"_"+$_t_WinCurrentInputForm
									INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
									
									UNLOAD RECORD:C212([HEADINGS:84])
									READ ONLY:C145([HEADINGS:84])
									SET WINDOW TITLE:C213($_t_WindowTitle)
									SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
									//Need to make sure objects end up in the correct place 2
									USE SET:C118("$Temp")  //``
									
									If (DB_bo_ShowArrayBased)
										//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
									Else 
										//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
									End if 
									//``
									SET MENU BAR:C67(DB_t_CUrrentMenuReference)
									DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
									DB_SetFormMenuoptions
									DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
									
								End if 
							End if 
						End if 
					Else 
						Gen_Alert("Sorry you do not have access to accounts records")
						
					End if 
				End if 
				
			Else 
				USE SET:C118("ListboxSet0")
				READ WRITE:C146([ACCOUNT_BALANCES:34])
				
				FIRST RECORD:C50([ACCOUNT_BALANCES:34])
				If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ACCOUNT_BALANCES:34]; 1))
					$_t_AutosearchCode:=[ACCOUNT_BALANCES:34]Unique_StringIdent:8
					UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
					READ ONLY:C145([ACCOUNT_BALANCES:34])
					
					//ZAccBal_Bal ($_t_AutosearchCode;"TRUE";->$EditACBALProcess)
					$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccountBalance")
					
					$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; $_l_CurrentDisplayedForm; DB_t_CurrentContext; $_t_AutosearchCode)
					
					USE SET:C118("$Temp")
					DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				Else 
					MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
					
					$_t_WindowTitle:=Get window title:C450
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					FORM SET INPUT:C55([ACCOUNT_BALANCES:34]; "AccBal_in")  //NG April 2004 removed reference to ◊screen
					
					$_t_WinCurrentInputForm:="AccBal_in"
					
					//`SET MENU BAR(9)
					ACCBAL_Bo_NoCancel:=True:C214
					$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_AccountBalance")
					SET WINDOW TITLE:C213($_t_WindowName)
					MODIFY RECORD:C57([ACCOUNT_BALANCES:34]; *)
					$_t_LayoutReference:="ACCCOUNT_BALANCES"+"_"+$_t_WinCurrentInputForm
					INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
					
					UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
					READ ONLY:C145([ACCOUNT_BALANCES:34])
					SET WINDOW TITLE:C213($_t_WindowTitle)
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					//Need to make sure objects end up in the correct place 2
					USE SET:C118("$Temp")  //``
					
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
					
					//``
					SET MENU BAR:C67(DB_t_CUrrentMenuReference)
					
					
					
				End if 
			End if 
			DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
		TRACE:C157
		
		CREATE SET:C116([ACCOUNTS:32]; "$temp")
		If ($_l_FromTableDisplayedForm#0)
			
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			
			LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
			LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			$_bo_CheckedAccountCode:=False:C215
			$_t_AccountCode:=""
			$_t_GroupCode:=""
			
			//USE SET("ListboxSet0")
			If ($_l_Row>0)
				
				For ($_l_ColumnIndex; Size of array:C274($_aptr_ColumnVariables); 1; -1)
					RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_ColumnIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					If (Position:C15("Group"; $_t_VariableName)>0)
						If (Position:C15("Codes"; $_t_VariableName)>0)
							$_ptr_ThisArray:=$_aptr_ColumnVariables{$_l_ColumnIndex}
							If (Not:C34($_bo_CheckedAccountCode))
								$_t_AccountCode:=$_ptr_ThisArray->{$_l_Row}
								$_bo_CheckedAccountCode:=True:C214
							Else 
								$_t_GroupCode:=$_ptr_ThisArray->{$_l_Row}
							End if 
							If ($_t_AccountCode#"") | ($_t_GroupCode#"")
								$_l_ColumnIndex:=1
							End if 
						End if 
					End if 
				End for 
			End if 
			//FIRST RECORD([ACCOUNTS])
		Else 
			$_t_AccountCode:=[ACCOUNTS:32]Account_Code:2
			UNLOAD RECORD:C212([ACCOUNTS:32])
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
			
			READ WRITE:C146([ACCOUNTS:32])
			
			
			If (DB_bo_RecordsinNewProcess) & (Not:C34(Check_Locked(->[ACCOUNTS:32]; 1)))
				
				Case of 
					: ($_t_AccountCode#"")
						//We could be opening an account or a heading.
						
						
						$_t_AutosearchCode:=[ACCOUNTS:32]Account_Code:2
						UNLOAD RECORD:C212([ACCOUNTS:32])
						READ ONLY:C145([ACCOUNTS:32])
						
						$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Account")
						
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; $_l_CurrentDisplayedForm; DB_t_CurrentContext; $_t_AccountCode)
						USE SET:C118("$Temp")
						DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						//ZAccounts_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
					: ($_t_GroupCode#"")
						
				End case 
			Else 
				Case of 
					: ($_t_AccountCode#"")
						READ WRITE:C146([ACCOUNTS:32])
						MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
						
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_t_AccountCode)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						$_t_CurrentInputFormWAS:=WIN_t_CurrentInputForm
						FORM SET INPUT:C55([ACCOUNTS:32]; "Accounts_in")
						$_t_WinCurrentInputForm:="Accounts_in"
						Win_t_CurrentInputForm:="Accounts_in"
						WIN_t_CurrentInputForm:=$_t_CurrentInputFormWAS
						//`SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Account")
						SET WINDOW TITLE:C213($_t_WindowName+" "+[ACCOUNTS:32]Account_Name:3)
						
						MODIFY RECORD:C57([ACCOUNTS:32]; *)
						$_t_LayoutReference:="Accounts"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						
						UNLOAD RECORD:C212([ACCOUNTS:32])
						READ ONLY:C145([ACCOUNTS:32])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						//Need to make sure objects end up in the correct place 2
						USE SET:C118("$Temp")  //``
						
						If (DB_bo_ShowArrayBased)
							//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
						Else 
							//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
						End if 
						//``
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormMenuoptions
						DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: ($_t_GroupCode#"")
						MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
						
						READ WRITE:C146([HEADINGS:84])
						QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_GroupCode)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([HEADINGS:84]; "Heading_in")
						$_t_WinCurrentInputForm:="Heading_in"
						
						//`SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_AccountsHeading")
						
						SET WINDOW TITLE:C213($_t_WindowName+" "+[HEADINGS:84]Heading_Name:2)
						
						MODIFY RECORD:C57([HEADINGS:84]; *)
						$_t_LayoutReference:="Headings"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						
						UNLOAD RECORD:C212([HEADINGS:84])
						READ ONLY:C145([HEADINGS:84])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						//Need to make sure objects end up in the correct place 2
						USE SET:C118("$Temp")  //``
						
						If (DB_bo_ShowArrayBased)
							//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
						Else 
							//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
						End if 
						//``
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormMenuoptions
						DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						
						
				End case 
			End if 
		Else 
			Gen_Alert("Sorry you do not have access to accounts records")
			
		End if 
		
		
		
		
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ACTIONS:13]))
		//CREATE SET([ACTIONS];"$Temp")
		//USE SET("ListboxSet0")
		//FIRST RECORD([ACTIONS])
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ACTIONS:13])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ACTIONS:13]; 1))
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				LOAD RECORD:C52([ACTIONS:13])
				$_t_AutosearchCode:=[ACTIONS:13]Action_Code:1
				UNLOAD RECORD:C212([ACTIONS:13])
				READ ONLY:C145([ACTIONS:13])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Action")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ACTIONS:13]); ""; $_t_AutosearchCode)
				
				//USE SET("$Temp")
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
				//ZResults_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				
			Else 
				
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([ACTIONS:13])
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ACTIONS:13]; "Action_In")
				$_t_WinCurrentInputForm:="Action_In"
				//`SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Action")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ACTIONS:13]Action_Name:2)
				
				MODIFY RECORD:C57([ACTIONS:13]; *)
				$_t_LayoutReference:="ACTIONS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([ACTIONS:13])
				READ ONLY:C145([ACTIONS:13])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				//``
				If (DB_bo_ShowArrayBased)
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
				Else 
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
				End if 
				//``
				//USE SET("$Temp")
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)  //
				
				//DB_SetFormMenuoptions
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
			End if 
			//DB_SetFormMenuoptions
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ADDRESS_FORMATS:74]))
		//CREATE SET([ADDRESS_FORMATS];"$Temp")
		//USE SET("ListboxSet0")
		//FIRST RECORD([ADDRESS_FORMATS])
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ADDRESS_FORMATS:74])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ADDRESS_FORMATS:74]; 1))
				
				LOAD RECORD:C52([ADDRESS_FORMATS:74])
				$_t_AutosearchCode:=[ADDRESS_FORMATS:74]Format_Code:1
				UNLOAD RECORD:C212([ADDRESS_FORMATS:74])
				READ ONLY:C145([ADDRESS_FORMATS:74])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AddressFormat")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ADDRESS_FORMATS:74]); ""; $_t_AutosearchCode)
				
				//USE SET("$Temp")
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
				//ZResults_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				
			Else 
				READ WRITE:C146([ADDRESS_FORMATS:74])
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ADDRESS_FORMATS:74]; "Types_In")
				$_t_WinCurrentInputForm:="Types_In"
				//`SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_AddressFormat")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ADDRESS_FORMATS:74]Format_Name:2)
				
				MODIFY RECORD:C57([ADDRESS_FORMATS:74]; *)
				$_t_LayoutReference:="ADDRESS_FORMATS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([ADDRESS_FORMATS:74])
				READ ONLY:C145([ADDRESS_FORMATS:74])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				//USE SET("$Temp")  ```
				If (DB_bo_ShowArrayBased)
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
				Else 
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
				End if 
				//``
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ANALYSES:36]))
		//CREATE SET([ANALYSES];"$Temp")
		//USE SET("ListboxSet0")
		//FIRST RECORD([ANALYSES])
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ANALYSES:36])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ANALYSES:36]; 1))
				LOAD RECORD:C52([ANALYSES:36])
				
				$_t_AutosearchCode:=[ANALYSES:36]Analysis_Code:1
				UNLOAD RECORD:C212([ANALYSES:36])
				READ ONLY:C145([ANALYSES:36])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Analysis")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ANALYSES:36]); ""; $_t_AutosearchCode)
				//`USE SET("$Temp")
				DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				//ZResults_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([ANALYSES:36])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ANALYSES:36]; "Analysis_In")
				$_t_WinCurrentInputForm:="Analysis_In"
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Analysis")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ANALYSES:36]Analysis_Name:2)
				
				MODIFY RECORD:C57([ANALYSES:36]; *)
				$_t_LayoutReference:="ANALYSES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([ANALYSES:36])
				READ ONLY:C145([ANALYSES:36])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				//USE SET("$Temp")  ```
				If (DB_bo_ShowArrayBased)
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
				Else 
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
				End if 
				//``
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[AREAS:3]))
		//CREATE SET([AREAS];"$Temp")
		//USE SET("ListboxSet0")
		//FIRST RECORD([AREAS])
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([AREAS:3])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[AREAS:3]; 1))
				
				LOAD RECORD:C52([AREAS:3])
				
				$_t_AutosearchCode:=[AREAS:3]Area_Code:1
				UNLOAD RECORD:C212([AREAS:3])
				READ ONLY:C145([AREAS:3])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Area")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[AREAS:3]); ""; $_t_AutosearchCode)
				
				//USE SET("$temp")
				DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				//ZResults_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([AREAS:3])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([AREAS:3]; "Area_in")
				$_t_WinCurrentInputForm:="Area_in"
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Area")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[AREAS:3]Area_Name:2)
				
				MODIFY RECORD:C57([AREAS:3]; *)
				$_t_LayoutReference:="AREA"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([AREAS:3])
				READ ONLY:C145([AREAS:3])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				//``
				//USE SET("$temp")
				If (DB_bo_ShowArrayBased)
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
				Else 
					//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
					
					
				End if 
				//``
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				//DB_SetFormSortOrder ($_l_CurrentDisplayedForm;DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_BRANDS:8]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PRODUCT_BRANDS:8])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PRODUCT_BRANDS:8]; 1))
				LOAD RECORD:C52([PRODUCT_BRANDS:8])
				$_t_AutosearchCode:=[PRODUCT_BRANDS:8]Brand_Code:1
				UNLOAD RECORD:C212([PRODUCT_BRANDS:8])
				READ ONLY:C145([PRODUCT_BRANDS:8])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Brand")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[PRODUCT_BRANDS:8]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PRODUCT_BRANDS:8])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PRODUCT_BRANDS:8]; "Brands_In")
				$_t_WinCurrentInputForm:="Brands_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Brand")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PRODUCT_BRANDS:8]Brand_Name:2)
				MODIFY RECORD:C57([PRODUCT_BRANDS:8]; *)
				$_t_LayoutReference:="BRANDS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PRODUCT_BRANDS:8])
				READ ONLY:C145([PRODUCT_BRANDS:8])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTRACT_TYPES:19]))
		
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([CONTRACT_TYPES:19])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CONTRACT_TYPES:19]; 1))
				
				LOAD RECORD:C52([CONTRACT_TYPES:19])
				
				$_t_AutosearchCode:=[CONTRACT_TYPES:19]Contract_Type_Code:1
				UNLOAD RECORD:C212([CONTRACT_TYPES:19])
				READ ONLY:C145([CONTRACT_TYPES:19])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ContractTypes")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[CONTRACT_TYPES:19]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([CONTRACT_TYPES:19])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([CONTRACT_TYPES:19]; "ContractType_In")
				$_t_WinCurrentInputForm:="ContractType_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_ContractTypes")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CONTRACT_TYPES:19]Contract_Type_Name:2)
				MODIFY RECORD:C57([CONTRACT_TYPES:19]; *)
				$_t_LayoutReference:="Contract Types"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([CONTRACT_TYPES:19])
				READ ONLY:C145([CONTRACT_TYPES:19])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([CONTRACTS:17])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CONTRACTS:17]; 1))
				LOAD RECORD:C52([CONTRACTS:17])
				$_t_AutosearchCode:=[CONTRACTS:17]Contract_Code:3
				UNLOAD RECORD:C212([CONTRACTS:17])
				READ ONLY:C145([CONTRACTS:17])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contract")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[CONTRACTS:17]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
				
				READ WRITE:C146([CONTRACTS:17])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([CONTRACTS:17]; "Contract_in")
				$_t_WinCurrentInputForm:="Contract_in"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Contract")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CONTRACTS:17]Contract_Code:3)
				ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
				
				MODIFY RECORD:C57([CONTRACTS:17]; *)
				$_t_LayoutReference:="Contracts"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([CONTRACTS:17])
				READ ONLY:C145([CONTRACTS:17])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[COUNTRIES:73]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([COUNTRIES:73])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[COUNTRIES:73]; 1))
				LOAD RECORD:C52([COUNTRIES:73])
				$_t_AutosearchCode:=[COUNTRIES:73]COUNTRY_CODE:1
				UNLOAD RECORD:C212([COUNTRIES:73])
				READ ONLY:C145([COUNTRIES:73])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Country")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[COUNTRIES:73]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([COUNTRIES:73])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([COUNTRIES:73]; "Country_In")
				$_t_WinCurrentInputForm:="Country_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Country")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[COUNTRIES:73]COUNTRY_CODE:1)
				
				MODIFY RECORD:C57([COUNTRIES:73]; *)
				$_t_LayoutReference:="Countries"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([COUNTRIES:73])
				READ ONLY:C145([COUNTRIES:73])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[CREDIT_STAGES:54]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([CREDIT_STAGES:54])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CREDIT_STAGES:54]; 1))
				LOAD RECORD:C52([CREDIT_STAGES:54])
				$_t_AutosearchCode:=[CREDIT_STAGES:54]Stage_Code:1
				UNLOAD RECORD:C212([CREDIT_STAGES:54])
				READ ONLY:C145([CREDIT_STAGES:54])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CreditStage")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[CREDIT_STAGES:54]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([CREDIT_STAGES:54])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([CREDIT_STAGES:54]; "CreditStage_In")
				$_t_WinCurrentInputForm:="CreditStage_In"
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_CreditStage")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CREDIT_STAGES:54]Stage_Name:2)
				MODIFY RECORD:C57([CREDIT_STAGES:54]; *)
				$_t_LayoutReference:="Credit stages"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([CREDIT_STAGES:54])
				READ ONLY:C145([CREDIT_STAGES:54])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CURRENCIES:71]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([CURRENCIES:71])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CURRENCIES:71]; 1))
				LOAD RECORD:C52([CURRENCIES:71])
				$_t_AutosearchCode:=[CURRENCIES:71]Currency_Code:1
				UNLOAD RECORD:C212([CURRENCIES:71])
				READ ONLY:C145([CURRENCIES:71])
				
				$_t_WindowName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Currency")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_WindowName; Current process:C322; Table:C252(->[CURRENCIES:71]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([CURRENCIES:71])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([CURRENCIES:71]; "Currency_In")
				$_t_WinCurrentInputForm:="Currency_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Currency")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CURRENCIES:71]Currency_Name:2)
				MODIFY RECORD:C57([CURRENCIES:71]; *)
				$_t_LayoutReference:="Currencies"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([CURRENCIES:71])
				READ ONLY:C145([CURRENCIES:71])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([CURRENT_STOCK:62])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[CURRENT_STOCK:62]; 1))
				LOAD RECORD:C52([CURRENT_STOCK:62])
				$_t_AutosearchCode:=String:C10([CURRENT_STOCK:62]X_ID:13)
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				READ ONLY:C145([CURRENT_STOCK:62])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Stock")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[CURRENT_STOCK:62]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
				
				READ WRITE:C146([CURRENT_STOCK:62])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([CURRENT_STOCK:62]; "CurrentStock_In")
				$_t_WinCurrentInputForm:="CurrentStock_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Stock")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[CURRENT_STOCK:62]Product_Code:1)
				MODIFY RECORD:C57([CURRENT_STOCK:62]; *)
				$_t_LayoutReference:="CURRENT STOCK"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([CURRENT_STOCK:62])
				READ ONLY:C145([CURRENT_STOCK:62])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DiaryManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([DIARY:12])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[DIARY:12]; 1))
				LOAD RECORD:C52([DIARY:12])
				$_t_AutosearchCode:=String:C10([DIARY:12]Diary_Code:3)
				UNLOAD RECORD:C212([DIARY:12])
				READ ONLY:C145([DIARY:12])
				
				Case of 
					: (DB_t_CurrentContext="Letters")
						$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Letter")
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[DIARY:12]); "Letters"; $_t_AutosearchCode)
						USE SET:C118("$temp")
						DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: (DB_t_CurrentContext="Emails")
						$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Email")
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[DIARY:12]); "Email"; $_t_AutosearchCode)
						USE SET:C118("$temp")
						DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						//ZResults_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				End case 
			Else 
				
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
				
				
				READ WRITE:C146([DIARY:12])
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				Case of 
					: (DB_t_CurrentContext="Letters") | (DB_t_CurrentContext="Documents")
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
						$_bo_UserTable:=False:C215
						Case of 
							: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter)
								
								//SET MENU BAR(40)
								MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
								FORM SET INPUT:C55([DIARY:12]; "Diary_inLW")  //
								
								
								$_t_WinCurrentInputForm:="Diary_inLW"
								$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Letter")
								
								SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Document_Code:15)
							: ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Email)
								
								//SET MENU BAR(9)
								MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
								FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")  //<--NOTE THIS ON A DIFFERENT TABLE
								
								
								$_t_WinCurrentInputForm:="SD2_EmailEntry"
								$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Email")
								
								SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Document_Code:15)
								$_bo_UserTable:=True:C214
							Else 
								If (Records in selection:C76([DOCUMENTS:7])=0)
									//INPUT FORM([DIARY];"SD2_Input")
									//SET MENU BAR(17)
									FORM SET INPUT:C55([DIARY:12]; "Diary_InNEW")
									$_t_WinCurrentInputForm:="Diary_InNEW"
									$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Diary")
									
									SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Diary_Code:3)
								Else 
									Case of 
										: ([DOCUMENTS:7]EMail_Header:25#"")
											//SET MENU BAR(9)
											FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")  //<--NOTE THIS ON A DIFFERENT TABLE
											
											$_t_WinCurrentInputForm:="SD2_EmailEntry"
											$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Email")
											SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Document_Code:15)
											$_bo_UserTable:=True:C214
											
										Else 
											//SET MENU BAR(40)
											FORM SET INPUT:C55([DIARY:12]; "Diary_inLW")  //NG April 2004 removed reference to ◊screen
											
											$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Letter")
											SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Document_Code:15)
											$_t_WinCurrentInputForm:="Diary_inLW"
											
									End case 
								End if 
						End case 
					Else 
						//view will be determined by the action type
						$_t_actionType:=[DIARY:12]Action_Code:9
						$_t_DiaryForm:=[DIARY:12]xDiaryForm:66
						If ($_t_actionType#"")
							If ($_t_DiaryForm#"")
								//translate that to a layout
							Else 
								
								QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_actionType)
								$_t_DiaryForm:=[ACTIONS:13]UseDateEntryForm:41
								//translate that to a layout
								
							End if 
							$_t_DiaryForm:="Diary_In"
						Else 
							$_t_DiaryForm:="Diary_In"
						End if 
						FORM SET INPUT:C55([DIARY:12]; $_t_DiaryForm)  //NG April 2004 removed reference to ◊screen
						
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Letter")
						SET WINDOW TITLE:C213($_t_WindowName+" "+[DIARY:12]Document_Code:15)
						$_t_WinCurrentInputForm:=$_t_DiaryForm
						
				End case 
				
				If ($_bo_UserTable)
					ALL RECORDS:C47([USER:15])
					MODIFY RECORD:C57([USER:15]; *)
					$_t_LayoutReference:="USER"+"_"+$_t_WinCurrentInputForm
					INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
					
				Else 
					MODIFY RECORD:C57([DIARY:12]; *)
					$_t_LayoutReference:="DIARY"+"_"+$_t_WinCurrentInputForm
					INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
					
					UNLOAD RECORD:C212([DIARY:12])
					READ ONLY:C145([DIARY:12])
				End if 
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
		
		Case of 
			: (DB_t_CurrentContext="Reports")
				READ WRITE:C146([DOCUMENTS:7])
				
				$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
				
				If ($_l_ModuleAccess>=2)
					If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[DOCUMENTS:7]; 1))
						LOAD RECORD:C52([DOCUMENTS:7])
						
						$_t_AutosearchCode:=[DOCUMENTS:7]Document_Code:1
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						
						$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Reports")
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[DOCUMENTS:7]); DB_t_CurrentContext; $_t_AutosearchCode)
						
					Else 
						MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
						
						READ WRITE:C146([DOCUMENTS:7])
						
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
						$_t_WinCurrentInputForm:="Report_in"
						
						//SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+[DOCUMENTS:7]Heading:2
						
						SET WINDOW TITLE:C213($_t_WindowName+" "+[DOCUMENTS:7]Heading:2)
						
						MODIFY RECORD:C57([DOCUMENTS:7]; *)
						$_t_LayoutReference:="DOCUMENTS"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					End if 
					DB_SetFormMenuoptions
					
					
				Else 
				End if 
				
			: (DB_t_CurrentContext="Letters")
				
				
				$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_WPManager))
				
				If ($_l_ModuleAccess>=2)
					READ WRITE:C146([DOCUMENTS:7])
					
					If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[DOCUMENTS:7]; 1))
						LOAD RECORD:C52([DOCUMENTS:7])
						$_t_AutosearchCode:=[DOCUMENTS:7]Document_Code:1
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						
						$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_DocumentTemplates")
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[DOCUMENTS:7]); DB_t_CurrentContext; $_t_AutosearchCode)
						
					Else 
						MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
						
						READ WRITE:C146([DOCUMENTS:7])
						
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_inW")
						$_t_WinCurrentInputForm:="Letters_inW"
						
						//SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+"Template"
						
						SET WINDOW TITLE:C213($_t_WindowName+" "+[DOCUMENTS:7]Heading:2)
						
						MODIFY RECORD:C57([DOCUMENTS:7]; *)
						$_t_LayoutReference:="DOCUMENTS"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					End if 
					DB_SetFormMenuoptions
					
				Else 
				End if 
				
				
			: (DB_t_CurrentContext="emails")
				
				
				$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_WPManager))
				
				If ($_l_ModuleAccess>=2)
					READ WRITE:C146([DOCUMENTS:7])
					
					If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[DOCUMENTS:7]; 1))
						LOAD RECORD:C52([DOCUMENTS:7])
						$_t_AutosearchCode:=[DOCUMENTS:7]Document_Code:1
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						
						$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_DocumentTemplates")
						$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[DOCUMENTS:7]); DB_t_CurrentContext; $_t_AutosearchCode)
						
						
						
					Else 
						MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
						
						READ WRITE:C146([DOCUMENTS:7])
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([DOCUMENTS:7]; "eMail_in")
						$_t_WinCurrentInputForm:="eMail_in"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+"Template"
						SET WINDOW TITLE:C213($_t_WindowName+" "+[DOCUMENTS:7]Heading:2)
						MODIFY RECORD:C57([DOCUMENTS:7]; *)
						$_t_LayoutReference:="DOCUMENTS"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						UNLOAD RECORD:C212([DOCUMENTS:7])
						READ ONLY:C145([DOCUMENTS:7])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						
					End if 
					DB_SetFormMenuoptions
					
					
				Else 
				End if 
				
			Else 
				//TRACE
		End case 
		//Templates or reports
	: ($_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		// No 'edit screen' here
		READ WRITE:C146([CUSTOM_FIELD_DEFINITiONS:99])
		LOAD RECORD:C52([CUSTOM_FIELD_DEFINITiONS:99])
		EDIT ITEM:C870([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1)
	: ($_l_CurrentDisplayedForm=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ADDITIONAL_RECORD_ANALYSIS:53])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ADDITIONAL_RECORD_ANALYSIS:53]; 1))
				LOAD RECORD:C52([ADDITIONAL_RECORD_ANALYSIS:53])
				$_t_AutosearchCode:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1
				UNLOAD RECORD:C212([ADDITIONAL_RECORD_ANALYSIS:53])
				READ ONLY:C145([ADDITIONAL_RECORD_ANALYSIS:53])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_FurtherAnalysis")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([ADDITIONAL_RECORD_ANALYSIS:53])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ADDITIONAL_RECORD_ANALYSIS:53]; "Furthers_In")
				$_t_WinCurrentInputForm:="Furthers_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_FurtherAnalysis")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2)
				MODIFY RECORD:C57([ADDITIONAL_RECORD_ANALYSIS:53]; *)
				$_t_LayoutReference:="FURTHERS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([ADDITIONAL_RECORD_ANALYSIS:53])
				READ ONLY:C145([ADDITIONAL_RECORD_ANALYSIS:53])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_GROUPS:10]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PRODUCT_GROUPS:10])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PRODUCT_GROUPS:10]; 1))
				LOAD RECORD:C52([PRODUCT_GROUPS:10])
				$_t_AutosearchCode:=[PRODUCT_GROUPS:10]Group_Code:1
				UNLOAD RECORD:C212([PRODUCT_GROUPS:10])
				READ ONLY:C145([PRODUCT_GROUPS:10])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Action")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PRODUCT_GROUPS:10]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PRODUCT_GROUPS:10])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PRODUCT_GROUPS:10]; "ProductGroup_In")
				$_t_WinCurrentInputForm:="ProductGroup_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Action")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PRODUCT_GROUPS:10]Group_Name:2)
				MODIFY RECORD:C57([PRODUCT_GROUPS:10]; *)
				$_t_LayoutReference:="GROUPS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PRODUCT_GROUPS:10])
				READ ONLY:C145([PRODUCT_GROUPS:10])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make sure objects end up in the correct place 2
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		//USE SET("$temp")
	: ($_l_CurrentDisplayedForm=Table:C252(->[HEADINGS:84]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([HEADINGS:84])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[HEADINGS:84]; 1))
				LOAD RECORD:C52([HEADINGS:84])
				$_t_AutosearchCode:=[HEADINGS:84]Heading_Code:1
				UNLOAD RECORD:C212([HEADINGS:84])
				READ ONLY:C145([HEADINGS:84])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccountsHeading")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[HEADINGS:84]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([HEADINGS:84])
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([HEADINGS:84]; "Heading_in")
				$_t_WinCurrentInputForm:="Heading_in"
				
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_AccountsHeading")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[HEADINGS:84]Heading_Name:2)
				
				MODIFY RECORD:C57([HEADINGS:84]; *)
				$_t_LayoutReference:="HEADINGS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([HEADINGS:84])
				READ ONLY:C145([HEADINGS:84])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
		//TRACE
		//$_bo_OK:=Check_Locked (->[INVOICES];1)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesLedger))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([INVOICES:39])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[INVOICES:39]; 1))
				LOAD RECORD:C52([INVOICES:39])
				$_t_AutosearchCode:=[INVOICES:39]Invoice_Number:1
				UNLOAD RECORD:C212([INVOICES:39])
				READ ONLY:C145([INVOICES:39])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")
				$_t_ProcessName:=Term_SLPLWT($_t_ProcessName)
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[INVOICES:39]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)
				
				READ WRITE:C146([INVOICES:39])
				ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				
				Case of 
					: (DB_t_CurrentContext="ViewCreditnotes") | (DB_t_CurrentContext="View Credit notes")
						//SET MENU BAR(28)
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_In")
						$_t_WinCurrentInputForm:="Invoice_In"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_CreditNote")
						$_t_WindowName:=Term_SLPLWT($_t_WindowName)
						SET WINDOW TITLE:C213($_t_WindowName+" "+[INVOICES:39]Invoice_Number:1)
					: (DB_t_CurrentContext="ViewDeposits") | (DB_t_CurrentContext="View Deposits") | (DB_t_CurrentContext="Refund Deposit")
						
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_inP")
						//`SET MENU BAR(9)
						$_t_WinCurrentInputForm:="Invoice_inP"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Deposit")
						$_t_WindowName:=Term_SLPLWT($_t_WindowName)
						SET WINDOW TITLE:C213($_t_WindowName+" "+[INVOICES:39]Invoice_Number:1)
					: (DB_t_CurrentContext="Proformas") | (DB_t_CurrentContext="View Proformas")
						//SET MENU BAR(28)
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_In")
						$_t_WinCurrentInputForm:="Invoice_In"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Proforma")
						$_t_WindowName:=Term_SLPLWT($_t_WindowName)
						SET WINDOW TITLE:C213($_t_WindowName+" "+[INVOICES:39]Invoice_Number:1)
					: (DB_t_CurrentContext="Receipts") | (DB_t_CurrentContext="View Receipts")
						//SET MENU BAR(28)
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_In")
						$_t_WinCurrentInputForm:="Invoice_In"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Receipt")
						$_t_WindowName:=Term_SLPLWT($_t_WindowName)
						SET WINDOW TITLE:C213($_t_WindowName+" "+[INVOICES:39]Invoice_Number:1)
					Else 
						//SET MENU BAR(28)
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_In")
						$_t_WinCurrentInputForm:="Invoice_In"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Invoice")
						$_t_WindowName:=Term_SLPLWT($_t_WindowName)
						SET WINDOW TITLE:C213($_t_WindowName+" "+[INVOICES:39]Invoice_Number:1)
				End case 
				MODIFY RECORD:C57([INVOICES:39]; *)
				$_t_LayoutReference:="INVOICES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([INVOICES:39])
				READ ONLY:C145([INVOICES:39])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[JOB_STAGES:47]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([JOB_STAGES:47])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[JOB_STAGES:47]; 1))
				LOAD RECORD:C52([JOB_STAGES:47])
				$_t_AutosearchCode:=[JOB_STAGES:47]Job_Stage_code:52
				UNLOAD RECORD:C212([JOB_STAGES:47])
				READ ONLY:C145([JOB_STAGES:47])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStage")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[JOB_STAGES:47]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
				
				READ WRITE:C146([JOB_STAGES:47])
				ARRAY POINTER:C280(JST_aptr_LBSettings; 0)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([JOB_STAGES:47]; "JobStage_in")  //[JOB STAGES];"JobStage_in"
				
				$_t_WinCurrentInputForm:="JobStage_in"
				
				//SET MENU BAR(80)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_JobStage")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[JOB_STAGES:47]Stage_Name:3)
				
				MODIFY RECORD:C57([JOB_STAGES:47]; *)
				$_t_LayoutReference:="JOB STAGES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([JOB_STAGES:47])
				READ ONLY:C145([JOB_STAGES:47])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[JOB_TYPES:65]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([JOB_TYPES:65])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[JOB_TYPES:65]; 1))
				LOAD RECORD:C52([JOB_TYPES:65])
				$_t_AutosearchCode:=[JOB_TYPES:65]Type_Code:1
				UNLOAD RECORD:C212([JOB_TYPES:65])
				READ ONLY:C145([JOB_TYPES:65])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobType")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[JOB_TYPES:65]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([JOB_TYPES:65])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([JOB_TYPES:65]; "Types_In")
				$_t_WinCurrentInputForm:="Types_In"
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_JobType")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[JOB_TYPES:65]Type_Name:2)
				MODIFY RECORD:C57([JOB_TYPES:65]; *)
				$_t_LayoutReference:="JOB TYPES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([JOB_TYPES:65])
				READ ONLY:C145([JOB_TYPES:65])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([JOBS:26])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[JOBS:26]; 1))
				LOAD RECORD:C52([JOBS:26])
				$_t_AutosearchCode:=[JOBS:26]Job_Code:1
				UNLOAD RECORD:C212([JOBS:26])
				READ ONLY:C145([JOBS:26])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Job")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[JOBS:26]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
				
				READ WRITE:C146([JOBS:26])
				READ WRITE:C146([JOB PERSONNEL:48])
				READ WRITE:C146([JOB_STAGES:47])
				READ WRITE:C146([ORDER_ITEMS:25])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([JOBS:26]; "Job_In")
				$_t_WinCurrentInputForm:="Job_In"
				ARRAY POINTER:C280(JOB_aPtr_OrderItemsSetup; 0)
				
				vFromIn:=False:C215
				//SET MENU BAR(31)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Job")
				
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[JOBS:26]Job_Name:2)
				
				MODIFY RECORD:C57([JOBS:26]; *)
				$_t_LayoutReference:="JOBS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([JOBS:26])
				UNLOAD RECORD:C212([JOB PERSONNEL:48])
				UNLOAD RECORD:C212([JOB_STAGES:47])
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				READ ONLY:C145([JOBS:26])
				READ ONLY:C145([JOB PERSONNEL:48])
				READ ONLY:C145([JOB_STAGES:47])
				READ ONLY:C145([ORDER_ITEMS:25])
				
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[LAYERS:76]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([LAYERS:76])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[LAYERS:76]; 1))
				LOAD RECORD:C52([LAYERS:76])
				
				$_t_AutosearchCode:=[LAYERS:76]Layer_Code:1
				UNLOAD RECORD:C212([LAYERS:76])
				READ ONLY:C145([LAYERS:76])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Layer")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[LAYERS:76]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([LAYERS:76])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([LAYERS:76]; "Layer_In")
				$_t_WinCurrentInputForm:="Layer_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Layer")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[LAYERS:76]Layer_Name:2)
				
				MODIFY RECORD:C57([LAYERS:76]; *)
				$_t_LayoutReference:="LAYERS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				
				UNLOAD RECORD:C212([LAYERS:76])
				READ ONLY:C145([LAYERS:76])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[LOCATIONS:61]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([LOCATIONS:61])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[LOCATIONS:61]; 1))
				LOAD RECORD:C52([LOCATIONS:61])
				$_t_AutosearchCode:=[LOCATIONS:61]Location_Code:1
				UNLOAD RECORD:C212([LOCATIONS:61])
				READ ONLY:C145([LOCATIONS:61])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Location")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[LOCATIONS:61]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([LOCATIONS:61])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([LOCATIONS:61]; "Location_In")
				$_t_WinCurrentInputForm:="Location_In"
				
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Location")
				
				SET WINDOW TITLE:C213($_t_WindowName+" "+[LOCATIONS:61]Location_Name:2)
				
				MODIFY RECORD:C57([LOCATIONS:61]; *)
				$_t_LayoutReference:="Locations"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([LOCATIONS:61])
				READ ONLY:C145([LOCATIONS:61])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[SCRIPTS:80]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([SCRIPTS:80])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[SCRIPTS:80]; 1))
				LOAD RECORD:C52([SCRIPTS:80])
				$_t_AutosearchCode:=[SCRIPTS:80]Script_Code:1
				UNLOAD RECORD:C212([SCRIPTS:80])
				READ ONLY:C145([SCRIPTS:80])
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Macro")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[SCRIPTS:80]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([SCRIPTS:80])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([SCRIPTS:80]; "Scripts_in")
				$_t_WinCurrentInputForm:="Scripts_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Macro")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[SCRIPTS:80]Script_Name:2)
				MODIFY RECORD:C57([SCRIPTS:80]; *)
				$_t_LayoutReference:="MACROS"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([SCRIPTS:80])
				READ ONLY:C145([SCRIPTS:80])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[MOVEMENT_TYPES:60]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([MOVEMENT_TYPES:60])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[MOVEMENT_TYPES:60]; 1))
				LOAD RECORD:C52([MOVEMENT_TYPES:60])
				$_t_AutosearchCode:=[MOVEMENT_TYPES:60]Type_Code:1
				UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
				READ ONLY:C145([MOVEMENT_TYPES:60])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_MovementType")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[MOVEMENT_TYPES:60]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([MOVEMENT_TYPES:60])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([MOVEMENT_TYPES:60]; "MoveType_in")
				$_t_WinCurrentInputForm:="MoveType_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_MovementType")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[MOVEMENT_TYPES:60]Type_Code:1)
				MODIFY RECORD:C57([MOVEMENT_TYPES:60]; *)
				$_t_LayoutReference:="Movement types"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
				READ ONLY:C145([MOVEMENT_TYPES:60])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				//Need to make 2sure objects end up in the correct place 2
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ORDERS:24])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ORDERS:24]; 1))
				LOAD RECORD:C52([ORDERS:24])
				
				$_t_AutosearchCode:=[ORDERS:24]Order_Code:3
				UNLOAD RECORD:C212([ORDERS:24])
				READ ONLY:C145([ORDERS:24])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Orders")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ORDERS:24]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
				
				LBI_bo_RowDragged:=False:C215
				READ WRITE:C146([ORDERS:24])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ORDERS:24]; "Order_In")
				$_t_WinCurrentInputForm:="Order_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Orders")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ORDERS:24]Order_Code:3)
				MODIFY RECORD:C57([ORDERS:24]; *)
				$_t_LayoutReference:="orders"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([ORDERS:24])
				READ ONLY:C145([ORDERS:24])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ORDER_ITEMS:25])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ORDER_ITEMS:25]; 1))
				LOAD RECORD:C52([ORDER_ITEMS:25])
				$_t_AutosearchCode:=String:C10([ORDER_ITEMS:25]Item_Number:27)
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				READ ONLY:C145([ORDER_ITEMS:25])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_OrderItem")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ORDER_ITEMS:25]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)
				
				ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
				
				READ WRITE:C146([ORDER_ITEMS:25])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ORDER_ITEMS:25]; "Items_in")
				$_t_WinCurrentInputForm:="Items_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_OrderItem")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ORDER_ITEMS:25]Order_Code:1)
				MODIFY RECORD:C57([ORDER_ITEMS:25]; *)
				$_t_LayoutReference:="order items"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				READ ONLY:C145([ORDER_ITEMS:25])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL_GROUPS:92]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PERSONNEL_GROUPS:92])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PERSONNEL_GROUPS:92]; 1))
				LOAD RECORD:C52([PERSONNEL_GROUPS:92])
				$_t_AutosearchCode:=([PERSONNEL_GROUPS:92]Group_Code:1)
				UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
				READ ONLY:C145([PERSONNEL_GROUPS:92])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PersonGroup")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PERSONNEL_GROUPS:92]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PERSONNEL_GROUPS:92])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PERSONNEL_GROUPS:92]; "PersonnelGroup_In")
				$_t_WinCurrentInputForm:="PersonnelGroup_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PersonGroup")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PERSONNEL_GROUPS:92]Group_Name:2)
				MODIFY RECORD:C57([PERSONNEL_GROUPS:92]; *)
				$_t_LayoutReference:="person groups"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
				READ ONLY:C145([PERSONNEL_GROUPS:92])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ ONLY:C145([PERSONNEL:11])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PERSONNEL:11]; 1))
				LOAD RECORD:C52([PERSONNEL:11])
				$_t_AutosearchCode:=String:C10([PERSONNEL:11]Personnel_ID:48)
				UNLOAD RECORD:C212([PERSONNEL:11])
				READ ONLY:C145([PERSONNEL:11])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Person")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PERSONNEL:11]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PERSONNEL:11])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PERSONNEL:11]; "Personnel_In")
				$_t_WinCurrentInputForm:="Personnel_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Person")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PERSONNEL:11]Name:2)
				MODIFY RECORD:C57([PERSONNEL:11]; *)
				$_t_LayoutReference:="personnel"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PERSONNEL:11])
				READ ONLY:C145([PERSONNEL:11])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[PICTURES:85]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PICTURES:85])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PICTURES:85]; 1))
				LOAD RECORD:C52([PICTURES:85])
				$_t_AutosearchCode:=[PICTURES:85]Picture_Code:1
				
				UNLOAD RECORD:C212([PICTURES:85])
				READ ONLY:C145([PICTURES:85])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Picture")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PICTURES:85]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PICTURES:85])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PICTURES:85]; "Picture_In")
				$_t_WinCurrentInputForm:="Picture_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Picture")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PICTURES:85]Picture_Name:2)
				MODIFY RECORD:C57([PICTURES:85]; *)
				$_t_LayoutReference:="picture"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PICTURES:85])
				READ ONLY:C145([PICTURES:85])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[POSTAL_CODES:50]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([POSTAL_CODES:50])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[POSTAL_CODES:50]; 1))
				LOAD RECORD:C52([POSTAL_CODES:50])
				$_t_AutosearchCode:=String:C10([POSTAL_CODES:50]xRec_ID:5)
				UNLOAD RECORD:C212([POSTAL_CODES:50])
				READ ONLY:C145([POSTAL_CODES:50])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PostCode")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[POSTAL_CODES:50]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([POSTAL_CODES:50])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([POSTAL_CODES:50]; "PostalCode_In")
				$_t_WinCurrentInputForm:="PostalCode_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PostCode")
				SET WINDOW TITLE:C213($_t_WindowName)
				MODIFY RECORD:C57([POSTAL_CODES:50]; *)
				$_t_LayoutReference:="Postal codes"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([POSTAL_CODES:50])
				READ ONLY:C145([POSTAL_CODES:50])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PRICE_GROUPS:18])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PRICE_GROUPS:18]; 1))
				LOAD RECORD:C52([PRICE_GROUPS:18])
				$_t_AutosearchCode:=[PRICE_GROUPS:18]Price_Code:1
				UNLOAD RECORD:C212([PRICE_GROUPS:18])
				READ ONLY:C145([PRICE_GROUPS:18])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PriceGroup")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PRICE_GROUPS:18]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PRICE_GROUPS:18])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PRICE_GROUPS:18]; "PriceGroup_In")
				$_t_WinCurrentInputForm:="PriceGroup_In"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PriceGroup")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[PRICE_GROUPS:18]Price_Name:2)
				MODIFY RECORD:C57([PRICE_GROUPS:18]; *)
				$_t_LayoutReference:="Price groups"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PRICE_GROUPS:18])
				READ ONLY:C145([PRICE_GROUPS:18])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PriceTable))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PRICE_TABLE:28])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PRICE_TABLE:28]; 1))
				LOAD RECORD:C52([PRICE_TABLE:28])
				$_t_AutosearchCode:=String:C10([PRICE_TABLE:28]x_ID:15)
				
				UNLOAD RECORD:C212([PRICE_TABLE:28])
				READ ONLY:C145([PRICE_TABLE:28])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Price")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PRICE_TABLE:28]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)
				
				READ WRITE:C146([PRICE_TABLE:28])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PRICE_TABLE:28]; "PriceTable_In")
				$_t_WinCurrentInputForm:="PriceTable_In"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Price")
				SET WINDOW TITLE:C213($_t_WindowName)
				MODIFY RECORD:C57([PRICE_TABLE:28]; *)
				$_t_LayoutReference:="Price table"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PRICE_TABLE:28])
				READ ONLY:C145([PRICE_TABLE:28])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PROBLEMS:22]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PROBLEMS:22])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PROBLEMS:22]; 1))
				LOAD RECORD:C52([PROBLEMS:22])
				$_t_AutosearchCode:=[PROBLEMS:22]Problem_Code:1
				UNLOAD RECORD:C212([PROBLEMS:22])
				READ ONLY:C145([PROBLEMS:22])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Problem")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PROBLEMS:22]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PROBLEMS:22])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PROBLEMS:22]; "Problems_In")
				$_t_WinCurrentInputForm:="Problems_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Problem")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PROBLEMS:22]Problem_Name:2)
				MODIFY RECORD:C57([PROBLEMS:22]; *)
				$_t_LayoutReference:="Problems"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PROBLEMS:22])
				READ ONLY:C145([PROBLEMS:22])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PROJECTS:89])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PROJECTS:89]; 1))
				LOAD RECORD:C52([PROJECTS:89])
				$_t_AutosearchCode:=[PROJECTS:89]Project_Code:1
				UNLOAD RECORD:C212([PROJECTS:89])
				READ ONLY:C145([PROJECTS:89])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Project")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PROJECTS:89]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
				
				READ WRITE:C146([PROJECTS:89])
				READ WRITE:C146([JOBS:26])
				READ WRITE:C146([JOB PERSONNEL:48])
				READ WRITE:C146([JOB_STAGES:47])
				READ WRITE:C146([ORDER_ITEMS:25])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PROJECTS:89]; "Projects_In")
				$_t_WinCurrentInputForm:="Projects_In"
				vFromIn:=False:C215
				//SET MENU BAR(77)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Project")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PROJECTS:89]Project_Name:2)
				MODIFY RECORD:C57([PROJECTS:89]; *)
				$_t_LayoutReference:="Projects"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PROJECTS:89])
				UNLOAD RECORD:C212([JOBS:26])
				UNLOAD RECORD:C212([JOB PERSONNEL:48])
				UNLOAD RECORD:C212([JOB_STAGES:47])
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				
				READ ONLY:C145([PROJECTS:89])
				READ ONLY:C145([JOBS:26])
				READ ONLY:C145([JOB PERSONNEL:48])
				READ ONLY:C145([JOB_STAGES:47])
				READ ONLY:C145([ORDER_ITEMS:25])
				
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Products))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PRODUCTS:9])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PRODUCTS:9]; 1))
				LOAD RECORD:C52([PRODUCTS:9])
				$_t_AutosearchCode:=[PRODUCTS:9]Product_Code:1
				UNLOAD RECORD:C212([PRODUCTS:9])
				READ ONLY:C145([PRODUCTS:9])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Product")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
				
				READ WRITE:C146([PRODUCTS:9])
				ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PRODUCTS:9]; "Products_in2009")
				$_t_WinCurrentInputForm:="Products_in2009"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Product")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PRODUCTS:9]Product_Name:2)
				MODIFY RECORD:C57([PRODUCTS:9]; *)
				$_t_LayoutReference:="Products"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PRODUCTS:9])
				READ ONLY:C145([PRODUCTS:9])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PUBLICATIONS:52]))
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PUBLICATIONS:52])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PUBLICATIONS:52]; 1))
				LOAD RECORD:C52([PUBLICATIONS:52])
				$_t_AutosearchCode:=[PUBLICATIONS:52]Publication_Code:1
				UNLOAD RECORD:C212([PUBLICATIONS:52])
				READ ONLY:C145([PUBLICATIONS:52])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Publication")
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PUBLICATIONS:52]); ""; $_t_AutosearchCode)
				
				//USE SET("$Temp2")
				
				DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([PUBLICATIONS:52])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PUBLICATIONS:52]; "Public_in")
				$_t_WinCurrentInputForm:="Public_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Publication")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PUBLICATIONS:52]Publication_Name:2)
				MODIFY RECORD:C57([PUBLICATIONS:52]; *)
				$_t_LayoutReference:="Publications"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PUBLICATIONS:52])
				READ ONLY:C145([PUBLICATIONS:52])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57]))
		//TRACE
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
		
		READ ONLY:C145([PURCHASE_ORDERS:57])
		If ($_l_ModuleAccess>=2) | Not:C34(Check_Locked(->[PURCHASE_ORDERS:57]; 1))
			If (DB_bo_RecordsinNewProcess)
				LOAD RECORD:C52([PURCHASE_ORDERS:57])
				$_t_AutosearchCode:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
				UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
				READ ONLY:C145([PURCHASE_ORDERS:57])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PURCHASE_ORDERS:57]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
				
				READ WRITE:C146([PURCHASE_ORDERS:57])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PURCHASE_ORDERS:57]; "PurchaseOrder_In")
				$_t_WinCurrentInputForm:="PurchaseOrder_In"
				ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
				MODIFY RECORD:C57([PURCHASE_ORDERS:57]; *)
				$_t_LayoutReference:="Purchase orders"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
				READ ONLY:C145([PURCHASE_ORDERS:57])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PURCHASE_ORDERS_ITEMS:169]; 1))
				LOAD RECORD:C52([PURCHASE_ORDERS_ITEMS:169])
				$_t_AutosearchCode:=String:C10([PURCHASE_ORDERS_ITEMS:169]POitemID:16)
				UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseOrderItem")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
				
				READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([PURCHASE_ORDERS_ITEMS:169]; "Items_in")
				$_t_WinCurrentInputForm:="Items_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseOrderItem")
				SET WINDOW TITLE:C213($_t_WindowName+"  "+[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
				MODIFY RECORD:C57([PURCHASE_ORDERS_ITEMS:169]; *)
				$_t_LayoutReference:="Purchase orders_Items"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
				READ ONLY:C145([PURCHASE_ORDERS_ITEMS:169])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseLedger))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([PURCHASE_INVOICES:37])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PURCHASE_INVOICES:37]; 1))
				LOAD RECORD:C52([PURCHASE_INVOICES:37])
				
				$_t_AutosearchCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
				UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
				READ ONLY:C145([PURCHASE_INVOICES:37])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[PURCHASE_INVOICES:37]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
				
				Case of 
					: ([PURCHASE_INVOICES:37]State:24>=-1)
						READ WRITE:C146([PURCHASE_INVOICES:37])
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")
						$_t_WinCurrentInputForm:="Purchases_in"
						vFromIn:=False:C215
						//SET MENU BAR(29)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
						SET WINDOW TITLE:C213($_t_WindowName+"   "+[PURCHASE_INVOICES:37]Purchase_Code:1)
						ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
						MODIFY RECORD:C57([PURCHASE_INVOICES:37]; *)
						$_t_LayoutReference:="Purchases"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
						READ ONLY:C145([PURCHASE_INVOICES:37])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						
						
					: ([PURCHASE_INVOICES:37]State:24=-2)  //pre payment
						
						READ WRITE:C146([PURCHASE_INVOICES:37])
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_inP")
						$_t_WinCurrentInputForm:="Purchases_inP"
						vFromIn:=False:C215
						//SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchasePrepayment")
						SET WINDOW TITLE:C213($_t_WindowName+"   "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
						ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
						MODIFY RECORD:C57([PURCHASE_INVOICES:37]; *)
						$_t_LayoutReference:="Purchases"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
						READ ONLY:C145([PURCHASE_INVOICES:37])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						//USE SET("$Temp2")  //``
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: ([PURCHASE_INVOICES:37]State:24=-3)  //pre payment
						
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_t_WindowTitle:=Get window title:C450
						FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")
						$_t_WinCurrentInputForm:="Purchases_in"
						vFromIn:=False:C215
						//SET MENU BAR(9)
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchasePayment")
						SET WINDOW TITLE:C213($_t_WindowName+"   "+[PURCHASE_INVOICES:37]Purchase_Code:1)
						ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
						MODIFY RECORD:C57([PURCHASE_INVOICES:37]; *)
						$_t_LayoutReference:="Purchases"+"_"+$_t_WinCurrentInputForm
						INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
						UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
						READ ONLY:C145([PURCHASE_INVOICES:37])
						SET WINDOW TITLE:C213($_t_WindowTitle)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						SET MENU BAR:C67(DB_t_CUrrentMenuReference)
						DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
						
				End case 
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))  //not current form for this
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseLedger))
		
		
		If ($_l_ModuleAccess>=2)
			READ ONLY:C145([PURCHASE_INVOICE_ITEMS:158])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[PURCHASE_INVOICE_ITEMS:158]; 1))
				LOAD RECORD:C52([PURCHASE_INVOICE_ITEMS:158])
				$_t_AutosearchCode:=String:C10([PURCHASE_INVOICE_ITEMS:158]ID:16)
				UNLOAD RECORD:C212([PURCHASE_INVOICE_ITEMS:158])
				READ ONLY:C145([PURCHASE_INVOICE_ITEMS:158])
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; "View Person"; Current process:C322; Table:C252(->[PURCHASE_INVOICE_ITEMS:158]); ""; $_t_AutosearchCode)
				
			Else 
				If (False:C215)
					READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_t_WindowTitle:=Get window title:C450
					//INPUT FORM(
					
					$_t_WinCurrentInputForm:="Purchases_in"
					
					vFromIn:=False:C215
					//SET MENU BAR(9)
					$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
					
					SET WINDOW TITLE:C213($_t_WindowName+" "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
					MODIFY RECORD:C57([PURCHASE_INVOICES:37]; *)
					$_t_LayoutReference:="Purchases"+"_"+$_t_WinCurrentInputForm
					INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
					UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
					READ ONLY:C145([PURCHASE_INVOICES:37])
					SET WINDOW TITLE:C213($_t_WindowTitle)
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					SET MENU BAR:C67(DB_t_CUrrentMenuReference)
					DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
					
					
				End if 
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[RECURRING_JOURNALS:38]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([RECURRING_JOURNALS:38])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[RECURRING_JOURNALS:38]; 1))
				LOAD RECORD:C52([RECURRING_JOURNALS:38])
				$_t_AutosearchCode:=String:C10([RECURRING_JOURNALS:38]x_ID:15)
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_RecurJournal")
				UNLOAD RECORD:C212([RECURRING_JOURNALS:38])
				READ ONLY:C145([RECURRING_JOURNALS:38])
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[RECURRING_JOURNALS:38]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
				
				READ WRITE:C146([RECURRING_JOURNALS:38])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([RECURRING_JOURNALS:38]; "Standing_In")
				$_t_WinCurrentInputForm:="Standing_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_RecurJournal")
				SET WINDOW TITLE:C213($_t_WindowName)
				MODIFY RECORD:C57([RECURRING_JOURNALS:38]; *)
				$_t_LayoutReference:="Rec journals"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([RECURRING_JOURNALS:38])
				READ ONLY:C145([RECURRING_JOURNALS:38])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[RESULTS:14]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([RESULTS:14])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[RESULTS:14]; 1))
				LOAD RECORD:C52([RESULTS:14])
				$_t_AutosearchCode:=[RESULTS:14]Result_Code:1
				UNLOAD RECORD:C212([RESULTS:14])
				READ ONLY:C145([RESULTS:14])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Result")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[RESULTS:14]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([RESULTS:14])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([RESULTS:14]; "Results_in")
				$_t_WinCurrentInputForm:="Results_in"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Result")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[RESULTS:14]Result_Name:2)
				MODIFY RECORD:C57([RESULTS:14]; *)
				$_t_LayoutReference:="results"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([RESULTS:14])
				READ ONLY:C145([RESULTS:14])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ROLES:87]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([ROLES:87])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[ROLES:87]; 1))
				LOAD RECORD:C52([ROLES:87])
				$_t_AutosearchCode:=[ROLES:87]Role_Code:1
				UNLOAD RECORD:C212([ROLES:87])
				READ ONLY:C145([ROLES:87])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Role")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[ROLES:87]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([ROLES:87])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([ROLES:87]; "Roles_In")
				$_t_WinCurrentInputForm:="Roles_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Role")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[ROLES:87]Role_Name:2)
				MODIFY RECORD:C57([ROLES:87]; *)
				$_t_LayoutReference:="roles"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([ROLES:87])
				READ ONLY:C145([ROLES:87])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([SERVICE_CALLS:20])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[SERVICE_CALLS:20]; 1))
				LOAD RECORD:C52([SERVICE_CALLS:20])
				$_t_AutosearchCode:=[SERVICE_CALLS:20]Call_Code:4
				UNLOAD RECORD:C212([SERVICE_CALLS:20])
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ServiceCall")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[SERVICE_CALLS:20]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
				
				READ WRITE:C146([SERVICE_CALLS:20])
				READ WRITE:C146([ORDER_ITEMS:25])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([SERVICE_CALLS:20]; "Calls_in")
				$_t_WinCurrentInputForm:="Calls_in"
				vFromIn:=False:C215
				//`SET MENU BAR(24)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_ServiceCall")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[SERVICE_CALLS:20]Call_Code:4)
				MODIFY RECORD:C57([SERVICE_CALLS:20]; *)
				$_t_LayoutReference:="Service calls"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([SERVICE_CALLS:20])
				READ ONLY:C145([SERVICE_CALLS:20])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SOLUTIONS:23]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([SOLUTIONS:23])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[SOLUTIONS:23]; 1))
				LOAD RECORD:C52([SOLUTIONS:23])
				$_t_AutosearchCode:=[SOLUTIONS:23]Solution_Code:1
				UNLOAD RECORD:C212([SOLUTIONS:23])
				READ ONLY:C145([SOLUTIONS:23])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Solution")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[SOLUTIONS:23]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([SOLUTIONS:23])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([SOLUTIONS:23]; "Solutions_in")
				$_t_WinCurrentInputForm:="Solutions_in"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Solution")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[SOLUTIONS:23]Solution_Name:2)
				MODIFY RECORD:C57([SOLUTIONS:23]; *)
				$_t_LayoutReference:="Solutions"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([SOLUTIONS:23])
				READ ONLY:C145([SOLUTIONS:23])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([SOURCES:6])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[SOURCES:6]; 1))
				LOAD RECORD:C52([SOURCES:6])
				$_t_AutosearchCode:=[SOURCES:6]Source_Code:1
				UNLOAD RECORD:C212([SOURCES:6])
				READ ONLY:C145([SOURCES:6])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Source")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[SOURCES:6]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([SOURCES:6])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([SOURCES:6]; "Sources_In")
				$_t_WinCurrentInputForm:="Sources_In"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Source")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[SOURCES:6]Source_Name:2)
				MODIFY RECORD:C57([SOURCES:6]; *)
				$_t_LayoutReference:="Sources"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([SOURCES:6])
				READ ONLY:C145([SOURCES:6])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STAGES:45]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STAGES:45]; 1))
				LOAD RECORD:C52([STAGES:45])
				
				$_t_AutosearchCode:=[STAGES:45]Stage_Code:1
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStageType")
				UNLOAD RECORD:C212([STAGES:45])
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STAGES:45]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([STAGES:45])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STAGES:45]; "Stages_in")
				$_t_WinCurrentInputForm:="Stages_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_JobStageType")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STAGES:45]Stage_Name:2)
				MODIFY RECORD:C57([STAGES:45]; *)
				$_t_LayoutReference:="Stages"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STAGES:45])
				READ ONLY:C145([STAGES:45])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STATUS:4]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([STATUS:4])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STATUS:4]; 1))
				LOAD RECORD:C52([STATUS:4])
				$_t_AutosearchCode:=[STATUS:4]Status_Code:1
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Status")
				UNLOAD RECORD:C212([STATUS:4])
				READ ONLY:C145([STATUS:4])
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STATUS:4]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([STATUS:4])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STATUS:4]; "Status_in")
				$_t_WinCurrentInputForm:="Status_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Status")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STATUS:4]Status_Name:2)
				MODIFY RECORD:C57([STATUS:4]; *)
				$_t_LayoutReference:="Status"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STATUS:4])
				READ ONLY:C145([STATUS:4])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //job stages)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
				$_t_AutosearchCode:=String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockItem")
				$_t_ProcessName:=Term_StoWT($_t_ProcessName)
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); ""; $_t_AutosearchCode)
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
				
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "Stock_in")
				$_t_WinCurrentInputForm:="Stock_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockItem")
				$_t_WindowName:=Term_StoWT($_t_WindowName)
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				MODIFY RECORD:C57([STOCK_MOVEMENT_ITEMS:27]; *)
				$_t_LayoutReference:="Stock items"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))  //job stages)
		
		READ WRITE:C146([STOCK_MOVEMENTS:40])
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		
		If ($_l_ModuleAccess>=2)
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STOCK_MOVEMENTS:40]; 1))
				LOAD RECORD:C52([STOCK_MOVEMENTS:40])
				
				$_t_AutosearchCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
				UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
				READ ONLY:C145([STOCK_MOVEMENTS:40])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockMovement")
				$_t_ProcessName:=Term_StoWT($_t_ProcessName)
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STOCK_MOVEMENTS:40]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
				
				READ WRITE:C146([STOCK_MOVEMENTS:40])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_in")
				$_t_WinCurrentInputForm:="Movements_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockMovement")
				$_t_WindowName:=Term_StoWT($_t_WindowName)
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STOCK_MOVEMENTS:40]Movement_Code:1)
				MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
				$_t_LayoutReference:="Stock movements"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
				READ ONLY:C145([STOCK_MOVEMENTS:40])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))  //
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([STOCK_LEVELS:58])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STOCK_LEVELS:58]; 1))
				LOAD RECORD:C52([STOCK_LEVELS:58])
				
				$_t_AutosearchCode:=String:C10([STOCK_LEVELS:58]X_ID:10)
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockLevel")
				$_t_ProcessName:=Term_StoWT($_t_ProcessName)
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				READ ONLY:C145([STOCK_LEVELS:58])
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STOCK_LEVELS:58]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
				
				READ WRITE:C146([STOCK_LEVELS:58])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STOCK_LEVELS:58]; "StockLev_in")
				$_t_WinCurrentInputForm:="StockLev_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockLevel")
				$_t_WindowName:=Term_StoWT($_t_WindowName)
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STOCK_LEVELS:58]Product_Code:1)
				MODIFY RECORD:C57([STOCK_LEVELS:58]; *)
				$_t_LayoutReference:="Stock Levels"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				READ ONLY:C145([STOCK_LEVELS:58])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_TYPES:59]))  //job stages)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([STOCK_TYPES:59])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[STOCK_TYPES:59]; 1))
				LOAD RECORD:C52([STOCK_TYPES:59])
				
				$_t_AutosearchCode:=[STOCK_TYPES:59]Type_Code:1
				UNLOAD RECORD:C212([STOCK_TYPES:59])
				READ ONLY:C145([STOCK_TYPES:59])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockType")
				$_t_ProcessName:=Term_StoWT($_t_ProcessName)
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[STOCK_TYPES:59]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([STOCK_TYPES:59])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([STOCK_TYPES:59]; "StockTypes_in")
				$_t_WinCurrentInputForm:="StockTypes_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockType")
				$_t_WindowName:=Term_StoWT($_t_WindowName)
				SET WINDOW TITLE:C213($_t_WindowName+" "+[STOCK_TYPES:59]Type_Name:2)
				MODIFY RECORD:C57([STOCK_TYPES:59]; *)
				$_t_LayoutReference:="Stock Types"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([STOCK_TYPES:59])
				READ ONLY:C145([STOCK_TYPES:59])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TAX_CODES:35]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TAX_CODES:35])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TAX_CODES:35]; 1))
				LOAD RECORD:C52([TAX_CODES:35])
				
				$_t_AutosearchCode:=[TAX_CODES:35]Tax_Code:1
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TaxCode")
				$_t_ProcessName:=Term_VATWT($_t_ProcessName)
				UNLOAD RECORD:C212([TAX_CODES:35])
				READ ONLY:C145([TAX_CODES:35])
				
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TAX_CODES:35]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([TAX_CODES:35])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TAX_CODES:35]; "Vat_in")
				$_t_WinCurrentInputForm:="Vat_in"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TaxCode")
				$_t_WindowName:=Term_VATWT($_t_WindowName)
				SET WINDOW TITLE:C213($_t_WindowName+" "+[TAX_CODES:35]Tax_Name:2)
				MODIFY RECORD:C57([TAX_CODES:35]; *)
				$_t_LayoutReference:="TAX CODES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TAX_CODES:35])
				READ ONLY:C145([TAX_CODES:35])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TERMINOLOGY:75]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TERMINOLOGY:75])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TERMINOLOGY:75]; 1))
				LOAD RECORD:C52([TERMINOLOGY:75])
				
				$_t_AutosearchCode:=[TERMINOLOGY:75]Terminology_Code:1
				
				UNLOAD RECORD:C212([TERMINOLOGY:75])
				READ ONLY:C145([TERMINOLOGY:75])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Terminology")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TERMINOLOGY:75]); ""; $_t_AutosearchCode)
				
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([TERMINOLOGY:75])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TERMINOLOGY:75]; "Term_in")
				$_t_WinCurrentInputForm:="Term_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Terminology")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[TERMINOLOGY:75]Terminology_Name:2)
				MODIFY RECORD:C57([TERMINOLOGY:75]; *)
				$_t_LayoutReference:="Terminology"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TERMINOLOGY:75])
				READ ONLY:C145([TERMINOLOGY:75])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))  //job stages)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TRANSACTION_BATCHES:30]; 1))
				LOAD RECORD:C52([TRANSACTION_BATCHES:30])
				$_t_AutosearchCode:=String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
				
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				READ ONLY:C145([TRANSACTION_BATCHES:30])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TransBatch")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TRANSACTION_BATCHES:30]); ""; $_t_AutosearchCode)
				
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
				
				READ WRITE:C146([TRANSACTION_BATCHES:30])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TRANSACTION_BATCHES:30]; "TransB_in")
				$_t_WinCurrentInputForm:="TransB_in"
				vFromIn:=False:C215
				//SET MENU BAR(30)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TransBatch")
				SET WINDOW TITLE:C213($_t_WindowName+" "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
				MODIFY RECORD:C57([TRANSACTION_BATCHES:30]; *)
				$_t_LayoutReference:="Trans in"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				READ ONLY:C145([TRANSACTION_BATCHES:30])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))  //job stages)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TRANSACTIONS:29])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TRANSACTIONS:29]; 1))
				LOAD RECORD:C52([TRANSACTIONS:29])
				
				$_t_AutosearchCode:=String:C10([TRANSACTIONS:29]Transaction_ID:31)
				
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				READ ONLY:C145([TRANSACTIONS:29])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Transaction")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TRANSACTIONS:29]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
				
				READ WRITE:C146([TRANSACTIONS:29])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TRANSACTIONS:29]; "Trans_in")
				$_t_WinCurrentInputForm:="Trans_in"
				vFromIn:=False:C215
				//SET MENU BAR(9)
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Transaction")
				SET WINDOW TITLE:C213($_t_WindowName)
				MODIFY RECORD:C57([TRANSACTIONS:29]; *)
				$_t_LayoutReference:="Transactions"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				READ ONLY:C145([TRANSACTIONS:29])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_TYPES:31]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TRANSACTION_TYPES:31])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TRANSACTION_TYPES:31]; 1))
				LOAD RECORD:C52([TRANSACTION_TYPES:31])
				
				$_t_AutosearchCode:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
				
				UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
				READ ONLY:C145([TRANSACTION_TYPES:31])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TransactionType")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TRANSACTION_TYPES:31]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([TRANSACTION_TYPES:31])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TRANSACTION_TYPES:31]; "TransT_in")
				$_t_WinCurrentInputForm:="TransT_in"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TransactionType")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
				MODIFY RECORD:C57([TRANSACTION_TYPES:31]; *)
				$_t_LayoutReference:="Trans_Types"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
				READ ONLY:C145([TRANSACTION_TYPES:31])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TYPES:5]))  //company and contact tyypes )
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([TYPES:5])
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[TYPES:5]; 1))
				LOAD RECORD:C52([TYPES:5])
				
				$_t_AutosearchCode:=[TYPES:5]Type_Code:1
				UNLOAD RECORD:C212([TYPES:5])
				READ ONLY:C145([TYPES:5])
				
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Type")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[TYPES:5]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([TYPES:5])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([TYPES:5]; "Types_In")
				$_t_WinCurrentInputForm:="Types_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Type")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[TYPES:5]Type_Name:2)
				MODIFY RECORD:C57([TYPES:5]; *)
				$_t_LayoutReference:="TYPES"+"_"+$_t_WinCurrentInputForm
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_LayoutReference)
				UNLOAD RECORD:C212([TYPES:5])
				READ ONLY:C145([TYPES:5])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))  //job stages)
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		
		If ($_l_ModuleAccess>=2)
			READ WRITE:C146([WORKFLOW_CONTROL:51])
			
			If (DB_bo_RecordsinNewProcess) | Not:C34(Check_Locked(->[WORKFLOW_CONTROL:51]; 1))
				LOAD RECORD:C52([WORKFLOW_CONTROL:51])
				$_t_AutosearchCode:=[WORKFLOW_CONTROL:51]WFControl_Code:10
				UNLOAD RECORD:C212([WORKFLOW_CONTROL:51])
				READ ONLY:C145([WORKFLOW_CONTROL:51])
				$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Workflow")
				$_l_Process:=New process:C317("DBI_DisplayRecord"; 256*1024; $_t_ProcessName; Current process:C322; Table:C252(->[WORKFLOW_CONTROL:51]); ""; $_t_AutosearchCode)
				
			Else 
				MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
				
				READ WRITE:C146([WORKFLOW_CONTROL:51])
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_t_WindowTitle:=Get window title:C450
				FORM SET INPUT:C55([WORKFLOW_CONTROL:51]; "Workflow_Control_In")
				$_t_WinCurrentInputForm:="Workflow_Control_In"
				vFromIn:=False:C215
				$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Workflow")
				SET WINDOW TITLE:C213($_t_WindowName+" "+[WORKFLOW_CONTROL:51]Workflow_name:18)
				MODIFY RECORD:C57([WORKFLOW_CONTROL:51]; *)
				INT_LoadFormSizes(<>PER_l_CurrentUserID; "WORKFLOW_CONTROL"+"_"+$_t_WinCurrentInputForm)
				UNLOAD RECORD:C212([WORKFLOW_CONTROL:51])
				READ ONLY:C145([WORKFLOW_CONTROL:51])
				SET WINDOW TITLE:C213($_t_WindowTitle)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				DB_SetFormButtons($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			DB_SetFormMenuoptions
			
		Else 
		End if 
End case 
If ($_t_GetRecordCode="")  //if we pass this value we are not on the output form
	
	If ($_l_CurrentDisplayedForm#(Table:C252(->[WORKFLOW_CONTROL:51])))
		//TRACE
		//SD2_OnSaveRecord ($_l_CurrentDisplayedForm;"Save")
	End if 
	
	DB_bo_InRecord:=$_bo_InRecord
	MOD_l_CurrentModuleAccess:=$_l_ModuleAccess
	DB_bo_RecordsinNewProcess:=$_bo_RecordsinNewProcess
	If (DB_bo_ShowArrayBased)
		DB_SetFormSize($_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
	Else 
		DB_SetFormSize($_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
	End if 
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT MOVE:C664(PAL_BUTTON_2; $_l_B2Left; $_l_B2Top; $_l_B2Right; $_l_B2Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_1; $_l_B1Left; $_l_B1Top; $_l_B1Right; $_l_B1Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_4; $_l_B4Left; $_l_B4Top; $_l_B4Right; $_l_B4Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_3; $_l_B3Left; $_l_B3Top; $_l_B3Right; $_l_B3Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_13; $_l_B13Left; $_l_B13Top; $_l_B13Right; $_l_B13Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_11; $_l_B11Left; $_l_B11Top; $_l_B11Right; $_l_Object11Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_15; $_l_B15Left; $_l_B15Top; $_l_B15Right; $_l_B15Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_14; $_l_B14Left; $_l_B14Top; $_l_B14Right; $_l_B14Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_18; $_l_B18Left; $_l_B18Top; $_l_B18Right; $_l_B18Bottom; *)
	OBJECT MOVE:C664(DB_but_Function1; $_l_B1FLeft; $_l_B1FTop; $_l_B1FRight; $_l_B1FBottom; *)
	OBJECT MOVE:C664(DB_but_Function2; $_l_B2FLeft; $_l_B2FTop; $_l_B2FRight; $_l_B2FBottom; *)
	OBJECT MOVE:C664(DB_but_CBFunction1; $_l_B3FLeft; $_l_B3FTop; $_l_B3FRight; $_l_B3FBottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_45; $_l_B45Left; $_l_B45top; $_l_B45Right; $_l_45Bottom; *)
	
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavLeft; $_l_Navtop; $_l_NavRight; $_l_NavBottom)
	If ($_l_Grid1Top<($_l_Navtop+30))
		$_l_Grid1Top:=$_l_Navtop+30
	End if 
	If ($_l_Grid1Bottom>($_l_B1Top-10))
		$_l_Grid1Bottom:=($_l_B1Top-10)
	End if 
	If ($_l_Grid2Top<($_l_Navtop+30))
		$_l_Grid2Top:=$_l_Navtop+30
	End if 
	If ($_l_Grid2Bottom>($_l_B1Top-10))
		$_l_Grid2Bottom:=($_l_B1Top-10)
	End if 
	OBJECT MOVE:C664(DB_l_LBOutputForm; $_l_Grid1Left; $_l_Grid1Top; $_l_Grid1Right; $_l_Grid1Bottom; *)
	OBJECT MOVE:C664(DB_lb_OutputArrays; $_l_Grid2Left; $_l_Grid2Top; $_l_Grid2Right; $_l_Grid2Bottom; *)
	//``
	
	
	If ($_bo_MoveGrid1)
		OBJECT MOVE:C664(DB_l_LBOutputForm; $_l_Grid1Left; $_l_Grid1Top; $_l_Grid1Right; $_l_Grid1Bottom; *)
	End if 
	
	
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
	OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_CBLeft; $_l_CBTop; $_l_CBRight; $_l_CBBottom)
	OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_AreaWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oSearchvalue"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
	//OBJECT MOVE(*;"oFocusRing";($_l_WindowWidth-10)-$_l_AreaWidth;$_l_ObjectTop;$_l_WindowWidth-10;$_l_ObjectBottom;*)
	//drop down 12 in and 23 wid
	$_l_DropDown:=(($_l_WindowWidth-10)-$_l_AreaWidth)+12
	$_l_Search:=(($_l_WindowWidth-10)-$_l_AreaWidth)+38
	$_l_Cancel:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
	//OBJECT MOVE(*;"oSearchCriteriaButton";$_l_DropDown;$_l_ObjectTop+8;$_l_DropDown+23;$_l_ObjectBottom-5;*)
	//OBJECT MOVE(*;"oSearchvalue";$_l_Search;$_l_ObjectTop+9;$_l_Search+150;$_l_ObjectBottom-9;*)
	//OBJECT MOVE(*;"oSearchCriteria";$_l_Search;$_l_ObjectTop+9;$_l_Search+150;$_l_ObjectBottom-9;*)
	//OBJECT MOVE(*;"oSearchClearButton";$_l_Cancel;$_l_ObjectTop+9;$_l_Cancel+15;$_l_ObjectBottom-9;*)
	
	//OBJECT GET COORDINATES(*;"oRoundArea1";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
	OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
	
	If (DB_bo_ShowArrayBased)
	Else 
		GET HIGHLIGHTED RECORDS:C902(Table:C252($_l_CurrentDisplayedForm)->; "ListboxSet0")
		If (Not:C34(DB_bo_RecordsinNewProcess))
			COPY NAMED SELECTION:C331(Table:C252($_l_CurrentDisplayedForm)->; "$CurrentSelection")
			REDUCE SELECTION:C351(Table:C252($_l_CurrentDisplayedForm)->; 0)
			USE NAMED SELECTION:C332("$CurrentSelection")
		End if 
		HIGHLIGHT RECORDS:C656(Table:C252($_l_CurrentDisplayedForm)->; "ListboxSet0")
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_OpenRecordFromSelection"; $_t_oldMethodName)
