If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ScheduleWindow.oCalenders
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 17:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_CheckBox;0)
	//ARRAY BOOLEAN(SD2_lb_CalendersList;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryPersons;0)
	C_BOOLEAN:C305(SD2_bo_MultipleDiaries)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Index; $_l_Retries; $_l_SelectedRow; $_l_SelectionCount; $_l_TableNumber; LB_l_ColumnNumber; SD2_l_NewWindowsForDiaries)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DiaryProcessName; $_t_oldMethodName; $_t_VariableName; SD_t_CurrentDiaryInitials)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oCalenders"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		LB_l_ColumnNumber:=LB_GetColumn(->SD2_lb_CalendersList; $_t_VariableName)
		Case of 
			: (LB_l_ColumnNumber=2)  //Double clicked on column 2
				If ($_l_SelectedRow>0)
					If (SD_at_PersonInitials{$_l_SelectedRow}#"")  //Double clicked on a name
						//Gen_Alert ("Open new Diary window")
						$_t_DiaryProcessName:="Schedule"+"-"+SD_at_DiaryOwners{$_l_SelectedRow}
						ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_DiaryProcessName; SD_at_PersonInitials{$_l_SelectedRow})
					End if 
				End if 
		End case 
	: ($_l_event=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		LB_l_ColumnNumber:=LB_GetColumn(->SD2_lb_CalendersList; $_t_VariableName)
		Case of 
			: (LB_l_ColumnNumber=1)
				If ($_l_SelectedRow>0)
					If (SD_at_PersonInitials{$_l_SelectedRow}#"")
						
						//$Ref:=Find in array(SD_at_DiaryOwners;"Multiple Diaries")
						If (SD2_bo_MultipleDiaries)  //Combine mulitple diaries
							$_l_Retries:=0
							While (Semaphore:C143("$ChangingDiaPerArray"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
							
							$_l_SelectionCount:=0
							For ($_l_Index; 1; Size of array:C274(SD2_abo_CheckBox))
								If (SD_at_PersonInitials{$_l_Index}#"")
									If (SD2_abo_CheckBox{$_l_Index})
										$_l_SelectionCount:=$_l_SelectionCount+1
										APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{$_l_Index})
									End if 
								End if 
							End for 
							Case of 
								: ($_l_SelectionCount>1)
									SD_t_CurrentDiaryInitials:=""
								: ($_l_SelectionCount=1)
									SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
								: ($_l_SelectionCount=0)
									SD2_abo_CheckBox{1}:=True:C214
									APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{1})
									SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
							End case 
							CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
							
							
						Else   //Select a single diary
							If (SD2_l_NewWindowsForDiaries=0)  //open in this window(switch user
								If (SD2_abo_CheckBox{$_l_SelectedRow}=True:C214)  //Ticking the item
									//Set the others to false
									$_l_Retries:=0
									While (Semaphore:C143("$ChangingDiaPerArray"))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*$_l_Retries)
									End while 
									
									ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
									APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{$_l_SelectedRow})
									SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{Size of array:C274(SD2_at_CurrentDiaryPersons)}
									For ($_l_Index; 1; Size of array:C274(SD2_abo_CheckBox))
										If ($_l_Index#$_l_SelectedRow) & (SD_at_PersonInitials{$_l_Index}#"")
											SD2_abo_CheckBox{$_l_Index}:=False:C215
										End if 
									End for 
									CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
								Else 
									//Deselected-make sure at least one is selected
									$_l_Retries:=0
									While (Semaphore:C143("$ChangingDiaPerArray"))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*$_l_Retries)
									End while 
									ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
									$_l_SelectionCount:=0
									For ($_l_Index; 1; Size of array:C274(SD2_abo_CheckBox))
										If (SD_at_PersonInitials{$_l_Index}#"")
											If (SD2_abo_CheckBox{$_l_Index})
												$_l_SelectionCount:=$_l_SelectionCount+1
											End if 
										End if 
									End for 
									If ($_l_SelectionCount=0)  //Which it should be if we can on;y select one and we just deselected it
										SD2_abo_CheckBox{1}:=True:C214
										APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{1})
										SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
									End if 
									CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
									
								End if 
								
							Else 
								//Not opening in this window. so cannot deselet the current user
								$_l_Retries:=0
								While (Semaphore:C143("$ChangingDiaPerArray"))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*$_l_Retries)
								End while 
								ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
								
								If (SD_at_PersonInitials{$_l_SelectedRow}=<>PER_t_CurrentUserInitials)  //cannot deselect this one AND no open another window this way
									SD2_abo_CheckBox{$_l_SelectedRow}:=True:C214
									APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{$_l_SelectedRow})
									SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{$_l_SelectedRow}
								Else 
									//Open a new window for that diary
									//Gen_Alert ("start new diary")
									$_t_DiaryProcessName:="Schedule"+"-"+SD_at_DiaryOwners{$_l_SelectedRow}
									ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_DiaryProcessName; SD_at_PersonInitials{$_l_SelectedRow})
									SD2_abo_CheckBox{$_l_SelectedRow}:=False:C215
									$_l_SelectionCount:=0
									For ($_l_Index; 1; Size of array:C274(SD2_abo_CheckBox))
										If (SD_at_PersonInitials{$_l_Index}#"")
											If (SD2_abo_CheckBox{$_l_Index})
												$_l_SelectionCount:=$_l_SelectionCount+1
												APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{$_l_Index})
											End if 
										End if 
									End for 
									Case of 
										: ($_l_SelectionCount=1)
											SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
										: ($_l_SelectionCount=0)
											SD2_abo_CheckBox{1}:=True:C214
											APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{1})
											SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
									End case 
									
									
									//we dont set the array here
								End if 
								CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
							End if 
							
						End if 
						
					Else 
						//clicked on the multipl diaries check box
						If (SD2_abo_CheckBox{$_l_SelectedRow})  // option is now checked
						Else 
							//Deselect any other check boxes
							$_l_Retries:=0
							While (Semaphore:C143("$ChangingDiaPerArray"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
							SD2_abo_CheckBox{1}:=True:C214
							APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_PersonInitials{1})
							SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
							For ($_l_Index; 2; $_l_SelectedRow-1)
								SD2_abo_CheckBox{$_l_Index}:=False:C215
							End for 
							CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
						End if 
					End if 
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oCalenders"; $_t_oldMethodName)
