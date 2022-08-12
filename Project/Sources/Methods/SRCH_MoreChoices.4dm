//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_MoreChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SRCH_MoreChoices
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_OrderStates; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	ARRAY TEXT:C222($_at_ValidStates; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_bl_ReturnBlob; SM_blb_SearchBlob)
	C_BOOLEAN:C305(<>SM_isHidden; $_bo_NoUpdate; SRCH_bo_FFINITED)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; VCDateF; VcDateT; VdateF; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5)
	C_DATE:C307(VdateT; vDateT1; vDateT2; vDateT3; vDateT4; vDateT5; vDeliveryDate; VDnDateF; VDnDateT; vDoDateF; VDoDateT)
	C_DATE:C307(VFDateF; VFDateT; viDateF; ViDateT; VPDateF; VPDateT; VRDateF; VRDateT; VRdDateF; VRdDateT; VsDateF)
	C_DATE:C307(VSDateT; VTDateF)
	C_LONGINT:C283(<>newSetsProcess; $_l_in; $_l_invoicableIndex; $_l_PU; $_l_StateRow; $1; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; ACC_l_TransDateFromOffset)
	C_LONGINT:C283(ACC_l_TransDateToOffset; CH0; ch1; CH2; CH3; CH4; CH5; CH6; CH7; CH8; cNAA)
	C_LONGINT:C283(cNAL; cSetAdd; cSetMod; cSIS; DB_l_CurrentDisplayedForm; r0; r1; r2; r3; r4; r5)
	C_LONGINT:C283(r6; r7; SRCH_l_And; SRCH_l_Not; SRCH_l_or; vA; vAB; vAct1; vAct2; vAct3; vAct4)
	C_LONGINT:C283(vAct5; vC; vCalls; VClassID; VContr; VD; VDnDateFOffset; VDnDateTOffset; VDoDateFOffset; VDoDateTOffset; VFDateFOffset)
	C_LONGINT:C283(VFDateTOffset; ViDateFOffset; ViDateTOffset; vIn; VinDatTOffset; VintDateFOffset; VintDatetOffset; VItemNum; vj; vNo1; vNo2)
	C_LONGINT:C283(vNo3; vNo4; vNo5; vO; vOrd; vOrdI; vp; vpDateFOffset; vpDateTOffset; vPu; VRDateFOffset)
	C_LONGINT:C283(VRDateTOffset; VRdDateFOffset; VRdDateTOffset; VrStateL; VsDateFOffset; VsDateTOffset; vst; vTr)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(VamountF; VamountT; VChargesF; VChargesT; VDiscountF; vDiscountT; VDueF; VDueTo; VinvF; VInvT; VMarginF)
	C_REAL:C285(vMarginPF; vMarginPT; VMarginT; vp1; VValueF; VvalueT)
	C_TEXT:C284($_t_Context; $_t_CurrentFormUsage; $_t_MenuBarReference; $_t_oldMethodName; $_t_OrderState; $_t_UsageCode; $_t_ViewingType; $2; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom)
	C_TEXT:C284(ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentContext; DB_t_CurrentFormUsage; DIA_t_actionCode; DIA_t_actionName; TR_t_ReconcilliationReference; vAccName; VAnalCodeT; Vanalysis)
	C_TEXT:C284(Varea; VattendType; vBrand; Vcallcode; vCalYr; VCharge; vChequeNo; vClass; VComments; VcompCode; vCompName)
	C_TEXT:C284(VCOmpNameC; VConfCode; vContactname; vContCode; VcontName; vContrCode; VCountry; VCounty; vDeliveryReference; vDesc1; vDesc2)
	C_TEXT:C284(vDesc3; vDesc4; vDesc5; vemail; vEnclosures; Vevent; VforeName; VGroup; vInvNo; VInvNoF; VInvNoT)
	C_TEXT:C284(vItemRef; VJob; VJobCode; VJobTitle; vLayer; VLetterCode; VLocation; vModelCode; Vname; VOmit; VOrderCode)
	C_TEXT:C284(vOrderNo; Vperson; vPersonName; VpostCode; Vpriority; vProbCode; VProbDesc; vProblem; VProdCode; vProdName; VProduct)
	C_TEXT:C284(VPurchCode; VPurchInvNo; VResDesc; VResult; Vrole; vrstate; Vsales; vSelPrev; VSerialNo; VSolCode; VSolDesc)
	C_TEXT:C284(Vsource; VStage; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; VSuperior; Vsupplier; Vsurname)
	C_TEXT:C284(Vtel; Vtele; VTerms; VText; Vtitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; Vtown)
	C_TEXT:C284(VTransCode; Vtype; Vtype_; vVATTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_MoreChoices")
$_bo_NoUpdate:=False:C215

$_Ptr_Table:=Table:C252($1)
If (Count parameters:C259>=2)
	$_t_Context:=$2
Else 
	$_t_Context:=DB_t_CurrentContext
End if 
$_t_MenuBarReference:=Get menu bar reference:C979
If (Not:C34(SRCH_bo_FFINITED))
	ARRAY TEXT:C222(CUS_at_DisplayedData; 0)
	ARRAY TEXT:C222(CUS_at_PageText; 0)
	ARRAY TEXT:C222(FUR_at_CustomFieldNames; 0)
	SRCH_bo_FFINITED:=True:C214
End if 
If (Count parameters:C259>=1)
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			SET MENU BAR:C67(48)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->SRCH_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			vC:=1
			Comp_SelP
			SM_LoadSearchParameterNames(Table:C252(->[COMPANIES:2]); 1; 2)  //the filters will be offset by 255..
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->SRCH_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
		: ($1=Table:C252(->[DIARY:12]))
			SET MENU BAR:C67(50)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			VD:=1
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Diary_SelP
			VD:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
		: ($1=Table:C252(->[ORDERS:24]))
			SET MENU BAR:C67(53)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			
			vOrd:=1
			Orders_SelP
			vOrd:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			If ($_t_Context#"")
				$_t_ViewingType:=Replace string:C233($_t_Context; Get localized string:C991("MenuItem_View")+" "; "")
				$_l_StateRow:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_ViewingType)
				If ($_l_StateRow>0)
					//TRACE
					$_t_OrderState:=<>SYS_at_RecStateCodes{24}{$_l_StateRow}
					$_t_OrderState:="024"+$_t_OrderState
					QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_OrderState)
				Else 
					Case of 
						: ($_t_Context="Batch Invoice Orders")
							If (Records in selection:C76([ORDERS:24])<Records in table:C83([ORDERS:24]))
								DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
								ARRAY TEXT:C222($_at_ValidStates; 0)
								For ($_l_invoicableIndex; 1; Size of array:C274($_at_OrderStates))
									$_t_OrderState:=$_at_OrderStates{$_l_invoicableIndex}
									$_t_UsageCode:="090"+$_t_OrderState
									QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UsageCode; *)
									QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
									If (Records in selection:C76([CODE_USES:91])>0)
										APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_invoicableIndex})
										
									End if 
								End for 
								QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
								
								RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
								QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
							Else 
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1#"")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
								DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
								ARRAY TEXT:C222($_at_ValidStates; 0)
								For ($_l_invoicableIndex; 1; Size of array:C274($_at_OrderStates))
									$_t_OrderState:=$_at_OrderStates{$_l_invoicableIndex}
									$_t_UsageCode:="090"+$_t_OrderState
									QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UsageCode; *)
									QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
									If (Records in selection:C76([CODE_USES:91])>0)
										APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_invoicableIndex})
										
									End if 
								End for 
								QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
								
								QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
								RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
								QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
							End if 
					End case 
				End if 
			End if 
			
			
			
		: ($1=Table:C252(->[PRODUCTS:9]))
			SET MENU BAR:C67(52)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VintDateFOffset; ->ACC_l_EntryDateToOffset; ->VintDatetOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			vp:=1
			Prod_SelP
			vp:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VintDateFOffset; ->ACC_l_EntryDateToOffset; ->VintDatetOffset)
			
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			SET MENU BAR:C67(59)
			
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			DB_t_CurrentFormUsage:=""
			vAB:=1
			ACC_BalSelect
			vAB:=0
		: ($1=Table:C252(->[ACTIONS:13]))
			
			Minor_SelP($_Ptr_Table; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
		: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
			Minor_SelP($_Ptr_Table; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Name:2)
		: ($1=Table:C252(->[ANALYSES:36]))
			Minor_SelP($_Ptr_Table; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2)
		: ($1=Table:C252(->[AREAS:3]))
			Minor_SelP($_Ptr_Table; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2)
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
			Minor_SelP($_Ptr_Table; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2)
		: ($1=Table:C252(->[CONTACTS:1]))
			SET MENU BAR:C67(49)
			vO:=1
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->VSource; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Cont_SelP
			vO:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->VSource; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
			
		: ($1=Table:C252(->[CONTRACTS:17]))
			SET MENU BAR:C67(51)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->cSIS; ->cNAA; ->cNAL; ->vCompCode; ->vContCode; ->vContrCode; ->VType; ->VsDateF; ->VsDateT; ->SRCH_d_EntryDateTo; ->vJob; ->VorderCode; ->VprodCode)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			VContr:=1
			
			Contracts_SelP
			vContr:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->cSIS; ->cNAA; ->cNAL; ->vCompCode; ->vContCode; ->vContrCode; ->VType; ->VsDateF; ->VsDateT; ->SRCH_d_EntryDateTo; ->vJob; ->VorderCode; ->VprodCode)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
		: ($1=Table:C252(->[COUNTRIES:73]))
			Minor_SelP($_Ptr_Table; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]COUNTRY_CODE:1)
		: ($1=Table:C252(->[CREDIT_STAGES:54]))
			Minor_SelP($_Ptr_Table; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2)
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			SET MENU BAR:C67(67)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			$_l_PU:=vPu
			vPu:=1
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VprodCode; ->VSerialNo; ->Vtype; ->Vlocation; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->VorderCode; ->VItemNum; ->VamountF; ->VamountT; ->vmarginF; ->vmarginT; ->vmarginPF; ->vmarginPT; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			StockCurr_SelP
			vPu:=$_l_PU
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VprodCode; ->VSerialNo; ->Vtype; ->Vlocation; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->VorderCode; ->VItemNum; ->VamountF; ->VamountT; ->vmarginF; ->vmarginT; ->vmarginPF; ->vmarginPT; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
		: ($1=Table:C252(->[DOCUMENTS:7]))  // Letters
			
			$_bo_NoUpdate:=True:C214  //=there is no more choice search here
			Case of 
				: ($_t_Context="Letters")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
				: ($_t_Context="Reports")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
				: ($_t_Context="Emails")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template)
			End case 
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
			Minor_SelP($_Ptr_Table; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2)
		: ($1=Table:C252(->[INVOICES:39]))
			SET MENU BAR:C67(51)
			$_l_in:=vIn
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset)
			SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			vIn:=1
			Invoices_SelP
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset)
			SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			Case of 
				: ($_t_Context="ViewCreditnotes") | ($_t_Context="View Credit notes")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
					End if 
				: ($_t_Context="ViewReceipts") | ($_t_Context="View Receipts")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-3)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-3)
					End if 
				: ($_t_Context="ViewDeposits") | ($_t_Context="View Deposits")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-2)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-2)
					End if 
				: ($_t_Context="Proformas") | ($_t_Context="View Proformas")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-1)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-1)
					End if 
				: ($_t_Context="Invoices") | ($_t_Context="View Invoices")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10>=0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0)
					End if 
				: ($_t_Context="Refund Deposit")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					End if 
				: ($_t_Context="Invoice Receipt")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
							QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
						QUERY:C277([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
						
					End if 
				: ($_t_Context="Undo Receipt")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6>=0; *)  // Modified NG 3/8/2006
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						End if 
					Else 
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>=0; *)  // Modified NG 3/8/2006
						QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
						QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					End if 
					
				Else 
					//ALL RECORDS([INVOICES])
			End case 
			
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			//Needs to be created
		: ($1=Table:C252(->[JOB PERSONNEL:48]))
			SET MENU BAR:C67(56)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vPerson; ->VJobCode; ->Vstage; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			vj:=1
			JobPers_SelP
			vj:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vPerson; ->VJobCode; ->Vstage; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
		: ($1=Table:C252(->[JOB_STAGES:47]))
			SET MENU BAR:C67(56)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VJobCode; ->Vstage; ->VcontName; ->VcompCode; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			vJ:=1
			JobStages_SelP
			vJ:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VJobCode; ->Vstage; ->VcontName; ->VcompCode; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
		: ($1=Table:C252(->[JOB_TYPES:65]))
			Minor_SelP($_Ptr_Table; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2)
		: ($1=Table:C252(->[JOBS:26]))
			SET MENU BAR:C67(51)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VJobCode; ->VJob; ->VCompCode; ->VcompName; ->VContCOde; ->VForename; ->Vsurname; ->VcontrCode; ->Vsales; ->VType; ->VorderNo; ->Vstage; ->VsDateF; ->VsDateT)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VRDateF; ->VRDateT; ->VamountF; ->VamountT; ->VinvF; ->vInvT; ->VprodCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->vClass; ->VClassID)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			vJ:=1
			Jobs_SelP
			vJ:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VJobCode; ->VJob; ->VCompCode; ->VcompName; ->VContCOde; ->VForename; ->Vsurname; ->VcontrCode; ->Vsales; ->VType; ->VorderNo; ->Vstage; ->VsDateF; ->VsDateT)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VRDateF; ->VRDateT; ->VamountF; ->VamountT; ->VinvF; ->vInvT; ->VprodCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->vClass; ->VClassID)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[LAYERS:76]))
			
			Minor_SelP($_Ptr_Table; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2)
		: ($1=Table:C252(->[LOCATIONS:61]))
			
			Minor_SelP($_Ptr_Table; ->[LOCATIONS:61]Location_Code:1; ->[LOCATIONS:61]Location_Name:2)
		: ($1=Table:C252(->[SCRIPTS:80]))
			SET MENU BAR:C67(57)
			vp:=1
			vSelPrev:=""
			Macros_SelP
			vp1:=0
			
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
			Minor_SelP($_Ptr_Table; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			//``
			Case of 
				: ($_t_Context="Subscription Billing") | ($_t_Context="Subscription Renewals") | ($_t_Context="Subscriptions Deliver")
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					Case of 
						: ($_t_Context="Subscription Billing")
							DB_t_CurrentFormUsage:="Subs Inv"
						: ($_t_Context="Subscriptions Deliver")
							DB_t_CurrentFormUsage:="Subs Del"
						: ($_t_Context="Subscription Renewals")
							DB_t_CurrentFormUsage:="Subs Mail"
							
					End case 
					SET MENU BAR:C67(57)
					SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
					
					vCalls:=1
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VProdCode; ->VProdName; ->Vtype; ->vIDateF; ->vIDateT; ->vDnDateF; ->vDnDateT; ->VamountF; ->VAmountT; ->vItemNum; ->vInvNo; ->Ch2; ->cSIS; ->cNAA; ->cNAL)
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
					Subscript_SelP
					
					vCalls:=0
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VProdCode; ->VProdName; ->Vtype; ->vIDateF; ->vIDateT; ->vDnDateF; ->vDnDateT; ->VamountF; ->VAmountT; ->vItemNum; ->vInvNo; ->Ch2; ->cSIS; ->cNAA; ->cNAL)
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
					SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
					
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS")
					If (VProdCode#"")
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=VProdCode+"@")
					End if 
					If (VdateF>!00-00-00!)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supply_by_Date:31<=VdateF)
					End if 
					If (VdateT>!00-00-00!)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supply_by_Date:31<=VdateT)
					End if 
					
					
				Else 
					
					SET MENU BAR:C67(54)
					vOrdI:=1
					SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
					
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
					
					SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
					
					OrderI_SelP
					vOrdI:=1
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
					
					SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
					SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			End case 
			Case of 
				: ($_t_Context="Subscription Billing")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="B@")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
					
				: ($_t_Context="Subscription Delivery")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
					
				: ($_t_Context="Subscription Renewals")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="REN")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					//QUERY SELECTION([ORDER ITEMS];[ORDER ITEMS]Invoice No="")
					
			End case 
			
			
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			
			Minor_SelP($_Ptr_Table; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Name:2)
		: ($1=Table:C252(->[PERSONNEL:11]))
			Minor_SelP($_Ptr_Table; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
		: ($1=Table:C252(->[PICTURES:85]))
			Minor_SelP($_Ptr_Table; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2)
		: ($1=Table:C252(->[PROBLEMS:22]))
			Minor_SelP($_Ptr_Table; ->[PROBLEMS:22]Problem_Code:1; ->[PROBLEMS:22]Problem_Name:2)
		: ($1=Table:C252(->[PROJECTS:89]))
			SET MENU BAR:C67(51)
			vA:=1
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->vJobcode; ->vJob; ->vCompCode; ->vCOmpName; ->vCOntCode; ->vForename; ->vSUrname; ->vSales; ->vType; ->vsDateF; ->vsDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->MOD_al_ModuleAccessStatus; ->SYS_at_RecordStateNames; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Projects_SelP
			vA:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->vJobcode; ->vJob; ->vCompCode; ->vCOmpName; ->vCOntCode; ->vForename; ->vSUrname; ->vSales; ->vType; ->vsDateF; ->vsDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->MOD_al_ModuleAccessStatus; ->SYS_at_RecordStateNames; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[PUBLICATIONS:52]))
			Minor_SelP($_Ptr_Table; ->[PUBLICATIONS:52]Publication_Code:1; ->[PUBLICATIONS:52]Publication_Name:2)
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
			SET MENU BAR:C67(51)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			vPu:=1
			PurchOrd_SelP
			vPu:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			//Needs to be created
			SET MENU BAR:C67(51)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			vPu:=1
			PurchOrd_SelP
			SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
			QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PONumbers)
			
			vPu:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
			SET MENU BAR:C67(51)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			vPu:=1
			Purchases_SelP
			vPu:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
			
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
			Case of 
				: ($_t_Context="Post Purchase Invoices")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1)
				: ($_t_Context="Reverse Transaction Batches")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=2; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)
				: ($_t_Context="Print Cheques")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Cheque_Number:26="")
				: ($_t_Context="Autopay List")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)
					
			End case 
			
		: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			//Needs to be created
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			Minor_SelP($_Ptr_Table; ->[RECURRING_JOURNALS:38]Transaction_Type_Code:2; ->[RECURRING_JOURNALS:38]Company_Code:1)
		: ($1=Table:C252(->[RESULTS:14]))
			Minor_SelP($_Ptr_Table; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2)
		: ($1=Table:C252(->[ROLES:87]))
			Minor_SelP($_Ptr_Table; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2)
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			SET MENU BAR:C67(53)
			vCalls:=1
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->Vpriority; ->VContCode; ->VForename; ->VSurname; ->VCallCode; ->VContrCode; ->VPerson; ->Vtele; ->vCharge; ->VProbCode; ->VProbDesc; ->VSolCode; ->VSolDesc; ->VProdCode; ->VprodName; ->VserialNo; ->VCDateF; ->VcDateT; ->VsDateF; ->VsDateT; ->CH0; ->CH1; ->CH2; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Calls_SelP
			vCalls:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VCompCode; ->VCompName; ->Vpriority; ->VContCode; ->VForename; ->VSurname; ->VCallCode; ->VContrCode; ->VPerson; ->Vtele; ->vCharge; ->VProbCode; ->VProbDesc; ->VSolCode; ->VSolDesc; ->VProdCode; ->VprodName; ->VserialNo; ->VCDateF; ->VcDateT; ->VsDateF; ->VsDateT; ->CH0; ->CH1; ->CH2; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			Case of 
				: ($_t_Context="Outstanding Calls")
					QUERY SELECTION:C341([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215)
			End case 
		: ($1=Table:C252(->[SOLUTIONS:23]))
			Minor_SelP($_Ptr_Table; ->[SOLUTIONS:23]Solution_Code:1; ->[SOLUTIONS:23]Solution_Name:2)
			
		: ($1=Table:C252(->[SOURCES:6]))
			
			Minor_SelP($_Ptr_Table; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2)
		: ($1=Table:C252(->[STAGES:45]))
			Minor_SelP($_Ptr_Table; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
		: ($1=Table:C252(->[STAGES:45]))
			Minor_SelP($_Ptr_Table; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2)
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			SET MENU BAR:C67(61)
			vst:=1
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VContCode; ->VcompCode; ->VorderCode; ->VItemNum; ->VprodCode; ->VserialNo; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Stock_SelP
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VContCode; ->VcompCode; ->VorderCode; ->VItemNum; ->VprodCode; ->VserialNo; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			vst:=0
		: ($1=Table:C252(->[STOCK_LEVELS:58]))
			SET MENU BAR:C67(67)
			vPu:=1
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VprodCode; ->VSerialNo; ->Vtype; ->Vlocation; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->VorderCode; ->VItemNum; ->VamountF; ->VamountT; ->vmarginF; ->vmarginT; ->vmarginPF; ->vmarginPT; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			StockLev_SelP
			vPu:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VprodCode; ->VSerialNo; ->Vtype; ->Vlocation; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->VorderCode; ->VItemNum; ->VamountF; ->VamountT; ->vmarginF; ->vmarginT; ->vmarginPF; ->vmarginPT; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
			SET MENU BAR:C67(62)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
			
			vPu:=1
			Movements_SelP
			vPu:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
			
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			Minor_SelP($_Ptr_Table; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Name:2)
		: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
			SET MENU BAR:C67(57)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			vCalls:=1
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VProdCode; ->VProdName; ->Vtype; ->vIDateF; ->vIDateT; ->vDnDateF; ->vDnDateT; ->VamountF; ->VAmountT; ->vItemNum; ->vInvNo; ->Ch2; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			Subscript_SelP
			vCalls:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VProdCode; ->VProdName; ->Vtype; ->vIDateF; ->vIDateT; ->vDnDateF; ->vDnDateT; ->VamountF; ->VAmountT; ->vItemNum; ->vInvNo; ->Ch2; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
		: ($1=Table:C252(->[TAX_CODES:35]))
			Minor_SelP($_Ptr_Table; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Name:2)
		: ($1=Table:C252(->[TERMINOLOGY:75]))
			Minor_SelP($_Ptr_Table; ->[TERMINOLOGY:75]Terminology_Code:1; ->[TERMINOLOGY:75]Terminology_Name:2)
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
			SET MENU BAR:C67(57)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			vTr:=1
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
			SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
			
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			TransB_SelP
			vTr:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
			SM_BlobtoSeachVars(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			Case of 
				: ($_t_Context="Post Transaction Batches")
					QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]State:15=1)
				: ($_t_Context="Reverse Transaction Batches")
					QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Reverse:14=True:C214)
					
			End case 
			
		: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			//Needs to be created
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			Minor_SelP($_Ptr_Table; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
		: ($1=Table:C252(->[TRANSACTIONS:29]))
			SET MENU BAR:C67(58)
			
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			
			vTr:=1
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VTransCode; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->Vno1; ->Vno2; ->VCompCode; ->VJobCode; ->VcontrCode; ->VConfCode; ->vTDateF; ->SRCH_d_TransToDate; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VamountF; ->VamountT; ->vPurchInvNo; ->vPurchCode; ->vChequeNo; ->vVATTitle; ->vType; ->vContCode; ->Vlayer; ->ACC_t_CurrencyCode; ->cSIS; ->cNAA; ->cNAL; ->CH0; ->CH1; ->TR_t_ReconcilliationReference; ->TR_t_ReconcilliationReference; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset)
			SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			
			Trans_Sel
			vTr:=0
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->VTransCode; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->Vno1; ->Vno2; ->VCompCode; ->VJobCode; ->VcontrCode; ->VConfCode; ->vTDateF; ->SRCH_d_TransToDate; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VamountF; ->VamountT; ->vPurchInvNo; ->vPurchCode; ->vChequeNo; ->vVATTitle; ->vType; ->vContCode; ->Vlayer; ->ACC_t_CurrencyCode; ->cSIS; ->cNAA; ->cNAL; ->CH0; ->CH1; ->TR_t_ReconcilliationReference; ->TR_t_ReconcilliationReference; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset)
			
			SM_BlobtoSeachVars(->SM_bl_ReturnBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
			SET BLOB SIZE:C606(SM_bl_ReturnBlob; 0)
			Case of 
				: ($_t_Context="Check")
					
				: ($_t_Context="Reconcile Transactions")
					If (DB_GetSalesLedgerBankFrom#"")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
						If (DB_GetSalesLedgerBankTo#"")
							QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
						Else 
							QUERY SELECTION:C341([TRANSACTIONS:29])
							
						End if 
					Else 
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
					End if 
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
			End case 
			
		: ($1=Table:C252(->[TYPES:5]))
			Minor_SelP($_Ptr_Table; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2)
			
		Else 
			$_bo_NoUpdate:=True:C214  //=there is no more choice search here
			
	End case 
End if 
vSelPrev:=""
vCompCode:=""
vCompName:=""
If (Not:C34($_bo_NoUpdate))
	$_ptr_Table:=Table:C252($1)
	
	
	If (Records in selection:C76($_Ptr_Table->)>0)
		SEL_UpdateRecordCache($1)
	End if 
	SRCH_Applyfilterstoselection($_ptr_Table)
	DB_SetFormMenuoptions
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
If (<>newSetsProcess>0)
	HIDE PROCESS:C324(<>newSetsProcess)
	<>SM_isHidden:=True:C214
End if 
SET MENU BAR:C67($_t_MenuBarReference)
ERR_MethodTrackerReturn("SRCH_MoreChoices"; $_t_oldMethodName)
