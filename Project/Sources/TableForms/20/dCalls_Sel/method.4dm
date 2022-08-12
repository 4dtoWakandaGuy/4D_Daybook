If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]dCalls_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(SVS_at_SearchTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_DATE:C307($_d_cDateF; $_d_cDateT; $_d_SDateF; $_d_SDateT; vCDateF; vCdateT; vSDateF; vSdateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_CH0; $_l_ch1; $_l_ch2; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode)
	C_LONGINT:C283($_l_SIS; CH0; ch1; CH2; cNAA; cNAL; cSIS; RHold; SM_l_QueryMode; SM_l_QuerySearchID; xCancel)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_CallCode; $_t_Charge; $_t_CompanyCode; $_t_CompName; $_t_ContCode; $_t_ContrCode; $_t_ForeName; $_t_oldMethodName; $_t_Person; $_t_Priority; $_t_ProblemCode)
	C_TEXT:C284($_t_ProblemDescription; $_t_ProductCode; $_t_ProductName; $_t_SerialNumber; $_t_SolutionCode; $_t_SolutionDescription; $_t_Surname; $_t_Telephone; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(VCallCode; vCharge; VCompCode; VCompName; VContCode; VContrCode; VForename; VPerson; Vpriority; VProbCode; VProbDesc)
	C_TEXT:C284(VProdCode; VprodName; VserialNo; VSolCode; VSolDesc; VSurname; Vtele; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].dCalls_Sel"; Form event code:C388)

Sel_LProc2(->[SERVICE_CALLS:20])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vCDateF:=!00-00-00!
		vCdateT:=!00-00-00!
		vSDateF:=!00-00-00!
		vSdateT:=!00-00-00!
		
		SET MENU BAR:C67(53)
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "dCalls_Sel")
		ARRAY TEXT:C222(SVS_at_SearchTab; 5)
		
		SVS_at_SearchTab{1}:="Companies"
		SVS_at_SearchTab{2}:="Information"
		SVS_at_SearchTab{3}:="Contacts"
		SVS_at_SearchTab{4}:="Diary"
		SVS_at_SearchTab{5}:="Order Items"
		
		SVS_at_SearchTab:=0
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		SM_LoadSearchParameterNames(Table:C252(->[SERVICE_CALLS:20]); SM_l_QueryMode)
		
		vTitle2:=Term_FSWT("Fore/Surname")
		If (DB_t_CurrentFormUsage="Outs")
			ch1:=1
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Find"; "Information"; 3; "")
			DB_MenuAction("Find"; "Contacts"; 3; "")
			DB_MenuAction("Find"; "Diary"; 3; "")
			DB_MenuAction("Find"; "Order Items"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 3; "")
		End if 
		WS_AutoscreenSize(3; 322; 528)
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[SERVICE_CALLS:20]); <>PER_l_CurrentUserID)
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
			OBJECT SET VISIBLE:C603(SVS_at_SearchTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		
		Rhold:=0
		
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_CompanyCode:=VCompCode
				$_t_CompName:=VCompName
				$_t_Priority:=Vpriority
				$_t_ContCode:=VContCode
				$_t_ForeName:=VForename
				$_t_Surname:=VSurname
				$_t_CallCode:=VCallCode
				$_t_ContrCode:=VContrCode
				$_t_Person:=VPerson
				$_t_Telephone:=Vtele
				$_t_Charge:=vCharge
				$_t_ProblemCode:=VProbCode
				$_t_ProblemDescription:=VProbDesc
				$_t_SolutionCode:=VSolCode
				$_t_SolutionDescription:=VSolDesc
				$_t_ProductCode:=VProdCode
				$_t_ProductName:=VprodName
				$_t_SerialNumber:=VserialNo
				$_d_cDateF:=VCDateF
				$_d_cDateT:=VcDateT
				$_d_SDateF:=VsDateF
				$_d_SDateT:=VsDateT
				$_l_CH0:=CH0
				$_l_ch1:=CH1
				$_l_ch2:=CH2
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				
				If (SM_l_QueryMode=0)
					$_l_OK:=Calls_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					
					$_l_OK:=Calls_SelLP(-1; SM_l_QueryMode; Table:C252(->[SERVICE_CALLS:20]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(53)
				SM_LoadSearchParameterNames(Table:C252(->[SERVICE_CALLS:20]); SM_l_QueryMode)
				
				vCOmpCode:=$_t_CompanyCode
				vCOmpName:=$_t_CompName
				vPriority:=$_t_Priority
				vCOntCOde:=$_t_ContCode
				vForename:=$_t_ForeName
				vsurname:=$_t_Surname
				vCallCOde:=$_t_CallCode
				vCOntrCode:=$_t_ContrCode
				vPerson:=$_t_Person
				vTele:=$_t_Telephone
				vCharge:=$_t_Charge
				vProbCode:=$_t_ProblemCode
				vProbDesc:=$_t_ProblemDescription
				vSolCOde:=$_t_SolutionCode
				vSolDesc:=$_t_SolutionDescription
				vProdCode:=$_t_ProductCode
				vProdName:=$_t_ProductName
				vSerialNo:=$_t_SerialNumber
				vCDateF:=$_d_cDateF
				vCDateT:=$_d_cDateT
				vSDateF:=$_d_SDateF
				vSDateT:=$_d_SDateT
				CH0:=$_l_CH0
				CH1:=$_l_ch1
				CH2:=$_l_ch2
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
				End if 
				rHold:=0
				
			End if 
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[SERVICE_CALLS:20])
			
		End if 
		<>WS_Search_Message:=0
		
		
End case 
ERR_MethodTrackerReturn("FM:dCalls_Sel"; $_t_oldMethodName)
