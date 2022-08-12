
If (False:C215)
	//Table Name:      Trigger on [DIARY]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BLOB:C604(JSP_blb_CompositeKey)
	C_BOOLEAN:C305(<>SYS_bo_inTrigger)
	C_LONGINT:C283($_l_event; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>TimeAct; $_t_JSPCompositeKey; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DIARY]")
C_TEXT:C284(<>TimeAct)
C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		//something
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DIARY]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[DIARY:12]Diary_Code:3; 0)
			
			
			AUTO_AUDIT(->[DIARY:12]; Field:C253(->[DIARY:12]Diary_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			TRG_DiaryOrlDatetimeStamp
			Trigger_setDiaryTimeStamp
			Trigger_setDiaryDateStamp
			Trigger_setDiaryDisplayData
			
			
			If ([DIARY:12]Date_Do_To:33=!00-00-00!)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
			End if 
			If ([DIARY:12]x_ID:50=0)
				If ([DIARY:12]Diary_Code:3#"")
					[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
					db_CheckMyUnique(->[DIARY:12]x_ID:50; 0)
				End if 
				
			End if 
			If ([DIARY:12]Alarm_Timeframe:48#0)
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "Set Reminder")
			Else 
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "UpdateWorkflow")
				
			End if 
			
		End if 
		
		
		//*********added 27/02/07 -kmw********
		
		If ([DIARY:12]Action_Code:9=<>TimeAct)  //when more than one type action code suggest keeping them in an interProcess_Array so that we can still keep doing this check here don't need to create a ProcesstoHandle record for every type of diary record
			
			JC_SetDoDateTimeToDoneDateTime  //added 22/05/07 -kmw, date and time do fields are meaningless for time entry
			//May 25-above line commented out as method not found
			//kmw 11/10/07 -  this line now uncommented back in (re-activated) as the method now seems to exist...(i guess it must have missed out on one of the version integrations) - 11/10/07 -kmw
			
			$_t_JSPCompositeKey:=[DIARY:12]Person:8+"*|Delim1|*"+[DIARY:12]Job_Code:19+"*|Delim2|*"+[DIARY:12]Stage_Code:21
			C_BLOB:C604(JSP_blb_CompositeKey)
			SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
			VARIABLE TO BLOB:C532($_t_JSPCompositeKey; JSP_blb_CompositeKey)
			ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "JCAddDiary"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //adds JSP with initial total or updates pre-existing JSP
		End if 
		
		//********************************
		
		
		//If (False)  `blocked out 27/02/07 -kmw
		//*********added 26/02/07 -kmw********
		//If ([DIARY]Action Code=◊TimeAct)
		//JC_FindJobPersonnel
		//If (Records in selection([JOB PERSONNEL])>0)
		//ProcessServices_CreateRecord (->[JOB PERSONNEL];->[JOB PERSONNEL]X_ID;"JCUpdateJSPTotals")  `sets totals to sum of lower level records
		//Else
		//ProcessServices_CreateRecord (->[DIARY];->[DIARY]x_ID;"JCAddJSP")  `adds record and sets initial total
		//ProcessServices_CreateRecord (->[JOB PERSONNEL];->[JOB PERSONNEL]X_ID;"JCUpdateJSPTotals")
		//End if
		
		//ProcessServices_CreateRecord (->[DIARY];->[DIARY]x_ID;"JCAddTimeJSPRelation")  `adds "time/diary - job personnel" relation
		
		//End if
		//********************************
		//End if
		
		
		
		
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DIARY]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[DIARY:12]Diary_Code:3; 1)
			
			
			AUTO_AUDIT(->[DIARY:12]; Field:C253(->[DIARY:12]Diary_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			Trigger_setDiaryTimeStamp
			Trigger_setDiaryDateStamp
			If ([DIARY:12]Date_Do_To:33=!00-00-00!)
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
			End if 
			//     $_l_Process:=New process("WS_LINKDIARYITEM";64000;
			//"Linking Diary Item";[DIARY]Diary Code;[DIARY]Person)
			Trigger_setDiaryDisplayData
			
			If ([DIARY:12]x_ID:50=0)
				[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
			End if 
			db_CheckMyUnique(->[DIARY:12]x_ID:50; 1)
			ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "LinkItem")  // 16/04/02 pb
			//If ([DIARY]Alarm_Timeframe>0)
			If ([DIARY:12]Alarm_Timeframe:48#0)  //kmw 29/09/08 - changed from > to # (this change had already been made for new record but was missed here)
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "Set Reminder")
			Else 
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "UpdateWorkflow")
				
			End if 
			//If ((Old([DIARY]Alarm_Timeframe))>0) & (([DIARY]Alarm_Timeframe=0) | ([DIARY]Done))
			If ((Old:C35([DIARY:12]Alarm_Timeframe:48))#0) & (([DIARY:12]Alarm_Timeframe:48=0) | ([DIARY:12]Done:14))  //kmw 29/09/08 - changed from > to # (this change had already been made for new record but was missed here)
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "Remove Reminder")
			End if 
			
			//*********added 28/02/07 -kmw********
			
			If ([DIARY:12]Action_Code:9=<>TimeAct)  //when more than one type action code suggest keeping them in an interProcess_Array so that we can still keep doing this check here don't need to create a ProcesstoHandle record for every type of diary record
				
				JC_SetDoDateTimeToDoneDateTime  //added 22/05/07 -kmw, date and time do fields are meaningless for time entry
				//NG MAy 25th above line commented out as method not found
				//kmw 11/10/07 -  this line now uncommented back in (re-activated) as the method now seems to exist...(i guess it must have missed out on one of the version integrations) - 11/10/07 -kmw
				
				$_t_JSPCompositeKey:=[DIARY:12]Person:8+"*|Delim1|*"+[DIARY:12]Job_Code:19+"*|Delim2|*"+[DIARY:12]Stage_Code:21
				C_BLOB:C604(JSP_blb_CompositeKey)
				SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
				VARIABLE TO BLOB:C532($_t_JSPCompositeKey; JSP_blb_CompositeKey)
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "JCModDiary"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //adds JSP with initial total or updates pre-existing JSP
			End if 
			
			//********************************
			
			
			
		End if 
		
		
		
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DIARY]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[DIARY:12]; Field:C253(->[DIARY:12]Diary_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			
			If ([DIARY:12]Action_Code:9=<>TimeAct)  //when more than one type action code suggest keeping them in an interProcess_Array so that we can still keep doing this check here don't need to create a ProcesstoHandle record for every type of diary record
				$_t_JSPCompositeKey:=[DIARY:12]Person:8+"*|Delim1|*"+[DIARY:12]Job_Code:19+"*|Delim2|*"+[DIARY:12]Stage_Code:21
				C_BLOB:C604(JSP_blb_CompositeKey)
				SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
				VARIABLE TO BLOB:C532($_t_JSPCompositeKey; JSP_blb_CompositeKey)
				ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "JCDelDiary"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //adds JSP with initial total or updates pre-existing JSP
			End if 
			ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "UpdateWorkflow")
			
			//********************************
			
			
			
		End if 
		
End case 

ERR_MethodTrackerReturn("TRIGGER [DIARY]"; $_t_oldMethodName)
