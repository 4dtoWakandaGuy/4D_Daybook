//%attributes = {}
If (False:C215)
	//Project Method Name: Diary_InLPX
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 15:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	C_BOOLEAN:C305($_bo_Available; $_bo_NoScript; $_bo_useJobStageRates; vQueryWithinCurrentSelection)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>AutoProc; <>SD3_l_DiaryVersion; $_l_ActionRow; SD_l_DescriptionSplitter; SD_l_SettingsTimeLen; vDY)
	C_POINTER:C301($_ptr_ChangedField; $_ptr_FocusObject; $1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>CallCode; <>DefPrior; <>LetAct; <>SYS_t_DefaultTelFormat; <>TimeAct; $_t_CallCodeOLD; $_t_DefaultTime; $_t_JobCodeOLD; $_t_oldMethodName; $_t_OrderCodeOLD; $_t_ProductCodeOLD)
	C_TEXT:C284($_t_ResultCode; $_t_StageCodeOLD; $_t_TimeUnitsMacro; $_t_ViewContext; $2; COM_t_TelephoneNumberFormat; DIA_t_actionName; dl_ResultT; DOC_t_ActionName; SD_t_DiaryPersonName; SD_t_JobName)
	C_TEXT:C284(SD3_t_CompanyName; SD3_t_CompanyTelephone; SYS_t_AccessType; vCompName; vResult; vStage; vTel; WIN_t_CurrentInputForm)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultTimeUnits)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Diary_InLPX")
//Diary_InLPX

$_t_JobCodeOLD:=Old:C35([DIARY:12]Job_Code:19)
$_t_StageCodeOLD:=Old:C35([DIARY:12]Stage_Code:21)
$_t_OrderCodeOLD:=Old:C35([DIARY:12]Order_Code:26)
$_t_CallCodeOLD:=Old:C35([DIARY:12]Call_Code:25)
$_t_ProductCodeOLD:=Old:C35([DIARY:12]Product_Code:13)

$_ptr_FocusObject:=Focus object:C278
//NG April 2004
//Added parameter 2(string)
//this provided a context
//this was needed asa this code causes a problem when executing in relation to job time
$_ptr_ChangedField:=$1
If (Count parameters:C259>=2)
	$_t_ViewContext:=$2
Else 
	$_t_ViewContext:=""
End if 

Case of 
	: ($_ptr_ChangedField=(->[DIARY:12]Done:14))
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
		Else 
			If ([DIARY:12]Date_Done_From:5=!00-00-00!)
				[DIARY:12]Date_Done_From:5:=Current date:C33(*)
				[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
			End if 
			If ([DIARY:12]Result_Code:11="")
				//i think this should change to set the result
				$_t_ResultCode:=SD2_SetResultDialog([DIARY:12]Action_Code:9)
				If ($_t_ResultCode="")
					[DIARY:12]Result_Code:11:="OK"
				End if 
				RELATE ONE:C42([DIARY:12]Result_Code:11)  //`````````````````
				vResult:=[RESULTS:14]Result_Name:2
				dl_ResultT:=[RESULTS:14]Result_Name:2
			End if 
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Company_Code:1))
		Check_Company(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2; ->[DIARY:12])
		vCompName:=[COMPANIES:2]Company_Name:2
		SD3_t_CompanyName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
		SD3_t_CompanyTelephone:=[COMPANIES:2]Telephone:9
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
			OBJECT SET FORMAT:C236(*; "oCompanyTel"; COM_t_TelephoneNumberFormat)
			
		End if 
		vDY:=1
		[DIARY:12]Status:30:=[COMPANIES:2]Status:12
		Check_ContDef(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
	: ($_ptr_ChangedField=(->[DIARY:12]Contact_Code:2))
		Check_Contact(->[DIARY:12]Contact_Code:2; ->[DIARY:12]Company_Code:1; ->[DIARY:12])
		
		
	: ($_ptr_ChangedField=(->[DIARY:12]Date_Do_From:4))
		If (([DIARY:12]Date_Do_To:33<[DIARY:12]Date_Do_From:4) | (SYS_t_AccessType="Q"))
			[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
		End if 
		Diary_Title
		
		If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")
			$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
		End if 
		
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Date_Do_To:33))
		If ([DIARY:12]Date_Do_To:33<[DIARY:12]Date_Do_From:4)
			[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_To:33
			Diary_Title
		End if 
		If (([DIARY:12]Date_Done_From:5>!00-00-00!) & ([DIARY:12]Date_Do_From:4>[DIARY:12]Date_Done_From:5))
			[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Do_From:4
			[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
		End if 
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
		End if 
		If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")
			$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Date_Done_From:5))
		If ([DIARY:12]Date_Done_From:5>!00-00-00!)
			[DIARY:12]Done:14:=True:C214
			If ([DIARY:12]Result_Code:11="")
				[DIARY:12]Result_Code:11:="OK"
				RELATE ONE:C42([DIARY:12]Result_Code:11)
				vResult:=[RESULTS:14]Result_Name:2
			End if 
		End if 
		If (([DIARY:12]Date_Done_From:5>[DIARY:12]Date_Done_To:34) | (SYS_t_AccessType="Q"))
			[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: ([DIARY:12]Action_Code:9=<>TimeAct)
				
				Diary_InDTime
			: ($_bo_useJobStageRates)
				//if there is no job for this diary record then we create one and if it there is no job stage we create that
				//this means we always have a job for a diary item-but we can have multiple diary items for a job.
				//not this also means a follow on diary item must inherit the job.
				
		End case 
		Diary_Title
	: ($_ptr_ChangedField=(->[DIARY:12]Date_Done_To:34))
		If (([DIARY:12]Date_Done_From:5=!00-00-00!) | ([DIARY:12]Date_Done_From:5>[DIARY:12]Date_Done_To:34))
			[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Done_To:34
			Diary_Title
		End if 
		If ([DIARY:12]Date_Done_From:5>!00-00-00!)
			[DIARY:12]Done:14:=True:C214
			If ([DIARY:12]Result_Code:11="")
				[DIARY:12]Result_Code:11:="OK"
				RELATE ONE:C42([DIARY:12]Result_Code:11)
				vResult:=[RESULTS:14]Result_Name:2
			End if 
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			: ($_bo_useJobStageRates)
				//if there is no job for this diary record then we create one and if it there is no job stage we create that
				//this means we always have a job for a diary item-but we can have multiple diary items for a job.
				//not this also means a follow on diary item must inherit the job.
				
		End case 
		
		
	: ($_ptr_ChangedField=(->[DIARY:12]Time_Do_From:6))
		If ([DIARY:12]Time_Do_From:6=?00:00:00?)
			$_t_DefaultTime:=String:C10(Current time:C178(*); HH MM AM PM:K7:5)
		Else 
			$_t_DefaultTime:=String:C10([DIARY:12]Time_Do_From:6; HH MM AM PM:K7:5)
		End if 
		//vdRequestedTime:=Time(Request("Please enter the time to do from:";$_t_DefaultTime))
		//[DIARY]Time Do From:=vdRequestedTime
		
		If ((([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35) & ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33)) | (SYS_t_AccessType="Q"))
			If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")  //using superdiary
				If ([DIARY:12]Action_Code:9#"")  //action code filled
					$_l_ActionRow:=Find in array:C230(SD_at_ActionCodes; [DIARY:12]Action_Code:9)
					If ($_l_ActionRow>0)
						If (SD_al_ActionTime{$_l_ActionRow}>0)
							[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_al_ActionTime{$_l_ActionRow}*60)
						Else   //action has no special time
							[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
						End if 
						
					Else   //unkown action code
						[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
					End if 
					
				Else   //no action code-standard timeframe
					[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
				End if 
			Else 
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
			End if 
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: (([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
				Diary_InDTimeDo
			: ($_bo_useJobStageRates)
				//if there is no job for this diary record then we create one and if it there is no job stage we create that
				//this means we always have a job for a diary item-but we can have multiple diary items for a job.
				//not this also means a follow on diary item must inherit the job.
				
		End case 
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
		End if 
		If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")
			$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Time_Do_To:35))
		If (([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35) & ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33))
			[DIARY:12]Time_Do_From:6:=[DIARY:12]Time_Do_To:35
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: (([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
				Diary_InDTimeDo
			: ($_bo_useJobStageRates)
				//if there is no job for this diary record then we create one and if it there is no job stage we create that
				//this means we always have a job for a diary item-but we can have multiple diary items for a job.
				//not this also means a follow on diary item must inherit the job.
				
				
		End case 
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
		End if 
		If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")
			$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Time_Done_From:7))
		If ((([DIARY:12]Time_Done_From:7>[DIARY:12]Time_Done_To:36) & ([DIARY:12]Date_Done_From:5=[DIARY:12]Date_Done_To:34)) | (SYS_t_AccessType="Q"))
			[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			: ($_bo_useJobStageRates)
				//the time is gong to be recorded in the correponding job stage
		End case 
		
	: ($_ptr_ChangedField=(->[DIARY:12]Time_Done_To:36))
		If (([DIARY:12]Time_Done_From:7>[DIARY:12]Time_Done_To:36) & ([DIARY:12]Date_Done_From:5=[DIARY:12]Date_Done_To:34))
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Done_To:36
		End if 
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			: ($_bo_useJobStageRates)
				//the time is gong to be recorded in the correponding job stage
		End case 
		
		
	: ($_ptr_ChangedField=(->[DIARY:12]Priority:17))
		
	: ($_ptr_ChangedField=(->[DIARY:12]Person:8))
		Check_MinorNC(->[DIARY:12]Person:8; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
		Check_JobPers
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)  //added 30/10/07 -kmw
		[DIARY:12]PersonID:56:=[PERSONNEL:11]Personnel_ID:48  //added 30/10/07 -kmw
		
	: ($_ptr_ChangedField=(->[DIARY:12]Originator:23))
		Check_MinorNC(->[DIARY:12]Originator:23; "Name"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
	: ($_ptr_ChangedField=(->[DIARY:12]Product_Code:13))
		Check_Product(->[DIARY:12]Product_Code:13; "Product")
		//DEFAULT TABLE([DIARY])
		//SD_DIARYSELECTIONMANAGER
		
	: ($_ptr_ChangedField=(->[DIARY:12]Job_Code:19))
		Check_MinorNC(->[DIARY:12]Job_Code:19; "Job"; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2)
		If ([DIARY:12]Job_Code:19#"")
			JobsTC_JobCheck(->[DIARY:12]Job_Code:19)
			If ([DIARY:12]Job_Code:19#"")
				SD_t_JobName:=[JOBS:26]Job_Name:2
				If ([JOBS:26]Stage_Code:18#"")
					[DIARY:12]Stage_Code:21:=[JOBS:26]Stage_Code:18
					RELATE ONE:C42([DIARY:12]Stage_Code:21)
					vStage:=[STAGES:45]Stage_Name:2
				End if 
				If ([DIARY:12]Company_Code:1="")
					[DIARY:12]Company_Code:1:=[JOBS:26]Company_Code:3
					[DIARY:12]Contact_Code:2:=[JOBS:26]Contact_Code:4
					CompCont_Dets
				End if 
				Check_JobPers
			End if 
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Stage_Code:21))
		//we probably need a way though to add a job stage by stage code.
		//Check_MinorNC (->[DIARY]Stage Code;"";->[STAGES];->[STAGES]Stage Code;->[STAGES]Stage Name;"Stage")
		//Check_MinorNC (->[DIARY]Stage_Code;"Stage";->[STAGES];->[STAGES]Stage_Code;->[STAGES]Stage_Name;"Stage")  //altered 26/10/07 -kmw (so that stage description gets set in time entry screen).
		//so the diary STAGE code is changed now.. it is a Job stage code not a stage code//
		If ([DIARY:12]Job_Code:19#"")
			///this must only search for stages WITHIN the job..
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[DIARY:12]Job_Code:19)
			Check_MinorNC(->[DIARY:12]Stage_Code:21; "Stage"; ->[JOB_STAGES:47]; ->[JOB_STAGES:47]Job_Stage_code:52; ->[JOB_STAGES:47]Stage_Name:3; "Stage")  //altered 26/10/07 -kmw (so that stage description gets set in time entry screen).
		Else 
			//The job stage code should not be enterable till there is a job code.
			
		End if 
		
		Diary_InDStage
		
	: ($_ptr_ChangedField=(->[DIARY:12]Script_Code:29))
		Check_MinorNC(->[DIARY:12]Script_Code:29; ""; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Macro")
		
	: ($_ptr_ChangedField=(->[DIARY:12]Action_Code:9))
		If ([DIARY:12]Action_Code:9#"EVENT") & ([DIARY:12]Action_Code:9#"TASK")
			Check_MinorNC(->[DIARY:12]Action_Code:9; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
			
			If ([DIARY:12]Action_Code:9#"")
				If (([ACTIONS:13]Priority:5#"") & ([DIARY:12]Priority:17=<>DefPrior))
					[DIARY:12]Priority:17:=[ACTIONS:13]Priority:5
				End if 
				If (([ACTIONS:13]Document_Code:4#"") & ([DIARY:12]Document_Code:15=""))
					[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate([ACTIONS:13]Document_Code:4)
					
					RELATE ONE:C42([DIARY:12]Document_Code:15)
					[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
				End if 
				If (([ACTIONS:13]Default_Description:6#"") & ([DIARY:12]Action_Details:10=""))
					[DIARY:12]Action_Details:10:=[ACTIONS:13]Default_Description:6
				End if 
				If ([ACTIONS:13]ADD_toDiaryID:8>0)
					If ([ACTIONS:13]Exclude_fromAdder:9=False:C215)
						READ WRITE:C146([DIARY_ITEMOWNERS:106])
						CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
						[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
						[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=[ACTIONS:13]ADD_toDiaryID:8
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=2
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Person"
						DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
						UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
						READ ONLY:C145([DIARY_ITEMOWNERS:106])
						SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
					Else 
						//JUST CHANGE THE NAME
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[ACTIONS:13]ADD_toDiaryID:8)
						SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
						[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
					End if 
					
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
					UNLOAD RECORD:C212([ACTIONS:13])
				End if 
			End if 
		Else 
			DOC_t_ActionName:=[DIARY:12]Action_Code:9
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Action_Details:10))
		//````````
	: ($_ptr_ChangedField=(->[DIARY:12]Result_Code:11))
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
		
		Case of 
			: ((DB_GetModuleSettingByNUM(Module_JobCosting)>1) & ([DIARY:12]Action_Code:9=<>TimeAct))
				//i probably want to change this because...
				
				If ([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Action_Code:9#"")  //added -kmw, 29/10/07
					vQueryWithinCurrentSelection:=True:C214  //added -kmw, 29/10/07
					QUERY:C277([RESULTS:14]; [RESULTS:14]Time_Result:3=True:C214)  //added -kmw, 29/10/07
					Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Charge Type")  //added -kmw, 29/10/07
					vQueryWithinCurrentSelection:=False:C215  //added -kmw, 29/10/07
				Else   //added -kmw, 29/10/07
					Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Charge Type")
				End if   //added -kmw, 29/10/07
				
				If (([DIARY:12]Result_Code:11#"") & ([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Action_Code:9#""))
					dl_ResultT:=[RESULTS:14]Result_Name:2
					If ([RESULTS:14]Time_Result:3=False:C215)
						Gen_Alert("That is not a Time Recording 'Charge Type' Result"; "Cancel")
						[DIARY:12]Result_Code:11:=""
						vResult:=""
						
					End if 
				End if 
			: ((DB_GetModuleSettingByNUM(Module_JobCosting)>1) & ($_bo_useJobStageRates))
				//this records in the corresponding stage
				Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Result")
				dl_ResultT:=[RESULTS:14]Result_Name:2
			Else 
				Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Result")
				dl_ResultT:=[RESULTS:14]Result_Name:2
		End case 
		If ([DIARY:12]Result_Code:11#"")
			Case of 
				: ([DIARY:12]Action_Code:9=<>TimeAct)  //If is Time Rec, do Time Stamping - otherwise others
					If ([DIARY:12]Done:14=False:C215)
						If (([DIARY:12]Time_Do_From:6#?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?))
							[DIARY:12]Time_Do_To:35:=Current time:C178
							Diary_InDTimeDo
						End if 
					Else 
						If (([DIARY:12]Time_Done_From:7#?00:00:00?) & ([DIARY:12]Time_Done_To:36=?00:00:00?))
							[DIARY:12]Time_Done_To:36:=Current time:C178
							Diary_InDTime
						End if 
					End if 
					[DIARY:12]Done:14:=True:C214
				: ($_bo_useJobStageRates)
					If ([DIARY:12]Done:14=False:C215)
						If (([DIARY:12]Time_Do_From:6#?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?))
							[DIARY:12]Time_Do_To:35:=Current time:C178
							//Diary_InDTimeDo 
						End if 
					Else 
						If (([DIARY:12]Time_Done_From:7#?00:00:00?) & ([DIARY:12]Time_Done_To:36=?00:00:00?))
							[DIARY:12]Time_Done_To:36:=Current time:C178
							//Diary_InDTime 
						End if 
					End if 
					[DIARY:12]Done:14:=True:C214
					
				Else 
					[DIARY:12]Done:14:=True:C214
					If ([DIARY:12]Date_Done_From:5=!00-00-00!)
						[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
						[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
					End if 
					If ([DIARY:12]Time_Done_From:7=?00:00:00?)
						[DIARY:12]Time_Done_From:7:=Current time:C178
						[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
					End if 
					//Calls' Response Time
					If (([DIARY:12]Call_Code:25#"") & (<>CallCode#"") & (<>AutoProc>0))
						POST OUTSIDE CALL:C329(<>AutoProc)
						<>AutoProc:=0
					Else 
						READ WRITE:C146([SERVICE_CALLS:20])
						RELATE ONE:C42([DIARY:12]Call_Code:25)
						If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
							[SERVICE_CALLS:20]Response_Time:21:=((<>DB_d_CurrentDate-[DIARY:12]Date_Done_From:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+[DIARY:12]Time_Done_From:7
							DB_SaveRecord(->[SERVICE_CALLS:20])
						End if 
						READ ONLY:C145([SERVICE_CALLS:20])
						UNLOAD RECORD:C212([SERVICE_CALLS:20])
					End if 
			End case 
		End if 
		
	: ($_ptr_ChangedField=(->[DIARY:12]Result_Description:12))
	: ($_ptr_ChangedField=(->[DIARY:12]Document_Code:15))
		If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15) | (Length:C16([DIARY:12]Document_Code:15)=1)
			Check_Letter(->[DIARY:12]Document_Code:15; "Document")
		End if 
		
		
		If ([DIARY:12]Document_Code:15#"")
			[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate([DIARY:12]Document_Code:15)
			If (([DOCUMENTS:7]Heading:2#"Letter @") & ([DOCUMENTS:7]Heading:2#"Quote @"))
				[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
			End if 
			If ([DOCUMENTS:7]Document_Type:13="")  //load in the Document's Action Code if has it
				If ([DIARY:12]Action_Code:9="")
					[DIARY:12]Action_Code:9:=<>LetAct
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					DIA_t_actionName:=[ACTIONS:13]Action_Name:2
				End if 
			Else 
				[DIARY:12]Action_Code:9:=[DOCUMENTS:7]Document_Type:13
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				If ([ACTIONS:13]Action_Code:1="")
					[DIARY:12]Action_Code:9:=<>LetAct
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				End if 
				DIA_t_actionName:=[ACTIONS:13]Action_Name:2
			End if 
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Document_Heading:32))
	: ($_ptr_ChangedField=(->[DIARY:12]Charge_Rate:22))
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Time Units Macro Code"; ->$_t_TimeUnitsMacro)
		If ($_t_TimeUnitsMacro#"")
			$_bo_NoScript:=False:C215
			Macro($_t_TimeUnitsMacro)
		Else 
			$_bo_NoScript:=True:C214
		End if 
		If ($_bo_NoScript)
			SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
			If ($_bo_useJobStageRates)
				//this will get the CLIENT rate from the JS-note that we will be modifying the JS so it can use a personnel led rate or a Price table led rate or a default rate
				//if we are using job stage rates then the rate should not be enterable
			Else 
				[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
			End if 
		End if 
		vTot:=1
	: ($_ptr_ChangedField=(->[DIARY:12]Cost_Rate:74))  //added 30/03/07 -kmw
		//NG the cost rate surely should be also affected by the charge rate...Question is whether the cost rate might be set by the macro.
		
		[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
		vTot:=1  //added 30/03/07 -kmw
	: ($_ptr_ChangedField=(->[DIARY:12]Units:20))
		SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Time Units Macro Code"; ->$_t_TimeUnitsMacro)
		If ($_t_TimeUnitsMacro#"")
			$_bo_NoScript:=False:C215
			Macro($_t_TimeUnitsMacro)
		Else 
			$_bo_NoScript:=True:C214
		End if 
		If ($_bo_NoScript)
			SD2_GetAttributeValue(->[DIARY:12]Attributes:79; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
			If ($_bo_useJobStageRates)
				//you cannot change the rate on this (The Field should be non enterable) the rate comes from the JobStage 
				
			Else 
				//NG there is something wrong here here we set vHours (which is the number of units by the minutes of a unit?
				
				vHours:=Time:C179(Time string:C180([DIARY:12]Units:20*<>SYS_ti_DefaultTimeUnits))
				[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
				[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
			End if 
		End if 
		
		vTot:=1
		
	: ($_ptr_ChangedField=(->[DIARY:12]Order_Code:26))
		Check_MinorNC(->[DIARY:12]Order_Code:26; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order")
		If (([DIARY:12]Company_Code:1="") & ([DIARY:12]Order_Code:26#""))
			[DIARY:12]Company_Code:1:=[ORDERS:24]Company_Code:1
			[DIARY:12]Contact_Code:2:=[ORDERS:24]Contact_Code:2
			CompCont_Dets
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Call_Code:25))
		Check_MinorNC(->[DIARY:12]Call_Code:25; ""; ->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Company_Code:1; "Service Call")
		If (([DIARY:12]Company_Code:1="") & ([DIARY:12]Call_Code:25#""))
			[DIARY:12]Company_Code:1:=[SERVICE_CALLS:20]Company_Code:1
			[DIARY:12]Contact_Code:2:=[SERVICE_CALLS:20]Contact_Code:2
			CompCont_Dets
		End if 
	: ($_ptr_ChangedField=(->[DIARY:12]Value:16))
		vTot:=1
	: ($_ptr_ChangedField=(->[DIARY:12]Cost_Value:75))  //added 30/03/07 -kmw
		vTot:=1  //added 30/03/07 -kmw
	: ($_ptr_ChangedField=(->[DIARY:12]Status:30))
		Check_MinorNC(->[DIARY:12]Status:30; ""; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "5")
End case 
Macro_AccTypePt($_ptr_ChangedField)
Diary_InLPM
If (<>SD3_l_DiaryVersion>0) & ($_t_ViewContext#"Job")
	If (WIN_t_CurrentInputForm#"Diary_inT")
		If ($_t_JobCodeOLD#[DIARY:12]Job_Code:19) | ($_t_StageCodeOLD#[DIARY:12]Stage_Code:21) | ($_t_OrderCodeOLD#[DIARY:12]Order_Code:26) | ($_t_CallCodeOLD#[DIARY:12]Call_Code:25) | ($_t_ProductCodeOLD#[DIARY:12]Product_Code:13)
			SD_SetSourceButtons
			SD_SetSplitter(->SD_l_DescriptionSplitter)
		End if 
	End if 
	
End if 



//GOTO AREA($_ptr_FocusObject->)
ERR_MethodTrackerReturn("Diary_InLPX"; $_t_oldMethodName)
