If (False:C215)
	//object Name: [USER]File_StatesManager.Button3
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
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_LONGINT:C283($_l_Index; ST_l_Modified; ST_l_StateClass; ST_l_StateRef; State_l_PipelineStatus; STATE_l_RelateTableID)
	C_TEXT:C284($_t_oldMethodName; State_t_AbbrevEntryName; STATE_t_ClassName; STATE_t_Code; State_t_EntryName; State_t_ListName; State_t_PipeLineStatus; STATE_t_SelectedStateRef; State_t_TableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Button3"; Form event code:C388)
If (Num:C11(STATE_t_Code)<999999999)  //& (Num(STATE_t_Code)>0)
	If (State_t_ListName#"")
		ST_SaveState(ST_l_StateRef)
		OBJECT SET ENTERABLE:C238(State_t_ListName; False:C215)
		OBJECT SET ENTERABLE:C238(State_t_EntryName; False:C215)
		OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; False:C215)
		OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; False:C215)
		OBJECT SET VISIBLE:C603(ST_at_PipelineState; False:C215)
		ST_l_StateClass:=0
		STATE_t_ClassName:=""
		STATE_t_Code:=""
		State_t_ListName:=""
		State_t_EntryName:=""
		State_t_AbbrevEntryName:=""
		STATE_l_RelateTableID:=0
		State_l_PipelineStatus:=0
		STATE_t_SelectedStateRef:=""
		State_t_PipeLineStatus:=""
		State_t_TableName:=""
		ST_l_Modified:=0
		ST_l_StateRef:=0
		For ($_l_Index; 1; Size of array:C274(ST_al_CodeUsed))
			ST_al_CodeUsed{$_l_Index}:=0
		End for 
	Else 
		Gen_Alert("You must give this state a name")
		
	End if 
Else 
	Gen_Alert("The state code must be less than 100")
	
End if 

//Clear Functions
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Button3"; $_t_oldMethodName)
