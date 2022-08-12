If (False:C215)
	//Table Form Method Name: [PROJECTS]dProjects_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(PRJ_at_SearchTab;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateFrom; $_d_EntryDateTo; $_d_SDateF; $_d_SDateT; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vSDateF; vSdateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA; cNAL; cSIS)
	C_LONGINT:C283(rHold; SM_l_QueryMode)
	C_TEXT:C284($_t_CompanyCode; $_t_CompName; $_t_ContCode; $_t_ForeName; $_t_Job; $_t_JobCode; $_t_oldMethodName; $_t_Sales; $_t_Surname; $_t_Type; VCompCOde)
	C_TEXT:C284(VCompName; VContCode; VForename; vJob; VJobCode; vSales; VSurname; vTitle2; VType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PROJECTS].dProjects_Sel"; Form event code:C388)
Sel_LProc2(->[PROJECTS:89])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vSDateF:=!00-00-00!
		vSdateT:=!00-00-00!
		SRCH_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		
		SET MENU BAR:C67(51)
		OpenHelp(Table:C252(->[PROJECTS:89]); "dProjects_Sel")
		ARRAY TEXT:C222(PRJ_at_SearchTab; 2)
		
		PRJ_at_SearchTab{1}:="Companies"
		PRJ_at_SearchTab{2}:="Contacts"
		PRJ_at_SearchTab:=0
		
		SM_LoadSearchParameterNames(Table:C252(->[PROJECTS:89]))
		
		vTitle2:=Term_FSWT("Fore/Surname")
		WS_AutoscreenSize(2; 322; 528)
		INT_SetDialog
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[PROJECTS:89]); <>PER_l_CurrentUserID)
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				
				ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
				ARRAY TEXT:C222($_at_RecordStateNames; 0)
				
				$_t_JobCode:=VJobCode
				$_t_Job:=vJob
				$_t_CompanyCode:=VCompCOde
				$_t_CompName:=VCompName
				$_t_ContCode:=VContCode
				$_t_ForeName:=VForename
				$_t_Surname:=VSurname
				$_t_Sales:=vSales
				$_t_Type:=VType
				$_d_SDateF:=VsDateF
				$_d_SDateT:=VsDateT
				$_d_EntryDateFrom:=SRCH_d_EntryDateFrom
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
				COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Projects_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Projects_SelLP(-1; SM_l_QueryMode; Table:C252(->[PROJECTS:89]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(51)
				SM_LoadSearchParameterNames(Table:C252(->[PROJECTS:89]); SM_l_QueryMode)
				
				vJobcode:=$_t_JobCode
				vJob:=$_t_Job
				vCompCode:=$_t_CompanyCode
				vCOmpName:=$_t_CompName
				vCOntCode:=$_t_ContCode
				vForename:=$_t_ForeName
				vSUrname:=$_t_Surname
				vSales:=$_t_Sales
				vType:=$_t_Type
				vsDateF:=$_d_SDateF
				vsDateT:=$_d_SDateT
				SRCH_d_EntryDateFrom:=$_d_EntryDateFrom
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
				COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
				End if 
				rhold:=0
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dProjects_Sel"; $_t_oldMethodName)
