If (False:C215)
	//object Name: [JOB_STAGES]JobStage_in.oPerson
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_Persons;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY TEXT(JST_at_ModePersonnel;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn; P_Message)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStage_in.oPerson"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->JST_LB_Persons; ""; $_t_VariableName)
		LBi_AreaScript(->JST_aptr_LBSettings; 0; [JOB_STAGES:47]Job_Stage_code:52; ->JST_at_ModePersonnel; $_l_Row; $_t_VariableName; "JStage_LBI_Personnel"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
		
	Else 
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="")  //added 12/03/07 -kmw
			If ($_l_event=On Data Change:K2:15) | ($_l_event=On Losing Focus:K2:8)
				//DB_SaveRecord (->[ORDER ITEMS])
				//DB_SaveRecord (->[JOB PERSONNEL])
				P_Message:=111  //19/03/07 -kmw
				POST OUTSIDE CALL:C329(Current process:C322)  //19/03/07 -kmw
			End if 
		Else   //added 12/03/07 -kmw
			//do nothing - job stage has been invoiced so this job stage and its lower level records should  not be allowed to be altered.
		End if   //added 12/03/07 -kmw
		
		//LBi_AreaScript (->JST_aptr_LBSettings;0;[JOB STAGES]Job stage code;->JST_at_ModePersonnel;$_l_Row;$_t_VariableName;"JStage_LBI_Personnel")
		LBi_AreaScript(->JST_aptr_LBSettings; 1; [JOB_STAGES:47]Job_Stage_code:52; ->JST_at_ModePersonnel; $_l_Row; $_t_VariableName; "JStage_LBI_Personnel")  //kmw 07/12/06 - altered to start in new process using Nigel's new parameter
		//GOTO AREA([JOB STAGES]Stage Code)
		//GOTO AREA(JST_LB_Persons)
		//CALL PROCESS(Current process)
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStage_in.oPerson"; $_t_oldMethodName)
