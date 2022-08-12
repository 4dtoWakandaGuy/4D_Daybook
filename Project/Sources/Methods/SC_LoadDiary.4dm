//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_LoadDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SC_LoadDiary
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_abo_HasSubThread;0)
	//ARRAY BOOLEAN(SC_lb_DiaryItems;0)
	//ARRAY BOOLEAN(SD_abo_ActionDone;0)
	//ARRAY DATE(SD_ad_ActionDate;0)
	//ARRAY LONGINT(SD_al_actionIDs;0)
	//ARRAY TEXT(SC_at_SolutionCodes;0)
	//ARRAY TEXT(SC_at_ActionCodes;0)
	//ARRAY TEXT(SC_at_ActionNames;0)
	//ARRAY TEXT(SC_at_Heading;0)
	//ARRAY TEXT(SC_at_SolutionTypes;0)
	//ARRAY TEXT(SD_at_DiaryCodes;0)
	//ARRAY TEXT(SD_at_ActionSubject;0)
	//ARRAY TEXT(SSC_at_ActionCodes;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionsIndex; $_l_ThreadID; BResolve; PTS_l_BUT1; PTS_l_BUT2; PTS_l_BUT3; PTS_l_BUT4; PTS_l_BUT5; PTS_l_BUT6; PTS_l_BUT7)
	C_LONGINT:C283(PTS_l_BUT8; PTS_l_BUT9; SC_l_DiaryList; SC_l_ProblemTypes)
	C_TEXT:C284($_t_ActionCode; $_t_ActionDateSTR; $_t_ActionName; $_t_oldMethodName; oProbtyps_COL1; oProbtyps_COL2; oProbtyps_COL3; oProbtyps_COL4; oProbtyps_COL5; oProbtyps_COL6; oProbtyps_COL7)
	C_TEXT:C284(oProbtyps_COL8; oProbtyps_COL9; oProbtyps_HED1; oProbtyps_HED2; oProbtyps_HED3; oProbtyps_HED4; oProbtyps_HED5; oProbtyps_HED6; oProbtyps_HED7; oProbtyps_HED8; oProbtyps_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_LoadDiary")
//The method loads the diary items related to the service call-broken into threads
//note that TIME SHEET entries may need to be filtered
If ([SERVICE_CALLS:20]x_ID:27=0)
	[SERVICE_CALLS:20]x_ID:27:=AA_GetNextID(->[SERVICE_CALLS:20]x_ID:27)
End if 
//N

$_l_ThreadID:=SD2_CreateLinkedDiaryThread(Table:C252(->[SERVICE_CALLS:20]); [SERVICE_CALLS:20]x_ID:27)


//we filter out of the list if diary itesm this item.
//NG be carefull that if the user cancels from the service callso the call is not saved the trhead gets cleared

SD_LoadPrefs(<>PER_l_CurrentUserID)

QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=[SERVICE_CALLS:20]Call_Code:4)

QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]ThreadID:64=0; *)
QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]ThreadID:64=$_l_ThreadID)

ARRAY TEXT:C222(SSC_at_ActionCodes; 0)
ARRAY TEXT:C222(SD_at_ActionSubject; 0)
ARRAY DATE:C224(SD_ad_ActionDate; 0)
ARRAY BOOLEAN:C223(SD_abo_ActionDone; 0)
ARRAY LONGINT:C221(SD_al_actionIDs; 0)
ARRAY BOOLEAN:C223(SC_abo_HasSubThread; 0)
ARRAY TEXT:C222(SD_at_DiaryCodes; 0)
ARRAY TEXT:C222(SC_at_Heading; 0)
ARRAY TEXT:C222(SC_at_SolutionTypes; 0)
ARRAY TEXT:C222(SC_at_SolutionCodes; 0)
ALL RECORDS:C47([SOLUTIONS:23])
SELECTION TO ARRAY:C260([SOLUTIONS:23]Solution_Code:1; SC_at_SolutionCodes; [SOLUTIONS:23]Solution_Name:2; SC_at_SolutionTypes)

//Here we only set up the top level
//and test if there is a 'sub level'-we do not load the sub level until the user expands it
SELECTION TO ARRAY:C260([DIARY:12]Action_Code:9; SC_at_ActionCodes; [DIARY:12]Subject:63; SD_at_ActionSubject; [DIARY:12]Date_Do_From:4; SD_ad_ActionDate; [DIARY:12]Done:14; SD_abo_ActionDone; [DIARY:12]x_ID:50; SD_al_actionIDs; [DIARY:12]Diary_Code:3; SD_at_DiaryCodes)
ARRAY TEXT:C222(SC_at_Heading; Size of array:C274(SC_at_ActionCodes))
ARRAY TEXT:C222(SC_at_ActionNames; Size of array:C274(SC_at_ActionCodes))
For ($_l_ActionsIndex; 1; Size of array:C274(SD_at_ActionSubject))
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SC_at_ActionCodes{$_l_ActionsIndex})
	SC_at_ActionNames{$_l_ActionsIndex}:=[ACTIONS:13]Action_Name:2
	If (SD_at_ActionSubject{$_l_ActionsIndex}="")
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SC_at_ActionCodes{$_l_ActionsIndex})
		$_t_ActionCode:=" "*(20-Length:C16(SC_at_ActionCodes{$_l_ActionsIndex}))+SC_at_ActionCodes{$_l_ActionsIndex}
		$_t_ActionName:=" "*(55-Length:C16([ACTIONS:13]Action_Name:2))+[ACTIONS:13]Action_Name:2
		$_t_ActionDateSTR:=" "*(35-Length:C16(String:C10(SD_ad_ActionDate{$_l_ActionsIndex})))+String:C10(SD_ad_ActionDate{$_l_ActionsIndex})
		SC_at_Heading{$_l_ActionsIndex}:=Replace string:C233([DIARY:12]Action_Details:10; Char:C90(13); " ")
		SC_at_Heading{$_l_ActionsIndex}:=Replace string:C233(SC_at_Heading{$_l_ActionsIndex}; Char:C90(9); " ")
		SC_at_Heading{$_l_ActionsIndex}:=Replace string:C233(SC_at_Heading{$_l_ActionsIndex}; Char:C90(10); " ")
	Else 
		$_t_ActionCode:=" "*(20-Length:C16(SC_at_ActionCodes{$_l_ActionsIndex}))+SC_at_ActionCodes{$_l_ActionsIndex}
		$_t_ActionName:=" "*(55-Length:C16([ACTIONS:13]Action_Name:2))+[ACTIONS:13]Action_Name:2
		$_t_ActionDateSTR:=" "*(35-Length:C16(String:C10(SD_ad_ActionDate{$_l_ActionsIndex})))+String:C10(SD_ad_ActionDate{$_l_ActionsIndex})
		
		SC_at_Heading{$_l_ActionsIndex}:=Substring:C12(SD_at_ActionSubject{$_l_ActionsIndex}; 1; 50)
	End if 
End for 
ARRAY BOOLEAN:C223(SC_abo_HasSubThread; Size of array:C274(SC_at_ActionCodes))
For ($_l_ActionsIndex; 1; Size of array:C274(SD_al_actionIDs))
	QUERY:C277([DIARY:12]; [DIARY:12]ThreadID:64=SD_al_actionIDs{$_l_ActionsIndex})
	If (Records in selection:C76([DIARY:12])>0)
		SC_abo_HasSubThread{$_l_ActionsIndex}:=True:C214
	End if 
End for 
If (Is a list:C621(SC_l_DiaryList))
	CLEAR LIST:C377(SC_l_DiaryList; *)
End if 
SORT ARRAY:C229(SD_al_actionIDs; SD_ad_ActionDate; SC_at_ActionCodes; SD_at_ActionSubject; SD_ad_ActionDate; SD_abo_ActionDone; SC_abo_HasSubThread; SD_at_DiaryCodes; SC_at_ActionNames)


LB_SetupListbox(->SC_lb_DiaryItems; "oProbtyps"; "PTS_L"; 1; ->SC_at_ActionCodes; ->SC_at_ActionNames; ->SD_ad_ActionDate; ->SD_abo_ActionDone; ->SC_at_Heading; ->SD_al_actionIDs; ->SD_at_ActionSubject; ->SC_abo_HasSubThread; ->SD_at_DiaryCodes)

LB_SetColumnHeaders(->SC_lb_DiaryItems; "PTS_L"; 1; "Action Code"; "Action Nam"; "Date"; "Completed"; "Description")

LB_SetColumnWidths(->SC_lb_DiaryItems; "oProbtyps"; 1; 60; 100; 50; 50; 200; 0; 0; 0; 0)
LB_SETENTRYOPTIONS  // doesn't actually do anything ...
LB_StyleSettings(->SC_lb_DiaryItems; "blue"; 9; "oProbtyps"; ->[SERVICE_CALLS:20])
LB_SetScroll(->SC_lb_DiaryItems; -3; -2)
LB_SetEnterable(->SC_lb_DiaryItems; False:C215; 0)
LB_SetSortOptions(->SC_lb_DiaryItems; 0)
If (Size of array:C274(SC_at_ActionCodes)>0) | (False:C215)
	FORM GOTO PAGE:C247(4)
	OBJECT SET VISIBLE:C603(SC_lb_DiaryItems; True:C214)
	OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Problem_Description:15; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSCProblemLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "aSCSolutionLabel"; False:C215)
	OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Description:17; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSCSolutionCodeLabel"; False:C215)
	OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Code:16; False:C215)
	OBJECT SET VISIBLE:C603([SOLUTIONS:23]Solution_Name:2; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSolutionPopup"; False:C215)
	OBJECT SET VISIBLE:C603(BResolve; False:C215)
	SC_LoadDiaryRecord(SD_at_DiaryCodes{1})
	LISTBOX SELECT ROW:C912(SC_lb_DiaryItems; 1; 0)
Else 
	//There are no diary items relating to this service call(probably a new call)
	SVS_SetFieldPositions(True:C214)
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("SC_LoadDiary"; $_t_oldMethodName)
