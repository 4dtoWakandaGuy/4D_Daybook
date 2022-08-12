//%attributes = {}

If (False:C215)
	//Database Method Name:      Diary_Workflow_Manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(WF_abo_Include;0)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY LONGINT:C221($_al_Users; 0)
	ARRAY LONGINT:C221($_al_WorkGroups; 0)
	//ARRAY LONGINT(WF_al_PersonIDS;0)
	ARRAY TEXT:C222($_at_Attributes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	//ARRAY TEXT(WF_at_Initials;0)
	//ARRAY TEXT(WF_at_Personnel;0)
	C_BOOLEAN:C305($_bo_activeToday)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CreateActions; $_l_CreateOwners; $_l_DayNumber; $_l_Ref; $_l_SetupCampaign; SD3_l_DiaryWorkflowWIndowID)
	C_OBJECT:C1216($_obj_Participants)
	C_TEXT:C284($_t_activeDays; $_t_DiaryAction; $_t_oldMethodName)
	C_TIME:C306($_ti_FirstTIME)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Diary_Workflow_Manager")

//First look for any active campaigns
QUERY:C277([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]Campaign_Active:5=True:C214)
QUERY SELECTION:C341([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]Date_End:4=!00-00-00!; *)
QUERY SELECTION:C341([WORKFLOW_Campaign:209];  | ; [WORKFLOW_Campaign:209]Date_End:4>=Current date:C33; *)

READ ONLY:C145([PERSONNEL:11])
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; WF_at_Personnel; [PERSONNEL:11]Personnel_ID:48; WF_al_PersonIDS; [PERSONNEL:11]Initials:1; WF_at_Initials)
ARRAY BOOLEAN:C223(WF_abo_Include; Size of array:C274(WF_al_PersonIDS))

UNLOAD RECORD:C212([PERSONNEL:11])
//$_l_Ref:=Find in array(

For ($_l_SetupCampaign; 1; Records in selection:C76([WORKFLOW_Campaign:209]))
	$_t_activeDays:=[WORKFLOW_Campaign:209]DaysActive:8
	$_l_DayNumber:=Day number:C114(Current date:C33)
	$_bo_activeToday:=False:C215
	If (Length:C16($_t_activeDays)>=$_l_DayNumber)
		$_bo_activeToday:=(($_t_activeDays[[$_l_DayNumber]])="1")
	End if 
	If ($_bo_activeToday)
		$_obj_Participants:=[WORKFLOW_Campaign:209]Participents:7
		OB GET PROPERTY NAMES:C1232($_obj_Participants; $_at_Attributes; $_al_AttributeTypes)
		$_l_Ref:=Find in array:C230($_at_Attributes; "Groups")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Participants; "Groups"; $_al_WorkGroups)
		End if 
		
		$_l_Ref:=Find in array:C230($_at_Attributes; "People")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Participants; "People"; $_al_Users)
		End if 
		$_l_Ref:=Find in array:C230($_al_Users; <>PER_l_CurrentUserID)
		//only interested if i am in the campaign group
		If ($_l_Ref>0)
			$_t_DiaryAction:=[WORKFLOW_Campaign:209]ActionCode:13
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=$_t_DiaryAction; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]CampaignUUID:80=[WORKFLOW_Campaign:209]UUID:1; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=Current date:C33)
			QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
			If (Records in selection:C76([DIARY:12])=0)
				///if we have not added to todays list then create them
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Type:13#"DUP@")
				SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				CREATE SET:C116([COMPANIES:2]; "$Matching")
				QUERY WITH ARRAY:C644([DIARY:12]Company_Code:1; $_at_CompanyCodes)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]CampaignUUID:80=[WORKFLOW_Campaign:209]UUID:1)
				SELECTION TO ARRAY:C260([DIARY:12]Company_Code:1; $_at_CompanyCodes)
				QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
				CREATE SET:C116([COMPANIES:2]; "$inAlready")
				DIFFERENCE:C122("$Matching"; "$inAlready"; "$Matching")
				USE SET:C118("$Matching")
				If ([WORKFLOW_Campaign:209]Max_RecordsPerDay:11>0)
					REDUCE SELECTION:C351([COMPANIES:2]; [WORKFLOW_Campaign:209]Max_RecordsPerDay:11)
				Else 
					REDUCE SELECTION:C351([COMPANIES:2]; 1000)
				End if 
				FIRST RECORD:C50([COMPANIES:2])
				$_ti_FirstTIME:=Current time:C178
				If ($_ti_FirstTIME<[WORKFLOW_Campaign:209]TimeStart:9)
					$_ti_FirstTIME:=[WORKFLOW_Campaign:209]TimeStart:9
				End if 
				For ($_l_CreateActions; 1; Records in selection:C76([COMPANIES:2]))
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_DiaryAction)
					CREATE RECORD:C68([DIARY:12])
					[DIARY:12]Action_Code:9:=[ACTIONS:13]Action_Code:1
					[DIARY:12]Date_Do_From:4:=Current date:C33
					[DIARY:12]Date_Do_To:33:=Current date:C33
					[DIARY:12]Time_Do_From:6:=$_ti_FirstTIME
					[DIARY:12]Time_Do_To:35:=$_ti_FirstTIME+[WORKFLOW_Campaign:209]EstCallLength:14
					[DIARY:12]CampaignUUID:80:=[WORKFLOW_Campaign:209]UUID:1
					[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
					[DIARY:12]Action_Details:10:=[ACTIONS:13]Default_Description:6
					
					SAVE RECORD:C53([DIARY:12])
					For ($_l_CreateOwners; 1; Size of array:C274($_al_Users))
						CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
						[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
						[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=$_al_Users{$_l_CreateOwners}
						SAVE RECORD:C53([DIARY_ITEMOWNERS:106])
					End for 
					NEXT RECORD:C51([COMPANIES:2])
				End for 
				
			End if 
		End if 
	End if 
	NEXT RECORD:C51([WORKFLOW_Campaign:209])
End for 

SD3_l_DiaryWorkflowWIndowID:=Open window:C153(0; 0; 0; 0; -Palette window:K34:3)
DIALOG:C40([DIARY:12]; "WF_TaskManager")
ERR_MethodTrackerReturn("Diary_Workflow_Manager"; $_t_oldMethodName)