If (False:C215)
	//Table Form Method Name: Object Name:      [USER].SD2_diaryViewer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(BWorkflow)
	//C_UNKNOWN(oOK)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(vAutoFind)
	//C_UNKNOWN(vButtDisDry)
	//C_UNKNOWN(vButtDisO)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vNo2)
	//C_UNKNOWN(vText)
	_O_C_STRING:C293(5; SD2_S5_PriorityFIlter)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	//ARRAY LONGINT(LB_al_ConfigureSD2;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY LONGINT(SD2_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(SD2_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(SD2_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(SD2_AL_PAGECACHE;0;0)
	//ARRAY LONGINT(SD2_al_Priority;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	//ARRAY TEXT(SD_at_DiaryActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActions;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	//ARRAY TEXT(SD_at_StatusNM;0)
	//ARRAY TEXT(SD2_at_CachedSelections;0;0)
	//ARRAY TEXT(SD2_at_ConfigureSD2;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	//ARRAY TEXT(SD2_at_PriorityNM;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_Hightlight; $_bo_newLevel; DB_bo_NoLoad; DM_bo_CustomSort; PAL_bo_ButtonSubFunction; QV_bo_KeepWindowsize; QV_bo_SearchDone; SD_bo_ProcessReady; SD2_bo_ShowSelection; vAutoFind)
	C_BOOLEAN:C305(<>StatsSwitch; <>SYS_bo_CurrentWindowModal; $_bo_Hightlight; $_bo_newLevel; DB_bo_NoLoad; DM_bo_CustomSort; PAL_bo_ButtonSubFunction; QV_bo_KeepWindowsize; QV_bo_SearchDone; SD_bo_ProcessReady; SD2_bo_MULTIPAGE)
	C_BOOLEAN:C305(SD2_bo_ShowSelection)
	C_DATE:C307(SD2_D_DatetoFilter; SD2_D_DateFromFilter; SD2_D_DatetoFilter)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WT_SortFieldName_2; $_l_ButtonPressed; $_l_event; $_l_EventCall; $_l_Index; $_l_KeyPosition; $_l_LineIndex; $_l_LinePosition; $_l_MonitorCall; $_l_PersonIndex)
	C_LONGINT:C283($_l_PipelineProcess; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelAfterRemove; $_l_RecordsInSelPriorToRemove; $_l_Retries; $_l_SIzeofArray; $_l_TableNumber; $_l_WindowBottom; $_l_WindowRIght; $_l_WindowTop)
	C_LONGINT:C283(BWorkflow; DB_l_ButtonClickedFunction; DB_l_OutCallBack; oOK; SD_l_GenwindowBottom; SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop; SD2_l_CallingProcess; SD2_l_DiaryPersonID; SD2_l_EventCall)
	C_LONGINT:C283(SD2_l_IncludeCompleted; SD2_l_InfoColumn; SD2_l_ITEMSPERPAGE; SD2_l_TableNum; SM_l_MonitorCall; SM_l_TableNumber; SM_l_UpdateOnCallBackID; vNo; vNo2; <>newSetsProcess; <>PER_l_CurrentUserID)
	C_LONGINT:C283($_l_ButtonPressed; $_l_event; $_l_EventCall; $_l_Index; $_l_KeyPosition; $_l_LineIndex; $_l_LinePosition; $_l_MonitorCall; $_l_OutCallBack; $_l_PersonIndex; $_l_PipelineProcess)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelAfterRemove; $_l_RecordsInSelPriorToRemove; $_l_Retries; $_l_SIzeofArray; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; DB_l_OutCallBack; SD_l_GenwindowBottom; SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop; SD2_CurrentPageTab; SD2_l_CallingProcess; SD2_l_ConfigureLB; SD2_l_DiaryPersonID; SD2_l_EventCall)
	C_LONGINT:C283(SD2_l_IncludeCompleted; SD2_l_InfoColumn; SD2_l_ITEMSPERPAGE; SM_l_MonitorCall; SM_l_TableNumber; SM_l_UpdateOnCallBackID; vALLevels)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_Record1Code; $_ptr_Record2Code; $_Ptr_ThisColumnArray; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_Record1Code; $_ptr_Record2Code; $_Ptr_ThisColumnArray)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD; SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_OldMethodName2; $_t_PalletButtonName; $_t_ProcessName; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage3)
	C_TEXT:C284(FS_t_SortFieldTXT; FS_t_SortVariableName; PAL_BUTTON; SD_t_ActionFilter; SD_t_ActionFilterCode; SD_t_ContactFilter; SD_t_ContactFilterName; SD_t_PersonFilterName; SD_t_ResultsFilter; SD2_S5_PriorityFIlter; SD2_t_CompanyFilter)
	C_TEXT:C284(SD2_t_CompanyFilterName; SD2_t_Document; SD2_t_DocumentName; SD2_t_SearchCriteria; SD2_T_SearchValue; SD2_T_SearchValue2; SD2_t_StatusFIlter; SM_t_UseSetName; SRCH_t_SearchValueOLD; vButtDisDry; vButtDisO)
	C_TEXT:C284(vText; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME; <>ButtDis; <>PER_t_CurrentUserInitials; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_OldMethodName2; $_t_PalletButtonName)
	C_TEXT:C284($_t_ProcessName; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; SD_t_ActionFilter; SD_t_ActionFilterCode; SD_t_ContactFilter; SD_t_ContactFilterName; SD_t_PersonFilterName; SD_t_ResultsFilter)
	C_TEXT:C284(SD_t_ResultsFilterCode; SD2_t_CompanyFilter; SD2_t_CompanyFilterName; SD2_t_Document; SD2_t_DocumentName; SD2_t_SearchCriteria; SD2_T_SearchValue; SD2_T_SearchValue2; SD2_t_StatusFIlter; SM_t_UseSetName; SRCH_t_SearchValue)
	C_TEXT:C284(SRCH_t_SearchValueOLD; WIN_t_CurrentInputForm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [USER]SD2_diaryViewer"; Form event code:C388)


//this form will display a list of diary items-this is the form users see to FIND diary items-it will only filter threads
//this form has no timers- it just has user setup filters and a search facility
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Resize:K2:27)
		WIN_t_CurrentInputForm:="Diary_In"
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		LBI_Scrollonresize(->SD_lb_Workflow)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		ARRAY LONGINT:C221(SD2_al_CombineGroupDiaries; 0)
		ARRAY LONGINT:C221(SD2_al_CombinePersonDiaries; 0)
		ARRAY LONGINT:C221(SD2_al_CombineResourceDiaries; 0)
		SD2_t_DocumentName:=""
		
		SD2_t_CompanyFilterName:=""
		SD_t_ContactFilterName:=""
		SD2_t_CompanyFilter:=""
		SD_t_ContactFilter:=""
		SD2_t_Document:=""
		OBJECT SET VISIBLE:C603(*; "oButLessFilters"; False:C215)
		OBJECT SET VISIBLE:C603(BWorkflow; False:C215)  // until it is ready
		SET WINDOW TITLE:C213("Diary History")
		READ ONLY:C145([ACTIONS:13])
		READ ONLY:C145([RESULTS:14])
		ALL RECORDS:C47([ACTIONS:13])
		
		ARRAY TEXT:C222(SD_at_DiaryActions; 0)
		ARRAY TEXT:C222(SD_at_DiaryActionCodes; 0)
		//Need to filter out templates here
		SD_t_ActionFilter:="ALL"
		SD_t_ActionFilterCode:=""
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_DiaryActionCodes; [ACTIONS:13]Action_Name:2; SD_at_DiaryActions)
		SORT ARRAY:C229(SD_at_DiaryActions; SD_at_DiaryActionCodes)
		READ ONLY:C145([RESULTS:14])
		ALL RECORDS:C47([RESULTS:14])
		
		ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
		ARRAY TEXT:C222(SD2_at_ResultNames; 0)
		SD_t_ResultsFilterCode:=""
		SD_t_ResultsFilter:="ALL"
		SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; SD2_at_ResultCodes; [RESULTS:14]Result_Name:2; SD2_at_ResultNames)
		SORT ARRAY:C229(SD2_at_ResultNames; SD2_at_ResultCodes)
		SD2_D_DateFromFilter:=!00-00-00!
		SD2_D_DatetoFilter:=!00-00-00!
		ARRAY TEXT:C222(SD_at_StatusNM; 0)
		ARRAY TEXT:C222(SD_at_StatusCodes; 0)
		SD2_LoadDiaryStati(->SD_at_StatusCodes; ->SD_at_StatusNM; ->SD2_t_StatusFIlter)
		If (Size of array:C274(SD_at_StatusCodes)=0)
			OBJECT SET VISIBLE:C603(*; "oDiaryStatusFilterLabel"; False:C215)
			OBJECT SET VISIBLE:C603(SD2_t_StatusFIlter; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_StatusNM; False:C215)
		End if 
		
		SD2_bo_MULTIPAGE:=False:C215
		SD2_l_ITEMSPERPAGE:=0
		ARRAY LONGINT:C221(SD2_AL_PAGECACHE; 0; 0)
		//The following array contains the cache for each 'page'
		ARRAY TEXT:C222(SD2_at_CachedSelections; 0; 0)
		
		ARRAY TEXT:C222(SD2_at_PageTabs; 0)
		OBJECT SET VISIBLE:C603(SD2_at_PageTabs; False:C215)
		
		vAutoFind:=False:C215
		
		WIN_t_CurrentInputForm:="SD2_DiaryViewer"
		REDUCE SELECTION:C351([DIARY:12]; 0)
		ARRAY POINTER:C280(SD2_aptr_ListControl; 0)
		
		ARRAY TEXT:C222(SD2_at_ConfigureSD2; 0)
		ARRAY LONGINT:C221(LB_al_ConfigureSD2; 0)
		LBi_SetListBoxOptions(->SD2_at_ConfigureSD2; ->LB_al_ConfigureSD2; ->SD2_Pi_Configure)
		
		If (Current user:C182#"Designer")
			OBJECT SET VISIBLE:C603(SD2_at_ConfigureSD2; False:C215)
			OBJECT SET VISIBLE:C603(SD2_Pi_Configure; False:C215)
		End if 
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		SD2_l_IncludeCompleted:=1
		ARRAY TEXT:C222(SD2_at_PriorityNM; 5)
		ARRAY LONGINT:C221(SD2_al_Priority; 5)
		SD2_at_PriorityNM{1}:="Highest"
		SD2_at_PriorityNM{2}:="High"
		SD2_at_PriorityNM{3}:="Normal"
		SD2_at_PriorityNM{4}:="Low"
		SD2_at_PriorityNM{5}:="Lowest"
		
		For ($_l_Index; 1; 5)
			SD2_al_Priority{$_l_Index}:=$_l_Index
		End for 
		ARRAY TEXT:C222(SD_at_DiaryOwners; 1)
		ARRAY TEXT:C222(SD_at_PersonInitials; 1)
		ARRAY LONGINT:C221(SD_al_PersonClass; 1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		SD_t_DiaryDefaultUser:=<>PER_t_CurrentUserInitials
		SD_at_PersonInitials{1}:=""
		SD_at_DiaryOwners{1}:="ALL"
		SD_al_PersonClass{1}:=0
		APPEND TO ARRAY:C911(SD_at_PersonInitials; <>PER_t_CurrentUserInitials)
		APPEND TO ARRAY:C911(SD_at_DiaryOwners; [PERSONNEL:11]Name:2)
		
		
		//After discussion with Nigel agreed not to implement the following functionality after all 30/06/08 -kmw
		//******************** added 27/06/08 -kmw ********************
		//ARRAY STRING(30;SD_t_aAutoUpdate;6)
		//SD_t_aAutoUpdate{1}:="Never"
		//SD_t_aAutoUpdate{2}:="Every 2 Minutes"
		//SD_t_aAutoUpdate{3}:="Every 3 Minutes"
		//SD_t_aAutoUpdate{4}:="Every 4 Minutes"
		//SD_t_aAutoUpdate{5}:="Every 5 Minutes"
		//SD_t_aAutoUpdate{6}:="Every 10 Minutes"
		//SD_t_aAutoUpdate:=1
		//SD_t_LastAutoUpdateSetting:=1
		//*****************************************************************
		
		
		//********************************** Added 03/07/08 -kmw **********************************
		//GEN_at_DropDownMenu array is now hard coded with certain values instead of created on the fly based on the number of selected records.
		//This is so that we can have it displayed on the actual Diary History window and have it remember it's last value without having to worry that if the selection changes then a dynamic update to the array could mean that its last value no longer actually exists in the array.
		//ARRAY STRING(55;SD2_at_MaxRecsToDisplayPopup;11)
		//SD2_at_MaxRecsToDisplayPopup{1}:="1,000"
		//SD2_at_MaxRecsToDisplayPopup{2}:="2,000"
		//SD2_at_MaxRecsToDisplayPopup{3}:="5,000"
		//SD2_at_MaxRecsToDisplayPopup{4}:="10,000"
		//SD2_at_MaxRecsToDisplayPopup{5}:="20,000"
		//SD2_at_MaxRecsToDisplayPopup{6}:="50,000"
		//SD2_at_MaxRecsToDisplayPopup{7}:="100,000"
		//SD2_at_MaxRecsToDisplayPopup{8}:="200,000"
		//SD2_at_MaxRecsToDisplayPopup{9}:="500,000"
		//SD2_at_MaxRecsToDisplayPopup{10}:="1,000,000"
		//SD2_at_MaxRecsToDisplayPopup{11}:="ALL"
		//SD2_at_MaxRecsToDisplayPopup:=0  `default to zero so first search doesn't assume anything about how many records the user does or doesn't want to display
		//*********************************************************************************************
		
		
		
		
		
		//SD_at_PersonInitials{2}:=◊user
		//SD_at_DiaryOwners{1}:=[PERSONNEL]Name
		If ([PERSONNEL:11]Global_Access:47=False:C215)
			If (SD_t_DiaryDefaultUser=<>PER_t_CurrentUserInitials)
				APPEND TO ARRAY:C911(SD_al_PersonClass; 0)
			Else 
				APPEND TO ARRAY:C911(SD_al_PersonClass; 2)
				
			End if 
		Else 
			APPEND TO ARRAY:C911(SD_al_PersonClass; 3)
		End if 
		SD2_l_DiaryPersonID:=[PERSONNEL:11]Personnel_ID:48
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
		$_l_SIzeofArray:=Size of array:C274(SD_at_DiaryOwners)
		If (Records in selection:C76([PERSONNEL:11])>0)
			INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; Records in selection:C76([PERSONNEL:11])+1)
			
			$_l_SIzeofArray:=$_l_SIzeofArray+1
			SD_at_PersonInitials{$_l_SIzeofArray}:="-"  //insert a seperator here
			SD_at_DiaryOwners{$_l_SIzeofArray}:="-"  //and insert a seperator here
			ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
			For ($_l_PersonIndex; 1; Records in selection:C76([PERSONNEL:11]))
				$_l_SIzeofArray:=$_l_SIzeofArray+1
				SD_at_PersonInitials{$_l_SIzeofArray}:=[PERSONNEL:11]Initials:1
				SD_at_DiaryOwners{$_l_SIzeofArray}:=[PERSONNEL:11]Name:2
				SD_al_PersonClass{$_l_SIzeofArray}:=3
				NEXT RECORD:C51([PERSONNEL:11])
			End for 
		End if 
		INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; 3)
		INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; 3)
		INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; 3)
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)}:="Multiple Diaries"
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)-1}:="Other Peoples Diaries"
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)-2}:="-"
		SD_al_PersonClass{Size of array:C274(SD_al_PersonClass)}:=2
		SD_t_PersonFilterName:="ALL"
		SD2_S5_PriorityFIlter:="ALL"
		SD_LoadPrefs(SD2_l_DiaryPersonID)
		
		
		
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="01211")  //
		If (Records in selection:C76([LIST_LAYOUTS:96])=0)
			//THIS IS THE DEFAULT DEFINITION FROM WHICH OTHERS ARE BUILD(EACH VIEW CAN BE DIFFERENT IF YOU WANT!)
			//LBIListLay01213
			LBi_ListLay("01213")
		End if 
		If (Size of array:C274(SD2_aptr_ListControl)=0) & (vALLevels>0)
			$_bo_newLevel:=True:C214
		Else 
			$_bo_newLevel:=False:C215
		End if 
		//Set up the list box area
		//Note that this uses 01211 as the definitions
		LBi_ArrDefFill(->SD2_aptr_ListControl; ->SD_lb_Workflow; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_ViewControl"; 13; "Diary Items"; "Diary item"; ""; $_bo_newLevel)
		SD2_l_InfoColumn:=LBI_InsertarrPicture(->SD2_aptr_ListControl; ->SD_lb_Workflow; 1; 21)  //This one is added at the end of the row
		//LBi_LoadSetup (->SD2_aptr_ListControl;$c1)
		//SD2_HistorySetInfo (->SD2_aptr_ListControl;->SD_lb_Workflow;SD2_l_InfoColumn)
		//above two lines commented out 03/07/08 -kmw (that functionality is run anyway in SD2_DiaryVIewManageView so priot to this it was unneccessarily doubling the amount of time it spent messing around with listbox arrays)
		SD2_l_ConfigureLB:=1
		LBi_EditListLay(->SD2_aptr_ListControl; ->SD2_l_ConfigureLB; ->SD2_Pi_Configure)
		
		
		GOTO OBJECT:C206(SD2_T_SearchValue)
		If (SD2_bo_ShowSelection)
			//Display the current seleciton
			If (SD2_T_SearchValue2#"GetCurrentSelection")
				If (SD2_T_SearchValue2#"UseFoundSelection")
					CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 02/07/08
					SD2_DiaryVIewManageView(1; SD2_T_SearchValue2)
				Else 
					USE SET:C118("FoundDiarySelection")
					CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 02/07/08
					SD2_DiaryVIewManageView(0)
				End if 
			Else 
				//Get the selection from the calling process
				If (SD2_l_CallingProcess>0)
					//Just tell the process we are ready
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					
					SET PROCESS VARIABLE:C370(SD2_l_CallingProcess; SD_bo_ProcessReady; True:C214)
					SD_bo_ProcessReady:=False:C215
					
					
					$_l_Retries:=0
					While (SD_bo_ProcessReady=False:C215)
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*$_l_Retries)
					End while 
					//Selection from longint array
					SD_bo_ProcessReady:=False:C215
					
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_RecordSelection)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					
					CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 02/07/08
				End if 
				SD2_DiaryVIewManageView(0)
			End if 
		Else   //added kmw - 04/07/08
			REDUCE SELECTION:C351([DIARY:12]; 0)  //added kmw - 04/07/08
			CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08
			SD2_DiaryVIewManageView(0)  //added kmw - 04/07/08
		End if 
		
		vButtDisO:="O              D "
		//Out_Buttons
		//vButtDisO:="O D MONPFSSSRCADT"
		Out_Buttons(->[DIARY:12])
		
		
		SD2_CurrentPageTab:=SD2_at_PageTabs  //added 23/06/08 -kmw (needed by tab object method so when changing tabs we can know what the old tab was in order to know which to cahce to put selection into)
		
	: ($_l_event=On Timer:K2:25)
		SRCH_r_Timer:=((Current time:C178*1)*60)
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				If (SRCH_t_SearchValue#"")
					SD2_DiaryVIewManageView(1; SRCH_t_SearchValue)
					
				Else 
					OBJECT SET VISIBLE:C603(SD2_at_PageTabs; False:C215)
					ARRAY LONGINT:C221(SD2_AL_PAGECACHE; 0; 0)
					ARRAY TEXT:C222(SD2_at_PageTabs; 0)
					REDUCE SELECTION:C351([DIARY:12]; 0)
					LBi_LoadSetup(->SD2_aptr_ListControl; "P")
					SD2_HistorySetInfo(->SD2_aptr_ListControl; ->SD_lb_Workflow)
					//SET VISIBLE(SD2_t_SearchCriteria;True)
					//SET VISIBLE(SD2_T_SearchValue;False)
				End if 
				
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
		vButtDisO:="O D MONPFSSSRCADT"
		//NG Check The above line!@!!!!
		Out_Buttons(->[DIARY:12])
		
	: ($_l_event=On Outside Call:K2:11)
		If (SD2_l_EventCall=0)
			
			
			
			//;$4;$5;$6;$7;$8)
			//C_POINTER($1;$8;$3)
			
			If (Current process:C322=Frontmost process:C327(*))
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				DB_l_ButtonClickedFunction:=0
				Case of 
						
					: (SM_l_MonitorCall>0)
						//call is from the set manager
						$_l_MonitorCall:=SM_l_MonitorCall
						SM_l_MonitorCall:=0
						Case of 
							: ($_l_MonitorCall=1)
								//Save the current selection into a set
								//and pass this set to the set manager
								//then call the set manager to tell it can be saved
								$_bo_Hightlight:=False:C215
								
								SD2_DiaryViewManageSelection
								
								
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								
								CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
									
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									POST OUTSIDE CALL:C329($_l_OutCallBack)
								End if 
								USE NAMED SELECTION:C332("CurrentSortedSelection")
								If ($_bo_Hightlight)  // this should not be needed as we never changed the array
									
								End if 
								CLEAR SEMAPHORE:C144("$SetInuse")
								
							: ($_l_MonitorCall=2)  //here we are passed a set
								
								$_bo_Hightlight:=False:C215
								SD2_DiaryViewManageSelection
								
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								
								CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								
								INTERSECTION:C121(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								//Cache_Update
								//HERE UPDATE THE ARRAYS
								//``
								
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								//the -1 above keeps the set created so we can use it after
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								vNo2:=0
								
								If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
									CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
										POST OUTSIDE CALL:C329($_l_OutCallBack)
										
									End if 
								Else 
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										$_l_MonitorCall:=0
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
										
										
									End if 
									
								End if 
								
								
								SD2_DiaryViewHighlightRecords
								//HIGHLIGHT RECORDS("OneRecord")
								//CLEAR SET("OneRecord")
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=3)  //here we are passed a set to unite
								$_bo_Hightlight:=False:C215
								SD2_DiaryViewManageSelection
								
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								
								
								If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
									CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
										POST OUTSIDE CALL:C329($_l_OutCallBack)
										
									End if 
								Else 
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										$_l_MonitorCall:=0
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									End if 
									
								End if 
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								
								
								SD2_DiaryViewHighlightRecords
								
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=4)  //here we are passed a set to unite
								$_bo_Hightlight:=False:C215
								SD2_DiaryViewManageSelection
								
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								DIFFERENCE:C122(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								//Cache_Update
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								
								
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								vNo2:=0
								
								If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
									CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
										POST OUTSIDE CALL:C329($_l_OutCallBack)
										
									End if 
								End if 
								SD2_DiaryViewHighlightRecords
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=5)  //here we are passed a set to unite
								$_bo_Hightlight:=False:C215
								SD2_DiaryViewManageSelection
								
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								
								CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								DIFFERENCE:C122("TempSet"+String:C10(Table:C252(->[DIARY:12])); SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
								USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
								//Cache_Update
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								
								vNo:=SD2_DiaryViewCountRecords
								vNo2:=0
								
								If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
									If (DB_l_OutCallBack>0)
										$_l_OutCallBack:=DB_l_OutCallBack
										DB_l_OutCallBack:=0
									Else 
										$_l_OutCallBack:=<>newSetsProcess
									End if 
									CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02 pb
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
										SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
										POST OUTSIDE CALL:C329($_l_OutCallBack)
										
									End if 
								End if 
								SD2_DiaryViewHighlightRecords
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=6)
								$_bo_Hightlight:=False:C215
								//load a set from disk
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								LOAD SET:C185([DIARY:12]; "TempSet"; "")
								If (OK=1)  //Why are we doing this bit?
									ARRAY LONGINT:C221($_al_CurrentSelection; 0)
									LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
									If (Size of array:C274($_al_CurrentSelection)>0)
										$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
										$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
										$_Ptr_KeyField:=SD2_aptr_ListControl{8}
										$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
										If ($_l_KeyPosition>0)  //it should be
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
										End if 
										ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
										
										For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
											$_l_LinePosition:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
											If ($_l_LinePosition>0)
												If ($_l_KeyPosition>0)
													APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
												End if 
											End if 
										End for 
										If (Size of array:C274($_at_DiaryrecordCodes)>0)
											
											//Because here i know what we are searching we can hard code this
											QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryrecordCodes)
										End if 
										$_bo_Hightlight:=True:C214
									End if 
									
									If ($_bo_Hightlight)
										//HIGHLIGHT RECORDS("OneRecord")
										//CLEAR SET("OneRecord")
									End if 
									USE SET:C118("TempSet")
									CLEAR SET:C117("TempSet")
									SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
									//the -1 above keeps the set created so we can use it after
									USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
									CLEAR SET:C117("TempSet")
									vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
									
								End if 
								CLEAR SEMAPHORE:C144("$SetInuse")
								//no need to call the set manager back
							: ($_l_MonitorCall=8)
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								
								$_bo_Hightlight:=False:C215
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								vNo2:=0
								CREATE SET:C116([DIARY:12]; "TempSet")
								SAVE SET:C184("TempSet"; "")
								
								CLEAR SET:C117("TempSet")
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=7)
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								$_bo_Hightlight:=False:C215
								//list passed from list manager
								USE SET:C118("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								//the -1 above keeps the set created so we can use it after
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								vNo2:=0
								//Cache_Update
								CLEAR SET:C117("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								//no need to call the set manager back
								If ($_bo_Hightlight)
									//HIGHLIGHT RECORDS("OneRecord")
									//CLEAR SET("OneRecord")
								End if 
								CLEAR SEMAPHORE:C144("$SetInuse")
							: ($_l_MonitorCall=9)
								$_l_Retries:=0
								While (Semaphore:C143("$SetInuse"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								$_l_TableNumber:=Table:C252(->[DIARY:12])
								//reply with the number of the table
								SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_TableNumber; $_l_TableNumber)
								CLEAR SEMAPHORE:C144("$SetInuse")
						End case 
						
					: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (oOK=1))
						
						oOK:=0
						CANCEL:C270
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Cancel"))  // | (oCancel=1))
						//  oCancel:=0
						CANCEL:C270
						OK:=0
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Close"))
						DB_t_CallOnCloseorSave:=""
						Close_Process
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Plus"))  //| (oPlus=1))
						//  oPlus:=0
						//SD2_AddRecord
						//if a line is selected to we use the company/contact codes?
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
						SD_l_GenwindowLeft:=$_l_WindowLeft
						SD_l_GenwindowRight:=$_l_WindowRIght
						SD_l_GenwindowTop:=$_l_WindowTop
						SD_l_GenwindowBottom:=$_l_WindowBottom
						ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW")
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Delete"))
						If (Substring:C12(vButtDisDry; 3; 1)#"D")
							//****************************************************  Deletion functionality added 23/06/08 -kmw ******************************************************************************
							//(Deletes selected record(s) from any and all tabs)
							
							SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //make current selection ALL diary items so we can reload it all (minus any deleted records) after the deletion
							
							CREATE SET:C116([DIARY:12]; "$AllCurrent")  //remember all current
							READ WRITE:C146([DIARY:12])
							
							SD2_DiaryViewManageSelectionNEW(True:C214)  //narrow current selection to highlighted ones
							
							If (Records in selection:C76([DIARY:12])>0)
								Gen_Confirm("Are you sure you want to delete "+String:C10(Records in selection:C76([DIARY:12]))+" Diary records?")
								If (ok=1)
									CREATE SET:C116([DIARY:12]; "$AllHighlighted")
									CREATE EMPTY SET:C140([DIARY:12]; "$AllUnhighlighted")
									DIFFERENCE:C122("$AllCurrent"; "$AllHighlighted"; "$AllUnhighlighted")
									DELETE SELECTION:C66([DIARY:12])  //delete all highlighted records
									READ ONLY:C145([DIARY:12])
									CLEAR SET:C117("$AllHighlighted")  //clear the highlighted records set
									USE SET:C118("$AllUnhighlighted")  //use the set unhighlighted
									CLEAR SET:C117("$AllUnhighlighted")  //clear the set unhighlighted
									CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08 (deleted records should no longer be in search/select selection)
									SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
									SD2_DiaryViewUnhighlightAll  //added 03/07/08 -kmw
									SD2_DiaryViewHighlightRecords  //cached selections would have been correctly set back to blank by "SD2_DiaryVIewManageView" (after all those lines are deleted now), however we may (probably) still need to use the now blank cache to unselect any line numbers from the current tab page list area
									
									vNo:=SD2_DiaryViewCountRecords
									vNo2:=0
									//Cache_Update
								Else 
									READ ONLY:C145([DIARY:12])
									USE SET:C118("$AllCurrent")
								End if 
								
							Else 
								READ ONLY:C145([DIARY:12])
								Gen_Alert("Please first highlight records to Delete"; "Try again")
							End if 
							//********************************************************************************************************************************************************************************
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Select")) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO"))  // | (oSelect=1))
						//    oSelect:=0
						If (Substring:C12(<>ButtDis; 10; 1)#"S")
							If ((Gen_Option) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO")))
								
								
								
								//************* kmw 30/06/08 - Commented out the following "$UseCurrentRecords functionality" as it doesn't seem to get used and I don't neccessarily trust that the current selection is indeed ALWAYS correct if it's on a single page (which is what the intention of this code looks like)- 30/06/08, kmw **************
								//First Gather all the sets
								//If (Size of array(SD2_at_PageTabs)>0)
								//$UseCurrentRecords:=False
								//
								//Else
								//  `its just the diary records on screen
								//$UseCurrentRecords:=True
								//End if
								//**********************************************************************************************************************************************************************************************************************************************************************************************
								
								//************* kmw 30/06/08 - In fact comment out all this stuff as well as it doesn't actually make much sense (appears to try to remove a set of highlighted from a set of unhighlighted lines) and the method it uses is broken anyway*************************
								//SD2_DiaryViewManageSelection (True)
								//CREATE SET([DIARY];"$Temp1")
								//SD2_DiaryViewManageSelection (False;True)
								//CREATE SET([DIARY];"$allSelection")
								//If (Records in selection([DIARY])>0)
								//
								//DIFFERENCE("$allSelection";"$Temp1";"$allSelection")
								//USE SET("$allSelection")
								//CLEAR SET("$Temp1")
								//CLEAR SET("$allSelection")
								//SD2_DiaryVIewManageView (-1)  `updates the view-keeps the page
								//USE SET("TempSet")  `Created in the above method-note not the current seleciton on screen
								//CLEAR SET("TempSet")
								//vNo:=SD2_DiaryViewCountRecords
								//vNo2:=0
								//  `Cache_Update
								//Else
								//Gen_Alert ("Please first highlight records to Remove from the Selection";"Try again")
								//End if
								//**********************************************************************************************************************************************************************************************************************************************************************************************
								
								//kmw, 30/08/06 - Do it this way instead of the commented out lines above
								SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)
								$_l_RecordsInSelPriorToRemove:=Records in selection:C76([DIARY:12])
								SD2_DiaryViewManageSelectionNEW(False:C215; True:C214)
								$_l_RecordsInSelAfterRemove:=Records in selection:C76([DIARY:12])
								Case of 
									: ($_l_RecordsInSelAfterRemove=$_l_RecordsInSelPriorToRemove)
										Gen_Alert("Please first highlight records to Remove from the Selection"; "Try again")
									: ($_l_RecordsInSelAfterRemove<$_l_RecordsInSelPriorToRemove)
										CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 03/07/08 (we decided that sub-selecting will now reset the "searchresults" set in the same way that a new search would have)
										SD2_T_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
										SD2_t_SearchCriteria:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
										SRCH_t_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
										
										//SD2_DiaryVIewManageView (-1;"";False)  `updates the view-keeps the page `kmw 03/07/08 - added param so it doesnt apply filter (because when filtering it reverts back to last search)
										SD2_DiaryVIewManageView(-1)  //kmw 03/07/08 - don't need to tell it not to apply filter anymore because we decided that sub-selecting will now "searchresults" set in the same way that a new search would have
										
										USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
										CLEAR SET:C117("TempSet")
										vNo:=SD2_DiaryViewCountRecords
										vNo2:=0
									Else 
										Gen_Alert("Program error in SD2_diaryViewer form method. Somehow more records in selection a"+"fter attempted line removal than before removal! Please contact developer.")
								End case 
								
							Else 
								//First Gather all the sets
								//SD2_DiaryViewManageSelection (True)  `Comment added 19/06/08, kmw - Ignore unhighlighted. Don't ignore highlighted. (ie make highlighted ones the current record selection).
								SD2_DiaryViewManageSelectionNEW(True:C214)  //Comment added 19/06/08, kmw - Ignore unhighlighted. Don't ignore highlighted. (ie make highlighted ones the current record selection).
								
								//CREATE SET([DIARY];"$Temp1")
								
								If (Records in selection:C76([DIARY:12])>0)
									CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 03/07/08 (we decided that sub-selecting will now reset the "searchresults" set in the same way that a new search would have)
									SD2_T_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									SD2_t_SearchCriteria:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									SRCH_t_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									
									//USE SET("$Temp1")
									//CLEAR SET("$Temp1")
									//SD2_DiaryVIewManageView (-1;"";False)  `updates the view-keeps the page `kmw 03/07/08 - added param so it doesnt apply filter (because when filtering it reverts back to last search)
									SD2_DiaryVIewManageView(-1)  //kmw 03/07/08 - don't need to tell it not to apply filter anymore because we decided that sub-selecting will now "searchresults" set in the same way that a new search would have
									
									USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
									CLEAR SET:C117("TempSet")
									vNo:=SD2_DiaryViewCountRecords
									vNo2:=0
									//Cache_Update
									
								Else 
									
									Gen_Alert("Please first highlight records to Select"; "Try again")
								End if 
							End if 
							
							SD2_DiaryViewUnhighlightAll  //changed to method 03/07/08 -kmw
							
						End if 
					: ($_l_ButtonPressed=DB_GetButtonFunction("QVSearch"))
						QV_bo_SearchDone:=False:C215
						QV_bo_KeepWindowsize:=True:C214
						CREATE EMPTY SET:C140([DIARY:12]; "QVTEMP")
						QV_AdvancedSearch(Table:C252(->[DIARY:12]))
						//this returns a set
						USE SET:C118("QVTEMP")
						CLEAR SET:C117("QVTEMP")
						
						CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08
						If (QV_bo_SearchDone)
							If (Count parameters:C259<2)
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
							End if 
						End if 
						vNo:=SD2_DiaryViewCountRecords
						
						//Cache_Update
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Find"))  //| (oSearch=1))
						OBJECT SET VISIBLE:C603(SD2_t_SearchCriteria; False:C215)
						OBJECT SET VISIBLE:C603(SD2_T_SearchValue; True:C214)
						GOTO OBJECT:C206(SD2_T_SearchValue)
						HIGHLIGHT TEXT:C210(SD2_T_SearchValue; 1; 256)
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Sort"))  //| (oSort=1))
						//  oSort:=0
						//Get all the selections loaded first
						
						//SD2_DiaryViewManageSelection (False;True)
						SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //replaced the above line 04/07/08 -kmw (goal is presumably to load all lines into current selection regardless of highlighted ststus....previously it might have worked...maybe (certainly would have behaved strnagely if it did what it says on the tin but that might not have mattered)...anyway just in case it best to call my new function for consistency)
						
						
						If (Records in selection:C76([DIARY:12])<100)
							MESSAGES OFF:C175
						End if 
						If (Substring:C12(<>ButtDis; 12; 1)#"S")
							<>SYS_bo_CurrentWindowModal:=True:C214
							MESSAGES OFF:C175
							SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
							ORDER BY:C49([DIARY:12])
							SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
							MESSAGES ON:C181
							<>SYS_bo_CurrentWindowModal:=False:C215
							If (OK=1)
								DM_bo_CustomSort:=True:C214
								CREATE SET:C116([DIARY:12]; "TempSet")
								SD2_DiaryVIewManageView(-1)
								
								
							End if 
						End if 
						MESSAGES ON:C181
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Set"))
						If (Substring:C12(<>ButtDis; 11; 1)#"S")
							If (Not:C34(In_ButtSilver))
								
								//************ added 04/07/08 -kmw (this is just my best guess on expected behaviour of set functionality) **********
								SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //just make the currently highlighted ones the current selection
								If (Records in selection:C76([DIARY:12])=0)
									SD2_DiaryViewManageSelectionNEW(True:C214; True:C214)  //make them all the current selection
								End if 
								//******************************************************************************************************************
								Gen_ListSet("Temp"; ->[DIARY:12])
								
								
							End if 
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Report"))  // | (oReport=1))
						// oReport:=0
						//  If (Not(In_ButtSilver ))
						//Get the records
						//Get all the selections loaded first
						
						//SD2_DiaryViewManageSelection (False;True)  `kmw 30/06/08 - once again this call was wrong way around (was  trying to do graph on UNhighlighted records) and old method broken anyway so changed to use new one
						CREATE SET:C116([DIARY:12]; "TempSet")  //added 30/06/08- kmw 30/06/08
						SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //changed to this from old (and corrected parameter order)  - kmw 30/06/08
						
						If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
							Gen_ListReport(->[DIARY:12]; "Diary_Sel")
						End if 
						// End if
						USE SET:C118("TempSet")  //added kmw 30/06/08
						CLEAR SET:C117("TempSet")  //added kmw 30/06/08
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Graph"))  //| (oGraph=1))
						// oGraph:=0
						//  If (Not(In_ButtSilver ))
						
						//SD2_DiaryViewManageSelection (False;True)  `kmw 30/06/08 - once again this call was wrong way around (was  trying to do graph on UNhighlighted records) and old method broken anyway so changed to use new one
						CREATE SET:C116([DIARY:12]; "TempSet")  //added 30/06/08- kmw 30/06/08
						SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //changed to this from old (and corrected parameter order) - kmw 30/06/08
						
						If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
							Gen_ListGraph(->[DIARY:12])
							
						End if 
						//  End if
						USE SET:C118("TempSet")  //added kmw 30/06/08
						CLEAR SET:C117("TempSet")  //added kmw 30/06/08
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Apply"))
						If (Substring:C12(vButtDisO; 15; 1)#"A")
							
							//SD2_DiaryViewManageSelection (False;True)`commented out kmw 30/06/08 -was using old broken method and also it was passing incorrect params anyway (in theory even if broken method worked then this call was trying to set UNhighlighted items as the current selection)
							
							//************************************************* added kmw 30/06/08 *************************************************
							SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //Make sure ALL items are rememebered so we can set them as current selection later
							CREATE SET:C116([DIARY:12]; "TempSet")  //Make sure ALL items are rememebered so we can set them as current selection later
							SD2_DiaryViewManageSelectionNEW(True:C214)  //Only set highlighted items as current selection
							//*************************************************************************************************************************
							Gen_ListApply(Table:C252(->[DIARY:12]); ->[DIARY:12]Diary_Code:3)
							//kmw 30/06/08 - !!! During testing still getting possible problem in that the above method is displaying an alert to me saying I don't have access....could be dead right taht i don't have access or couyld be symptomatic of something such as a missing call to set up access rights (see also my comment today in "SD2_Diary_Mod")
							USE SET:C118("TempSet")  //added kmw 30/06/08
							SD2_DiaryVIewManageView(-1)  //kmw 30/06/08 decided to leave it re-doing the view as the apply may have changed teh data so this makes sense.
							CLEAR SET:C117("TempSet")  //added kmw 30/06/08
							
						End if 
						// FS_SetFormSort (WIN_t_CurrentOutputform)
					: ($_l_ButtonPressed=DB_GetButtonFunction("Count"))
						If (Substring:C12(<>ButtDis; 14; 1)#"C")
							SD2_DiaryViewManageSelection(False:C215; True:C214)
							CREATE SET:C116([DIARY:12]; "TEMP")
							Gen_Count(->[DIARY:12]; "TEMP")
							EXECUTE FORMULA:C63("Diary_OutCount")
							Gen_Alert(vText; "")
							
							
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Tel"))
						If (Substring:C12(<>ButtDis; 17; 1)#"T")
							$_ptr_Record1Code:=->[DIARY:12]Company_Code:1
							$_ptr_Record2Code:=->[DIARY:12]Contact_Code:2
							Gen_ShowTelOut($_ptr_Record1Code; $_ptr_Record2Code)
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("Diary"))
						If (Substring:C12(<>ButtDis; 16; 1)#"D")
							
							SD2_DiaryViewManageSelection(True:C214)
							If (Records in selection:C76([DIARY:12])=1)
								$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
								$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
								$_Ptr_KeyField:=SD2_aptr_ListControl{8}
								$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
								If ($_l_KeyPosition>0)  //it should be
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
								End if 
								For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
									$_l_LinePosition:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
									If ($_l_LinePosition>0)
										If ($_l_KeyPosition>0)
											APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
										End if 
									End if 
								End for 
								If (Size of array:C274($_at_DiaryrecordCodes)>0)
									//Because here i know what we are searching we can hard code this
									QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryrecordCodes)
								End if 
								FurthFld_Func2(->[DIARY:12])
							Else 
								Gen_Alert("Please first select a record for which you want to View Further Fields"; "Try again")
							End if 
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("M:"))
						$_t_ClickedFunction:=DB_t_ButtonClickedFunction
						DB_t_ButtonClickedFunction:=""
						If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
							Macro(Substring:C12($_t_ClickedFunction; 3; 15))  //Play a Macro - Called by Record_FKey
						End if 
						
					: ($_l_ButtonPressed=DB_GetButtonFunction("-1"))
						$_t_ClickedFunction:=DB_t_ButtonClickedFunction
						DB_t_ButtonClickedFunction:=""
						If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
							If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
								$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
								DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
								$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 5; 15))
								EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 5; 15))
								DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
							Else 
								$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 3; 15))
								EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
							End if 
						End if 
					: ($_l_ButtonPressed=DB_GetButtonFunction("SPshow"))  //show sales pipeline
						ZSalesPipeline
					: ($_l_ButtonPressed=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
						COPY NAMED SELECTION:C331([DIARY:12]; "CurrentSortedSelection")
						ARRAY LONGINT:C221($_al_CurrentSelection; 0)
						LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
						If (Size of array:C274($_al_CurrentSelection)>0)
							
							For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
								$_l_LinePosition:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
								If ($_l_LinePosition>0)
									If ($_l_KeyPosition>0)
										APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
									End if 
								End if 
							End for 
							If (Size of array:C274($_at_DiaryrecordCodes)>0)
								//Because here i know what we are searching we can hard code this
								QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryrecordCodes)
							End if 
							SP_EnterRelatedPipeline(->[DIARY:12])
						Else 
							
							$_l_PipelineProcess:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
							// USE NAMED SELECTION("Current")
						End if 
						
				End case 
				
			End if 
		Else 
			//Call to update something
			$_l_EventCall:=SD2_l_EventCall
			SD2_l_EventCall:=0
			Case of 
				: ($_l_EventCall=13)
					If (SD2_T_SearchValue#"")
						SD2_DiaryVIewManageView(1; SD2_T_SearchValue)
					Else 
						SD2_DiaryViewManageSelection
						SD2_DiaryVIewManageView(-1)
					End if 
					//: ($_l_EventCall=13)`commented out 26/06/08 -kmw
				: ($_l_EventCall=14)  //added this case on 26/06/08 -kmw, (at time I added this I set up a call to it from "LBi_InclEdit_inProcess" when user deletes diary item from detail screen)
					If (False:C215)
						SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
						SD2_DiaryViewHighlightRecords  //cached selections would have been correctly set back to blank by "SD2_DiaryVIewManageView" (after all those lines are deleted now), however we may (probably) still need to use the now blank cache to unselect any line numbers from the current tab page list area
					End if 
					If (False:C215)
						SD2_DiaryVIewManageView(1; SD2_T_SearchValue)
					End if 
					
					SD2_DiaryViewManageSelectionNEW
					CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08 (deleted records should no longer be in search/select selection)
					SD2_DiaryVIewManageView(-1)
					SD2_DiaryViewUnhighlightAll  //added 03/07/08 -kmw
					
					vNo:=SD2_DiaryViewCountRecords
					vNo2:=0
					
			End case 
			
		End if 
	: ($_l_event=On Activate:K2:9)
		vButtDisO:="O              D "
		//Out_Buttons
		//vButtDisO:="O D MONPFSSSRCADT"
		Out_Buttons(->[DIARY:12])
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_diaryViewer"; $_t_oldMethodName)
