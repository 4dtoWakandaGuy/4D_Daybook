If (False:C215)
	//object Name: [USER]DiaryResultsDialog.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_NASequenceCodes;0)
	C_LONGINT:C283(SD_l_SequenceRef)
	C_TEXT:C284($_t_DiaryCode; $_t_oldMethodName; $_t_Sequence; SD_t_AutoResultNA)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Variable7"; Form event code:C388)
DB_SaveRecord(->[DIARY:12])
AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
Case of 
	: (Size of array:C274(SD_at_NASequenceCodes)=1) | (Size of array:C274(SD_at_NASequenceCodes)=0)
		
		CANCEL:C270
	Else 
		SD_l_SequenceRef:=SD_l_SequenceRef+1
		SD_t_AutoResultNA:=SD_at_NASequenceCodes{SD_l_SequenceRef}
		If (SD_l_SequenceRef<=Size of array:C274(SD_at_NASequenceCodes))
			If (SD_t_AutoResultNA#"")
				//the result is set-go to page2)
				$_t_Sequence:=SD_LoadSequence([DIARY:12]Action_Code:9; [DIARY:12]Result_Code:11)
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=SD_t_AutoResultNA)
				//`````````````
				If ($_t_Sequence#"")
					If ([WORKFLOW_CONTROL:51]Next_Action:3#"")
						
						DUPLICATE RECORD:C225([DIARY:12])
						[DIARY:12]x_ID:50:=0
						[DIARY:12]Action_Details:10:="Next: "+Char:C90(13)+"Previous: "+[DIARY:12]Action_Code:9+", "+Char:C90(13)+[DIARY:12]Result_Description:12+Char:C90(13)+[DIARY:12]Result_Code:11+", "+[DIARY:12]Result_Description:12+Char:C90(13)
						[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"Date Done: "+String:C10([DIARY:12]Date_Done_From:5)+" "+"At:"+Time string:C180([DIARY:12]Time_Done_To:36)
						If ([WORKFLOW_CONTROL:51]Person:7#"")
							[DIARY:12]Person:8:=[WORKFLOW_CONTROL:51]Person:7
						End if 
						
						If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
							[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" - "+String:C10([DIARY:12]Date_Done_To:34)
						End if 
						If ([DIARY:12]Time_Done_To:36=[DIARY:12]Time_Done_From:7)
							[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"  At:"+Time string:C180([DIARY:12]Time_Done_To:36)
						Else 
							[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+"  from:"+Time string:C180([DIARY:12]Time_Done_From:7)+"-"+Time string:C180([DIARY:12]Time_Done_To:36)
						End if 
						[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+Char:C90(13)+"Diary Code: "+[DIARY:12]Diary_Code:3+Char:C90(13)
						$_t_DiaryCode:=[DIARY:12]Diary_Code:3
						DiarySetCode
						//because we duplicated the result and action code has been copied
						[DIARY:12]Action_Code:9:=""
						SD_SEQUENCESsetNextAction($_t_Sequence)
						SD_SEQUENCESetNextDate($_t_Sequence; [DIARY:12]Result_Code:11; [DIARY:12]Action_Code:9)
						[DIARY:12]Result_Code:11:=""
						[DIARY:12]Result_Description:12:=""
						[DIARY:12]Done:14:=False:C215
						[DIARY:12]Document_Code:15:=[WORKFLOW_CONTROL:51]Document_Code:8
						[DIARY:12]Document_Heading:32:=""
						[DIARY:12]Originator:23:=[DIARY:12]Person:8
						SD_SequencesCopyRelations($_t_DiaryCode)
						RELATE ONE:C42([DIARY:12]Company_Code:1)
						[DIARY:12]Status:30:=[COMPANIES:2]Status:12
						FORM GOTO PAGE:C247(2)
					Else 
						CANCEL:C270
					End if 
					
				Else 
					CANCEL:C270
					
				End if 
				
			End if 
			
			
		Else 
			CANCEL:C270
			
		End if 
		
		
		
End case 

//more
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Variable7"; $_t_oldMethodName)
