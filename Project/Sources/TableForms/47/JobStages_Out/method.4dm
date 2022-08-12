If (False:C215)
	//Table Form Method Name: [JOB_STAGES]JobStages_Out
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
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; JS_l_SortFieldWas; JS_l_SortOrderWas; JS_l_SortTableWas; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT)
	C_LONGINT:C283(SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].JobStages_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		
		
		If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
			WS_OutputResize
			WIN_bo_Resize:=False:C215
		End if 
		INT_Setoutput(Table:C252(->[JOB_STAGES:47]); WIN_t_CurrentOutputform)
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Display Detail:K2:22)
		If ([JOB_STAGES:47]Job_Stage_code:52#"")
			RELATE ONE:C42([JOB_STAGES:47]Job_Code:1)
		Else 
			REDUCE SELECTION:C351([JOBS:26]; 0)
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOB_STAGES:47]); "JobStages_Out")
		Cache_Initialise
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[JOB_STAGES:47]); "JobStages_Out")
		vButtDisO:="O  P           XT"
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[JOB_STAGES:47]; ->[USER:15]Name:38; ->[USER:15]Name:38; "Job Stages"; ""; "JobStages_Sel"; "JobStages_OutDe"; ""; "Job Stages"; "JobStages_OutCo"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		JS_l_SortFieldWas:=FS_l_SortFieldNUM
		JS_l_SortTableWas:=FS_l_SortTableNUM
		JS_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=JS_l_SortFieldWas
		FS_l_SortTableNUM:=JS_l_SortTableWas
		FS_l_SortDirection:=JS_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[JOB_STAGES:47])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O  P           XT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [JOB_STAGES].JobStages_Out"; $_t_oldMethodName)
