If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]dTransB_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 13:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_TEXT(dbtabText2)
	C_BOOLEAN:C305(DB_bo_NoLoad; SRCH_bo_ShowHold; SRCH_bo_VDoDateToSet; SRCH_bo_VEDateToSet; SRCH_bo_VTDateToSet)
	C_DATE:C307(SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; vDoDateF; vDodateT; VedateFBASE; VedateTBASE; VfdateFBASE; VfdateTBASE)
	C_DATE:C307(VsdateFBASE; VsdateTBASE; vTDateF; VtdateFBASE; VtdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_bestHeight; $_l_bestWidth; $_l_defaultparams; $_l_event; $_l_TotalWidth; cSIS; rHold; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth)
	C_LONGINT:C283(xCancel; xOK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES].dTransB_Sel"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vTDateF:=!00-00-00!
		SRCH_d_TransToDate:=!00-00-00!
		SRCH_d_EntryDateFrom:=!00-00-00!
		SRCH_d_EntryDateTo:=!00-00-00!
		vDoDateF:=!00-00-00!
		vDodateT:=!00-00-00!
		VtdateFBASE:=!00-00-00!
		VtdateTBASE:=!00-00-00!
		VedateFBASE:=!00-00-00!
		VedateTBASE:=!00-00-00!
		SRCH_d_DodateFBase:=!00-00-00!
		SRCH_d_DoDateTBase:=!00-00-00!
		
		
		SRCH_bo_VTDateToSet:=False:C215
		SRCH_bo_VEDateToSet:=False:C215
		SRCH_bo_VDoDateToSet:=False:C215
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		
		SET MENU BAR:C67(57)
		OpenHelp(Table:C252(->[TRANSACTION_BATCHES:30]); "dTransB_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[TRANSACTION_BATCHES:30]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		rHold:=0
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Companies"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		$_l_bestWidth:=472
		
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=472
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_bestWidth; $_l_bestHeight)
		If ($_l_bestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_bestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=472)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=472
				SRCH_l_MinWidth:=472
			End if 
		End if 
		
		WS_AutoscreenSize(2; 278; $_l_TotalWidth)
		
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[TRANSACTION_BATCHES:30]); <>PER_l_CurrentUserID)
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
			OBJECT SET VISIBLE:C603(RHold; False:C215)
		End if 
End case 

Sel_LProc2(->[TRANSACTION_BATCHES:30])
ERR_MethodTrackerReturn("FM:dTransB_Sel"; $_t_oldMethodName)
