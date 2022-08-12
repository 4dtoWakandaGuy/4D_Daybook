//%attributes = {}
If (False:C215)
	//Project Method Name:      SuperDiary_InLPX
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
	C_DATE:C307(<>DB_d_CurrentDate; SD_d_DiaryDateFrom)
	C_LONGINT:C283(<>AutoProc)
	C_POINTER:C301($_ptr_FocusObject; $_ptr_ScriptField; $1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>CallCode; <>DefPrior; <>LetAct; <>TimeAct; $_t_oldMethodName; $2; DIA_t_actionName; DL_ACTION; DL_ACTIONDESCRIP; DL_COMPINFO; DL_COMPINFOT)
	C_TEXT:C284(DL_COMPSTATUS; DL_CONTACTINFO; DL_CONTACTINFOT; DL_DOCUMENTT; DL_PERSON; DL_RESULT; DL_RESULTDESCRIP; DL_RESULTT; DOC_t_ActionName; SD_t_DiaryPersonName; SYS_t_AccessType)
	C_TEXT:C284(vResult; vStage)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse; <>SYS_ti_DefaultTimeUnits; dl_TimeFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary_InLPX")
//SuperDiary_InLPX


$_ptr_FocusObject:=Focus object:C278
// $1:= $_ptr_FocusObject= pointer to last object edited
// $2:= $_t_VariableName= name of last object edited
Case of 
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
				RELATE ONE:C42([DIARY:12]Result_Code:11)
				vResult:=[RESULTS:14]Result_Name:2
			End if 
		End if 
	: ($2="dl_CompInfo")
		Check_Company(->dl_CompInfo; ->dl_ContactInfo; ->[DIARY:12])
		//DEFAULT TABLE([DIARY])
		DL_CompInfo:=[COMPANIES:2]Company_Code:1
		DL_CompInfoT:=[COMPANIES:2]Company_Name:2
		DL_CompStatus:=[COMPANIES:2]Status:12
		Check_ContDef(->dl_CompInfo; ->dl_ContactInfo)
		$_ptr_ScriptField:=->[DIARY:12]Company_Code:1
	: ($2="dl_ContactInfo")
		Check_Contact(->dl_ContactInfo; ->dl_CompInfo; ->[DIARY:12]; "SuperDiary")
		//DEFAULT TABLE([DIARY])
		DL_CompInfo:=[COMPANIES:2]Company_Code:1
		DL_CompInfoT:=[COMPANIES:2]Company_Name:2
		DL_ContactInfo:=[CONTACTS:1]Contact_Code:2
		DL_ContactInfoT:=[CONTACTS:1]Contact_Name:31
		DL_CompStatus:=[COMPANIES:2]Status:12
		$_ptr_ScriptField:=->[DIARY:12]Contact_Code:2
	: ($1=(->[DIARY:12]Date_Do_From:4))
		If (([DIARY:12]Date_Do_To:33<[DIARY:12]Date_Do_From:4) | (SYS_t_AccessType="Q"))
			[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
		End if 
		Diary_Title
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
		If ((([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35) & ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33)) | (SYS_t_AccessType="Q"))
			[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
		End if 
		If (([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Date_Done_From:5=!00-00-00!))
			Diary_InDTimeDo
		End if 
		If ([DIARY:12]Done:14=False:C215)
			[DIARY:12]Time_Checked:28:=False:C215
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
	: ($1=(->[DIARY:12]Job_Code:19))
		Check_MinorNC(->[DIARY:12]Job_Code:19; "Job"; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2)
		If ([DIARY:12]Job_Code:19#"")
			JobsTC_JobCheck(->[DIARY:12]Job_Code:19)
			If ([DIARY:12]Job_Code:19#"")
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
		End if 
	: ($1=(->[DIARY:12]Action_Details:10))
	: ($1=(->[DIARY:12]Result_Code:11))
		If ((DB_GetModuleSettingByNUM(Module_JobCosting)>1) & ([DIARY:12]Action_Code:9=<>TimeAct))
			Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Charge Type")
			If (([DIARY:12]Result_Code:11#"") & ([DIARY:12]Action_Code:9=<>TimeAct) & ([DIARY:12]Action_Code:9#""))
				If ([RESULTS:14]Time_Result:3=False:C215)
					Gen_Alert("That is not a Time Recording 'Charge Type' Result"; "Cancel")
					[DIARY:12]Result_Code:11:=""
					vResult:=""
				End if 
			End if 
		Else 
			Check_MinorNC(->[DIARY:12]Result_Code:11; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2; "Result")
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
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329(<>AutoProc)
					End if 
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
		If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
			Check_Letter(->[DIARY:12]Document_Code:15; "Document")
		End if 
		
		If ([DIARY:12]Document_Code:15#"")
			If (([DOCUMENTS:7]Heading:2#"Letter @") & ([DOCUMENTS:7]Heading:2#"Quote @"))
				[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
			End if 
			If ([DOCUMENTS:7]Document_Type:13="")  //load in the Document's Action Code if has it
				If ([DIARY:12]Action_Code:9="")
					[DIARY:12]Action_Code:9:=<>LetAct
					RELATE ONE:C42([DIARY:12]Action_Code:9)
					DIA_t_actionName:=[ACTIONS:13]Action_Name:2
				End if 
			Else 
				[DIARY:12]Action_Code:9:=[DOCUMENTS:7]Document_Type:13
				RELATE ONE:C42([DIARY:12]Action_Code:9)
				If ([ACTIONS:13]Action_Code:1="")
					[DIARY:12]Action_Code:9:=<>LetAct
					RELATE ONE:C42([DIARY:12]Action_Code:9)
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
CREATE RECORD:C68([DIARY:12])
//write the variable to the fields
[DIARY:12]Company_Code:1:=dl_CompInfo
[DIARY:12]Contact_Code:2:=dl_ContactInfo
[DIARY:12]Date_Do_From:4:=SD_d_DiaryDateFrom
[DIARY:12]Time_Do_From:6:=dl_TimeFrom

[DIARY:12]Person:8:=dl_Person
[DIARY:12]Action_Code:9:=dl_Action
[DIARY:12]Action_Details:10:=dl_ActionDescrip
[DIARY:12]Result_Code:11:=dl_Result
[DIARY:12]Result_Description:12:=dl_ResultDescrip

Macro_AccTypePt($_ptr_ScriptField)
//now write the fields to the variables and
//unload the diary record

Diary_InLPM



//GOTO AREA($_ptr_FocusObject->)
ERR_MethodTrackerReturn("SuperDiary_InLPX"; $_t_oldMethodName)
