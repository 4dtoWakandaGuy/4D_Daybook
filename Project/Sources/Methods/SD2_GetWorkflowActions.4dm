//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetWorkflowActions
	//------------------ Method Notes ------------------
	//This method will get the workflow actions-diary items that are of type workflow into the listbox area
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_isThread;0)
	//ARRAY BOOLEAN(SD2_abo_MarkasDone;0)
	//ARRAY DATE(SD2_ad_WorkflowActionDate;0)
	//ARRAY LONGINT(SD2_al_ActionsStati;0;0)
	//ARRAY LONGINT(SD2_al_ActionsStatiTime;0;0)
	//ARRAY LONGINT(SD2_al_ActionStatColour;0;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_OpenParent;0)
	//ARRAY LONGINT(SD2_al_SourceTable;0)
	//ARRAY LONGINT(SD2_al_ThreadID;0)
	//ARRAY LONGINT(SD2_al_TimeFrom;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY LONGINT(SD2_al_WorkFlowUsers;0)
	//ARRAY PICTURE(SD_apic_WorkFlowColor;0)
	//ARRAY PICTURE(SD2_apic_ActionStatPicture;0;0)
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY PICTURE(SD2_apic_ThreadLevels;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionNotes;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryItems;0)
	//ARRAY TEXT(SD2_at_Subject;0)
	//ARRAY TEXT(SD2_at_WorkFlowActionCode;0)
	//ARRAY TEXT(SD2_at_WorkflowActionNames;0)
	//ARRAY TEXT(SD2_at_WorkflowDiaryCode;0)
	//ARRAY TEXT(SD2_at_WorkflowStatus;0)
	C_BOOLEAN:C305(SD2_bo_ActionStatusLoaded; SD2_bo_WorkflowActionsinited; SD2_bo_WorkflowUsersValid)
	C_LONGINT:C283($_l_ActionCodeRow; $_l_ActionColour; $_l_ActionID; $_l_ActionRow; $_l_ActionsIndex; $_l_ActionTiming; $_l_ArraySize; $_l_ColourRow; $_l_DaysTillDue; $_l_includeFuture; $_l_includePast)
	C_LONGINT:C283($_l_StatusIndex; $_l_StatusRow; $_l_TimeDueInMIns; $_l_TimeIndex; $_l_TimingRow; $_l_TimingTypeRow; $_l_UseSetting; $_l_WorkflowRow; $2; $3; SD2_l_ActionStatusList)
	C_PICTURE:C286($_pic_Info; $_pic_Picture1; $_pic_ThreadLevel)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetWorkflowActions")

If (SD2_bo_ActionStatusLoaded=False:C215)
	ARRAY TEXT:C222(SD2_at_WorkflowStatus; 0)
	ARRAY LONGINT:C221(SD2_al_WorkflowStatus; 0)
	SD2_l_ActionStatusList:=AA_LoadListByName("Action Status"; ->SD2_at_WorkflowStatus; ->SD2_al_WorkflowStatus)
	SD2_bo_ActionStatusLoaded:=True:C214
End if 

If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		$_l_includePast:=$2
	Else 
		$_l_includePast:=1
	End if 
	If (Count parameters:C259>=3)
		$_l_includeFuture:=$3
	Else 
		$_l_includeFuture:=1
	End if 
	If (Not:C34(SD2_bo_WorkflowActionsinited))
		ARRAY TEXT:C222(SD2_at_ActionsRange; 0)
		//TRACE
		SD2_GetActionsRangeByLocation("Workflow")
		
		
		ARRAY LONGINT:C221(SD2_al_ActionStatColour; 0; 0)
		
		ARRAY LONGINT:C221(SD2_al_ActionsStati; 0; 0)
		ARRAY LONGINT:C221(SD2_al_ActionsStatiTime; 0; 0)  //this will be the Time_In minutes calculated from the settings
		ARRAY PICTURE:C279(SD2_apic_ActionStatPicture; 0; 0)
		ARRAY LONGINT:C221(SD2_al_ActionStatColour; 0; 0)
		For ($_l_ActionsIndex; 1; Size of array:C274(SD2_at_ActionsRange))
			//Get the status settings for these actions
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_ActionsRange{$_l_ActionsIndex})
			SD2_ActionAttributesToArrays
			$_l_ArraySize:=Size of array:C274(SD2_al_ActionsStati)
			INSERT IN ARRAY:C227(SD2_al_ActionsStati; $_l_ArraySize+1)
			INSERT IN ARRAY:C227(SD2_al_ActionsStatiTime; $_l_ArraySize+1)
			INSERT IN ARRAY:C227(SD2_al_ActionStatColour; $_l_ArraySize+1)
			INSERT IN ARRAY:C227(SD2_apic_ActionStatPicture; $_l_ArraySize+1)
			$_l_ArraySize:=Size of array:C274(SD2_al_ActionsStati)
			$_l_StatusRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status")
			$_l_ColourRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Colour")
			$_l_TimingRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing")
			$_l_TimingRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing Type")
			If ($_l_StatusRow>0) & ($_l_ColourRow>0) & ($_l_TimingRow>0) & ($_l_TimingTypeRow>0)
				//We have action Status for this action
				For ($_l_StatusIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_StatusRow}))
					$_l_ActionID:=SD2_al_ActionVirtFieldDataMANY{$_l_StatusRow}{$_l_StatusIndex}
					$_l_ActionColour:=SD2_al_ActionVirtFieldDataMANY{$_l_ColourRow}{$_l_StatusIndex}
					$_l_ActionTiming:=SD2_al_ActionVirtFieldDataMANY{$_l_TimingRow}{$_l_StatusIndex}
					$_l_WorkflowRow:=Find in array:C230(SD2_al_WorkflowStatus; $_l_ActionID)
					If ($_l_WorkflowRow>0)
						APPEND TO ARRAY:C911(SD2_al_ActionsStati{$_l_ArraySize}; $_l_ActionID)
						APPEND TO ARRAY:C911(SD2_al_ActionStatColour{$_l_ArraySize}; $_l_ActionColour)
						APPEND TO ARRAY:C911(SD2_apic_ActionStatPicture{$_l_ArraySize}; SD2_PicMakeSVGcircle($_l_ActionColour; 18; 12))
						Case of 
							: (SD2_al_ActionVirtFieldDataLong{$_l_TimingRow}=2)  //days
								APPEND TO ARRAY:C911(SD2_al_ActionsStatiTime; $_l_ActionTiming*(60*24))
								
							: (SD2_al_ActionVirtFieldDataLong{$_l_TimingRow}=1)  // hours
								APPEND TO ARRAY:C911(SD2_al_ActionsStatiTime; $_l_ActionTiming*(60))
								
							Else   //minutes
								APPEND TO ARRAY:C911(SD2_al_ActionsStatiTime; $_l_ActionTiming)
								
						End case 
					End if 
				End for 
				SORT ARRAY:C229(SD2_al_ActionsStatiTime{$_l_ArraySize}; SD2_apic_ActionStatPicture{$_l_ArraySize}; SD2_al_ActionStatColour{$_l_ArraySize}; SD2_al_ActionsStati{$_l_ArraySize})
				
			End if 
			
			
		End for 
		SD2_bo_WorkflowActionsinited:=True:C214
	End if 
	QUERY WITH ARRAY:C644([DIARY:12]Action_Code:9; SD2_at_ActionsRange)
	CREATE SET:C116([DIARY:12]; "WorkFlowDiaryActions")
	If (Not:C34(SD2_bo_WorkflowUsersValid))
		QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; $1->)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD2_al_WorkFlowUsers)
		SD2_bo_WorkflowUsersValid:=True:C214
		//make sure this gets reset if you change the range of users
	End if 
	QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; SD2_al_WorkFlowUsers)
	//We need to set the status on these when diary items are closed so we can filter
	SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; SD2_at_DiaryItems)
	QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; SD2_at_DiaryItems)
	CREATE SET:C116([DIARY:12]; "UserActions")
	INTERSECTION:C121("UserActions"; "WorkFlowDiaryActions"; "UserActions")
	QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215)
	CREATE SET:C116([DIARY:12]; "Openitems")
	INTERSECTION:C121("UserActions"; "Openitems"; "UserActions")
	USE SET:C118("UserActions")
	
	If ($_l_includePast=0)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51>=Current date:C33(*))
	End if 
	If ($_l_includeFuture=0)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51<=Current date:C33(*))
	End if 
	//The above will get ALL the open workflow actions for the currently desired llist of users. Note that groups are converted to a list of users before calling this..
	ARRAY PICTURE:C279(SD2_apic_ThreadLevels; 0)
	ARRAY PICTURE:C279(SD_apic_WorkFlowColor; 0)
	ARRAY TEXT:C222(SD2_at_WorkflowActionNames; 0)
	ARRAY LONGINT:C221(SD2_al_SourceTable; 0)
	ARRAY BOOLEAN:C223(SD2_abo_MarkasDone; 0)
	SELECTION TO ARRAY:C260([DIARY:12]Display_Date_From:51; SD2_ad_WorkflowActionDate; [DIARY:12]Display_Time_From:53; SD2_al_TimeFrom; [DIARY:12]Diary_Code:3; SD2_at_WorkflowDiaryCode; [DIARY:12]Action_Code:9; SD2_at_WorkFlowActionCode; [DIARY:12]x_Open_Parent:69; SD2_al_OpenParent; [DIARY:12]x_Is_Thread:68; SD2_abo_isThread; [DIARY:12]ThreadID:64; SD2_al_ThreadID; [DIARY:12]Subject:63; SD2_at_Subject; [DIARY:12]Action_Details:10; SD2_at_ActionNotes; [DIARY:12]Data_Source_Table:49; SD2_al_SourceTable)
	ARRAY PICTURE:C279(SD2_apic_ThreadLevels; Size of array:C274(SD2_ad_WorkflowActionDate))
	ARRAY TEXT:C222(SD2_at_WorkflowActionNames; Size of array:C274(SD2_ad_WorkflowActionDate))
	ARRAY PICTURE:C279(SD_apic_WorkFlowColor; Size of array:C274(SD2_ad_WorkflowActionDate))
	ARRAY BOOLEAN:C223(SD2_abo_MarkasDone; Size of array:C274(SD2_ad_WorkflowActionDate))
	ARRAY PICTURE:C279(SD2_apic_InfoPic; Size of array:C274(SD2_ad_WorkflowActionDate))
	//GET PICTURE FROM LIBRARY(410; $_pic_ThreadLevel)
	//GET PICTURE FROM LIBRARY(418; $_pic_Info)
	$_pic_ThreadLevel:=Get_Picture(410)
	$_pic_Info:=Get_Picture(418)
	For ($_l_ActionsIndex; 1; Size of array:C274(SD2_ad_WorkflowActionDate))
		SD2_apic_InfoPic{$_l_ActionsIndex}:=$_pic_Info
		If (SD2_al_ThreadID{$_l_ActionsIndex}>0) & (SD2_abo_isThread{$_l_ActionsIndex})
			//This swaps the items to the parent. we load the sub items below
			//This is a threaded item. swap to the parent of the thread
			QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=SD2_al_ThreadID{$_l_ActionsIndex})
			SD2_ad_WorkflowActionDate{$_l_ActionsIndex}:=[DIARY:12]Display_Date_From:51
			SD2_at_WorkflowDiaryCode{$_l_ActionsIndex}:=[DIARY:12]Diary_Code:3
			SD2_at_WorkFlowActionCode{$_l_ActionsIndex}:=[DIARY:12]Action_Code:9
			SD2_al_OpenParent{$_l_ActionsIndex}:=[DIARY:12]x_Open_Parent:69
			SD2_abo_isThread{$_l_ActionsIndex}:=[DIARY:12]x_Is_Thread:68
			SD2_al_ThreadID{$_l_ActionsIndex}:=[DIARY:12]ThreadID:64
			SD2_at_Subject{$_l_ActionsIndex}:=[DIARY:12]Subject:63
			SD2_at_ActionNotes{$_l_ActionsIndex}:=[DIARY:12]Action_Details:10
			//GET PICTURE FROM LIBRARY(403; $_pic_Picture1)
			$_pic_Picture1:=Get_Picture(403)
			SD2_apic_ThreadLevels{$_l_ActionsIndex}:=$_pic_ThreadLevel
		Else 
			
			SD2_apic_ThreadLevels{$_l_ActionsIndex}:=$_pic_ThreadLevel
		End if 
		If (SD2_ad_WorkflowActionDate{$_l_ActionsIndex}=Current date:C33(*))
			$_l_DaysTillDue:=0
			$_l_TimeDueInMIns:=SD2_al_TimeFrom{$_l_ActionsIndex}-(Current time:C178(*)*1)
		Else 
			$_l_DaysTillDue:=SD2_ad_WorkflowActionDate{$_l_ActionsIndex}-Current date:C33(*)
			If (Current time:C178(*)>SD2_al_TimeFrom{$_l_ActionsIndex})
				$_l_TimeDueInMIns:=SD2_al_TimeFrom{$_l_ActionsIndex}-(Current time:C178(*)*1)
			Else 
				$_l_DaysTillDue:=$_l_DaysTillDue-1
				$_l_TimeDueInMIns:=SD2_al_TimeFrom{$_l_ActionsIndex}-(?00:00:00?)
				
			End if 
		End if 
		$_l_TimeDueInMIns:=($_l_DaysTillDue*(24*60))+$_l_TimeDueInMIns
		
		
		$_l_ActionRow:=Find in array:C230(SD2_at_ActionsRange; SD2_at_WorkFlowActionCode{$_l_ActionsIndex})
		If ($_l_ActionRow>0)
			$_l_ActionCodeRow:=Find in array:C230(SD2_at_ActionCodes; SD2_at_WorkFlowActionCode{$_l_ActionsIndex})
			
			SD2_at_WorkflowActionNames{$_l_ActionsIndex}:=SD2_at_ActionNames{$_l_ActionCodeRow}
			If (Size of array:C274(SD2_al_ActionsStati{$_l_ActionRow})>0)
				
				$_l_UseSetting:=1
				For ($_l_TimeIndex; 1; Size of array:C274(SD2_al_ActionsStati{$_l_ActionRow}))
					If ($_l_TimeDueInMIns<SD2_al_ActionsStatiTime{$_l_ActionRow}{$_l_TimeIndex})
						$_l_UseSetting:=$_l_TimeIndex
					End if 
				End for 
				// $_l_UseSetting will be at least 1
				SD_apic_WorkFlowColor{$_l_ActionsIndex}:=SD2_apic_ActionStatPicture{$_l_ActionRow}{$_l_UseSetting}
			Else 
				SD_apic_WorkFlowColor{$_l_ActionsIndex}:=SD2_PicMakeSVGcircle(0; 18; 12)
			End if 
		Else 
			SD2_at_WorkflowActionNames{$_l_ActionsIndex}:=SD2_at_WorkFlowActionCode{$_l_ActionsIndex}
			SD_apic_WorkFlowColor{$_l_ActionsIndex}:=SD2_PicMakeSVGcircle(0; 18; 12)
		End if 
		If (SD2_at_Subject{$_l_ActionsIndex}="")
			SD2_at_Subject{$_l_ActionsIndex}:=SD2_at_ActionNotes{$_l_ActionsIndex}
		End if 
		
		
		
		
	End for 
	
End if 
ERR_MethodTrackerReturn("SD2_GetWorkflowActions"; $_t_oldMethodName)
