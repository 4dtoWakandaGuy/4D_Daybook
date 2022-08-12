If (False:C215)
	//object Name: [PROJECTS]Projects_In.oJobs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROJ_lb_Jobs;0)
	//ARRAY POINTER(PTR_aptr_LbSetup;0)
	//ARRAY TEXT(PRJ_at_ModeJob;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; AL_t_AreaFocus)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].Projects_In.oJobs"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Getting Focus:K2:7)
		AL_t_AreaFocus:="Jobs"
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->PROJ_lb_Jobs; ""; $_t_VariableName)
		LBi_AreaScript(->PTR_aptr_LbSetup; 0; [PROJECTS:89]Project_Code:1; ->PRJ_at_ModeJob; $_l_Row; $_t_VariableName; "PROJ_LBI_Jobs"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		//LBi_AreaScript (->PTR_aptr_LbSetup;0;[PROJECTS]Project Code;->PRJ_at_ModeJob;$_l_Row;$_t_VariableName;"PROJ_LBI_Jobs")
		LBi_AreaScript(->PTR_aptr_LbSetup; 1; [PROJECTS:89]Project_Code:1; ->PRJ_at_ModeJob; $_l_Row; $_t_VariableName; "PROJ_LBI_Jobs")  //kmw 06/12/06 - altered to start in new process using Nigel's new parameter
End case 
ERR_MethodTrackerReturn("OBJ [PROJECTS].Projects_In.oJobs"; $_t_oldMethodName)
