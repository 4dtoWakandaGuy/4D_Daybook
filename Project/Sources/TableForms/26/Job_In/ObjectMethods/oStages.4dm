If (False:C215)
	//object Name: [JOBS]Job_In.oStages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; IP_l_Message)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.oStages"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->JOB_lb_Stages; ""; $_t_VariableName)
		LBi_AreaScript(->JOB_aptr_LBStageSettings; 0; [JOBS:26]Job_Code:1; ->JOB_at_ModeStage; $_l_Row; $_t_VariableName; "JOB_LBI_JCStages"; $_l_CurrentSortColumn)
		//kmw 15/02/07 -also alter above line so it makes call to the new method "JOB_LBI_JCStages" instead of "JOB_LBI_Stages"
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_bo_Update:=False:C215
		
		If ($_l_event=On Data Change:K2:15) | ($_l_event=On Losing Focus:K2:8)
			//DB_SaveRecord (->[ORDER ITEMS])
			//DB_SaveRecord (->[JOB STAGES])
			IP_l_Message:=111  //19/03/07 -kmw
			POST OUTSIDE CALL:C329(Current process:C322)  //19/03/07 -kmw
		End if 
		
		//LBi_AreaScript (->JOB_aptr_LBStageSettings;0;[JOBS]Job Code;->JOB_at_ModeStage;$_l_Row;$_t_VariableName;"JOB_LBI_Stages")
		LBi_AreaScript(->JOB_aptr_LBStageSettings; 1; [JOBS:26]Job_Code:1; ->JOB_at_ModeStage; $_l_Row; $_t_VariableName; "JOB_LBI_JCStages")  //kmw 06/12/06 - altered to start in new process using Nigel's new parameter
		
		
End case 
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.oStages"; $_t_oldMethodName)
