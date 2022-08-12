//%attributes = {}
If (False:C215)
	//Project Method Name:      onServerStartup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_DataAuditProcessID;0)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	//ARRAY TEXT(<>SYS_at_DataAuditProcessName;0)
	//ARRAY TEXT(<>SYS_at_ModifiedText;0)
	C_BOOLEAN:C305(<>DB_bo_useFileOpenPlugin; <>Err_bo_HandlerInited; <>QA_bo_AddressLookupOpen; <>SCPT_bo_NoAutoScripts; <>SP_Bo_PrefsLoaded; <>SYS_bo_AuditLogging; <>SYS_bo_inStartup; <>SYS_bo_QuitCalled; $_bo_BootModeOK; $_bo_Login; vNoEnd)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>ButtProc; <>DB_l_DiarySetmanagerProcess; <>iOS; <>Mod_l_MaxModules; <>NoStart; <>SYS_l_DateFormatPreference; <>SYS_l_WindowTop; $_l_Platform; $_l_Process; $_l_RecordsInTables; $_l_Retries)
	C_LONGINT:C283($_l_TableIndex; ST_l_StartupMacros; vCreate)
	C_POINTER:C301($_ptr_Table)
	C_REAL:C285($_l_VersionBase; $_l_VersionPart1Num)
	C_TEXT:C284(<>DB_t_SERVERVERSION; <>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; <>SYS_t_PlatformSetting; $_t_ApplicationVersion; $_t_oldMethodName; $_t_VersionNumber; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $VersionNo2)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("onServerStartup")

While (Semaphore:C143("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
	DelayTicks
End while 
TRACE:C157
If (DB_ControlDataFilePath)
	//NG Feb 2004 the following lines store the server 4D application version in a var
	<>DB_bo_useFileOpenPlugin:=True:C214  //temporary
	$_l_Retries:=0
	While (Semaphore:C143("$DuringLogin"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
	End while 
	DB_StartupCopyPrefs
	AAAC
	
	//MIR_onStartup
	
	
	<>Err_bo_HandlerInited:=True:C214
	$_t_ApplicationVersion:=Application version:C493
	// Example: The string"0600"stands for version 6.0.0.
	If ($_t_ApplicationVersion#"")
		$_t_VersionPart1:=Substring:C12($_t_ApplicationVersion; 1; 2)
		$_l_VersionPart1Num:=Num:C11($_t_VersionPart1)
		$_t_VersionPart1:=String:C10($_l_VersionPart1Num)  //LOSES THE LEADING 0
		$_t_VersionPart2:=Substring:C12($_t_ApplicationVersion; 3; 1)
		$_t_VersionPart3:=Substring:C12($_t_ApplicationVersion; 4; 1)
		
		Case of 
			: ($_l_VersionPart1Num<7)
				<>DB_t_SERVERVERSION:=$_t_VersionPart1+"."+$_t_VersionPart2+"."+$_t_VersionPart3
			Else 
				$_l_VersionBase:=2000+(Num:C11($_t_VersionPart1)-4)
				
				<>DB_t_SERVERVERSION:=String:C10($_l_VersionBase)+"."+$_t_VersionPart3
		End case 
		
	End if 
	If ((Get database parameter:C643(14))<15)
		SET DATABASE PARAMETER:C642(14; 15)
	End if 
	If ((Get database parameter:C643(13))<15)
		SET DATABASE PARAMETER:C642(13; 15)
	End if 
	
	//NG Feb 2004 the following variables set
	<>SYS_bo_inStartup:=True:C214
	<>SYS_bo_QuitCalled:=False:C215
	<>SYS_bo_QuitCalled:=False:C215
	<>SP_Bo_PrefsLoaded:=False:C215
	//``NG FEb 2004 end
	DelayIfIndexing
	
	If (Records in table:C83([USER:15])=0)
		$_l_RecordsInTables:=0
		$_bo_Login:=False:C215
		For ($_l_TableIndex; 1; Get last table number:C254)
			If (Is table number valid:C999($_l_TableIndex))
				$_ptr_Table:=Table:C252($_l_TableIndex)
				$_l_RecordsInTables:=$_l_RecordsInTables+Records in table:C83($_ptr_Table->)
			End if 
		End for 
		If ($_l_RecordsInTables>0)
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
	
	DB_SetAlltriggers  //bsw 15/12/03 All triggers are enables by default
	If ($_bo_Login)
		//NG Feb 2004
		//The following lines do the upgrade stuff before anything else
		//the also make sure we only have one record in the user table
		$_bo_BootModeOK:=DB_Boot_Mode  //bsw 13/12/03 boot up in daybook advanced data tools mode
		SPLASH_TIMER
		
		If ($_bo_BootModeOK)
			READ ONLY:C145([USER:15])
			ALL RECORDS:C47([USER:15])
			If (Records in selection:C76([USER:15])>1)
				READ WRITE:C146([USER:15])
				CREATE EMPTY SET:C140([USER:15]; "$Del")
				For ($_l_TableIndex; 1; Records in selection:C76([USER:15]))
					If ($_l_TableIndex>1)
						ADD TO SET:C119([USER:15]; "$del")
					End if 
					NEXT RECORD:C51([USER:15])
				End for 
				USE SET:C118("$Del")
				CLEAR SET:C117("$Del")
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
			$VersionNo2:=VER_GetVersion
			
			If ([USER:15]Last Version:92#<>SYS_t_VersionNumber)  // | ($_t_VersionNumber#$VersionNo2)
				
				READ WRITE:C146([USER:15])
				LOAD RECORD:C52([USER:15])
				User_VersionUp($_t_VersionNumber; $VersionNo2)
				
				
				SAVE RECORD:C53([USER:15])
				UNLOAD RECORD:C212([USER:15])
				READ ONLY:C145([USER:15])
				ALL RECORDS:C47([USER:15])
				VER_UpdateRoutines(False:C215)
			End if 
			//End additional lines   for version updating
			
			
			
			//4DBKC_Init
			AAAC  //bsw 11/12/03 this seems to be compiler variable declaration method
			SERVER_STARTUP
			
			ARRAY TEXT:C222(<>SYS_at_ModifiedText; 100)  //used for data audit
			ARRAY LONGINT:C221(<>SYS_al_ModifiedTable; 100)
			ARRAY TEXT:C222(<>SYS_at_DataAuditProcessName; Get last table number:C254)
			ARRAY LONGINT:C221(<>SYS_al_DataAuditProcessID; Get last table number:C254)
			
			START_SEMAPHORE("StartingServer")
			
			
			//<>PER_l_CurrentPersFunctions:=0
			<>Mod_l_MaxModules:=45  //original 36 + 1 for DM.  When referred to, has + 2 for Cos & Prods & +6 for spar
			<>DB_d_CurrentDate:=Current date:C33
			<>CTime:=Current time:C178
			<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)
			
			//_O_PLATFORM PROPERTIES($_l_Platform;$System;$Processor)
			Get_PlatformProperty("Platform"; ->$_l_Platform)
			Case of 
				: ($_l_Platform=2)
					
					<>iOS:=Int:C8(Num:C11(DB_GetVersionNum(DBGetOSVersion)))
					
					
					
					
					<>SYS_t_PlatformSetting:="P"
					<>SYS_l_WindowTop:=20  //22
					
					<>SYS_t_DefaultFontBold:="Copperplate"
					//◊FontPlain:="Gill Sans"
					<>SYS_t_DefaultFontPlain:="Geneva"
					
				: ($_l_Platform=3)
					<>SYS_t_PlatformSetting:="W"
					<>SYS_l_WindowTop:=20  //42 `44
					<>SYS_t_DefaultFontBold:="Arial"
					<>SYS_t_DefaultFontPlain:="Arial"
				Else   //Platform for Mac should be 1, but it seems wrong on a Q950
					<>SYS_t_PlatformSetting:="P"  //M for Mac/PowerMac, P for PowerMac, W for Windows, 9 for W 95
					<>SYS_l_WindowTop:=20  //22
					<>SYS_t_DefaultFontBold:="Espy Sans Bold"
					<>SYS_t_DefaultFontPlain:="Espy Sans"
			End case 
			<>QA_bo_AddressLookupOpen:=False:C215
			DB_t_CurrentFormUsage:=""
			DB_t_CurrentFormUsage2:=""
			DB_t_CurrentFormUsage3:=""
			Modules_Array
			vCreate:=1
			vNoEnd:=False:C215
			<>SCPT_bo_NoAutoScripts:=False:C215
			
			User_Details(1; True:C214)
			PW_CHECKUSERS
			
			Stop_Semaphore("StartingServer")
			//NG Feb 2004 Modification here to ensure semaphore is set before loading list of
			
			
			
			
			$_l_Process:=New process:C317("ProcessServices"; 128*1024; "Service Process"; *)  //
			$_l_Process:=New process:C317("DM_DataRetreiveManager"; 128*1024; "Data RetreiveManager"; *)
			
			
			
			VER_UpdateRoutines
			
			
			StartBackgrounder
			<>SYS_bo_inStartup:=False:C215
			If (ST_l_StartupMacros>0)
				RESUME PROCESS:C320(ST_l_StartupMacros)
			End if 
			UnloadAllRecords  //bsw 11/12/03
			DBWS_Init
			$_l_Process:=New process:C317("STK_InTesting"; 180000; "Verify Stock")
			//$_l_Process:=New process("STK_Watcher";180000;"Process Stock Changes")
		End if 
		
		
	Else 
		
	End if 
End if 
CLEAR SEMAPHORE:C144("$DuringLogin")
ERR_MethodTrackerReturn("onServerStartup"; $_t_oldMethodName)
