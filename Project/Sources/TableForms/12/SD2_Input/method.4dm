
If (False:C215)
	//Object Name:      [DIARY].SD2_Input
	
	//------------------ Revision Control ----------------
	//Date Created:  30/09/2013 19:10
	//Created BY:   Nigel Greenlee
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	//ARRAY TEXT(SD2_at_DactionNames;0)
	//ARRAY TEXT(SD2_at_DiaryActionCodes;0)
	C_BOOLEAN:C305(<>StatsSwitch; $_bo_Found; $_bo_Highlight; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; SD_bo_NewRecord; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_DATE:C307($_d_StartDate; SD2_D_DisplayDateFrom; SD2_D_DisplayDateTo)
	C_LONGINT:C283(<>newSetsProcess; <>WT_SortFieldName_2; $_l_ButtonPressed; $_l_event; $_l_EventCall; $_l_Index; $_l_KeyPosition; $_l_LineIndex; $_l_MonitorCall; $_l_Nul; $_l_OutCallBack)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_RecordRow; $_l_Retries; $_l_TableNumber; DB_l_ButtonClickedFunction; DB_l_OutCallBack; DiaryDetails; FS_l_FieldType; FS_l_SortDirection; FS_l_SortFieldNUM)
	C_LONGINT:C283(FS_l_SortTableNUM; oOK; SD_l_CountTimes; SD_l_CurrentTab; SD2_l_Dataform; SD2_l_EventCall; SM_l_MonitorCall; SM_l_TableNumber; SM_l_UpdateOnCallBackID; vNo; vNo2)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; SD2_ptr_LastObject; SD2_ptr_SearchField)
	C_REAL:C285(SD2_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_ProcessName; $_t_SearchName; DB_t_CallOnCloseorSave; DiaryDetailsTXT; FS_t_SortFieldTXT; FS_t_SortVariableName; PAL_BUTTON; SD2_t_CreateActionCode; SD2_t_SELActionName)
	C_TEXT:C284(SD2_t_SRCH_Text; SD2_t_SRCH_TextOLD; SM_t_UseSetName; vButtDisDry; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].SD2_Input"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		$_l_Nul:=0
		SD2_ptr_LastObject:=->$_l_Nul
		
		
		OpenHelp(Table:C252(->[DIARY:12]); "SD2_Input")
		//This form is ONE of a series of forms for entering diary items..
		SD_l_CountTimes:=0
		
		SD_l_CurrentTab:=0
		//SD_bo_NewRecord:=False
		If ([DIARY:12]Action_Code:9="")
			//SD_bo_NewRecord:=True
			If (SD2_t_CreateActionCode#"")  //This is so a predined code can be got from parent method is required
				[DIARY:12]Action_Code:9:=SD2_t_CreateActionCode
			End if 
		End if 
		
		SD2_LoadDiary("SD2_Input")  // ([DIARY]Action Code)  `This same method is called from all diary loading forms.
		If (False:C215)
			OBJECT SET VISIBLE:C603(SD2_l_Dataform; True:C214)
			OBJECT SET VISIBLE:C603(DiaryDetailsTXT; False:C215)
			OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
			//Below to go back in
			//$Err:=Web_SetURL (SD2_l_Dataform;"http://www.apple.com")
			//$err:=Web_SetPreferences (SD2_l_Dataform;2;1;"")
			//$err:=Web_SetPreferences (SD2_l_Dataform;1;1;"")
			
		End if 
		
		In_ButtChkDis(->vButtDisDry)
	: ($_l_event=On Activate:K2:9)
	: ($_l_event=On Resize:K2:27)
	: ($_l_event=On Outside Call:K2:11)
		If (SD2_l_EventCall=0)
			
			
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
										$_ptr_ListboxSetup:=->SD2_aptr_ListControl
										$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
										$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
										$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
										$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
										If ($_l_KeyPosition>0)  //it should be
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
										End if 
										ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
										
										For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
											$_l_RecordRow:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
											If ($_l_RecordRow>0)
												If ($_l_KeyPosition>0)
													APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
												End if 
											End if 
										End for 
										If (Size of array:C274($_at_DiaryrecordCodes)>0)
											
											//Because here i know what we are searching we can hard code this
											QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryrecordCodes)
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
						SD2_D_DisplayDateFrom:=!00-00-00!
					End if 
					If (SD2_D_DisplayDateTo#!00-00-00!)
						[DIARY:12]Display_Date_To:52:=SD2_D_DisplayDateTo
						SD2_D_DisplayDateTo:=!00-00-00!
					End if 
				: ($_l_EventCall=16)
					If (SD2_D_DisplayDateFrom#!00-00-00!)
						[DIARY:12]Display_Date_From:51:=SD2_D_DisplayDateFrom
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
	: ($_l_event=On Timer:K2:25)
		SD2_r_Timer:=((Current time:C178*1)*60)
		If (SRCH_r_TimerOLD>0)
			If (SD2_r_Timer>(SRCH_r_TimerOLD+30)) & (SD2_t_SRCH_Text=SD2_t_SRCH_TextOLD)
				SET TIMER:C645(0)
				If (SD2_t_SRCH_Text#"")
					Case of 
						: (Field:C253(SD2_ptr_SearchField)=Field:C253(->[DIARY:12]Action_Code:9))
							//Entering an action name or code
							If (Size of array:C274(SD2_at_DactionNames)>0)
								$_t_SearchName:=SD2_t_SRCH_Text
								$_bo_Found:=False:C215
								For ($_l_Index; 1; Size of array:C274(SD2_at_DactionNames))
									If (Position:C15($_t_SearchName; SD2_at_DactionNames{$_l_Index})>0)
										SD2_t_SELActionName:=SD2_at_DactionNames{$_l_Index}
										[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{$_l_Index}
										$_l_Index:=99999
										$_bo_Found:=True:C214
									End if 
								End for 
								If (Not:C34($_bo_Found))
									For ($_l_Index; 1; Size of array:C274(SD2_at_DactionNames))
										If (Position:C15($_t_SearchName; SD2_at_DiaryActionCodes{$_l_Index})>0)
											[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{$_l_Index}
											SD2_t_SELActionName:=SD2_at_DactionNames{$_l_Index}
											$_l_Index:=99999
											$_bo_Found:=True:C214
										End if 
									End for 
									
								End if 
								If (Not:C34($_bo_Found))
									Gen_Alert("That action is not found")
									[DIARY:12]Action_Code:9:=""
									SD2_t_SELActionName:=""
									SD2_ChangeActionCode("SD2_Input")
									SD2_ControlResultsInterface
								Else 
									SD2_ChangeActionCode("SD2_Input")
									SD2_ControlResultsInterface
								End if 
							Else 
								Check_MinorNC(->[DIARY:12]Action_Code:9; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
								SD2_ChangeActionCode("SD2_Input")
								SD2_ControlResultsInterface
								
							End if 
					End case 
					
				Else 
					
				End if 
				
			Else 
				
				
				If (SD2_t_SRCH_TextOLD#SD2_t_SRCH_Text)
					
					SRCH_r_TimerOLD:=SD2_r_Timer
				End if 
			End if 
			SD2_t_SRCH_TextOLD:=SD2_t_SRCH_Text
		Else 
			SRCH_r_TimerOLD:=SD2_r_Timer
			SD2_t_SRCH_TextOLD:=SD2_t_SRCH_Text
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		SD2_DiaryOnEdit(Focus object:C278)
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	Else 
		
End case 
ERR_MethodTrackerReturn("FM:SD2_Input"; $_t_oldMethodName)
