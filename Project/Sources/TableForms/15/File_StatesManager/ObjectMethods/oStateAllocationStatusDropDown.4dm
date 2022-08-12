If (False:C215)
	//object Name: [USER]File_StatesManager.Pop-up%2FDrop-down List3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ST_al_PipelineStates;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	C_LONGINT:C283(ST_l_Modified; State_l_PipelineStatus)
	C_TEXT:C284($_t_oldMethodName; State_t_PipeLineStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Pop-up/Drop-down List3"; Form event code:C388)
If (ST_at_PipelineState>0)
	State_l_PipelineStatus:=ST_al_PipelineStates{ST_at_PipelineState}
	State_t_PipeLineStatus:=ST_at_PipelineState{ST_at_PipelineState}
	ST_l_Modified:=1
End if 
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Pop-up/Drop-down List3"; $_t_oldMethodName)
