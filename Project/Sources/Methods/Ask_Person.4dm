//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_Person
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 17:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataOwnerIDS;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>DB_at_CurrencyName;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	//ARRAY TEXT(<>Per_at_PersonnelNames_EmailFrom;0)
	//ARRAY TEXT(<>Per_at_PersonnelNames_EmailSign;0)
	//ARRAY TEXT(<>SCPT_at_ScriptCode;0)
	//ARRAY TEXT(<>SCPT_at_ScriptText;0)
	//ARRAY TEXT(DM_at_DataOwnerNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>PER_bo_AnalysisOnly; <>PER_bo_CurrentGroupRestrictStat; <>PER_bo_CurrentNoButtGrey; <>PER_bo_CurrentNoButtHIDE; <>Per_bo_EmailCOPY; <>PER_bo_GroupToDo; <>PER_bo_LbDefinitiionsInited; <>PER_bo_ProdUpdateAccess; <>PER_bo_ScrnSaveId; <>PER_bo_SystemSettingAccess; <>PersAnOver)
	C_BOOLEAN:C305(<>SYS_bo_LoqateAddressing; <>SYS_bo_PWActive; <>SYS_bo_ScriptonSave; $_bo_FieldLoadRun; $_bo_OK; $_bo_ScriptProcess; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_allowDecode; <>PER_l_CurLoggedinDataOwnerID; <>PER_l_CurrentPersFunc; <>PER_l_CurrentUserID; <>PER_l_CurrentUserSepDiaryWindow; <>PER_l_CurrentUserWorkGroupIDs; <>PER_l_ProcessWaiting; <>SCPT_l_CheckVersion; <>SD3_l_DiaryMessageProcess; <>SD3_l_DiaryVersion; <>SMS_Activate)
	C_LONGINT:C283($_l_ArraySize; $_l_ClientServerMessageCount; $_l_DataOwnerPrefID; $_l_Index; $_l_LoadFormSettings; $_l_LoadFormSizes; $_l_MessageProcess; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_StartModulePosition)
	C_LONGINT:C283($_l_Update; $_l_WindowReferenceRow; $_l_WindowRefPosition; $DB_l_Offset; DM_l_DataOwnerID; i; ST_l_StartupMacros; WIN_l_CurrentWinRef)
	C_PICTURE:C286(<>DB_Pic_CoLogo)
	C_TEXT:C284(<>DB_t_DefaultUser; <>DB_t_Password; <>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>PER_t_UserGroup; <>SYS_t_MessageAction; $_t_oldMethodName)
	C_TEXT:C284($_t_PersonellName; $_t_ProcesslName; $_t_ReplyText; DB_t_CurrentFormUsage; DM_t_Org)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_Person")
//4.2 Ask_Person

Case of 
	: (Application type:C494=4D Server:K5:6)
		<>PER_t_CurrentUserName:="Server"
		<>PER_t_CurrentUserInitials:="~SV"
		<>PER_l_CurrentUserWorkGroupIDs:=0
		<>PER_l_CurrentUserSepDiaryWindow:=0
		<>PER_l_CurrentUserID:=0
		<>PER_bo_CurrentGroupRestrictStat:=False:C215
		<>PER_l_allowDecode:=0
		Load_Fields
		If (False:C215)
			$_l_LoadFormSizes:=New process:C317("Load_Fields"; DB_ProcessMemoryinit(2); "Load_FieldsServer")  //sth to do while Asking Person
			$_l_Retries:=0
			Repeat 
				
				PROCESS PROPERTIES:C336($_l_LoadFormSizes; $_t_ProcesslName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End if 
			Until ($_l_ProcessState<0) | ($_t_ProcesslName#"Load_FieldsServer")
		End if 
		States_Load
	Else 
		
		READ ONLY:C145
		READ ONLY:C145([PERSONNEL_GROUPS:92])
		$_bo_FieldLoadRun:=False:C215
		Case of 
				
			: (<>SYS_bo_PWActive)
				Load_Fields
				If (False:C215)
					$_l_LoadFormSizes:=New process:C317("Load_Fields"; DB_ProcessMemoryinit(2); "Load_FieldsServer")  //sth to do while Asking Person
				End if 
				$_bo_FieldLoadRun:=False:C215
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=Current user:C182)
				If (Records in selection:C76([PERSONNEL:11])=1)
					$_bo_OK:=False:C215
					<>PER_t_CurrentUserName:=Current user:C182
					<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
					<>PER_l_CurrentUserWorkGroupIDs:=[PERSONNEL:11]UserGroupIDs:39
					<>PER_l_CurrentUserSepDiaryWindow:=[PERSONNEL:11]SD_openNewWindow:49
					<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
					<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
					<>PER_l_CurLoggedinDataOwnerID:=[PERSONNEL:11]DataOwnerID:54
					If (<>PER_l_CurrentUserID=0)
						READ WRITE:C146([PERSONNEL:11])
						ALL RECORDS:C47([PERSONNEL:11])
						If (Not:C34(In transaction:C397))
							DB_lockFile(->[PERSONNEL:11])
							APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48:=[PERSONNEL:11]Personnel_ID:48)
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
						Else 
							
							FIRST RECORD:C50([PERSONNEL:11])
							For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
								[PERSONNEL:11]Personnel_ID:48:=[PERSONNEL:11]Personnel_ID:48
								DB_SaveRecord(->[PERSONNEL:11])
								AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
								NEXT RECORD:C51([PERSONNEL:11])
							End for 
						End if 
						
						UNLOAD RECORD:C212([PERSONNEL:11])
						READ ONLY:C145([PERSONNEL:11])
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
						<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
						<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
						<>PER_l_CurLoggedinDataOwnerID:=[PERSONNEL:11]DataOwnerID:54
					End if 
					
				Else 
					$_bo_OK:=True:C214
				End if 
			Else 
				$_bo_OK:=True:C214
		End case 
		If ($_bo_OK)
			If (<>DB_t_DefaultUser#"")
				<>PER_t_CurrentUserInitials:=<>DB_t_DefaultUser
				<>PER_l_CurrentUserSepDiaryWindow:=1
				<>PER_l_CurrentUserID:=-1
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
				<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
				<>PER_l_CurLoggedinDataOwnerID:=[PERSONNEL:11]DataOwnerID:54
			Else 
				If ($_bo_FieldLoadRun=False:C215)
					Load_Fields
				End if 
				//The question here is how with multiple data sets would be bring up the correct groups..
				//`there is nobody logged in and we are on a client
				//`So here you have to show a different log in screen if there are multiple data sets.
				$_l_DataOwnerPrefID:=PREF_GetPreferenceID("Data Owners"; True:C214; -1)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_DataOwnerPrefID)  //There will be one record per data owner
				If (Records in selection:C76([PREFERENCES:116])=0)
					//if there are no records we will create one
					
					
					ALL RECORDS:C47([USER:15])
					ARRAY LONGINT:C221(DM_al_DataOwnerIDS; 0)
					ARRAY TEXT:C222(DM_at_DataOwnerNames; 0)
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_DataOwnerPrefID
					[PREFERENCES:116]Preference_DataID:7:=-1
					DM_t_Org:=[USER:15]Organisation:1
					If ([USER:15]XdataOwnerID:251>0)
						DM_l_DataOwnerID:=[USER:15]XdataOwnerID:251
					Else 
						DM_l_DataOwnerID:=AA_GetNextID(->DM_l_DataOwnerID)
					End if 
					APPEND TO ARRAY:C911(DM_al_DataOwnerIDS; DM_l_DataOwnerID)
					APPEND TO ARRAY:C911(DM_at_DataOwnerNames; DM_t_Org)
					VARIABLE TO BLOB:C532(DM_al_DataOwnerIDS; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532(DM_at_DataOwnerNames; [PREFERENCES:116]DataBlob:2; *)
					DB_SaveRecord(->[PREFERENCES:116])
				Else 
					$DB_l_Offset:=0
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DataOwnerIDS; $DB_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_DataOwnerNames; $DB_l_Offset)
				End if 
				If (Size of array:C274(DM_al_DataOwnerIDS)<2)
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1#"")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Startup_List:15=True:C214; *)
					QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
					If (Records in selection:C76([PERSONNEL:11])=0)
						If (Records in selection:C76([PERSONNEL_GROUPS:92])=0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")  //find all Persoonnel
						End if 
						DB_t_CurrentFormUsage:="NSL"  //None in Startup list
					Else 
						DB_t_CurrentFormUsage:=""
					End if 
				Else 
					REDUCE SELECTION:C351([PERSONNEL:11]; 0)
					DB_t_CurrentFormUsage:="EnterUser"
				End if 
				<>PER_t_CurrentUserInitials:=""
			End if 
			
		End if 
		<>DB_t_Password:=""
		
		
		If (Not:C34((<>DB_t_DefaultUser#"") & (<>PER_t_CurrentUserInitials=<>DB_t_DefaultUser) & ([PERSONNEL:11]Person_Identity:13="")))
			If (DB_t_CurrentFormUsage="EnterUser")
				Open_Any_Window(185; 360)
				DIALOG:C40("Ask_Person_2")
				ON EVENT CALL:C190("")
				CLOSE WINDOW:C154
				
			Else 
				CREATE SET:C116([PERSONNEL:11]; "$People")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=Current user:C182)
				
				If (Records in selection:C76([PERSONNEL:11])=0)
					
					If ((Records in selection:C76([PERSONNEL_GROUPS:92])=0) | (<>DB_t_DefaultUser#""))
						USE SET:C118("$People")
						CLEAR SET:C117("$People")
						Array_LCx(Records in selection:C76([PERSONNEL:11]))
						SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; GEN_at_RecordCode; [PERSONNEL:11]Name:2; GEN_at_Name; [PERSONNEL:11]Person_Identity:13; GEN_at_Identity)
						SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; GEN_at_Identity; >)
					Else 
						USE SET:C118("$People")
						CLEAR SET:C117("$People")
						Array_LCx(Records in selection:C76([PERSONNEL_GROUPS:92]))
						SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Code:1; GEN_at_RecordCode; [PERSONNEL_GROUPS:92]Group_Name:2; GEN_at_Name)
						If (DB_t_CurrentFormUsage="NSL")
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28="")  //find out if a No Group need be added
						Else 
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=""; *)
							QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
							QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
							
						End if 
						If (Records in selection:C76([PERSONNEL:11])=0)
							$_l_ArraySize:=Size of array:C274(GEN_at_RecordCode)
						Else 
							$_l_ArraySize:=Size of array:C274(GEN_at_RecordCode)+1
							INSERT IN ARRAY:C227(GEN_at_RecordCode; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(GEN_at_Name; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(GEN_at_Identity; $_l_ArraySize; 1)
							GEN_at_RecordCode{$_l_ArraySize}:="ZZ99"
							GEN_at_Name{$_l_ArraySize}:="No Group"
						End if 
						For ($_l_Index; 1; $_l_ArraySize)
							GEN_at_Identity{$_l_Index}:="^G"
						End for 
						SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; GEN_at_Identity; >)
					End if 
					If (<>PER_t_CurrentUserInitials="") & (Size of array:C274(GEN_at_RecordCode)>0)
						<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{1}
					End if 
					
					Open_Any_Window(270; 360)
					DIALOG:C40([PERSONNEL:11]; "Ask_Person")
					
					ON EVENT CALL:C190("")
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					
					
					If (OK=0)
						
						FLUSH CACHE:C297
						QUIT 4D:C291
					Else 
						
					End if 
					
					Array_LCx(0)
				Else 
					CLEAR SET:C117("$People")
					
					<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
					SPLASH_SET_AUTO_UPDATE
				End if 
				
			End if 
		End if 
		<>PER_t_CurrentUserName:=[PERSONNEL:11]Name:2
		<>PER_l_CurrentUserSepDiaryWindow:=[PERSONNEL:11]SD_openNewWindow:49
		<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
		<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
		<>PER_l_CurLoggedinDataOwnerID:=[PERSONNEL:11]DataOwnerID:54
		If (<>PER_l_CurrentUserID=0)
			READ WRITE:C146([PERSONNEL:11])
			ALL RECORDS:C47([PERSONNEL:11])
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[PERSONNEL:11])
				APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48:=[PERSONNEL:11]Personnel_ID:48)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
			Else 
				FIRST RECORD:C50([PERSONNEL:11])
				For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
					[PERSONNEL:11]Personnel_ID:48:=[PERSONNEL:11]Personnel_ID:48
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					NEXT RECORD:C51([PERSONNEL:11])
				End for 
			End if 
			
			UNLOAD RECORD:C212([PERSONNEL:11])
			READ ONLY:C145([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=Current user:C182)
			<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
		End if 
		
		
		If ([PERSONNEL:11]Functionality:33=0)
			Ask_PersonFunctions
		End if 
		//<>PER_l_CurrentPersFunc:=[PERSONNEL]Functionality<april22
		//If (<>PER_l_CurrentPersFunc=0)  //a further check due to peculiar probs with no saving the above<april22
		If ((DB_GetModuleSettingByNUM(1))=5)
			//<>PER_l_CurrentPersFunc:=<>PER_l_CurrentPersFunc ?+ 5<april22
		Else 
			//<>PER_l_CurrentPersFunc:=<>PER_l_CurrentPersFunc ?+ 6<april22
		End if 
		//End if 
		
		//<>PER_bo_CurrentNoButtGrey:=0  //Not((<>PER_l_CurrentPersFunctions ?? 5))<april22
		<>PER_bo_CurrentNoButtHIDE:=False:C215  //Not((<>PER_l_CurrentPersFunc ?? 8))<april22
		<>PER_bo_CurrentNoButtHIDE:=True:C214
		//If (<>PER_l_CurrentPersFunc ?? 1)//<april22  //here cos startup macros would create a waiting process otherwise
		//<>PER_l_ProcessWaiting:=0<april22
		//End if <april22
		
		<>PER_bo_SystemSettingAccess:=[PERSONNEL:11]DM_Additions:21
		<>PER_bo_ProdUpdateAccess:=[PERSONNEL:11]Product_Updates:22
		<>Per_t_CurrentDefaultAnalCode:=[PERSONNEL:11]Analysis_Code:20
		<>PER_bo_ScrnSaveId:=[PERSONNEL:11]ScrnSave_Id:32
		<>PER_bo_GroupToDo:=(([PERSONNEL:11]Group_ToDo:34) & (DB_GetModuleSettingByNUM(1)#5))
		<>PER_bo_LbDefinitiionsInited:=True:C214
		
		<>PER_t_CurrentEmailFrom:=[PERSONNEL:11]Email_Address:36
		<>Per_t_PersonnelNames_EmailSMTP:=[PERSONNEL:11]PER_SMTPHOST:41
		<>Per_t_PersonnelNames_EmailTo:=[PERSONNEL:11]PER_CopyToAddress:42
		<>Per_at_PersonnelNames_EmailFrom:=[PERSONNEL:11]Email_Address:36
		<>Per_at_PersonnelNames_EmailSign:=[PERSONNEL:11]Per_DefaultSignature:44
		<>Per_bo_EmailCOPY:=[PERSONNEL:11]PER_CopytoOption:43
		If ((DB_GetModuleSettingByNUM(Module_Macros))>0)
			<>SYS_bo_ScriptonSave:=[PERSONNEL:11]Macro_Accept:27
		Else 
			<>SYS_bo_ScriptonSave:=False:C215
		End if 
		//TRACE
		If (<>SYS_bo_ScriptonSave)  //load in the special Macros
			READ ONLY:C145([SCRIPTS:80])
			//TRACE
			<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck  //Updated to 4 so will run the updates
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Checked:12<<>SCPT_l_CheckVersion)
			If (Records in selection:C76([SCRIPTS:80])>0)
				READ WRITE:C146([SCRIPTS:80])
				LOAD RECORD:C52([SCRIPTS:80])
				DB_lockFile(->[SCRIPTS:80])
				APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8:=[SCRIPTS:80]Table_Number:8)
				APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]ParsedStamp:24:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
				//if the macros needed updating then so might list layouts
				DB_UpdateLIstLayoutFormulas
				
			End if 
			UNLOAD RECORD:C212([SCRIPTS:80])
			READ ONLY:C145([SCRIPTS:80])
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Accept @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Load @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Enter @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="View @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="During @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Modified @"; *)
			QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Background")
			//see also IME_MacroMem & Macros_InLPA
			$_l_ArraySize:=Records in selection:C76([SCRIPTS:80])
			ARRAY TEXT:C222(<>SCPT_at_ScriptCode; $_l_ArraySize)
			ARRAY TEXT:C222(<>SCPT_at_ScriptText; $_l_ArraySize)
			If ($_l_ArraySize>0)
				
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; <>SCPT_at_ScriptCode; [SCRIPTS:80]Recording_Text:4; <>SCPT_at_ScriptText)
				For ($_l_Update; 1; Size of array:C274(<>SCPT_at_ScriptCode))  //NG May 2004
					$_t_ReplyText:=Macro_PlatformTranslate(-><>SCPT_at_ScriptText{$_l_Update})
				End for   //
				
				UNLOAD RECORD:C212([SCRIPTS:80])
			End if 
		Else 
			ARRAY TEXT:C222(<>SCPT_at_ScriptCode; 0)
			ARRAY TEXT:C222(<>SCPT_at_ScriptText; 0)
		End if 
		
		If (<>Per_t_CurrentDefaultAnalCode="ASK")
			ALL RECORDS:C47([ANALYSES:36])
			If (Records in table:C83([ANALYSES:36])>1)
				Open_Any_Window(270; 360)
				SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; GEN_at_RecordCode; [ANALYSES:36]Analysis_Name:2; GEN_at_Name)
				SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; >)
				<>Per_t_CurrentDefaultAnalCode:=GEN_at_RecordCode{1}
				DIALOG:C40([ANALYSES:36]; "dAsk_Analysis")
				CLOSE WINDOW:C154
				If (OK=0)
					QUIT 4D:C291
				End if 
			Else 
				<>Per_t_CurrentDefaultAnalCode:=[ANALYSES:36]Analysis_Code:1
			End if 
		End if 
		If (<>Per_t_CurrentDefaultAnalCode#"")
			<>PersAnOver:=[PERSONNEL:11]Analysis_Override:24
			If (<>PersAnOver)
				<>PER_bo_AnalysisOnly:=[PERSONNEL:11]Analysis_Only:25
			Else 
				<>PER_bo_AnalysisOnly:=False:C215
			End if 
		Else 
			<>PersAnOver:=False:C215
			<>PER_bo_AnalysisOnly:=False:C215
		End if 
		If (<>SD3_l_DiaryMessageProcess#0)
			$_l_MessageProcess:=<>SD3_l_DiaryMessageProcess
			<>SD3_l_DiaryMessageProcess:=0
			RESUME PROCESS:C320($_l_MessageProcess)
			
			DelayTicks(60)
			
		End if 
		$_bo_ScriptProcess:=[PERSONNEL:11]Macro_Process:23
		If ([PERSONNEL:11]Start_Module:29="")
			$_l_StartModulePosition:=0
		Else 
			$_l_StartModulePosition:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL:11]Start_Module:29)
		End if 
		If (<>PER_t_UserGroup="")
			<>PER_bo_CurrentGroupRestrictStat:=False:C215
		Else 
			QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
			If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
				QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1="LOGO"+<>PER_t_UserGroup)
				If (Records in selection:C76([PICTURES:85])=1)
					<>DB_Pic_CoLogo:=[PICTURES:85]Picture:3
				End if 
				UNLOAD RECORD:C212([PICTURES:85])
				<>PER_bo_CurrentGroupRestrictStat:=[PERSONNEL_GROUPS:92]Restrict_States:3
			Else 
				<>PER_bo_CurrentGroupRestrictStat:=False:C215
			End if 
		End if 
		While (Semaphore:C143("InitEmail"))
			DelayTicks(2)
		End while 
		LOGIN_SetEmail
		CLEAR SEMAPHORE:C144("InitEmail")
		
		SPLASH_UPDATE("Loading Modules ...")
		Check_Modules($_l_StartModulePosition)
		States_Load
		$_l_Retries:=0
		While (Semaphore:C143("$Inserting"+"◊aCurrency"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
			READ ONLY:C145([CURRENCIES:71])
			ALL RECORDS:C47([CURRENCIES:71])
			SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; <>DB_at_CurrencyName)
			INSERT IN ARRAY:C227(<>DB_at_CurrencyName; 1; 1)
			UNLOAD RECORD:C212([CURRENCIES:71])
		Else 
			ARRAY TEXT:C222(<>DB_at_CurrencyName; 1)
		End if 
		<>DB_at_CurrencyName{1}:="BASE"
		<>DB_at_CurrencyName:=1
		CLEAR SEMAPHORE:C144("$Inserting"+"◊aCurrency")
		ARRAY TEXT:C222(<>Per_at_PersonnelNames; 0)  //Used in SuperWrite WP - is all visible personnel
		If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)  //remove this if use it other than in WP
			
			ALL RECORDS:C47([PERSONNEL:11])
			SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; <>Per_at_PersonnelNames)
			UNLOAD RECORD:C212([PERSONNEL:11])
			
			
			SORT ARRAY:C229(<>Per_at_PersonnelNames; >)
			INSERT IN ARRAY:C227(<>Per_at_PersonnelNames; 1; 1)
			<>Per_at_PersonnelNames{1}:="*ALL"
			<>Per_at_PersonnelNames:=Find in array:C230(<>Per_at_PersonnelNames; <>PER_t_CurrentUserInitials)
		End if 
		
		//Load Input Layout Background Pictures
		//probably a waste memory !!
		If (False:C215)  //NG FEB 2004 NOT USING THESE PICS ANYWAY
			//Get Picture FROM LIBRARY(20100;◊PictInBlue)
			//GetPicture (20401;◊PictOutBlue)
			//◊PictOutBlue:=◊PictOutBlue-3
			
			//Get Picture FROM LIBRARY(20110;◊PictInOran)
			//Get Picture FROM LIBRARY(20120;◊PictInRed)
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)>1) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>1))
				//Get Picture FROM LIBRARY(20130;◊PictInCyan)
			End if 
			//Get Picture FROM LIBRARY(20140;◊PictInGreen)
			If ((DB_GetModuleSettingByNUM(Module_DataManager))>1)
				//Get Picture FROM LIBRARY(20150;◊PictInGold)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)
				//Get Picture FROM LIBRARY(20160;◊PictInPurp)
			End if 
		End if 
		
		//Brown of Documents not done - cos too few
		//Deep Red of Purchases likewise
		
		If ((DB_GetModuleSettingByNUM(32))>1)
			//Tel_Startup
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_DiaryManager)>1) & ($_bo_ScriptProcess) & ((<>SYS_t_MessageAction#"") | (DB_GetModuleSettingByNUM(Module_Macros)>1)))
			<>SD3_l_DiaryMessageProcess:=0
			//◊RecCheckUp:=New process("Diary_RecCheck";◊K;"Diary Check")
		Else 
			
		End if 
		SPLASH_UPDATE("Loading Macros ...")
		
		If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
			If (Gen_Option=False:C215)
				
				ST_l_StartupMacros:=New process:C317("Record_Startup"; DB_ProcessMemoryinit(2); "Startup Macros")
				If (ST_l_StartupMacros>0)
					Process_StartAr(ST_l_StartupMacros; "Startup Macros")
				End if 
			End if 
		End if 
		
		If (<>SYS_bo_LoqateAddressing)
			If ((DB_GetModuleSettingByNUM(35))<2)
				<>SYS_bo_LoqateAddressing:=False:C215
				If (Is Windows:C1573)
					PLUGCALL_QuickAddress("init"; 0)
				End if 
			End if 
		End if 
		SPLASH_UPDATE("Loading Form Settings ...")
		$_l_LoadFormSettings:=New process:C317("FSettings_loadPreferences"; DB_ProcessMemoryinit(1); "LoadFormSettings"; <>PER_t_CurrentUserInitials)
		
		If (<>PER_l_CurrentPersFunc<6)
			<>PER_l_CurrentPersFunc:=6
		End if 
		
		If (<>PER_l_CurrentUserID>0)
			READ WRITE:C146([CLIENT_SERVERMESSAGES:123])
			QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
			If (Records in selection:C76([CLIENT_SERVERMESSAGES:123])=0)
				READ WRITE:C146([CLIENT_SERVERMESSAGES:123])
				If ([PERSONNEL:11]Personnel_ID:48#<>PER_l_CurrentUserID)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
				End if 
				$_t_PersonellName:=[PERSONNEL:11]Name:2
				CREATE RECORD:C68([CLIENT_SERVERMESSAGES:123])
				[CLIENT_SERVERMESSAGES:123]USER_ID:1:=<>PER_l_CurrentUserID
				[CLIENT_SERVERMESSAGES:123]USER_NAME:2:=$_t_PersonellName
				[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3:=Current system user:C484
				DB_SaveRecord(->[CLIENT_SERVERMESSAGES:123])
				UNLOAD RECORD:C212([CLIENT_SERVERMESSAGES:123])
				READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
				QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
				QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
			Else 
				If (Records in selection:C76([CLIENT_SERVERMESSAGES:123])>1)
					QUERY SELECTION:C341([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
					Case of 
						: (Records in selection:C76([CLIENT_SERVERMESSAGES:123])>1)
							$_l_ClientServerMessageCount:=Records in selection:C76([CLIENT_SERVERMESSAGES:123])-1
							REDUCE SELECTION:C351([CLIENT_SERVERMESSAGES:123]; $_l_ClientServerMessageCount)
							DELETE SELECTION:C66([CLIENT_SERVERMESSAGES:123])
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
							QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
						: (Records in selection:C76([CLIENT_SERVERMESSAGES:123])=0)
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
							
							$_l_ClientServerMessageCount:=Records in selection:C76([CLIENT_SERVERMESSAGES:123])-1
							REDUCE SELECTION:C351([CLIENT_SERVERMESSAGES:123]; $_l_ClientServerMessageCount)
							DELETE SELECTION:C66([CLIENT_SERVERMESSAGES:123])
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
							
					End case 
				End if 
				
				If (Check_Locked(->[CLIENT_SERVERMESSAGES:123]; 0))
					[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3:=Current system user:C484
					DB_SaveRecord(->[CLIENT_SERVERMESSAGES:123])
					UNLOAD RECORD:C212([CLIENT_SERVERMESSAGES:123])
					READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
					QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
					QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
				Else 
					If ([PERSONNEL:11]Personnel_ID:48#<>PER_l_CurrentUserID)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
					End if 
					$_t_PersonellName:=[PERSONNEL:11]Name:2
					CREATE RECORD:C68([CLIENT_SERVERMESSAGES:123])
					[CLIENT_SERVERMESSAGES:123]USER_ID:1:=<>PER_l_CurrentUserID
					[CLIENT_SERVERMESSAGES:123]USER_NAME:2:=$_t_PersonellName
					[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3:=Current system user:C484
					
					DB_SaveRecord(->[CLIENT_SERVERMESSAGES:123])
					UNLOAD RECORD:C212([CLIENT_SERVERMESSAGES:123])
					READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
					QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
					QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
					
				End if 
				
			End if 
			
		End if 
		
End case 
//BEEP
If (<>PER_l_CurrentUserID>0)
	$_l_LoadFormSizes:=New process:C317("INT_LoadFormSizes"; DB_ProcessMemoryinit(1); "LoadFormSIzes"; <>PER_l_CurrentUserID)
End if 

//BEEP
ERR_MethodTrackerReturn("Ask_Person"; $_t_oldMethodName)
