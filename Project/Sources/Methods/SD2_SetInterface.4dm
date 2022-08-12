//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2010 13:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(WR Area to blob)
	//C_UNKNOWN(WR BLOB TO AREA)
	//C_UNKNOWN(WR DELETE OFFSCREEN AREA)
	//C_UNKNOWN(WR Get text)
	//C_UNKNOWN(WR INSERT TEXT)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryRelations;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY TEXT(SD2_at_DactionNames;0)
	//ARRAY TEXT(SD2_at_DiaryActionCodes;0)
	//ARRAY TEXT(SD2_at_DurationNames;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeComb;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_PlanResultTab;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SD2_at_WorkFlowTable;0)
	C_BLOB:C604($_blb_TimeLongintEMPBLOB)
	C_BOOLEAN:C305($_bo_ShowDuration; $_bo_ShowTimeTo; $_bo_UpdateActionBlob; $_bo_UpdateResultBlob; $2; SD_bo_NewRecord; SD2_bo_InviteesBoxDone; SD2_bo_LinkBoxDone; SD2_bo_ShowDetailsASWP)
	C_LONGINT:C283($_l_AddDays; $_l_ButtonBottom; $_l_ButtonLeft; $_l_ButtonRight; $_l_ButtonTop; $_l_Count; $_l_Date2Top; $_l_DateTop; $_l_Days; $_l_DetailsTop; $_l_Difference)
	C_LONGINT:C283($_l_DurationTop; $_l_FieldNumber; $_l_Gap; $_l_Height; $_l_Height2; $_l_Index; $_l_InviteeWidth; $_l_LabelBottom; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop)
	C_LONGINT:C283($_l_NewTop; $_l_NextObject; $_l_Nul; $_l_NumberofCharacters; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectGap; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectWidth; $_l_ObJWidth; $_l_ReminderTop; $_l_SelectedTab; $_l_SourceTableRow; $_l_StandardFieldHeight; $_l_SubjectTop; $_l_TableIndex)
	C_LONGINT:C283($_l_Time; $_l_TimeFromStart; $_l_TimeLongintempArea; $_l_TimeLongintext; $_l_TimeLongintotalHeight; $_l_TimeToEnd; diarydetails; SD_l_CountTimes; SD_l_CurrentTab; SD2_but_extendDates; SD2_l_BUT1)
	C_LONGINT:C283(SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD2_l_Completed; SD2_l_DiaryDuration; SD2_l_InviteesDisplayed)
	C_LONGINT:C283(SD2_l_ShowDate2)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_ResultDescription; $_t_WindowTitle; $1; DiaryDetailsTXT; SD2_t_Actioncode; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4)
	C_TEXT:C284(SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_DocumentDisplayCode; SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5)
	C_TEXT:C284(SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9; SD2_t_SELActionName; SD2_t_StartLabel; SD2_t_WorkflowPerson; SD2_t_workflowRecord; SD2_t_WorkflowRecordCode; SD2_t_WorkflowTable)
	C_TIME:C306($_ti_Time; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetInterface")

//This method sets the inteface object on the SD2_InputForm
If (Count parameters:C259>=1)
	SD_l_CountTimes:=SD_l_CountTimes+1  //make sure this gets cleared in the LPA
	Case of 
		: ($1="SD2_SimpleEntry")  //this is workflow
			SD2_t_WorkflowRecordCode:=[DIARY:12]Diary_Code:3
			
			//if we know the workflow being entered or this is an existing record
			If ([DIARY:12]Data_Source_Table:49>0)  // we know the prime related table
				OBJECT SET VISIBLE:C603(SD2_at_WorkFlowTable; False:C215)
				SD2_t_WorkflowTable:=Table name:C256([DIARY:12]Data_Source_Table:49)
				OBJECT SET ENTERABLE:C238(SD2_t_workflowRecord; False:C215)
				Case of 
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[COMPANIES:2]))
						SD2_t_workflowRecord:=[DIARY:12]Company_Code:1
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[CONTACTS:1]))
						SD2_t_workflowRecord:=[DIARY:12]Contact_Code:2
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[DOCUMENTS:7]))
						SD2_t_workflowRecord:=[DIARY:12]Document_Code:15
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOBS:26]))
						SD2_t_workflowRecord:=[DIARY:12]Job_Code:19
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[ORDERS:24]))
						SD2_t_workflowRecord:=[DIARY:12]Order_Code:26
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[PRODUCTS:9]))
						SD2_t_workflowRecord:=[DIARY:12]Product_Code:13
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOB_STAGES:47]))
						SD2_t_workflowRecord:=[DIARY:12]Stage_Code:21
					: ([DIARY:12]Data_Source_Table:49=Table:C252(->[SERVICE_CALLS:20]))
						SD2_t_workflowRecord:=[DIARY:12]Call_Code:25
					Else 
						//Remember to take this one out of 'other' relations
						$_l_SourceTableRow:=Find in array:C230(SD2_al_RelatedRecordTableNum; [DIARY:12]Data_Source_Table:49)
						If ($_l_SourceTableRow>0)
							SD2_t_workflowRecord:=SD2_at_RelatedRecordCode{$_l_SourceTableRow}
						End if 
				End case 
				$_l_SourceTableRow:=Find in array:C230(SD2_al_RelatedRecordTableNum; [DIARY:12]Data_Source_Table:49)
				For ($_l_TableIndex; $_l_SourceTableRow; Size of array:C274(SD2_al_RelatedRecordTableNum))
					If (SD2_al_RelatedRecordTableNum{$_l_TableIndex}=[DIARY:12]Data_Source_Table:49) & (SD2_at_RelatedRecordCode{$_l_TableIndex}=SD2_t_workflowRecord)
						DELETE FROM ARRAY:C228(SD2_at_RelatedRecordName; $_l_TableIndex)
						DELETE FROM ARRAY:C228(SD2_at_RelatedRecordCode; $_l_TableIndex)
						DELETE FROM ARRAY:C228(SD2_al_RelatedRecordID; $_l_TableIndex)
						DELETE FROM ARRAY:C228(SD2_al_RelatedRecordTableNum; $_l_TableIndex)
						$_l_TableIndex:=Size of array:C274(SD2_al_RelatedRecordTableNum)
					End if 
				End for 
				
			Else 
				
				//the prime relation is unknown
				SD2_t_WorkflowTable:=""
				OBJECT SET VISIBLE:C603(SD2_at_WorkFlowTable; True:C214)
			End if 
			If (Size of array:C274(SD2_at_RelatedRecordName)>0)
				$_l_Height:=(272-195)+12*(Size of array:C274(SD2_at_RelatedRecordName))
				
				
				LB_SetupListbox(->SD2_lb_DiaryRelations; "SD2_t"; "SD2_L"; 1; ->SD2_at_RelatedRecordName; ->SD2_at_RelatedRecordCode; ->SD2_al_RelatedRecordID; ->SD2_al_RelatedRecordTableNum)
				LB_SetColumnHeaders(->SD2_lb_DiaryRelations; "SD2_L"; 1; "Linked to"; "Record"; "RecordID"; "Record Table NUM")
				LB_SetEnterable(->SD2_lb_DiaryRelations; False:C215; 0)
				LB_SetColumnWidths(->SD2_lb_DiaryRelations; "SD2_t"; 1; 87; 187; 0; 0)
				OBJECT SET VISIBLE:C603(*; "oSD2NoLinksMessage"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oButtonDeleteLink"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oLBDiaryRelations"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
				$_l_NextObject:=$_l_ButtonBottom+5
			Else 
				OBJECT GET COORDINATES:C663(*; "oButtonDeleteLink"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
				OBJECT MOVE:C664(*; "oButtonAddLink"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom; *)
				$_l_NextObject:=$_l_ButtonBottom+5
				OBJECT SET VISIBLE:C603(*; "oButtonDeleteLink"; False:C215)
				OBJECT SET VISIBLE:C603(SD2_lb_DiaryRelations; False:C215)
				OBJECT SET VISIBLE:C603(*; "oSD2NoLinksMessage"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oLBDiaryRelations"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
				$_l_NextObject:=$_l_ButtonBottom+5
				//Gen_SetobjectPositionRelativity (->$_l_Nul;->$_l_Nul;"oLBDiaryRelations";"oWorkflowPersonLabel";
				
			End if 
			
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
			SD2_t_WorkflowPerson:=[PERSONNEL:11]Name:2
			OBJECT GET COORDINATES:C663(*; "oWorkflowPersonLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
			OBJECT MOVE:C664(*; "oWorkflowPersonLabel"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectRight; $_l_NextObject+$_l_ObjectHeight; *)
			
			If ([DIARY:12]Result_Code:11#"") | ([DIARY:12]Done:14)
				
			End if 
			
			
			If ([DIARY:12]Action_Code:9#"")
				OBJECT SET VISIBLE:C603(SD2_at_DactionNames; False:C215)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				SD2_t_SELActionName:=[ACTIONS:13]Action_Name:2
				SD2_t_Actioncode:=[ACTIONS:13]Action_Code:1
			Else 
				SD2_t_SELActionName:=""
				SD2_t_Actioncode:=""
			End if 
			
			//
		: ($1="SD2_Input")
			ARRAY TEXT:C222(SD2_at_DurationNames; 6)
			SD2_at_DurationNames{1}:="Minutes"
			SD2_at_DurationNames{2}:="Hours"
			SD2_at_DurationNames{3}:="All Morning"
			SD2_at_DurationNames{4}:="All Afternoon"
			SD2_at_DurationNames{5}:="All Evening"
			SD2_at_DurationNames{6}:="All Day"
			ARRAY TEXT:C222(SD2_at_PlanResultTab; 2)
			SD2_at_PlanResultTab{1}:="Planned Action"
			SD2_at_PlanResultTab{2}:="Completion Notes"
			//Make sure SD_l_CurrentTab gets set to 0 in the lpa method
			If ([DIARY:12]Action_Code:9#"")
				OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
				If (SD2_t_SELActionName="")
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					SD2_t_SELActionName:=[ACTIONS:13]Action_Name:2
					UNLOAD RECORD:C212([ACTIONS:13])
				End if 
				If (SD_bo_NewRecord)
					SET WINDOW TITLE:C213("Enter: "+SD2_t_SELActionName)
				Else 
					SET WINDOW TITLE:C213("Edit: "+SD2_t_SELActionName+" "+[DIARY:12]Diary_Code:3)
				End if 
				OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; False:C215)
				OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
			Else 
				Case of 
					: (Size of array:C274(SD2_at_DactionNames)>1)
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; True:C214)
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; True:C214)  //Enterable as multiple choices-alternative to selecting from popup-but only checks the pop up values
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; True:C214)
					: (Size of array:C274(SD2_at_DactionNames)=1)
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
						[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{1}
						
						SD2_t_SELActionName:=SD2_at_DactionNames{1}
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; False:C215)
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; True:C214)  // Here this has to be enterable so an action code can be entered-alternative to entering an action code-here it looks up in the database the action code
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; True:C214)
				End case 
				If (SD_bo_NewRecord)
					SET WINDOW TITLE:C213("Enter: "+"Diary")
				Else 
					SET WINDOW TITLE:C213("Edit: "+[DIARY:12]Diary_Code:3)
				End if 
			End if 
			//Set the display date and time
			SD2_ControlResultsInterface
			//Reminders
			SD2_SetAlarmInterface
			//Times
			If ([DIARY:12]Display_Date_To:52=!00-00-00!) | ([DIARY:12]Display_Date_To:52=[DIARY:12]Display_Date_From:51)
				OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDateToButton@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDateToLabel@"; False:C215)
				
				If ([DIARY:12]Done:14=False:C215)
					OBJECT SET VISIBLE:C603(SD2_but_extendDates; True:C214)
					
				End if 
			Else 
				OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDateToButton@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDateToLabel@"; True:C214)
				
				OBJECT SET VISIBLE:C603(SD2_but_extendDates; False:C215)
			End if 
			
			If (Not:C34([DIARY:12]Done:14))
				//Show the duration of the action
				If (SD2_l_DiaryDuration=0)
					//Calculate the DURATION
					SD2_at_DurationNames:=1  //default the time to display in Minutes.
					OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; True:C214)
					If ([DIARY:12]Display_Time_To:54>[DIARY:12]Display_Time_From:53)
						$_ti_Time:=([DIARY:12]Display_Time_To:54)-([DIARY:12]Display_Time_From:53)
						SD2_l_DiaryDuration:=$_l_Time/60  //Time_In minutes
					Else 
						$_ti_Time:=?00:00:00?
						SD2_l_DiaryDuration:=0  //Time_In minute
					End if 
					//$_ti_Time is Time_In seconds
					
				Else 
					If ([DIARY:12]Display_Time_To:54>[DIARY:12]Display_Time_From:53)
						$_ti_Time:=([DIARY:12]Display_Time_To:54-([DIARY:12]Display_Time_From:53))
						SD2_l_DiaryDuration:=$_l_Time/60  //Time_In minutes
					Else 
						$_l_Time:=0
						SD2_l_DiaryDuration:=0  //Time_In minute
					End if 
					
					//Ensure that if you modify the start time or end time then the DURATION resets to 0 it will then recalculate using the time
					//Calculate the times from the duration
					// this seciton will get called if the DURATON is set
					//Note that if the USER selects all morning, all afternoon or all day then we HIDE the Duration Amount -if they change the TIME the duration will be reset to show in minutes
					SD2_SetDiaryTimeFromDuration(SD2_at_DurationNames; ->SD2_l_DiaryDuration)
					
				End if 
				//In both cases above the DISPLAYED TIME may have changed
				//in which case the ACTUAL time-whether it is do or DONE has to be updated
				//as a done action cannot be having the Date/Time_Modified. then this must be a not done action
				If ([DIARY:12]Display_Time_To:54=?00:00:00?)
					OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; True:C214)
				End if 
				
				[DIARY:12]Time_Do_From:6:=[DIARY:12]Display_Time_From:53
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Display_Time_To:54
				
				If (SD2_l_Completed=1)  //we are entering a 'done' action-its not done yet!-so the time is the time is the time etc
					[DIARY:12]Time_Done_From:7:=[DIARY:12]Display_Time_From:53
					[DIARY:12]Time_Done_To:36:=[DIARY:12]Display_Time_To:54
				End if 
			Else 
				//This is a done action-do not display the duration
				OBJECT SET VISIBLE:C603(*; "oTimeDuration"; False:C215)
				
			End if 
			SD2_bo_ShowDetailsASWP:=False:C215
			//Descrption Field
			//TRACE
			If (Not:C34([DIARY:12]Done:14))
				If (SD2_l_Completed=1)
					
					
					//we are recording a done actiion we do not display a tab to show the action-we can only enter a result
					OBJECT SET VISIBLE:C603(*; "oDiaryDetailsTab@"; False:C215)
					OBJECT SET VISIBLE:C603(*; "ODiaryDetailsLabel@"; True:C214)
					SD_l_CurrentTab:=2  // even thought the tab is not visible-this is so the data gets updated if we click done
					If (SD2_bo_ShowDetailsASWP)  //we display this using a 4D write area note this cannot change during the entry
						//Clear the are to be on the safe side
						$_l_TimeLongintempArea:=WR New offscreen area:P12000:47  //wr new offscreen area
						SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
						$_blb_TimeLongintEMPBLOB:=WR Area to blob:P12000:140($_l_TimeLongintempArea; 1)
						WR DELETE OFFSCREEN AREA:P12000:38($_l_TimeLongintempArea)
						WR BLOB TO AREA:P12000:142(diarydetails; $_blb_TimeLongintEMPBLOB)
						SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
						OBJECT SET VISIBLE:C603(DiaryDetailsTXT; False:C215)
						OBJECT SET VISIBLE:C603(DiaryDetails; True:C214)
						//``````
						If (SD2_t_DocumentDisplayCode#"")
							//Load the template
							// load result
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)  //The result template is not loaded
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
							
							//The template SHOULD have its own code for loading the action or result description to -This should call SD2_LoadDescription-which loads the action or result text to the area
						Else 
							//no template-insert some default stuff here-it will show the possibilities
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								$_l_FieldNumber:=Field:C253(->[DIARY:12]Contact_Code:2)
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); $_l_FieldNumber)
								
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								$_t_ResultDescription:=[DIARY:12]Result_Description:12
								WR INSERT TEXT:P12000:19(diaryDetails; $_t_ResultDescription)
								
								
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
						End if 
						DOC_SetWriteModifiable(diaryDetails; -2; True:C214)
						
						
						//````
					Else 
						If (SD_l_CountTimes=1)
							DiaryDetailsTXT:=[DIARY:12]Result_Description:12
						End if 
						[DIARY:12]Result_Description:12:=DiaryDetailsTXT
						
						//Record entered text to the result desc first
						// show the text area
						OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
						OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
						DiaryDetailsTXT:=[DIARY:12]Result_Description:12
					End if 
				Else 
					OBJECT SET VISIBLE:C603(*; "oDiaryDetailsTab@"; False:C215)
					OBJECT SET VISIBLE:C603(*; "ODiaryDetailsLabel@"; True:C214)
					SD_l_CurrentTab:=1  //even though the tabis not visible-this is so the data gets updated if we click done
					If (SD2_bo_ShowDetailsASWP)  //we display this using a 4D write area note this cannot change during the entry
						//Clear the are to be on the safe side
						$_l_TimeLongintempArea:=WR New offscreen area:P12000:47  //wr new offscreen area
						SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
						$_blb_TimeLongintEMPBLOB:=WR Area to blob:P12000:140($_l_TimeLongintempArea; 1)
						WR DELETE OFFSCREEN AREA:P12000:38($_l_TimeLongintempArea)
						WR BLOB TO AREA:P12000:142(diarydetails; $_blb_TimeLongintEMPBLOB)
						SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
						OBJECT SET VISIBLE:C603(DiaryDetailsTXT; False:C215)
						OBJECT SET VISIBLE:C603(DiaryDetails; True:C214)
						//``````
						If (SD2_t_DocumentDisplayCode#"")
							//Load the template
							// load result
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)  //The result template is not loaded
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Action_Description_Blob:72)
							End if 
							
							//The template SHOULD have its own code for loading the action or result description to -This should call SD2_LoadDescription-which loads the action or result text to the area
						Else 
							//no template-insert some default stuff here-it will show the possibilities
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								WR INSERT TEXT:P12000:19(diarydetails; [DIARY:12]Contact_Code:2)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; [DIARY:12]Result_Description:12)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Action_Description_Blob:72)
							End if 
						End if 
						DOC_SetWriteModifiable(diaryDetails; -2; True:C214)
						
						
						//````
					Else 
						If (SD_l_CountTimes=1)  //first time
							DiaryDetailsTXT:=[DIARY:12]Action_Details:10
						End if 
						[DIARY:12]Action_Details:10:=DiaryDetailsTXT
						
						//Record entered text to the result desc first
						// show the text area
						OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
						OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
						DiaryDetailsTXT:=[DIARY:12]Action_Details:10
					End if 
					
					//we are not recording a done action we do not display the result-the entering field is the
				End if 
			Else 
				//the displayed text should be the 'resut text'
				//if there is result and action text need a tab to display the action text but we display the result text
				If ([DIARY:12]Action_Details:10#"") & ([DIARY:12]Result_Description:12#"")
					OBJECT SET VISIBLE:C603(*; "oDiaryDetailsTab@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "ODiaryDetailsLabel@"; False:C215)
					If (SD2_at_PlanResultTab=0)  //no tab selected
						SD2_at_PlanResultTab:=2
					End if 
				Else 
					If (SD2_at_PlanResultTab=0)  //no tab selected
						SD2_at_PlanResultTab:=2
					End if 
					If (Count parameters:C259>=3)
						$_l_SelectedTab:=3
						SD2_at_PlanResultTab:=$_l_SelectedTab
					End if 
					
					If (Count parameters:C259>=2)
						OBJECT SET VISIBLE:C603(*; "oDiaryDetailsTab@"; $2)
						OBJECT SET VISIBLE:C603(*; "ODiaryDetailsLabel@"; Not:C34($2))
					Else 
						OBJECT SET VISIBLE:C603(*; "oDiaryDetailsTab@"; False:C215)
						OBJECT SET VISIBLE:C603(*; "ODiaryDetailsLabel@"; True:C214)
					End if 
					
					SD_l_CurrentTab:=0
				End if 
			End if 
			If (SD_l_CurrentTab#SD2_at_PlanResultTab)
				$_bo_UpdateActionBlob:=False:C215
				$_bo_UpdateResultBlob:=False:C215
				If (SD_l_CurrentTab#0)
					$_bo_UpdateActionBlob:=(SD_l_CurrentTab=1)
					$_bo_UpdateResultBlob:=(SD_l_CurrentTab=2)
				End if 
				SD_l_CurrentTab:=SD2_at_PlanResultTab  //so we don;t keep reloading
				If (SD2_bo_ShowDetailsASWP)  //we display this using a 4D write area
					If ($_bo_UpdateActionBlob)
						//Put the current copy of the document into the blob
						[DIARY:12]x_Action_Description_Blob:72:=WR Area to blob:P12000:140(diaryDetails; 1)
						//and extract the text to the Action desc
						$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
						If ($_l_Count>0)
							[DIARY:12]Action_Details:10:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
						Else 
							[DIARY:12]Action_Details:10:=""
						End if 
					Else 
						If ($_bo_UpdateResultBlob)
							[DIARY:12]x_Result_Description_Blob:73:=WR Area to blob:P12000:140(diaryDetails; 1)
							//and extract the text to the result desc
							$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
							If ($_l_Count>0)
								[DIARY:12]Result_Description:12:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
							Else 
								[DIARY:12]Result_Description:12:=""
							End if 
						End if 
					End if 
					//here clear the area
					$_l_TimeLongintempArea:=WR New offscreen area:P12000:47  //wr new offscreen area
					SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
					$_blb_TimeLongintEMPBLOB:=WR Area to blob:P12000:140($_l_TimeLongintempArea; 1)
					WR DELETE OFFSCREEN AREA:P12000:38($_l_TimeLongintempArea)
					WR BLOB TO AREA:P12000:142(diarydetails; $_blb_TimeLongintEMPBLOB)
					SET BLOB SIZE:C606($_blb_TimeLongintEMPBLOB; 0)
					//````
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; False:C215)
					OBJECT SET VISIBLE:C603(DiaryDetails; True:C214)
					If (SD2_t_DocumentDisplayCode#"")
						//Load the template
						If (SD2_at_PlanResultTab=2)  // load result
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)  //The result template is not loaded
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
						Else   //load action plan
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
								
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
							
						End if 
						//The template SHOULD have its own code for loading the action or result description to -This should call SD2_LoadDescription-which loads the action or result text to the area
					Else 
						//no template-insert some default stuff here-it will show the possibilities
						If (SD2_at_PlanResultTab=2)  // load result
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								WR INSERT TEXT:P12000:19(diarydetails; [DIARY:12]Contact_Code:2)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; [DIARY:12]Result_Description:12)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
							
						Else 
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								WR INSERT TEXT:P12000:19(diarydetails; [DIARY:12]Contact_Code:2)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								
								WR INSERT TEXT:P12000:19(diaryDetails; [DIARY:12]Action_Details:10)
							Else 
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Action_Description_Blob:72)
							End if 
						End if 
						
					End if 
					
					DOC_SetWriteModifiable(diaryDetails; -2; True:C214)
					
					
					
				Else 
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
					OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
					// as well as the change of tab here we have to udate if the text is altered
					If ($_bo_UpdateActionBlob)
						//Put the current copy of the document into the blob
						[DIARY:12]Action_Details:10:=DiaryDetailsTXT
						//and extract the text to the Action desc
						
					Else 
						If ($_bo_UpdateResultBlob)
							[DIARY:12]Result_Description:12:=DiaryDetailsTXT
							
						End if 
					End if 
					DiaryDetailsTXT:=""
					If (SD2_at_PlanResultTab=1)
						DiaryDetailsTXT:=[DIARY:12]Result_Description:12
					Else 
						DiaryDetailsTXT:=[DIARY:12]Result_Description:12
					End if 
				End if 
			End if 
			
		: ($1="SD2_DefScheduleEntry")
			
			SD2_l_InviteesDisplayed:=0
			$_l_ObjectGap:=10
			$_l_StandardFieldHeight:=12
			ARRAY TEXT:C222(SD2_at_PlanResultTab; 2)
			SD2_at_PlanResultTab{1}:="Planned Action"
			SD2_at_PlanResultTab{2}:="Completion Notes"
			
			ARRAY TEXT:C222(SD2_at_DurationNames; 6)
			SD2_at_DurationNames{1}:="Minutes"
			SD2_at_DurationNames{2}:="Hours"
			SD2_at_DurationNames{3}:="All Morning"
			SD2_at_DurationNames{4}:="All Afternoon"
			SD2_at_DurationNames{5}:="All Evening"
			SD2_at_DurationNames{6}:="All Day"
			If (Not:C34(SD2_bo_InviteesBoxDone))
				//````
				ARRAY PICTURE:C279(SD2_apic_InfoPic; Size of array:C274(SD2_at_InviteeComb))
				//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
				$_pic_Picture:=Get_Picture(418)
				For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeComb))
					SD2_apic_InfoPic{$_l_Index}:=$_pic_Picture
				End for 
				
				
				LB_SetupListbox(->SD_lb_EventInvites; "SD2_t"; "SD2_L"; 1; ->SD2_apic_InfoPic; ->SD2_at_InviteeComb; ->SD2_at_InviteeStatus; ->SD2_at_Invitees; ->SD2_al_InviteeClass; ->SD2_at_inviteeClass; ->SD2_at_InviteeEmailAddress; ->SD2_al_InviteeStatus; ->SD2_al_RecordID)
				
				LB_SetColumnHeaders(->SD_lb_EventInvites; "SD2_L"; 1; ""; "Combined address and name"; "STATUS"; "Name"; "Class"; "Class Name"; "emailaddress"; "invitation Status"; "Record ID")
				
				LB_SetColumnWidths(->SD_lb_EventInvites; "SD2_L"; 1; 20; 250; 50; 0; 0; 0; 0; 0; 0)
				
				LB_SetEnterable(->SD_lb_EventInvites; False:C215; 0)
				LB_SetScroll(->SD_lb_EventInvites; -3; -2)
				LB_SetColours(->SD_lb_EventInvites; Black:K11:16; White:K11:1; White:K11:1)
				LB_Setdividers(->SD_lb_EventInvites; 0; 0)  //Both on
				SD2_bo_InviteesBoxDone:=True:C214
			End if 
			
			If (Size of array:C274(SD2_at_Invitees)>0)
				OBJECT SET VISIBLE:C603(*; "oInviteeLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oInvitees"; True:C214)
				SD2_l_InviteesDisplayed:=1
				OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_InviteeWidth:=$_l_ObjectRight-$_l_ObjectLeft
				$_l_ObjectHeight:=Size of array:C274(SD2_at_Invitees)*12
				LB_SetColumnWidths(->SD_lb_EventInvites; "SD2_L"; 1; 20; $_l_InviteeWidth-100; 100; 0; 0; 0; 0; 0; 0)
				Case of 
					: ($_l_ObjectHeight>100)
						$_l_ObjectHeight:=100
					: ($_l_ObjectHeight<50)
						$_l_ObjectHeight:=50
				End case 
				OBJECT MOVE:C664(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectTop+$_l_ObjectHeight; *)
				$_l_SubjectTop:=$_l_ObjectTop+$_l_ObjectHeight+$_l_ObjectGap
				If (([DIARY:12]Done:14=True:C214) | ([DIARY:12]Date_Do_From:4<Current date:C33(*)) | (([DIARY:12]Date_Do_From:4=Current date:C33(*)) & ([DIARY:12]Time_Do_To:35>=Current time:C178(*)))) & ([DIARY:12]Date_Do_From:4>!00-00-00!)  //the diary item is done or after do time remember this is a schedule not a plan
					OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)  //Cant invite anyone
					OBJECT SET VISIBLE:C603(*; "oLinkButton"; False:C215)  // Cant add links
				Else 
					OBJECT SET VISIBLE:C603(*; "oLinkButton"; True:C214)  // Cant add links
					If ([DIARY:12]Email_ID:41>0)
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)  //Cant invite anyone else
						//Email is sent
					Else 
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; True:C214)  //Cant invite anyone else
					End if 
				End if 
			Else 
				OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_InviteeWidth:=$_l_ObjectRight-$_l_ObjectLeft
				LB_SetColumnWidths(->SD_lb_EventInvites; "SD2_L"; 1; 20; $_l_InviteeWidth-100; 100; 0; 0; 0; 0; 0; 0)
				OBJECT SET VISIBLE:C603(*; "oInviteeLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInvitees"; False:C215)
				If (([DIARY:12]Done:14=True:C214) | ([DIARY:12]Date_Do_From:4<Current date:C33(*)) | (([DIARY:12]Date_Do_From:4=Current date:C33(*)) & ([DIARY:12]Time_Do_To:35>=Current time:C178(*)))) & ([DIARY:12]Date_Do_From:4>!00-00-00!)  //the diary item is done or after do time remember this is a schedule not a plan
					OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)  //Cant invite anyone
					OBJECT SET VISIBLE:C603(*; "oLinkButton"; False:C215)  // Cant add links
				Else 
					OBJECT SET VISIBLE:C603(*; "oLinkButton"; True:C214)  // Cant add links
					If ([DIARY:12]Email_ID:41>0)
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)  //Cant invite anyone else
						//Email is sent
					Else 
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; True:C214)  //Cant invite anyone else
					End if 
				End if 
				$_l_SubjectTop:=$_l_ObjectTop
			End if 
			//```
			
			
			//````
			OBJECT GET COORDINATES:C663(*; "oSubjectLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_Height2:=$_l_ObjectBottom2-$_l_ObjectTop2
			$_l_NewTop:=$_l_ObjectBottom+5
			OBJECT MOVE:C664(*; "oSubjectLabel"; $_l_ObjectLeft2; $_l_SubjectTop; $_l_ObjectRight2; $_l_SubjectTop+$_l_Height2; *)
			OBJECT GET COORDINATES:C663(*; "oSubject"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oSubject"; $_l_ObjectLeft2; $_l_SubjectTop; $_l_ObjectRight2; $_l_SubjectTop+$_l_Height2; *)
			$_l_DateTop:=$_l_ObjectGap+$_l_SubjectTop+$_l_Height2
			//`````
			If ([DIARY:12]Display_Date_To:52>[DIARY:12]Display_Date_From:51)
				SD2_l_ShowDate2:=1
			End if 
			If (([DIARY:12]Display_Date_To:52=!00-00-00!) | ([DIARY:12]Display_Date_To:52=[DIARY:12]Display_Date_From:51)) & (SD2_l_ShowDate2=0)
				SD2_t_StartLabel:="Date"
				OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDateToButton@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDateToLabel@"; False:C215)
				OBJECT GET COORDINATES:C663(*; "ODateFromLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "ODateFromLabel"; $_l_LabelLeft; $_l_DateTop; $_l_LabelRight; $_l_DateTop+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateFrom"; $_l_ObjectLeft; $_l_DateTop; $_l_ObjectRight; ($_l_DateTop+($_l_ObjectBottom-$_l_ObjectTop)); *)
				//oDateFromButton
				OBJECT GET COORDINATES:C663(*; "oDateFromButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateFromButton"; $_l_ObjectLeft; $_l_DateTop-4; $_l_ObjectRight; (($_l_DateTop-4)+($_l_ObjectBottom-$_l_ObjectTop)); *)
				If ([DIARY:12]Done:14=False:C215)
					OBJECT SET VISIBLE:C603(SD2_but_extendDates; True:C214)
					OBJECT GET COORDINATES:C663(*; "oButtonExtendDates"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT MOVE:C664(*; "oButtonExtendDates"; $_l_ObjectLeft; ($_l_DateTop-4); $_l_ObjectRight; ($_l_DateTop-4)+($_l_ObjectBottom-$_l_ObjectTop); *)
				Else 
					OBJECT SET VISIBLE:C603(SD2_but_extendDates; False:C215)
					OBJECT SET VISIBLE:C603(SD2_but_extendDates; False:C215)
				End if 
				$_l_Date2Top:=$_l_DateTop+($_l_ObjectBottom-$_l_ObjectTop)+$_l_ObjectGap
			Else 
				OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; True:C214)
				SD2_t_StartLabel:="Date From"
				OBJECT SET VISIBLE:C603(*; "oDateToButton@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDateToLabel@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oButtonExtendDates"; False:C215)
				OBJECT GET COORDINATES:C663(*; "ODateFromLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "ODateFromLabel"; $_l_LabelLeft; $_l_DateTop; $_l_LabelRight; $_l_DateTop+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oDateFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateFrom"; $_l_ObjectLeft; $_l_DateTop; $_l_ObjectRight; $_l_DateTop+($_l_ObjectBottom-$_l_ObjectTop); *)
				OBJECT GET COORDINATES:C663(*; "oDateFromButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateFromButton"; $_l_ObjectLeft; $_l_DateTop-4; $_l_ObjectRight; ($_l_DateTop-4)+($_l_ObjectBottom-$_l_ObjectTop); *)
				$_l_Date2Top:=$_l_DateTop+($_l_ObjectBottom-$_l_ObjectTop)+$_l_ObjectGap
				OBJECT GET COORDINATES:C663(*; "ODatetoLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "ODatetoLabel"; $_l_LabelLeft; $_l_Date2Top; $_l_LabelRight; $_l_Date2Top+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oDateTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateTo"; $_l_ObjectLeft; $_l_Date2Top; $_l_ObjectRight; $_l_Date2Top+($_l_ObjectBottom-$_l_ObjectTop); *)
				OBJECT GET COORDINATES:C663(*; "oDateToButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oDateToButton"; $_l_ObjectLeft; $_l_Date2Top-4; $_l_ObjectRight; ($_l_Date2Top-4)+($_l_ObjectBottom-$_l_ObjectTop); *)
				
			End if 
			
			//note the section above ONLY deals with DATE --below is the section for time
			
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				//this is a done action cannot invite anyone else
				OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)
				If (SD2_l_Completed=1)  //we are entering a 'done' action-its not done yet!-so the time is the time is the time etc
					$_bo_ShowDuration:=True:C214
					[DIARY:12]Time_Done_From:7:=[DIARY:12]Display_Time_From:53
					[DIARY:12]Time_Done_To:36:=[DIARY:12]Display_Time_To:54
					OBJECT SET VISIBLE:C603(*; "oTimeDuration"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationlabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationPopUp"; True:C214)
					OBJECT SET ENTERABLE:C238(*; "oTimeFrom"; True:C214)
					OBJECT SET ENTERABLE:C238(*; "oTimeTo"; True:C214)
				Else 
					$_bo_ShowDuration:=False:C215
					//item is DONE
					OBJECT SET VISIBLE:C603(*; "oTimeDuration"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationlabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationPopUp"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "oTimeFrom"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "oTimeTo"; False:C215)
				End if 
				
				$_bo_ShowTimeTo:=True:C214
				
			Else 
				//not done but
				Case of 
					: ([DIARY:12]Display_Date_From:51<Current date:C33(*))  //The event has started--no more invites
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)
					: ([DIARY:12]Display_Date_From:51=Current date:C33(*))
						If ([DIARY:12]Display_Time_From:53<=Current time:C178(*))
							OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)  //The event has started--no more invites
						End if 
					: ([DIARY:12]Person:8#"") & ([DIARY:12]Person:8#<>PER_t_CurrentUserInitials)
						//not mine to invite to
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(*; "oinviteButton"; True:C214)
				End case 
				$_bo_ShowDuration:=True:C214
				
				If (SD2_l_DiaryDuration=0)  //Make sure anything changing the time to or from resets this to 0
					//Calculate the DURATION
					$_bo_ShowTimeTo:=False:C215
					SD2_at_DurationNames:=1  //default the time to display in Minutes.
					$_bo_ShowDuration:=True:C214
					OBJECT SET VISIBLE:C603(*; "oTimeDuration"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationlabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeDurationPopUp"; True:C214)
					OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; True:C214)
					If ([DIARY:12]Display_Time_To:54>[DIARY:12]Display_Time_From:53)
						$_ti_Time:=([DIARY:12]Display_Time_To:54)-([DIARY:12]Display_Time_From:53)
						SD2_l_DiaryDuration:=$_ti_Time/60  //Time_In minutes
					Else 
						$_ti_Time:=?00:00:00?
						SD2_l_DiaryDuration:=0  //Time_In minute
					End if 
					//$_ti_Time is Time_In seconds
					
				Else 
					
					Case of 
						: ([DIARY:12]Display_Date_To:52=[DIARY:12]Display_Date_From:51)
							
							If ([DIARY:12]Display_Time_To:54>[DIARY:12]Display_Time_From:53)
								$_ti_Time:=([DIARY:12]Display_Time_To:54)-([DIARY:12]Display_Time_From:53)
								//SD2_l_DiaryDuration:=$_ti_Time/60  `Time_In minutes
								Case of 
									: (SD2_at_DurationNames=1)  //Minutes
										SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
									: (SD2_at_DurationNames=2)  //hours
										SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In hours
									Else 
										If (Int:C8($_ti_Time/60/60)=($_ti_Time/60/60))
											SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In hours
											SD2_at_DurationNames:=2
										Else 
											SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In Minutes
											SD2_at_DurationNames:=1
										End if 
								End case 
								
							Else 
								$_ti_Time:=0
								SD2_l_DiaryDuration:=0  //Time_In minute
							End if 
						Else 
							$_l_Days:=[DIARY:12]Display_Date_To:52-[DIARY:12]Display_Date_From:51
							$_l_TimeFromStart:=((?23:59:50?*1)+1)-([DIARY:12]Display_Time_From:53*1)
							$_l_TimeToEnd:=[DIARY:12]Display_Time_To:54*1
							$_l_AddDays:=0
							If ($_l_Days>1)
								$_l_AddDays:=((?23:59:50?*1)+1)*($_l_Days-1)
							End if 
							$_ti_Time:=$_l_AddDays+$_l_TimeToEnd+$_l_TimeFromStart
							
							Case of 
								: (SD2_at_DurationNames=1)  //Minutes
									SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
								: (SD2_at_DurationNames=2)  //hours
									SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In hours
								Else 
									Case of 
										: ([DIARY:12]Display_Time_From:53<=SD_ti_SettingsTimeStart) & (([DIARY:12]Display_Time_To:54>=?13:00:00?) & ([DIARY:12]Display_Time_To:54<=?14:00:00?))  //morning
											SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
											OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; False:C215)
											SD2_at_DurationNames:=3
										: ([DIARY:12]Display_Time_From:53>=SD_ti_SettingsTimeEnd) & (([DIARY:12]Display_Time_To:54>=?13:00:00?) & ([DIARY:12]Display_Time_To:54<=?14:00:00?))  //afternoon
											SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
											OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; False:C215)
											SD2_at_DurationNames:=4
										: ([DIARY:12]Display_Time_From:53<=SD_ti_SettingsTimeEnd) & ([DIARY:12]Display_Time_To:54>=SD_ti_SettingsTimeEnd)  //evening
											SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
											OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; False:C215)
											SD2_at_DurationNames:=5
										: ([DIARY:12]Display_Time_From:53<=SD_ti_SettingsTimeStart) & ([DIARY:12]Display_Time_To:54>=SD_ti_SettingsTimeEnd)
											SD2_l_DiaryDuration:=($_ti_Time/60)  //Time_In minutes
											OBJECT SET VISIBLE:C603(SD2_l_DiaryDuration; False:C215)
											SD2_at_DurationNames:=6
										Else 
											If (Int:C8($_ti_Time/60/60)=($_ti_Time/60/60))
												SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In hours
												SD2_at_DurationNames:=2
											Else 
												SD2_l_DiaryDuration:=($_ti_Time/60)/60  //Time_In Minutes
												SD2_at_DurationNames:=1
											End if 
									End case 
							End case 
							
							//Ensure that if you modify the start time or end time then the DURATION resets to 0 it will then recalculate using the time
							//Calculate the times from the duration
							// this seciton will get called if the DURATON is set
							//Note that if the USER selects all morning, all afternoon or all day then we HIDE the Duration Amount -if they change the TIME the duration will be reset to show in minutes
							SD2_SetDiaryTimeFromDuration(SD2_at_DurationNames; ->SD2_l_DiaryDuration)
							
					End case 
					If ([DIARY:12]Display_Time_To:54=?00:00:00?)
						$_bo_ShowTimeTo:=False:C215
						OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; False:C215)
						OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; False:C215)
					Else 
						$_bo_ShowTimeTo:=True:C214
						OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; True:C214)
						OBJECT SET VISIBLE:C603(*; "oTimeToPopUp@"; True:C214)
					End if 
					[DIARY:12]Time_Do_From:6:=[DIARY:12]Display_Time_From:53
					[DIARY:12]Time_Do_To:35:=[DIARY:12]Display_Time_To:54
				End if 
				OBJECT GET COORDINATES:C663(*; "oTimeLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "oTimeLabel"; $_l_LabelLeft; $_l_DateTop; $_l_LabelRight; $_l_DateTop+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oTimeFrom"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oTimeFrom"; $_l_ObjectLeft; $_l_DateTop; $_l_ObjectRight; $_l_DateTop+($_l_ObjectBottom-$_l_ObjectTop); *)
				$_l_Height:=($_l_ObjectBottom-$_l_ObjectTop)
				OBJECT GET COORDINATES:C663(*; "oTimeFromPopUp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oTimeFromPopUp"; $_l_ObjectLeft; $_l_DateTop-2; $_l_ObjectRight; ($_l_DateTop-2)+($_l_Height)+3; *)
				If ([DIARY:12]Display_Time_From:53=[DIARY:12]Display_Time_To:54) | (Not:C34($_bo_ShowTimeTo))  //Done AT a time
					OBJECT SET VISIBLE:C603(*; "oTimeLabel2"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeTo"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeToPopUp"; False:C215)
					$_bo_ShowTimeTo:=False:C215
					$_l_DurationTop:=$_l_Date2Top
				Else 
					OBJECT SET VISIBLE:C603(*; "oTimeLabel2"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeTo"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeToPopUp"; True:C214)
					OBJECT GET COORDINATES:C663(*; "oTimeTo"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT MOVE:C664(*; "oTimeTo"; $_l_ObjectLeft; $_l_Date2Top; $_l_ObjectRight; $_l_Date2Top+($_l_ObjectBottom-$_l_ObjectTop); *)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oTimeTo"; "oTimeLabel2"; 4; 1; 3)
					
					
					$_l_Height:=($_l_ObjectBottom-$_l_ObjectTop)
					OBJECT GET COORDINATES:C663(*; "oTimeToPopUp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT MOVE:C664(*; "oTimeToPopUp"; $_l_ObjectLeft; $_l_Date2Top-1; $_l_ObjectRight; $_l_Date2Top+($_l_Height); *)
					//Note that the date--MAY be hidden...
					$_l_DurationTop:=$_l_Date2Top+($_l_ObjectBottom-$_l_ObjectTop)+$_l_ObjectGap
					
				End if 
			End if 
			If ($_bo_ShowDuration)
				OBJECT GET COORDINATES:C663(*; "oTimeDurationlabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "oTimeDurationlabel"; $_l_LabelLeft; $_l_DurationTop; $_l_LabelRight; $_l_DurationTop+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oTimeDuration"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oTimeDuration"; $_l_ObjectLeft; $_l_DurationTop; $_l_ObjectRight; $_l_DurationTop+($_l_ObjectBottom-$_l_ObjectTop); *)
				$_l_Height:=($_l_ObjectBottom-$_l_ObjectTop)
				OBJECT GET COORDINATES:C663(*; "oTimeDurationPopUp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oTimeDurationPopUp"; $_l_ObjectLeft; $_l_DurationTop-1; $_l_ObjectRight; $_l_DurationTop+($_l_Height); *)
				$_l_ReminderTop:=$_l_ObjectGap+$_l_DurationTop+($_l_LabelBottom-$_l_LabelTop)
			Else 
				
				//GET OBJECT RECT(*;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
				
				//Not showing duration so set the 'reminder' top position
				$_l_ReminderTop:=$_l_DurationTop
			End if 
			
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				//Dont show the Reminder boxes
				$_l_DetailsTop:=$_l_ReminderTop
			Else 
				OBJECT GET COORDINATES:C663(*; "oReminderCheckBox"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT MOVE:C664(*; "oReminderCheckBox"; $_l_LabelLeft; $_l_ReminderTop; $_l_LabelRight; $_l_ReminderTop+($_l_LabelBottom-$_l_LabelTop); *)
				OBJECT GET COORDINATES:C663(*; "oReminder"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oReminder"; $_l_ObjectLeft; $_l_ReminderTop+2; $_l_ObjectRight; $_l_ReminderTop+2+($_l_ObjectBottom-$_l_ObjectTop); *)
				$_l_Height:=($_l_ObjectBottom-$_l_ObjectTop)
				OBJECT GET COORDINATES:C663(*; "oReminderDurationPopUp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oReminderDurationPopUp"; $_l_ObjectLeft; $_l_ReminderTop+2; $_l_ObjectRight; $_l_ReminderTop+2+($_l_Height); *)
				$_l_DetailsTop:=$_l_ObjectGap+$_l_ReminderTop+($_l_LabelBottom-$_l_LabelTop)
			End if 
			OBJECT GET COORDINATES:C663(*; "oDiaryDetailsTEXT"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(*; "oDiaryDetailsTEXT"; $_l_ObjectLeft; $_l_DetailsTop; $_l_ObjectRight; $_l_ObjectBottom; *)
			If (Not:C34(SD2_bo_ShowDetailsASWP))
				If (Not:C34([DIARY:12]Done:14)) | ([DIARY:12]Result_Description:12="")
					
					If (SD_l_CountTimes=1)  //first time
						DiaryDetailsTXT:=[DIARY:12]Action_Details:10
					End if 
					[DIARY:12]Action_Details:10:=DiaryDetailsTXT
					//Record entered text to the result desc first
					// show the text area
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
					OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
					DiaryDetailsTXT:=[DIARY:12]Action_Details:10
				Else 
					
					If (SD_l_CountTimes=1)  //first time
						DiaryDetailsTXT:=[DIARY:12]Result_Description:12
					End if 
					[DIARY:12]Result_Description:12:=DiaryDetailsTXT
					//Record entered text to the result desc first
					// show the text area
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
					OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
					DiaryDetailsTXT:=[DIARY:12]Action_Details:10
					
				End if 
			Else 
				//load the associated document
			End if 
			//```
			
			
			//````
			If ([DIARY:12]Action_Code:9#"")
				OBJECT GET COORDINATES:C663(*; "oActionName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
				
				$_l_NumberofCharacters:=Length:C16(SD2_t_SELActionName)
				//If (($_l_NumberofCharacters*5)>$_l_ObjectWidth)
				//this is only a rough estimation
				$_l_Difference:=($_l_NumberofCharacters*6)-$_l_ObjectWidth
				Gen_SetobjectPositionByname("oActionName"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom; $_l_ObjectLeft+($_l_NumberofCharacters*6))
				OBJECT GET COORDINATES:C663(*; "oActionNamePopUp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
				Gen_SetobjectPositionByname("oActionNamePopUp"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom; $_l_ObjectLeft+$_l_ObjectWidth+($_l_Difference))
				//End if
				If (SD2_t_SELActionName="")
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					SD2_t_SELActionName:=[ACTIONS:13]Action_Name:2
					UNLOAD RECORD:C212([ACTIONS:13])
				End if 
				If (SD_bo_NewRecord)
					SET WINDOW TITLE:C213("Enter: "+SD2_t_SELActionName)
				Else 
					OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
					If ([DIARY:12]Done:14)
						SET WINDOW TITLE:C213("View: "+SD2_t_SELActionName+" "+[DIARY:12]Diary_Code:3)
					Else 
						SET WINDOW TITLE:C213("Edit: "+SD2_t_SELActionName+" "+[DIARY:12]Diary_Code:3)
					End if 
					
				End if 
				OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; False:C215)
				OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
			Else 
				Case of 
					: (Size of array:C274(SD2_at_DactionNames)>1)
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; True:C214)
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; True:C214)  //Enterable as multiple choices-alternative to selecting from popup-but only checks the pop up values
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; True:C214)
					: (Size of array:C274(SD2_at_DactionNames)=1)
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
						[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{1}
						
						SD2_t_SELActionName:=SD2_at_DactionNames{1}
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; False:C215)
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(*; "oActionNamePopUp@"; False:C215)
						OBJECT SET ENTERABLE:C238(SD2_t_SELActionName; True:C214)  // Here this has to be enterable so an action code can be entered-alternative to entering an action code-here it looks up in the database the action code
						OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; True:C214)
				End case 
				$_t_WindowTitle:=Get window title:C450
				If ($_t_WindowTitle="")
					If (SD_bo_NewRecord)
						SET WINDOW TITLE:C213("Enter to Schedule")
					Else 
						If ([DIARY:12]Done:14)
							SET WINDOW TITLE:C213("View: "+[DIARY:12]Diary_Code:3)
						Else 
							SET WINDOW TITLE:C213("Edit: "+[DIARY:12]Diary_Code:3)
						End if 
					End if 
				End if 
				SD2_SetAlarmInterface
				If (SD2_bo_ShowDetailsASWP)
				Else 
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oDiaryDetailsTEXT"; "oDateNotesLabel"; 4; 1; 3)
					
				End if 
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("SD2_SetInterface"; $_t_oldMethodName)
