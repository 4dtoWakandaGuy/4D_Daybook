If (False:C215)
	//Table Form Method Name: [JOB PERSONNEL]dJobPers_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(JOB_at_PerSearchTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_defaultparams; $_l_event; $_l_MenuSelected; $_l_MenuSelectedi; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS)
	C_LONGINT:C283(cNAA; cNAL; cSIS; rHold; SM_l_QueryMode; SM_l_QuerySearchID; vJ; vPuButt; xCancel; xOK)
	C_TEXT:C284($_t_JobCode; $_t_MenuSelectedenuname; $_t_oldMethodName; $_t_Person; $_t_Stage; VJobCode; vPerson; Vstage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOB PERSONNEL].dJobPers_Sel"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SET MENU BAR:C67(56)
		OpenHelp(Table:C252(->[JOB PERSONNEL:48]); "dJobPers_Sel")
		ARRAY TEXT:C222(JOB_at_PerSearchTab; 1)
		
		JOB_at_PerSearchTab{1}:="Jobs"
		
		JOB_at_PerSearchTab:=0
		
		SM_LoadSearchParameterNames(Table:C252(->[JOB PERSONNEL:48]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		rHold:=0
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Jobs"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		
		WS_bo_InsearchScreen:=True:C214
		Sel_LProc
		WS_AutoscreenSize(2; 277; 428)
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[JOB PERSONNEL:48]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(JOB_at_PerSearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_l_MenuSelected:=Menu selected:C152
				$_t_MenuSelectedenuname:=Get menu title:C430($_l_MenuSelected\65536)
				If ($_t_MenuSelectedenuname="Find")
					//If (($_l_MenuSelected\65536)=2049)
					$_l_MenuSelectedi:=($_l_MenuSelected%65536)
					Case of 
						: ($_l_MenuSelectedi=1)
							
							
							$_t_Person:=vPerson
							$_t_JobCode:=VJobCode
							$_t_Stage:=Vstage
							$_l_SIS:=cSIS
							$_l_NAA:=cNAA
							$_l_NAL:=cNAL
							If (SM_l_QueryMode=0)
								$_l_OK:=Sel_CrossTable(9; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[JOBS:26]; ->vJ; ->vJ; "Jobs_SelP"; "Many"; "JobStages_SelPv"; ""; ->[JOBS:26]Job_Code:1; ->[JOB PERSONNEL:48]Job_Code:1)
							Else 
								$_l_QueryMode:=SM_l_QueryMode
								
								If (SM_l_QueryMode=0) | (SM_l_QueryMode=2)
									$_l_OK:=Sel_CrossTable(9; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[JOBS:26]; ->vJ; ->vJ; "Jobs_SelP"; "Many"; "JobStages_SelPv"; ""; ->[JOBS:26]Job_Code:1; ->[JOB PERSONNEL:48]Job_Code:1; $_l_QueryMode; Table:C252(->[JOB PERSONNEL:48]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
									
								Else 
									$_l_OK:=Sel_CrossTable(9; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[JOBS:26]; ->vJ; ->vJ; "Jobs_SelP"; "Many"; "JobStages_SelPv"; ""; ->[JOBS:26]Job_Code:1; ->[JOB PERSONNEL:48]Job_Code:1; -1; Table:C252(->[JOB PERSONNEL:48]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
									
								End if 
								
								SM_l_QueryMode:=$_l_QueryMode
							End if 
							SET MENU BAR:C67(56)
							SM_LoadSearchParameterNames(Table:C252(->[JOB PERSONNEL:48]); SM_l_QueryMode)
							
							
							vPerson:=$_t_Person
							vJobCode:=$_t_JobCode
							vStage:=$_t_Stage
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
			In_ButtdCall(->[JOB PERSONNEL:48])
		End if 
		<>WS_Search_Message:=0
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dJobPers_Sel"; $_t_oldMethodName)
