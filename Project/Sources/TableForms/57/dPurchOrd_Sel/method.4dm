If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]dPurchOrd_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_abo_Include;0)
	//ARRAY BOOLEAN(PO_Lb_FurtherFieldsQuery;0)
	//ARRAY BOOLEAN(PO_LB_States;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(PO_al_TabOffset;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SRCH_al_DoNotIncludeTable;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(PO_at_TabChoices;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SRCH_bo_Pathinited; SRCH_bo_ShowHold; SRCH_bo_VIDateToSet; SRCH_bo_VpDateToSet; SRCH_bo_VRDateToSet; WS_bo_InsearchScreen)
	C_DATE:C307($_d_lDateF; $_d_lDateT; $_d_PDateF; $_d_PDateT; $_d_RDateF; $_d_RDateT; SRCH_d_FromBase; SRCH_d_rdateTBase; vIDateF; vIdateT; VIdateTBASE)
	C_DATE:C307(vPDateF; VPdateFBASE; vPdateT; VPdateTBASE; vRDateF; VRdateFBASE; vRdateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BestHeight; $_l_BestWidth; $_l_CH1; $_l_CHO; $_l_ColumnsSubtractWidth; $_l_ColumnsWidth; $_l_CustomFieldCount; $_l_DefaultParameters; $_l_event; $_l_FromBottom)
	C_LONGINT:C283($_l_Height; $_l_IDateFOffset; $_l_IDateTOffset; $_l_Index; $_l_Inset; $_l_NAA; $_l_NAL; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_ObjectWidth; $_l_OK; $_l_PDateFOffset; $_l_PDateTOffset; $_l_PreferredWidth; $_l_QueryMode; $_l_R1; $_l_RDateFOffset; $_l_RDateTOffset; $_l_RemainingWidth)
	C_LONGINT:C283($_l_RO; $_l_SIS; $_l_TableNumber; $_l_TablePosition; $_l_TabsWidthIndex; $_l_TotalWidth; CCQ_l_BUT1; CCQ_l_BUT10; CCQ_l_BUT11; CCQ_l_BUT12; CCQ_l_BUT13)
	C_LONGINT:C283(CCQ_l_BUT14; CCQ_l_BUT15; CCQ_l_BUT16; CCQ_l_BUT17; CCQ_l_BUT18; CCQ_l_BUT19; CCQ_l_BUT2; CCQ_l_BUT20; CCQ_l_BUT21; CCQ_l_BUT22; CCQ_l_BUT23)
	C_LONGINT:C283(CCQ_l_BUT24; CCQ_l_BUT25; CCQ_l_BUT26; CCQ_l_BUT27; CCQ_l_BUT3; CCQ_l_BUT4; CCQ_l_BUT5; CCQ_l_BUT6; CCQ_l_BUT7; CCQ_l_BUT8; CCQ_l_BUT9)
	C_LONGINT:C283(CH0; ch1; ch2; cNAA; cNAL; cSIS; R0; R1; RHold; RS_l_BUT1; RS_l_BUT10)
	C_LONGINT:C283(RS_l_BUT11; RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17; RS_l_BUT18; RS_l_BUT19; RS_l_BUT2; RS_l_BUT20)
	C_LONGINT:C283(RS_l_BUT21; RS_l_BUT22; RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27; RS_l_BUT3; RS_l_BUT4; RS_l_BUT5; RS_l_BUT6)
	C_LONGINT:C283(RS_l_BUT7; RS_l_BUT8; RS_l_BUT9; SM_l_QueryMode; SM_l_QuerySearchID; SRCH_l_MinWidth; vIDateFOffset; vIDateTOffset; VINF; vpDateFOffset; vpDateTOffset)
	C_LONGINT:C283(vRDateFOffset; vRDateTOffset; xCancel; xOK)
	C_POINTER:C301($_ptr_Field; $_ptr_FocusObject)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_InvF; $_r_InvT; VamountF; VamountT; VinvF; vInvT)
	C_TEXT:C284($_t_AnalysisCode; $_t_CompanyCode; $_t_CompanyName; $_t_CompanyNameC; $_t_ContactCode; $_t_ContactName; $_t_CurrencyCode; $_t_EventCode; $_t_Forename; $_t_LayerCode; $_t_oldMethodName)
	C_TEXT:C284($_t_OrderNo; $_t_ProductCode; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_Surname; $_t_TableNumberString; ACC_t_CurrencyCode; DB_t_CurrentFormUsage3; dbtabText2; oCCQ_COL1; oCCQ_COL10)
	C_TEXT:C284(oCCQ_COL11; oCCQ_COL12; oCCQ_COL13; oCCQ_COL14; oCCQ_COL15; oCCQ_COL16; oCCQ_COL17; oCCQ_COL18; oCCQ_COL19; oCCQ_COL2; oCCQ_COL20)
	C_TEXT:C284(oCCQ_COL21; oCCQ_COL22; oCCQ_COL23; oCCQ_COL24; oCCQ_COL25; oCCQ_COL26; oCCQ_COL27; oCCQ_COL3; oCCQ_COL4; oCCQ_COL5; oCCQ_COL6)
	C_TEXT:C284(oCCQ_COL7; oCCQ_COL8; oCCQ_COL9; oCCQ_HED1; oCCQ_HED10; oCCQ_HED11; oCCQ_HED12; oCCQ_HED13; oCCQ_HED14; oCCQ_HED15; oCCQ_HED16)
	C_TEXT:C284(oCCQ_HED17; oCCQ_HED18; oCCQ_HED19; oCCQ_HED2; oCCQ_HED20; oCCQ_HED21; oCCQ_HED22; oCCQ_HED23; oCCQ_HED24; oCCQ_HED25; oCCQ_HED26)
	C_TEXT:C284(oCCQ_HED27; oCCQ_HED3; oCCQ_HED4; oCCQ_HED5; oCCQ_HED6; oCCQ_HED7; oCCQ_HED8; oCCQ_HED9; oRS_COL1; oRS_COL10; oRS_COL11)
	C_TEXT:C284(oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15; oRS_COL16; oRS_COL17; oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21)
	C_TEXT:C284(oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25; oRS_COL26; oRS_COL27; oRS_COL3; oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7)
	C_TEXT:C284(oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10; oRS_HED11; oRS_HED12; oRS_HED13; oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17)
	C_TEXT:C284(oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20; oRS_HED21; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27)
	C_TEXT:C284(oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6; oRS_HED7; oRS_HED8; oRS_HED9; VAnalysis; VCompCode; VCompName; VCOmpNameC)
	C_TEXT:C284(VcontactName; vContCode; VEvent; VforeName; VLayer; VorderNo; VProdCode; VPurchCode; VPurchInvNo; Vsurname; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].dPurchOrd_Sel"; Form event code:C388)

Sel_LProc2(->[PURCHASE_ORDERS:57])
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vIDateF:=!00-00-00!
		vIdateT:=!00-00-00!
		vPDateF:=!00-00-00!
		vPdateT:=!00-00-00!
		vRDateF:=!00-00-00!
		vRdateT:=!00-00-00!
		//ACC_d_EntryDateFrom:=!00/00/00!
		SRCH_d_FromBase:=!00-00-00!
		vIdateTBASE:=!00-00-00!
		vPdateFBASE:=!00-00-00!
		VPdateTBASE:=!00-00-00!
		VRdateFBASE:=!00-00-00!
		SRCH_d_rdateTBase:=!00-00-00!
		
		
		SRCH_bo_VIDateToSet:=False:C215
		SRCH_bo_VPDateToSet:=False:C215
		SRCH_bo_VRDateToSet:=False:C215
		
		If (Not:C34(SRCH_bo_ShowHold))
			OBJECT SET VISIBLE:C603(*; "oHold@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oHold@"; True:C214)
		End if 
		
		SET MENU BAR:C67(51)
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); "dPurchOrd_Sel")
		//WS_AutoscreenSize (2;322;528)
		ARRAY TEXT:C222(PO_at_TabChoices; 0)
		ARRAY LONGINT:C221(PO_al_TabOffset; 0)
		If (Not:C34(SRCH_bo_Pathinited))
			ARRAY LONGINT:C221(SRCH_al_DoNotIncludeTable; 0)
			SRCH_bo_Pathinited:=True:C214
		End if 
		APPEND TO ARRAY:C911(PO_at_TabChoices; "Purchase Orders")
		APPEND TO ARRAY:C911(PO_al_TabOffset; 0)
		
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[COMPANIES:2]))<0)
			APPEND TO ARRAY:C911(PO_at_TabChoices; "Companies")
			APPEND TO ARRAY:C911(PO_al_TabOffset; 1)
			
		End if 
		If (Find in array:C230(SRCH_al_DoNotIncludeTable; Table:C252(->[CONTACTS:1]))<0)
			APPEND TO ARRAY:C911(PO_at_TabChoices; "Contacts")
			APPEND TO ARRAY:C911(PO_al_TabOffset; 2)
			
		End if 
		
		PO_at_TabChoices:=1
		dbtabText2:=""
		For ($_l_TabsWidthIndex; 1; Size of array:C274(PO_at_TabChoices))
			dbtabText2:=dbtabText2+PO_at_TabChoices{$_l_TabsWidthIndex}+(" "*8)
		End for 
		//TRACE
		
		If (SRCH_l_MinWidth=0)
			SRCH_l_MinWidth:=592
		End if 
		OBJECT GET BEST SIZE:C717(dbtabText2; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>SRCH_l_MinWidth)
			$_l_TotalWidth:=$_l_BestWidth
			SRCH_l_MinWidth:=$_l_TotalWidth
		Else 
			If (SRCH_l_MinWidth>=592)
				$_l_TotalWidth:=SRCH_l_MinWidth
			Else 
				$_l_TotalWidth:=592
				SRCH_l_MinWidth:=592
			End if 
		End if 
		If (vIDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oPurchaseOrderDateT@"; False:C215)
		Else 
			//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
		End if 
		If (vPDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; False:C215)
		Else 
			//VsdateT:=VsdateF
		End if 
		If (vRDateF=!00-00-00!)
			OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; False:C215)
		Else 
			//VfdateT:=VfdateF
		End if 
		If (vINVF=0)
			OBJECT SET VISIBLE:C603(*; "oTotalCostT"; False:C215)
		End if 
		
		SM_LoadSearchParameterNames(Table:C252(->[PURCHASE_ORDERS:57]); SM_l_QueryMode)
		If (SM_l_QueryMode#0)  // edit or create
			OBJECT SET TITLE:C194(xCancel; "Cancel")
			OBJECT SET TITLE:C194(xOK; "Save")
			OBJECT SET VISIBLE:C603(cSIS; False:C215)
		End if 
		$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS:57])
		$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; Table:C252(->[PURCHASE_ORDERS:57]))
		If (<>SYS_al_TableUniqueField{$_l_TablePosition}#0)
			
			
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TablePosition})
			$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			
			//$Layout:=$_t_TableNumberString+DB_t_CurrentFormUsage3
			//$Layout:=Uppers2 (Lowercase(<>DB_at_TableNames{$_l_TablePosition}))
			//$Layout3:="MC"
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TablePosition})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			
			$_l_CustomFieldCount:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TablePosition})
			If ($_l_CustomFieldCount#0)
				
				
				
				COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TablePosition}; FUR_at_CustomFieldNames)
				COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TablePosition}; FUR_at_CustomFieldFormat)
				COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TablePosition}; FUR_at_CustomFieldTypes)
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_CustomFieldCount)
				ARRAY TEXT:C222(CUS_at_PageText; $_l_CustomFieldCount)
				For ($_l_Index; 1; $_l_CustomFieldCount)  //clear the arr first
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
				
				LB_SetupListbox(->PO_Lb_FurtherFieldsQuery; "oABR"; "CCQ_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes; ->FUR_at_CustomFieldFormat)
				
				LB_SetColumnHeaders(->PO_Lb_FurtherFieldsQuery; "CCQ_L"; 1; "Name"; "From"; "To"; "Type"; "List")
				
				OBJECT SET VISIBLE:C603(*; "oCustomFields"; True:C214)
				$_l_ColumnsSubtractWidth:=592-341
				$_l_ColumnsWidth:=$_l_TotalWidth-$_l_ColumnsSubtractWidth
				$_l_PreferredWidth:=120+280+280+40
				If ($_l_ColumnsWidth<$_l_PreferredWidth)
					$_l_RemainingWidth:=$_l_ColumnsWidth-(120+40)
					LB_SetColumnWidths(->PO_Lb_FurtherFieldsQuery; "oABR"; 1; 120; ($_l_RemainingWidth/2); ($_l_RemainingWidth/2); 40; 0)
				End if 
				
				LB_SetEnterable(->PO_Lb_FurtherFieldsQuery; False:C215; 0)
				LB_SetEnterable(->PO_Lb_FurtherFieldsQuery; True:C214; 3)
				LB_SetEnterable(->PO_Lb_FurtherFieldsQuery; True:C214; 2)
				LB_SetEnterable(->PO_Lb_FurtherFieldsQuery; False:C215; 4)
				
				
				LB_SetScroll(->PO_Lb_FurtherFieldsQuery; -2; -2)
				LB_StyleSettings(->PO_Lb_FurtherFieldsQuery; "Black"; 9; "STK_t"; ->[COMPANIES:2])
				
				$_l_Height:=375+(16*Size of array:C274(FUR_at_CustomFieldNames)+40)
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
				$_l_Height:=350
				If ($_l_Height<350)
					WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
				Else 
					$_l_Height:=350
					WS_AutoscreenSize(2; 350; $_l_TotalWidth)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
				
			End if 
		Else 
			COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
			ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
			ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
			
			$_l_Height:=350
			If ($_l_Height<350)
				WS_AutoscreenSize(2; $_l_Height; $_l_TotalWidth)
			Else 
				$_l_Height:=350
				WS_AutoscreenSize(2; 350; $_l_TotalWidth)
			End if 
			OBJECT SET VISIBLE:C603(*; "oCustomFields@"; False:C215)
			
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
			DB_MenuAction("Functions"; "Set Functions …"; 4; "")
		End if 
		Sel_LPCurrLay("oCurrencyCode"; "oLayerCode")
		ch1:=0
		ch2:=0
		vTitle2:=Term_FSWT("Fore/Surname")
		INT_SetDialog
		If (SM_l_QueryMode=0)
			$_l_DefaultParameters:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[PURCHASE_ORDERS:57]); <>PER_l_CurrentUserID)
		Else 
			// if we are editing pick up the paramters
			$_l_DefaultParameters:=0
			If (SM_l_QueryMode=2)
				$_l_DefaultParameters:=SM_l_QuerySearchID
			End if 
			
		End if 
		If ($_l_DefaultParameters>0)
			vIDateFOffset:=0
			vIDateTOffset:=0
			vpDateFOffset:=0
			vpDateTOffset:=0
			vRDateFOffset:=0
			vRDateTOffset:=0
			SM_LoadSearchParameters($_l_DefaultParameters)
			If (vIDateFOffset#0)
				Case of 
					: (vIDateFOffset>0)
						vIDateF:=Current date:C33-vIDateFOffset
					: (vIDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; vIDateFOffset; 0)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPurchaseOrderDateT@"; True:C214)
			End if 
			If (vIDateTOffset#0)
				Case of 
					: (vIDateTOffset>0)
						vIDateF:=Current date:C33-vIDateTOffset
					: (vIDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; vIDateTOffset; 0)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPurchaseOrderDateT@"; True:C214)
			End if 
			
			If (vPDateFOffset#0)
				Case of 
					: (vPDateFOffset>0)
						vPDateF:=Current date:C33-vPDateFOffset
					: (vPDateFOffset>-100)
						//months
						vPDateF:=Add to date:C393(Current date:C33; 0; vPDateFOffset; 0)
					Else 
						//years
						vPDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; True:C214)
			End if 
			If (vPDateTOffset#0)
				Case of 
					: (vPDateTOffset>0)
						vPDateF:=Current date:C33-vPDateTOffset
					: (vPDateTOffset>-100)
						//months
						vPDateT:=Add to date:C393(Current date:C33; 0; vPDateTOffset; 0)
					Else 
						//years
						vPDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; True:C214)
			End if 
			
			If (vRDateFOffset#0)
				Case of 
					: (vRDateFOffset>0)
						vRDateF:=Current date:C33-vRDateFOffset
					: (vRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; vRDateFOffset; 0)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateFOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
			End if 
			If (vRDateTOffset#0)
				Case of 
					: (vRDateTOffset>0)
						vRDateF:=Current date:C33-vRDateTOffset
					: (vRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; vRDateTOffset; 0)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateTOffset)/100); 0; 0)
				End case 
				OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
			End if 
			
		End if 
		If (SM_l_QueryMode=2)  // edit
			OBJECT SET VISIBLE:C603(PO_at_TabChoices; False:C215)
			OBJECT SET VISIBLE:C603(RHold; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSMFindOtherLabel"; False:C215)
		End if 
		rHold:=0
		ARRAY BOOLEAN:C223(PO_abo_Include; 0)
		ARRAY BOOLEAN:C223(PO_abo_Include; Size of array:C274(MOD_al_ModuleAccessStatus))
		For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
			PO_abo_Include{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
		End for 
		
		
		LB_SetupListbox(->PO_LB_States; "oRS"; "RS_L"; 1; ->PO_abo_Include; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus)
		
		
		LB_SetColumnHeaders(->PO_LB_States; "RS_L"; 1; "Include"; "Name")
		
		
		LB_SetColumnWidths(->PO_LB_States; "oABR"; 1; 20; 80; 0)
		
		LB_SetEnterable(->PO_LB_States; False:C215; 0)
		LB_SetEnterable(->PO_LB_States; True:C214; 1)
		
		If ((Size of array:C274(SYS_at_RecordStateNames)*16)>66)
			LB_SetScroll(->PO_LB_States; -3; -2)
		Else 
			LB_SetScroll(->PO_LB_States; -3; -3)
		End if 
		LB_StyleSettings(->PO_LB_States; "Black"; 9; "STK_t"; ->[PURCHASE_ORDERS:57])
		
		
		
	: ($_l_event=On Data Change:K2:15)
		
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->VIDATEF))
				If (VIDateF>!00-00-00!)
					If (SRCH_bo_VIDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VIDateF>VIDateT) & (VIDateT>!00-00-00!)
						VIDateT:=VIDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPurchaseOrderDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VIDATET))
				If (VIDateT>!00-00-00!)
					If (VIDateT<VIDateF)
						VIDateF:=VIDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VPDATEF))
				If (VPDateF>!00-00-00!)
					If (SRCH_bo_VPDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VPDateF>VPDateT) & (VPDateT>!00-00-00!)
						VPDateT:=VPDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VPDATET))
				If (VPDateT>!00-00-00!)
					If (VPDateT<VPDateF)
						VPDateF:=VPDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRDATEF))
				If (VRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VRDateF>VRDateT) & (VRDateT>!00-00-00!)
						VRDateT:=VRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRDATET))
				If (VRDateT>!00-00-00!)
					If (VRDateT<VRDateF)
						VRDateF:=VRDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vInvF))
				If (VINF>0)
					If (VINVT<VINF) & (VINVT>0)
						VInvT:=VInvF
					End if 
					OBJECT SET VISIBLE:C603(*; "oTotalCostT"; True:C214)
				End if 
				
		End case 
		
	: ($_l_event=On Clicked:K2:4)
		
		$_ptr_FocusObject:=Focus object:C278
		Case of 
			: ($_ptr_FocusObject=(->VIDATEF))
				If (VIDateF>!00-00-00!)
					If (SRCH_bo_VIDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VIDateF>VIDateT) & (VIDateT>!00-00-00!)
						VIDateT:=VIDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPurchaseOrderDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VIDATET))
				If (VIDateT>!00-00-00!)
					If (VIDateT<VIDateF)
						VIDateF:=VIDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VPDATEF))
				If (VPDateF>!00-00-00!)
					If (SRCH_bo_VPDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VPDateF>VPDateT) & (VPDateT>!00-00-00!)
						VPDateT:=VPDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VPDATET))
				If (VPDateT>!00-00-00!)
					If (VPDateT<VPDateF)
						VPDateF:=VPDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->VRDATEF))
				If (VRDateF>!00-00-00!)
					If (SRCH_bo_VRDateToSet=False:C215)
						//SRCH_d_EntryDateTo:=ACC_d_EntryDateFrom
					End if 
					If (VRDateF>VRDateT) & (VRDateT>!00-00-00!)
						VRDateT:=VRDateF
					End if 
					OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End if 
			: ($_ptr_FocusObject=(->VRDATET))
				If (VRDateT>!00-00-00!)
					If (VRDateT<VRDateF)
						VRDateF:=VRDateT
					End if 
				End if 
			: ($_ptr_FocusObject=(->vInvF))
				If (VINF>0)
					If (VINVT<VINF) & (VINVT>0)
						VInvT:=VInvF
					End if 
					OBJECT SET VISIBLE:C603(*; "oTotalCostT"; True:C214)
				End if 
				
		End case 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				ARRAY TEXT:C222($_at_RecordStateNames; 0)
				ARRAY LONGINT:C221($_al_ModuleAccessStatus; 0)
				
				$_t_CompanyCode:=VCompCode
				$_t_CompanyName:=VCompName
				$_t_ContactCode:=vContCode
				$_t_Forename:=VforeName
				$_t_Surname:=Vsurname
				$_t_PurchaseCode:=VPurchCode
				$_t_PurchaseInvoiceNo:=VPurchInvNo
				$_t_OrderNo:=VorderNo
				$_t_CompanyNameC:=VCOmpNameC
				$_d_lDateF:=ViDateF
				$_d_lDateT:=ViDateT
				$_d_PDateF:=VPDateF
				$_d_PDateT:=VPDateT
				$_d_RDateF:=VRDateF
				$_d_RDateT:=VRDateT
				$_r_InvF:=$_r_InvF
				$_r_InvT:=$_r_InvT
				$_t_ProductCode:=VProdCode
				$_t_AnalysisCode:=VAnalysis
				$_t_CurrencyCode:=ACC_t_CurrencyCode
				$_t_LayerCode:=VLayer
				$_t_EventCode:=VEvent
				COPY ARRAY:C226(SYS_at_RecordStateNames; $_at_RecordStateNames)
				COPY ARRAY:C226(MOD_al_ModuleAccessStatus; $_al_ModuleAccessStatus)
				$_t_ContactName:=VcontactName
				$_l_CHO:=CH0
				$_l_CH1:=CH1
				$_l_RO:=R0
				$_l_R1:=R1
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_IDateFOffset:=vIDateFOffset
				$_l_IDateTOffset:=vIDateTOffset
				$_l_PDateFOffset:=vpDateFOffset
				$_l_PDateTOffset:=vpDateTOffset
				$_l_RDateFOffset:=vRDateFOffset
				$_l_RDateTOffset:=vRDateTOffset
				If (SM_l_QueryMode=0)
					$_l_OK:=PurchOrd_SelLP
				Else 
					$_l_QueryMode:=SM_l_QueryMode
					//note that the arrays below are declared in the method Comp_SelP
					$_l_OK:=PurchOrd_SelLP(-1; SM_l_QueryMode; Table:C252(->[PURCHASE_ORDERS:57]); ->SM_al_SearchIds; ->SM_al_SearchIDsReturn)
					SM_l_QueryMode:=$_l_QueryMode
				End if 
				SET MENU BAR:C67(51)
				
				SM_LoadSearchParameterNames(Table:C252(->[PURCHASE_ORDERS:57]); SM_l_QueryMode)
				
				vCompCode:=$_t_CompanyCode
				vCompName:=$_t_CompanyName
				vCOntCode:=$_t_ContactCode
				vForename:=$_t_Forename
				vSurname:=$_t_Surname
				vPurchCode:=$_t_PurchaseCode
				vPurchInvNo:=$_t_PurchaseInvoiceNo
				vOrderNo:=$_t_OrderNo
				vCompNameC:=$_t_CompanyNameC
				viDateF:=$_d_lDateF
				viDateT:=$_d_lDateT
				vPDateF:=$_d_PDateF
				vPDateT:=$_d_PDateT
				vRDateF:=$_d_RDateF
				vRDateT:=$_d_RDateT
				vinvF:=$_r_InvF
				vInvT:=$_r_InvT
				vProdCode:=$_t_ProductCode
				vAnalysis:=$_t_AnalysisCode
				ACC_t_CurrencyCode:=$_t_CurrencyCode
				vLayer:=$_t_LayerCode
				VEvent:=$_t_EventCode
				VcontactName:=$_t_ContactName
				CH0:=$_l_CHO
				CH1:=$_l_CH1
				R0:=$_l_RO
				R1:=$_l_R1
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				vIDateFOffset:=$_l_IDateFOffset
				vIDateTOffset:=$_l_IDateTOffset
				vpDateFOffset:=$_l_PDateFOffset
				vpDateTOffset:=$_l_PDateTOffset
				vRDateFOffset:=$_l_RDateFOffset
				vRDateTOffset:=$_l_RDateTOffset
				COPY ARRAY:C226($_at_RecordStateNames; SYS_at_RecordStateNames)
				COPY ARRAY:C226($_al_ModuleAccessStatus; MOD_al_ModuleAccessStatus)
				
				If ($_l_OK>0) & (Not:C34(rHold=1))
					
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				Else 
					
					
				End if 
				rHold:=0
				
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dPurchOrd_Sel"; $_t_oldMethodName)
