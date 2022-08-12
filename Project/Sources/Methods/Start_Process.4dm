//%attributes = {}
If (False:C215)
	//Project Method Name:      Start_Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 09:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ConfigInited; DB_bo_LedgerInited; DB_bo_NoLoad; DB_bo_RecordModified; DB_bo_TranslationInited; DM_bo_CustomSort; INT_bo_DetailOpen; INT_bo_SkinsPrefsLoaded; SCPT_bo_DonotResetScript; SYS_bo_StatsView; vAutoFind)
	C_BOOLEAN:C305(vBefore2; vBefore2C; vBefore2I; vBefore2P; vFromIn; vHideMessages; vMod2; vNoEnd; vSIS)
	C_DATE:C307(<>DB_d_CurrentDate; SRDate)
	C_LONGINT:C283(<>BUTTPROC; <>NoStart; <>PER_l_CurrentUserID; <>SYS_l_CancelProcess; <>SYS_l_DateFormatPreference; ADR_l_useEsquire; ADR_l_UseQualifications; cSIS; DB_l_ButtonClickedFunction; DB_l_ButtonPrefsSet; iCancel)
	C_LONGINT:C283(iInv; iInvL; iOK; MOD_l_CurrentModuleAccess; oOK; P_Message; r1; r2; SRPage; SRRecord; vAccessSwNo)
	C_LONGINT:C283(vAdd; vALLevels; vCM; vCP; vCT; vDiaryCheck; vDY; vIN; vJB; vNo; vOR)
	C_LONGINT:C283(vProc; vProcaMod; vPS; vPT; vSC; vStPos; WS_l_DefaultTable)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284(<>ButtDis; <>PER_t_CurrentUserName; <>SYS_t_AccessType; <>SYS_t_DefaultFontBold; <>vMacroCode; $_t_CurrentMachineOwner; $_t_EventHandlerMethod; $_t_oldMethodName; $_t_oldMethodName2; $_t_ProcessName; $_t_UserName)
	C_TEXT:C284($1; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5)
	C_TEXT:C284(SR_Search; SR_Sort; SYS_t_AccessType; vButtDis; vButtDisApp; vButtDisBk; vButtDisCom; vButtDisCon; vButtDisDry; vButtDisInv; vButtDisJob)
	C_TEXT:C284(vButtDisMov; vButtDisO; vButtDisOI; vButtDisOrd; vButtDisPersonnel; vButtDisPro; vButtDisSC; vButtDisstockI; vButtDisTxt; vCompCode; vCompName)
	C_TEXT:C284(vContCode; vForename; vLayCode; vMT; vMTitle2; vPostcode; vSelPrev; vStPrev; vSurname; vTitle; vTown)
	C_TEXT:C284(WIN_t_FormSettingsLoaded; WIN_CurrentOutputformSet; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
	C_TIME:C306(<>CTime; SRTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Start_Process")

//TRACE
If (Application type:C494#4D Server:K5:6)
	
	$_t_EventHandlerMethod:=Method called on event:C705
Else 
	$_t_EventHandlerMethod:=""
End if 
If ($_t_EventHandlerMethod="")
	Start_Event
End if 
If (Not:C34(Is compiled mode:C492))
	Compiler_Variables
End if 






//Start_Process

//the above can be used to stop resorting before printing
//currently only for aged debtors

<>DB_d_CurrentDate:=Current date:C33
<>CTime:=Current time:C178
<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)

DB_SetDefaultFonts

WIN_CurrentOutputformSet:=""  //Rollo 9/7/2004
WIN_t_FormSettingsLoaded:=""  //Rollo 15/7/2004
INT_bo_SkinsPrefsLoaded:=False:C215  //Rollo 16/7/2004




$_t_CurrentMachineOwner:=Substring:C12(Current system user:C484; 1; 80)
$_t_ProcessName:=Process_Name(Current process:C322)
$_t_oldMethodName2:=ERR_MethodTracker("Start_Process(2)")
If ($_t_ProcessName#"$@")
	
	If (<>PER_l_CurrentUserID>0)
		READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
		QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID)
		QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=$_t_CurrentMachineOwner)
		
		
		If (Records in selection:C76([CLIENT_SERVERMESSAGES:123])=0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
			$_t_UserName:=[PERSONNEL:11]Name:2
			CREATE RECORD:C68([CLIENT_SERVERMESSAGES:123])
			[CLIENT_SERVERMESSAGES:123]USER_ID:1:=<>PER_l_CurrentUserID
			[CLIENT_SERVERMESSAGES:123]USER_NAME:2:=$_t_UserName
			[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3:=Current system user:C484
			DB_SaveRecord(->[CLIENT_SERVERMESSAGES:123])
			UNLOAD RECORD:C212([CLIENT_SERVERMESSAGES:123])
			READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
			QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_ID:1=<>PER_l_CurrentUserID; *)
			QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=$_t_CurrentMachineOwner)
		End if 
	Else 
		READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
		QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]USER_NAME:2=<>PER_t_CurrentUserName; *)
		QUERY:C277([CLIENT_SERVERMESSAGES:123];  & ; [CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3=$_t_CurrentMachineOwner)
		
	End if 
	
End if 
$_t_oldMethodName2:=ERR_MethodTracker("Start_Process(3)")


//C_LONGINT(TransactionLevel) `25/0702 pb/bsw donot need it at the moment


If (<>NoStart=0)
	vProc:=Current process:C322
	DB_SetMenuBar(""; 9)
	READ ONLY:C145(*)
	//DEFAULT TABLE([CONTACTS])  //needed by Macro_FileUpd if some processes forget
	
	DB_l_ButtonClickedFunction:=0
	P_Message:=0  //added 27/03/07 -kmw
	
	
	
	vCT:=0
	vCP:=0
	vOR:=0
	vDY:=0
	vPT:=0
	vIN:=0
	vPS:=0
	vSC:=0
	vJB:=0
	DB_t_CurrentFormUsage:=""
	DB_t_CurrentFormUsage2:=""
	DB_t_CurrentFormUsage3:=""
	vCompCode:=""
	vContCode:=""
	vCompName:=""
	vSurname:=""
	vForename:=""
	vTown:=""
	vPostcode:=""
	vAdd:=0
	vSIS:=False:C215
	cSIS:=0
	vDiaryCheck:=0
	DB_l_ButtonPrefsSet:=0
	r1:=0
	r2:=0
	ADR_l_useEsquire:=0
	ADR_l_UseQualifications:=0
	iInv:=0
	iInvL:=0
	vCM:=0
	MOD_l_CurrentModuleAccess:=0
	vProcaMod:=0
	vSelPrev:=""
	DB_t_CallOnCloseorSave:=""
	DB_bo_RecordModified:=False:C215
	vAutoFind:=False:C215
	DB_t_ButtonClickedFunction:=""
	DB_l_ButtonClickedFunction:=0
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	
	If ((<>ButtProc=0) & ($_Obj_GetUser.functions>3))
		In_ButtProc
	End if 
	oOK:=0
	iOK:=0
	iCancel:=0
	vButtDisO:="NK"
	vLayCode:=""
	SR_Search:=""
	SR_Sort:=""
	vFromIn:=False:C215
	<>SYS_l_CancelProcess:=0
	vMod2:=False:C215
	If ((DB_GetModuleSettingByNUM(1))=5)
		SYS_t_AccessType:=""  //QA no longer available for Silver
		
	Else 
		SYS_t_AccessType:=<>SYS_t_AccessType
	End if 
	vAccessSwNo:=0
	vNoEnd:=False:C215
	vStPrev:=""
	vStPos:=0
	SYS_bo_StatsView:=False:C215
	vNo:=0
	vALLevels:=0
	vBefore2:=False:C215
	vBefore2C:=False:C215
	vBefore2I:=False:C215
	vBefore2P:=False:C215
	
	If (SCPT_bo_DonotResetScript=False:C215)  //added 06/08/08 -kmw, provide way of calling "Start_Process" without reseting these macro values. If required "mDontResetMacro" should be set to true before calling "Start_Process" and unless there is a reason not to it should immediately be set back to false after the call to "Start_Process" (macro written by Nigel for Panacea required call to Start_Process - but in doing do this chunk of code was killing the macro)
		
		
		vMTitle2:=""
		vMT:=""
		SCPT_t_Description1:=""
		SCPT_t_Description2:=""
		SCPT_t_Description3:=""
		SCPT_t_Description4:=""
		SCPT_t_Description5:=""
		vTitle:=""
		<>vMacroCode:=""
	End if   //added 06/08/08 -kmw, provide way of calling "Start_Process" without reseting these macro values. If required "mDontResetMacro" should be set to true before calling "Start_Process" and unless there is a reason not to it should immediately be set back to false after the call to "Start_Process" (macro written by Nigel for Panacea required call to Start_Process - but in doing do this chunk of code was killing the macro)
	
Else 
	<>NoStart:=0
	vNoEnd:=True:C214
End if 
vHideMessages:=False:C215  //added 12/03/07 -kmw


$_t_oldMethodName2:=ERR_MethodTracker("Start_Process(4)")
ERR_MethodTrackerReturn("Start_Process"; $_t_oldMethodName)
