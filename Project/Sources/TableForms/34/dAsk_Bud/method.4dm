If (False:C215)
	//Table Form Method Name: [ACCOUNT_BALANCES]dAsk_Bud
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL; DB_bo_NoLoad)
	C_DATE:C307($_D_FormDatE; ACC_d_ForPeriod)
	C_LONGINT:C283($_l_event; ACC_cb_NoLookupLists)
	C_OBJECT:C1216($_obj_FormData)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_ForLayer; ACC_t_LayerCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].dAsk_Bud"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		TRACE:C157
		Form:C1466.NoLookupLists:=False:C215
		$_D_FormDate:=Form:C1466.Date
		//ACC_d_ForPeriod:=Form.Period
		//ACC_t_ForLayer:=Form.LayerCode
		//ACC_t_CurrencyCode:=Form.CurrencyCode
		//ACC_t_LayerCode:=Form.Layer
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "dAsk_Bud")
		Form:C1466.NoLookupLists:=(<>NAL)
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		
		INT_SetDialog
		//SD2_SetDiaryPopup
	: ($_l_Event=On Data Change:K2:15)
		//Form.Period:=ACC_d_ForPeriod
		//Form.LayerCode:=ACC_t_ForLayer
		//Form.NoLookupLists:=ACC_cb_NoLookupLists
		
		
		//Form.AccountCodeFrom:=Acc_t_AccountCodeFrom
		//Form.AccountCodeTo:=Acc_t_AccountCodeTo
		//Form.AnalysisCode:=ACC_t_AnalysisCodeFrom
		//Form.CurrencyCode:=ACC_t_CurrencyCode
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[ACCOUNT_BALANCES:34])
	: ($_l_event=On Activate:K2:9)
		//SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM [ACCOUNT_BALANCES].dAsk_Bud"; $_t_oldMethodName)

