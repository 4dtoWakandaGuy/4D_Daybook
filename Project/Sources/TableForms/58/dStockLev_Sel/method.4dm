If (False:C215)
	//Table Form Method Name: [STOCK_LEVELS]dStockLev_Sel
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
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(STK_at_SearchLevelTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WS_Search_Message; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK; $_l_QueryMode; $_l_SIS; cNAA; cNAL)
	C_LONGINT:C283(cSIS; rHold; SM_l_QueryMode; SM_l_QuerySearchID; xCancel; xOK)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginT; VamountF; VamountT; vmarginF; vmarginT)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_ProductCode; $_t_Type; ACC_t_CurrencyCode; Vanalysis; Vlayer; VProdCode; VType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_LEVELS].dStockLev_Sel"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SET MENU BAR:C67(67)
		OpenHelp(Table:C252(->[STOCK_LEVELS:58]); "dStockLev_Sel")
		ARRAY TEXT:C222(STK_at_SearchLevelTab; 1)
		
		STK_at_SearchLevelTab{1}:="Products"
		STK_at_SearchLevelTab:=0
		WS_AutoscreenSize(2; 272; 425)
		SM_LoadSearchParameterNames(Table:C252(->[STOCK_LEVELS:58]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		rHold:=0
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Products"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		
		WS_bo_InsearchScreen:=True:C214
		Sel_LProc
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[STOCK_LEVELS:58]); <>PER_l_CurrentUserID)
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
			OBJECT SET VISIBLE:C603(STK_at_SearchLevelTab; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_ProductCode:=VProdCode
				$_t_Type:=VType
				$_t_AnalysisCode:=Vanalysis
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_t_LayerCode:=Vlayer
				$_r_AmountFrom:=VamountF
				$_r_AmountTo:=VamountT
				$_r_MarginF:=vmarginF
				$_r_MarginT:=vmarginT
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				
				
				
				If (SM_l_QueryMode=0)
					$_l_OK:=StockLev_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					
					$_l_OK:=StockLev_SelLP(-1; SM_l_QueryMode; Table:C252(->[STOCK_LEVELS:58]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(67)
				SM_LoadSearchParameterNames(Table:C252(->[STOCK_LEVELS:58]); SM_l_QueryMode)
				
				VprodCode:=$_t_ProductCode
				VType:=$_t_Type
				Vanalysis:=$_t_AnalysisCode
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				VLayer:=$_t_LayerCode
				VamountF:=$_r_AmountFrom
				VamountT:=$_r_AmountTo
				VMarginF:=$_r_MarginF
				VMarginT:=$_r_MarginT
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
	: ($_l_event=On Outside Call:K2:11)
		If (<>WS_Search_Message=1)
			ACCEPT:C269
			WS_bo_InsearchScreen:=False:C215
		Else 
			In_ButtdCall(->[STOCK_LEVELS:58])
			
		End if 
		<>WS_Search_Message:=0
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dStockLev_Sel"; $_t_oldMethodName)
