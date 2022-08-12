If (False:C215)
	//object Name: [PROBLEMS]Problems_In.oProblemtype
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY TEXT(PROB_at_ProblemActions;0)
	//ARRAY TEXT(PROB_at_ProblemTypes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProblemTypeRow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CurrentWinRefOLD; $_l_event)
	C_LONGINT:C283($_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProblemTypeRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROBLEMS].Problems_In.oProblemtype"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PROB_at_ProblemTypes<=Size of array:C274(SD2_at_ProblemTypeNames))
			[PROBLEMS:22]ProblemTypeID:3:=SD2_al_ProblemTypeIDs{PROB_at_ProblemTypes}
		Else 
			
			OBJECT GET COORDINATES:C663(PROB_at_problemtypes; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			HIDE WINDOW:C436
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectTop)
			DIALOG:C40([USER:15]; "SVS_ConfigureProblemTypes")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			SHOW WINDOW:C435
			SVS_LoadproblemTypes
			ARRAY TEXT:C222(PROB_at_Problemtypes; 0)
			COPY ARRAY:C226(SD2_at_ProblemTypeNames; PROB_at_Problemtypes)
			APPEND TO ARRAY:C911(PROB_at_Problemtypes; "-")
			APPEND TO ARRAY:C911(PROB_at_Problemtypes; "Configure problem Types")
			ARRAY TEXT:C222(PROB_at_ProblemActions; 0)
			
			PROB_at_Problemtypes:=0
			If ([PROBLEMS:22]ProblemTypeID:3>0)
				$_l_ProblemTypeRow:=Find in array:C230(SD2_al_ProblemTypeIDs; [PROBLEMS:22]ProblemTypeID:3)
				If ($_l_ProblemTypeRow>0)
					PROB_at_Problemtypes:=$_l_ProblemTypeRow
					For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions{$_l_ProblemTypeRow}))
						APPEND TO ARRAY:C911(PROB_at_ProblemActions; SD_at_ProblemTypeActions{$_l_ProblemTypeRow}{$_l_Index})
					End for 
					
				End if 
				
			End if 
			
			//edit the config
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:Problems_In,PROB_at_ProblemTypes"; $_t_oldMethodName)
