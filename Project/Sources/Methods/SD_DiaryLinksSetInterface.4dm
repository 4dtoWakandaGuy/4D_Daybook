//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryLinksSetInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryContRelations;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryCoRelations;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryInvoiceRelations;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryOrderRelations;0)
	//ARRAY BOOLEAN(SD2_lb_DiaryPurchOrdRelations;0)
	//ARRAY LONGINT(SD2_al_RelatedCompanyIDs;0)
	//ARRAY LONGINT(SD2_al_relatedContactID;0)
	//ARRAY LONGINT(SD2_al_RelatedInvoiceIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedOrderIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedPurchorderIDs;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_RelatedcallCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyNames;0)
	//ARRAY TEXT(SD2_at_RelatedContactName;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedcostingJobCodes;0)
	//ARRAY TEXT(SD2_at_RelatedInvoiceCodes;0)
	//ARRAY TEXT(SD2_at_RelatedOrderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedOrderNames;0)
	//ARRAY TEXT(SD2_at_RelatedPICodes;0)
	//ARRAY TEXT(SD2_at_RelatedProductCodes;0)
	//ARRAY TEXT(SD2_at_RelatedPurchorderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedStageCodes;0)
	//ARRAY TEXT(SD2_at_RelatedstockCodes;0)
	C_BOOLEAN:C305($_bo_CheckRestrictions; SD2_bo_RandomEffect; SD2_bo_setuplinkslistboxes)
	C_LONGINT:C283($_l_CountCalls; $_l_CountCompanies; $_l_CountContacts; $_l_CountCostingJobs; $_l_CountInvoices; $_l_CountOrders; $_l_CountProducts; $_l_CountPurchaseInvoices; $_l_CountPurchaseOrders; $_l_CountStages; $_l_CountStocks)
	C_LONGINT:C283($_l_ListboxHeight; $_l_MaxRelations; $_l_NextObjectTop; $_l_ObjectBottom; $_l_objectGap; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_TableRow; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SD2_l_HideAgencyJobs; SD2_l_HideCalls; SD2_l_HideCompanies; SD2_l_HideContacts; SD2_l_HidecostingJobs; SD2_l_Hideevents; SD2_l_HideInvoices; SD2_l_HideOrders)
	C_LONGINT:C283(SD2_l_HidePIs; SD2_l_HideProducts; SD2_l_HidePurchorders; SD2_l_HideStages; SD2_l_Hidestocks; SDco_l_BUT1; SDco_l_But2; SDco_l_BUT3; SDco_l_BUT4; SDco_l_BUT5; SDco_l_BUT6)
	C_LONGINT:C283(SDco_l_BUT7; SDco_l_BUT8; SDco_l_BUT9; SDCon_l_BUT1; SDCon_l_But2; SDCon_l_BUT3; SDCon_l_BUT4; SDCon_l_BUT5; SDCon_l_BUT6; SDCon_l_BUT7; SDCon_l_BUT8)
	C_LONGINT:C283(SDCon_l_BUT9; SDInv_l_BUT1; SDInv_l_But2; SDInv_l_BUT3; SDInv_l_BUT4; SDInv_l_BUT5; SDInv_l_BUT6; SDInv_l_BUT7; SDInv_l_BUT8; SDInv_l_BUT9; SDOrd_l_BUT1)
	C_LONGINT:C283(SDOrd_l_But2; SDOrd_l_BUT3; SDOrd_l_BUT4; SDOrd_l_BUT5; SDOrd_l_BUT6; SDOrd_l_BUT7; SDOrd_l_BUT8; SDOrd_l_BUT9; SDPo_l_BUT1; SDPo_l_But2; SDPo_l_BUT3)
	C_LONGINT:C283(SDPo_l_BUT4; SDPo_l_BUT5; SDPo_l_BUT6; SDPo_l_BUT7; SDPo_l_BUT8; SDPo_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_t_CompanyName; SD2_S255_ContactName; SD2_S255_orderName; SDco_t_COL1; SDco_t_COL2; SDco_t_COL3; SDco_t_COL4; SDco_t_COL5; SDco_t_COL6; SDco_t_COL7)
	C_TEXT:C284(SDco_t_COL8; SDco_t_COL9; SDco_t_HED1; SDco_t_HED2; SDco_t_HED3; SDco_t_HED4; SDco_t_HED5; SDco_t_HED6; SDco_t_HED7; SDco_t_HED8; SDco_t_HED9)
	C_TEXT:C284(SDCON_t_COL1; SDCON_t_COL2; SDCON_t_COL3; SDCON_t_COL4; SDCON_t_COL5; SDCON_t_COL6; SDCON_t_COL7; SDCON_t_COL8; SDCON_t_COL9; SDCON_t_HED1; SDCON_t_HED2)
	C_TEXT:C284(SDCON_t_HED3; SDCON_t_HED4; SDCON_t_HED5; SDCON_t_HED6; SDCON_t_HED7; SDCON_t_HED8; SDCON_t_HED9; SDInv_t_COL1; SDInv_t_COL2; SDInv_t_COL3; SDInv_t_COL4)
	C_TEXT:C284(SDInv_t_COL5; SDInv_t_COL6; SDInv_t_COL7; SDInv_t_COL8; SDInv_t_COL9; SDInv_t_HED1; SDInv_t_HED2; SDInv_t_HED3; SDInv_t_HED4; SDInv_t_HED5; SDInv_t_HED6)
	C_TEXT:C284(SDInv_t_HED7; SDInv_t_HED8; SDInv_t_HED9; SDOrd_t_COL1; SDOrd_t_COL2; SDOrd_t_COL3; SDOrd_t_COL4; SDOrd_t_COL5; SDOrd_t_COL6; SDOrd_t_COL7; SDOrd_t_COL8)
	C_TEXT:C284(SDOrd_t_COL9; SDOrd_t_HED1; SDOrd_t_HED2; SDOrd_t_HED3; SDOrd_t_HED4; SDOrd_t_HED5; SDOrd_t_HED6; SDOrd_t_HED7; SDOrd_t_HED8; SDOrd_t_HED9; SDPo_t_COL1)
	C_TEXT:C284(SDPo_t_COL2; SDPo_t_COL3; SDPo_t_COL4; SDPo_t_COL5; SDPo_t_COL6; SDPo_t_COL7; SDPo_t_COL8; SDPo_t_COL9; SDPo_t_HED1; SDPo_t_HED2; SDPo_t_HED3)
	C_TEXT:C284(SDPo_t_HED4; SDPo_t_HED5; SDPo_t_HED6; SDPo_t_HED7; SDPo_t_HED8; SDPo_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryLinksSetInterface")

If (SD2_bo_RandomEffect)
	SD2_RandomSizing
End if 
If (Not:C34(SD2_bo_setuplinkslistboxes))
	
	//Companies-Do these regardless of whether they are visible
	LB_SetupListbox(->SD2_lb_DiaryCoRelations; "SDco_t"; "SDCo_L"; 1; ->SD2_at_RelatedCompanyCodes; ->SD2_at_RelatedCompanyNames; ->SD2_al_RelatedCompanyIDs)
	LB_SetColumnHeaders(->SD2_lb_DiaryCoRelations; "SDCo_L"; 1; "Code"; "Name"; "")
	LB_SetColumnWidths(->SD2_lb_DiaryCoRelations; "SDco_t"; 1; 80; 95; 0)
	LB_SetEnterable(->SD2_lb_DiaryCoRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryCoRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryCoRelations; "Black"; 9; "SDco_t"; ->[DIARY:12])
	If (Size of array:C274(SD2_at_RelatedCompanyCodes)=1)
		SD2_t_CompanyName:=SD2_at_RelatedCompanyNames{1}
	End if 
	
	//``
	LB_SetupListbox(->SD2_lb_DiaryContRelations; "SDCON_t"; "SDCon_L"; 1; ->SD2_at_RelatedContactsCodes; ->SD2_at_RelatedContactName; ->SD2_al_relatedContactID)
	LB_SetColumnHeaders(->SD2_lb_DiaryContRelations; "SDCon_L"; 1; "Code"; "Name")
	LB_SetColumnWidths(->SD2_lb_DiaryContRelations; "SDCON_t"; 1; 80; 95)
	LB_SetEnterable(->SD2_lb_DiaryContRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryContRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryContRelations; "Black"; 9; "SDCON_t"; ->[DIARY:12])
	If (Size of array:C274(SD2_at_RelatedContactName)=1)
		SD2_S255_ContactName:=SD2_at_RelatedContactName{1}
	End if 
	//``
	
	//``
	LB_SetupListbox(->SD2_lb_DiaryOrderRelations; "SDOrd_t"; "SDOrd_L"; 1; ->SD2_at_RelatedOrderCodes; ->SD2_at_RelatedOrderNames; ->SD2_al_RelatedOrderIDs)
	LB_SetColumnHeaders(->SD2_lb_DiaryOrderRelations; "SDOrd_L"; 1; "Code"; "Name"; "")
	
	LB_SetColumnWidths(->SD2_lb_DiaryOrderRelations; "SDOrd_t"; 1; 80; 95; 0)
	LB_SetEnterable(->SD2_lb_DiaryOrderRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryOrderRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryOrderRelations; "Black"; 9; "SDOrd_t"; ->[DIARY:12])
	If (Size of array:C274(SD2_at_RelatedOrderNames)=1)
		SD2_S255_orderName:=SD2_at_RelatedOrderNames{1}
	End if 
	//```
	
	//``
	LB_SetupListbox(->SD2_lb_DiaryInvoiceRelations; "SDInv_t"; "SDInv_L"; 1; ->SD2_at_RelatedInvoiceCodes; ->SD2_al_RelatedInvoiceIDs)
	LB_SetColumnHeaders(->SD2_lb_DiaryInvoiceRelations; "SDInv_L"; 1; "Code"; "")
	LB_SetColumnWidths(->SD2_lb_DiaryInvoiceRelations; "SDInv_t"; 1; 180; 0)
	LB_SetEnterable(->SD2_lb_DiaryInvoiceRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryInvoiceRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryInvoiceRelations; "Black"; 9; "SDInv_t"; ->[DIARY:12])
	
	
	
	//``
	LB_SetupListbox(->SD2_lb_DiaryPurchOrdRelations; "SDPo_t"; "SDPo_L"; 1; ->SD2_at_RelatedPurchorderCodes; ->SD2_al_RelatedPurchorderIDs)
	LB_SetColumnHeaders(->SD2_lb_DiaryPurchOrdRelations; "SDPo_L"; 1; "Code"; "")
	LB_SetColumnWidths(->SD2_lb_DiaryPurchOrdRelations; "SDPo_t"; 1; 180; 0)
	LB_SetEnterable(->SD2_lb_DiaryPurchOrdRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryPurchOrdRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryPurchOrdRelations; "Black"; 9; "SDPo_t"; ->[DIARY:12])
	
	//``
	
	//``
	LB_SetupListbox(->SD2_lb_DiaryPurchOrdRelations; "SDPo_t"; "SDPo_L"; 1; ->SD2_at_RelatedPurchorderCodes; ->SD2_al_RelatedPurchorderIDs)
	LB_SetColumnHeaders(->SD2_lb_DiaryPurchOrdRelations; "SDPo_L"; 1; "Code"; "")
	LB_SetColumnWidths(->SD2_lb_DiaryPurchOrdRelations; "SDPo_t"; 1; 180; 0)
	LB_SetEnterable(->SD2_lb_DiaryPurchOrdRelations; False:C215; 0)
	LB_SetScroll(->SD2_lb_DiaryPurchOrdRelations; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryPurchOrdRelations; "Black"; 9; "SDPo_t"; ->[DIARY:12])
	
	
	
	SD2_bo_setuplinkslistboxes:=True:C214
End if 
$_l_objectGap:=10
$_l_NextObjectTop:=15  //Start of next object
$_bo_CheckRestrictions:=False:C215
If (Size of array:C274(SD2_al_RelationTypesS)>0)  //This array is set up in SD2_loadDiary
	$_bo_CheckRestrictions:=True:C214
End if 
//Note that restrictions only apply to MULTIPLE relations..a non included restriction can still have one record related
If (SD2_l_HideCompanies=0)  //Send a 1 into the form to hide companies from the mix
	If (DB_GetModuleSettingByNUM(Module_Companies)>1)
		OBJECT SET VISIBLE:C603(*; "oCompanyLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "oCompanyLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oCompanyLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountCompanies:=Size of array:C274(SD2_at_RelatedCompanyNames)  //this array is set up in SD2_LoadDiary
		If ($_l_CountCompanies<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryCompanies"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveCoRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCompanyCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oCompanyCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oCompanyCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oCompanyName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountCompanies=0)
				OBJECT SET VISIBLE:C603(*; "oAddCompany"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddCompany"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddCompany"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddCompany"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountCompanies*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryCompanies"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryCompanies"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryCompanies"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddCompany"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddCompany"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddCompany"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveCoRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveCoRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveCoRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oCompanyCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[COMPANIES:2]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountCompanies>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddCompany"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "oCompanyLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryCompanies"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddCompany"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveCoRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "oCompanyLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryCompanies"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCompanyCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddCompany"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveCoRelation"; False:C215)
End if 
//```
If (SD2_l_HideContacts=0)  //Send a 1 into the form to hide contacts from the mix
	If (DB_GetModuleSettingByNUM(Module_Companies)>1)
		OBJECT SET VISIBLE:C603(*; "oContactsLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "oContactsLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oContactsLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountContacts:=Size of array:C274(SD2_at_RelatedContactsCodes)  //this array is set up in SD2_LoadDiary
		If ($_l_CountContacts<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryContacts"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveContRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oContactCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oContactCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "oContactName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oContactName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oContactName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountContacts=0)
				OBJECT SET VISIBLE:C603(*; "oAddContacts"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddContacts"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddContacts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddContacts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountContacts*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryContacts"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryContacts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryContacts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddContacts"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddContacts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddContacts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveContRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveContRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveContRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oContactCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[CONTACTS:1]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountContacts>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddContacts"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "oContactsLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryContacts"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oContactName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oContactCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddContacts"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveContRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OContactsLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryContacts"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContactName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oContactCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddContacts"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveContRelation"; False:C215)
End if 

If (SD2_l_HideOrders=0)  //Send a 1 into the form to hide Orders from the mix
	If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
		OBJECT SET VISIBLE:C603(*; "OOrderLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OOrderLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OOrderLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountOrders:=Size of array:C274(SD2_at_RelatedOrderCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountOrders<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryOrders"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveOrderRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oOrderCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oOrderCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "oOrderName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oOrderName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oOrderName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountOrders=0)
				OBJECT SET VISIBLE:C603(*; "oAddOrders"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddOrders"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddOrders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddOrders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
			
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountOrders*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryOrders"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryOrders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryOrders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddOrders"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddOrders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddOrders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveOrderRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveOrderRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveOrderRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[ORDERS:24]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountOrders>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddOrders"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OOrderLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryOrders"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oOrderName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddOrders"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveOrderRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OOrderLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryOrders"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oOrderName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddOrders"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveOrderRelation"; False:C215)
End if 
If (SD2_l_HideInvoices=0)  //Send a 1 into the form to hide Invoices from the mix
	If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
		OBJECT SET VISIBLE:C603(*; "OInvoiceLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OInvoiceLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OInvoiceLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountInvoices:=Size of array:C274(SD2_at_RelatedInvoiceCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountInvoices<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryInvoices"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveInvoiceRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInvoiceCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oInvoiceCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oInvoiceCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			//SET VISIBLE(*;"oInvoiceName";True)
			//GET OBJECT RECT(*;"oInvoiceName";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//MOVE OBJECT(*;"oInvoiceName";$_l_ObjectLeft;$_l_NextObjectTop;$_l_ObjectRight;$_l_NextObjectTop+$_l_ObjectHeight;*)
			If ($_l_CountInvoices=0)
				OBJECT SET VISIBLE:C603(*; "oAddInvoices"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddInvoices"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddInvoices"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddInvoices"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountInvoices*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryInvoices"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryInvoices"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryInvoices"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddInvoices"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddInvoices"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddInvoices"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveInvoiceRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveInvoiceRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveInvoiceRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oInvoiceCodeField"; False:C215)
			//SET VISIBLE(*;"oInvoiceName";False)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[INVOICES:39]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountInvoices>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddInvoices"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OInvoiceLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryInvoices"; False:C215)
		//SET VISIBLE(*;"oInvoiceName";False)
		OBJECT SET VISIBLE:C603(*; "oInvoiceCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddInvoices"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveInvoiceRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OInvoiceLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryInvoices"; False:C215)
	//SET VISIBLE(*;"oInvoiceName";False)
	OBJECT SET VISIBLE:C603(*; "oInvoiceCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddInvoices"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveInvoiceRelation"; False:C215)
End if 
If (SD2_l_HidePurchorders=0)  //Send a 1 into the form to hide Purchorders from the mix
	If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
		OBJECT SET VISIBLE:C603(*; "OPurchorderLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OPurchorderLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OPurchorderLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountPurchaseOrders:=Size of array:C274(SD2_at_RelatedPurchorderCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountPurchaseOrders<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryPurchorders"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemovePurchorderRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPurchorderCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oPurchorderCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oPurchorderCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			//SET VISIBLE(*;"oPurchorderName";True)
			//GET OBJECT RECT(*;"oPurchorderName";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//MOVE OBJECT(*;"oPurchorderName";$_l_ObjectLeft;$_l_NextObjectTop;$_l_ObjectRight;$_l_NextObjectTop+$_l_ObjectHeight;*)
			If ($_l_CountPurchaseOrders=0)
				OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddPurchorders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddPurchorders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountPurchaseOrders*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryPurchorders"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryPurchorders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryPurchorders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddPurchorders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddPurchorders"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemovePurchorderRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemovePurchorderRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemovePurchorderRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oPurchorderCodeField"; False:C215)
			//SET VISIBLE(*;"oPurchorderName";False)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PURCHASE_ORDERS:57]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountPurchaseOrders>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OPurchorderLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryPurchorders"; False:C215)
		//SET VISIBLE(*;"oPurchorderName";False)
		OBJECT SET VISIBLE:C603(*; "oPurchorderCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemovePurchorderRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OPurchorderLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryPurchorders"; False:C215)
	//SET VISIBLE(*;"oPurchorderName";False)
	OBJECT SET VISIBLE:C603(*; "oPurchorderCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddPurchorders"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemovePurchorderRelation"; False:C215)
End if 
If (SD2_l_HidePIs=0)  //Send a 1 into the form to hide PIs from the mix
	If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1)
		OBJECT SET VISIBLE:C603(*; "OPILabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OPILabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OPILabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountPurchaseInvoices:=Size of array:C274(SD2_at_RelatedPICodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountPurchaseInvoices<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryPIs"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemovePIRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPICodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oPICodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oPICodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			//SET VISIBLE(*;"oPIName";True)
			//GET OBJECT RECT(*;"oPIName";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//MOVE OBJECT(*;"oPIName";$_l_ObjectLeft;$_l_NextObjectTop;$_l_ObjectRight;$_l_NextObjectTop+$_l_ObjectHeight;*)
			If ($_l_CountPurchaseInvoices=0)
				OBJECT SET VISIBLE:C603(*; "oAddPIs"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddPIs"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddPIs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddPIs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountPurchaseInvoices*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryPIs"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryPIs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryPIs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddPIs"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddPIs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddPIs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemovePIRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemovePIRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemovePIRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oPICodeField"; False:C215)
			//SET VISIBLE(*;"oPIName";False)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PURCHASE_ORDERS:57]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountPurchaseInvoices>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddPIs"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OPILabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryPIs"; False:C215)
		//SET VISIBLE(*;"oPIName";False)
		OBJECT SET VISIBLE:C603(*; "oPICodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddPIs"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemovePIRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OPILabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryPIs"; False:C215)
	//SET VISIBLE(*;"oPIName";False)
	OBJECT SET VISIBLE:C603(*; "oPICodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddPIs"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemovePIRelation"; False:C215)
End if 
//Note : Althought there is a field for JOB CODE> The Agency and Job costing will use a variable to display the job code..`this is because the Job is either agency or JC
//if both are displayed it should only appear in the correct one..multiples are split as well

//Whats this--- JOBS twice...note that this one uses a variable to display the job code...
If (SD2_l_HidecostingJobs=0)  //Send a 1 into the form to hide costingJob Jobs from the mix
	If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
		OBJECT SET VISIBLE:C603(*; "OcostingJobLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OcostingJobLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OcostingJobLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountCostingJobs:=Size of array:C274(SD2_at_RelatedcostingJobCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountCostingJobs<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiarycostingJobs"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemovecostingJobRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ocostingJobCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "ocostingJobCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "ocostingJobCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "ocostingJobName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "ocostingJobName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "ocostingJobName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountCostingJobs=0)
				OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddcostingJobs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddcostingJobs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountCostingJobs*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiarycostingJobs"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiarycostingJobs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiarycostingJobs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddcostingJobs"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddcostingJobs"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemovecostingJobRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemovecostingJobRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemovecostingJobRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "ocostingJobCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ocostingJobName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[JOBS:26]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountCostingJobs>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OcostingJobLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiarycostingJobs"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ocostingJobName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ocostingJobCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemovecostingJobRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OcostingJobLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiarycostingJobs"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocostingJobName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocostingJobCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddcostingJobs"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemovecostingJobRelation"; False:C215)
End if 


If (SD2_l_HideStages=0)  //Send a 1 into the form to hide Stage Jobs from the mix
	If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
		OBJECT SET VISIBLE:C603(*; "OStageLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OStageLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OStageLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountStages:=Size of array:C274(SD2_at_RelatedStageCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountStages<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryStages"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveStageRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oStageCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oStageCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oStageCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "oStageName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oStageName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oStageName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountStages=0)
				OBJECT SET VISIBLE:C603(*; "oAddStages"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddStages"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddStages"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddStages"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountStages*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryStages"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryStages"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryStages"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddStages"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddStages"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddStages"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveStageRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveStageRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveStageRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oStageCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oStageName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[JOB_STAGES:47]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountStages>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddStages"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OStageLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryStages"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStageName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStageCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddStages"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveStageRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OStageLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryStages"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStageName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStageCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddStages"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveStageRelation"; False:C215)
End if 


If (SD2_l_HideCalls=0)  //Send a 1 into the form to hide call Jobs from the mix
	If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
		OBJECT SET VISIBLE:C603(*; "OcallLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OcallLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OcallLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountCalls:=Size of array:C274(SD2_at_RelatedcallCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountCalls<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiarycalls"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemovecallRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ocallCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "ocallCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "ocallCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "ocallName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "ocallName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "ocallName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountCalls=0)
				OBJECT SET VISIBLE:C603(*; "oAddcalls"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddcalls"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddcalls"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddcalls"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountCalls*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiarycalls"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiarycalls"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiarycalls"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddcalls"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddcalls"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddcalls"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemovecallRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemovecallRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemovecallRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "ocallCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ocallName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[SERVICE_CALLS:20]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountCalls>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddcalls"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OcallLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiarycalls"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ocallName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ocallCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddcalls"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemovecallRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OcallLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiarycalls"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocallName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "ocallCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddcalls"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemovecallRelation"; False:C215)
End if 
If (SD2_l_Hidestocks=0)  //Send a 1 into the form to hide stock Jobs from the mix
	If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
		OBJECT SET VISIBLE:C603(*; "OstockLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OstockLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OstockLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountStocks:=Size of array:C274(SD2_at_RelatedstockCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountStocks<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiarystocks"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemovestockRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ostockCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "ostockCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "ostockCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			//SET VISIBLE(*;"ostockName";True)
			//GET OBJECT RECT(*;"ostockName";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//MOVE OBJECT(*;"ostockName";$_l_ObjectLeft;$_l_NextObjectTop;$_l_ObjectRight;$_l_NextObjectTop+$_l_ObjectHeight;*)
			If ($_l_CountStocks=0)
				OBJECT SET VISIBLE:C603(*; "oAddstocks"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddstocks"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddstocks"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddstocks"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountStocks*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiarystocks"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiarystocks"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiarystocks"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddstocks"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddstocks"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddstocks"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemovestockRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemovestockRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemovestockRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "ostockCodeField"; False:C215)
			//SET VISIBLE(*;"ostockName";False)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[STOCK_MOVEMENTS:40]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountStocks>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddstocks"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OstockLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiarystocks"; False:C215)
		//SET VISIBLE(*;"ostockName";False)
		OBJECT SET VISIBLE:C603(*; "ostockCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddstocks"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemovestockRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OstockLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiarystocks"; False:C215)
	//SET VISIBLE(*;"ostockName";False)
	OBJECT SET VISIBLE:C603(*; "ostockCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddstocks"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemovestockRelation"; False:C215)
End if 


If (SD2_l_HideProducts=0)  //Send a 1 into the form to hide Product Jobs from the mix
	If (DB_GetModuleSettingByNUM(Module_Products)>1)
		OBJECT SET VISIBLE:C603(*; "OProductLabel"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OProductLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "OProductLabel"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
		
		$_l_CountProducts:=Size of array:C274(SD2_at_RelatedProductCodes)  //this array is set up in LOAD phase of the SD2_DiaryLinks Form
		If ($_l_CountProducts<2)
			OBJECT SET VISIBLE:C603(*; "oLBDiaryProducts"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemoveProductRelation"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oProductCodeField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oProductCodeField"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oProductName"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oProductName"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			If ($_l_CountProducts=0)
				OBJECT SET VISIBLE:C603(*; "oAddProducts"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAddProducts"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oAddProducts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oAddProducts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			End if 
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap
		Else 
			//More than one company
			$_l_ListboxHeight:=($_l_CountProducts*12)+12
			Case of 
				: ($_l_ListboxHeight<50)
					$_l_ListboxHeight:=50
				: ($_l_ListboxHeight>100)
					$_l_ListboxHeight:=100
			End case 
			OBJECT SET VISIBLE:C603(*; "oLBDiaryProducts"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBDiaryProducts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oLBDiaryProducts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ListboxHeight; *)
			OBJECT SET VISIBLE:C603(*; "oAddProducts"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oAddProducts"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(*; "oAddProducts"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oRemoveProductRelation"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oRemoveProductRelation"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			//remember this sits under the other button.
			OBJECT MOVE:C664(*; "oRemoveProductRelation"; $_l_ObjectLeft; $_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
			
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductName"; False:C215)
			$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ListboxHeight+$_l_objectGap
		End if 
		//`Here test if the max cos reached and hide the Plus button if it is-above code showed it
		If ($_bo_CheckRestrictions)
			$_l_TableRow:=Find in array:C230(SD2_al_RelationTablesS; Table:C252(->[PRODUCTS:9]))
			If ($_l_TableRow>0)
				$_l_MaxRelations:=SD2_al_RelationRestS{$_l_TableRow}
				If ($_l_CountProducts>=$_l_MaxRelations)
					OBJECT SET VISIBLE:C603(*; "oAddProducts"; False:C215)
				End if 
			End if 
		End if 
	Else 
		//Use may not see company info
		OBJECT SET VISIBLE:C603(*; "OProductLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBDiaryProducts"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oProductName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oProductCodeField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddProducts"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRemoveProductRelation"; False:C215)
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "OProductLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLBDiaryProducts"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oProductName"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oProductCodeField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAddProducts"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oRemoveProductRelation"; False:C215)
End if 
OBJECT GET COORDINATES:C663(*; "oExitButton"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
OBJECT MOVE:C664(*; "oExitButton"; $_l_ObjectLeft; $_l_NextObjectTop; $_l_ObjectRight; $_l_NextObjectTop+$_l_ObjectHeight; *)
$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight+$_l_objectGap

GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)

SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowTop+$_l_NextObjectTop)
ERR_MethodTrackerReturn("SD_DiaryLinksSetInterface"; $_t_oldMethodName)
