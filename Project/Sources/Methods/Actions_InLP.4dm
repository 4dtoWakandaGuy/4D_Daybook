//%attributes = {}
If (False:C215)
	//Project Method Name:      Actions_InLP
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2010 12:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(bMacCancel)
	//C_UNKNOWN(BmacModify)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//C_UNKNOWN(SD_2_macroEditState)
	//ARRAY BOOLEAN(LOC_lb_ActionDiaries;0)
	//ARRAY BOOLEAN(LOC_lb_Actionviewin;0)
	//ARRAY BOOLEAN(RES_lb_Results;0)
	//ARRAY BOOLEAN(SD2_abo_DiaryLocationsSEL;0)
	//ARRAY BOOLEAN(SD2_abo_RelationMandatory;0)
	//ARRAY BOOLEAN(SD2_abo_RelationsModified;0)
	//ARRAY BOOLEAN(SD2_LB_Autos;0)
	//ARRAY BOOLEAN(SD2_LB_Macros;0)
	//ARRAY BOOLEAN(SD2_LB_Statics;0)
	//ARRAY INTEGER(MOD_al_ModuleBarNum;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY LONGINT(SD_al_Actiontypes;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_RelationsMax;0)
	//ARRAY LONGINT(SD2_AL_RelationsMIN;0)
	//ARRAY LONGINT(SD2_al_RelationsTableNUM;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	//ARRAY TEXT(SD_at_ActionTypes;0)
	//ARRAY TEXT(SD_at_Nonmodifiable;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_At_MaxRecordsasString;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_RelationsName;0)
	//ARRAY TEXT(SD2_At_RelationsUUID;0)
	//ARRAY TEXT(SD2_at_RelationTablesS;0)
	//ARRAY TEXT(SD2_at_RelationType;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptWhen;0)
	//ARRAY TEXT(SD2_at_SettingsTab;0)
	//ARRAY TEXT(SD2_at_WhoseDiary;0)
	C_BOOLEAN:C305($_bo_4dWrite; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; $_bo_4dWrite; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonAction; $_l_ButtonNumber; $_l_FormEvent; $_l_Index; $_l_ModulePosition; auts_l_BUT1; auts_l_BUT10; auts_l_BUT2; auts_l_BUT3; auts_l_BUT4; auts_l_BUT5)
	C_LONGINT:C283(auts_l_BUT7; bMacCancel; BmacModify; CB_l_WpDescription; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iOK; Locs_l_BUT1; Locs_l_BUT2; Locs_l_BUT3; Macros_l_BUT1)
	C_LONGINT:C283(Macros_l_BUT2; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; Res_l_BUT1; Res_l_BUT2; Res_l_BUT3; SD_2_macroEditState; SD_l_ActionAddID)
	C_LONGINT:C283(SD2_l_MultiModify; SD2_l_StaticModify; SD2_l_WriteArea; Stats_l_BUT1; Stats_l_BUT2; whose_l_BUT1; whose_l_BUT2; $_l_ButtonAction; $_l_ButtonNumber; $_l_FormEvent; $_l_Index)
	C_LONGINT:C283($_l_ModulePosition; auts_l_BUT6; auts_l_BUT9; CB_l_WpDescription; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; Macros_l_BUT3; SD_l_ActionAddID; SD2_l_MultiModify; SD2_l_StaticModify; SD2_l_WriteArea)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oauts_COL1; oauts_COL2; oauts_COL3; oauts_COL4; oauts_COL5; oauts_COL6; oauts_COL7)
	C_TEXT:C284(oauts_COL8; oauts_COL9; oauts_HED2; oauts_HED3; oauts_HED4; oauts_HED5; oauts_HED6; oauts_HED7; oauts_HED8; oLocs_COL1; oLocs_COL2)
	C_TEXT:C284(oLocs_COL3; oLocs_HED1; oLocs_HED3; oMacros_COL1; oMacros_COL2; oMacros_COL3; oMacros_HED1; oMacros_HED2; oMacros_HED3; oRes_COL1; oRes_COL2)
	C_TEXT:C284(oRes_COL3; oRes_HED1; oRes_HED3; oStats_COL1; oStats_COL2; oStats_HED1; oStats_HED2; oWhose_COL1; oWhose_COL2; oWhose_HED1; oWhose_HED2)
	C_TEXT:C284(PAL_BUTTON; SD_t_Actionadd; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oauts_HED1; oLocs_HED2; oRes_HED2; SD_t_Actionadd)
	C_TEXT:C284(vButtDisACTIONS; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Actions_InLP")
If (Count parameters:C259>=1)
	$_l_FormEvent:=$1
	
Else 
	$_l_FormEvent:=Form event code:C388
End if 
//MESSAGE(String(Form event))



Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(SD_at_Nonmodifiable; 3)
		APPEND TO ARRAY:C911(SD_at_NonModifiable; "Scheduled Items")
		APPEND TO ARRAY:C911(SD_at_NonModifiable; "Work Flow Items")
		APPEND TO ARRAY:C911(SD_at_Nonmodifiable; "Notes Items")  //These types are locked
		
		DB_SetnewToolBar
		
		ARRAY TEXT:C222(SD_at_actionAdd; 0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
		
		SD2_l_MultiModify:=0
		SD2_l_StaticModify:=0
		SD_2_macroEditState:=0
		OBJECT SET TITLE:C194(BmacModify; "Add")
		OBJECT SET TITLE:C194(bMacCancel; "Clear")
		OBJECT SET VISIBLE:C603(bMacCancel; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; False:C215)
		
		ARRAY TEXT:C222(SD2_at_SettingsTab; 6)
		SD2_at_SettingsTab{1}:="Who & When"
		SD2_at_SettingsTab{2}:="Content"
		SD2_at_SettingsTab{3}:="Relations"
		SD2_at_SettingsTab{4}:="Rules"
		SD2_at_SettingsTab{5}:="On Saving"
		SD2_at_SettingsTab{6}:="Time Recording"
		//ARRAY STRING(55;SD_at_actionAdd;0)
		//SD2_LoadDiaryActionClasses <-this method to go
		//Replaced with
		SD2_LoadDiaryFormNames
		SD2_LoadDiaryTypes
		If (True:C214)
			SD2_ActionAttributesToArrays
			
		End if 
		
		
		SD2_ActionAttributestoScreen
		//Wrong
		ARRAY TEXT:C222(SD_at_ActionTypes; 0)
		ARRAY LONGINT:C221(SD_al_Actiontypes; 0)
		COPY ARRAY:C226(SD2_al_DiaryTypeIDS; SD_al_Actiontypes)
		COPY ARRAY:C226(SD2_at_DiaryTypes; SD_at_ActionTypes)
		APPEND TO ARRAY:C911(SD_at_ActionTypes; "-")
		APPEND TO ARRAY:C911(SD_at_ActionTypes; "Modify Action Types")
		APPEND TO ARRAY:C911(SD_al_Actiontypes; -9999)
		APPEND TO ARRAY:C911(SD_al_Actiontypes; -999)
		
		
		If (Is macOS:C1572)
			OBJECT SET FORMAT:C236(SD2_aI_DiaryLocationsSEL; "Yes;;No")
		Else 
			OBJECT SET FORMAT:C236(SD2_aI_DiaryLocationsSEL; "Yes;;No")
		End if 
		
		///
		LB_SetupListbox(->LOC_lb_ActionDiaries; "oWhose"; "whose_L"; 1; ->SD2_al_WhoseDiary; ->SD2_at_WhoseDiary)
		LB_SetColumnHeaders(->LOC_lb_ActionDiaries; "whose_L"; 1; "Record ID"; "Name")
		LB_SetColumnWidths(->LOC_lb_ActionDiaries; "oWhose"; 1; 0; 292)  // dont need to worry about the invisible ones
		LB_SetEnterable(->LOC_lb_ActionDiaries; False:C215; 0; "")
		LB_StyleSettings(->LOC_lb_ActionDiaries; "Black"; 9; "TEST"; ->[PREFERENCES:116])
		
		
		LB_SetScroll(->SD2_LB_Statics; -1; 0)
		///
		//C_LONGINT(SD2_l_Statics)
		LB_SetupListbox(->SD2_LB_Statics; "oStats"; "Stats_L"; 1; ->SD2_at_FieldName; ->SD2_at_RecordCode)
		LB_SetColumnHeaders(->SD2_LB_Statics; "stats_L"; 1; "Record Type"; "Record Code")
		LB_SetColumnWidths(->SD2_LB_Statics; "ostats"; 1; 128; 154)  // dont need to worry about the invisible ones
		LB_SetEnterable(->SD2_LB_Statics; False:C215; 0; "")
		LB_StyleSettings(->SD2_LB_Statics; "Black"; 9; "TEST"; ->[PREFERENCES:116])
		
		
		LB_SetScroll(->SD2_LB_Statics; -1; 0)
		//````
		//LB_SetupListbox (->SD2_LB_Autos;"oauts";"Auts_L";1;->SD2_at_RelationTypesS;->SD2_at_RelationTablesS;->SD2_at_RelationRest;->SD2_al_RelationTypesS;->SD2_al_RelationTablesS;->SD2_al_RelationRestS)
		LB_SetupListbox(->SD2_LB_Autos; "oauts"; "Auts_L"; 1; ->SD2_at_RelationType; ->SD2_at_RelationTablesS; ->SD2_At_MaxRecordsasString; ->SD2_AL_RelationsMIN; ->SD2_al_RelationsMax; ->SD2_al_RelationsTableNUM; ->SD2_abo_RelationMandatory; ->SD2_At_RelationsUUID; ->SD2_abo_RelationsModified; ->SD2_at_RelationsName)
		LB_SetColumnHeaders(->SD2_LB_Autos; "Auts_L"; 1; "Relation Type"; "Related Table"; "Max Records"; ""; ""; ""; ""; ""; "")
		LB_SetColumnWidths(->SD2_LB_Autos; "oAuts"; 1; 98; 104; 30; 0; 0; 0; 0; 0; 0; 0)  // dont need to worry about the invisible ones
		LB_SetEnterable(->SD2_LB_Autos; False:C215; 0; "")
		LB_StyleSettings(->SD2_LB_Autos; "Black"; 9; "oAuts"; ->[PREFERENCES:116])
		
		LB_SetScroll(->SD2_LB_Autos; -1; 0)
		
		//`````
		LB_SetupListbox(->SD2_LB_Macros; "oMacros"; "Macros_L"; 1; ->SD2_at_ScriptCodes; ->SD2_at_ScriptNames; ->SD2_at_ScriptWhen)
		LB_SetColumnHeaders(->SD2_LB_Macros; "Macros_L"; 1; "Script Code"; "Script Name"; "Event")
		LB_SetColumnWidths(->SD2_LB_Macros; "oMacros"; 1; 50; 154; 60)  // dont need to worry about the invisible ones
		LB_StyleSettings(->SD2_LB_Macros; "Black"; 9; "Macros"; ->[PREFERENCES:116])
		LB_SetEnterable(->SD2_LB_Macros; False:C215; 0; "")
		LB_SetColours(->SD2_LB_Macros; Black:K11:16; Grey:K11:15; Light grey:K11:13)  // stripey - white font black/grey stipes
		
		LB_SetScroll(->SD2_LB_Macros; -1; 0)
		LB_StyleSettings(->SD2_LB_Macros; "Black"; 9; "Macros"; ->[PREFERENCES:116])
		//
		//ARRAY STRING(55;SD2_at_DiaryLocations;0)
		//`ARRAY LONGINT(SD2_al_DiaryLocations;0)
		//`ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
		ARRAY BOOLEAN:C223(SD2_abo_DiaryLocationsSEL; 0)
		ARRAY BOOLEAN:C223(SD2_abo_DiaryLocationsSEL; 0)
		For ($_l_Index; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
			APPEND TO ARRAY:C911(SD2_abo_DiaryLocationsSEL; (SD2_aI_DiaryLocationsSEL{$_l_Index}=1))
			
		End for 
		LB_SetupListbox(->LOC_lb_Actionviewin; "oLocs_"; "Locs_L"; 1; ->SD2_abo_DiaryLocationsSEL; ->SD2_at_DiaryLocations; ->SD2_al_DiaryLocations; ->SD2_aI_DiaryLocationsSEL)
		LB_SetColumnHeaders(->LOC_lb_Actionviewin; "Locs_L"; 1; "Selected"; "Action Location"; "")
		LB_SetColumnWidths(->LOC_lb_Actionviewin; "oMacros"; 1; 20; 154; 0; 0)  // dont need to worry about the invisible ones
		LB_StyleSettings(->LOC_lb_Actionviewin; "Black"; 9; "Macros"; ->[PREFERENCES:116])
		LB_SetEnterable(->LOC_lb_Actionviewin; False:C215; 0; "")
		LB_SetColours(->LOC_lb_Actionviewin; Black:K11:16; Grey:K11:15; Light grey:K11:13)  // stripey - white font black/grey stipes
		
		LB_SetScroll(->LOC_lb_Actionviewin; -1; 0)
		LB_StyleSettings(->LOC_lb_Actionviewin; "Black"; 9; "Macros"; ->[PREFERENCES:116])
		
		//`
		LB_SetupListbox(->RES_lb_Results; "oRes_"; "Res_L"; 1; ->SD2_at_ResultCodes; ->SD2_at_ResultNames)
		
		LB_SetColumnHeaders(->RES_lb_Results; "Locs_L"; 1; "Result"; "Result Name")
		LB_SetColumnWidths(->RES_lb_Results; "oMacros"; 1; 98; 174)  // dont need to worry about the invisible ones
		LB_StyleSettings(->RES_lb_Results; "Black"; 9; "Results"; ->[PREFERENCES:116])
		LB_SetEnterable(->RES_lb_Results; False:C215; 0; "")
		LB_SetColours(->RES_lb_Results; Black:K11:16; Grey:K11:15; Light grey:K11:13)  // stripey - white font black/grey stipes
		
		LB_SetScroll(->RES_lb_Results; -1; 0)
		LB_StyleSettings(->RES_lb_Results; "Black"; 9; "results"; ->[PREFERENCES:116])
		
		//``
		//First check 4d write is available
		$_bo_4dWrite:=True:C214
		If ($_bo_4dWrite)
			If (CB_l_WpDescription=1)
				If ([ACTIONS:13]Document_Code:4#"")
					//load the document here
					
					OBJECT SET VISIBLE:C603(SD2_l_WriteArea; True:C214)
					OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(SD2_l_WriteArea; False:C215)
					OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; True:C214)
					CB_l_WpDescription:=0
				End if 
			Else 
				OBJECT SET VISIBLE:C603(SD2_l_WriteArea; False:C215)
				OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; True:C214)
				
			End if 
		Else 
			CB_l_WpDescription:=0
			OBJECT SET VISIBLE:C603(SD2_l_WriteArea; False:C215)
			OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; True:C214)
			OBJECT SET VISIBLE:C603(CB_l_WpDescription; False:C215)
		End if 
		
		
		
		
		WS_AutoscreenSize(2; 620; 620)
		INT_SetInput(Table:C252(->[ACTIONS:13]); WIN_t_CurrentInputForm)
		Macro_AccType("Load "+String:C10(Table:C252(->[ACTIONS:13])))
		SD2_SetDiaryPopup
		vButtDisACTIONS:="I  PMO  FSSSRCADT"
		In_ButtChkDis(->vButtDisACTIONS)
		//the following actually needs to be in the false before phase as does the action attributes to arrays and action arrays to screen
		If ([ACTIONS:13]Action_Code:1#"")
			//While ("UpdatingAction"+[ACTIONS]Action Code)
			//Delayticks(2)
			//End while
		End if 
		OpenHelp(Table:C252(->[ACTIONS:13]); "Action_in")
		If ([ACTIONS:13]ADD_toDiaryID:8>0)
			OBJECT SET VISIBLE:C603([ACTIONS:13]Exclude_fromAdder:9; False:C215)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[ACTIONS:13]ADD_toDiaryID:8)
			If (Records in selection:C76([PERSONNEL:11])=1)
				SD_t_Actionadd:=[PERSONNEL:11]Name:2
				SD_l_ActionAddID:=[PERSONNEL:11]Personnel_ID:48
				OBJECT SET VISIBLE:C603([ACTIONS:13]Exclude_fromAdder:9; True:C214)
			Else 
				[ACTIONS:13]ADD_toDiaryID:8:=0
			End if 
		End if 
		//Populate a Pop-up with the names of the diaries this could be added to
		ARRAY TEXT:C222(SD_at_actionAdd; 0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
		Macro_AccType("Load "+String:C10(Table:C252(->[ACTIONS:13])))
		SD2_SetDiaryPopup
		
		DB_SetInputFormMenu(Table:C252(->[ACTIONS:13]); "Action_In")
		If (Records in selection:C76([ACTIONS:13])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisACTIONS)
	: ($_l_FormEvent=On Data Change:K2:15) | ($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Menu Selected:K2:14) | ($_l_FormEvent=On Plug in Area:K2:16)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ACTIONS:13]); "Action_In")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				Minor_LP_Ex(->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2; ->[ACTIONS:13]Export:3; ->[ACTIONS:13]; "Actions"; "1"; "")
				Case of 
					: (Modified:C32([ACTIONS:13]Priority:5))
						[ACTIONS:13]Export:3:=Export_Stamp2([ACTIONS:13]Export:3)
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[ACTIONS:13]Priority:5)
					: (Modified:C32([ACTIONS:13]Document_Code:4))
						
						Check_Letter(->[ACTIONS:13]Document_Code:4; "")
						[ACTIONS:13]Export:3:=Export_Stamp2([ACTIONS:13]Export:3)
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[ACTIONS:13]Document_Code:4)
						
					: (Modified:C32([ACTIONS:13]Default_Description:6))
						[ACTIONS:13]Export:3:=Export_Stamp2([ACTIONS:13]Export:3)
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[ACTIONS:13]Default_Description:6)
					: ($_l_FormEvent=On Menu Selected:K2:14)
						DB_SetInputFormMenu(Table:C252(->[ACTIONS:13]); "Action_In")
						vButtDisACTIONS:="I  PMO  FSSSRCADT"
						In_ButtChkDis(->vButtDisACTIONS)
						If (Records in selection:C76([ACTIONS:13])<=1)
							OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
							DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
							DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						End if 
						SD2_SetDiaryPopup
				End case 
		End case 
	: ($_l_FormEvent=On Outside Call:K2:11)
		$_l_ButtonAction:=DB_l_ButtonClickedFunction
		// this is only here so i can leave the old method alone..
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
				$_l_ButtonAction:=0
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Last")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Next")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Previous")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("First")) | (iOK=1))
				//save the data back-actually needs to be moved to an LPA method so it saves when you go next/previous record as well
				CLEAR SEMAPHORE:C144("UpdatingAction"+[ACTIONS:13]Action_Code:1)
				SD2_ActionScreentoAttributes
				SD2_ActionArraystoAttributes
				
		End case 
		If ($_l_ButtonAction>0)
			DB_l_ButtonClickedFunction:=$_l_ButtonAction
			Minor_LP_Ex(->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2; ->[ACTIONS:13]Export:3; ->[ACTIONS:13]; "Actions"; "1"; "")
			DB_l_ButtonClickedFunction:=0
		End if 
	: ($_l_FormEvent=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ACTIONS:13]); "Action_In")
		vButtDisACTIONS:="I  PMO  FSSSRCADT"
		In_ButtChkDis(->vButtDisACTIONS)
		If (Records in selection:C76([ACTIONS:13])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		
	: ($_l_FormEvent=On Resize:K2:27)
		
		
End case 
ERR_MethodTrackerReturn("Actions_InLP"; $_t_oldMethodName)
