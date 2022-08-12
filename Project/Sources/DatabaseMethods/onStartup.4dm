If (False:C215)
	//Database Method Name:      On Startup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2015 14:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>Menuwindow)
	//ARRAY LONGINT(<>INT_al_FormHeight;0)
	//ARRAY LONGINT(<>INT_al_FormWidth;0)
	//ARRAY TEXT(<>INT_at_FormNames;0)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	C_BOOLEAN:C305(<>Err_bo_HandlerInited; <>Err_bo_PrefShowChainInErrorEmai; <>Err_bo_PrefShowChainInErrorMess; <>PW_Bo_WindowsAutoLogin; <>ST_Bo_ShowSplash; <>SYS_bo_inStartup; $_bo_BootModeOK; $_bo_Compiled; $_bo_LoggedIn; $_bo_Login; $_bo_NoLogin)
	C_BOOLEAN:C305($_bo_Startup; $_bo_Startup2; CD_bo_ClearDayLogin; <>DB_bo_useFileOpenPlugin; <>Err_bo_HandlerInited; <>Err_bo_PrefShowChainInErrorEmai; <>Err_bo_PrefShowChainInErrorMess; <>PW_Bo_WindowsAutoLogin; <>ST_Bo_ShowSplash; <>SYS_bo_inStartup; $_bo_BootModeOK)
	C_BOOLEAN:C305($_bo_Compiled; $_bo_LoggedIn; $_bo_Login; $_bo_NewDatafile; $_bo_NoLogin; $_bo_Startup; $_bo_Startup2; CD_bo_ClearDayLogin)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>Menuwindow; <>SYS_l_ApplicationWindowRef; $_l_DataGetProcessProcess; $_l_DesignSaverProcess; $_l_Error; $_l_Index; $_l_MachineType; $_l_Platform; $_l_RecordCount; $_l_StockHandlerProcess; $_l_SystemVersion)
	C_LONGINT:C283($_l_Timeout; DB_l_currentuserID; DB_l_UserIdentWindow; ST_l_StartupMacros; <>LIC_l_Seed; <>SYS_l_ApplicationWindowRef; $_l_DataGetProcessProcess; $_l_DesignSaverProcess; $_l_Error; $_l_Index; $_l_Platform)
	C_LONGINT:C283($_l_RecordCount; $_l_StockHandlerProcess; $_l_StockWatcherProcess; DB_l_currentuserID; DB_l_UserIdentWindow; ST_l_StartupMacros)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_DirectorySymbol; $_t_NewPath; $_t_NewResoucePath; $_t_ResourcesPath; $_t_StructureDirectory; $_t_StructurePath; $_t_UserConstantsPath; $_t_UserName; $_t_VersionNo2; $_t_VersionNumber; <>SYS_t_LastSavedTableName)
	C_TEXT:C284($_t_DirectorySymbol; $_t_NewPath; $_t_ResourcesPath; $_t_UserConstantsPath; $_t_UserName; $_t_VersionNo2; $_t_VersionNumber; $DB_t_CLientVersion)
	C_TIME:C306($_ti_Resource)
End if 
//Code Starts Here

//$_t_oldMethodName:=ERR_MethodTracker ("onStartup")


While (Semaphore:C143("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
	DelayTicks
End while 
If (DB_ControlDataFilePath)
	CLEAR SEMAPHORE:C144("$DuringLogin")
	//SET DATABASE PARAMETER(34;2)  `
	ON ERR CALL:C155("Error_Proc")
	//ALERT("Method called on error "+Method called on error)
	CD_bo_ClearDayLogin:=False:C215
	<>DB_bo_useFileOpenPlugin:=False:C215  //temporary
	
	//TRACE
	
	//SET PLUGIN ACCESS(808464697;"Designer")
	
	//808464697
	
	$_bo_NewDatafile:=False:C215
	If (CD_bo_ClearDayLogin)
		
		
	Else 
		
		//SET DATABASE PARAMETER(34;2)`DO log 4d commands
		
		
		
		//_O_PLATFORM PROPERTIES($_l_Platform;$_l_SystemVersion;$_l_MachineType)
		//TRACE
		Get_PlatformProperty("Platform"; ->$_l_Platform)
		If (Records in table:C83([USER:15])=0)
			CHANGE CURRENT USER:C289
			
			CD_FreshStart
			$_bo_NewDatafile:=True:C214
		End if 
		
		
		If (($_l_Platform<1) | (3<$_l_Platform)) | (True:C214)  //this at the end to disable this until tested
			If (Is compiled mode:C492)
				
				DB_l_UserIdentWindow:=New process:C317("DB_selectUserLogin"; DB_ProcessMemoryinit(4); "User Ident"; Current process:C322)
			Else 
				//Current client authentication
				Str_StripNonAN
				CHANGE CURRENT USER:C289
				If (Not:C34(User in group:C338(Current user:C182; "ThrowOut")))
					DB_l_UserIdentWindow:=New process:C317("DB_selectUserLogin"; DB_ProcessMemoryinit(4); "User Ident"; Current process:C322)
				Else 
					//QUIT 4D
					$_bo_NoLogin:=True:C214
					
				End if 
				
				
				
			End if 
			TRACE:C157
			//<>Mod_at_ProcessFunction
			
			//Get indexed string(14001;1)
			
			
		Else 
			//Only do the following on WIndows
			$_bo_LoggedIn:=False:C215
			//$_l_Error:=sys_GetUserName ($_t_UserName)
			If ($_l_Error=0)  //did not get an error from the os call
				If ($_t_UserName#"")  //got a user name
					Case of 
						: (Application type:C494=4D Remote mode:K5:5) | (Application type:C494<4)  //only so this does not get called for anyother type of connection
							DB_LoadPasswordAutoSetup  // This value can only be set to true if ◊PWActive
							If (<>PW_Bo_WindowsAutoLogin)  //if the auto logon option is enabled
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Windows_Login_Name:51=$_t_UserName)
								If (Records in selection:C76([PERSONNEL:11])>0)  // if the logged on user is set up for this option
									
									$_bo_LoggedIn:=True:C214
									CHANGE CURRENT USER:C289([PERSONNEL:11]Name:2; [PERSONNEL:11]Person_Identity:13)
									
									
								End if 
							End if 
						Else 
							
					End case 
				End if 
			End if 
			If (Not:C34($_bo_LoggedIn))  //if for any reason that did not log us on( only need to add some handling for -9978-bad password
				CHANGE CURRENT USER:C289
			End if 
		End if 
		//Edit_Access
		//QUIT 4D
		If (Not:C34($_bo_NoLogin))
			$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
			
			
			If (Application type:C494#4D Remote mode:K5:5)
				$_t_NewPath:=Get 4D folder:C485(Database folder:K5:14)
			Else 
				$_t_NewPath:=Get 4D folder:C485(4D Client database folder:K5:13; *)
			End if 
			$_t_ResourcesPath:=$_t_ResourcesPath+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
			$_t_UserConstantsPath:=$_t_NewPath+"User Constants.rsr"
			
			If (Is a document:K24:1=(Test path name:C476($_t_ResourcesPath)))
				If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_UserConstantsPath))))
					COPY DOCUMENT:C541($_t_ResourcesPath; $_t_UserConstantsPath)
				End if 
				$_ti_Resource:=Open resource file:C497($_t_UserConstantsPath)
			End if 
			<>DB_d_CurrentDate:=Current date:C33
			
			If (Not:C34(User in group:C338(Current user:C182; "ThrowOut"))) | (Is compiled mode:C492) | (True:C214)
				
				While (Semaphore:C143("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
					DelayTicks
				End while 
				
				DB_StartupCopyPrefs
				
				AAAC
				
				
				//$_l_DesignSaverProcess:=New process("MOD_SHowModuleSettings";DB_ProcessMemoryinit(2);"Showing Modules settings")
				//SET PLUGIN ACCESS(808464697;"Designer")
				//Edit_Access
				
				$_bo_Compiled:=True:C214
				If (Not:C34(Is compiled mode:C492))
					$_bo_Compiled:=False:C215
					$_l_DesignSaverProcess:=New process:C317("DesignSaver"; DB_ProcessMemoryinit(4); "$designsaverProcess")
					ARRAY TEXT:C222($_at_ComponentNames; 0)
					COMPONENT LIST:C1001($_at_ComponentNames)
					If (Find in array:C230($_at_ComponentNames; "4DPop")>0)
						EXECUTE METHOD:C1007("4DPop_Palette")
					End if 
					
					
					
				Else 
					
					SPLASH_THERMO(True:C214)  //hide splash thermometer
					SPLASH_UPDATE(" ..."; 0; 2)
					SPLASH_TIMER
					
				End if 
				If (Application type:C494#4D Remote mode:K5:5)
					
					SD3_ServerSideDiaryManager
				End if 
				
				If (Application type:C494=4D Volume desktop:K5:2)
					HIDE WINDOW:C436(<>SYS_l_ApplicationWindowRef)
				End if 
				HIDE TOOL BAR:C434
				
				
				ARRAY TEXT:C222(<>INT_at_FormNames; 0)
				ARRAY LONGINT:C221(<>INT_al_FormHeight; 0)
				ARRAY LONGINT:C221(<>INT_al_FormWidth; 0)
				//NG The following are now declared in Compiler_Variables_Inter
				<>Err_bo_PrefShowChainInErrorMess:=False:C215  //added call chain recording/reporting 18/10/07 -kmw
				<>Err_bo_PrefShowChainInErrorEmai:=True:C214  //added 26/10/07 -kmw
				<>LIC_l_Seed:=7350
				SET DEFAULT CENTURY:C392(19; (((Year of:C25(Current date:C33(*)))-2000)+20))  //anything greater than current year plus 20 will be 19...
				<>Menuwindow:=Frontmost window:C447
				<>Err_bo_HandlerInited:=True:C214
				
				START_CheckClientVersion
				
				DelayIfIndexing
				
				
				If (Records in table:C83([USER:15])=0)
					
					$_l_RecordCount:=0
					$_bo_Login:=False:C215
					For ($_l_Index; 1; Get last table number:C254)
						If (Is table number valid:C999($_l_Index))
							$_ptr_Table:=Table:C252($_l_Index)
							$_l_RecordCount:=$_l_RecordCount+Records in table:C83($_ptr_Table->)
						End if 
					End for 
					If ($_l_RecordCount>0)
						$_bo_Login:=True:C214
					End if 
					If ($_bo_Login=False:C215)
						CONFIRM:C162("This appears to be a fresh data file, do you wish to re-import data?"; "Yes"; "No")
						If (OK=1)
							DB_SetAlltriggers(-1)
							CONFIRM:C162("Import from V6 or V7"; "V7"; "V6")
							If (OK=0)
								TBL_IMPORT
							Else 
								TBI_ImportFrom2004
								
							End if 
							$_bo_Login:=True:C214
						End if 
					End if 
					
				Else 
					$_bo_Login:=True:C214
				End if 
				If ($_bo_Login)
					
					$_bo_BootModeOK:=DB_Boot_Mode  //bsw 13/12/03 boot up in daybook advanced data tools mode
					
					
					
					If ($_bo_BootModeOK)
						
						
						DB_SetAlltriggers
						
						<>SYS_bo_inStartup:=True:C214
						<>ST_Bo_ShowSplash:=True:C214
						
						Repeat 
							If (DB_l_UserIdentWindow>0)
								DelayTicks(60)
							End if 
						Until (DB_l_UserIdentWindow=0)
						
						If (DB_l_currentuserID>0)
							<>Menuwindow:=Frontmost window:C447
							If (Application type:C494=4D Volume desktop:K5:2)
								//SET WINDOW RECT(59;<>SYS_l_WindowTop+72;55+455;<>SYS_l_WindowTop+60+267;<>MenuWindow)
								
								//HIDE WINDOW(<>Menuwindow)
							End if 
							//ALERT(Current user)
							
							//CHANGE CURRENT USER
							
							
							If (User in group:C338(Current user:C182; "Designer"))
								If (Not:C34(Is compiled mode:C492))
									
									//$_l_DesignSaverProcess:=New process("DesignSaver";DB_ProcessMemoryinit(4);"$designsaverProcess";
									CONFIRM:C162("Normal Startup?"; "Yes"; "No")
									If (OK=1)
										SET WINDOW RECT:C444(53; 0+50; 53+455; 800; <>MenuWindow)
										
										Start_inProcess
										<>ST_Bo_ShowSplash:=False:C215
										
										
										OK:=1
										<>ST_Bo_ShowSplash:=True:C214
										SPLASH_THERMO(True:C214)  //hide splash thermometer
										SPLASH_UPDATE(" ..."; 0; 2)
										
										
										//SPLASH_UPDATE ("Startup ...";1;1)
										$_bo_Startup:=True:C214
										$_bo_Startup2:=True:C214
										
									Else 
										OK:=1
										$_bo_Startup2:=False:C215
										<>Menuwindow:=0
										DB_SetMenuBar(""; 1)
										MESSAGE:C88("Don't try running anything then!!!")
									End if 
								Else 
									
									
									Start_inProcess
									
									$_bo_Startup2:=True:C214
								End if 
							Else 
								
								Start_inProcess
								$_bo_Startup2:=True:C214
							End if 
							
							If ($_bo_Startup2)
								
								
								
								
								If (Application type:C494=4D Remote mode:K5:5)  //If 4D CLIENT check version on server is same as this client
									//SPLASH_UPDATE ("Startup ...";1;1)
									
									
									Startup
									
								Else 
									
									<>LIC_l_Seed:=7350  //this could be changed to an array of valid seeds
									READ ONLY:C145([USER:15])
									ALL RECORDS:C47([USER:15])
									If (Records in selection:C76([USER:15])>1)
										READ WRITE:C146([USER:15])
										CREATE EMPTY SET:C140([USER:15]; "$del")
										For ($_l_Index; 1; Records in selection:C76([USER:15]))
											If ($_l_Index>1)
												ADD TO SET:C119([USER:15]; "$del")
											End if 
											NEXT RECORD:C51([USER:15])
										End for 
										USE SET:C118("$del")
										CLEAR SET:C117("$del")
										DELETE SELECTION:C66([USER:15])
										REDUCE SELECTION:C351([USER:15]; 0)
										READ ONLY:C145([USER:15])
										ALL RECORDS:C47([USER:15])
									End if 
									
									User_Version
									If (Semaphore:C143("VersUp"))
										User_DetsVersUp
									End if 
									
									CLEAR SEMAPHORE:C144("VersUp")
									//$_t_VersionNumber:=VER_GetVersion (1)
									$_t_VersionNo2:=VER_GetVersion
									If ([USER:15]Last Version:92#<>SYS_t_VersionNumber)  // | ($_t_VersionNumber#$_t_VersionNo2)
										READ WRITE:C146([USER:15])
										LOAD RECORD:C52([USER:15])
										User_VersionUp($_t_VersionNumber; $_t_VersionNo2)
										AA_CheckUUID(Table:C252(->[USER:15]))
										<>SYS_t_LastSavedTableName:=("USER")
										SAVE RECORD:C53([USER:15])
										UNLOAD RECORD:C212([USER:15])
										READ ONLY:C145([USER:15])
										ALL RECORDS:C47([USER:15])
										VER_UpdateRoutines(False:C215)
									End if 
									
									$_l_DesignSaverProcess:=New process:C317("ProcessServices"; DB_ProcessMemoryinit(4); "Service Process"; *)  // 16/4/02 pb
									
									$_l_DataGetProcessProcess:=New process:C317("DM_DataRetreiveManager"; DB_ProcessMemoryinit(16); "Data RetreiveManager"; *)
									
									VER_UpdateRoutines
									//SPLASH_UPDATE ("Startup ...";1;1)
									Startup
									
									If (Application type:C494#4D Remote mode:K5:5)
										
										$_l_StockHandlerProcess:=New process:C317("STK_InTesting"; DB_ProcessMemoryinit(5); "Verify Stock")
										
										$_l_StockWatcherProcess:=New process:C317("STK_Watcher"; DB_ProcessMemoryinit(5); "Process Stock Changes")
									End if 
									
									//Gen_Confirm ("This is a one off update..if you have run it once no need to run it again";"Run it";"Dont run it")
									
									//If (OK=1)
									//V11Upgrade
									//V11_ListLayoutsValidate
									
									//End if
									OK:=1
								End if 
								
								
								
								
								
							End if 
						Else 
						End if 
					Else 
						
						$_bo_Startup2:=False:C215
						QUIT 4D:C291
					End if 
					//TRACE
					If (Application type:C494#4D Remote mode:K5:5) & (Not:C34(Is compiled mode:C492))
						
						//$_l_DesignSaverProcess:=New process("DB_MonitorMethodChanges";DB_ProcessMemoryinit(2);"Export Code";*)
						
					End if 
					
					
					<>SYS_bo_inStartup:=False:C215
					If (Application type:C494=4D Remote mode:K5:5)
						//REGISTER CLIENT(◊UserN;10)
						
					End if 
					
					If (ST_l_StartupMacros>0)
						RESUME PROCESS:C320(ST_l_StartupMacros)
					End if 
					SPLASH_UPDATE("..."; 0; -1)
				Else 
					
				End if 
				
				CLEAR SEMAPHORE:C144("$DuringLogin")
				//$_l_DesignSaverProcess:=New process("PW_CHECKUSERS";DB_ProcessMemoryinit(4);"Saving Passwords")
				
			Else 
				QUIT 4D:C291
			End if 
		Else 
			QUIT 4D:C291
		End if 
		
	End if 
Else 
	
	CLEAR SEMAPHORE:C144("$DuringLogin")
	
End if 
//TRACE



//End if
//ERR_MethodTrackerReturn ("onStartup";$_t_oldMethodName)
