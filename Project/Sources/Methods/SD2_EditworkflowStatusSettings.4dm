//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EditworkflowStatusSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 12:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_StatusApplied;0)
	//ARRAY LONGINT(S2_al_ActionStatusIDS;0)
	//ARRAY LONGINT(SD2_al_ActionColours;0)
	//ARRAY LONGINT(SD2_al_ActionTime;0)
	//ARRAY LONGINT(SD2_al_ActionTymeType;0)
	//ARRAY LONGINT(SD2_al_StatusRGB;0)
	//ARRAY LONGINT(SD2_al_StatusTime;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY TEXT(SD2_at_StatusTimes;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	C_BOOLEAN:C305($6; SD_bo_ShowEmptyTimings; SD2_bo_SaveOnExit)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_StatusIndex; $_l_StatusRow; $_l_TimeTypeRow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; SD2_t_ActionName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EditworkflowStatusSettings")
SD_bo_ShowEmptyTimings:=False:C215
If (Count parameters:C259>=3)
	
End if 
ARRAY LONGINT:C221(S2_al_ActionStatusIDS; 0)
ARRAY LONGINT:C221(SD2_al_ActionColours; 0)
ARRAY LONGINT:C221(SD2_al_ActionTime; 0)
ARRAY LONGINT:C221(SD2_al_ActionTymeType; 0)
COPY ARRAY:C226($3->; SD2_al_ActionColours)

COPY ARRAY:C226($2->; S2_al_ActionStatusIDS)
If (Count parameters:C259>=5)
	
	COPY ARRAY:C226($4->; SD2_al_ActionTime)
	COPY ARRAY:C226($5->; SD2_al_ActionTymeType)
	
End if 
If (Count parameters:C259>=6)
	SD_bo_ShowEmptyTimings:=$6
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1988; "Set workflow Management"; "SD2_CloseWSStatus")

SD2_t_ActionName:=$1
DIALOG:C40("SD2_ActionStatus")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (SD2_bo_SaveOnExit)
	For ($_l_StatusIndex; 1; Size of array:C274(SD2_abo_StatusApplied))
		If (SD2_abo_StatusApplied{$_l_StatusIndex})
			$_l_StatusRow:=Find in array:C230($2->; SD2_al_WorkflowStatus{$_l_StatusIndex})
			If ($_l_StatusRow>0)
				$3->{$_l_StatusRow}:=SD2_al_StatusRGB{$_l_StatusIndex}
				If (Count parameters:C259>=5)
					$4->{$_l_StatusRow}:=SD2_al_StatusTime{$_l_StatusIndex}
					If (SD2_at_StatusTimes{$_l_StatusIndex}#"")
						$_l_TimeTypeRow:=Find in array:C230(SD2_at_TimeType; SD2_at_StatusTimes{$_l_StatusIndex})
						If ($_l_TimeTypeRow>0)
							
							$5->{$_l_StatusRow}:=$_l_TimeTypeRow-1
						Else 
							$5->{$_l_StatusRow}:=0
						End if 
					Else 
						$5->{$_l_StatusRow}:=0
					End if 
				End if 
			Else 
				APPEND TO ARRAY:C911($2->; SD2_al_WorkflowStatus{$_l_StatusIndex})
				APPEND TO ARRAY:C911($3->; SD2_al_StatusRGB{$_l_StatusIndex})
				If (Count parameters:C259>=5)
					APPEND TO ARRAY:C911($4->; SD2_al_StatusTime{$_l_StatusIndex})
					If (SD2_at_StatusTimes{$_l_StatusIndex}#"")
						$_l_TimeTypeRow:=Find in array:C230(SD2_at_TimeType; SD2_at_StatusTimes{$_l_StatusIndex})
						If ($_l_TimeTypeRow>0)
							
							APPEND TO ARRAY:C911($5->; $_l_TimeTypeRow--1)
						Else 
							APPEND TO ARRAY:C911($5->; 0)
						End if 
					Else 
						APPEND TO ARRAY:C911($5->; 0)
					End if 
					
					
				End if 
			End if 
		Else 
			$_l_StatusRow:=Find in array:C230($2->; SD2_al_WorkflowStatus{$_l_StatusIndex})
			If ($_l_StatusRow>0)
				DELETE FROM ARRAY:C228($2->; $_l_StatusRow)
				DELETE FROM ARRAY:C228($3->; $_l_StatusRow)
				If (Count parameters:C259>=5)
					DELETE FROM ARRAY:C228($4->; $_l_StatusRow)
					DELETE FROM ARRAY:C228($4->; $_l_StatusRow)
				End if 
			End if 
		End if 
	End for 
End if 
//Note that the button calling this has to u pdate the other arrays.
ERR_MethodTrackerReturn("SD2_EditworkflowStatusSettings"; $_t_oldMethodName)
