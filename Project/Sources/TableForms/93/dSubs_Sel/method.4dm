If (False:C215)
	//Table Form Method Name: [SUBSCRIPTIONS]dSubs_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDNDateToSet; SRCH_bo_VIDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_FromBase; vDnDateF; VDNdateFBASE; vDndateT; VDndateTBASE; vIDateF; vIdateT; VIdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_bestHeight; $_l_bestWidth; $_l_defaultparams; $_l_event; $_l_TotalWidth; ch1; cSIS; SM_l_QueryMode; SM_l_QuerySearchID)
	C_LONGINT:C283(SRCH_l_MinWidth; VDNDateFOffset; vDNDateTOffset; ViDateFOffset; VIDateTOffset; xCancel; xOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SUBSCRIPTIONS].dSubs_Sel"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vIDateF:=!00-00-00!
		vIdateT:=!00-00-00!
		vDnDateF:=!00-00-00!
		vDndateT:=!00-00-00!
		
		
		SRCH_d_FromBase:=!00-00-00!
		VIdateTBASE:=!00-00-00!
		VDndateFBASE:=!00-00-00!
		VDndateTBASE:=!00-00-00!
		SRCH_bo_VIDateToSet:=False:C215
		SRCH_bo_VDNDateToSet:=False:C215
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(57)
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		OpenHelp(Table:C252(->[SUBSCRIPTIONS:93]); "dSubs_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[SUBSCRIPTIONS:93]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		WS_bo_InsearchScreen:=True:C214
		If (SM_l_QueryMode=2)
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		Sel_LProc
		If (DB_t_CurrentFormUsage="Subs Del")
			vIDateT:=<>DB_d_CurrentDate
			vType:="ISS"
			ch1:=1
		End if 
		If (DB_t_CurrentFormUsage="Subs Inv")
			vIDateT:=<>DB_d_CurrentDate
			vType:="B@"
			ch1:=1
		End if 
		If (DB_t_CurrentFormUsage="Subs Mail")
			vIDateT:=<>DB_d_CurrentDate
			vType:="REN"
			ch1:=1
		End if 
		
		$_l_bestWidth:=592
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=592
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=592)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=592
				SRCH_l_MinWidth:=592
			End if 
		End if 
		WS_AutoscreenSize(2; 277; $_l_TotalWidth)
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[SUBSCRIPTIONS:93]); <>PER_l_CurrentUserID)
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
		
	: ($_l_event=On Data Change:K2:15)
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[SUBSCRIPTIONS:93])
			
		End if 
		<>WS_Search_Message:=0
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dSubs Sel"; $_t_oldMethodName)
