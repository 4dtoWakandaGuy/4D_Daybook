//%attributes = {}
If (False:C215)
	//Project Method Name:      START_LoginUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 21:02`Method: START_LoginUser
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>SCPT_at_ScriptCode;0)
	//ARRAY TEXT(<>SCPT_at_ScriptText;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>CCM_bo_Inited; <>DB_bo_CurrenciesInited; <>DB_bo_ModuleSettingsinited; <>DB_bo_ScriptsInited; <>DB_bo_TableNamestatesLoaded; <>Email_bo_PersonInited; <>PER_bo_AnalysisOnly; <>PER_bo_CurrentGroupRestrictStat; <>PER_bo_CurrentNoButtGrey; <>PER_bo_CurrentNoButtHIDE; <>PER_bo_CurrentScriptonSave)
	C_BOOLEAN:C305(<>PER_bo_GroupToDo; <>PER_bo_LbDefinitiionsInited; <>PER_bo_ProdUpdateAccess; <>PER_bo_ScrnSaveId; <>PER_bo_SystemSettingAccess; <>PersAnOver; <>StatesLoaded; <>Stats_bo_Arraysinited; <>STK_bo_TypesInited; <>SYS_bo_PWActive; <>SYS_bo_ScriptonSave)
	C_BOOLEAN:C305($_bo_FieldLoad; $_bo_OK; $_bo_Script; DB_bo_ModuleSettingsinited; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>Login_l_HomeTable; <>PER_l_AccessLevel; <>PER_l_allowDecode; <>PER_l_CurLoggedinDataOwnerID; <>PER_l_CurrentUserID; <>PER_l_CurrentUserSepDiaryWindow; <>PER_l_CurrentUserWorkGroupIDs; <>PER_l_ProcessWaiting; <>RecBarUp; <>SCPT_l_CheckVersion; <>SCPT_l_RecordEdit)
	C_LONGINT:C283(<>SD3_l_DiaryMessageProcess; <>SD3_l_DiaryVersion; <>SMS_Activate; $_l_CountRecords; $_l_Index; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_ScriptsModule; $_l_ScriptsModuleRow; $_l_SIzeofArray)
	C_LONGINT:C283($_l_StartModuleRow; $_l_WindowReferenceRow; DB_l_currentuserID; i; SD2_l_DiaryStartups; ST_l_StartupMacros; WIN_l_CurrentWinRef)
	C_PICTURE:C286(<>DB_Pic_CoLogo)
	C_TEXT:C284(<>DB_t_DefaultUser; <>DB_t_Password; <>LOGIN_s255_FirstModuleName; <>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; <>PER_t_UserGroup; $_t_oldMethodName; $_t_ProcessName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; DB_t_CurrentUser)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_LoginUser")
//4.2 Ask Person

<>DB_bo_TableNamestatesLoaded:=False:C215
<>StatesLoaded:=False:C215
<>Email_bo_PersonInited:=False:C215
<>CCM_bo_Inited:=False:C215
<>STK_bo_TypesInited:=False:C215
<>Stats_bo_Arraysinited:=False:C215
<>DB_bo_CurrenciesInited:=False:C215
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
			$_l_Process:=New process:C317("Load_Fields"; 256000; "Load_FieldsServer")  //sth to do while Asking Person
			Repeat 
				
				PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)
					DelayTicks(30)
				End if 
			Until ($_l_ProcessState<0) | ($_t_ProcessName#"Load_FieldsServer")
		End if 
		States_Load
	Else 
		
		//DEFAULT TABLE([PERSONNEL])
		READ ONLY:C145([PERSONNEL:11])
		READ ONLY:C145([PERSONNEL_GROUPS:92])
		$_bo_FieldLoad:=False:C215
		Case of 
				
			: (<>SYS_bo_PWActive)
				
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
					SD2_l_DiaryStartups:=[PERSONNEL:11]Startup_Diary:16
					If (<>PER_l_CurrentUserID=0)
						READ WRITE:C146([PERSONNEL:11])
						
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=0)
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
						$_bo_OK:=Not:C34([PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)  //is set to false as long as we found the user now
						<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
						<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
						
					End if 
				Else 
					$_bo_OK:=True:C214
				End if 
			: (DB_l_currentuserID>0)
				
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=DB_l_currentuserID)
				If (Records in selection:C76([PERSONNEL:11])=1)
					//ALERT("ONE USER="+[PERSONNEL]Initials)
					
					$_bo_OK:=False:C215
					<>PER_t_CurrentUserName:=[PERSONNEL:11]Name:2
					<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
					<>PER_l_CurrentUserWorkGroupIDs:=[PERSONNEL:11]UserGroupIDs:39
					<>PER_l_CurrentUserSepDiaryWindow:=[PERSONNEL:11]SD_openNewWindow:49
					<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
					<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
					SD2_l_DiaryStartups:=[PERSONNEL:11]Startup_Diary:16
				Else 
					ALERT:C41("NO USER")
					
					$_bo_OK:=True:C214
				End if 
			Else 
				$_bo_OK:=True:C214
		End case 
		If ($_bo_OK)  //need to login?- no user selected
			If (<>DB_t_DefaultUser#"")
				<>PER_t_CurrentUserInitials:=<>DB_t_DefaultUser
				<>PER_l_CurrentUserSepDiaryWindow:=1
				<>PER_l_CurrentUserID:=-1
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
				<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
			Else 
				If ((DB_GetModuleSettingByNUM(1))=5)
					REDUCE SELECTION:C351([PERSONNEL_GROUPS:92]; 0)
				Else 
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1#"")
				End if 
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
				<>PER_t_CurrentUserInitials:=""
			End if 
			
		End if 
		<>DB_t_Password:=""
		i:=1
		
		If (Not:C34((<>DB_t_DefaultUser#"") & (<>PER_t_CurrentUserInitials=<>DB_t_DefaultUser) & ([PERSONNEL:11]Person_Identity:13="")))
			CREATE SET:C116([PERSONNEL:11]; "$People")
			If (DB_l_currentuserID>0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=DB_l_currentuserID)
			Else 
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=Current user:C182)
			End if 
			DB_l_currentuserID:=0
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
						$_l_SIzeofArray:=Size of array:C274(GEN_at_RecordCode)
					Else 
						$_l_SIzeofArray:=Size of array:C274(GEN_at_RecordCode)+1
						INSERT IN ARRAY:C227(GEN_at_RecordCode; $_l_SIzeofArray; 1)
						INSERT IN ARRAY:C227(GEN_at_Name; $_l_SIzeofArray; 1)
						INSERT IN ARRAY:C227(GEN_at_Identity; $_l_SIzeofArray; 1)
						GEN_at_RecordCode{$_l_SIzeofArray}:="ZZ99"
						GEN_at_Name{$_l_SIzeofArray}:="No Group"
					End if 
					For ($_l_Index; 1; $_l_SIzeofArray)
						GEN_at_Identity{$_l_Index}:="^G"
					End for 
					SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; GEN_at_Identity; >)
				End if 
				If (<>PER_t_CurrentUserInitials="") & (Size of array:C274(GEN_at_RecordCode)>0)
					<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{1}
				End if 
				Open_Any_Window(270; 360)
				DIALOG:C40([PERSONNEL:11]; "Ask_Person")
				<>DB_bo_ModuleSettingsinited:=False:C215
				//TRACE
				ON EVENT CALL:C190("")
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
				SPLASH_SHOW
				SPLASH_SET_AUTO_UPDATE
				If (OK=0)
					SPLASH_END_GRACEFULLY("Quiting ..."; False:C215)
					FLUSH CACHE:C297
					QUIT 4D:C291
				Else 
					SPLASH_UPDATE("Loading User Access ...")
				End if 
				
				Array_LCx(0)
			Else 
				CLEAR SET:C117("$People")
				
				<>PER_t_CurrentUserInitials:=[PERSONNEL:11]Initials:1
				SPLASH_SET_AUTO_UPDATE
			End if 
			<>DB_bo_ModuleSettingsinited:=False:C215
		End if 
		
		<>PER_t_CurrentUserName:=[PERSONNEL:11]Name:2
		<>PER_l_CurrentUserSepDiaryWindow:=[PERSONNEL:11]SD_openNewWindow:49
		<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
		<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
		If (<>PER_l_CurrentUserID=0)
			READ WRITE:C146([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=0)
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
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
			<>PER_l_CurrentUserID:=[PERSONNEL:11]Personnel_ID:48
		End if 
		
		
		
		If ([PERSONNEL:11]Functionality:33=0)
			Ask_PersonFunctions
		End if 
		//<>PER_l_CurrentPersFunctions:=[PERSONNEL]Functionality//APRIL22
		//If   // (<>PER_l_CurrentPersFunctions=0) //APRIL22 //a further check due to peculiar probs with no saving the above
		
		//<>PER_l_CurrentPersFunctions:=<>PER_l_CurrentPersFunctions ?+ 6//APRIL22
		
		//End if 
		
		//<>PER_bo_CurrentNoButtGrey:=//APRIL 22Not((<>PER_l_CurrentPersFunctions ?? 5))
		//<>PER_bo_CurrentNoButtHIDE:=//APRIL 22Not((<>PER_l_CurrentPersFunctions ?? 8))
		<>PER_bo_CurrentNoButtHIDE:=True:C214
		//I//f (<>PER_l_CurrentPersFunctions ?? 1) APRIL22  //here cos startup macros would create a waiting process otherwise
		//<>PER_l_ProcessWaiting:=0 APRIL22
		//End if APRIL22
		//Gen_Alert ("personnel"+[PERSONNEL]Name)
		<>PER_bo_SystemSettingAccess:=[PERSONNEL:11]DM_Additions:21
		<>PER_bo_ProdUpdateAccess:=[PERSONNEL:11]Product_Updates:22
		<>Per_t_CurrentDefaultAnalCode:=[PERSONNEL:11]Analysis_Code:20
		<>PER_bo_ScrnSaveId:=[PERSONNEL:11]ScrnSave_Id:32
		<>PER_bo_GroupToDo:=(([PERSONNEL:11]Group_ToDo:34))
		<>PER_bo_LbDefinitiionsInited:=True:C214
		<>PER_t_UserGroup:=[PERSONNEL:11]Group_Code:28
		<>PER_bo_CurrentScriptonSave:=[PERSONNEL:11]Macro_Accept:27
		SD2_l_DiaryStartups:=[PERSONNEL:11]Startup_Diary:16
		$_l_ScriptsModule:=Module_Macros
		$_l_ScriptsModuleRow:=Find in array:C230(<>Mod_at_ModuleName; "macros")
		If (Not:C34(DB_bo_ModuleSettingsinited))
			Check_Modules
			DB_bo_ModuleSettingsinited:=True:C214
		End if 
		If (DB_aI_aMod{$_l_ScriptsModule}>0)
			<>SYS_bo_ScriptonSave:=[PERSONNEL:11]Macro_Accept:27
		Else 
			<>SYS_bo_ScriptonSave:=False:C215
		End if 
		If (<>SYS_bo_ScriptonSave)
			READ ONLY:C145([SCRIPTS:80])
			
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
			
		End if 
		
		While (Semaphore:C143("$InitingMacros"))
			DelayTicks
		End while 
		If (<>DB_bo_ScriptsInited=False:C215)
			If (<>SYS_bo_ScriptonSave)  //load in the special Macros
				ARRAY TEXT:C222(<>SCPT_at_ScriptCode; 0)
				ARRAY TEXT:C222(<>SCPT_at_ScriptText; 0)
				<>DB_bo_ScriptsInited:=True:C214
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$InitingMacros")
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
		$_bo_Script:=[PERSONNEL:11]Macro_Process:23
		If ([PERSONNEL:11]Start_Module:29="")
			$_l_StartModuleRow:=0
		Else 
			$_l_StartModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL:11]Start_Module:29)
		End if 
		
		<>LOGIN_s255_FirstModuleName:=[PERSONNEL:11]Start_Module:29
		<>Login_l_HomeTable:=[PERSONNEL:11]HomeTable:52
		
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
		
		
		If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
			If (Gen_Option=False:C215)
				ST_l_StartupMacros:=New process:C317("Record_Startup"; 128000; "Startup Macros")
				If (ST_l_StartupMacros>0)
					Process_StartAr(ST_l_StartupMacros; "Startup Macros")
				End if 
			End if 
		End if 
		
		//If (<>PER_l_CurrentPersFunctions<6)//APRIL22
		//<>PER_l_CurrentPersFunctions:=6APRIL22
		//End if APRIL22
		
		If (<>PER_l_CurrentUserID>0)
			READ WRITE:C146([CLIENT_SERVERMESSAGES:123])
			QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
			If (Records in selection:C76([CLIENT_SERVERMESSAGES:123])=0)
				READ WRITE:C146([CLIENT_SERVERMESSAGES:123])
				If ([PERSONNEL:11]Personnel_ID:48#<>PER_l_CurrentUserID)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
				End if 
				$_t_ProcessName:=[PERSONNEL:11]Name:2
				CREATE RECORD:C68([CLIENT_SERVERMESSAGES:123])
				[CLIENT_SERVERMESSAGES:123]USER_ID:1:=<>PER_l_CurrentUserID
				[CLIENT_SERVERMESSAGES:123]USER_NAME:2:=$_t_ProcessName
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
							$_l_CountRecords:=Records in selection:C76([CLIENT_SERVERMESSAGES:123])-1
							REDUCE SELECTION:C351([CLIENT_SERVERMESSAGES:123]; $_l_CountRecords)
							DELETE SELECTION:C66([CLIENT_SERVERMESSAGES:123])
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
							QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=Current system user:C484)
						: (Records in selection:C76([CLIENT_SERVERMESSAGES:123])=0)
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
							
							$_l_CountRecords:=Records in selection:C76([CLIENT_SERVERMESSAGES:123])-1
							REDUCE SELECTION:C351([CLIENT_SERVERMESSAGES:123]; $_l_CountRecords)
							DELETE SELECTION:C66([CLIENT_SERVERMESSAGES:123])
							QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
							
					End case 
				End if 
				
				If (Check_Locked(->[CLIENT_SERVERMESSAGES:123]; 1))
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
					$_t_ProcessName:=[PERSONNEL:11]Name:2
					CREATE RECORD:C68([CLIENT_SERVERMESSAGES:123])
					[CLIENT_SERVERMESSAGES:123]USER_ID:1:=<>PER_l_CurrentUserID
					[CLIENT_SERVERMESSAGES:123]USER_NAME:2:=$_t_ProcessName
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

Case of 
	: (Current user:C182="Designer")
		<>PER_l_AccessLevel:=0
	: ((Current user:C182="Manager") | (Current user:C182="ManagerWP") | (Current user:C182="Administrator") | (Current user:C182="AdministratorWP") | (Current user:C182="Demo") | (Current user:C182="DemoWP") | (Current user:C182="DTK"))
		<>PER_l_AccessLevel:=1
	: ((Current user:C182="User") | (Current user:C182="UserWP"))
		<>PER_l_AccessLevel:=2
	: (User in group:C338(Current user:C182; "Designer"))
		<>PER_l_AccessLevel:=0
	: ((User in group:C338(Current user:C182; "Manager")) | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Demo@"))
		<>PER_l_AccessLevel:=1
	: ((User in group:C338(Current user:C182; "User")) | (User in group:C338(Current user:C182; "4D write Group")))
		<>PER_l_AccessLevel:=2
	Else 
		<>PER_l_AccessLevel:=3
End case 
ERR_MethodTrackerReturn("Start_LoginUser"; $_t_oldMethodName)
