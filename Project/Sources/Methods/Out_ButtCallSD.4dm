//%attributes = {}
If (False:C215)
	//Project Method Name:      Out_ButtCallSD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>NoStart)
	//C_UNKNOWN(<>UserAdd)
	//C_UNKNOWN($1)
	//C_UNKNOWN($10)
	//C_UNKNOWN($11)
	//C_UNKNOWN($12)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($6)
	//C_UNKNOWN($7)
	//C_UNKNOWN($8)
	//C_UNKNOWN(oOK)
	//C_UNKNOWN(vButtDisO)
	//C_UNKNOWN(vMod2)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vNo2)
	//C_UNKNOWN(vSNo)
	//C_UNKNOWN(vT)
	//C_UNKNOWN(vText)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_Query;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_InRecordListing; $_bo_ProcessVisible; DB_bo_InRecordListing; DB_bo_RecordModified; SD_bo_AddingDiaryRecord; SD_bo_AlarmsEnd; SD_bo_SearchDone; vMod2; <>SYS_bo_CurrentWindowModal; $_bo_InRecordListing; $_bo_ProcessVisible)
	C_BOOLEAN:C305(DB_bo_InRecordListing; DB_bo_RecordModified; SD_bo_AddingDiaryRecord; SD_bo_AlarmsEnd; SD_bo_SearchDone)
	C_DATE:C307(SD_d_StartDate; SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283(<>NoStart; <>SCPT_l_PaletteWIndow; <>WT_SortFieldName_2; $_l_CountListItems; $_l_CurrentEventRow; $_l_CurrentTodoListRow; $_l_itemReference2; $_l_MonitorCall; $_l_PressedButton; $_l_PriorityNUM_Elem; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_QueryRow; $_l_SelectedListItem2; $_l_TableNumber; $11; $12; DB_l_ButtonClickedFunction; FS_l_FieldType; FS_l_SortDirection; FS_l_SortTableNUM; oOK)
	C_LONGINT:C283(SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_HLDayTime; SM_l_MonitorCall; SM_l_UpdateOnCallBackID; vNo; vNo2; vSNo; <>newSetsProcess; <>SCPT_l_PaletteWIndow; $_l_CountListItems)
	C_LONGINT:C283($_l_CurrentEventRow; $_l_CurrentTodoListRow; $_l_itemReference2; $_l_MonitorCall; $_l_PressedButton; $_l_PriorityNUM_Elem; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_QueryRow; $_l_SelectedListItem2)
	C_LONGINT:C283($_l_TableNumber; DB_l_ButtonClickedFunction; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_HLDayTime; SM_l_MonitorCall; SM_l_UpdateOnCallBackID; WS_l_CachedSelectionName)
	C_POINTER:C301($_ptr_Field2; $1; $2; $3; BUT_p_ButtonStringPointer; $_ptr_Field1; $_ptr_Field2; BUT_p_ButtonStringPointer)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>UserAdd; $_t_ClickedFunction; $_t_CompanyCode; $_t_ContactCode; $_t_CurrentFormUsage; $_t_DiaryCode; $_t_ExecuteMethodName; $_t_ItemText2; $_t_oldMethodName; $_t_processName)
	C_TEXT:C284($_t_SDAlarmProcName; $_t_SDProcName; $_t_SetName; $10; $4; $5; $6; $7; $8; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; FS_t_SortFieldTXT; FS_t_SortVariableName; SD_t_CurrentDiaryInitials; SM_t_UseSetName; vButtDisO; vT; vText; WIN_t_CurrentOutputform)
	C_TEXT:C284(WT_t_SortFieldVARNAME; <>ButtDis; <>PER_t_CurrentUserInitials; $_t_ClickedFunction; $_t_CompanyCode; $_t_ContactCode; $_t_CurrentFormUsage; $_t_DiaryCode; $_t_ExecuteMethodName; $_t_ItemText2; $_t_oldMethodName)
	C_TEXT:C284($_t_oldMethodName2; $_t_ProcessName; $_t_SDAlarmProcName; $_t_SDProcName; $_t_SetName; $9; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; FS_t_SortFieldTXT; FS_t_SortVariableName)
	C_TEXT:C284(SD_t_CurrentDiaryInitials; SM_t_UseSetName; vSelPrev; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Out_ButtCallSD")


//1= File ptr  2= Code ptr  3= Name ptr
//4= In layout prefix  5= Entry proc  6= Sel proc
//7= Del proc  8= Set Name  9= Window name & for Deletions OR ... xAny Diary proce
//10= Count proc  11= Co Code field no for Tel  12= Contact_Code field no for Tel

If (Current process:C322=Frontmost process:C327(*)) | (True:C214)
	$_l_PressedButton:=DB_l_ButtonClickedFunction
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
					COPY NAMED SELECTION:C331($1->; "CurrentSortedSelection")
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
					PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
					If ($_l_ProcessState>=0)  // 30/05/02 pb
						SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_MonitorCall)
						SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
					End if 
					USE NAMED SELECTION:C332("CurrentSortedSelection")
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=2)  //here we are passed a set
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					
					INTERSECTION:C121(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					
					
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID>0)  //the list has to be updated
						CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						End if 
					End if 
					WS_l_CachedSelectionName:=0
					SD_DIARYSELECTIONMANAGER
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=3)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					UNION:C120(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID>0)  //the list has to be updated
						CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						End if 
					End if 
					WS_l_CachedSelectionName:=0
					CLEAR SEMAPHORE:C144("$SetInuse")
					SD_DIARYSELECTIONMANAGER
				: ($_l_MonitorCall=4)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					DIFFERENCE:C122(SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])); "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID>0)  //the list has to be updated
						CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						End if 
					End if 
					WS_l_CachedSelectionName:=0
					CLEAR SEMAPHORE:C144("$SetInuse")
					SD_DIARYSELECTIONMANAGER
				: ($_l_MonitorCall=5)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116([DIARY:12]; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					DIFFERENCE:C122("TempSet"+String:C10(Table:C252(->[DIARY:12])); SM_t_UseSetName; "TempSet"+String:C10(Table:C252(->[DIARY:12])))
					USE SET:C118("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252(->[DIARY:12])))
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID>0)  //the list has to be updated
						CREATE SET:C116([DIARY:12]; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
						End if 
					End if 
					WS_l_CachedSelectionName:=0
					CLEAR SEMAPHORE:C144("$SetInuse")
					SD_DIARYSELECTIONMANAGER
				: ($_l_MonitorCall=6)
					//load a set from disk
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					LOAD SET:C185([DIARY:12]; "TempSet"; "")
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						If ($8#"")
							CREATE SET:C116($1->; $8)
						End if 
						FS_SetFormSort(WIN_t_CurrentOutputform)
					End if 
					USE SET:C118("TempSet")
					CLEAR SET:C117("TempSet")
					//no need to call the set manager back
					WS_l_CachedSelectionName:=0
					CLEAR SEMAPHORE:C144("$SetInuse")
					SD_DIARYSELECTIONMANAGER
				: ($_l_MonitorCall=8)
					//save the current selection as a set on disk
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					CREATE SET:C116([DIARY:12]; "TempSet")
					SAVE SET:C184("TempSet"; "")
					FS_SetFormSort(WIN_t_CurrentOutputform)
					CLEAR SET:C117("TempSet")
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=7)
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					
					//list passed from list manager
					USE SET:C118("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					FS_SetFormSort(WIN_t_CurrentOutputform)
					CLEAR SET:C117("<>SaveSet"+String:C10(Table:C252(->[DIARY:12])))
					//no need to call the set manager back
					WS_l_CachedSelectionName:=0
					CLEAR SEMAPHORE:C144("$SetInuse")
					SD_DIARYSELECTIONMANAGER
			End case 
			
		: (($_l_PressedButton=DB_GetButtonFunction("OK")) | (oOK=1))
			
			If (False:C215)
				FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			End if 
			
			oOK:=0
			If (SD_bo_AddingDiaryRecord) | (SD_RecordModified(->[DIARY:12]))
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk(False:C215)
				Else 
					SD_Saverecord
					
				End if 
			Else 
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				If (SD_t_DiaryDefaultUser=<>PER_t_CurrentUserInitials)
					SD_CLOSE
				Else 
					//check process is running
					$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
					If ($_l_ProcessNumber>0) & ($_l_ProcessNumber#Current process:C322)
						//the default user superdiary is already open so here we are looking at a second w
						//window
						//so end the process
						//and call the  "Diary reminders "+SD_t_DiaryDefaultUser process to end
						$_t_SDAlarmProcName:="Diary reminders "+SD_t_CurrentDiaryInitials
						$_l_ProcessNumber:=Process number:C372($_t_SDAlarmProcName)
						If ($_l_ProcessNumber>0)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
							If ($_l_ProcessState>=0)  // 30/05/02 pb
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_bo_AlarmsEnd; True:C214)
							End if 
						End if 
						CANCEL:C270
					Else 
						SD_CLOSE
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Cancel"))  // | (oCancel=1))
			
			If (False:C215)
				FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			End if 
			//  oCancel:=0
			If (SD_bo_AddingDiaryRecord)
				SD_DiaryCancelEntry
			Else 
				If (SD_t_DiaryDefaultUser=<>PER_t_CurrentUserInitials)
					SD_CLOSE
				Else 
					//check process is running
					$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
					If ($_l_ProcessNumber>0) & ($_l_ProcessNumber#Current process:C322)
						//the default user superdiary is already open so here we are looking at a second w
						//window
						//so end the process
						//and call the  "Diary reminders "+SD_t_DiaryDefaultUser process to end
						$_t_SDAlarmProcName:="Diary reminders "+SD_t_CurrentDiaryInitials
						$_l_ProcessNumber:=Process number:C372($_t_SDAlarmProcName)
						If ($_l_ProcessNumber>0)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
							If ($_l_ProcessState>=0)  // 30/05/02 pb
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_bo_AlarmsEnd; True:C214)
							End if 
						End if 
						CANCEL:C270
						
					Else 
						SD_CLOSE
					End if 
				End if 
			End if 
			
			
			OK:=0
			
		: ($_l_PressedButton=DB_GetButtonFunction("Close"))
			
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
			DB_t_CallOnCloseorSave:=""
			Close_Process
			FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			
		: ($_l_PressedButton=DB_GetButtonFunction("Plus"))  //| (oPlus=1))
			//  oPlus:=0
			If ((Substring:C12(vButtDisO; 4; 1)#"P") & (Substring:C12(BUT_p_ButtonStringPointer->; 4; 1)#"P"))
				If ($5="Minor_In") | ($5="DB_MenuNewRecord")
					$_bo_InRecordListing:=DB_bo_InRecordListing
					DB_bo_InRecordListing:=True:C214
					$_l_TableNumber:=Table:C252($1)
					DB_MenuNewRecord(String:C10($_l_TableNumber))
					DB_bo_InRecordListing:=$_bo_InRecordListing
					
				Else 
					<>NoStart:=1
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$5)
					EXECUTE FORMULA:C63($5)
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Delete"))
			If (Substring:C12(<>ButtDis; 3; 1)#"D")
				//Delete a diary item
				//which item
				//the currently selected item
				
				Case of 
					: ($7="Minor_DelEx")
						Minor_DelEx($1; $2; $4)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_Del")
						//if we are viewing personnel
						//we will not delete it=just soft delete
						Minor_Del($1)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelCU")
						Minor_DelCU($1; $2)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelSet")
						Minor_DelSet($1; $8)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelSetEx")
						Minor_DelSetEx($1; $2; $4; $8)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelExCU")
						Minor_DelExCU($1; $2; $4)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelNoCan")
						Minor_DelNoCan($1)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						If ($7#"")
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$7)
							EXECUTE FORMULA:C63($7)
							FS_SetFormSort(WIN_t_CurrentOutputform)
						End if 
				End case 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Select")) | ($_l_PressedButton=DB_GetButtonFunction("SelcectO"))
			//    oSelect:=0
			If (Substring:C12(<>ButtDis; 10; 1)#"S")
				If ((Gen_Option) | ($_l_PressedButton=DB_GetButtonFunction("SelectO")))
					If (Records in set:C195("Userset")>0)
						If ($8#"")
							
							CREATE SET:C116($1->; "Cset")
							USE SET:C118("Userset")
							CREATE SET:C116($1->; "Cset2")
							DIFFERENCE:C122("Cset"; "Cset2"; "Cset")
							USE SET:C118("Cset")
							CLEAR SET:C117("Cset")
							CREATE SET:C116($1->; $8)
						Else 
							CREATE SET:C116($1->; "Master")
							DIFFERENCE:C122("Master"; "Userset"; "Master")
							USE SET:C118("Master")
						End if 
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						WS_l_CachedSelectionName:=0
						SD_DIARYSELECTIONMANAGER
						
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						Gen_Alert("Please first highlight records to Remove from the Selection"; "Try again")
					End if 
				Else 
					If (Records in set:C195("Userset")>0)
						USE SET:C118("Userset")
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						If ($8#"")
							CREATE SET:C116($1->; $8)
						End if 
						WS_l_CachedSelectionName:=0
						SD_DIARYSELECTIONMANAGER
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						Gen_Alert("Please first highlight records to Select"; "Try again")
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Find")) | ($_l_PressedButton=DB_GetButtonFunction("FindO"))
			//   oSearch:=0
			SD_bo_SearchDone:=False:C215
			If (Substring:C12(<>ButtDis; 9; 1)#"F")
				If (Not:C34(In_ButtSilver))
					DB_bo_RecordModified:=False:C215
					vMod2:=False:C215
					COPY NAMED SELECTION:C331($1->; "Selection")
					If ($6="Minor_Sel")
						vSelPrev:=""
						Minor_Sel($1; $2; $3)
					Else 
						If ((Gen_Option) | ($_l_PressedButton=DB_GetButtonFunction("FindO")))
							vSelPrev:=" FSC"
						Else 
							vSelPrev:=""
						End if 
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$6)
						EXECUTE FORMULA:C63($6)
					End if 
					If (Records in selection:C76($1->)>0)
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						If ($8#"")
							CREATE SET:C116($1->; $8)
						End if 
						
					Else 
						USE NAMED SELECTION:C332("Selection")
						If (($9#"") & ($9#"@any@"))
							Gen_Alert("No "+$9+" found - the selection is unchanged"; "OK")
						Else 
							Gen_Alert("No "+$4+" found - the selection is unchanged"; "OK")
						End if 
					End if 
					CLEAR NAMED SELECTION:C333("Selection")
					vNo:=Records in selection:C76($1->)
				End if 
			End if 
			WS_l_CachedSelectionName:=0
			If (SD_bo_SearchDone)
				SD_DIARYSELECTIONMANAGER
				
				FS_SetFormSort(WIN_t_CurrentOutputform)
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Sort"))  //| (oSort=1))
			//  oSort:=0
			If (Records in selection:C76($1->)<100)
				MESSAGES OFF:C175
			End if 
			If (Substring:C12(<>ButtDis; 12; 1)#"S")
				<>SYS_bo_CurrentWindowModal:=True:C214
				MESSAGES OFF:C175
				SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
				ORDER BY:C49($1->)
				SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				MESSAGES ON:C181
				<>SYS_bo_CurrentWindowModal:=False:C215
				If (OK=1)
					vNo2:=Records in selection:C76($1->)
				End if 
			End if 
			MESSAGES ON:C181
			
		: ($_l_PressedButton=DB_GetButtonFunction("Set"))
			If (Substring:C12(<>ButtDis; 11; 1)#"S")
				If (Not:C34(In_ButtSilver))
					If ($8="")
						Gen_ListSet("Master"; ->[DIARY:12])
					Else 
						Gen_ListSet($8; ->[DIARY:12])
					End if 
				End if 
			End if 
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_PressedButton=DB_GetButtonFunction("Report"))
			// | (oReport=1))
			// oReport:=0
			CREATE SET:C116([DIARY:12]; "PrintSet")
			//  If (Not(In_ButtSilver ))
			If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
				Gen_ListReport($1; $6; $8)
			End if 
			// End if
			FS_SetFormSort(WIN_t_CurrentOutputform)
			USE SET:C118("PrintSet")
		: ($_l_PressedButton=DB_GetButtonFunction("Graph"))  //| (oGraph=1))
			// oGraph:=0
			//  If (Not(In_ButtSilver ))
			If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
				Gen_ListGraph($1)
			End if 
			//  End if
			
			FS_SetFormSort(WIN_t_CurrentOutputform)
			
		: ($_l_PressedButton=DB_GetButtonFunction("Apply"))
			If (Substring:C12(vButtDisO; 15; 1)#"A")
				If ((Gen_Option) & (Table:C252($1)=24) & (<>UserAdd="@BWB@"))
					Orders_BWBEx
				Else 
					Gen_ListApply(Table:C252($1); $2)
				End if 
			End if 
			// FS_SetFormSort (WIN_t_CurrentOutputform)
		: ($_l_PressedButton=DB_GetButtonFunction("Count"))
			If (Substring:C12(<>ButtDis; 14; 1)#"C")
				If ($8#"")
					$_t_SetName:=$8
				Else 
					$_t_SetName:="Master"
				End if 
				Gen_Count($1; $_t_SetName)
				If (Substring:C12($10; 1; 1)="&")  //Execute without displaying in Alert windows
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($10; 2; 32000))
					EXECUTE FORMULA:C63(Substring:C12($10; 2; 32000))
				Else 
					If ($10#"")
						If (Substring:C12($10; 1; 1)="*")
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($10; 2; 32000))
							EXECUTE FORMULA:C63(Substring:C12($10; 2; 32000))
						Else 
							//$_t_oldMethodName2:=ERR_MethodTracker ("Execute: "+$10)
							//EXECUTE FORMULA($10)
							$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($10)
							EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						End if 
					End if 
					If (Substring:C12($10; 1; 1)="*")
						Gen_Alert2Col(vText; ""; vT)
						
					Else 
						Gen_Alert(vText; "")
					End if 
				End if 
				If (vSNo>0)
					USE NAMED SELECTION:C332($_t_SetName)
					CLEAR NAMED SELECTION:C333($_t_SetName)
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Tel"))
			If (Substring:C12(<>ButtDis; 17; 1)#"T")
				If (($11>0) | ($12>0))
					If ($11=0)
						$_ptr_Field1:=->[CONTACTS:1]Company_Code:1
					Else 
						$_ptr_Field1:=Field:C253(Table:C252($1); $11)
					End if 
					If ($12=0)
						$_ptr_Field2:=->[CONTACTS:1]Contact_Code:2
					Else 
						$_ptr_Field2:=Field:C253(Table:C252($1); $12)
					End if 
					//    Gen_ShowTelOut ($_ptr_Field1;$_ptr_Field2)
					If ([DIARY:12]Diary_Code:3#"")
						$_t_CompanyCode:=[DIARY:12]Company_Code:1
						$_t_ContactCode:=[DIARY:12]Contact_Code:2
						
						Gen_ShowTel($_t_CompanyCode; $_t_ContactCode)
						[DIARY:12]Company_Code:1:=$_t_CompanyCode
						[DIARY:12]Contact_Code:2:=$_t_ContactCode
						
					Else 
						Gen_ShowTelOut($_ptr_Field1; $_ptr_Field2)
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Diary"))
			If (Substring:C12(<>ButtDis; 16; 1)#"D")
				If ([DIARY:12]Diary_Code:3#"")
					FurthFld_Func2($1)
					
				Else 
					Gen_Alert("Please first select a record for which you want to View Further Fields"; "Try again")
				End if 
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("QVShow"))
			
			QV_CallQualities(Table:C252(->[DIARY:12]); [DIARY:12]x_ID:50; Read only state:C362([DIARY:12]))
			
		: ($_l_PressedButton=DB_GetButtonFunction("M:"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			If ($_t_ClickedFunction#"")
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					If ($_t_ClickedFunction="F:@")  //So F key functions dont think they are called from the palette
						Macro(Substring:C12($_t_ClickedFunction; 3; 15))
					Else 
						Macro(Substring:C12($_t_ClickedFunction; 3; 15); ""; ""; <>SCPT_l_PaletteWIndow)  //Play a Macro -
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("-1"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:="'"
			If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
				If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 5; 15))
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 5; 15))
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 3; 15))
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
				End if 
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("SPshow"))  //show sales pipeline
			//    If (Records in set("Userset")=1)
			//  USE SET("UserSet")
			// End if
			ZSalesPipeline
		: ($_l_PressedButton=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
			SP_EnterRelatedPipeline($1)
		: ($_l_PressedButton=DB_GetButtonFunction("Refresh"))
			If (WS_at_DiaryVIewTab<4) & (Not:C34(SD_RecordModified(->[DIARY:12]))) & (Not:C34(SD_bo_AddingDiaryRecord)) & (SD_l_EditingDiaryRecord=0)  //& (Current process=Frontmost process(*))
				//only if we are not viewing a specific range
				//and we are not editing a record
				
				PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
				If ($_bo_ProcessVisible)
					$_t_DiaryCode:=[DIARY:12]Diary_Code:3
					$_l_CurrentEventRow:=SD_at_Events
					$_l_CurrentTodoListRow:=SD_at_ToDoList
					$_l_QueryRow:=SD_at_Query
					
					$_l_CountListItems:=Count list items:C380(SD_l_HLDayTime)
					$_l_SelectedListItem2:=Selected list items:C379(SD_l_HLDayTime)
					GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem2; $_l_itemReference2; $_t_ItemText2)
					SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
					SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
					If ($_t_DiaryCode#"")
						//we had a record loaded-reload it
						QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
						SD_SetSplitter(->SD_l_DescriptionSplitter)
						SD_SetVisible(False:C215)
						RELATE ONE:C42([DIARY:12]Company_Code:1)
						WT_hl_DiaryDETAIL2
						SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
						If (Records in selection:C76([DIARY:12])>0)
							DB_MenuAction("Document"; ""; 2; "")
							$_l_PriorityNUM_Elem:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
							If ($_l_PriorityNUM_Elem>0)
								SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityNUM_Elem}
							End if 
							If ([DIARY:12]Done:14=True:C214)
								
								READ WRITE:C146([DIARY:12])
								LOAD RECORD:C52([DIARY:12])
								OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
							Else 
							End if 
						End if 
						
					End if 
					SD_at_Events:=$_l_CurrentEventRow
					SD_at_ToDoList:=$_l_CurrentTodoListRow
					SD_at_Query:=$_l_QueryRow
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_itemReference2)
					
				End if 
			End if 
			If (Current process:C322=Frontmost process:C327(*))
				vButtDisO:="O        S S   D "
				Out_Buttons(->[DIARY:12])
				
			End if 
			
	End case 
	
	//◊Option:=False
End if 
//dont call the following if it was cancel or OK bubtton
If ($_l_PressedButton#DB_GetButtonFunction("OK")) & ($_l_PressedButton#DB_GetButtonFunction("Cancel"))
	If (WIN_t_CurrentOutputform#"Superdiary")
		Out_SetManger(->[DIARY:12])
	Else 
		In_SetManager
	End if 
End if 
ERR_MethodTrackerReturn("Out_ButtCallSD"; $_t_oldMethodName)
