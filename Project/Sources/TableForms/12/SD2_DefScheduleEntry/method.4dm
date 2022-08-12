If (False:C215)
	//Table Form Method Name: [DIARY]SD2_DefScheduleEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	C_BOOLEAN:C305(<>StatsSwitch; $_bo_Highlight; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; SD_bo_NewRecord; SD_bo_SaturdayWork; SD_bo_SundayWork; SD2_bo_InviteesBoxDone)
	C_DATE:C307($_d_StartDate; SD2_D_DisplayDateFrom; SD2_D_DisplayDateTo)
	C_LONGINT:C283(<>newSetsProcess; <>WT_SortFieldName_2; $_l_ButtonNumber; $_l_ButtonPressed; $_l_event; $_l_EventCall; $_l_Index; $_l_KeyPosition; $_l_LineIndex; $_l_ModuleRow; $_l_MonitorCall)
	C_LONGINT:C283($_l_Nul; $_l_OutCallBack; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_TableNumber; DB_l_ButtonClickedFunction; DB_l_OutCallBack; DB_l_WindowCurrentModule; ModuleNumber; oOK)
	C_LONGINT:C283(PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; SD_l_CountTimes; SD_l_CurrentTab; SD2_l_EventCall; SD2_l_IgnoreStdMacros; SD2_l_ShowDate2; SM_l_MonitorCall; SM_l_TableNumber)
	C_LONGINT:C283(SM_l_UpdateOnCallBackID; vNo; vNo2)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray; $p1; $p2; SD2_ptr_LastObject; SD2_ptr_SearchField)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_ProcessName; $Lay; $SET; BAR_t_Button; DB_t_CallOnCloseorSave; DB_t_CUrrentInputMenuRef; FS_t_SortFieldTXT; FS_t_SortVariableName; PAL_BUTTON)
	C_TEXT:C284(SD2_t_CreateActionCode; SD2_t_SRCH_Text; SD2_t_SRCH_TextOLD; SM_t_UseSetName; vButtDisDry; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY]SD2_DefScheduleEntry"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Resize:K2:27)
		//LBI_Scrollonresize (->e_LB_SI)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		//TRACE
		SD2_bo_InviteesBoxDone:=False:C215
		$_l_event:=Form event code:C388
		$_l_Nul:=0
		SD2_ptr_LastObject:=->$_l_Nul
		
		OpenHelp(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
		//This form is ONE of a series of forms for entering diary items..
		SD2_l_ShowDate2:=0
		SD_l_CountTimes:=0
		SD_l_CurrentTab:=0
		//SD_bo_NewRecord:=False
		If ([DIARY:12]Action_Code:9="")
			//SD_bo_NewRecord:=True
			If (SD2_t_CreateActionCode#"")  //This is so a predined code can be got from parent method is required
				[DIARY:12]Action_Code:9:=SD2_t_CreateActionCode
			End if 
		End if 
		//In this form-and probably others there need to be some clever manipulation.
		//Invites can be internal(personnel) or external(contacts)
		//The field PERSON is not displayed-the person is never changed and is alway set to the creator-who is the only one that can change it of course!
		//we also need to handle in the diary reminders responding to invites within Daybook in a non-ical way. Invites will only be emailed to external contacts
		//we need to provide a way to also send them to internal.
		//we also need to be able to add invitees that are not on the database(enter email address) and create the contact that way(an address book!)
		SD2_LoadDiary("SD2_DefScheduleEntry")  // ([DIARY]Action Code)  `This same method is called from all diary loading forms.
		//DB_SetFormButtonOptions (vButtDisPriceTable)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		//NEEDS BUTTONS SET
		
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Resize:K2:27)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				
				If (SD2_l_EventCall=0)
					
					
					
					//;$4;$5;$6;$7;$8)
					//C_POINTER($1;$8;$3)
					//TRACE
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
												
												For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
													$_l_ModuleRow:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
													If ($_l_ModuleRow>0)
														If ($_l_KeyPosition>0)
															APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
											DelayTicks($_l_Retries*2)
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
								//Here we have to save the diary record values from any variables on screen and reset 'flag' values
								oOK:=0
								CANCEL:C270
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Cancel"))  // | (oCancel=1))
								//here we have to reset flag values and clear any variables
								//  oCancel:=0
								CANCEL:C270
								OK:=0
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Close"))
								//This works by recalling with the 'butt press' so no need to modify
								DB_t_CallOnCloseorSave:=""
								Close_Process
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Plus"))  //| (oPlus=1))
								//This is only relevant in threaded diary items where it allows the addition of an additional item in a thread
								//  oPlus:=0
								//SD2_AddRecord
								//if a line is selected to we use the company/contact codes?
								
								
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Delete"))
								If (Substring:C12(vButtDisDry; 3; 1)#"D")
									//Delete selected record(s)
								End if 
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Select"))  // | (oSelect=1))
								//    oSelect:=0
								//Not relevant except in threaded items where it may be used to subselect some items in the thread
							: ($_l_ButtonPressed=DB_GetButtonFunction("QVSearch"))
								
								//not relevant
								//Cache_Update
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Find"))  //| (oSearch=1))
								//not relevant
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Sort"))  //| (oSort=1))
								//Not relevant
								
								
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Set"))
								//not relvant
								
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Report"))  // | (oReport=1))
								//this is relevant when it is a threaded item
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Graph"))  //| (oGraph=1))
								//this could be relevant in a threaded item
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Apply"))
								//This could be relevant in a threaded item
							: ($_l_ButtonPressed=DB_GetButtonFunction("Count"))
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Tel"))
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("Diary"))
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("M:"))
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("-1"))
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("SPshow"))  //show sales pipeline
								
							: ($_l_ButtonPressed=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
								
								
						End case 
						
					End if 
				Else 
					//Call to update something
					$_l_EventCall:=SD2_l_EventCall
					SD2_l_EventCall:=0
					Case of 
						: ($_l_EventCall=13)
							
							
						: ($_l_EventCall=11)
							If (SD2_D_DisplayDateFrom#!00-00-00!)
								[DIARY:12]Display_Date_From:51:=SD2_D_DisplayDateFrom
								If ([DIARY:12]Display_Date_To:52<[DIARY:12]Display_Date_From:51)
									[DIARY:12]Display_Date_To:52:=[DIARY:12]Display_Date_From:51
								End if 
								SD2_D_DisplayDateFrom:=!00-00-00!
							End if 
							If (SD2_D_DisplayDateTo#!00-00-00!)
								[DIARY:12]Display_Date_To:52:=SD2_D_DisplayDateTo
								If ([DIARY:12]Display_Date_To:52<[DIARY:12]Display_Date_From:51)
									[DIARY:12]Display_Date_From:51:=[DIARY:12]Display_Date_To:52
								End if 
								SD2_D_DisplayDateTo:=!00-00-00!
							End if 
						: ($_l_EventCall=16)
							If (SD2_D_DisplayDateFrom#!00-00-00!)
								[DIARY:12]Display_Date_From:51:=SD2_D_DisplayDateFrom
								If ([DIARY:12]Display_Date_To:52<[DIARY:12]Display_Date_From:51)
									[DIARY:12]Display_Date_To:52:=[DIARY:12]Display_Date_From:51
								End if 
								SD2_D_DisplayDateFrom:=!00-00-00!
								$_d_StartDate:=[DIARY:12]Display_Date_From:51
								For ($_l_Index; 1; 7)
									Case of 
										: (Day number:C114($_d_StartDate)=7) & (SD_bo_SaturdayWork)  //saturday is a working day
											[DIARY:12]Display_Date_To:52:=$_d_StartDate
											$_l_Index:=77
										: (Day number:C114($_d_StartDate)=6)
											[DIARY:12]Display_Date_To:52:=$_d_StartDate
											$_l_Index:=77
										Else 
											$_d_StartDate:=$_d_StartDate+1
									End case 
								End for 
								
							End if 
							If (SD2_D_DisplayDateTo#!00-00-00!)
								[DIARY:12]Display_Date_To:52:=SD2_D_DisplayDateTo
								If ([DIARY:12]Display_Date_To:52<[DIARY:12]Display_Date_From:51)
									[DIARY:12]Display_Date_From:51:=[DIARY:12]Display_Date_To:52
								End if 
								SD2_D_DisplayDateTo:=!00-00-00!
								$_d_StartDate:=[DIARY:12]Display_Date_To:52
								For ($_l_Index; 1; 7)
									Case of 
										: (Day number:C114($_d_StartDate)=2) & (Not:C34(SD_bo_SundayWork))  //Sunday  is NOT a working day
											[DIARY:12]Display_Date_From:51:=$_d_StartDate
											$_l_Index:=77
										: (Day number:C114($_d_StartDate)=1)
											[DIARY:12]Display_Date_From:51:=$_d_StartDate
											$_l_Index:=77
										Else 
											$_d_StartDate:=$_d_StartDate-1
									End case 
								End for 
								
							End if 
							
							
					End case 
					
				End if 
				SD2_SetInterface("SD2_DefScheduleEntry")
		End case 
	: ($_l_event=On Timer:K2:25)
		
		
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4) | ($_l_event=On Plug in Area:K2:16) | ($_l_event=On Menu Selected:K2:14)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				SD2_DiaryOnEdit(Focus object:C278)
				SD2_SetInterface("SD2_DefScheduleEntry")
				If ($_l_event=On Menu Selected:K2:14)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
					If (Records in selection:C76([DIARY:12])<=1)
						OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				End if 
		End case 
		
	: ($_l_event=On Menu Selected:K2:14)
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "SD2_DefScheduleEntry")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				SD2_SetInterface("SD2_DefScheduleEntry")
		End case 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].SD2_DefScheduleEntry"; $_t_oldMethodName)
