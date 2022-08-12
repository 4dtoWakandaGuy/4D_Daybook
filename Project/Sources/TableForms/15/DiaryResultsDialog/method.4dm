If (False:C215)
	//Table Form Method Name: [USER]DiaryResultsDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_WorkflowResultsCodes; 0)
	//ARRAY TEXT(SD_at_NAActionCodes;0)
	//ARRAY TEXT(SD_at_NASequenceCodes;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultCodes2;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD_at_ResultNames2;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bo_ResultsDialogSequence)
	C_DATE:C307($_d_DiaryDate; SD_d_DiaryViewDate; SD2_d_DoFromBase; SD2_d_DoToBase)
	C_LONGINT:C283($_l_CurrentRow; $_l_event; $_l_ResultRow; $_l_resultsIndex; SD_l_SequenceRef; SD2_l_DiaryFromUpDown; SD2_l_DiarytoUpDown; SD3_l_DiaryActionNum)
	C_TEXT:C284($_t_LastDiaryAction; $_t_LastDiaryRecord; $_t_NextAction; $_t_oldMethodName; Dl_ResultT; SD_t_ActionEnter; SD_t_AutoResultNA; SD_t_PreviousDiaryCode; SD_t_ResultEnter; vCompName; vContName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DiaryResultsDialog"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SD2_l_DiarytoUpDown:=0
		SD2_l_DiaryFromUpDown:=0
		SD2_d_DoFromBase:=!00-00-00!
		SD2_d_DoToBase:=!00-00-00!
		
		OpenHelp(Table:C252(->[USER:15]); "DiaryResultsDialog")
		ARRAY TEXT:C222(SD_at_NASequenceCodes; 0)
		ARRAY TEXT:C222(SD_at_NAActionCodes; 0)
		SD_l_SequenceRef:=0
		SD_t_PreviousDiaryCode:=[DIARY:12]Diary_Code:3
		Case of 
			: (vCompName#"")
				SET WINDOW TITLE:C213(vCompName+" :"+String:C10(Current date:C33(*)))
			: (vContName#"")
				SET WINDOW TITLE:C213(vCompName+" :"+String:C10(Current date:C33(*)))
			Else 
				SET WINDOW TITLE:C213("Diary Item Save"+" :"+String:C10(Current date:C33(*)))
		End case 
		If ([DIARY:12]Result_Description:12="")
			SD_t_ResultEnter:=""
			[DIARY:12]Result_Description:12:=[DIARY:12]Action_Details:10
			SD_t_ResultEnter:=[DIARY:12]Result_Description:12
		Else 
			SD_t_ResultEnter:=[DIARY:12]Result_Description:12
		End if 
		
		HIGHLIGHT TEXT:C210(SD_t_ResultEnter; Length:C16(SD_t_ResultEnter)+1; Length:C16(SD_t_ResultEnter)+1)
		ARRAY TEXT:C222(SD_at_ResultCodes2; 0)  //list of all action codes
		ARRAY TEXT:C222(SD_at_ResultNames2; 0)  //list of all action codes
		ARRAY TEXT:C222(SD_at_ResultCodes2; Size of array:C274(SD_at_ResultCodes))  //list of all action codes
		ARRAY TEXT:C222(SD_at_ResultNames2; Size of array:C274(SD_at_ResultCodes))  //list of all action codes
		WS_AutoscreenSize(3; 394; 354)
		//HOLD ON 2
		//WE ONLY WANT RELEVANT RESULTS
		ARRAY TEXT:C222($_at_WorkflowResultsCodes; 0)
		QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1=[DIARY:12]Action_Code:9)
		SELECTION TO ARRAY:C260([WORKFLOW_CONTROL:51]Result_Code:2; $_at_WorkflowResultsCodes)
		$_l_CurrentRow:=0
		For ($_l_resultsIndex; 1; Size of array:C274(SD_at_ResultCodes))
			$_l_ResultRow:=Find in array:C230($_at_WorkflowResultsCodes; SD_at_ResultCodes{$_l_resultsIndex})
			If ($_l_ResultRow>0) | (Not:C34(SD_bo_ResultsDialogSequence))
				$_l_CurrentRow:=$_l_CurrentRow+1
				SD_at_ResultCodes2{$_l_CurrentRow}:=SD_at_ResultCodes{$_l_resultsIndex}
				SD_at_ResultNames2{$_l_CurrentRow}:=SD_at_ResultNames{$_l_resultsIndex}
			End if 
			
		End for 
		ARRAY TEXT:C222(SD_at_ResultCodes2; $_l_CurrentRow)  //list of all action codes
		ARRAY TEXT:C222(SD_at_ResultNames2; $_l_CurrentRow)  //list of all action codes
		If (Size of array:C274(SD_at_ResultCodes2)=0)
			[DIARY:12]Result_Code:11:="OK"
			Dl_ResultT:="Completed"
			OBJECT SET VISIBLE:C603(SD_at_ResultNames2; False:C215)
			OBJECT SET VISIBLE:C603(*; "Library Picture214"; False:C215)
		End if 
		OBJECT SET ENTERABLE:C238([DIARY:12]Result_Description:12; True:C214)
		If (SD_t_AutoResultNA#"")
			//the result is set-go to page2)
			//$_t_NextAction:=SD_LoadSequence ([DIARY]Action Code;[DIARY]Result Code)
			QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=SD_t_AutoResultNA)
			
			//`````````````
			$_t_NextAction:=SD_t_AutoResultNA
			
			If ([WORKFLOW_CONTROL:51]Next_Action:3#"")
				
				
				DUPLICATE RECORD:C225([DIARY:12])
				[DIARY:12]x_ID:50:=0
				
				[DIARY:12]Action_Details:10:="Next: "+[WORKFLOW_CONTROL:51]Description:5+Char:C90(13)+"Previous: "+[DIARY:12]Action_Code:9+", "+Char:C90(13)+[DIARY:12]Action_Details:10+Char:C90(13)+[DIARY:12]Result_Code:11+", "+[DIARY:12]Result_Description:12+Char:C90(13)
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Date Done: "+String:C10([DIARY:12]Date_Done_From:5)+" "+"At:"+Time string:C180([DIARY:12]Time_Done_To:36)
				
				If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" - "+String:C10([DIARY:12]Date_Done_To:34)
				End if 
				If ([DIARY:12]Time_Done_To:36=[DIARY:12]Time_Done_From:7)
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"  At:"+Time string:C180([DIARY:12]Time_Done_To:36)
				Else 
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"  from:"+Time string:C180([DIARY:12]Time_Done_From:7)+"-"+Time string:C180([DIARY:12]Time_Done_To:36)
				End if 
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Diary Code: "+[DIARY:12]Diary_Code:3+Char:C90(13)
				$_t_LastDiaryRecord:=[DIARY:12]Diary_Code:3
				DiarySetCode
				//because we duplicated the result and action code has been copied
				$_t_LastDiaryAction:=[DIARY:12]Action_Code:9
				[DIARY:12]Action_Code:9:=""
				
				SD_SEQUENCESsetNextAction($_t_NextAction)
				If ([DIARY:12]Action_Code:9="")
					[DIARY:12]Action_Code:9:=$_t_LastDiaryAction
				End if 
				If ([WORKFLOW_CONTROL:51]Person:7#"")
					[DIARY:12]Person:8:=[WORKFLOW_CONTROL:51]Person:7
				End if 
				SD_SEQUENCESetNextDate($_t_NextAction; [DIARY:12]Result_Code:11; [DIARY:12]Action_Code:9)
				[DIARY:12]Result_Code:11:=""
				[DIARY:12]Result_Description:12:=""
				[DIARY:12]Done:14:=False:C215
				[DIARY:12]Document_Code:15:=[WORKFLOW_CONTROL:51]Document_Code:8
				[DIARY:12]Document_Heading:32:=""
				[DIARY:12]Originator:23:=[DIARY:12]Person:8
				[DIARY:12]Original_Date_Time_Stamp:47:=0
				[DIARY:12]Email_ID:41:=0
				[DIARY:12]Email_Text:42:=""
				[DIARY:12]Email_From:38:=""
				[DIARY:12]Email_Person:39:=""
				[DIARY:12]Email_Subject:40:=""
				SD_t_ActionEnter:=[DIARY:12]Action_Details:10
				SD_SequencesCopyRelations($_t_LastDiaryRecord)
				RELATE ONE:C42([DIARY:12]Company_Code:1)
				[DIARY:12]Status:30:=[COMPANIES:2]Status:12
				FORM GOTO PAGE:C247(2)
			Else 
				CANCEL:C270
			End if 
			
			
			
		End if 
		INT_SetDialog
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (SD3_l_DiaryActionNum=6)
				//just set the date do from
				$_d_DiaryDate:=SD_d_DiaryViewDate
				// [DIARY]Date Done From:=SD_d_DiaryViewDate
				[DIARY:12]Date_Do_From:4:=SD_d_DiaryViewDate
				SD_d_DiaryViewDate:=$_d_DiaryDate
				SD3_l_DiaryActionNum:=0
				Diary_InD
				
			: (SD3_l_DiaryActionNum=7)
				//just set the date do to
				$_d_DiaryDate:=SD_d_DiaryViewDate
				[DIARY:12]Date_Do_To:33:=SD_d_DiaryViewDate
				
				SD_d_DiaryViewDate:=$_d_DiaryDate
				SD3_l_DiaryActionNum:=0
				Diary_InD
			: (SD3_l_DiaryActionNum=9)
				//just set the date do from
				$_d_DiaryDate:=SD_d_DiaryViewDate
				[DIARY:12]Date_Done_From:5:=SD_d_DiaryViewDate
				//  [DIARY]Date Do From:=SD_d_DiaryViewDate
				SD_d_DiaryViewDate:=$_d_DiaryDate
				SD3_l_DiaryActionNum:=0
				Diary_InD
				
			: (SD3_l_DiaryActionNum=10)
				//just set the date do to
				$_d_DiaryDate:=SD_d_DiaryViewDate
				[DIARY:12]Date_Done_To:34:=SD_d_DiaryViewDate
				
				//  SD_d_DiaryViewDate:=$_d_DiaryDate
				SD3_l_DiaryActionNum:=0
				Diary_InD
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].DiaryResultsDialog"; $_t_oldMethodName)
