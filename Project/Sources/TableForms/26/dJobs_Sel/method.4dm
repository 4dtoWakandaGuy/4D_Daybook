If (False:C215)
	//Table Form Method Name: [JOBS]dJobs_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(JOB_al_JobClasses;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(JOB_at_JobClasses;0)
	//ARRAY TEXT(JOB_at_SearchTab;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateFrom; $_d_EntryDateTo; $_d_RDateF; $_d_RDateT; $_d_SDateF; $_d_SDateT; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vRDateF; vRDateT; vSDateF)
	C_DATE:C307(vSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ClassID; $_l_CurrentRow; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA)
	C_LONGINT:C283(cNAL; cSIS; JOB_ModuleClassID; JOB_ModuleID; RHold; SM_l_QueryMode; SM_l_QuerySearchID; vClassID)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; VinvF; vInvT)
	C_TEXT:C284($_t_AnalysisCode; $_t_Class; $_t_CompanyCode; $_t_CompName; $_t_ContCode; $_t_ContrCode; $_t_CurrencyCode; $_t_ForeName; $_t_Job; $_t_JobCode; $_t_LayerCode)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderNo; $_t_ProductCode; $_t_Sales; $_t_Stage; $_t_Surname; $_t_Type; ACC_t_CurrencyCode; Vanalysis; vClass; VCompCode)
	C_TEXT:C284(VcompName; VContCOde; VcontrCode; VForename; VJob; VJobCode; Vlayer; VorderNo; VprodCode; Vsales; Vstage)
	C_TEXT:C284(Vsurname; vTitle2; VType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].dJobs_Sel"; Form event code:C388)
Sel_LProc2(->[JOBS:26])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vRDateF:=!00-00-00!
		vRDateT:=!00-00-00!
		vSDateF:=!00-00-00!
		vSDateT:=!00-00-00!
		SRCH_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		SET MENU BAR:C67(51)
		OpenHelp(Table:C252(->[JOBS:26]); "dJobs_Sel")
		ARRAY TEXT:C222(JOB_at_JobClasses; 3)
		ARRAY LONGINT:C221(JOB_al_JobClasses; 3)
		$_l_CurrentRow:=0
		Case of 
			: (JOB_ModuleID=2)  //Agency
				$_l_CurrentRow:=$_l_CurrentRow+1
				JOB_at_JobClasses{$_l_CurrentRow}:="Temp Agency Jobs"
				JOB_al_JobClasses{$_l_CurrentRow}:=0
				If (JOB_ModuleClassID=0)
					vClass:="Temp Agency Jobs"
					vClassID:=0
				End if 
				$_l_CurrentRow:=$_l_CurrentRow+1
				JOB_at_JobClasses{$_l_CurrentRow}:="Perm Agency Jobs"
				JOB_al_JobClasses{$_l_CurrentRow}:=2
				If (JOB_ModuleClassID=1)
					vClass:="Perm Agency Jobs"
					vClassID:=2
				End if 
			: (JOB_ModuleID=1)  //Job Costing
				JOB_at_JobClasses{$_l_CurrentRow}:="Job Costing"
				vClass:="Job Costing"
				vClassID:=1
				$_l_CurrentRow:=$_l_CurrentRow+1
				
		End case 
		ARRAY TEXT:C222(JOB_at_JobClasses; $_l_CurrentRow)
		
		
		ARRAY TEXT:C222(JOB_at_SearchTab; 3)
		
		JOB_at_SearchTab{1}:="Companies"
		JOB_at_SearchTab{2}:="Contacts"
		JOB_at_SearchTab{3}:="Projects"
		
		
		JOB_at_SearchTab:=0
		SM_LoadSearchParameterNames(Table:C252(->[JOBS:26]); SM_l_QueryMode)
		
		// If (DB_t_CurrentFormUsage="TS")
		//   ch1:=1
		// End if
		If ((DB_GetModuleSettingByNUM(1))=5)
			DB_MenuAction("Find"; "Projects"; 3; "")
			
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Projects"; 3; "")
			
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		vTitle2:=Term_FSWT("Fore/Surname")
		WS_AutoscreenSize(2; 322; 528)
		INT_SetDialog
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[JOBS:26]); <>PER_l_CurrentUserID)
			
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
			OBJECT SET VISIBLE:C603(JOB_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
		
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				ARRAY TEXT:C222($_at_RecordStateNames; 0)
				ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
				$_t_JobCode:=VJobCode
				$_t_Job:=VJob
				$_t_CompanyCode:=VCompCode
				$_t_CompName:=VcompName
				$_t_ContCode:=VContCOde
				$_t_ForeName:=VForename
				$_t_Surname:=Vsurname
				$_t_ContrCode:=VcontrCode
				$_t_Sales:=Vsales
				$_t_Type:=VType
				$_t_OrderNo:=VorderNo
				$_t_Stage:=Vstage
				$_d_SDateF:=VsDateF
				$_d_SDateT:=VsDateT
				$_d_EntryDateFrom:=SRCH_d_EntryDateFrom
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				$_d_RDateF:=VRDateF
				$_d_RDateT:=VRDateT
				$_t_Class:=VClass
				$_l_ClassID:=VclassID
				
				$_r_AmountFrom:=VamountF
				$_r_AmountTo:=VamountT
				$_r_invF:=VinvF
				
				$_r_invT:=vInvT
				$_t_ProductCode:=VprodCode
				$_t_AnalysisCode:=Vanalysis
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_t_LayerCode:=Vlayer
				COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
				COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Jobs_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					
					$_l_OK:=Jobs_SelLP(-1; SM_l_QueryMode; Table:C252(->[INVOICES:39]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(51)
				SM_LoadSearchParameterNames(Table:C252(->[JOBS:26]); SM_l_QueryMode)
				VJobCOde:=$_t_JobCode
				VJob:=$_t_Job
				VCompCode:=$_t_CompanyCode
				VCompName:=$_t_CompName
				VContCode:=$_t_ContCode
				VFOrename:=$_t_ForeName
				VSurname:=$_t_Surname
				VCOntrCode:=$_t_ContrCode
				VSales:=$_t_Sales
				VType:=$_t_Type
				VorderNo:=$_t_OrderNo
				VStage:=$_t_Stage
				VsDateF:=$_d_SDateF
				VsDateT:=$_d_SDateT
				SRCH_d_EntryDateFrom:=$_d_EntryDateFrom
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				VRDateF:=$_d_RDateF
				VRDateT:=$_d_RDateT
				VamountF:=$_r_AmountFrom
				VamountT:=$_r_AmountTo
				VinvF:=$_r_invF
				VInvT:=$_r_invT
				VProdCode:=$_t_ProductCode
				Vanalysis:=$_t_AnalysisCode
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				VLayer:=$_t_LayerCode
				VClass:=$_t_Class
				VclassID:=$_l_ClassID
				COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
				COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dJobs_Sel"; $_t_oldMethodName)
