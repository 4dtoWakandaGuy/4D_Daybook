//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_AddDiaryRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SD2_AddDiaryRecord
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_AllActionIDS; 0)
	ARRAY LONGINT:C221($_al_WorkflowTables; 0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_RealFormTable;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordClass;0)
	//ARRAY LONGINT(SD2_al_RelatedTypes;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipIDS;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY TEXT(<>SD2_at_AllActionCodes;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_ActionForm; 0)
	ARRAY TEXT:C222($_at_ActionNames; 0)
	ARRAY TEXT:C222($_at_AllActionCodes; 0)
	ARRAY TEXT:C222($_at_macroCodes; 0)
	ARRAY TEXT:C222($_at_TempActionNames; 0)
	ARRAY TEXT:C222($_at_WorkflowCodes; 0)
	ARRAY TEXT:C222($_at_WorkflowNames; 0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD2_at_ActionCodeForms;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AdditionalPersons;0)
	//ARRAY TEXT(SD2_at_DiaryEntryForm;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	//ARRAY TEXT(SD2_at_RealFormName;0)
	//ARRAY TEXT(SD2_at_RelatedTypes;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipnames;0)
	//ARRAY TEXT(SD2_at_VariableStrings;0)
	//ARRAY TEXT(SD2_AT_VariableValues;0)
	//ARRAY TEXT(SD2_at_WorkFlowCodes;0)
	//ARRAY TEXT(SD2_at_WorkFlowNames;0)
	C_BOOLEAN:C305(<>SD2_bo_ALLTypeActionsInited; $_bo_Continue; $_bo_Create; $_bo_OK; $_bo_StartProcess; $4; SD2_bo_CreateThread; SD2_bo_LoadRelationsFromArray; SD2_bo_SchedTypeActionsInited)
	C_DATE:C307(SD2_D_InputDate; SD2_D_InputDateto)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionRowSeleced; $_l_actionsIndex; $_l_ActionsWithForms; $_l_ArraySize; $_l_CurrentWinRefOLD; $_l_DataType; $_l_Delay; $_l_EntryFormTable; $_l_FieldRow; $_l_FormNameCount)
	C_LONGINT:C283($_l_FormRow; $_l_offset; $_l_Repeats; $_l_WFSelected; $NUL; SD2_l_EntryPoint; SD2_l_InputAddtotrhead; SD2_l_InputTable; SD2_l_LinkToParent; SD2_l_ProcessReady; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Variable)
	C_REAL:C285(SD2_R_inputUnitRate; SD2_R_InputUnits)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ActionCode; $_t_EntryFormName; $_t_FormName; $_t_FormReference; $_t_FormTitle; $_t_oldMethodName; $_t_VirtualFormName; $1; $2; $3)
	C_TEXT:C284(SD2_t_ActionCode; SD2_t_CreateActionCode; SD2_t_EntryRecallType; SD2_t_InputActionCode; SD2_T_InputActionDesc; SD2_t_InputDocumentCode; SD2_t_InputPersonCode; SD2_t_InputResultCode; SD2_T_InputResultDesc; SD2_t_InputSubject; SD2_t_SELInputFormName)
	C_TEXT:C284(SD2_t_VirtualFormName; WIN_t_CurrentInputForm)
	C_TIME:C306(SD2_ti_InputTime; SD2_ti_InputTimeTo)
End if 
//Code Starts Here

//TRACE

$_t_oldMethodName:=ERR_MethodTracker("SD2_AddDiaryRecord")


$_l_DataType:=Num:C11($2)
SD2_l_ProcessReady:=0

ARRAY LONGINT:C221(SD2_al_RelationshipTables; 0)
ARRAY LONGINT:C221(SD2_al_RelationshipFields; 0)
ARRAY LONGINT:C221(SD2_al_RelationshipIDS; 0)
ARRAY TEXT:C222(SD2_at_RelationshipCodes; 0)

If (Count parameters:C259>=3)
	$_bo_StartProcess:=True:C214
	If (Count parameters:C259>=4)
		$_bo_StartProcess:=$4
	End if 
	If ($_bo_StartProcess)
		Start_Process
	End if 
End if 
If (Diary_File)
	//Array Text(SD2_at_ActionCodes;0)  // this will be displayed on the form if there are multiple action codes
	//this method is called as a process and accepts some parameters which are arrays
	//this are passed as global arrays and so are copied here and then released
	//SD2_t_ActionCode this will be displayed on  screen if there is a single action code
	SD2_l_InputTable:=Table:C252(->[DIARY:12])  // The default
	SD2_LoadDiaryFormNames
	SD2_loadFormNames
	$_bo_Continue:=False:C215
	
	
	If (Count parameters:C259>1)
		SD2_l_EntryPoint:=Num:C11($1)
		If (Count parameters:C259>=3) & (SD2_l_EntryPoint#8)
			$_t_EntryFormName:=$3
		End if 
		ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
		
		//$3=string of process number which started this process
		SD2_l_EntryPoint:=Num:C11($1)
		If (SD2_l_EntryPoint#8)
			If (SD2_l_ProcessReady=0)  // it should be
				ARRAY LONGINT:C221(SD2_al_RelationshipTables; 0)
				ARRAY LONGINT:C221(SD2_al_RelationshipFields; 0)
				ARRAY LONGINT:C221(SD2_al_RelationshipIDS; 0)
				ARRAY TEXT:C222(SD2_at_RelationshipCodes; 0)
				ARRAY LONGINT:C221(SD2_al_RelatedRecordClass; 0)
				ARRAY LONGINT:C221(SD2_al_RelatedTypes; 0)
				ARRAY TEXT:C222(SD2_at_RelatedTypes; 0)
				ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
				ARRAY TEXT:C222(SD2_at_AdditionalPersons; 0)
				ARRAY TEXT:C222(SD2_at_VariableStrings; 0)
				ARRAY TEXT:C222(SD2_AT_VariableValues; 0)
				SD2_t_EntryRecallType:=""
				If ($_l_DataType>0)
					If (Count parameters:C259>=3)
						SD2_l_ProcessReady:=1
						While (SD2_l_ProcessReady=1)  //when the calling process has passed the variables it will set this to 2
							DelayTicks(3)
						End while 
					End if 
				End if 
				SD2_l_ProcessReady:=0
				//any that are passed in are by DEFAULT prime links-this can be modified to enable the related types to be passed in for multiple records so they don't all get set to prime
				$_l_ArraySize:=Size of array:C274(SD2_al_Relationshiptables)
				ARRAY LONGINT:C221(SD2_al_RelatedTypes; $_l_ArraySize)
				ARRAY TEXT:C222(SD2_at_RelatedTypes; $_l_ArraySize)
				For ($_l_actionsIndex; 1; $_l_ArraySize)
					SD2_al_RelatedTypes{$_l_actionsIndex}:=1
					SD2_at_RelatedTypes{$_l_actionsIndex}:="Prime Link"
				End for 
				//This now set the variables to the values
				For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_VariableStrings))
					$_ptr_Variable:=Get pointer:C304(SD2_at_VariableStrings{$_l_actionsIndex})  //Pointer to a variable
					//I have written this in a way that if the var names passed are not defined they will be ignored
					Case of 
						: (Type:C295($_ptr_Variable->)=Is longint:K8:6)
							$_ptr_Variable->:=Num:C11(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is real:K8:4)
							$_ptr_Variable->:=Num:C11(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is date:K8:7)
							$_ptr_Variable->:=Date:C102(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is string var:K8:2)
							$_ptr_Variable->:=(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is text:K8:3)
							$_ptr_Variable->:=(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is time:K8:8)
							$_ptr_Variable->:=Time:C179(SD2_AT_VariableValues{$_l_actionsIndex})
						: (Type:C295($_ptr_Variable->)=Is boolean:K8:9)
							$_ptr_Variable->:=(SD2_AT_VariableValues{$_l_actionsIndex}="TRUE")
					End case 
				End for 
				
			End if 
		Else 
			If (SD2_l_ProcessReady=0)  // it should be
				ARRAY LONGINT:C221(SD2_al_RelationshipTables; 0)
				ARRAY LONGINT:C221(SD2_al_RelationshipFields; 0)
				ARRAY LONGINT:C221(SD2_al_RelationshipIDS; 0)
				ARRAY TEXT:C222(SD2_at_RelationshipCodes; 0)
				ARRAY LONGINT:C221(SD2_al_RelatedRecordClass; 0)
				ARRAY LONGINT:C221(SD2_al_RelatedTypes; 0)
				ARRAY TEXT:C222(SD2_at_RelatedTypes; 0)
				ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
				ARRAY TEXT:C222(SD2_at_AdditionalPersons; 0)
				ARRAY TEXT:C222(SD2_at_VariableStrings; 0)
				ARRAY TEXT:C222(SD2_AT_VariableValues; 0)
				ARRAY LONGINT:C221(SD2_al_RelatedTypes; 0)
				ARRAY TEXT:C222(SD2_at_RelatedTypes; 0)
				$_bo_Continue:=True:C214
				If ($_l_DataType>0)  //note here that this is different to any of the non type 8 calls
					SD2_l_ProcessReady:=1
					While (SD2_l_ProcessReady=1)  //when the calling process has passed the variables it will set this to 2
						DelayTicks(3)
					End while 
					SD2_l_ProcessReady:=0
				Else 
					//TRACE
					//no parameters to pass so must set up that data
					//SD2_al_RelationshipTables- could be related to anything
					//SD2_at_ActionCodes
					//GET PREFS FOR CURRENT USER HERE
					
				End if 
			End if 
		End if 
	Else 
		If (Count parameters:C259=1)
			//This is being recalled-from a type 8
			$_bo_Continue:=True:C214
		End if 
	End if   // i`if there are no parameters this is a recall because the entry point was $8
	Case of 
		: (SD2_l_EntryPoint=1)
			//Entry point is a previous diary record-a sequence
			//The Good thing here is we do get a diary action code..
			If (Count parameters:C259>=2)
				SD2_t_ActionCode:=$3
				If (SD2_t_ActionCode#"")
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
					SD2_ActionAttributesToArrays
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
					If ($_l_FieldRow>0)
						SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
					End if 
					If (SD2_t_VirtualFormName="")
						//user needs to set up the form to use for this action
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						COPY ARRAY:C226(SD2_at_DiaryEntryForm; SD2_at_FormNames)
						Repeat 
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
							DIALOG:C40([USER:15]; "SD2_DIaryEntryFormSelect")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						Until (SD2_t_VirtualFormName#"") | (OK=0)
						If (SD2_t_VirtualFormName#"")
							$_bo_Continue:=True:C214
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
					
				Else 
					$_bo_Continue:=True:C214
					//Default Entry form-no type setup
				End if 
			Else 
				SD2_t_ActionCode:=""
				//Default Entry form-no type setup
			End if 
			
		: (SD2_l_EntryPoint=2)
			//Entry point is diary 'tabs' (from company/contact/order etc)
			//$3 wil NOl be a pointer to the action codes associated with the current tab- or all the
			// the action codes for that form if no tab selected
			If (False:C215)  //temp disable this
				SD2_t_ActionCode:=""
				If (Count parameters:C259>=2)
					COPY ARRAY:C226(SD2_at_ActionCodes; $_at_ActionCodes)
				End if 
				Case of 
					: (Size of array:C274(SD2_at_ActionCodes)=0)
						//No action codes??-cannot continue
					: (Size of array:C274(SD2_at_ActionCodes)=1)
						//Normally an entry form would now be a passed in to this methid but it can be...$_t_EntryFormName
						SD2_t_ActionCode:=SD2_at_ActionCodes{1}
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						If ($_t_EntryFormName="")
							//While (Semaphore("UpdatingAction"+SD2_t_ActionCode))  `Because we could need to edit it and we don;t want multiple edits at going on
							//IDLE
							//DELAY PROCESS(Current process;2)
							//End while
							READ ONLY:C145([ACTIONS:13])
							//Get the form name for that diary action
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
							SD2_ActionAttributesToArrays
							$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
							If ($_l_FieldRow>0)
								SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
							End if 
							If (SD2_t_VirtualFormName="")
								//user needs to set up the form to use for this action
								ARRAY TEXT:C222(SD2_at_FormNames; 0)
								COPY ARRAY:C226(SD2_at_DiaryEntryForm; SD2_at_FormNames)
								Repeat 
									
									$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
									WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
									DIALOG:C40([USER:15]; "SD2_DIaryEntryFormSelect")
									CLOSE WINDOW:C154
									WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
								Until (SD2_t_VirtualFormName#"") | (OK=0)
								If (SD2_t_VirtualFormName#"")
									Gen_Confirm("Do you wish to save "+SD2_t_VirtualFormName+"as the form to use for actions of type "+SD2_t_ActionCode+"?"; "Yes"; "No")
									If (OK=1)
										//Save the action code with this on
										READ WRITE:C146([ACTIONS:13])
										$_l_Delay:=1
										$_l_Repeats:=0
										$_bo_OK:=False:C215
										Repeat 
											$_l_Repeats:=$_l_Repeats+1
											$_bo_OK:=Check_Locked(->[ACTIONS:13]; 1)
											If (Not:C34($_bo_OK))
												If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
													//only increase every 10 tries
													$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
												End if 
												DelayTicks(2*$_l_Delay)
												
											End if 
										Until ($_bo_OK=True:C214)
										SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}:=SD2_t_VirtualFormName
										SD2_ActionArraystoAttributes
										DB_SaveRecord(->[ACTIONS:13])
										UNLOAD RECORD:C212([ACTIONS:13])
										READ ONLY:C145([ACTIONS:13])
									End if 
									$_bo_Continue:=True:C214
								End if 
							Else 
								$_bo_Continue:=True:C214
							End if 
							CLEAR SEMAPHORE:C144("UpdatingAction"+SD2_t_ActionCode)
						Else 
							SD2_t_VirtualFormName:=$_t_EntryFormName  //if
							$_bo_Continue:=True:C214
						End if 
					: (Size of array:C274(SD2_at_ActionCodes)>1)
						//here because multiple action codes may apply to the form selected we need to remember which form belonged to which
						//action code
						ARRAY TEXT:C222(SD2_at_ActionCodeForms; 0)
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						$_l_ActionsWithForms:=0
						For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_ActionCodes{$_l_actionsIndex})
							SD2_ActionAttributesToArrays
							$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
							If ($_l_FieldRow>0)
								$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
								APPEND TO ARRAY:C911(SD2_at_ActionCodeForms; $_t_VirtualFormName)  //even if it is blank
								If ($_t_VirtualFormName#"")
									$_l_ActionsWithForms:=$_l_ActionsWithForms+1
									$_l_FormRow:=Find in array:C230(SD2_at_FormNames; $_t_VirtualFormName)
									If ($_l_FormRow<0)
										APPEND TO ARRAY:C911(SD2_at_FormNames; $_t_VirtualFormName)
									End if 
								End if 
							End if 
						End for 
						//we now have a group of form names if any of the actions do not have a form we have to add 'other to the list
						If ($_t_EntryFormName="")
							$_l_FormNameCount:=Size of array:C274(SD2_at_FormNames)
							If ($_l_ActionsWithForms<Size of array:C274(SD2_at_ActionCodes))
								If (Size of array:C274(SD2_at_FormNames)>0)
									//there is at least one form name
									$_l_FormNameCount:=Size of array:C274(SD2_at_FormNames)
									APPEND TO ARRAY:C911(SD2_at_FormNames; "-")  //even if it is blank
									APPEND TO ARRAY:C911(SD2_at_FormNames; "Other...")  //even if it is blank
								Else 
									//none of the  actions had a form name..no point in having OTHER
									For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_DiaryEntryForm))  //this was set up in SD2_loadDiarFormnames
										APPEND TO ARRAY:C911(SD2_at_FormNames; SD2_at_DiaryEntryForm{$_l_actionsIndex})
									End for 
								End if 
							End if 
							
							If (Size of array:C274(SD2_at_FormNames)>1)
								//user needs to select the entry type
								$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
								WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
								Repeat 
									DIALOG:C40([USER:15]; "SD2_DIaryEntryFormSelect")
								Until (SD2_t_VirtualFormName#"") | (OK=0)
								CLOSE WINDOW:C154
								WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
								If (SD2_t_VirtualFormName#"")
									$_bo_Continue:=True:C214
								End if 
							Else 
								SD2_t_VirtualFormName:=SD2_at_FormNames{SD2_at_FormNames}
								//there is only one type
								$_bo_Continue:=True:C214
							End if 
							If ($_bo_Continue)
								//ARRAY TEXT(SD2_at_ActionCodes;0)
								$_l_FieldRow:=Find in array:C230(SD2_at_ActionCodeForms; SD2_t_VirtualFormName)
								If ($_l_FieldRow>0)
									//For ($_l_actionsIndex;1;Size of array(SD2_at_ActionCodes))
									//If (SD2_at_ActionCodeForms{$_l_actionsIndex}=SD2_t_VirtualFormName)
									//APPEND TO ARRAY(SD2_at_ActionCodes;SD2_at_ActionCodes{$_l_actionsIndex})
									//End if
									//End for
								Else 
									//the form selected does not relate to any of the action codes..so select the action codes that have no form associated
									For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
										If (SD2_at_ActionCodeForms{$_l_actionsIndex}="")
											APPEND TO ARRAY:C911(SD2_at_ActionCodes; SD2_at_ActionCodes{$_l_actionsIndex})
										End if 
									End for 
								End if 
								
							End if 
						Else 
							SD2_t_VirtualFormName:=$_t_EntryFormName
							$_bo_Continue:=True:C214
							//ARRAY TEXT(SD2_at_ActionCodes;0)
							//For ($_l_actionsIndex;1;Size of array(SD2_at_ActionCodes))
							//APPEND TO ARRAY(SD2_at_ActionCodes;SD2_at_ActionCodes{$_l_actionsIndex})
							//End for
						End if 
						
				End case 
			Else 
				$_bo_Continue:=True:C214
				SD2_l_InputTable:=Table:C252(->[DIARY:12])
				//ZProc ("Diary_In";◊K4;"Enter to Diary")
				SD2_t_VirtualFormName:="STD_INPUT"
			End if 
		: (SD2_l_EntryPoint=3)
			//Diary shedule window
			//First get all diary actions that appear in SHEDULE
			If (Not:C34(SD2_bo_SchedTypeActionsInited))
				SD2_GetActionsRangeByLocation("Schedule")
				SD2_bo_SchedTypeActionsInited:=True:C214  //SO WE DO NOT NEED TO DO THAT AGAIN-
				//NOTE THAT IF AN ACTION IS MODIFIED THIS HAS TO BE SET BACK TO FALSE VIA THE SERVER ON ALL CLIENTS
			End if 
			SD2_t_ActionCode:=""
			If (Size of array:C274(SD2_at_ActionCodes)=0)
				COPY ARRAY:C226(SD2_at_ActionsRange; SD2_at_ActionCodes)
			End if 
			//hold on we may have been passed a list of action codes already
			If ($_t_EntryFormName="")
				//we dont know which entry form.. set the default
				FORM SET INPUT:C55([DIARY:12]; "SD2_DefScheduleEntry")
				WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
				$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"SD2_DefScheduleEntry"
				
				Case of 
					: (Size of array:C274(SD2_at_ActionCodes)=0)
						//No action codes??
					: (Size of array:C274(SD2_at_ActionCodes)=1)
						SD2_t_ActionCode:=SD2_at_ActionCodes{1}
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						//Get the form name for that diary action
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
						End if 
						If (SD2_t_VirtualFormName="")
							//user needs to set up the form to use for this action
							//Use the default
							SD2_t_VirtualFormName:="Standard Scheduled Item Entry"
							
							$_bo_Continue:=True:C214
						End if 
						$_l_FormRow:=Find in array:C230(SD2_at_DiaryEntryForm; SD2_t_VirtualFormName)
						If ($_l_FormRow>0)  //it should be
							$_t_FormName:=SD2_at_RealFormName{$_l_FormRow}
							FORM SET INPUT:C55([DIARY:12]; $_t_FormName)
							WIN_t_CurrentInputForm:=$_t_FormName
							$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+$_t_FormName
						End if 
					: (Size of array:C274(SD2_at_ActionCodes)>1)
						ARRAY TEXT:C222(SD2_at_ActionCodeForms; 0)
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						$_l_ActionsWithForms:=0
						For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
							SD2_ActionAttributesToArrays
							$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
							If ($_l_FieldRow>0)
								$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
								APPEND TO ARRAY:C911(SD2_at_ActionCodeForms; $_t_VirtualFormName)  //even if it is blank
								If ($_t_VirtualFormName#"")
									$_l_ActionsWithForms:=$_l_ActionsWithForms+1
									$_l_FormRow:=Find in array:C230(SD2_at_FormNames; $_t_VirtualFormName)
									If ($_l_FormRow<0)
										APPEND TO ARRAY:C911(SD2_at_FormNames; $_t_VirtualFormName)
									End if 
								End if 
							End if 
						End for 
						//we now have a group of form names if any of the actions do not have a form we have to add 'other to the list
						If ($_l_ActionsWithForms<Size of array:C274(SD2_at_ActionCodes))  //There are some actions with no forms if this is true
							
							APPEND TO ARRAY:C911(SD2_at_FormNames; "Standard Scheduled Item Entry")  //even if it is blank
							
							
						End if 
						
				End case 
				//TRACE
				$_bo_Continue:=False:C215
				If (Size of array:C274(SD2_at_FormNames)>1)  //| (True)  `user needs to select the entry type-the action code NOT the form to use.
					ARRAY TEXT:C222($_at_ActionNames; 0)
					QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes)
					SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes; [ACTIONS:13]Action_Name:2; $_at_TempActionNames)
					
					For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
						$_l_FieldRow:=Find in array:C230($_at_ActionCodes; SD2_at_ActionCodes{$_l_actionsIndex})
						If ($_l_FieldRow>0)  //it should be
							APPEND TO ARRAY:C911($_at_ActionNames; $_at_TempActionNames{$_l_FieldRow})
						Else 
							APPEND TO ARRAY:C911($_at_ActionNames; SD2_at_ActionCodes{$_l_actionsIndex})
						End if 
					End for 
					
					$_bo_Create:=False:C215
					$_l_ActionRowSeleced:=GEN_RequestViaPopUp(->$_at_ActionNames; ->$nul; "Select Schedule type to create"; False:C215; ->$_bo_Create; "Stop"; "Enter")
					If ($_l_ActionRowSeleced>0)
						$_t_ActionCode:=SD2_at_ActionCodes{$_l_ActionRowSeleced}
						ARRAY TEXT:C222(SD2_at_ActionCodes; 1)
						SD2_at_ActionCodes{1}:=$_t_ActionCode
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
						End if 
						If (SD2_t_VirtualFormName="")
							//user needs to set up the form to use for this action
							//Use the default
							SD2_t_VirtualFormName:="Standard Scheduled Item Entry"
							
							$_bo_Continue:=True:C214
						End if 
						$_l_FormRow:=Find in array:C230(SD2_at_DiaryEntryForm; SD2_t_VirtualFormName)
						If ($_l_FormRow>0)  //it should be
							SD2_t_VirtualFormName:=SD2_at_RealFormName{$_l_FormRow}
							FORM SET INPUT:C55([DIARY:12]; SD2_t_VirtualFormName)
							WIN_t_CurrentInputForm:=SD2_t_VirtualFormName
							$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+SD2_t_VirtualFormName
						End if 
						$_bo_Continue:=True:C214
					End if 
					
				Else 
					//there is only one type
					$_l_FormRow:=Find in array:C230(SD2_at_DiaryEntryForm; SD2_at_FormNames{1})
					If ($_l_FormRow>0)  //it should be
						SD2_t_VirtualFormName:=SD2_at_RealFormName{$_l_FormRow}
						FORM SET INPUT:C55([DIARY:12]; SD2_t_VirtualFormName)
						WIN_t_CurrentInputForm:=SD2_t_VirtualFormName
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+SD2_t_VirtualFormName
					End if 
					//TRACE
					$_bo_Continue:=True:C214
				End if 
			Else 
				Case of 
					: ($_t_EntryFormName="Schedule")
						FORM SET INPUT:C55([DIARY:12]; "SD2_DefScheduleEntry")
						WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"SD2_DefScheduleEntry"
						$_bo_Continue:=True:C214
				End case 
				
				//if there are multiple action codes its fine if we know the form because we can put a drop down on there
			End if 
			
			//```
			
		: (SD2_l_EntryPoint=4)
			//TRACE
			//Workflow window
			//This will get passed a workflow type to create. if that is blank then we will get the workflow actions.
			//if we know the workflow we can get the action code to create from the workflow.
			ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
			SD2_t_ActionCode:=""
			If (Count parameters:C259>=2)
				//COPY ARRAY($3->;SD2_at_ActionCodes)
			End if 
			Case of 
				: (Size of array:C274(SD2_at_ActionCodes)=0)
					//No action codes??
				: (Size of array:C274(SD2_at_ActionCodes)=1)
					SD2_t_ActionCode:=SD2_at_ActionCodes{1}
					ARRAY TEXT:C222(SD2_at_FormNames; 0)
					//Get the form name for that diary action
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
					SD2_ActionAttributesToArrays
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
					If ($_l_FieldRow>0)
						SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
					End if 
					If (SD2_t_VirtualFormName="")
						//user needs to set up the form to use for this action
					End if 
				: (Size of array:C274(SD2_at_ActionCodes)>1)
					ARRAY TEXT:C222(SD2_at_ActionCodeForms; 0)
					ARRAY TEXT:C222(SD2_at_FormNames; 0)
					$_l_ActionsWithForms:=0
					For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
							APPEND TO ARRAY:C911(SD2_at_ActionCodeForms; $_t_VirtualFormName)  //even if it is blank
							If ($_t_VirtualFormName#"")
								$_l_ActionsWithForms:=$_l_ActionsWithForms+1
								$_l_FormRow:=Find in array:C230(SD2_at_FormNames; $_t_VirtualFormName)
								If ($_l_FormRow<0)
									APPEND TO ARRAY:C911(SD2_at_FormNames; $_t_VirtualFormName)
								End if 
							End if 
						End if 
					End for 
					//we now have a group of form names if any of the actions do not have a form we have to add 'other to the list
					If ($_l_ActionsWithForms<Size of array:C274(SD2_at_ActionCodes))
						If (Size of array:C274(SD2_at_FormNames)>0)
							//there is at least one form name
							APPEND TO ARRAY:C911(SD2_at_FormNames; "-")  //even if it is blank
							APPEND TO ARRAY:C911(SD2_at_FormNames; "Other...")  //even if it is blank
						Else 
							//none of the  actions had a form name..no point in having OTHER
							For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_DiaryEntryForm))  //this was set up in SD2_loadDiarFormnames
								APPEND TO ARRAY:C911(SD2_at_FormNames; SD2_at_DiaryEntryForm{$_l_actionsIndex})
							End for 
						End if 
					End if 
			End case 
			If (Size of array:C274(SD2_at_FormNames)>1)
				//user needs to select the entry type
				
			Else 
				//there is only one type
			End if 
			
			
		: (SD2_l_EntryPoint=5)
			//History Window
			//all diary actions avaiable to this user..except timed functions
			SD_LoadPrefs(<>PER_l_CurrentUserID)
			For ($_l_actionsIndex; Size of array:C274(SD_at_DiaryActionNames); 1; -1)
				If (SD_ai_ActionCodes{$_l_actionsIndex}=0)
					DELETE FROM ARRAY:C228(SD_ai_ActionCodes; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_at_ActionCodes; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_at_DiaryActionNames; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_al_ActionTime; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_ai_ActionCodesOSW; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_al_ActionCodesOST; $_l_actionsIndex)
					DELETE FROM ARRAY:C228(SD_at_ActioncodesOST; $_l_actionsIndex)
				End if 
			End for 
			If (Not:C34(<>SD2_bo_ALLTypeActionsInited))
				//This is going to find all non timed action diary records
				ARRAY TEXT:C222(<>SD2_at_AllActionCodes; 0)
				ALL RECORDS:C47([ACTIONS:13])
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCodes; [ACTIONS:13]xID:12; $_al_AllActionIDS)
				ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				For ($_l_actionsIndex; 1; Size of array:C274($_at_AllActionCodes))
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_actionsIndex})
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					
					SD2_ActionAttributesToArrays
					$_bo_OK:=False:C215
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
					If ($_l_FieldRow>0)
						If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})>0)
							$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
						Else 
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
					End if 
					If ($_bo_OK)  // This ensures we only include
						APPEND TO ARRAY:C911(<>SD2_at_AllActionCodes; $_at_AllActionCodes{$_l_actionsIndex})
					End if 
				End for 
				<>SD2_bo_ALLTypeActionsInited:=True:C214  //SO WE DO NOT NEED TO DO THAT AGAIN-
				//NOTE THAT IF AN ACTION IS MODIFIED THIS HAS TO BE SET BACK TO FALSE VIA THE SERVER ON ALL CLIENTS
				
			End if 
			ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
			SD2_t_ActionCode:=""
			For ($_l_actionsIndex; 1; Size of array:C274(SD_at_ActionCodes))
				If (Find in array:C230(<>SD2_at_AllActionCodes; SD_at_ActionCodes{$_l_actionsIndex})>0)
					APPEND TO ARRAY:C911(SD2_at_ActionCodes; SD_at_ActionCodes{$_l_actionsIndex})
				End if 
			End for 
			Case of 
				: (Size of array:C274(SD2_at_ActionCodes)=0)
					//No action codes??
				: (Size of array:C274(SD2_at_ActionCodes)=1)
					SD2_t_ActionCode:=SD2_at_ActionCodes{1}
					ARRAY TEXT:C222(SD2_at_FormNames; 0)
					//Get the form name for that diary action
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
					SD2_ActionAttributesToArrays
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
					If ($_l_FieldRow>0)
						SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
					End if 
					If (SD2_t_VirtualFormName="")
						//user needs to set up the form to use for this action
					End if 
				: (Size of array:C274(SD2_at_ActionCodes)>1)
					ARRAY TEXT:C222(SD2_at_ActionCodeForms; 0)
					ARRAY TEXT:C222(SD2_at_FormNames; 0)
					$_l_ActionsWithForms:=0
					For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
							APPEND TO ARRAY:C911(SD2_at_ActionCodeForms; $_t_VirtualFormName)  //even if it is blank
							If ($_t_VirtualFormName#"")
								$_l_ActionsWithForms:=$_l_ActionsWithForms+1
								$_l_FormRow:=Find in array:C230(SD2_at_FormNames; $_t_VirtualFormName)
								If ($_l_FormRow<0)
									APPEND TO ARRAY:C911(SD2_at_FormNames; $_t_VirtualFormName)
								End if 
							End if 
						End if 
					End for 
					//we now have a group of form names if any of the actions do not have a form we have to add 'other to the list
					If ($_l_ActionsWithForms<Size of array:C274(SD2_at_ActionCodes))
						If (Size of array:C274(SD2_at_FormNames)>0)
							//there is at least one form name
							APPEND TO ARRAY:C911(SD2_at_FormNames; "-")  //even if it is blank
							APPEND TO ARRAY:C911(SD2_at_FormNames; "Other...")  //even if it is blank
						Else 
							//none of the  actions had a form name..no point in having OTHER
							For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_DiaryEntryForm))  //this was set up in SD2_loadDiarFormnames
								APPEND TO ARRAY:C911(SD2_at_FormNames; SD2_at_DiaryEntryForm{$_l_actionsIndex})
							End for 
						End if 
					End if 
			End case 
			If (Size of array:C274(SD2_at_FormNames)>1)
				//user needs to select the entry type
				
			Else 
				//there is only one type
			End if 
			
			
		: (SD2_l_EntryPoint=6)
			//coming from a macro
			//we must either be passed an action code in $3 or a entry type in $4
			
			If (Count parameters:C259>=2)
				SD2_t_ActionCode:=SD2_at_ActionCodes{1}
				If (Count parameters:C259>=3)
					//SD2_t_VirtualFormName:=$_at_ActionForm
				End if 
			End if 
			If (SD2_t_ActionCode#"")
				If (SD2_t_VirtualFormName="")
					// we know the action code but not the form
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
					SD2_ActionAttributesToArrays
					$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
					If ($_l_FieldRow>0)
						SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
					End if 
					If (SD2_t_VirtualFormName="")
						//user needs to set up the form to use for this action
					End if 
					//
				Else 
					//we know the entry form and the action code
					
				End if 
			Else 
				//we don't know the action
				If (SD2_t_VirtualFormName="")
					//CANNOT CONTINUE-no action code or entry form
				Else 
					//we have a form name but no action code so we select alll action codes that use this entry form
					ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
					ALL RECORDS:C47([ACTIONS:13])
					SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
					For ($_l_actionsIndex; 1; Size of array:C274($_at_ActionCodes))
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_ActionCodes{$_l_actionsIndex})
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
							If ($_t_VirtualFormName=SD2_t_VirtualFormName)
								APPEND TO ARRAY:C911(SD2_at_ActionCodes; $_at_ActionCodes{$_l_actionsIndex})
							End if 
						End if 
						
					End for 
				End if 
			End if 
			
		: (SD2_l_EntryPoint=7)  //(add diary record)
			//tool bar
			If (Count parameters:C259>=2)
				//if $3 is passed here it is the 'type'
				//translate the types to action codes....
				//The types are..enter Service call..currently thats the only one
				Case of 
					: ($3="Service Call")
						SD2_t_ActionCode:="SVS"
						//This action code has 'open original item..which in this case is a service call
						SD2_l_InputTable:=Table:C252(->[SERVICE_CALLS:20])
				End case 
				
				
				
			Else 
				//no paramters selected-just 'enter to diary'
				//all diary actions avaiable to this user..except timed functions
				SD_LoadPrefs(<>PER_l_CurrentUserID)
				For ($_l_actionsIndex; Size of array:C274(SD_at_DiaryActionNames); 1; -1)
					If (SD_ai_ActionCodes{$_l_actionsIndex}=0)
						DELETE FROM ARRAY:C228(SD_ai_ActionCodes; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_at_ActionCodes; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_at_DiaryActionNames; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_al_ActionTime; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_ai_ActionCodesOSW; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_al_ActionCodesOST; $_l_actionsIndex)
						DELETE FROM ARRAY:C228(SD_at_ActioncodesOST; $_l_actionsIndex)
					End if 
				End for 
				If (Not:C34(<>SD2_bo_ALLTypeActionsInited))
					//This is going to find all non timed action diary records
					ARRAY TEXT:C222(<>SD2_at_AllActionCodes; 0)
					ALL RECORDS:C47([ACTIONS:13])
					SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCodes; [ACTIONS:13]xID:12; $_al_AllActionIDS)
					ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
					ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
					For ($_l_actionsIndex; 1; Size of array:C274($_at_AllActionCodes))
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_actionsIndex})
						ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
						
						SD2_ActionAttributesToArrays
						$_bo_OK:=False:C215
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
						If ($_l_FieldRow>0)
							If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})>0)
								$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
							Else 
								$_bo_OK:=True:C214
							End if 
						Else 
							$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
						End if 
						If ($_bo_OK)  // This ensures we only include
							APPEND TO ARRAY:C911(<>SD2_at_AllActionCodes; $_at_AllActionCodes{$_l_actionsIndex})
						End if 
					End for 
					<>SD2_bo_ALLTypeActionsInited:=True:C214  //SO WE DO NOT NEED TO DO THAT AGAIN-
					//NOTE THAT IF AN ACTION IS MODIFIED THIS HAS TO BE SET BACK TO FALSE VIA THE SERVER ON ALL CLIENTS
					
				End if 
				ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
				SD2_t_ActionCode:=""
				For ($_l_actionsIndex; 1; Size of array:C274(SD_at_ActionCodes))
					If (Find in array:C230(<>SD2_at_AllActionCodes; SD_at_ActionCodes{$_l_actionsIndex})>0)
						APPEND TO ARRAY:C911(SD2_at_ActionCodes; SD_at_ActionCodes{$_l_actionsIndex})
					End if 
				End for 
				Case of 
					: (Size of array:C274(SD2_at_ActionCodes)=0)
						//No action codes??
					: (Size of array:C274(SD2_at_ActionCodes)=1)
						SD2_t_ActionCode:=SD2_at_ActionCodes{1}
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						//Get the form name for that diary action
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_t_ActionCode)
						SD2_ActionAttributesToArrays
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
						If ($_l_FieldRow>0)
							SD2_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
						End if 
						If (SD2_t_VirtualFormName="")
							//user needs to set up the form to use for this action
						End if 
					: (Size of array:C274(SD2_at_ActionCodes)>1)
						ARRAY TEXT:C222(SD2_at_ActionCodeForms; 0)
						ARRAY TEXT:C222(SD2_at_FormNames; 0)
						$_l_ActionsWithForms:=0
						For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
							SD2_ActionAttributesToArrays
							$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
							If ($_l_FieldRow>0)
								$_t_VirtualFormName:=SD2_at_ActionVirtFieldDataTXT{$_l_FieldRow}
								APPEND TO ARRAY:C911(SD2_at_ActionCodeForms; $_t_VirtualFormName)  //even if it is blank
								If ($_t_VirtualFormName#"")
									$_l_ActionsWithForms:=$_l_ActionsWithForms+1
									$_l_FormRow:=Find in array:C230(SD2_at_FormNames; $_t_VirtualFormName)
									If ($_l_FormRow<0)
										APPEND TO ARRAY:C911(SD2_at_FormNames; $_t_VirtualFormName)
									End if 
								End if 
							End if 
						End for 
						//we now have a group of form names if any of the actions do not have a form we have to add 'other to the list
						If ($_l_ActionsWithForms<Size of array:C274(SD2_at_ActionCodes))
							If (Size of array:C274(SD2_at_FormNames)>0)
								//there is at least one form name
								APPEND TO ARRAY:C911(SD2_at_FormNames; "-")  //even if it is blank
								APPEND TO ARRAY:C911(SD2_at_FormNames; "Other...")  //even if it is blank
							Else 
								//none of the  actions had a form name..no point in having OTHER
								For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_DiaryEntryForm))  //this was set up in SD2_loadDiarFormnames
									APPEND TO ARRAY:C911(SD2_at_FormNames; SD2_at_DiaryEntryForm{$_l_actionsIndex})
								End for 
							End if 
						End if 
				End case 
				If (Size of array:C274(SD2_at_FormNames)>1)
					//user needs to select the entry type
					
				Else 
					//there is only one type
				End if 
				
				
			End if 
		: (SD2_l_EntryPoint=8)
			
			//menu
			Case of 
				: ($3="Schedule")
					//TRACE
					SD_LoadPrefs(<>PER_l_CurrentUserID)
					
					SD2_GetActionsRangeByLocation("Schedule")
					ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
					For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionsRange))
						$_l_FieldRow:=Find in array:C230(SD_at_ActionCodes; SD2_at_ActionsRange{$_l_actionsIndex})
						If ($_l_FieldRow>0)
							If (SD_ai_ActionCodes{$_l_FieldRow}>0)
								APPEND TO ARRAY:C911(SD2_at_ActionCodes; SD2_at_ActionsRange{$_l_actionsIndex})
								
							End if 
						End if 
					End for 
					
					//SD2_GetActionsRangeByLocation ("Schedule")
					//Recall This method with the appropriate
					//$Nul:=""
					SD2_AddDiaryRecord("3"; "0"; $3)
					//call back here if there is one!
					$_bo_Continue:=False:C215
					
				: ($3="Work Task") | ($3="Workflow")
					//Workflows can only be created for workflows that DO not get initated by a diary action.
					
					//recall this method
					//before we recall the method we need to get the workflow type
					ALL RECORDS:C47([WORKFLOW_CONTROL:51])
					
					SELECTION TO ARRAY:C260([WORKFLOW_CONTROL:51]Workflow_name:18; $_at_WorkflowNames; [WORKFLOW_CONTROL:51]WFControl_Code:10; $_at_WorkflowCodes)
					ARRAY TEXT:C222(SD2_at_WorkFlowNames; 0)
					ARRAY TEXT:C222(SD2_at_WorkFlowCodes; 0)
					FIRST RECORD:C50([WORKFLOW_CONTROL:51])
					ARRAY TEXT:C222($_at_macroCodes; 0)
					ARRAY LONGINT:C221($_al_WorkflowTables; 0)
					ARRAY TEXT:C222($_at_macroCodes; 0)
					ARRAY TEXT:C222($_at_macroCodes; 0)
					For ($_l_actionsIndex; 1; Size of array:C274($_at_WorkflowNames))
						$_l_offset:=0
						If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
							BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_macroCodes; $_l_offset)
							If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
								BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_al_WorkflowTables; $_l_offset)
								
								If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
									BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_macroCodes; $_l_offset)
									If (BLOB size:C605([WORKFLOW_CONTROL:51]WF_Control:17)>$_l_offset)
										BLOB TO VARIABLE:C533([WORKFLOW_CONTROL:51]WF_Control:17; $_at_macroCodes; $_l_offset)
									End if 
								End if 
							End if 
							$_l_ArraySize:=Size of array:C274($_at_macroCodes)
							ARRAY TEXT:C222($_at_macroCodes; $_l_ArraySize)
							ARRAY LONGINT:C221($_al_WorkflowTables; $_l_ArraySize)
							ARRAY TEXT:C222($_at_macroCodes; $_l_ArraySize)
							If ($_l_ArraySize>0)
								APPEND TO ARRAY:C911(SD2_at_WorkFlowCodes; [WORKFLOW_CONTROL:51]WFControl_Code:10)
								APPEND TO ARRAY:C911(SD2_at_WorkFlowNames; [WORKFLOW_CONTROL:51]Workflow_name:18)
								If ([WORKFLOW_CONTROL:51]Workflow_name:18="")
									SD2_at_WorkFlowNames{Size of array:C274(SD2_at_WorkFlowNames)}:=[WORKFLOW_CONTROL:51]WFControl_Code:10
								End if 
							End if 
						End if 
						NEXT RECORD:C51([WORKFLOW_CONTROL:51])
						
					End for 
					If (Size of array:C274(SD2_at_WorkFlowNames)>0)
						
						$_bo_Create:=False:C215
						$_l_WFSelected:=GEN_RequestViaPopUp(->SD2_at_WorkFlowNames; ->$nul; "Select workflow type to create"; False:C215; ->$_bo_Create; "Stop"; "Enter")
						If ($_l_WFSelected>0)
							//$Nul:=""
							SD2_AddDiaryRecord("4"; "0"; $3)
							
						Else 
							$_bo_Continue:=False:C215
						End if 
					Else 
						//No workflow so must be just an entry to the workflow part of diary...
						Gen_Alert("No Workflow has been setup in the system!")
						
					End if 
					
					//any other values?
					$_bo_Continue:=False:C215
					
					
				: ($3="Timed Function")
					//find diary actions of the correct type
					
				: ($3="Create Document")
					//similar to existing menu item
				: ($3="Create Email")
					//similare to existing menu item
				: ($3="Enter TC")  // enter time and cost
			End case 
		: (SD2_l_EntryPoint=9)
			
		: (SD2_l_EntryPoint=0)
			//Unkown
	End case 
	//TRACE
	If ($_bo_Continue)
		//Open window. set a couple of variables here
		//``
		//$RelationshipTables{$_l_actionsIndex}:=◊SD2_al_RelationTableParameter{$_l_actionsIndex}
		//$RelationshipFields{$_l_actionsIndex}:=◊SD2_al_RelationFieldParameter{$_l_actionsIndex}
		//$RelationshipIDS{$_l_actionsIndex}:=◊SD_al_RelationshiptIDParameter{$_l_actionsIndex}
		//$RelationshipCodes{$_l_actionsIndex}:=◊SD2_at_RelationsShipCodeParam{$_l_actionsIndex}
		//``
		//Make sure this is set if we know the action code or range SD2_at_TabactionCodes, SD2_t_WhoseDiary for the person to add it do=current user
		Case of 
			: (SD2_l_InputTable=Table:C252(->[DIARY:12]))
				If ($_t_EntryFormName#"")
					WIN_t_CurrentInputForm:=$_t_EntryFormName
					$_l_EntryFormTable:=Table:C252(->[DIARY:12])
					SD2_t_VirtualFormName:=$_t_EntryFormName
				Else 
					If (SD2_t_VirtualFormName#"STD_INPUT")
						$_l_FormRow:=Find in array:C230(SD2_at_DiaryEntryForm; SD2_t_VirtualFormName)
					Else 
						$_l_FormRow:=999
					End if 
					If ($_l_FormRow>0)  //it should be
						$_t_FormTitle:="Enter to Diary"
						If ($_l_FormRow=999)
							WIN_t_CurrentInputForm:="Diary_inNew"
							$_l_EntryFormTable:=Table:C252(->[DIARY:12])
							
							
						Else 
							WIN_t_CurrentInputForm:=SD2_at_RealFormName{$_l_FieldRow}
							$_l_EntryFormTable:=SD2_al_RealFormTable{$_l_FieldRow}
						End if 
					End if 
				End if 
				Case of 
					: ($_l_EntryFormTable=Table:C252(->[DIARY:12]))
						If (SD2_t_ActionCode#"")
							SD2_t_CreateActionCode:=SD2_t_ActionCode
							SD2_t_InputActionCode:=SD2_t_ActionCode
						Else 
							ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
							For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_ActionCodes))
								APPEND TO ARRAY:C911(SD2_at_ActionCodes; SD2_at_ActionCodes{$_l_actionsIndex})
								
							End for 
							
						End if 
						If (Size of array:C274(SD2_al_RelationshipFields)>0)
							ARRAY TEXT:C222(SD2_at_RelationShipnames; Size of array:C274(SD2_at_RelationshipCodes))
							For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_RelationShipnames))
								SD2_at_RelationShipnames{$_l_actionsIndex}:=SD2_GetRelationshipname(SD2_al_RelationshipTables{$_l_actionsIndex}; SD2_al_RelationshipFields{$_l_actionsIndex})
								
							End for 
							
							
						End if 
						SD2_bo_LoadRelationsFromArray:=True:C214
						SD2_t_SELInputFormName:=SD2_t_VirtualFormName
						If (WIN_t_CurrentInputForm="Schedule")
							WIN_t_CurrentInputForm:="Diary_In"
							
						End if 
						SD2_t_WhoseDiary:=<>PER_t_CurrentUserInitials
						Open_Pro_Window($_t_FormTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
						FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
						ADD RECORD:C56([DIARY:12]; *)
						SD2_bo_LoadRelationsFromArray:=False:C215
					Else 
				End case 
				
			Else 
				If (Count parameters:C259>=3)
					//form name was passed in
					$_l_EntryFormTable:=Table:C252(->[DIARY:12])
					If (SD2_t_ActionCode#"")
						SD2_t_CreateActionCode:=SD2_t_ActionCode
						SD2_t_InputActionCode:=SD2_t_ActionCode
					Else 
						//ARRAY TEXT(SD2_at_ActionCodes;0)
						//For ($_l_actionsIndex;1;Size of array(SD2_at_ActionCodes))
						//APPEND TO ARRAY(SD2_at_ActionCodes;SD2_at_ActionCodes{$_l_actionsIndex})
						//End for
						
					End if 
					If (Size of array:C274(SD2_al_RelationshipFields)>0)
						ARRAY TEXT:C222(SD2_at_RelationShipnames; Size of array:C274(SD2_at_RelationshipCodes))
						For ($_l_actionsIndex; 1; Size of array:C274(SD2_at_RelationShipnames))
							SD2_at_RelationShipnames{$_l_actionsIndex}:=SD2_GetRelationshipname(SD2_al_RelationshipTables{$_l_actionsIndex}; SD2_al_RelationshipFields{$_l_actionsIndex})
							
						End for 
						
						
					End if 
					SD2_t_SELInputFormName:=SD2_t_VirtualFormName
					SD2_t_WhoseDiary:=<>PER_t_CurrentUserInitials
					
					Open_Pro_Window($_t_FormTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
					FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
					ADD RECORD:C56([DIARY:12]; *)
					
				End if 
				
				
		End case 
	End if 
Else 
	//Gen_Alert ("Sorry incorrect Values have been passed to this function!")
End if 
ERR_MethodTrackerReturn("SD2_AddDiaryRecord"; $_t_oldMethodName)
