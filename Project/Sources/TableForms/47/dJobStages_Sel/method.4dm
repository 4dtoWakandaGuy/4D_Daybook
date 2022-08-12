If (False:C215)
	//Table Form Method Name: [JOB_STAGES]dJobStages_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(JOB_at_StageSearchTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_defaultparams; $_l_event; $_l_MenuItem; $_l_NAA; $_l_NAL; $_l_OK; $_l_SelectedMenu; $_l_SIS; cNAA)
	C_LONGINT:C283(cNAL; cSIS; rHold; vJ; vPuButt)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactName; $_t_JobCode; $_t_MenuName; $_t_oldMethodName; $_t_Stage; VcompCode; VcontName; VJobCode; Vstage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].dJobStages_Sel"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SET MENU BAR:C67(56)
		OpenHelp(Table:C252(->[JOB_STAGES:47]); "dJobStages_Sel")
		ARRAY TEXT:C222(JOB_at_StageSearchTab; 1)
		
		JOB_at_StageSearchTab{1}:="Jobs"
		
		JOB_at_StageSearchTab:=0
		
		SM_LoadSearchParameterNames(Table:C252(->[JOB_STAGES:47]))
		
		rHold:=0
		
		WS_bo_InsearchScreen:=True:C214
		Sel_LProc
		WS_AutoscreenSize(2; 277; 428)
		INT_SetDialog
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[JOB_STAGES:47]); <>PER_l_CurrentUserID)
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_l_SelectedMenu:=Menu selected:C152
				$_t_MenuName:=Get menu title:C430($_l_SelectedMenu\65536)
				If ($_t_MenuName="Find")
					// If (($_l_SelectedMenu\65536)=2049)
					$_l_MenuItem:=($_l_SelectedMenu%65536)
					Case of 
						: ($_l_MenuItem=1)
							
							$_t_JobCode:=VJobCode
							$_t_Stage:=Vstage
							$_t_ContactName:=VcontName
							$_t_CompanyCode:=VcompCode
							$_l_SIS:=cSIS
							$_l_NAA:=cNAA
							$_l_NAL:=cNAL
							$_l_OK:=Sel_CrossTable(9; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[JOBS:26]; ->vJ; ->vJ; "Jobs_SelP"; "Many"; "JobPers_SelPvs"; ""; ->[JOBS:26]Job_Code:1; ->[JOB_STAGES:47]Job_Code:1)
							SET MENU BAR:C67(56)
							SM_LoadSearchParameterNames(Table:C252(->[JOB_STAGES:47]))
							
							vJobCode:=$_t_JobCode
							vStage:=$_t_Stage
							vContName:=$_t_ContactName
							vCompCode:=$_t_CompanyCode
							cSIS:=$_l_SIS
							cNAA:=$_l_NAA
							cNAL:=$_l_NAL
							If ($_l_OK>0) & (Not:C34(rHold=1))
								
								ACCEPT:C269
								WS_bo_InsearchScreen:=False:C215
							Else 
								
								
							End if 
					End case 
				End if 
			End if 
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[JOB_STAGES:47])
		End if 
		<>WS_Search_Message:=0
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dJobStages_Sel"; $_t_oldMethodName)
