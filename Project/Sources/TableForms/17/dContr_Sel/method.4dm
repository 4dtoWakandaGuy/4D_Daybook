If (False:C215)
	//Table Form Method Name: [CONTRACTS]dContr_Sel
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
	//C_UNKNOWN(VsDateFupDown)
	//C_UNKNOWN(VsDateTupDown)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(CON_at_SearchTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateTo; $_d_sDateF; $_d_SDateT; SRCH_d_EntryDateTo; VsDateF; VsDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA; cNAL; CONT_l_EDateFupDown)
	C_LONGINT:C283(CONT_l_EDateTupDown; CONT_l_TDateFupDown; cSIS; RHold; SM_l_QueryMode; SM_l_QuerySearchID; xCancel; xOK)
	C_TEXT:C284($_t_CompanyCode; $_t_ContCode; $_t_ContractCode; $_t_Job; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; $_t_Type; vCompCode; vContCode; vContrCode)
	C_TEXT:C284(vJob; VorderCode; VprodCode; VType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACTS].dContr_Sel"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		VsDateFupDown:=0
		CONT_l_EDateFupDown:=0
		VsDateTupDown:=0
		CONT_l_EDateTupDown:=0
		OpenHelp(Table:C252(->[CONTRACTS:17]); "dContr_Sel")
		Sel_LProc2(->[CONTRACTS:17])
		SM_LoadSearchParameterNames(Table:C252(->[CONTRACTS:17]); SM_l_QueryMode)
		
		ARRAY TEXT:C222(CON_at_SearchTab; 2)
		CON_at_SearchTab{1}:="Companies"
		CON_at_SearchTab{2}:="Contacts"
		CON_at_SearchTab:=0
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Contacts"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		
		
		WS_AutoscreenSize(2; 277; 428)
		INT_SetDialog
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[CONTRACTS:17]); <>PER_l_CurrentUserID)
			
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
			OBJECT SET VISIBLE:C603(CON_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Data Change:K2:15)
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_t_CompanyCode:=vCompCode
				$_t_ContCode:=vContCode
				$_t_ContractCode:=vContrCode
				$_t_Type:=VType
				$_d_sDateF:=VsDateF
				$_d_SDateT:=VsDateT
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				$_t_Job:=vJob
				$_t_OrderCode:=VorderCode
				$_t_ProductCode:=VprodCode
				
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Contracts_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=Contracts_SelLP(-1; SM_l_QueryMode; Table:C252(->[CONTRACTS:17]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SM_LoadSearchParameterNames(Table:C252(->[CONTRACTS:17]); SM_l_QueryMode)
				
				
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				VCompCode:=$_t_CompanyCode
				vContCode:=$_t_ContCode
				vContrCode:=$_t_ContractCode
				vType:=$_t_Type
				Vsdatef:=$_d_sDateF
				VsDateT:=$_d_SDateT
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				VJob:=$_t_Job
				VorderCode:=$_t_OrderCode
				VprodCode:=$_t_ProductCode
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
				Sel_LProc2(->[CONTRACTS:17])
			End if 
		End if 
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[CONTRACTS:17]); "dContr_Sel")
		Sel_LProc2(->[CONTRACTS:17])
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
	: ($_l_event=On Outside Call:K2:11)
		Sel_LProc2(->[CONTRACTS:17])
	: ($_l_event=On Clicked:K2:4)
		Sel_LProc2(->[CONTRACTS:17])
End case 
ERR_MethodTrackerReturn("FM [CONTRACTS].dContr_Sel"; $_t_oldMethodName)
