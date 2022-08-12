If (False:C215)
	//object Name: [USER]SD2_WorkflowViewer.oWorkflow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_MarkasDone;0)
	//ARRAY BOOLEAN(SD2_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_MultipleRowNumbers; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_WorkflowDiaryCode;0)
	//ARRAY TEXT(SD2_at_WorkflowOwners;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; $_bo_Continue; $_bo_RemoveAll; $_bo_RemoveAllisSet; $_bo_SetAll)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_event; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_OK; $_l_ResultCodePosition; $_l_ResultCodeRow; $_l_ResultNamePosition; $_l_SelectedColumn)
	C_LONGINT:C283($_l_SelectedRow; $_l_UpdateIndex; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; SD2_l_IncludeFuture; SD2_l_IncludeOverdue; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xnext)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_AllResultCode; $_t_oldMethodName; $_t_SelectedResult; $_t_WorkflowDiaryCode; SD2_t_MiniDiarycode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_WorkflowViewer.oWorkflow"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: $_l_event=On Double Clicked:K2:5
		LISTBOX GET CELL POSITION:C971(SD2_lb_Workflow; $_l_SelectedColumn; $_l_SelectedRow)
		$_t_WorkflowDiaryCode:=SD2_at_WorkflowDiaryCode{$_l_SelectedRow}
		SD2_EditDiaryRecord($_t_WorkflowDiaryCode; "Workflow")
		
		
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(SD2_lb_Workflow; $_l_SelectedColumn; $_l_SelectedRow)
		If ($_l_SelectedRow>0)
			Case of 
				: ($_l_SelectedColumn=1)
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
					SD2_t_MiniDiarycode:=SD2_at_WorkflowDiaryCode{$_l_SelectedRow}
					DIALOG:C40([USER:15]; "DiaryMiniView")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				: ($_l_SelectedColumn=2)
					BEEP:C151
					
			End case 
		End if 
	: ($_l_event=On Data Change:K2:15)
		
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton; *)
		ARRAY LONGINT:C221($_al_MultipleRowNumbers; 0)
		LISTBOX GET CELL POSITION:C971(SD2_lb_Workflow; $_l_SelectedColumn; $_l_SelectedRow)
		For ($_l_Index; 1; Size of array:C274(SD2_lb_Workflow))
			If (SD2_lb_Workflow{$_l_Index})
				APPEND TO ARRAY:C911($_al_MultipleRowNumbers; $_l_Index)
				
			End if 
		End for 
		
		
		If ($_l_SelectedRow>0)
			Case of 
					
				: ($_l_SelectedColumn=2)
					
					If (Size of array:C274($_al_MultipleRowNumbers)>1)
						Gen_Confirm3("Set Selected tasks to same result?"; "Yes"; "No"; "Stop")
						$_bo_Continue:=(xOK=1) | (xnext=1)
						$_bo_SetAll:=(xNext=1)
						
					Else 
						$_bo_Continue:=True:C214
						$_bo_SetAll:=True:C214  //well theire is only one
					End if 
					$_t_AllResultCode:=""
					$_bo_RemoveAllisSet:=False:C215
					$_bo_RemoveAll:=False:C215
					For ($_l_UpdateIndex; 1; Size of array:C274($_al_MultipleRowNumbers))
						$_l_SelectedRow:=$_al_MultipleRowNumbers{$_l_UpdateIndex}
						READ WRITE:C146([DIARY:12])
						QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SD2_at_WorkflowDiaryCode{$_l_SelectedRow})
						If (SD2_abo_MarkasDone{$_l_SelectedRow})
							
							If ([DIARY:12]Date_Done_From:5=!00-00-00!)
								[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
								[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
							End if 
							If ([DIARY:12]Result_Code:11="")
								//user set result
								If ($_t_AllResultCode="")
									QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
									SD2_ActionAttributesToArrays
									$_l_ResultCodePosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
									If ($_l_ResultCodePosition>0)
										ARRAY TEXT:C222(SD2_at_ResultCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodePosition}))
										ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodePosition}))
										If (Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodePosition})>0)
											For ($_l_Index; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodePosition}))
												SD2_at_ResultCodes{$_l_Index}:=SD2_at_ActionVirtFieldDataMA{$_l_ResultCodePosition}{$_l_Index}
												$_l_ResultCodeRow:=Find in array:C230(SD2_at_AllResultCodes; SD2_at_ResultCodes{$_l_Index})
												If ($_l_ResultCodeRow>0)
													SD2_at_ResultNames{$_l_Index}:=SD2_at_AllresultNames{$_l_ResultCodeRow}
												End if 
											End for 
										Else 
											ALL RECORDS:C47([RESULTS:14])
											SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; SD2_at_ResultCodes; [RESULTS:14]Result_Name:2; SD2_at_ResultNames)
										End if 
									Else 
										ALL RECORDS:C47([RESULTS:14])
										SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; SD2_at_ResultCodes; [RESULTS:14]Result_Name:2; SD2_at_ResultNames)
										
									End if 
									SORT ARRAY:C229(SD2_at_ResultNames; SD2_at_ResultCodes; >)
									GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
									
									$_t_SelectedResult:=Gen_RequestWithList("set completion status.."; ""; "Save"; "Cancel"; ($_l_WindowLeft+40); $_l_MouseY; "Outcome"; 0; ""; "SD2_at_ResultNames")
									If ($_t_SelectedResult#"")
										$_l_ResultNamePosition:=Find in array:C230(SD2_at_ResultNames; $_t_SelectedResult)
										[DIARY:12]Result_Code:11:=SD2_at_ResultCodes{$_l_ResultNamePosition}
										RELATE ONE:C42([DIARY:12]Result_Code:11)  //`
										[DIARY:12]Done:14:=True:C214
										$_bo_Continue:=True:C214
										If ($_bo_SetAll)
											$_t_AllResultCode:=$_t_SelectedResult
										End if 
										//```````````````
									Else 
										$_bo_Continue:=False:C215
									End if 
								Else 
									[DIARY:12]Done:14:=True:C214
									[DIARY:12]Result_Code:11:=$_t_AllResultCode
									$_bo_Continue:=True:C214
									
								End if 
								
								
								If ([DIARY:12]Sequence_Actioned:77=False:C215) & ($_bo_Continue)
									
									If ((DB_GetModuleSettingByNUM(Module_Sequences)>1))
										If (([DIARY:12]Action_Code:9#"") & ([DIARY:12]Result_Code:11#"") & (Records in table:C83([WORKFLOW_CONTROL:51])>0))
											DB_SaveRecord(->[DIARY:12])
											If (Count parameters:C259>=2)
												
												Diary_InLPASeq("LPA"; True:C214)
												
											Else 
												Diary_InLPASeq("LPA")
											End if 
										End if 
									End if 
								End if 
							End if 
							If ($_bo_Continue)
								DB_SaveRecord(->[DIARY:12])
								If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
									If (Not:C34(<>SYS_bo_ScriptonSave))
										If (DB_GetModuleSettingByNUM(Module_Macros)>1)
											<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
										End if 
									End if 
									
									If (<>SYS_bo_ScriptonSave)
										
										Macro_AccType("Accept "+"Diary")
										
									End if 
								End if 
							End if 
							If ($_bo_Continue=False:C215)
								$_l_UpdateIndex:=Size of array:C274($_al_MultipleRowNumbers)
								
							End if 
						Else 
							[DIARY:12]Time_Checked:28:=False:C215
							[DIARY:12]Done:14:=False:C215
							If (($_bo_SetAll) & (Not:C34($_bo_RemoveAllisSet))) | ($_bo_SetAll=False:C215)
								Gen_Confirm("Remove Current completion status ("+[DIARY:12]Result_Code:11+")")
								$_l_OK:=OK
								$_bo_RemoveAllisSet:=True:C214
								$_bo_RemoveAll:=($_l_OK=1)
							Else 
								If ($_bo_RemoveAll)
									$_l_OK:=0
								End if 
							End if 
							If ($_l_OK=1)
								[DIARY:12]Result_Code:11:=""
							End if 
							DB_SaveRecord(->[DIARY:12])
							If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
								If (Not:C34(<>SYS_bo_ScriptonSave))
									If (DB_GetModuleSettingByNUM(Module_Macros)>1)
										<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
									End if 
								End if 
								
								If (<>SYS_bo_ScriptonSave)
									
									//  Macro ("Accept "+String(File($4)))
									Macro_AccType("Accept "+"Diary")
									
									
								End if 
							End if 
							
						End if 
					End for 
					SD2_GetWorkflowActions(->SD2_at_WorkflowOwners; SD2_l_IncludeOverdue; SD2_l_IncludeFuture)
					
			End case 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_WorkflowViewer.oWorkflow"; $_t_oldMethodName)
