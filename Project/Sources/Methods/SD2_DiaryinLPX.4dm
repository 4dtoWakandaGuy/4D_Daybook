//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_DiaryinLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	C_BOOLEAN:C305($_bo_Available; $_bo_IgnoreOtherScrips; $_bo_UseFieldLevelMacros; $2)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>AutoProc; $_l_ActionRow; SD_l_SettingsTimeLen; SD2_l_Completed; vDY)
	C_POINTER:C301($_ptr_FocusObject; $1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>CallCode; <>DefPrior; <>LetAct; <>SYS_t_DefaultTelFormat; <>TimeAct; $_t_CallCodeOLD; $_t_DefaultTimeSTR; $_t_JobCodeOLD; $_t_oldMethodName; $_t_OrderCodeOLD; $_t_ProductCodeOLD)
	C_TEXT:C284($_t_StageCodeOLD; COM_t_TelephoneNumberFormat; DIA_t_actionName; dl_ResultT; DOC_t_ActionName; SD_t_DiaryPersonName; SD_t_JobName; SYS_t_AccessType; vCompName; vResult; vStage)
	C_TEXT:C284(vTel)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultTimeUnits; vdRequestedTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryinLPX")


//NG this method is based on Diary_InLPX with some mods for the new diary

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryInLPX")
//Diary_InLPX
If (Count parameters:C259>=2)
	$_bo_UseFieldLevelMacros:=$2
Else 
	$_bo_UseFieldLevelMacros:=False:C215
End if 
If (Count parameters:C259>=3)
	$_bo_IgnoreOtherScrips:=$2
Else 
	$_bo_IgnoreOtherScrips:=False:C215
End if 


//NG note that the diary can have multiple job codes etc
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

If (Count parameters:C259>=1)
	
	Case of 
		: ($1=(->[DIARY:12]Display_Date_To:52))
			//here we have to translate that back to the correct field
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				[DIARY:12]Date_Done_To:34:=[DIARY:12]Display_Date_To:52
				If ([DIARY:12]Date_Do_To:33=!00-00-00!)
					[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Done_To:34
				End if 
				$1:=->[DIARY:12]Date_Done_To:34  //so the correct macro gets run
			Else 
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Display_Date_To:52
				$1:=->[DIARY:12]Date_Do_To:33  //so the correct macro gets run
			End if 
			
		: ($1=(->[DIARY:12]Display_Date_From:51))
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				[DIARY:12]Date_Done_From:5:=[DIARY:12]Display_Date_From:51
				If ([DIARY:12]Date_Do_From:4=!00-00-00!)
					[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Done_From:5
				End if 
				$1:=->[DIARY:12]Date_Done_From:5  //so the correct macro gets run
			Else 
				[DIARY:12]Date_Do_From:4:=[DIARY:12]Display_Date_From:51
				$1:=->[DIARY:12]Date_Do_From:4  //so the correct macro gets run
			End if 
			
		: ($1=(->[DIARY:12]Display_Time_To:54))
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				[DIARY:12]Time_Done_To:36:=[DIARY:12]Display_Time_To:54
				If ([DIARY:12]Time_Do_To:35=?00:00:00?)
					[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Done_To:36
				End if 
				$1:=->[DIARY:12]Time_Done_To:36  //so the correct macro gets run
			Else 
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Display_Time_To:54
				$1:=->[DIARY:12]Time_Do_To:35  //so the correct macro gets run
			End if 
			
			
		: ($1=(->[DIARY:12]Display_Time_From:53))
			If ([DIARY:12]Done:14) | (SD2_l_Completed=1)
				[DIARY:12]Time_Done_From:7:=[DIARY:12]Display_Time_From:53
				If ([DIARY:12]Time_Do_From:6=?00:00:00?)
					[DIARY:12]Time_Do_From:6:=[DIARY:12]Time_Done_From:7
				End if 
				$1:=->[DIARY:12]Time_Done_From:7  //so the correct macro gets run
			Else 
				[DIARY:12]Time_Do_From:6:=[DIARY:12]Display_Time_From:53
				$1:=->[DIARY:12]Time_Do_From:6  //so the correct macro gets run
			End if 
			
		: ($1=(->[DIARY:12]Done:14))
			If ([DIARY:12]Done:14=False:C215)
				[DIARY:12]Time_Checked:28:=False:C215
			Else 
				If ([DIARY:12]Date_Done_From:5=!00-00-00!)
					[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
					[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
				End if 
				If ([DIARY:12]Result_Code:11="")
					[DIARY:12]Result_Code:11:="OK"
					RELATE ONE:C42([DIARY:12]Result_Code:11)  //`````````````````
					vResult:=[RESULTS:14]Result_Name:2
					dl_ResultT:=[RESULTS:14]Result_Name:2
				End if 
			End if 
		: ($1=(->[DIARY:12]Company_Code:1))
			Check_Company(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2; ->[DIARY:12])
			//DEFAULT TABLE([DIARY])
			vCompName:=[COMPANIES:2]Company_Name:2
			vTel:=[COMPANIES:2]Telephone:9
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
			End if 
			vDY:=1
			[DIARY:12]Status:30:=[COMPANIES:2]Status:12
			Check_ContDef(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
		: ($1=(->[DIARY:12]Contact_Code:2))
			Check_Contact(->[DIARY:12]Contact_Code:2; ->[DIARY:12]Company_Code:1; ->[DIARY:12])
			//DEFAULT TABLE([DIARY])
			
		: ($1=(->[DIARY:12]Date_Do_From:4))
			If (([DIARY:12]Date_Do_To:33<[DIARY:12]Date_Do_From:4) | (SYS_t_AccessType="Q"))
				[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
			End if 
			Diary_Title
			
			If (<>SD3_l_DiaryVersion>0)  //& ($Context#"Job")
				$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
			End if 
			
			If ([DIARY:12]Done:14=False:C215)
				[DIARY:12]Time_Checked:28:=False:C215
			End if 
		: ($1=(->[DIARY:12]Date_Do_To:33))
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
			If (<>SD3_l_DiaryVersion>0)  //& ($Context#"Job")
				$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
			End if 
		: ($1=(->[DIARY:12]Date_Done_From:5))
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
			If ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			End if 
			Diary_Title
		: ($1=(->[DIARY:12]Date_Done_To:34))
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
			If ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			End if 
			
		: ($1=(->[DIARY:12]Time_Do_From:6))
			If ([DIARY:12]Time_Do_From:6=?00:00:00?)
				$_t_DefaultTimeSTR:=String:C10(Current time:C178(*); HH MM AM PM:K7:5)
			Else 
				$_t_DefaultTimeSTR:=String:C10([DIARY:12]Time_Do_From:6; HH MM AM PM:K7:5)
			End if 
			vdRequestedTime:=Time:C179(Request:C163("Please enter the time to do from:"; $_t_DefaultTimeSTR))
			[DIARY:12]Time_Do_From:6:=vdRequestedTime
			
			If ((([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35) & ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33)) | (SYS_t_AccessType="Q"))
				If (<>SD3_l_DiaryVersion>0)  //& ($Context#"Job")  `using superdiary
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
			If (([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
				Diary_InDTimeDo
			End if 
			If ([DIARY:12]Done:14=False:C215)
				[DIARY:12]Time_Checked:28:=False:C215
			End if 
			If (<>SD3_l_DiaryVersion>0)  //& ($Context#"Job")
				$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
			End if 
		: ($1=(->[DIARY:12]Time_Do_To:35))
			If (([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35) & ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33))
				[DIARY:12]Time_Do_From:6:=[DIARY:12]Time_Do_To:35
			End if 
			If (([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
				Diary_InDTimeDo
			End if 
			If ([DIARY:12]Done:14=False:C215)
				[DIARY:12]Time_Checked:28:=False:C215
			End if 
			If (<>SD3_l_DiaryVersion>0)  //& ($Context#"Job")
				$_bo_Available:=SD_CheckAvailable(0; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource"; [DIARY:12]Diary_Code:3)
			End if 
		: ($1=(->[DIARY:12]Time_Done_From:7))
			If ((([DIARY:12]Time_Done_From:7>[DIARY:12]Time_Done_To:36) & ([DIARY:12]Date_Done_From:5=[DIARY:12]Date_Done_To:34)) | (SYS_t_AccessType="Q"))
				[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
			End if 
			If ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			End if 
		: ($1=(->[DIARY:12]Time_Done_To:36))
			If (([DIARY:12]Time_Done_From:7>[DIARY:12]Time_Done_To:36) & ([DIARY:12]Date_Done_From:5=[DIARY:12]Date_Done_To:34))
				[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Done_To:36
			End if 
			If ([DIARY:12]Action_Code:9=<>TimeAct)
				Diary_InDTime
			End if 
			
		: ($1=(->[DIARY:12]Priority:17))
		: ($1=(->[DIARY:12]Person:8))
			Check_MinorNC(->[DIARY:12]Person:8; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
			Check_JobPers
		: ($1=(->[DIARY:12]Originator:23))
			Check_MinorNC(->[DIARY:12]Originator:23; "Name"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
		: ($1=(->[DIARY:12]Product_Code:13))
			Check_Product(->[DIARY:12]Product_Code:13; "Product")
			//DEFAULT TABLE([DIARY])
			//SD_DIARYSELECTIONMANAGER
			
		: ($1=(->[DIARY:12]Job_Code:19))
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
		: ($1=(->[DIARY:12]Stage_Code:21))
			Check_MinorNC(->[DIARY:12]Stage_Code:21; ""; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2; "Stage")
			Diary_InDStage
		: ($1=(->[DIARY:12]Script_Code:29))
			Check_MinorNC(->[DIARY:12]Script_Code:29; ""; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Macro")
		: ($1=(->[DIARY:12]Action_Code:9))
			If ([DIARY:12]Action_Code:9#"EVENT") & ([DIARY:12]Action_Code:9#"TASK")
				Check_MinorNC(->[DIARY:12]Action_Code:9; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
				
				If ([DIARY:12]Action_Code:9#"")
					If (([ACTIONS:13]Priority:5#"") & ([DIARY:12]Priority:17=<>DefPrior))
						[DIARY:12]Priority:17:=[ACTIONS:13]Priority:5
					End if 
					If (([ACTIONS:13]Document_Code:4#"") & ([DIARY:12]Document_Code:15=""))
						[DIARY:12]Document_Code:15:=[ACTIONS:13]Document_Code:4
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
		: ($1=(->[DIARY:12]Action_Details:10))
			//````````
		: ($1=(->[DIARY:12]Result_Code:11))
			If ((DB_GetModuleSettingByNUM(Module_JobCosting)>1) & ([DIARY:12]Action_Code:9=<>TimeAct))
				Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Charge Type")
				If (([DIARY:12]Result_Code:11#"") & ([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Action_Code:9#""))
					dl_ResultT:=[RESULTS:14]Result_Name:2
					If ([RESULTS:14]Time_Result:3=False:C215)
						Gen_Alert("That is not a Time Recording 'Charge Type' Result"; "Cancel")
						[DIARY:12]Result_Code:11:=""
						vResult:=""
						
					End if 
				End if 
			Else 
				Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Result")
				dl_ResultT:=[RESULTS:14]Result_Name:2
			End if 
			If ([DIARY:12]Result_Code:11#"")
				If ([DIARY:12]Action_Code:9=<>TimeAct)  //If is Time Rec, do Time Stamping - otherwise others
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
				End if 
			End if 
			
		: ($1=(->[DIARY:12]Result_Description:12))
		: ($1=(->[DIARY:12]Document_Code:15))
			If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15) | (Length:C16([DIARY:12]Document_Code:15)=1)
				Check_Letter(->[DIARY:12]Document_Code:15; "Document")
			End if 
			
			If ([DIARY:12]Document_Code:15#"")
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
		: ($1=(->[DIARY:12]Document_Heading:32))
		: ($1=(->[DIARY:12]Charge_Rate:22))
			[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
			vTot:=1
		: ($1=(->[DIARY:12]Cost_Rate:74))  //added 30/03/07 -kmw
			[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
			vTot:=1  //added 30/03/07 -kmw
		: ($1=(->[DIARY:12]Units:20))
			vHours:=Time:C179(Time string:C180([DIARY:12]Units:20*<>SYS_ti_DefaultTimeUnits))
			[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
			[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
			vTot:=1
			
		: ($1=(->[DIARY:12]Order_Code:26))
			Check_MinorNC(->[DIARY:12]Order_Code:26; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order")
			If (([DIARY:12]Company_Code:1="") & ([DIARY:12]Order_Code:26#""))
				[DIARY:12]Company_Code:1:=[ORDERS:24]Company_Code:1
				[DIARY:12]Contact_Code:2:=[ORDERS:24]Contact_Code:2
				CompCont_Dets
			End if 
		: ($1=(->[DIARY:12]Call_Code:25))
			Check_MinorNC(->[DIARY:12]Call_Code:25; ""; ->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Company_Code:1; "Service Call")
			If (([DIARY:12]Company_Code:1="") & ([DIARY:12]Call_Code:25#""))
				[DIARY:12]Company_Code:1:=[SERVICE_CALLS:20]Company_Code:1
				[DIARY:12]Contact_Code:2:=[SERVICE_CALLS:20]Contact_Code:2
				CompCont_Dets
			End if 
		: ($1=(->[DIARY:12]Value:16))
			vTot:=1
		: ($1=(->[DIARY:12]Cost_Value:75))  //added 30/03/07 -kmw
			vTot:=1  //added 30/03/07 -kmw
		: ($1=(->[DIARY:12]Status:30))
			Check_MinorNC(->[DIARY:12]Status:30; ""; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "5")
	End case 
	If ($_bo_UseFieldLevelMacros)
		Macro_AccTypeSD2($1; [DIARY:12]Action_Code:9)
	Else 
		
		Macro_AccTypePt($1)
		
	End if 
	Diary_InLPM
End if 




//GOTO AREA($_ptr_FocusObject->)
ERR_MethodTrackerReturn("SD2_DiaryInLPX"; $_t_oldMethodName)
