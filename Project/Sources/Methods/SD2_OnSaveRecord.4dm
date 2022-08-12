//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_OnSaveRecord
	//------------------ Method Notes ------------------
	//This method is to run on the saving of a record.
	//this will look for workflow sequences that need to be run when saving records and if there is one applicable to this table then it will execute.
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_WorkflowTables; 0)
	//ARRAY LONGINT(WF_al_OnChangeState;0)
	//ARRAY LONGINT(WF_al_OnDelete;0)
	//ARRAY LONGINT(WF_al_OnSavingNew;0)
	//ARRAY LONGINT(WF_al_OnUpdating;0)
	//ARRAY LONGINT(WF_al_WorkFlowTables;0;0)
	ARRAY TEXT:C222($_at_ApplicableCodes; 0)
	ARRAY TEXT:C222($_at_macroCodes; 0)
	ARRAY TEXT:C222($_at_ScriptName; 0)
	ARRAY TEXT:C222($_at_WorkflowTables; 0)
	//ARRAY TEXT(WF_at_WorkflowCodes;0)
	//ARRAY TEXT(WF_at_WorkflowMacroCodes;0;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; DB_bo_InWFCreate; WF_bo_WorkFlowsLoaded; WFM_bo_CreateWorklowRecord)
	C_LONGINT:C283(<>AutoProc; $_l_CallingAction; $_l_CBonChangeState; $_l_CBoncreateNewrecord; $_l_CBonDeleterecord; $_l_CBonUpdaterecord; $_l_CodeRow; $_l_DiaryRecordID; $_l_index; $_l_offset; $_l_Process)
	C_LONGINT:C283($_l_SizeofArray; $_l_TableContext; $_l_TableIndex; $_l_TableRow; $_l_TableRow2; $1; XCANCEL; XNEXT; XOK)
	C_OBJECT:C1216($_obj_ActionData)
	C_REAL:C285($2)
	C_TEXT:C284(<>AutoFile; <>OrderCode; $_t_oldMethodName; $_t_ScriptCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_OnSaveRecord")
If (Count parameters:C259>=1)
	DB_bo_InWFCreate:=True:C214
	If (Not:C34(WF_bo_WorkFlowsLoaded))
		ARRAY TEXT:C222(WF_at_WorkflowCodes; 0)
		ARRAY LONGINT:C221(WF_al_WorkFlowTables; 0; 0)
		ARRAY TEXT:C222(WF_at_WorkflowMacroCodes; 0; 0)
		ARRAY LONGINT:C221(WF_al_OnSavingNew; 0)
		ARRAY LONGINT:C221(WF_al_OnUpdating; 0)
		ARRAY LONGINT:C221(WF_al_OnChangeState; 0)
		ARRAY LONGINT:C221(WF_al_OnDelete; 0)
		$_l_offset:=0
		ALL RECORDS:C47([WORKFLOW_CONTROL:51])
		For ($_l_index; 1; Records in selection:C76([WORKFLOW_CONTROL:51]))
			ARRAY TEXT:C222($_at_WorkflowTables; 0)
			ARRAY LONGINT:C221($_al_WorkflowTables; 0)
			ARRAY TEXT:C222($_at_ScriptName; 0)
			ARRAY TEXT:C222($_at_macroCodes; 0)
			$_l_CBoncreateNewrecord:=0
			$_l_CBonUpdaterecord:=0
			$_l_CBonDeleterecord:=0
			$_l_CBonChangeState:=0
			If ([WORKFLOW_CONTROL:51]Display:6#3)
				If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
					BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_WorkflowTables; $_l_offset)
					If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
						BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_al_WorkflowTables; $_l_offset)
						If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
							BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_ScriptName; $_l_offset)
							If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
								BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_macroCodes; $_l_offset)
								If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
									BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_l_CBoncreateNewrecord; $_l_offset)
									If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
										BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_l_CBonUpdaterecord; $_l_offset)
										If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
											BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_l_CBonChangeState; $_l_offset)
											If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
												BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_l_CBonDeleterecord; $_l_offset)
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				$_l_SizeofArray:=Size of array:C274($_at_ScriptName)
				ARRAY TEXT:C222($_at_WorkflowTables; $_l_SizeofArray)
				ARRAY LONGINT:C221($_al_WorkflowTables; $_l_SizeofArray)
				ARRAY TEXT:C222($_at_ScriptName; $_l_SizeofArray)
				If ($_l_SizeofArray>0)
					APPEND TO ARRAY:C911(WF_at_WorkflowCodes; [WORKFLOW_CONTROL:51]WFControl_Code:10)
					INSERT IN ARRAY:C227(WF_al_WorkFlowTables; Size of array:C274(WF_al_WorkFlowTables)+1)
					INSERT IN ARRAY:C227(WF_at_WorkflowMacroCodes; Size of array:C274(WF_al_WorkFlowTables)+1)
					$_l_SizeofArray:=Size of array:C274(WF_al_WorkFlowTables)
					For ($_l_TableIndex; 1; Size of array:C274($_al_WorkflowTables))
						APPEND TO ARRAY:C911(WF_al_WorkFlowTables{$_l_SizeofArray}; $_al_WorkflowTables{$_l_TableIndex})
						APPEND TO ARRAY:C911(WF_at_WorkflowMacroCodes{$_l_SizeofArray}; $_at_macroCodes{$_l_TableIndex})
					End for 
					APPEND TO ARRAY:C911(WF_al_OnSavingNew; $_l_CBoncreateNewrecord)
					APPEND TO ARRAY:C911(WF_al_OnUpdating; $_l_CBonUpdaterecord)
					APPEND TO ARRAY:C911(WF_al_OnChangeState; $_l_CBonChangeState)
					APPEND TO ARRAY:C911(WF_al_OnDelete; $_l_CBonDeleterecord)
					
				End if 
			End if 
			NEXT RECORD:C51([WORKFLOW_CONTROL:51])
			
		End for 
		WF_bo_WorkFlowsLoaded:=True:C214
	End if 
	$_l_TableContext:=$1
	ARRAY TEXT:C222($_at_ApplicableCodes; 0)
	For ($_l_index; 1; Size of array:C274(WF_at_WorkflowCodes))
		$_l_TableRow:=Find in array:C230(WF_al_WorkFlowTables{$_l_index}; $_l_TableContext)
		If ($_l_TableRow2>0)
			APPEND TO ARRAY:C911($_at_ApplicableCodes; WF_at_WorkflowCodes{$_l_index})
		End if 
	End for 
	If (Size of array:C274($_at_ApplicableCodes)>0)
		
		//There is at least one workflow sequence that may apply
		For ($_l_index; 1; Size of array:C274($_at_ApplicableCodes))
			WFM_bo_CreateWorklowRecord:=False:C215
			$_l_CodeRow:=Find in array:C230(WF_at_WorkflowCodes; $_at_ApplicableCodes{$_l_index})
			If ($_l_CodeRow>0)
				$_l_TableRow2:=Find in array:C230(WF_al_WorkFlowTables{$_l_CodeRow}; $_l_TableContext)
				If ($_l_TableRow2>0)  //it should be
					$_t_ScriptCode:=WF_at_WorkflowMacroCodes{$_l_CodeRow}{$_l_TableRow2}
					If ($_t_ScriptCode="UseStd")
						$_l_CallingAction:=$2
						APPEND TO ARRAY:C911(WF_al_OnSavingNew; $_l_CBoncreateNewrecord)
						APPEND TO ARRAY:C911(WF_al_OnUpdating; $_l_CBonUpdaterecord)
						APPEND TO ARRAY:C911(WF_al_OnChangeState; $_l_CBonChangeState)
						APPEND TO ARRAY:C911(WF_al_OnDelete; $_l_CBonDeleterecord)
						
						Case of 
							: ($_l_CallingAction=1)  //On save new record
								WFM_bo_CreateWorklowRecord:=(WF_al_OnSavingNew{$_l_CodeRow}=1)
							: ($_l_CallingAction=2)  //on updating a record
								WFM_bo_CreateWorklowRecord:=(WF_al_OnUpdating{$_l_CodeRow}=1)
							: ($_l_CallingAction=3)  //on change state-only applies to some tables
								If ($1=Table:C252(->[ORDERS:24]))
									
									WFM_bo_CreateWorklowRecord:=(WF_al_OnChangeState{$_l_CodeRow}=1)
									If (Not:C34(WFM_bo_CreateWorklowRecord))
										WFM_bo_CreateWorklowRecord:=(WF_al_OnUpdating{$_l_CodeRow}=1)
									End if 
									
								End if 
							: ($_l_CallingAction=4)  // on delete
								WFM_bo_CreateWorklowRecord:=(WF_al_OnDelete{$_l_CodeRow}=1)
						End case 
					Else 
						//Run the macro
						Macro($_t_ScriptCode)
						
					End if 
					If (WFM_bo_CreateWorklowRecord)
						//Then we do the sequence
						QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$_at_ApplicableCodes{$_l_index})
						
						Case of 
							: ([WORKFLOW_CONTROL:51]Display:6=0)  //check first and display on screen
								Gen_Confirm3("Suggested Workflow Action :"+Char:C90(13)+Substring_Word([WORKFLOW_CONTROL:51]Next_Action:3+": "+[WORKFLOW_CONTROL:51]Description:5; 1; 85)+Char:C90(13)+Char:C90(13)+"Add & See it, or just add it?"; "See"; "Cancel"; "Add")
								OK:=Num:C11((XOK=1) | (XNEXT=1))
								If (OK=1)
									$_obj_ActionData:=SD2_GetRecordData($_l_TableContext)
									REDUCE SELECTION:C351([DIARY:12]; 0)
									Diary_SeqCreate([WORKFLOW_CONTROL:51]Action_Code:1; $_obj_ActionData)
									
									<>OrderCode:=""
									<>AutoFind:=True:C214
									<>DB_bo_AutoOut:=False:C215
									<>AutoProc:=Record number:C243([DIARY:12])
									<>AutoFile:="Diary"
									$_l_DiaryRecordID:=[DIARY:12]x_ID:50
									UNLOAD RECORD:C212([DIARY:12])
									If (XNEXT=1)
										$_l_Process:=New process:C317("SDAG_EditInProcess"; 256000; "Edit Diary Record"+String:C10($_l_DiaryRecordID); $_l_DiaryRecordID; 0; $_l_DiaryRecordID)
									End if 
									//ZDiary_Mod
									
									
								End if 
								OK:=1
								XNEXT:=0
								XOK:=0
								XCANCEL:=0
							: ([WORKFLOW_CONTROL:51]Display:6=1)  //check then create without display
								
								Gen_Confirm("Suggested Workflow Action :"+Char:C90(13)+Substring_Word([WORKFLOW_CONTROL:51]Next_Action:3+": "+[WORKFLOW_CONTROL:51]Description:5; 1; 85)+Char:C90(13)+Char:C90(13)+"Add it?"; "Yes"; "No")
								If (OK=1)
									Diary_SeqCreate
								End if 
							: ([WORKFLOW_CONTROL:51]Display:6=2)  //do it without checking
								Diary_SeqCreate
						End case 
					End if 
				End if 
			End if 
		End for 
	End if 
	DB_bo_InWFCreate:=False:C215
	
End if 
ERR_MethodTrackerReturn("SD2_OnSaveRecord"; $_t_oldMethodName)
