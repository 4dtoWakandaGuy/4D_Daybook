If (False:C215)
	//object Method Name: Object Name:      [ACTIONS].Action_In.Variable23
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	//ARRAY TEXT(SD2_at_WhoseDiary;0)
	C_LONGINT:C283($_l_PersonIndex; $_l_PersonRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable23"; Form event code:C388)
SD2_EditActionOwner(->SD2_al_WhoseDiary)
ARRAY TEXT:C222(SD2_at_WhoseDiary; Size of array:C274(SD2_al_WhoseDiary))
For ($_l_PersonIndex; 1; Size of array:C274(SD2_al_WhoseDiary))
	$_l_PersonRow:=Find in array:C230(SD_al_ActionAddPersonelID; SD2_al_WhoseDiary{$_l_PersonIndex})
	If ($_l_PersonRow>0)
		SD2_at_WhoseDiary{$_l_PersonIndex}:=SD_at_actionAdd{$_l_PersonRow}
	Else 
		SD2_at_WhoseDiary{$_l_PersonIndex}:="???"
	End if 
	
End for 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable23"; $_t_oldMethodName)
