If (False:C215)
	//object Name: [USER]File_StatesManager.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(ST_at_2DStateCodes;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_LONGINT:C283($_l_HighStateNUM; $_l_NextStateNUM; $_l_TableRow; ST_l_Modified; STATE_l_RelateTableID)
	C_TEXT:C284($_t_oldMethodName; STATE_t_Code; State_t_TableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Variable10"; Form event code:C388)

STATE_l_RelateTableID:=STATE_al_RelatedTables{STATE_at_RelatedTableNames}
State_t_TableName:=STATE_at_RelatedTableNames{STATE_at_RelatedTableNames}

//set the state code to highest +10
//if the user re-orders them
//then when we exit the page we need to update the data
$_l_HighStateNUM:=0
$_l_TableRow:=Find in array:C230(STATE_al_RelatedTables; STATE_l_RelateTableID)
If ($_l_TableRow>0)  //it should be
	$_l_HighStateNUM:=Num:C11(ST_at_2DStateCodes{$_l_TableRow}{Size of array:C274(ST_at_2DStateCodes{$_l_TableRow})})
End if 
$_l_NextStateNUM:=AA_GetNextID(->[TABLE_RECORD_STATES:90]State_Code:1; $_l_HighStateNUM+1)
STATE_t_Code:=String:C10($_l_NextStateNUM)
ST_l_Modified:=1
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Variable10"; $_t_oldMethodName)
