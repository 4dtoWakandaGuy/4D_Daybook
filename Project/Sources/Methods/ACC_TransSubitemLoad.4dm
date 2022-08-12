//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_TransSubitemLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_DATE:C307(ACC_D_BatchDate; ACC_D_TransDate; vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_LayerName; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitIO; ACC_t_TransLayerCode; ACC_t_TransPeriodCode)
	C_TEXT:C284(ACC_t_TransTaxCode; ACC_t_UKEC; ACC_t_UKECCred; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransSubitemLoad")

//NG July 2004
//This method is similar to Trans_SubLPB
//it works with the new 'virtual' data screen
$_t_oldMethodName:=ERR_MethodTracker("ACC_TransSubitemLoad")
//Trans_SubLPB
If (ACC_t_TransTaxCode="")
	ACC_t_TransTaxCode:=DB_GetLedgerDefaultSalesTax
	ACC_t_TransDebitIO:="N"
	// If (◊TermST)
	
	// Else
	ACC_t_TransCreditIO:="N"
	// End if
	ACC_t_UKEC:="U"
	ACC_t_UKECCred:="U"
End if 
If (ACC_D_TransDate=!00-00-00!)
	ACC_D_TransDate:=ACC_D_BatchDate
	vDate:=ACC_D_TransDate
	$_l_PeriodID:=Check_Period
	If ([PERIODS:33]NL_Closed:5=True:C214)
		Period_Find
	End if 
	ACC_t_TransPeriodCode:=[PERIODS:33]Period_Code:1
	If ((ACC_D_TransDate>[PERIODS:33]To_Date:4) | (ACC_D_TransDate<[PERIODS:33]From_Date:3))
		ACC_D_TransDate:=[PERIODS:33]From_Date:3
	End if 
	If (ACC_t_TransCurrencyCode="")
		ACC_t_TransCurrencyCode:=<>SYS_t_BaseCurrency
		
	End if 
	
	If (<>PersAnOver)
		ACC_t_BatchItemAnalysisCode:=<>Per_t_CurrentDefaultAnalCode
		If ([ANALYSES:36]Analysis_Code:1#ACC_t_BatchItemAnalysisCode)
			READ ONLY:C145([ANALYSES:36])
			QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=ACC_t_BatchItemAnalysisCode)
		End if 
		ACC_t_AnalysisNames:=[ANALYSES:36]Analysis_Name:2
	End if 
	If (ACC_t_TransLayerCode="")
		ACC_t_TransLayerCode:=DB_GetLedgerActualLayer
		If ([LAYERS:76]Layer_Code:1#ACC_t_TransLayerCode)
			READ ONLY:C145([LAYERS:76])
			QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=ACC_t_TransLayerCode)
		End if 
		ACC_t_LayerName:=[LAYERS:76]Layer_Name:2
	End if 
End if 
If (SYS_t_AccessType="")  // Was used to determine different screens-Aug 2006 no longer used for that
	If (DB_GetModuleSettingByNUM(Module_MultiCurrency)<2)
		OBJECT SET ENTERABLE:C238(ACC_t_TransCurrencyCode; False:C215)
	End if 
	If (DB_GetModuleSettingByNUM(Module_MultiLayer)<2)
		OBJECT SET ENTERABLE:C238(ACC_t_TransLayerCode; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("ACC_TransSubitemLoad"; $_t_oldMethodName)
