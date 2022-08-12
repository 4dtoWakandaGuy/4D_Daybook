If (False:C215)
	//Table Form Method Name: Object Name:      [USER].SD2_WorkflowViewer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	//ARRAY BOOLEAN(SD2_abo_isThread;0)
	//ARRAY BOOLEAN(SD2_abo_MarkasDone;0)
	//ARRAY BOOLEAN(SD2_lb_Workflow;0)
	//ARRAY DATE(SD2_ad_WorkflowActionDate;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD2_al_OpenParent;0)
	//ARRAY LONGINT(SD2_al_SourceTable;0)
	//ARRAY LONGINT(SD2_al_ThreadID;0)
	//ARRAY LONGINT(SD2_al_TimeFrom;0)
	//ARRAY PICTURE(SD_apic_WorkFlowColor;0)
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY PICTURE(SD2_apic_ThreadLevels;0)
	//ARRAY POINTER(DB_aptr_Documents;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_PersonCodes; 0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
	//ARRAY TEXT(SD2_at_ActionNotes;0)
	//ARRAY TEXT(SD2_at_SelectedWorflowOwners;0)
	//ARRAY TEXT(SD2_at_Subject;0)
	//ARRAY TEXT(SD2_at_WorkFlowActionCode;0)
	//ARRAY TEXT(SD2_at_WorkflowActionNames;0)
	//ARRAY TEXT(SD2_at_WorkflowDiaryCode;0)
	//ARRAY TEXT(SD2_at_WorkflowOwnerNames;0)
	//ARRAY TEXT(SD2_at_WorkflowOwners;0)
	C_BOOLEAN:C305(<>StatsSwitch; <>SYS_bo_CurrentWindowModal; $_bo_Highlight; $_bo_newLevel; DB_bo_NoLoad; DM_bo_CustomSort; PAL_bo_ButtonSubFunction; QV_bo_KeepWindowsize; QV_bo_SearchDone; QV_bo_SearchDone; SD2_IncludeOverdue)
	C_LONGINT:C283(<>MENU_l_BarModule; <>newSetsProcess; <>PER_l_CurrentUserID; <>WT_SortFieldName_2; $_l_ButtonNumber; $_l_ButtonPressed; $_l_event; $_l_FieldNumber; $_l_Index; $_l_IndexLine; $_l_KeyPosition)
	C_LONGINT:C283($_l_MenusCount; $_l_ModuleRow; $_l_OutCallBack; $_l_PipelineProcess; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelAfterRemove; $_l_RecordsInSelPriorToRemove; $_l_Retries; $_l_ReuseLevel; $_l_TableNumber)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_MonitorCall; DB_l_ButtonClickedFunction; DB_l_OutCallBack; DB_l_WindowCurrentModule; ModuleNumber; oOK; SD_l_GenwindowBottom)
	C_LONGINT:C283(SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop; SD2_l_IncludeOverdue; SD2_l_IncludeFuture; SD2_l_IncludeOverdue; SD3_l_BUT1; SD3_l_But2; SD3_l_BUT3; SD3_l_BUT4; SD3_l_BUT5)
	C_LONGINT:C283(SD3_l_BUT6; SD3_l_BUT7; SD3_l_BUT8; SD3_l_BUT9; SM_l_MonitorCall; SM_l_TableNumber; SM_l_UpdateOnCallBackID; vNo; vNo2)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_CompanyCode; $_ptr_ContactCode; $_ptr_FocusObject; $_Ptr_KeyField; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284(<>ButtDis; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_OldMethodName2; $_t_PalletButtonName; $_t_ProcessName; $_t_VariableName; $SET; BAR_t_Button)
	C_TEXT:C284(DB_T_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CUrrentMenuReference; FS_t_SortFieldTXT; FS_t_SortVariableName; PAL_BUTTON; SD_t_CurrentWorkFlowOwners; SD2_t_SearchCriteria; SD2_t_CurrentUserID; SD2_t_CurrentUserName)
	C_TEXT:C284(SD2_t_CurrentWorkflowOwners; SD2_T_SearchValue; SD3_t_COÌL3; SD3_t_COL1; SD3_t_COL2; SD3_t_COL4; SD3_t_COL5; SD3_t_COL6; SD3_t_COL7; SD3_t_COL8; SD3_t_COL9)
	C_TEXT:C284(SD3_t_HED1; SD3_t_HED2; SD3_t_HED3; SD3_t_HED4; SD3_t_HED5; SD3_t_HED6; SD3_t_HED7; SD3_t_HED8; SD3_t_HED9; SM_t_UseSetName; SRCH_t_SearchValue)
	C_TEXT:C284(vButtDisO; vText; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [USER]SD2_WorkflowViewer"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Timer:K2:25)
		SET TIMER:C645(60*60*2)
		
		SD2_GetWorkflowActions(->SD2_at_SelectedWorflowOwners; SD2_l_IncludeOverdue; SD2_l_IncludeFuture)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		SET TIMER:C645(60*60*2)
		
		ARRAY TEXT:C222(SD2_at_WorkflowOwners; 0)
		APPEND TO ARRAY:C911(SD2_at_WorkflowOwners; SD2_t_CurrentUserID)
		ARRAY TEXT:C222(SD2_at_SelectedWorflowOwners; 0)
		COPY ARRAY:C226(SD2_at_WorkflowOwners; SD2_at_SelectedWorflowOwners)
		If (Size of array:C274(SD2_at_WorkflowOwners)=1)
			//this would be normal.
			//we want to find a list of all the peoples diary this person can see.
			QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=SD2_at_WorkflowOwners{1})
			If (Records in selection:C76([PERSONNEL_DIARY_ACCESS:149])>0)
				SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person:1; $_at_PersonCodes)
				For ($_l_Index; 1; Size of array:C274($_at_PersonCodes))
					APPEND TO ARRAY:C911(SD2_at_WorkflowOwners; $_at_PersonCodes{$_l_Index})
				End for 
			Else 
				OBJECT SET VISIBLE:C603(SD2_at_WorkflowOwnerNames; False:C215)
				
			End if 
		End if 
		
		SD2_l_IncludeOverdue:=1
		SD2_l_IncludeFuture:=1
		QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; SD2_at_WorkflowOwners)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD2_at_WorkflowOwnerNames; [PERSONNEL:11]Initials:1; SD2_at_WorkflowOwners)
		
		SD2_at_WorkflowOwnerNames:=1
		SD2_t_CurrentWorkflowOwners:=SD2_at_WorkflowOwnerNames{1}
		If (Size of array:C274(SD2_at_WorkflowOwnerNames)>1)
			APPEND TO ARRAY:C911(SD2_at_WorkflowOwnerNames; "-")
			APPEND TO ARRAY:C911(SD2_at_WorkflowOwners; "")
			APPEND TO ARRAY:C911(SD2_at_WorkflowOwners; "")
			APPEND TO ARRAY:C911(SD2_at_WorkflowOwnerNames; "Multiple Workflows")
		End if 
		SD2_GetWorkflowActions(->SD2_at_SelectedWorflowOwners; SD2_l_IncludeOverdue; SD2_l_IncludeFuture)
		If (True:C214)
			LB_SetupListbox(->SD2_lb_Workflow; "SD3_t"; "SD3_L"; 1; ->SD2_apic_InfoPic; ->SD2_abo_MarkasDone; ->SD2_apic_ThreadLevels; ->SD2_at_WorkflowDiaryCode; ->SD2_at_WorkFlowActionCode; ->SD2_at_WorkflowActionNames; ->SD_apic_WorkFlowColor; ->SD2_ad_WorkflowActionDate; ->SD2_al_TimeFrom; ->SD2_at_Subject; ->SD2_al_SourceTable; ->SD2_at_ActionNotes; ->SD2_al_ThreadID; ->SD2_abo_isThread; ->SD2_al_OpenParent)  //
			
			LB_SetColumnHeaders(->SD2_lb_Workflow; "SD3_L"; 1; "info"; "Done"; "•"; "Code"; "Action"; "Name"; "Status"; "Date"; "Time"; "Subject"; "Source Table"; "Notes"; "ThreadID"; "is Thread"; "Open parent")
			LB_SetEnterable(->SD2_lb_Workflow; False:C215; 0)
			LB_SetEnterable(->SD2_lb_Workflow; True:C214; 1)
			LB_SetEnterable(->SD2_lb_Workflow; True:C214; 2)
			LB_SetColumnWidths(->SD2_lb_Workflow; "SD3_t"; 1; 25; 35; 35; 40; 50; 100; 40; 65; 50; 250; 0; 0; 0; 0; 0)
			LB_SetScroll(->SD2_lb_Workflow; -3; -2)
			
			LB_SetFormat(->SD2_lb_Workflow; 2; "&/5"; 9; 9; 4)
			LB_SetFilter(->SD2_lb_Workflow; 2; "!0&9##:##"; 9; 9)  //added 08/02/07 -kmw
			LB_StyleSettings(->SD2_lb_Workflow; "Black"; 9; "SD2_t"; ->[DIARY:12])
		Else 
			ARRAY POINTER:C280(DB_aptr_Documents; 0)
			$_bo_newLevel:=True:C214
			$_l_ReuseLevel:=0
			$_ptr_ListBoxSetup:=->DB_aptr_Documents
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->SD2_lb_Workflow; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_inLW"; 15; "Workflow"; "Workflow"; ""; $_bo_newLevel; $_l_ReuseLevel)
		End if 
		
		
		
		//INT_SetDialog
		//WS_AutoscreenSize (3;$Height;$Width)
		WS_GETPALLETEBUTTONS
		vButtDisO:="O        S S   D "
		Input_Buttons(->[DIARY:12]; ->vButtDisO)
		DB_t_CUrrentMenuReference:=Get menu bar reference:C979
		$_l_MenusCount:=Count menu items:C405(DB_t_CUrrentMenuReference)
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_MenusCount+1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
				$_l_MenusCount:=$_l_MenusCount+1
			End for 
		End if 
		
	: ($_l_event=On Outside Call:K2:11)
		
		
		
		//;$4;$5;$6;$7;$8)
		//C_POINTER($1;$8;$3)
		
		If (Current process:C322=Frontmost process:C327(*))
			$_l_ButtonPressed:=DB_l_ButtonClickedFunction
			DB_l_ButtonClickedFunction:=0
			Case of 
					
				: (SM_l_MonitorCall>0)
					//call is from the set manager
					$_l_MonitorCall:=SM_l_MonitorCall
					SM_l_MonitorCall:=0
					Case of 
						: ($_l_MonitorCall=1)
							//Save the current selection into a set
							//and pass this set to the set manager
							//then call the set manager to tell it can be saved
							$_bo_Highlight:=False:C215
							
							SD2_DiaryViewManageSelection
							
							$_l_Retries:=0
							
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
							If (DB_l_OutCallBack>0)
								$_l_OutCallBack:=DB_l_OutCallBack
								DB_l_OutCallBack:=0
								
							Else 
								$_l_OutCallBack:=<>newSetsProcess
							End if 
							PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
							If ($_l_ProcessState>=0)  // 30/05/02 pb
								SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
								SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								POST OUTSIDE CALL:C329($_l_OutCallBack)
							End if 
							USE NAMED SELECTION:C332("CurrentSortedSelection")
							If ($_bo_Highlight)  // this should not be needed as we never changed the array
								
							End if 
							CLEAR SEMAPHORE:C144("$SetInuse")
							
						: ($_l_MonitorCall=2)  //here we are passed a set
							
							$_bo_Highlight:=False:C215
							SD2_DiaryViewManageSelection
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							
							INTERSECTION:C121(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							//Cache_Update
							//HERE UPDATE THE ARRAYS
							//``
							
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							//the -1 above keeps the set created so we can use it after
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
							vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
							vNo2:=0
							
							If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
								CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									POST OUTSIDE CALL:C329($_l_OutCallBack)
									
								End if 
							Else 
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									$_l_MonitorCall:=0
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									
									
								End if 
								
							End if 
							
							
							SD2_DiaryViewHighlightRecords
							//HIGHLIGHT RECORDS("OneRecord")
							//CLEAR SET("OneRecord")
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=3)  //here we are passed a set to unite
							$_bo_Highlight:=False:C215
							SD2_DiaryViewManageSelection
							
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
							
							
							If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
								CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									POST OUTSIDE CALL:C329($_l_OutCallBack)
									
								End if 
							Else 
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									$_l_MonitorCall:=0
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
								End if 
								
							End if 
							vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
							
							
							SD2_DiaryViewHighlightRecords
							
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=4)  //here we are passed a set to unite
							$_bo_Highlight:=False:C215
							SD2_DiaryViewManageSelection
							
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							
							CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							DIFFERENCE:C122(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							//Cache_Update
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
							
							
							vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
							vNo2:=0
							
							If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
								CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									POST OUTSIDE CALL:C329($_l_OutCallBack)
									
								End if 
							End if 
							SD2_DiaryViewHighlightRecords
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=5)  //here we are passed a set to unite
							$_bo_Highlight:=False:C215
							SD2_DiaryViewManageSelection
							
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							
							CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							DIFFERENCE:C122("TempSet"+String:C10(Table:C252(->[DIARY:12])); SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
							USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
							//Cache_Update
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
							
							vNo:=SD2_DiaryViewCountRecords
							vNo2:=0
							
							If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
								If (DB_l_OutCallBack>0)
									$_l_OutCallBack:=DB_l_OutCallBack
									DB_l_OutCallBack:=0
								Else 
									$_l_OutCallBack:=<>newSetsProcess
								End if 
								CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
								PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02 pb
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
									SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
									POST OUTSIDE CALL:C329($_l_OutCallBack)
									
								End if 
							End if 
							SD2_DiaryViewHighlightRecords
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=6)
							$_bo_Highlight:=False:C215
							//load a set from disk
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							LOAD SET:C185([DIARY:12]; "TempSet"; "")
							If (OK=1)  //Why are we doing this bit?
								ARRAY LONGINT:C221($_al_CurrentSelection; 0)
								LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
								If (Size of array:C274($_al_CurrentSelection)>0)
									$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
									$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
									$_Ptr_KeyField:=SD2_aptr_ListControl{8}
									$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
									If ($_l_KeyPosition>0)  //it should be
										$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
									End if 
									ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
									
									For ($_l_IndexLine; 1; Size of array:C274($_Ptr_ThisColumnArray->))
										$_l_ModuleRow:=Find in array:C230($_al_CurrentSelection; $_l_IndexLine)
										If ($_l_ModuleRow>0)
											If ($_l_KeyPosition>0)
												APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_ThisColumnArray->{$_l_IndexLine})
											End if 
										End if 
									End for 
									If (Size of array:C274($_at_DiaryRecordCodes)>0)
										
										//Because here i know what we are searching we can hard code this
										QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryRecordCodes)
									End if 
									$_bo_Highlight:=True:C214
								End if 
								
								If ($_bo_Highlight)
									//HIGHLIGHT RECORDS("OneRecord")
									//CLEAR SET("OneRecord")
								End if 
								USE SET:C118("TempSet")
								CLEAR SET:C117("TempSet")
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								//the -1 above keeps the set created so we can use it after
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
								
							End if 
							CLEAR SEMAPHORE:C144("$SetInuse")
							//no need to call the set manager back
						: ($_l_MonitorCall=8)
							//save the current selection as a set on disk
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							$_bo_Highlight:=False:C215
							vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
							vNo2:=0
							CREATE SET:C116([DIARY:12]; "TempSet")
							SAVE SET:C184("TempSet"; "")
							
							CLEAR SET:C117("TempSet")
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=7)
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							$_bo_Highlight:=False:C215
							//list passed from list manager
							USE SET:C118("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							//the -1 above keeps the set created so we can use it after
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
							vNo:=SD2_DiaryViewCountRecords  //This does not change the selection as it counts the array sizes
							vNo2:=0
							//Cache_Update
							CLEAR SET:C117("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
							//no need to call the set manager back
							If ($_bo_Highlight)
								//HIGHLIGHT RECORDS("OneRecord")
								//CLEAR SET("OneRecord")
							End if 
							CLEAR SEMAPHORE:C144("$SetInuse")
						: ($_l_MonitorCall=9)
							$_l_Retries:=0
							While (Semaphore:C143("$SetInuse"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							If (DB_l_OutCallBack>0)
								$_l_OutCallBack:=DB_l_OutCallBack
								DB_l_OutCallBack:=0
							Else 
								$_l_OutCallBack:=<>newSetsProcess
							End if 
							$_l_TableNumber:=Table:C252(->[DIARY:12])
							//reply with the number of the table
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_TableNumber; $_l_TableNumber)
							CLEAR SEMAPHORE:C144("$SetInuse")
					End case 
					
				: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (oOK=1))
					
					oOK:=0
					CANCEL:C270
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Cancel"))  // | (oCancel=1))
					//  oCancel:=0
					CANCEL:C270
					OK:=0
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Close"))
					DB_t_CallOnCloseorSave:=""
					Close_Process
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Plus"))  //| (oPlus=1))
					//  oPlus:=0
					//SD2_AddRecord
					//if a line is selected to we use the company/contact codes?
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					SD_l_GenwindowLeft:=$_l_WindowLeft
					SD_l_GenwindowRight:=$_l_WindowRight
					SD_l_GenwindowTop:=$_l_WindowTop
					SD_l_GenwindowBottom:=$_l_WindowBottom
					ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW")
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Delete"))
					If (Substring:C12(<>ButtDis; 3; 1)#"D")
						//****************************************************  Deletion functionality added 23/06/08 -kmw ******************************************************************************
						//(Deletes selected record(s) from any and all tabs)
						
						SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //make current selection ALL diary items so we can reload it all (minus any deleted records) after the deletion
						
						CREATE SET:C116([DIARY:12]; "$AllCurrent")  //remember all current
						READ WRITE:C146([DIARY:12])
						
						SD2_DiaryViewManageSelectionNEW(True:C214)  //narrow current selection to highlighted ones
						
						If (Records in selection:C76([DIARY:12])>0)
							Gen_Confirm("Are you sure you want to delete "+String:C10(Records in selection:C76([DIARY:12]))+" Diary records?")
							If (ok=1)
								CREATE SET:C116([DIARY:12]; "$AllHighlighted")
								CREATE EMPTY SET:C140([DIARY:12]; "$AllUnhighlighted")
								DIFFERENCE:C122("$AllCurrent"; "$AllHighlighted"; "$AllUnhighlighted")
								DELETE SELECTION:C66([DIARY:12])  //delete all highlighted records
								READ ONLY:C145([DIARY:12])
								CLEAR SET:C117("$AllHighlighted")  //clear the highlighted records set
								USE SET:C118("$AllUnhighlighted")  //use the set unhighlighted
								CLEAR SET:C117("$AllUnhighlighted")  //clear the set unhighlighted
								CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08 (deleted records should no longer be in search/select selection)
								SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
								SD2_DiaryViewUnhighlightAll  //added 03/07/08 -kmw
								SD2_DiaryViewHighlightRecords  //cached selections would have been correctly set back to blank by "SD2_DiaryVIewManageView" (after all those lines are deleted now), however we may (probably) still need to use the now blank cache to unselect any line numbers from the current tab page list area
								
								vNo:=SD2_DiaryViewCountRecords
								vNo2:=0
								//Cache_Update
							Else 
								READ ONLY:C145([DIARY:12])
								USE SET:C118("$AllCurrent")
							End if 
							
						Else 
							READ ONLY:C145([DIARY:12])
							Gen_Alert("Please first highlight records to Delete"; "Try again")
						End if 
						//********************************************************************************************************************************************************************************
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Select")) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO"))
					// | (oSelect=1))
					//    oSelect:=0
					If (Substring:C12(<>ButtDis; 10; 1)#"S")
						If ((Gen_Option) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO")))
							
							
							//************* kmw 30/06/08 - Commented out the following "$UseCurrentRecords functionality" as it doesn't seem to get used and I don't neccessarily trust that the current selection is indeed ALWAYS correct if it's on a single page (which is what the intention of this code looks like)- 30/06/08, kmw **************
							//First Gather all the sets
							//If (Size of array(SD2_at_PageTabs)>0)
							//$UseCurrentRecords:=False
							//
							//Else
							//  `its just the diary records on screen
							//$UseCurrentRecords:=True
							//End if
							//**********************************************************************************************************************************************************************************************************************************************************************************************
							
							//************* kmw 30/06/08 - In fact comment out all this stuff as well as it doesn't actually make much sense (appears to try to remove a set of highlighted from a set of unhighlighted lines) and the method it uses is broken anyway*************************
							//SD2_DiaryViewManageSelection (True)
							//CREATE SET([DIARY];"$Temp1")
							//SD2_DiaryViewManageSelection (False;True)
							//CREATE SET([DIARY];"$allSelection")
							//If (Records in selection([DIARY])>0)
							//
							//DIFFERENCE("$allSelection";"$Temp1";"$allSelection")
							//USE SET("$allSelection")
							//CLEAR SET("$Temp1")
							//CLEAR SET("$allSelection")
							//SD2_DiaryVIewManageView (-1)  `updates the view-keeps the page
							//USE SET("TempSet")  `Created in the above method-note not the current seleciton on screen
							//CLEAR SET("TempSet")
							//vNo:=SD2_DiaryViewCountRecords
							//vNo2:=0
							//  `Cache_Update
							//Else
							//Gen_Alert ("Please first highlight records to Remove from the Selection";"Try again")
							//End if
							//**********************************************************************************************************************************************************************************************************************************************************************************************
							
							//kmw, 30/08/06 - Do it this way instead of the commented out lines above
							SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)
							$_l_RecordsInSelPriorToRemove:=Records in selection:C76([DIARY:12])
							SD2_DiaryViewManageSelectionNEW(False:C215; True:C214)
							$_l_RecordsInSelAfterRemove:=Records in selection:C76([DIARY:12])
							Case of 
								: ($_l_RecordsInSelAfterRemove=$_l_RecordsInSelPriorToRemove)
									Gen_Alert("Please first highlight records to Remove from the Selection"; "Try again")
								: ($_l_RecordsInSelAfterRemove<$_l_RecordsInSelPriorToRemove)
									CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 03/07/08 (we decided that sub-selecting will now reset the "searchresults" set in the same way that a new search would have)
									SD2_T_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									SD2_t_SearchCriteria:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									SRCH_t_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
									
									//SD2_DiaryVIewManageView (-1;"";False)  `updates the view-keeps the page `kmw 03/07/08 - added param so it doesnt apply filter (because when filtering it reverts back to last search)
									SD2_DiaryVIewManageView(-1)  //kmw 03/07/08 - don't need to tell it not to apply filter anymore because we decided that sub-selecting will now "searchresults" set in the same way that a new search would have
									
									USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
									CLEAR SET:C117("TempSet")
									vNo:=SD2_DiaryViewCountRecords
									vNo2:=0
								Else 
									Gen_Alert("Program error in SD2_diaryViewer form method. Somehow more records in selection a"+"fter attempted line removal than before removal! Please contact developer.")
							End case 
							
						Else 
							//First Gather all the sets
							//SD2_DiaryViewManageSelection (True)  `Comment added 19/06/08, kmw - Ignore unhighlighted. Don't ignore highlighted. (ie make highlighted ones the current record selection).
							SD2_DiaryViewManageSelectionNEW(True:C214)  //Comment added 19/06/08, kmw - Ignore unhighlighted. Don't ignore highlighted. (ie make highlighted ones the current record selection).
							
							//CREATE SET([DIARY];"$Temp1")
							
							If (Records in selection:C76([DIARY:12])>0)
								CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 03/07/08 (we decided that sub-selecting will now reset the "searchresults" set in the same way that a new search would have)
								SD2_T_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
								SD2_t_SearchCriteria:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
								SRCH_t_SearchValue:=""  //added kmw - 03/07/08 (what may have been searched on previously is meaningless now that user has "hand picked" some records so blank out the search value so as not to confuse them that they are looking at result of a search)
								
								//USE SET("$Temp1")
								//CLEAR SET("$Temp1")
								//SD2_DiaryVIewManageView (-1;"";False)  `updates the view-keeps the page `kmw 03/07/08 - added param so it doesnt apply filter (because when filtering it reverts back to last search)
								SD2_DiaryVIewManageView(-1)  //kmw 03/07/08 - don't need to tell it not to apply filter anymore because we decided that sub-selecting will now "searchresults" set in the same way that a new search would have
								
								USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
								CLEAR SET:C117("TempSet")
								vNo:=SD2_DiaryViewCountRecords
								vNo2:=0
								//Cache_Update
								
							Else 
								
								Gen_Alert("Please first highlight records to Select"; "Try again")
							End if 
						End if 
						
						SD2_DiaryViewUnhighlightAll  //changed to method 03/07/08 -kmw
						
					End if 
				: ($_l_ButtonPressed=DB_GetButtonFunction("QVSearch"))
					QV_bo_SearchDone:=False:C215
					QV_bo_KeepWindowsize:=True:C214
					CREATE EMPTY SET:C140([DIARY:12]; "QVTEMP")
					QV_AdvancedSearch(Table:C252(->[DIARY:12]))
					//this returns a set
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							USE SET:C118("QVTEMP")
							CLEAR SET:C117("QVTEMP")
							
							CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 04/07/08
							
							SD2_DiaryVIewManageView(-1)  //updates the view-keeps the page
							
							USE SET:C118("TempSet")  //Created in the above method-note not the current seleciton on screen
							CLEAR SET:C117("TempSet")
						End if 
					End if 
					vNo:=SD2_DiaryViewCountRecords
					
					//Cache_Update
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Find")) | ($_l_ButtonPressed=DB_GetButtonFunction("FindO"))
					//| (oSearch=1))
					OBJECT SET VISIBLE:C603(SD2_t_SearchCriteria; False:C215)
					OBJECT SET VISIBLE:C603(SD2_T_SearchValue; True:C214)
					GOTO OBJECT:C206(SD2_T_SearchValue)
					HIGHLIGHT TEXT:C210(SD2_T_SearchValue; 1; 256)
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Sort")) | ($_l_ButtonPressed=DB_GetButtonFunction("SortO"))
					//| (oSort=1))
					//  oSort:=0
					//Get all the selections loaded first
					
					//SD2_DiaryViewManageSelection (False;True)
					SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //replaced the above line 04/07/08 -kmw (goal is presumably to load all lines into current selection regardless of highlighted ststus....previously it might have worked...maybe (certainly would have behaved strnagely if it did what it says on the tin but that might not have mattered)...anyway just in case it best to call my new function for consistency)
					
					
					If (Records in selection:C76([DIARY:12])<100)
						MESSAGES OFF:C175
					End if 
					If (Substring:C12(<>ButtDis; 12; 1)#"S")
						<>SYS_bo_CurrentWindowModal:=True:C214
						MESSAGES OFF:C175
						SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
						ORDER BY:C49([DIARY:12])
						SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
						MESSAGES ON:C181
						<>SYS_bo_CurrentWindowModal:=False:C215
						If (OK=1)
							DM_bo_CustomSort:=True:C214
							CREATE SET:C116([DIARY:12]; "TempSet")
							SD2_DiaryVIewManageView(-1)
							
							
						End if 
					End if 
					MESSAGES ON:C181
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Set"))
					If (Substring:C12(<>ButtDis; 11; 1)#"S")
						
						
						//************ added 04/07/08 -kmw (this is just my best guess on expected behaviour of set functionality) **********
						SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //just make the currently highlighted ones the current selection
						If (Records in selection:C76([DIARY:12])=0)
							SD2_DiaryViewManageSelectionNEW(True:C214; True:C214)  //make them all the current selection
						End if 
						//******************************************************************************************************************
						Gen_ListSet("Temp"; ->[DIARY:12])
						
						
						
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Report"))  // | (oReport=1))
					// oReport:=0
					//  If (Not(In_ButtSilver ))
					//Get the records
					//Get all the selections loaded first
					
					//SD2_DiaryViewManageSelection (False;True)  `kmw 30/06/08 - once again this call was wrong way around (was  trying to do graph on UNhighlighted records) and old method broken anyway so changed to use new one
					CREATE SET:C116([DIARY:12]; "TempSet")  //added 30/06/08- kmw 30/06/08
					SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //changed to this from old (and corrected parameter order)  - kmw 30/06/08
					
					If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
						Gen_ListReport(->[DIARY:12]; "Diary_Sel")
					End if 
					// End if
					USE SET:C118("TempSet")  //added kmw 30/06/08
					CLEAR SET:C117("TempSet")  //added kmw 30/06/08
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Graph"))  //| (oGraph=1))
					// oGraph:=0
					//  If (Not(In_ButtSilver ))
					
					//SD2_DiaryViewManageSelection (False;True)  `kmw 30/06/08 - once again this call was wrong way around (was  trying to do graph on UNhighlighted records) and old method broken anyway so changed to use new one
					CREATE SET:C116([DIARY:12]; "TempSet")  //added 30/06/08- kmw 30/06/08
					SD2_DiaryViewManageSelectionNEW(True:C214; False:C215)  //changed to this from old (and corrected parameter order) - kmw 30/06/08
					
					If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
						Gen_ListGraph(->[DIARY:12])
						
					End if 
					//  End if
					USE SET:C118("TempSet")  //added kmw 30/06/08
					CLEAR SET:C117("TempSet")  //added kmw 30/06/08
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Apply"))
					If (Substring:C12(vButtDisO; 15; 1)#"A")
						
						//SD2_DiaryViewManageSelection (False;True)`commented out kmw 30/06/08 -was using old broken method and also it was passing incorrect params anyway (in theory even if broken method worked then this call was trying to set UNhighlighted items as the current selection)
						
						//************************************************* added kmw 30/06/08 *************************************************
						SD2_DiaryViewManageSelectionNEW(False:C215; False:C215)  //Make sure ALL items are rememebered so we can set them as current selection later
						CREATE SET:C116([DIARY:12]; "TempSet")  //Make sure ALL items are rememebered so we can set them as current selection later
						SD2_DiaryViewManageSelectionNEW(True:C214)  //Only set highlighted items as current selection
						//*************************************************************************************************************************
						Gen_ListApply(Table:C252(->[DIARY:12]); ->[DIARY:12]Diary_Code:3)
						//kmw 30/06/08 - !!! During testing still getting possible problem in that the above method is displaying an alert to me saying I don't have access....could be dead right taht i don't have access or couyld be symptomatic of something such as a missing call to set up access rights (see also my comment today in "SD2_Diary_Mod")
						USE SET:C118("TempSet")  //added kmw 30/06/08
						SD2_DiaryVIewManageView(-1)  //kmw 30/06/08 decided to leave it re-doing the view as the apply may have changed teh data so this makes sense.
						CLEAR SET:C117("TempSet")  //added kmw 30/06/08
						
					End if 
					// FS_SetFormSort (WIN_t_CurrentOutputform)
				: ($_l_ButtonPressed=DB_GetButtonFunction("Count"))
					If (Substring:C12(<>ButtDis; 14; 1)#"C")
						SD2_DiaryViewManageSelection(False:C215; True:C214)
						CREATE SET:C116([DIARY:12]; "TEMP")
						Gen_Count(->[DIARY:12]; "TEMP")
						Diary_OutCount
						//$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace (<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
						
						//EXECUTE METHOD($_t_ExecuteMethodName)
						Gen_Alert(vText; "")
						
						
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Tel"))
					If (Substring:C12(<>ButtDis; 17; 1)#"T")
						$_ptr_CompanyCode:=->[DIARY:12]Company_Code:1
						$_ptr_ContactCode:=->[DIARY:12]Contact_Code:2
						Gen_ShowTelOut($_ptr_CompanyCode; $_ptr_ContactCode)
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("Diary"))
					If (Substring:C12(<>ButtDis; 16; 1)#"D")
						
						SD2_DiaryViewManageSelection(True:C214)
						If (Records in selection:C76([DIARY:12])=1)
							$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
							$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
							$_Ptr_KeyField:=SD2_aptr_ListControl{8}
							$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
							If ($_l_KeyPosition>0)  //it should be
								$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
							End if 
							For ($_l_IndexLine; 1; Size of array:C274($_Ptr_ThisColumnArray->))
								$_l_ModuleRow:=Find in array:C230($_al_CurrentSelection; $_l_IndexLine)
								If ($_l_ModuleRow>0)
									If ($_l_KeyPosition>0)
										APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_ThisColumnArray->{$_l_IndexLine})
									End if 
								End if 
							End for 
							If (Size of array:C274($_at_DiaryRecordCodes)>0)
								//Because here i know what we are searching we can hard code this
								QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryRecordCodes)
							End if 
							FurthFld_Func2(->[DIARY:12])
						Else 
							Gen_Alert("Please first select a record for which you want to View Further Fields"; "Try again")
						End if 
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("M:"))
					$_t_ClickedFunction:=DB_T_ButtonClickedFunction
					DB_T_ButtonClickedFunction:=""
					If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
						Macro(Substring:C12($_t_ClickedFunction; 3; 15))  //Play a Macro - Called by Record_FKey
					End if 
					
				: ($_l_ButtonPressed=DB_GetButtonFunction("-1"))
					$_t_ClickedFunction:=DB_T_ButtonClickedFunction
					DB_T_ButtonClickedFunction:=""
					
					If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
						If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
							$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
							DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
							$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 5; 15))
							EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 5; 15))
							DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
						Else 
							$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 3; 15))
							EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
						End if 
					End if 
				: ($_l_ButtonPressed=DB_GetButtonFunction("SPshow"))  //show sales pipeline
					ZSalesPipeline
				: ($_l_ButtonPressed=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
					COPY NAMED SELECTION:C331([DIARY:12]; "CurrentSortedSelection")
					ARRAY LONGINT:C221($_al_CurrentSelection; 0)
					LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
					If (Size of array:C274($_al_CurrentSelection)>0)
						
						For ($_l_IndexLine; 1; Size of array:C274($_Ptr_ThisColumnArray->))
							$_l_ModuleRow:=Find in array:C230($_al_CurrentSelection; $_l_IndexLine)
							If ($_l_ModuleRow>0)
								If ($_l_KeyPosition>0)
									APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_ThisColumnArray->{$_l_IndexLine})
								End if 
							End if 
						End for 
						If (Size of array:C274($_at_DiaryRecordCodes)>0)
							//Because here i know what we are searching we can hard code this
							QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryRecordCodes)
						End if 
						SP_EnterRelatedPipeline(->[DIARY:12])
					Else 
						
						$_l_PipelineProcess:=New process:C317("SP_NewPipeline"; 32000; "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
						// USE NAMED SELECTION("Current")
					End if 
					
			End case 
			
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="SD2_l_IncludeFuture") | ($_t_VariableName="SD2_l_IncludeOverdue")
				SET TIMER:C645(0)
				
				
				SD2_GetWorkflowActions(->SD2_at_SelectedWorflowOwners; SD2_l_IncludeOverdue; SD2_l_IncludeFuture)
				SET TIMER:C645(60*60*2)
			Else 
				If (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				Else 
					If (BAR_t_Button#"")
						
						$_l_ButtonNumber:=Num:C11(BAR_t_Button)
						If ($_l_ButtonNumber>1)
							ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
							$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
							SET MENU BAR:C67(9)
							
							DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
							DB_t_CUrrentMenuReference:=Get menu bar reference:C979
							If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
								For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
									INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
								End for 
							End if 
						End if 
						BAR_t_Button:=""
						
						
					End if 
				End if 
				
		End case 
		
	: ($_l_event=On Data Change:K2:15)
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_WorkflowViewer"; $_t_oldMethodName)
