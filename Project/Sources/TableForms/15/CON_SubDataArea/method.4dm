If (False:C215)
	//Table Form Method Name: [USER]CON_SubDataArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 08:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_LB_RelatedData;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_TabNames;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(CON_bo_FurtherFieldsLoaded; DB_bo_NoLoad)
	C_LONGINT:C283($_l_CalledFromProcess; $_l_CharacterPosition; $_l_event; $_l_ProcessState; $_l_TableNumber; CON_l_FurtherFieldsMod; CON_l_IPcall; CON_l_ParentProcess; CON_Timer; DB_l_ButtonClickedFunction; iCancel)
	C_LONGINT:C283(iOK; SD2_l_CallingProcess; SD2_l_TableNum)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; CON_t_ContactCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD2_t_TabFunction; vButtDisCon)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CON_SubDataArea"; Form event code:C388)

$_l_event:=Form event code:C388
SET TIMER:C645(240)


Case of 
	: ($_l_event=On Timer:K2:25)
		$_l_ProcessState:=Process state:C330(CON_l_ParentProcess)
		If ($_l_ProcessState<0)
			ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
			CANCEL:C270
		End if 
	: ($_l_event=On Resize:K2:27)
		
		LBI_Scrollonresize(->CON_LB_RelatedData)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		READ ONLY:C145([CONTACTS:1])
		ARRAY TEXT:C222(CON_at_editMode; 0)
		ARRAY LONGINT:C221(CON_al_EditMode; 0)
		ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
		LBi_SetListBoxOptions(->CON_at_editMode; ->CON_al_EditMode; ->CON_Pi_EditMode; True:C214)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=CON_t_ContactCode)  // note that this process in readonly mode-the record will be locked in the parent process
		CON_l_FurtherFieldsMod:=0
		CON_SubLPB
		//WS_AutoscreenSize (1;210;540;Table name(->[USER])+"_"+"Con_SubDataArea")
		SD2_SetDiaryPopup(->CON_al_ViewTableToTable; ->CON_at_ViewTabsLabels; ->CON_at_TabNames)
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				SET PROCESS VARIABLE:C370(CON_l_ParentProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
				POST OUTSIDE CALL:C329(CON_l_ParentProcess)
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				If (DB_l_ButtonClickedFunction#DB_GetButtonFunction("Refresh"))
					SET PROCESS VARIABLE:C370(CON_l_ParentProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
					POST OUTSIDE CALL:C329(CON_l_ParentProcess)
					
				Else 
					
					CON_SubLPB
				End if 
			Else 
				If (CON_l_IPcall>0)
					Case of 
						: (CON_l_IPcall=100)
							//Refesh the displayed data(record change)-and show
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=CON_t_ContactCode)  // note that this process in readonly mode-the record will be locked in the parent process
							CON_SubLPB
							SHOW PROCESS:C325(Current process:C322)
						: (CON_l_IPcall=201)
							//Hide process=dont save
							LBi_RemoveAll(->CON_aptr_LBSetup)
							ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
							HIDE PROCESS:C324(Current process:C322)
							CON_l_FurtherFieldsMod:=0
							CON_bo_FurtherFieldsLoaded:=False:C215
						: (CON_l_IPcall=200)
							//Hide process save first
							LBi_RemoveAll(->CON_aptr_LBSetup)
							ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
							HIDE PROCESS:C324(Current process:C322)
							If (CON_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
								If (CON_l_FurtherFieldsMod>0)
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									READ WRITE:C146([CUSTOM_FIELDS:98])
									If (Records in set:C195("CON_FFSelection")>0)
										USE SET:C118("CON_FFSelection")
										DELETE SELECTION:C66([CUSTOM_FIELDS:98])
									End if 
									CLEAR SET:C117("CON_FFSelection")
									FUR_UpdateFurtherFields(->[CONTACTS:1]; ->CON_t_ContactCode)
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									READ ONLY:C145([CUSTOM_FIELDS:98])
									//at least one further field has been modified
								End if 
								$_l_TableNumber:=Table:C252(->[CONTACTS:1])
								$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
								$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
								$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
								CLEAR SEMAPHORE:C144($_t_SemaphoreName)
								CLEAR SET:C117("CON_FFSelection")
							End if 
							CON_l_FurtherFieldsMod:=0
							CON_bo_FurtherFieldsLoaded:=False:C215
						: (CON_l_IPcall=300)  //Save it
							ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
							CANCEL:C270
							If (CON_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
								If (CON_l_FurtherFieldsMod>0)
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									READ WRITE:C146([CUSTOM_FIELDS:98])
									If (Records in set:C195("CON_FFSelection")>0)
										USE SET:C118("CON_FFSelection")
										DELETE SELECTION:C66([CUSTOM_FIELDS:98])
									End if 
									CLEAR SET:C117("CON_FFSelection")
									FUR_UpdateFurtherFields(->[CONTACTS:1]; ->CON_t_ContactCode)
									
									UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
									READ ONLY:C145([CUSTOM_FIELDS:98])
									//at least one further field has been modified
									
									
								End if 
								$_l_TableNumber:=Table:C252(->[CONTACTS:1])
								$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
								$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
								$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
								CLEAR SEMAPHORE:C144($_t_SemaphoreName)
								CLEAR SET:C117("CON_FFSelection")
							End if 
						: (CON_l_IPcall=301)  //don'tSave it
							ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
							CANCEL:C270
						: (CON_l_IPcall=DB_GetButtonFunction("Enter Related Diary"))
							//Contextual enter to diary
							// This should behave as if the user had clicked on that tab and then went +
							//Because this is handled from the parent process.....
							SET PROCESS VARIABLE:C370(CON_l_ParentProcess; SD2_t_TabFunction; SD2_t_TabFunction)
							SET PROCESS VARIABLE:C370(CON_l_ParentProcess; DB_l_ButtonClickedFunction; CON_l_IPcall)
							POST OUTSIDE CALL:C329(CON_l_ParentProcess)
							SD2_t_TabFunction:=""
						: (CON_l_IPcall=DB_GetButtonFunction("View Related Diary"))
							ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
							//Here we must select the records and put them in a longint array then pass them back to the calling process
							If (SD2_l_CallingProcess>0)
								$_l_CalledFromProcess:=SD2_l_CallingProcess
								SD2_l_CallingProcess:=0
								$_t_DummyTab:=SD2_t_TabFunction
								$_l_CharacterPosition:=Position:C15("View "; $_t_DummyTab)
								If ($_l_CharacterPosition>0)
									$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("View "); Length:C16($_t_DummyTab))
								End if 
								SD2_t_TabFunction:=""
								CREATE SET:C116([DIARY:12]; "CONcurrentDiary")  //Just to make sure we keep the selection
								CON_SelectDiaryRecords(0; $_t_DummyTab)
								LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
								VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
								SD2_l_TableNum:=2
								SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
								ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
								USE SET:C118("CONcurrentDiary")
								CLEAR SET:C117("CONcurrentDiary")
							End if 
							
					End case 
					CON_l_IPcall:=0
					DB_l_ButtonClickedFunction:=0
				End if 
				
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[CONTACTS:1]); "Contact_In")  //Might seem strange this but this is a companion window
		
		In_ButtChkDis(->vButtDisCon)
		
		SD2_SetDiaryPopup(->CON_al_ViewTableToTable; ->CON_at_ViewTabsLabels; ->CON_at_TabNames)
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].CON_SubDataArea"; $_t_oldMethodName)
