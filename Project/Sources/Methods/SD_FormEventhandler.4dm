//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_FormEventhandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2011 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_LB_Items;0)
	//ARRAY DATE(SD_ad_DateStampValues;0)
	//ARRAY DATE(SD3_ad_CacheEndDateRange;0)
	//ARRAY DATE(SD3_ad_CacheStartDateRange;0)
	ARRAY LONGINT:C221($_al_PriorityNUMElem; 0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; DB_bo_DuringOutsideCall; SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307($_d_Date; SD_D_AddDate; SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_D_Date; SD_d_DiaryViewDate; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD; vSD_QuyDiaryDate)
	C_LONGINT:C283($_l_ButtonClickedFunction; $_l_CallNumber; $_l_IPMessage; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $_l_SourceProcess; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; Bsource; DB_l_ButtonClickedFunction; IP_l_MessageReply; IPREPLYSELF; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_GenwindowBottom; SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop)
	C_LONGINT:C283(SD_l_ProcRelationRecordID; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; SD3_l_DiarySourceProcess; WS_l_DiaryViewTABOld; WS_l_SelectedDiaryViewTab)
	C_POINTER:C301(SD_ptr_Date1; SD_ptr_Date2)
	C_TEXT:C284(<>CompCode; <>ContCode; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_processName; SD_t_CurrentDiaryInitials; SD_t_DiaryCode; SD_t_DiaryDefaultUser; SD_t_Periodstr; SD_t_PeriodStrOLD; SD3_t_DiaryRelatedRecordCode)
	C_TEXT:C284(vDateString; vSD_QuyDiaryPerson; vSrchRequest)
	C_TIME:C306(SD_ti_AddTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_FormEventhandler")
DB_bo_DuringOutsideCall:=True:C214
$_l_CallNumber:=SD3_l_DiaryActionNum
SD3_l_DiaryActionNum:=0
DB_l_ButtonClickedFunction:=0
Case of 
	: ($_l_CallNumber=1)  //call display diary items related to one company
		$_l_SourceProcess:=SD3_l_DiarySourceProcess
		SD3_l_DiarySourceProcess:=0
		WS_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
		SD_d_StartDateOLD:=SD_d_StartDate
		SD_d_EndDateOLD:=SD_d_EndDate
		SD_t_PeriodStrOLD:=SD_t_Periodstr
		SD_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
		
		//first need to test if current record NEEDS saving!
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; SD3_l_DiaryRelatedRecordTable; SD3_t_DiaryRelatedRecordCode)
		
		If (False:C215)  //NG August 2004
			SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		Else 
			//ALArrDefFill (->CONT_aPtr_LBSetup;->SD_l_ALQ;->[DIARY];->[DIARY]Diary Code;"Blue";"ALModDiary";"411111000";"Diary_InNEW";"01211";◊User;"";"Diary";"Diary";->[DIARY];->[DIARY]Diary Code)
			LBi_ArrDefFill(->CONT_aPtr_LBSetup; ->SD_LB_Items; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_InNEW"; 11; "Diary"; "Diary"; <>PER_t_CurrentUserInitials)  // 17/06/06 pb
			LBi_Prefs11(->CONT_aPtr_LBSetup)
			//   : ($c1="P")
			//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
			LBi_LoadSetup(->CONT_aPtr_LBSetup; "B")
			//AL_SetDividers (SD_l_ALQ;"Gray";"Gray";243;"Gray";"Gray";243)
			LB_Setdividers(->SD_LB_Items; 0; 4)  //Both on
			LB_Setdividers(->SD_LB_Items; Grey:K11:15; 32)  // NOT SURE THIS IS CORRECT! pb 20/06/06
			
			//AL_UpdateArrays (SD_l_ALQ;-1)
		End if 
		
		If (Size of array:C274(SD_ad_DateStampValues)>0)
			Cache_Update(WS_l_SelectedDiaryViewTab; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
			
			
			ARRAY TEXT:C222(WS_at_DiaryVIewTab; 4)
			Case of 
				: (SD3_l_DiaryRelatedRecordTable=2)
					WS_at_DiaryVIewTab{4}:="Company Diary"  //this may need to be more dynamic
				: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[SERVICE_CALLS:20]))
					WS_at_DiaryVIewTab{4}:="Service calls Diary"  //this may need to be more dynamic
				: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[CONTACTS:1]))
					WS_at_DiaryVIewTab{4}:="Contact Diary"  //this may need to be more dynamic
				: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[JOBS:26]))
					WS_at_DiaryVIewTab{4}:="Job Diary"  //this may need to be more dynamic
				: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[ORDERS:24]))
					WS_at_DiaryVIewTab{4}:="Order Diary"  //this may need to be more dynamic
				Else 
					WS_at_DiaryVIewTab{4}:="Other"
			End case 
			$_l_CallNumber:=0
			WS_at_DiaryVIewTab:=4
			WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
			FORM GOTO PAGE:C247(2)
		Else 
			SD_AddRelatedRecord($_l_SourceProcess)
		End if 
		
	: ($_l_CallNumber=2)
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		WT_hl_DiaryDETAIL3
		SD_CalendarCalc(SD_d_DiaryViewDate)
		$_l_CallNumber:=0
	: ($_l_CallNumber=3)
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SD3_t_DiaryRelatedRecordCode)
		SD_t_DiaryCode:=[DIARY:12]Diary_Code:3
		vSD_QuyDiaryPerson:=[DIARY:12]Person:8
		Case of 
			: ([DIARY:12]Date_Do_From:4#!00-00-00!)
				vSD_QuyDiaryDate:=[DIARY:12]Date_Do_From:4
			: (([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Done_From:5#!00-00-00!))
				vSD_QuyDiaryDate:=[DIARY:12]Date_Done_From:5
			: (([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
				vSD_QuyDiaryDate:=!00-00-00!
		End case 
		SD_CalendarCalc
		$_l_CallNumber:=0
		//need to work out what drives us back to Page_1
	: ($_l_CallNumber=4)  //enter to diary
		//here we will be passed a source(maybe)
		SD_SHOWPALLETES
		
		
		If (SD3_l_DiarySourceProcess=Current process:C322)
			If ([DIARY:12]Company_Code:1#"")
				<>CompCode:=[DIARY:12]Company_Code:1
			End if 
			If ([DIARY:12]Contact_Code:2#"")
				<>ContCode:=[DIARY:12]Contact_Code:2
			End if 
			
			IPReplySELF:=[DIARY:12]Data_Source_Table:49
			If (IPReplySELF=0)
				IPReplySELF:=-1
			End if 
			
		End if 
		$_l_SourceProcess:=SD3_l_DiarySourceProcess
		SD3_l_DiarySourceProcess:=0
		If ($_l_SourceProcess>0)
			If ($_l_SourceProcess=Current process:C322)
				If (SD_D_AddDate#!00-00-00!) & (SD_ti_AddTime#?00:00:00?)
					SD_AutoAddRec(""; SD_D_AddDate; SD_ti_AddTime; True:C214)
				Else 
					SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*); True:C214)
				End if 
				
			Else 
				SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*); True:C214)
			End if 
			
		Else 
			SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*))
			
		End if 
		
		If ($_l_SourceProcess>0)
			If ($_l_SourceProcess#Current process:C322)
				$_l_Repeats:=0
				Repeat   //to make sure nobody else is calling it
					GET PROCESS VARIABLE:C371($_l_SourceProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
					$_l_Repeats:=$_l_Repeats+1
					If ($_l_ButtonClickedFunction>0)
						DelayTicks(2)
					End if 
				Until ($_l_Repeats>100) | ($_l_ButtonClickedFunction=0)
				If ($_l_ButtonClickedFunction=0)  //nobody was calling
					$_l_IPMessage:=DB_GetButtonFunction("GetFormTable")
					
					PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
					If ($_l_ProcessState>=0)  // 30/05/02
						SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_ButtonClickedFunction; $_l_IPMessage)
						RESUME PROCESS:C320($_l_SourceProcess)
						POST OUTSIDE CALL:C329($_l_SourceProcess)
					End if 
					$_l_Repeats:=0
					Repeat 
						GET PROCESS VARIABLE:C371($_l_SourceProcess; IP_l_MessageReply; IP_l_MessageReply)
						$_l_Repeats:=$_l_Repeats+1
						If (IP_l_MessageReply=0)
							DelayTicks(2)
						End if 
					Until ($_l_Repeats>100) | (IP_l_MessageReply>0)
					//the IP_l_MessageReply will now be set to the table number
					If (IP_l_MessageReply>0)
						[DIARY:12]Data_Source_Table:49:=IP_l_MessageReply
						IP_l_MessageReply:=0
						$_l_ButtonClickedFunction:=0
						PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02
							SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
						End if 
					End if 
					SD_GETSOURCERECORD($_l_SourceProcess; [DIARY:12]Data_Source_Table:49)
				End if 
			Else 
				If (IPReplySELF>0)
					[DIARY:12]Data_Source_Table:49:=IPReplySELF
					IPReplySELF:=0
					OBJECT SET ENABLED:C1123(Bsource; True:C214)
					
				End if 
				IPReplySELF:=0
			End if 
		End if 
		$_l_CallNumber:=0
	: ($_l_CallNumber=5)
		SD_D_CurrentviewDate:=Current date:C33
		SD_t_Periodstr:=(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
		vDateString:=String:C10(SD_D_CurrentviewDate; 7)
		SD_DiaryViewCalc
		$_l_CallNumber:=0
	: ($_l_CallNumber=6)
		$_d_Date:=SD_d_DiaryViewDate
		[DIARY:12]Date_Do_From:4:=SD_d_DiaryViewDate
		SD_d_DiaryViewDate:=$_d_Date
		$_l_CallNumber:=0
		Diary_InD
	: ($_l_CallNumber=7)
		$_d_Date:=SD_d_DiaryViewDate
		[DIARY:12]Date_Do_To:33:=SD_d_DiaryViewDate
		
		SD_d_DiaryViewDate:=$_d_Date
		$_l_CallNumber:=0
		Diary_InD
	: ($_l_CallNumber=-8)  //Display a diary item(non-editable)
		$_l_CallNumber:=0
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		
		If (SD_l_ProcRelationRecordID>0)
			
			SD_EventItemData(-SD_l_ProcRelationRecordID; 2)
			SD_SetSplitter(->SD_l_DescriptionSplitter)
			
		End if 
		SD_l_ProcRelationRecordID:=0
	: ($_l_CallNumber=-88)  //Display a diary item(editable)
		$_l_CallNumber:=0
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		
		If (SD_l_ProcRelationRecordID>0)
			
			SD_EventItemData(-SD_l_ProcRelationRecordID; 2)
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			If ([DIARY:12]Done:14=False:C215)
				SD_l_EditingDiaryRecord:=1
				SD_SetVisible(True:C214)
				SD_SetFieldsTrue
			Else 
				SD_l_EditingDiaryRecord:=1
				READ WRITE:C146([DIARY:12])
				LOAD RECORD:C52([DIARY:12])
				OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
			End if 
			
			
		End if 
		SD_l_ProcRelationRecordID:=0
		
	: ($_l_CallNumber=8)
		
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SD3_t_DiaryRelatedRecordCode)
		SD_SetVisible(False:C215)
		RELATE ONE:C42([DIARY:12]Company_Code:1)
		WT_hl_DiaryDETAIL2
		SD_SetSplitter(->SD_l_DescriptionSplitter)
		SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		If (Records in selection:C76([DIARY:12])>0)
			DB_MenuAction("Document"; ""; 2; "")
			$_al_PriorityNUMElem:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
			If ($_al_PriorityNUMElem>0)
				SD_al_PriorityNUM:=SD_al_PriorityNUM{$_al_PriorityNUMElem}
			End if 
			If ([DIARY:12]Done:14=True:C214)
				READ WRITE:C146([DIARY:12])
				LOAD RECORD:C52([DIARY:12])
				OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
			Else 
			End if 
		End if 
		
		$_l_Process:=New process:C317("SDAG_EditInProcess"; 64000; "Edit Diary Record"+String:C10([DIARY:12]x_ID:50); [DIARY:12]x_ID:50; Current process:C322)
		
		
	: ($_l_CallNumber=9)
		SD_SHOWPALLETES
		$_l_CallNumber:=0
		GOTO OBJECT:C206(vSrchRequest)
	: ($_l_CallNumber=10)
		$_l_CallNumber:=0
		WT_hl_DiaryDETAIL3
		SD_CalendarCalc(SD_D_CurrentViewDate)
		SD_DiaryViewCalc
	: ($_l_CallNumber=11)
		$_l_CallNumber:=0
		If (SD_D_Date#SD_ptr_Date1->)
			SD_ptr_Date1->:=SD_D_Date
			Diary_InD
		End if 
	: ($_l_CallNumber=12)
		$_l_CallNumber:=0
		If (SD_D_Date#SD_ptr_Date2->)
			SD_ptr_Date2->:=SD_D_Date
			Diary_InD
		End if 
	: ($_l_CallNumber=13)
		$_l_CallNumber:=0
		SD_DiaryViewCalc
		
	: ($_l_CallNumber=14)
		$_l_CallNumber:=0
		If (Not:C34(SD3_bo_FloatingDiarydisplayed)) & (Not:C34(<>FloatingCALDisplayed))
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_WindowLeft>200)
				SET WINDOW RECT:C444(65; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			End if 
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_WindowLeft<232)
				SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			End if 
		End if 
	: ($_l_CallNumber=15)
		//call from calender=go to month
		$_l_CallNumber:=0
		WS_at_DiaryVIewTab:=3
		SD_DiaryViewCalc
	: ($_l_CallNumber=16)
		//call from calender=go to month
		$_l_CallNumber:=0
		WS_at_DiaryVIewTab:=2
		SD_DiaryViewCalc
	: ($_l_CallNumber=17)
		//reload prefs
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_DiaryDefaultUser)
		SD_LoadPrefs([PERSONNEL:11]Personnel_ID:48)
		UNLOAD RECORD:C212([PERSONNEL:11])
		
	: ($_l_CallNumber=-1)  //cancel out of screen
		$_l_CallNumber:=0
		If (SD_RecordModified(->[DIARY:12]))
			SHOW PROCESS:C325(Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
			SuperDiary_SaveChk
		End if 
		CANCEL:C270
	: ($_l_CallNumber=18)
		$_l_CallNumber:=0
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		SD_l_GenwindowLeft:=$_l_WindowLeft
		SD_l_GenwindowRight:=$_l_WindowRight
		SD_l_GenwindowTop:=$_l_WindowTop
		SD_l_GenwindowBottom:=$_l_WindowBottom
	Else 
		Out_ButtCallSD(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "SD_DiaryAdd"; "SD_Diary_Sel"; "SD_DeleteDiaryItem"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
		GOTO OBJECT:C206(vSrchRequest)
		SD_SetSplitter(->SD_l_DescriptionSplitter)
End case 
$_l_CallNumber:=0
DB_bo_DuringOutsideCall:=False:C215
ERR_MethodTrackerReturn("SD_FormEventhandler"; $_t_oldMethodName)
