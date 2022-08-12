//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Personnel InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsINC;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Per_bo_EmailCOPY; <>SYS_bo_PWActive; $_bo_GroupSet; DB_bo_NoLoad; DB_bo_RecordModified; PI_ActivatMessage; SD_bo_ChangePrefs; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; <>USERMODPREF; $_l_AsciiChar; $_l_ButtonPressed; $_l_Clash; $_l_Event; $_l_GroupBInary; $_l_Index; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime)
	C_LONGINT:C283(CB_OpenNewWindow; DB_l_ButtonClickedFunction; iCancel; iOK; SD_l_SaturdayWork; SD_l_SundayWork; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable)
	C_TEXT:C284(<>DefCopytoaddress; <>DefSignature; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>Per_at_PersonnelNames_EmailFrom; <>Per_at_PersonnelNames_EmailSign; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>USERMODID)
	C_TEXT:C284($_t_CompanyOfficeCode; $_t_DiaryProcessName; $_t_Initials; $_t_Name; $_t_OfficeCode; $_t_oldMethodName; SD3_t_DiaryRelatedRecordCode; vButtDisPersonnel; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel InLP")


$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		If ([PERSONNEL:11]Personnel_ID:48=0)
			[PERSONNEL:11]Personnel_ID:48:=AA_GetNextIDinMethod(->[PERSONNEL:11]Personnel_ID:48)
		End if 
		
		CAT_LoadCats([PERSONNEL:11]Personnel_ID:48)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodes)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
		
		SD_bo_ChangePrefs:=False:C215
		//I REALLY wanted this bit in a trigger
		//but it causes the groups records to unloadduring startupso
		//`
		If ([PERSONNEL:11]PER_SMTPHOST:41="")
			If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
			End if 
			If ([PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5#"")
				[PERSONNEL:11]PER_SMTPHOST:41:=[PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5
			Else 
				[PERSONNEL:11]PER_SMTPHOST:41:=<>EMAIL_t_DefaultSMTPhost
			End if 
		End if 
		If ([PERSONNEL:11]Email_Address:36="")
			If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
			End if 
			If ([PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6#"")
				[PERSONNEL:11]Email_Address:36:=[PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6
			Else 
				[PERSONNEL:11]Email_Address:36:=<>EMAIL_t_DefaultReplyToAddress
			End if 
		End if 
		If ([PERSONNEL:11]PER_CopyToAddress:42="")
			If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
			End if 
			If ([PERSONNEL_GROUPS:92]X_DEF_GRP_copytoAdress:7#"")
				[PERSONNEL:11]PER_CopyToAddress:42:=[PERSONNEL_GROUPS:92]X_DEF_GRP_copytoAdress:7
				[PERSONNEL:11]PER_CopytoOption:43:=[PERSONNEL_GROUPS:92]X_Def_CopytoOption:8
			Else 
				[PERSONNEL:11]PER_CopyToAddress:42:=<>DefCopytoaddress
			End if 
		End if 
		If ([PERSONNEL:11]Per_DefaultSignature:44="")
			If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
			End if 
			If ([PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9#"")
				[PERSONNEL:11]Per_DefaultSignature:44:=[PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9
			Else 
				[PERSONNEL:11]Per_DefaultSignature:44:=<>DefSignature
			End if 
		End if 
		
		
		
		
		
		
		
		//`````
		ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; 6)
		
		<>USERMODID:=""
		<>USERMODPREF:=0
		GET PROCESS VARIABLE:C371(-1; <>SYS_bo_PWActive; <>SYS_bo_PWActive)
		
		ARRAY TEXT:C222(<>PW_at_4DUserGroups; 0)
		ARRAY LONGINT:C221(<>PW_al_4DGroupIDs; 0)
		ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; 0)
		//PW_CHECKUSERS
		PW_CHECKGROUPS
		
		ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; Size of array:C274(<>PW_at_4DUserGroups))
		// [PERSONNEL]UserGroupIDs:=0
		
		For ($_l_Index; 1; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
			$_l_GroupBInary:=<>PW_al_4DUserGroupsBinaries{$_l_Index}
			//find out if that binary is set
			$_bo_GroupSet:=([PERSONNEL:11]UserGroupIDs:39 ?? $_l_GroupBInary)
			If ($_bo_GroupSet)
				<>PW_al_4DUserGroupsINC{$_l_Index}:=1
			Else 
				<>PW_al_4DUserGroupsINC{$_l_Index}:=0
			End if 
		End for 
		$_l_AsciiChar:=Character code:C91("•")
		
		//change this for cross platform
		
		INT_SetLongintCheckFormat(-><>PW_al_4DUserGroupsINC)
		
		Personnel_InLPB
		
		Personnel_FuncP
		If (Not:C34(<>SYS_bo_PWActive))
			OBJECT SET VISIBLE:C603([PERSONNEL:11]UserGroupIDs:39; False:C215)
			OBJECT SET VISIBLE:C603(<>PW_at_4DUserGroups; False:C215)
			OBJECT SET VISIBLE:C603(<>PW_al_4DUserGroupsINC; False:C215)
		Else 
			ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
		End if 
		
		//DISABLE BUTTON(BD7)
		If (<>SD3_l_DiaryVersion=1)
			OBJECT SET TITLE:C194(*; "Field5"; "This is a resource")
			OBJECT SET VISIBLE:C603(CB_OpenNewWindow; True:C214)
			If ([PERSONNEL:11]SD_openNewWindow:49=0)
				[PERSONNEL:11]SD_openNewWindow:49:=1
			End if 
			CB_OpenNewWindow:=[PERSONNEL:11]SD_openNewWindow:49-1
			
		Else 
			OBJECT SET VISIBLE:C603(CB_OpenNewWindow; False:C215)
		End if 
		
		
		
		If (<>SD3_l_DiaryVersion=1)
			SD_LoadPrefs([PERSONNEL:11]Personnel_ID:48; [PERSONNEL:11]Group_Code:28; True:C214)
			SD_l_SaturdayWork:=Num:C11(SD_bo_SaturdayWork)
			SD_l_SundayWork:=Num:C11(SD_bo_SundayWork)
		End if 
		In_ButtChkDis(->vButtDisPersonnel)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPersonnel)
		
		If (PI_ActivatMessage=True:C214)
			PI_ActivatMessage:=False:C215
			If (Current user:C182#"Designer")
				//   Gen_Alert ("You must save and exit this record before continuing!")
			End if 
			
		End if 
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		If (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
			If ([PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
				<>PER_t_CurrentEmailFrom:=[PERSONNEL:11]Email_Address:36
				<>Per_t_PersonnelNames_EmailSMTP:=[PERSONNEL:11]PER_SMTPHOST:41
				<>Per_t_PersonnelNames_EmailTo:=[PERSONNEL:11]PER_CopyToAddress:42
				<>Per_at_PersonnelNames_EmailFrom:=[PERSONNEL:11]Email_Address:36
				<>Per_at_PersonnelNames_EmailSign:=[PERSONNEL:11]Per_DefaultSignature:44
				<>Per_bo_EmailCOPY:=[PERSONNEL:11]PER_CopytoOption:43
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					LOGIN_SetEmail
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				
			End if 
			Cat_SavePersonPrefs
			If (SD_bo_ChangePrefs)
				
				//update the prefs
				If ([PERSONNEL:11]Personnel_ID:48=0)
					[PERSONNEL:11]Personnel_ID:48:=AA_GetNextIDinMethod(->[PERSONNEL:11]Personnel_ID:48)
				End if 
				SD_bo_SaturdayWork:=(SD_l_SaturdayWork=1)
				SD_bo_SundayWork:=(SD_l_SundayWork=1)
				SD_SavePrefs([PERSONNEL:11]Personnel_ID:48)
				If (<>SD3_l_DiaryVersion=1)
					$_t_DiaryProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_DiaryProcessName)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_DiaryProcessName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessNumber>0)
						
						
						SD3_l_CallActionNum:=17
						PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_DiaryProcessName; $_l_ProcessState; $_l_ProcessTime)
						If ($_l_ProcessState>=0)
							SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
							POST OUTSIDE CALL:C329($_l_ProcessNumber)
						End if 
						SD3_l_CallActionNum:=0
					End if 
				End if 
				
			End if 
		End if 
		
		In_ButtCall("Personnel_InLPA"; ""; "Minor_DelSin"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; "Personnel"; "1"; "Personnel_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPersonnel)
		<>USERMODID:=[PERSONNEL:11]Initials:1
		<>USERMODPREF:=[PERSONNEL:11]Functionality:33
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		Case of 
			: (Modified:C32([PERSONNEL:11]Initials:1))
				RemoveLeadTr(Uppercase:C13([PERSONNEL:11]Initials:1); ->[PERSONNEL:11]Initials:1)
				SET QUERY DESTINATION:C396(3; $_l_Clash)
				$_t_Initials:=[PERSONNEL:11]Initials:1
				[PERSONNEL:11]Initials:1:=""
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Initials)
				If ($_l_Clash>0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Initials; *)
					QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
					If ($_l_Clash>0)
						CONFIRM:C162("There is a deleted user with those initials, un-delete?"; "No"; "Undelete")
						If (OK=0)
							SET QUERY DESTINATION:C396(0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Initials; *)
							QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
							LAST RECORD:C200([PERSONNEL:11])
							[PERSONNEL:11]PersonDeleted:38:=0
						Else 
							SET QUERY DESTINATION:C396(0)
						End if 
					Else 
						//the user is not delete
						CONFIRM:C162("There is an active user with those initials, view?"; "No"; "View")
						If (Ok=0)
							SET QUERY DESTINATION:C396(0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Initials)
						Else 
							SET QUERY DESTINATION:C396(0)
						End if 
					End if 
				Else 
					//no clash
					SET QUERY DESTINATION:C396(0)
					[PERSONNEL:11]Initials:1:=$_t_Initials
				End if 
				
				If ([PERSONNEL:11]Initials:1#"")
					
					
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PERSONNEL:11]Initials:1)
				End if 
			: (Modified:C32([PERSONNEL:11]Name:2))
				If ([PERSONNEL:11]Name:2="Administrator") | ([PERSONNEL:11]Name:2="Designer")
					//  ALERT("There is already a user with that name")
					Gen_Alert("There is already a user with that name")
					[PERSONNEL:11]Name:2:=Old:C35([PERSONNEL:11]Name:2)
				Else 
					
					
					[PERSONNEL:11]Name:2:=Uppers2([PERSONNEL:11]Name:2)
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					$_t_Name:=[PERSONNEL:11]Name:2
					[PERSONNEL:11]Name:2:=""
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Name)
					If ($_l_Clash>0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_Name; *)
						QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
						If ($_l_Clash>0)
							CONFIRM:C162("There is a deleted user with that name, un-delete?"; "No"; "Undelete")
							If (OK=0)
								SET QUERY DESTINATION:C396(0)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_Name; *)
								QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
								LAST RECORD:C200([PERSONNEL:11])
								[PERSONNEL:11]PersonDeleted:38:=0
							Else 
								SET QUERY DESTINATION:C396(0)
							End if 
						Else 
							//the user is not delete
							CONFIRM:C162("There is an active user with that name, view?"; "No"; "View")
							If (Ok=0)
								SET QUERY DESTINATION:C396(0)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_Name)
							Else 
								SET QUERY DESTINATION:C396(0)
							End if 
						End if 
					Else 
						//no clash
						SET QUERY DESTINATION:C396(0)
						[PERSONNEL:11]Name:2:=$_t_Name
					End if 
					If ([PERSONNEL:11]Name:2#"")
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[PERSONNEL:11]Name:2)
					End if 
				End if 
				
			: (Modified:C32([PERSONNEL:11]Job_Title:35))
				[PERSONNEL:11]Job_Title:35:=Uppers2([PERSONNEL:11]Job_Title:35)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Job_Title:35)
			: (Modified:C32([PERSONNEL:11]Supervisor:4))
				[PERSONNEL:11]Supervisor:4:=Uppercase:C13([PERSONNEL:11]Supervisor:4)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Supervisor:4)
			: (Modified:C32([PERSONNEL:11]Category_Code:6))
				Check_MinorNC(->[PERSONNEL:11]Category_Code:6; ""; ->[TIME_BILLING_CATEGORIES:46]; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Name:2; "Category")
				[PERSONNEL:11]Sales_Rate:5:=[TIME_BILLING_CATEGORIES:46]Sales_Rate:3
				[PERSONNEL:11]Cost_Rate:30:=[TIME_BILLING_CATEGORIES:46]Cost_Rate:4
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Category_Code:6)
			: (Modified:C32([PERSONNEL:11]Reusable:3))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Reusable:3)
			: (Modified:C32([PERSONNEL:11]Sales_Rate:5))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Sales_Rate:5)
			: (Modified:C32([PERSONNEL:11]Cost_Rate:30))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Cost_Rate:30)
			: (Modified:C32([PERSONNEL:11]Active:7))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Active:7)
			: (Modified:C32([PERSONNEL:11]Adhoc_Budget:8))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Adhoc_Budget:8)
			: (Modified:C32([PERSONNEL:11]Last_Export:10))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Last_Export:10)
			: (Modified:C32([PERSONNEL:11]Export_Path:11))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Export_Path:11)
			: (Modified:C32([PERSONNEL:11]Last_Import:12))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Last_Import:12)
			: (Modified:C32([PERSONNEL:11]Person_Identity:13))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Person_Identity:13)
			: (Modified:C32([PERSONNEL:11]Import_Set_Path:14))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Import_Set_Path:14)
			: (Modified:C32([PERSONNEL:11]Startup_List:15))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Startup_List:15)
			: (Modified:C32([PERSONNEL:11]Startup_Diary:16))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Startup_Diary:16)
			: (Modified:C32([PERSONNEL:11]Office_Code:17))
				[PERSONNEL:11]Office_Code:17:=Uppercase:C13([PERSONNEL:11]Office_Code:17)
				If ([PERSONNEL:11]Office_Code:17#"")
					$_t_Initials:=[PERSONNEL:11]Initials:1
					$_t_OfficeCode:=[PERSONNEL:11]Office_Code:17
					$_t_CompanyOfficeCode:=DB_GetOrganisationOfficeCode
					$_t_CompanyOfficeCode:=Substring:C12($_t_CompanyOfficeCode; 1; Length:C16($_t_CompanyOfficeCode)-1)
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					CUT NAMED SELECTION:C334([PERSONNEL:11]; "Personnel")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Office_Code:17=$_t_OfficeCode; *)
					QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Initials:1#$_t_Initials)
					If ((Records in selection:C76([PERSONNEL:11])>0) | ($_t_OfficeCode=$_t_CompanyOfficeCode))
						USE NAMED SELECTION:C332("Personnel")
						Gen_Alert("That Office Code is already in use"; "Try again")
						[PERSONNEL:11]Office_Code:17:=""
						DB_SaveRecord(->[PERSONNEL:11])
						AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
						REJECT:C38([PERSONNEL:11]Office_Code:17)
					Else 
						USE NAMED SELECTION:C332("Personnel")
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Office_Code:17)
			: (Modified:C32([PERSONNEL:11]Analysis_Code:20))
				If ([PERSONNEL:11]Analysis_Code:20="ASK")
					[PERSONNEL:11]Analysis_Code:20:=Uppercase:C13([PERSONNEL:11]Analysis_Code:20)
				Else 
					Check_MinorNC(->[PERSONNEL:11]Analysis_Code:20; "Analysis"; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2)
				End if 
				If ([PERSONNEL:11]Analysis_Code:20="")
					[PERSONNEL:11]Analysis_Override:24:=False:C215
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Code:20)
			: (Modified:C32([PERSONNEL:11]Analysis_Override:24))
				DB_bo_RecordModified:=True:C214
				If ([PERSONNEL:11]Analysis_Code:20="")
					[PERSONNEL:11]Analysis_Override:24:=False:C215
				End if 
				If ([PERSONNEL:11]Analysis_Override:24=False:C215)
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Override:24)
			: (Modified:C32([PERSONNEL:11]Analysis_Only:25))
				DB_bo_RecordModified:=True:C214
				If ([PERSONNEL:11]Analysis_Override:24=False:C215)
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Only:25)
			: (Modified:C32([PERSONNEL:11]Group_Code:28))
				Check_MinorNC(->[PERSONNEL:11]Group_Code:28; "Group"; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Name:2; "Personnel Group")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Group_Code:28)
			: (Modified:C32([PERSONNEL:11]Email_Address:36))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Email_Address:36)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		If ([PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			PI_ActivatMessage:=True:C214
			SHOW PROCESS:C325(Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		
		
		//  PAUSE PROCESS(vProc)
	: ($_l_Event=On Validate:K2:3)
		<>USERMODID:=[PERSONNEL:11]Initials:1
		<>USERMODPREF:=[PERSONNEL:11]Functionality:33
		
		
End case 
ERR_MethodTrackerReturn("Personnel InLP"; $_t_oldMethodName)
