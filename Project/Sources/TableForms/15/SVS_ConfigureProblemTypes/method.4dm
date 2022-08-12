If (False:C215)
	//Table Form Method Name: [USER]SVS_ConfigureProblemTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 08:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_abo_IsCreated;0)
	//ARRAY BOOLEAN(SVS_lb_ProblemTypes;0)
	//ARRAY BOOLEAN(SVS_lb_WorkFlow;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY TEXT(SD_at_ProblemTypeActionCodes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	//ARRAY TEXT(SVS_at_ActionCodes;0)
	//ARRAY TEXT(SVS_at_ActionName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ActionsRow; $_l_ActionsSIze; $_l_CreatedIndex; $_l_CurrentRow; $_l_event; CONT_l_BUT1; CONT_l_BUT2; CONT_l_BUT3; CONT_l_BUT4; CONT_l_BUT5; CONT_l_BUT6)
	C_LONGINT:C283(CONT_l_BUT7; CONT_l_BUT8; CONT_l_BUT9; DB_l_ButtonClickedFunction; iOk; PTS_l_BUT1; PTS_l_BUT2; PTS_l_BUT3; PTS_l_BUT4; PTS_l_BUT5; PTS_l_BUT6)
	C_LONGINT:C283(PTS_l_BUT7; PTS_l_BUT8; PTS_l_BUT9; SVS_l_ProblemType; SVS_l_ProblemTypeID; SVS_l_ProbTypeID)
	C_TEXT:C284($_t_oldMethodName; oContracttp_COL1; oContracttp_COL2; oContracttp_COL3; oContracttp_COL4; oContracttp_COL5; oContracttp_COL6; oContracttp_COL7; oContracttp_COL8; oContracttp_COL9; oContracttp_HED1)
	C_TEXT:C284(oContracttp_HED2; oContracttp_HED3; oContracttp_HED4; oContracttp_HED5; oContracttp_HED6; oContracttp_HED7; oContracttp_HED8; oContracttp_HED9; oProbtyps_COL1; oProbtyps_COL2; oProbtyps_COL3)
	C_TEXT:C284(oProbtyps_COL4; oProbtyps_COL5; oProbtyps_COL6; oProbtyps_COL7; oProbtyps_COL8; oProbtyps_COL9; oProbtyps_HED1; oProbtyps_HED2; oProbtyps_HED3; oProbtyps_HED4; oProbtyps_HED5)
	C_TEXT:C284(oProbtyps_HED6; oProbtyps_HED7; oProbtyps_HED8; oProbtyps_HED9; SVS_t_problemTypeName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SVS_ConfigureProblemTypes"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SVS_ConfigureProblemTypes")
		SVS_LoadproblemTypes
		ARRAY TEXT:C222(SVS_at_ActionCodes; 0)
		ARRAY TEXT:C222(SVS_at_ActionName; 0)
		ARRAY BOOLEAN:C223(SVS_abo_IsCreated; 0)
		ALL RECORDS:C47([ACTIONS:13])
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SVS_at_ActionCodes; [ACTIONS:13]Action_Name:2; SVS_at_ActionName)
		//This should only inlcude workflow actions
		ARRAY BOOLEAN:C223(SVS_abo_IsCreated; Size of array:C274(SVS_at_ActionCodes))
		SVS_t_problemTypeName:=""
		SVS_l_ProblemType:=0
		
		LB_SetupListbox(->SVS_lb_WorkFlow; "oContracttp"; "CONT_L"; 1; ->SVS_abo_IsCreated; ->SVS_at_ActionCodes; ->SVS_at_ActionName)
		LB_SetColumnHeaders(->SVS_lb_WorkFlow; "CONT_L"; 1; "Create"; "Action Code"; "Action Name")
		LB_SetColumnWidths(->SVS_lb_WorkFlow; "oContracttp"; 1; 35; 90; 90)
		LB_SETENTRYOPTIONS  // doesn't actually do anything ...
		
		LB_StyleSettings(->SVS_lb_WorkFlow; "blue"; 9; "oContracttp"; ->[SERVICE_CALLS:20])
		LB_SetScroll(->SVS_lb_WorkFlow; -3; -2)
		LB_SetEnterable(->SVS_lb_WorkFlow; False:C215; 0)
		LB_SetEnterable(->SVS_lb_WorkFlow; True:C214; 1)
		LB_SetSortOptions(->SVS_lb_WorkFlow; 0)
		//``
		
		//and set up the list box for the list of problem types
		LB_SetupListbox(->SVS_lb_ProblemTypes; "oProbtyps"; "PTS_L"; 1; ->SD2_at_ProblemTypeNames; ->SD2_al_ProblemTypeIDs)
		LB_SetColumnHeaders(->SVS_lb_ProblemTypes; "PTS_L"; 1; "Type Name"; "Type ID")
		LB_SetColumnWidths(->SVS_lb_ProblemTypes; "oProbtyps"; 1; 160; 0)
		LB_SETENTRYOPTIONS  // doesn't actually do anything ...
		
		LB_StyleSettings(->SVS_lb_ProblemTypes; "blue"; 9; "oProbtyps"; ->[SERVICE_CALLS:20])
		LB_SetScroll(->SVS_lb_ProblemTypes; -3; -2)
		LB_SetEnterable(->SVS_lb_ProblemTypes; False:C215; 0)
		LB_SetSortOptions(->SVS_lb_ProblemTypes; 0)
		WS_AutoscreenSize(2; 300; 500)
		INT_SetDialog
		OBJECT SET ENTERABLE:C238(SVS_t_problemTypeName; False:C215)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (iOk=1) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK"))
				SVS_LoadproblemTypes(False:C215)
				ACCEPT:C269
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus"))
				If (SVS_l_ProblemTypeID#0)
					If (SVS_l_ProblemTypeID=-1)
						If (SVS_t_problemTypeName#"")
							SVS_l_ProbTypeID:=AA_GetNextID(->SVS_l_ProbTypeID)
							APPEND TO ARRAY:C911(SD2_al_ProblemTypeIDs; SVS_l_ProbTypeID)
							APPEND TO ARRAY:C911(SD2_at_ProblemTypeNames; SVS_t_problemTypeName)
							INSERT IN ARRAY:C227(SD_at_ProblemTypeActionCodes; Size of array:C274(SD_at_ProblemTypeActionCodes)+1; 1)
							INSERT IN ARRAY:C227(SD_at_ProblemTypeActions; Size of array:C274(SD_at_ProblemTypeActions)+1; 1)
							$_l_ActionsSIze:=Size of array:C274(SD2_al_ProblemTypeIDs)
							SVS_t_problemTypeName:=""
							$_l_CurrentRow:=0
							
							For ($_l_CreatedIndex; 1; Size of array:C274(SVS_abo_IsCreated))
								If (SVS_abo_IsCreated{$_l_CreatedIndex})
									$_l_CurrentRow:=$_l_CurrentRow+1
									If ($_l_CurrentRow>Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ActionsSIze}))
										APPEND TO ARRAY:C911(SD_at_ProblemTypeActionCodes{$_l_ActionsSIze}; SVS_at_ActionCodes{$_l_CreatedIndex})
										APPEND TO ARRAY:C911(SD_at_ProblemTypeActions{$_l_ActionsSIze}; SVS_at_ActionName{$_l_CreatedIndex})
									Else 
										SD_at_ProblemTypeActionCodes{$_l_ActionsSIze}{$_l_CurrentRow}:=SVS_at_ActionCodes{$_l_CreatedIndex}
										SD_at_ProblemTypeActions{$_l_ActionsSIze}{$_l_CurrentRow}:=SVS_at_ActionName{$_l_CreatedIndex}
									End if 
								End if 
							End for 
							
						End if 
					Else 
						//existing-update it
						
						$_l_ActionsRow:=Find in array:C230(SD2_al_ProblemTypeIDs; SVS_l_ProblemTypeID)
						If (SVS_t_problemTypeName#"")
							SD2_at_ProblemTypeNames{$_l_ActionsRow}:=SVS_t_problemTypeName
							SVS_t_problemTypeName:=""
						End if 
						For ($_l_CreatedIndex; 1; Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ActionsRow}))
							SD_at_ProblemTypeActionCodes{$_l_ActionsRow}{$_l_CreatedIndex}:=""
							SD_at_ProblemTypeActions{$_l_ActionsRow}{$_l_CreatedIndex}:=""
						End for 
						$_l_CurrentRow:=0
						For ($_l_CreatedIndex; 1; Size of array:C274(SVS_abo_IsCreated))
							If (SVS_abo_IsCreated{$_l_CreatedIndex})
								$_l_CurrentRow:=$_l_CurrentRow+1
								If ($_l_CurrentRow>Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ActionsRow}))
									APPEND TO ARRAY:C911(SD_at_ProblemTypeActionCodes{$_l_ActionsRow}; SVS_at_ActionCodes{$_l_CreatedIndex})
									APPEND TO ARRAY:C911(SD_at_ProblemTypeActions{$_l_ActionsRow}; SVS_at_ActionName{$_l_CreatedIndex})
								Else 
									SD_at_ProblemTypeActionCodes{$_l_ActionsRow}{$_l_CurrentRow}:=SVS_at_ActionCodes{$_l_CreatedIndex}
									SD_at_ProblemTypeActions{$_l_ActionsRow}{$_l_CurrentRow}:=SVS_at_ActionName{$_l_CreatedIndex}
								End if 
							End if 
						End for 
						
					End if 
				End if 
				
		End case 
		DB_l_ButtonClickedFunction:=0
		
		
		
End case 
ERR_MethodTrackerReturn("FM:SVS_ConfigureProblemTypes"; $_t_oldMethodName)
