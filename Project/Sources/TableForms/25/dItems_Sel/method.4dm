If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]ditems_sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OrdI_abo_Include;0)
	//ARRAY BOOLEAN(ORDI_Lb_FurtherFieldsQuery;0)
	//ARRAY BOOLEAN(ORDi_LB_States;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DoNotIncludeTable; 0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORDI_al_coTabChoices;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CustomFieldFormat; 0)
	ARRAY TEXT:C222($_at_CustomFieldNames; 0)
	ARRAY TEXT:C222($_at_CustomFieldTypes; 0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORDI_at_TabContexts;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_ShowHold; $_bo_VDnDateToSet; $_bo_ViDateToSet; $_bo_VRDDateToSet; DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VDnDateToSet; SRCH_bo_ViDateToSet; SRCH_bo_VRdDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_DNDateF; $_d_dndateFBASE; $_d_DNDateT; $_d_dndateTBASE; $_d_FromBase; $_d_idateTBASE; $_d_LDateF; $_d_lDateT; $_d_rdateFBASE; $_d_rdateTBASE; $_d_RdDateF)
	C_DATE:C307($_d_RdDateT; SRCH_d_DodateFBase; SRCH_d_DoDateTBase; SRCH_d_EntryDateTo; SRCH_d_FromBase; vDnDateF; VDNdateFBASE; vDndateT; VDNdateTBASE; VDNddateFBASE; VedateFBASE)
	C_DATE:C307(VedateTBASE; VfdateFBASE; VfdateTBASE; vIDateF; vIdateT; VidateTBASE; vRdDateF; VRddateFBASE; vRddateT; VRddateTBASE; VsdateFBASE)
	C_DATE:C307(VsdateTBASE)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_bestHeight; $_l_bestWidth; $_l_CancelButtonBottom; $_l_CancelButtonLeft; $_l_CancelButtonRight; $_l_CancelButtonTop; $_l_ColumnsTakeoff; $_l_ColumnsWidth; $_l_ContinueButtonBottom; $_l_ContinueButtonLeft)
	C_LONGINT:C283($_l_ContinueButtonRight; $_l_ContinueButtonTop; $_l_cSetAdd; $_l_cSetMod; $_l_CustomerItemReferenceBottom; $_l_CustomerItemReferenceLabelBo; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceRight)
	C_LONGINT:C283($_l_CustomerItemReferenceTop; $_l_defaultparams; $_l_dnDateFOffset; $_l_dnDateTOffset; $_l_event; $_l_FromBottom; $_l_FromLabelBottom; $_l_FromLabelLeft; $_l_FromLabelRight; $_l_FromLabelTop; $_l_FromnoVarBottom)
	C_LONGINT:C283($_l_FromnoVarLeft; $_l_FromnoVarRight; $_l_FromnoVarTop; $_l_FurtherFieldsCount; $_l_Height; $_l_iDateFOffset; $_l_iDateTOffset; $_l_Index; $_l_inSelectButtonBottom; $_l_inselectButtonLeft; $_l_inSelectButtonRight)
	C_LONGINT:C283($_l_inselectButtonTop; $_l_inselectLabelBottom; $_l_inselectLabelLeft; $_l_inselectLabelRight; $_l_inselectLabelTop; $_l_Inset; $_l_ItemNumber; $_l_ItemNumberBottom; $_l_ItemNumberLabelBottom; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelRight)
	C_LONGINT:C283($_l_ItemNumberLabelTop; $_l_ItemNumberLeft; $_l_ItemNumberRight; $_l_ItemNumberTop; $_l_NAA; $_l_NAL; $_l_NoLookupButtonBottom; $_l_NoLookupButtonLeft; $_l_NoLookupButtonRight; $_l_NoLookupButtonTop; $_l_NoLookupLabelBottom)
	C_LONGINT:C283($_l_NoLookupLabelLeft; $_l_NoLookupLabelRight; $_l_NoLookupLabelTop; $_l_NoWildButtonBottom; $_l_NoWildButtonLeft; $_l_NoWildButtonRight; $_l_NoWildButtonTop; $_l_NoWildLabelBottom; $_l_NoWildLabelLeft; $_l_NoWildLabelRight; $_l_NoWildLabelTop)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectCustomBottom; $_l_ObjectCustomLeft; $_l_ObjectCustomRight; $_l_ObjectCustomTop; $_l_ObjectHeight; $_l_ObjectHoldBottom; $_l_ObjectHoldCBBottom; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBTop)
	C_LONGINT:C283($_l_ObjectHoldLeft; $_l_ObjectHoldRight; $_l_ObjectHoldTop; $_l_ObjectLeft; $_l_ObjectLoadLabelBottom; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelTop; $_l_ObjectQueryDDBottom; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDRight)
	C_LONGINT:C283($_l_ObjectQueryDDTop; $_l_ObjectRight; $_l_ObjectTabBottom; $_l_ObjectTabLeft; $_l_ObjectTabRight; $_l_ObjectTabTop; $_l_ObjectTop; $_l_ObjectWidth; $_l_OK; $_l_OrderIStatesBottom; $_l_OrderIStatesLeft)
	C_LONGINT:C283($_l_OrderIStatesRight; $_l_OrderIStatesTop; $_l_OrderItemCount; $_l_PrefferedWIdth; $_l_ProductCodeBottom; $_l_ProductCodeLeft; $_l_ProductCodeRight; $_l_ProductCodeTop; $_l_ProductNameBottom; $_l_ProductNameLeft; $_l_ProductNameRight)
	C_LONGINT:C283($_l_ProductNameTop; $_l_QueryMode; $_l_QULabelBottom; $_l_QULabelLeft; $_l_QULabelRIght; $_l_QULabelTop; $_l_r0; $_l_r1; $_l_r2; $_l_r3; $_l_r4)
	C_LONGINT:C283($_l_r5; $_l_r6; $_l_r7; $_l_rDateTOffset; $_l_RdDateFOffset; $_l_Remaining; $_l_SideBarBottom; $_l_SideBarLeft; $_l_SideBarRight; $_l_SideBarTop; $_l_SIS)
	C_LONGINT:C283($_l_SrchMinWidth; $_l_TableNumber; $_l_TableRow; $_l_TabsWidth; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; CCQ_l_BUT1; CCQ_l_BUT10)
	C_LONGINT:C283(CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13; CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20)
	C_LONGINT:C283(CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23; CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6)
	C_LONGINT:C283(CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9; ch2; cNAA; cNAL; cSetAdd; cSetMod; cSIS; r0; r1)
	C_LONGINT:C283(r2; r3; r4; r5; r6; r7; RHold; RS_l_BUT1; RS_l_BUT10; RS_l_BUT11; RS_l_BUT12)
	C_LONGINT:C283(RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17; RS_l_BUT18; RS_l_BUT19; RS_l_BUT2; RS_l_BUT20; RS_l_BUT21; RS_l_BUT22)
	C_LONGINT:C283(RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27; RS_l_BUT3; RS_l_BUT4; RS_l_BUT5; RS_l_BUT6; RS_l_BUT7; RS_l_BUT8)
	C_LONGINT:C283(RS_l_BUT9; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; vCalls; VDnDateFOffset; VDnDateTOffset; VDoDateFOffset; VDoDateTOffset; ViDateFOffset; ViDateTOffset)
	C_LONGINT:C283(VItemNum; vOIButt; vOrdI; VRDateFOffset; VRDateTOffset; VRdDateFOffset; VRdDateTOffset; VsDateFOffset; VsDateTOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_MarginF; $_r_MarginT; VamountF; vAmountT; VMarginF; vMarginT)
	C_TEXT:C284($_t_ContrCode; $_t_FormUsage; $_t_FormUsage3; $_t_InvNoF; $_t_InvNoT; $_t_ItemRef; $_t_oldMethodName; $_t_OrderCode; $_t_OrderNo; $_t_ProblemCode; $_t_ProductCode)
	C_TEXT:C284($_t_ProductName; $_t_Sales; $_t_SerialNumber; $_t_SolutionCode; $_t_TableNumberString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1; oCCQ_COL10)
	C_TEXT:C284(oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2; oCCQ_COL20)
	C_TEXT:C284(oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5; oCCQ_COL6)
	C_TEXT:C284(oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15; oCCQ_HED16)
	C_TEXT:C284(oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25; oCCQ_HED26)
	C_TEXT:C284(oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; oRS_COL1; oRS_COL10; oRS_COL11)
	C_TEXT:C284(oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15; oRS_COL16; oRS_COL17; oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21)
	C_TEXT:C284(oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25; oRS_COL26; oRS_COL27; oRS_COL3; oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7)
	C_TEXT:C284(oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10; oRS_HED11; oRS_HED12; oRS_HED13; oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17)
	C_TEXT:C284(oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20; oRS_HED21; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27)
	C_TEXT:C284(oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6; oRS_HED7; oRS_HED8; oRS_HED9; vCOntrCode; VInvNoF; VInvNoT; vItemRef)
	C_TEXT:C284(VOrderCode; vOrderNo; VProbCode; VProdCode; vProdName; VSales; VSerialNo; VSolCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].ditems_sel"; Form event code:C388)
Sel_LProc2(->[ORDER_ITEMS:25])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vIDateF:=!00-00-00!
		vIdateT:=!00-00-00!
		vDnDateF:=!00-00-00!
		vDndateT:=!00-00-00!
		vRdDateF:=!00-00-00!
		vRddateT:=!00-00-00!
		
		
		SET MENU BAR:C67(54)
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "ditems_sel")
		//SRCH_d_EntryDateFrom:=!00/00/00!
		SRCH_d_FromBase:=!00-00-00!
		VidateTBASE:=!00-00-00!
		VDNddateFBASE:=!00-00-00!
		VDNdateTBASE:=!00-00-00!
		VRddateFBASE:=!00-00-00!
		VRddateTBASE:=!00-00-00!
		
		SRCH_bo_ViDateToSet:=False:C215
		SRCH_bo_VDnDateToSet:=False:C215
		SRCH_bo_VRdDateToSet:=False:C215
		
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		ARRAY TEXT:C222(ORDI_at_TabContexts; 0)
		ARRAY LONGINT:C221(ORDI_al_coTabChoices; 0)
		APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Order Items")
		APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 0)
		APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Information")
		APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 2)
		If (DB_GetModuleSettingByNUM(Module_Products)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PRODUCTS:9]))<0)
				APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Products")
				APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 1)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDERS:24]))<0)
				APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Orders")
				APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 3)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[INVOICES:39]))<0)
				APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Invoices")
				APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 4)
			End if 
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
			If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[PURCHASE_ORDERS:57]))<0)
				APPEND TO ARRAY:C911(ORDI_at_TabContexts; "Purchase Orders")
				APPEND TO ARRAY:C911(ORDI_al_coTabChoices; 5)
			End if 
		End if 
		
		ORDI_at_TabContexts:=1
		dbtabText2:=""
		For ($_l_TabsWidth; 1; Size of array:C274(ORDI_at_TabContexts))
			dbtabText2:=dbtabText2+ORDI_at_TabContexts{$_l_TabsWidth}+(" "*8)
		End for 
		//TRACE
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
		
		If (viDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
		End if 
		If (vDnDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; False:C215)
		Else 
			//VsdateT:=VsdateF
		End if 
		If (vRdDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (VamountF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalAmountT"; False:C215)
		End if 
		
		If (VMarginF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalMarginT"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderItemCount)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Serial_Number:24#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_OrderItemCount=0)
			OBJECT SET VISIBLE:C603(*; "oSerialNumber@"; False:C215)
		End if 
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_OrderItemCount)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29#"")
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_OrderItemCount=0)  //| (False)
			OBJECT SET VISIBLE:C603(*; "oContractCode@"; False:C215)
		End if 
		SM_LoadSearchParameterNames(Table:C252(->[ORDER_ITEMS:25]); SM_l_QueryMode)
		
		$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
		$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[ORDER_ITEMS:25]))
		If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
			$_t_FormUsage3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_FurtherFieldsCount:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
			If ($_l_FurtherFieldsCount#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_FurtherFieldsCount)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_FurtherFieldsCount)
				For ($_l_Index; 1; $_l_FurtherFieldsCount)  //clear the arr first
					CUS_at_DisplayedData{$_l_Index}:=""
					CUS_at_PageText{$_l_Index}:=""
				End for 
			Else 
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
				ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			End if 
			If (Size of array:C274(FUR_at_CustomFieldNames)>0)  //& (False)
				
				LB_SetupListbox(->ORDI_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->ORDI_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsTakeoff:=595-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsTakeoff
				$_l_PrefferedWIdth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PrefferedWIdth)
					$_l_Remaining:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->ORDI_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_Remaining/2); ($_l_Remaining/2); 40; 0)
				End if 
				
				LB_SetEnterable(->ORDI_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->ORDI_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->ORDI_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->ORDI_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->ORDI_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->ORDI_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_Height:=404+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
				If ($_l_Height<600)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=600
					WS_AutoscreenSize(2; 600; $_l_TotalWidth)
				End if 
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "OHoldText"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_objectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_objectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					//$_l_ObjectTop:=
					OBJECT MOVE:C664(*; "OHoldText"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					
					OBJECT GET COORDINATES:C663(*; "oCancelButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oCancelButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
					OBJECT GET COORDINATES:C663(*; "oContinueButton2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_Inset:=$_l_TotalWidth-$_l_ObjectRight
					$_l_FromBottom:=$_l_Height-$_l_ObjectBottom
					$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
					$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "oContinueButton2"; $_l_TotalWidth-$_l_ObjectWidth-$_l_Inset; $_l_ObjectTop; $_l_TotalWidth-$_l_Inset; $_l_ObjectBottom; *)
				End if 
			Else 
				$_l_Height:=404
				If ($_l_Height<404)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=404
					WS_AutoscreenSize(2; 404; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			
			$_l_Height:=404
			If ($_l_Height<404)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=404
				WS_AutoscreenSize(2; 404; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
		End if 
		
		
		
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		If (DB_t_CurrentFormUsage="NotDel")
			r5:=1
			ch2:=1
		End if 
		If (SM_l_QueryMode=2)
			DB_MenuAction("Find"; "Products"; 3; "")
			DB_MenuAction("Find"; "Information"; 3; "")
			DB_MenuAction("Find"; "Orders"; 3; "")
			DB_MenuAction("Find"; "Invoices"; 3; "")
			DB_MenuAction("Find"; "Purchase orders"; 3; "")
			DB_MenuAction("Functions"; "And …"; 3; "")
			DB_MenuAction("Functions"; "Or …"; 3; "")
			DB_MenuAction("Functions"; "Not …"; 3; "")
			DB_MenuAction("Functions"; "Save Criteria ..."; 3; "")
			DB_MenuAction("Functions"; "User Search …"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)<2)
			DB_MenuAction("Find"; "Products"; 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)<2)
			DB_MenuAction("Find"; "Orders"; 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Orders"); 3; "")
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2)
			DB_MenuAction("Find"; "Purchase orders"; 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Purchase orders"); 3; "")
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesLedger)<2)
			DB_MenuAction("Find"; "Invoices"; 3; "")
			DB_MenuAction(DB_GetIndexedString(0; 0; "Find"); DB_GetIndexedString(0; 0; "Sales Ledger"); 3; "")
		End if 
		If (SM_l_QueryMode>0)
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		ARRAY BOOLEAN:C223(OrdI_abo_Include; 0)
		ARRAY BOOLEAN:C223(OrdI_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
		For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
			OrdI_abo_Include{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
		End for 
		
		ARRAY BOOLEAN:C223(ORDi_LB_States; 0)
		LB_SetupListbox(->ORDi_LB_States; "oRS"; "RS_L"; 1; ->OrdI_abo_Include; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus)
		
		
		LB_SetColumnHeaders(->ORDi_LB_States; "RS_L"; 1; "Include"; "Name")
		
		
		LB_SetColumnWidths(->ORDi_LB_States; "oABR"; 1; 20; 80; 0)
		
		LB_SetEnterable(->ORDi_LB_States; False:C215; 0)
		LB_SetEnterable(->ORDi_LB_States; True:C214; 1)
		
		If ((Size of array:C274(SYS_at_RecordStateNames)*16)>172)
			LB_SetScroll(->ORDi_LB_States; -3; -2)
		Else 
			LB_SetScroll(->ORDi_LB_States; -3; -3)
		End if 
		LB_StyleSettings(->ORDi_LB_States; "Black"; 9; "STK_t"; ->[ORDERS:24])
		
		
		If (DB_t_CurrentFormUsage="Subs @")
			//```
			If (SM_l_QueryMode=0)
				$_l_OK:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27)
			Else 
				$_l_QueryMode:=SM_l_QueryMode
				
				If (SM_l_QueryMode=0) | (SM_l_QueryMode=2)
					$_l_OK:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27; $_l_QueryMode; Table:C252(->[ORDER_ITEMS:25]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					
					
				Else 
					$_l_OK:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27; -1; Table:C252(->[ORDER_ITEMS:25]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					
				End if 
				
				SM_l_QueryMode:=$_l_QueryMode
			End if 
			SM_LoadSearchParameterNames(Table:C252(->[ORDER_ITEMS:25]); SM_l_QueryMode)
			
			
			//```
		End if 
		//WS_AutoscreenSize (2;350;528)
		INT_SetDialog
		
		If (SM_l_QueryMode=0)
			$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[ORDER_ITEMS:25]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_defaultparams:=0
			If (SM_l_QueryMode=2)
				$_l_defaultparams:=SM_l_QuerySearchID
			End if 
			
		End if 
		If ($_l_defaultparams>0)
			ViDateFOffset:=0
			VRdDateFOffset:=0
			VDnDateFOffset:=0
			ViDateTOffset:=0
			VRdDateTOffset:=0
			VDnDateTOffset:=0
			SM_LoadSearchParameters($_l_defaultparams)
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						vDnDateF:=Current date:C33-VDnDateFOffset
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					: (VDnDateFOffset>-100)
						//months
						vDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					Else 
						//years
						vDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						vDnDateF:=Current date:C33-VDnDateTOffset
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					: (VDnDateTOffset>-100)
						//months
						vDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					Else 
						//years
						vDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End case 
				
				
			End if 
			
			
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateF:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRdDateFOffset#0)
				Case of 
					: (VRdDateFOffset>0)
						vRdDateF:=Current date:C33-VRdDateFOffset
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					: (VRdDateFOffset>-100)
						//months
						vRdDateF:=Add to date:C393(Current date:C33; 0; VRdDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					Else 
						//years
						vRdDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRdDateTOffset#0)
				Case of 
					: (VRdDateTOffset>0)
						vRdDateF:=Current date:C33-VRdDateTOffset
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					: (VRdDateTOffset>-100)
						//months
						vRdDateT:=Add to date:C393(Current date:C33; 0; VRdDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					Else 
						//years
						vRdDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
				End case 
				
				
			End if 
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(ORDI_at_TabContexts; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ViDATEF))
				If (ViDateF>!00-00-00!)
					If (SRCH_bo_ViDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (ViDateF>ViDateT) & (ViDateT>!00-00-00!)
						ViDateT:=ViDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ViDATET))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (ViDateT<ViDateF)
						ViDateF:=ViDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VDnDATEF))
				If (vDnDateF>!00-00-00!)
					If (SRCH_bo_VDnDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VDnDateF>VDnDateT) & (VDNDateT>!00-00-00!)
						
						VDnDateT:=VDNDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDnDATET))
				If (VDNDateT>!00-00-00!)
					If (VDNDateT<VDNDateF)
						VDnDateF:=VDnDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRdDATEF))
				If (vRdDateF>!00-00-00!)
					If (SRCH_bo_VRdDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VRdDateF>VRdDateT) & (VRdDateT>!00-00-00!)
						VRdDateT:=VRdDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRdDATET))
				If (VRdDateT>!00-00-00!)
					If (VRdDateT<VRdDateF)
						VRdDateF:=VRdDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vAmountF
				End if 
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vMarginF)
				If (vMarginT<vMarginF) & (vMarginT>0)
					vMarginT:=vMarginF
				End if 
			: ($_ptr_FocusObject=->vMarginT)
				If (vMarginF>vMarginT)
					vMarginF:=vMarginT
				End if 
		End case 
		
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->ViDATEF))
				If (ViDateF>!00-00-00!)
					If (SRCH_bo_ViDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
					End if 
					If (ViDateF>ViDateT) & (ViDateT>!00-00-00!)
						ViDateT:=ViDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->ViDATET))
				If (SRCH_d_EntryDateTo>!00-00-00!)
					If (ViDateT<ViDateF)
						ViDateF:=ViDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VDnDATEF))
				If (vDnDateF>!00-00-00!)
					If (SRCH_bo_VDnDateToSet=False:C215)
						//vSDateT:=vSDateF
					End if 
					If (VDnDateF>VDnDateT) & (VDNDateT>!00-00-00!)
						
						VDnDateT:=VDNDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VDnDATET))
				If (VDNDateT>!00-00-00!)
					If (VDNDateT<VDNDateF)
						VDnDateF:=VDnDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRdDATEF))
				If (vRdDateF>!00-00-00!)
					If (SRCH_bo_VRdDateToSet=False:C215)
						//vFDateT:=vFDateF
					End if 
					If (VRdDateF>VRdDateT) & (VRdDateT>!00-00-00!)
						VRdDateT:=VRdDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRdDATET))
				If (VRdDateT>!00-00-00!)
					If (VRdDateT<VRdDateF)
						VRdDateF:=VRdDateT
					End if 
				End if 
				
			: ($_ptr_FocusObject=->vAmountF)
				If (vAmountT<vAmountF) & (vAmountT>0)
					vAmountT:=vAmountF
				End if 
			: ($_ptr_FocusObject=->vAmountT)
				If (vAmountF>vAmountT)
					vAmountF:=vAmountT
				End if 
			: ($_ptr_FocusObject=->vMarginF)
				If (vMarginT<vMarginF) & (vMarginT>0)
					vMarginT:=vMarginF
				End if 
			: ($_ptr_FocusObject=->vMarginT)
				If (vMarginF>vMarginT)
					vMarginF:=vMarginT
				End if 
		End case 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_OrderCode:=VOrderCode
				$_t_SolutionCode:=VSolCode
				$_t_ProductCode:=VProdCode
				$_t_ProductName:=vProdName
				$_t_SerialNumber:=VSerialNo
				$_t_Sales:=VSales
				$_t_ProblemCode:=VProbCode
				$_l_ItemNumber:=VItemNum
				$_t_ItemRef:=vItemRef
				$_t_InvNoF:=VInvNoF
				$_t_InvNoT:=VInvNoT
				$_d_LDateF:=viDateF
				$_d_lDateT:=viDateT
				$_d_DNDateF:=VDNDateF
				$_d_DNDateT:=VDNDateT
				$_d_RdDateF:=VRdDateF
				$_d_RdDateT:=VRdDateT
				$_r_AmountTo:=VamountT
				$_r_AmountFrom:=VamountF
				$_r_MarginF:=VMarginF
				$_r_MarginT:=VMarginT
				$_t_OrderNo:=vOrderNo
				$_t_ContrCode:=vCOntrCode
				ARRAY TEXT:C222($_at_RecordStateNames; 0)
				ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
				
				COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
				COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_l_r0:=r0
				$_l_r1:=r1
				$_l_r2:=r2
				$_l_r3:=r3
				$_l_r4:=r4
				$_l_r5:=r5
				$_l_r6:=r6
				$_l_r7:=r7
				$_bo_ShowHold:=SRCH_bo_ShowHold
				SRCH_bo_ShowHold:=True:C214
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom)
				
				OBJECT GET COORDINATES:C663(*; "oSideBarOrderItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom)
				OBJECT GET COORDINATES:C663(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom)
				OBJECT GET COORDINATES:C663(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom)
				
				OBJECT GET COORDINATES:C663(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom)
				OBJECT GET COORDINATES:C663(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom)
				OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oOrderStatesListbox"; $_l_OrderIStatesLeft; $_l_OrderIStatesTop; $_l_OrderIStatesRight; $_l_OrderIStatesBottom)
				OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom)
				OBJECT GET COORDINATES:C663(*; "oORDITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom)
				OBJECT GET COORDINATES:C663(*; "oItemNumber"; $_l_ItemNumberLeft; $_l_ItemNumberTop; $_l_ItemNumberRight; $_l_ItemNumberBottom)
				OBJECT GET COORDINATES:C663(*; "oItemNumberLabel"; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelTop; $_l_ItemNumberLabelRight; $_l_ItemNumberLabelBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomerItemReference"; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceTop; $_l_CustomerItemReferenceRight; $_l_CustomerItemReferenceBottom)
				OBJECT GET COORDINATES:C663(*; "oCustomerItemReferenceLabel"; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelBo)
				
				
				
				COPY ARRAY:C226(FUR_at_CustomFieldNames; $_at_CustomFieldNames)
				COPY ARRAY:C226(FUR_at_CustomFieldFormat; $_at_CustomFieldFormat)
				COPY ARRAY:C226(FUR_at_CustomFieldTypes; $_at_CustomFieldTypes)
				$_d_FromBase:=SRCH_d_FromBase
				$_d_idateTBASE:=VidateTBASE
				$_d_dndateFBASE:=VDNdateFBASE
				$_d_dndateTBASE:=VDNdateTBASE
				$_d_rdateFBASE:=VRddateFBASE
				$_d_rdateTBASE:=VRddateTBASE
				$_bo_ViDateToSet:=SRCH_bo_ViDateToSet
				$_bo_VDnDateToSet:=SRCH_bo_VDNDateToSet
				$_bo_VRDDateToSet:=SRCH_bo_VRDDateToSet
				$_l_iDateFOffset:=ViDateFOffset
				$_l_RdDateFOffset:=VRdDateFOffset
				$_l_dnDateFOffset:=VDnDateFOffset
				$_l_iDateTOffset:=ViDateTOffset
				$_l_rDateTOffset:=VRdDateTOffset
				$_l_dnDateTOffset:=VDnDateTOffset
				$_l_RdDateFOffset:=VRdDateFOffset
				$_l_dnDateFOffset:=VDnDateFOffset
				$_l_iDateTOffset:=ViDateTOffset
				$_l_rDateTOffset:=VRdDateTOffset
				$_l_dnDateTOffset:=VDnDateTOffset
				
				
				SRCH_l_MinWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_SrchMinWidth:=SRCH_l_MinWidth
				If (Not:C34(SRCH_bo_Pathinited))
					ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
					SRCH_bo_Pathinited:=True:C214
				End if 
				If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))<0)
					APPEND TO ARRAY:C911(SRCH_al_DoNotIncludeTable; Table:C252(->[ORDER_ITEMS:25]))
				End if 
				
				COPY ARRAY:C226(SRCH_al_DoNotIncludeTable; $_al_DoNotIncludeTable)
				
				$_l_OK:=0
				
				If (SM_l_QueryMode=0)
					$_l_OK:=OrderI_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=OrderI_SelLP(-1; SM_l_QueryMode; Table:C252(->[ORDER_ITEMS:25]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(54)
				SRCH_l_MinWidth:=$_l_SrchMinWidth
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				COPY ARRAY:C226($_at_CustomFieldNames; FUR_at_CustomFieldNames)
				COPY ARRAY:C226($_at_CustomFieldFormat; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226($_at_CustomFieldTypes; FUR_at_CustomFieldTypes)
				SRCH_d_FromBase:=$_d_FromBase
				VidateTBASE:=$_d_idateTBASE
				VDNdateFBASE:=$_d_dndateFBASE
				VDNdateTBASE:=$_d_dndateTBASE
				VRddateFBASE:=$_d_rdateFBASE
				VRddateTBASE:=$_d_rdateTBASE
				SRCH_bo_ViDateToSet:=$_bo_ViDateToSet
				SRCH_bo_VDNDateToSet:=$_bo_VDnDateToSet
				SRCH_bo_VRDDateToSet:=$_bo_VRDDateToSet
				COPY ARRAY:C226($_al_DoNotIncludeTable; SRCH_al_DoNotIncludeTable)
				OBJECT MOVE:C664(*; "oAQLabel"; $_l_QULabelLeft; $_l_QULabelTop; $_l_QULabelRIght; $_l_QULabelBottom; *)
				
				OBJECT MOVE:C664(*; "oSideBarOrderItems"; $_l_SideBarLeft; $_l_SideBarTop; $_l_SideBarRight; $_l_SideBarBottom; *)
				OBJECT MOVE:C664(*; "oContinueButton"; $_l_ContinueButtonLeft; $_l_ContinueButtonTop; $_l_ContinueButtonRight; $_l_ContinueButtonBottom; *)
				OBJECT MOVE:C664(*; "oCancelButton"; $_l_CancelButtonLeft; $_l_CancelButtonTop; $_l_CancelButtonRight; $_l_CancelButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupCheckbox"; $_l_NoLookupButtonLeft; $_l_NoLookupButtonTop; $_l_NoLookupButtonRight; $_l_NoLookupButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoLookupLabel"; $_l_NoLookupLabelLeft; $_l_NoLookupLabelTop; $_l_NoLookupLabelRight; $_l_NoLookupLabelBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardCheckbox"; $_l_NoWildButtonLeft; $_l_NoWildButtonTop; $_l_NoWildButtonRight; $_l_NoWildButtonBottom; *)
				OBJECT MOVE:C664(*; "oNoAutoWildcardLabel"; $_l_NoWildLabelLeft; $_l_NoWildLabelTop; $_l_NoWildLabelRight; $_l_NoWildLabelBottom; *)
				OBJECT MOVE:C664(*; "oWIthinSelectionCheckbox"; $_l_inselectButtonLeft; $_l_inselectButtonTop; $_l_inSelectButtonRight; $_l_inSelectButtonBottom; *)
				OBJECT MOVE:C664(*; "oWithinSelectionLabel"; $_l_inselectLabelLeft; $_l_inselectLabelTop; $_l_inselectLabelRight; $_l_inselectLabelBottom; *)
				OBJECT MOVE:C664(*; "oHoldCheckBox"; $_l_ObjectHoldCBLeft; $_l_ObjectHoldCBTop; $_l_ObjectHoldCBRight; $_l_ObjectHoldCBBottom; *)
				OBJECT MOVE:C664(*; "oHoldText"; $_l_ObjectHoldLeft; $_l_ObjectHoldTop; $_l_ObjectHoldRight; $_l_ObjectHoldBottom; *)
				
				OBJECT MOVE:C664(*; "oQueryDropDown"; $_l_ObjectQueryDDLeft; $_l_ObjectQueryDDTop; $_l_ObjectQueryDDRight; $_l_ObjectQueryDDBottom; *)
				OBJECT MOVE:C664(*; "oLoadQueryLabel"; $_l_ObjectLoadLabelLeft; $_l_ObjectLoadLabelTop; $_l_ObjectLoadLabelRight; $_l_ObjectLoadLabelBottom; *)
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oOrderStatesListbox"; $_l_OrderIStatesLeft; $_l_OrderIStatesTop; $_l_OrderIStatesRight; $_l_OrderIStatesBottom; *)
				OBJECT MOVE:C664(*; "oProductCode"; $_l_ProductCodeLeft; $_l_ProductCodeTop; $_l_ProductCodeRight; $_l_ProductCodeBottom; *)
				OBJECT MOVE:C664(*; "oProductName"; $_l_ProductNameLeft; $_l_ProductNameTop; $_l_ProductNameRight; $_l_ProductNameBottom; *)
				OBJECT MOVE:C664(*; "oCustomFieldsQuery"; $_l_ObjectCustomLeft; $_l_ObjectCustomTop; $_l_ObjectCustomRight; $_l_ObjectCustomBottom; *)
				OBJECT MOVE:C664(*; "oORDITabChoices"; $_l_ObjectTabLeft; $_l_ObjectTabTop; $_l_ObjectTabRight; $_l_ObjectTabBottom; *)
				OBJECT MOVE:C664(*; "oFromNo"; $_l_FromnoVarLeft; $_l_FromnoVarTop; $_l_FromnoVarRight; $_l_FromnoVarBottom; *)
				OBJECT MOVE:C664(*; "oFromLabel"; $_l_FromLabelLeft; $_l_FromLabelTop; $_l_FromLabelRight; $_l_FromLabelBottom; *)
				OBJECT MOVE:C664(*; "oItemNumber"; $_l_ItemNumberLeft; $_l_ItemNumberTop; $_l_ItemNumberRight; $_l_ItemNumberBottom; *)
				OBJECT MOVE:C664(*; "oItemNumberLabel"; $_l_ItemNumberLabelLeft; $_l_ItemNumberLabelTop; $_l_ItemNumberLabelRight; $_l_ItemNumberLabelBottom; *)
				OBJECT MOVE:C664(*; "oCustomerItemReference"; $_l_CustomerItemReferenceLeft; $_l_CustomerItemReferenceTop; $_l_CustomerItemReferenceRight; $_l_CustomerItemReferenceBottom; *)
				OBJECT MOVE:C664(*; "oCustomerItemReferenceLabel"; $_l_CustomerItemReferenceLabelLe; $_l_CustomerItemReferenceLabelTo; $_l_CustomerItemReferenceLabelRi; $_l_CustomerItemReferenceLabelBo; *)
				SRCH_bo_ShowHold:=$_bo_ShowHold
				SM_LoadSearchParameterNames(Table:C252(->[ORDER_ITEMS:25]); SM_l_QueryMode)
				
				vOrderCode:=$_t_OrderCode
				vSolCode:=$_t_SolutionCode
				vProdCode:=$_t_ProductCode
				vProdName:=$_t_ProductName
				vSerialNo:=$_t_SerialNumber
				vSales:=$_t_Sales
				vProbCode:=$_t_ProblemCode
				vitemNum:=$_l_ItemNumber
				vItemRef:=$_t_ItemRef
				vInvNoF:=$_t_InvNoF
				vInvNoT:=$_t_InvNoT
				viDateF:=$_d_LDateF
				viDateT:=$_d_lDateT
				vDnDateF:=$_d_DNDateF
				vDNDateT:=$_d_DNDateT
				VRdDateF:=$_d_RdDateF
				VRdDateT:=$_d_RdDateT
				vAmountT:=$_r_AmountTo
				vAmountF:=$_r_AmountFrom
				vMarginF:=$_r_MarginF
				vMarginT:=$_r_MarginT
				vOrderNo:=$_t_OrderNo
				vContrCode:=$_t_ContrCode
				COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
				COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				
				r0:=$_l_r0
				r1:=$_l_r1
				r2:=$_l_r2
				r3:=$_l_r3
				r4:=$_l_r4
				r5:=$_l_r5
				r6:=$_l_r6
				r7:=$_l_r7
				ViDateFOffset:=$_l_iDateFOffset
				VRdDateFOffset:=$_l_RdDateFOffset
				VDnDateFOffset:=$_l_dnDateFOffset
				ViDateTOffset:=$_l_iDateTOffset
				VRdDateTOffset:=$_l_rDateTOffset
				VDnDateTOffset:=$_l_dnDateTOffset
				VRdDateFOffset:=$_l_RdDateFOffset
				VDnDateFOffset:=$_l_dnDateFOffset
				ViDateTOffset:=$_l_iDateTOffset
				VRdDateTOffset:=$_l_rDateTOffset
				VDnDateTOffset:=$_l_dnDateTOffset
				If ($_l_OK>0) & (Not:C34(rHold=1))
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
				If (Not:C34(SRCH_bo_ShowHold))
					OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
				End if 
				
				RHold:=0
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dItems_Sel"; $_t_oldMethodName)
