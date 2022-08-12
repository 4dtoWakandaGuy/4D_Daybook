If (False:C215)
	//Table Form Method Name: Object Name:      [USER].SD2_DiaryLinks
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 19:44
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
	//ARRAY LONGINT(SD2_al_RelatedCaLLIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedCompanyIDs;0)
	//ARRAY LONGINT(SD2_al_relatedContactID;0)
	//ARRAY LONGINT(SD2_al_RelatedcostingJobIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedDocIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedInvoiceIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedOrderIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedPIIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedProductlDs;0)
	//ARRAY LONGINT(SD2_al_RelatedPurchorderIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY LONGINT(SD2_al_RelatedStageIDs;0)
	//ARRAY LONGINT(SD2_al_RelatedStockIDs;0)
	//ARRAY TEXT(SD2_aS255_RelatedProductNames;0)
	//ARRAY TEXT(SD2_at_RelatedcallCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCallNames;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyNames;0)
	//ARRAY TEXT(SD2_at_RelatedContactName;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedcostingJobCodes;0)
	//ARRAY TEXT(SD2_at_RelatedcostinJobNames;0)
	//ARRAY TEXT(SD2_at_RelatedDocCodes;0)
	//ARRAY TEXT(SD2_at_RelatedDocNames;0)
	//ARRAY TEXT(SD2_at_RelatedInvoiceCodes;0)
	//ARRAY TEXT(SD2_at_RelatedOrderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedOrderNames;0)
	//ARRAY TEXT(SD2_at_RelatedPICodes;0)
	//ARRAY TEXT(SD2_at_RelatedProductCodes;0)
	//ARRAY TEXT(SD2_at_RelatedProductNames;0)
	//ARRAY TEXT(SD2_at_RelatedPurchorderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SD2_at_RelatedStageCodes;0)
	//ARRAY TEXT(SD2_at_RelatedStageNames;0)
	//ARRAY TEXT(SD2_at_RelatedstockCodes;0)
	//ARRAY TEXT(SD2_at_RELATEDSTOCKNAMES;0)
	C_BOOLEAN:C305($_bo_Unload; DB_bo_NoLoad; SD2_bo_LinksInited; SD2_bo_RandomEffect)
	C_LONGINT:C283($_l_event; $_l_Index; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9)
	C_LONGINT:C283(SD2_l_HideContacts; SDco_l_BUT1; SDco_l_But2; SDco_l_BUT3; SDco_l_BUT4; SDco_l_BUT5; SDco_l_BUT6; SDco_l_BUT7; SDco_l_BUT8; SDco_l_BUT9; SDCon_l_BUT1)
	C_LONGINT:C283(SDCon_l_But2; SDCon_l_BUT3; SDCon_l_BUT4; SDCon_l_BUT5; SDCon_l_BUT6; SDCon_l_BUT7; SDCon_l_BUT8; SDCon_l_BUT9; SDInv_l_BUT1; SDInv_l_But2; SDInv_l_BUT3)
	C_LONGINT:C283(SDInv_l_BUT4; SDInv_l_BUT5; SDInv_l_BUT6; SDInv_l_BUT7; SDInv_l_BUT8; SDInv_l_BUT9; SDOrd_l_BUT1; SDOrd_l_But2; SDOrd_l_BUT3; SDOrd_l_BUT4; SDOrd_l_BUT5)
	C_LONGINT:C283(SDOrd_l_BUT6; SDOrd_l_BUT7; SDOrd_l_BUT8; SDOrd_l_BUT9; SDPo_l_BUT1; SDPo_l_But2; SDPo_l_BUT3; SDPo_l_BUT4; SDPo_l_BUT5; SDPo_l_BUT6; SDPo_l_BUT7)
	C_LONGINT:C283(SDPo_l_BUT8; SDPo_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_S255_CallName; SD2_t_CompanyName; SD2_S255_ContactName; SD2_S255_CostingJobCode; SD2_S255_costingJobName; SD2_t_InvoiceCode; SD2_S255_orderName; SD2_S255_PIcode; SD2_S255_ProductName; SD2_S255_PurchaseCode)
	C_TEXT:C284(SD2_S255_StageName; SD2_S255_StockCode; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9; SDco_t_COL1; SDco_t_COL2)
	C_TEXT:C284(SDco_t_COL3; SDco_t_COL4; SDco_t_COL5; SDco_t_COL6; SDco_t_COL7; SDco_t_COL8; SDco_t_COL9; SDco_t_HED1; SDco_t_HED2; SDco_t_HED3; SDco_t_HED4)
	C_TEXT:C284(SDco_t_HED5; SDco_t_HED6; SDco_t_HED7; SDco_t_HED8; SDco_t_HED9; SDCON_t_COL1; SDCON_t_COL2; SDCON_t_COL3; SDCON_t_COL4; SDCON_t_COL5; SDCON_t_COL6)
	C_TEXT:C284(SDCON_t_COL7; SDCON_t_COL8; SDCON_t_COL9; SDCON_t_HED1; SDCON_t_HED2; SDCON_t_HED3; SDCON_t_HED4; SDCON_t_HED5; SDCON_t_HED6; SDCON_t_HED7; SDCON_t_HED8)
	C_TEXT:C284(SDCON_t_HED9; SDInv_t_COL1; SDInv_t_COL2; SDInv_t_COL3; SDInv_t_COL4; SDInv_t_COL5; SDInv_t_COL6; SDInv_t_COL7; SDInv_t_COL8; SDInv_t_COL9; SDInv_t_HED1)
	C_TEXT:C284(SDInv_t_HED2; SDInv_t_HED3; SDInv_t_HED4; SDInv_t_HED5; SDInv_t_HED6; SDInv_t_HED7; SDInv_t_HED8; SDInv_t_HED9; SDOrd_t_COL1; SDOrd_t_COL2; SDOrd_t_COL3)
	C_TEXT:C284(SDOrd_t_COL4; SDOrd_t_COL5; SDOrd_t_COL6; SDOrd_t_COL7; SDOrd_t_COL8; SDOrd_t_COL9; SDOrd_t_HED1; SDOrd_t_HED2; SDOrd_t_HED3; SDOrd_t_HED4; SDOrd_t_HED5)
	C_TEXT:C284(SDOrd_t_HED6; SDOrd_t_HED7; SDOrd_t_HED8; SDOrd_t_HED9; SDPo_t_COL1; SDPo_t_COL2; SDPo_t_COL3; SDPo_t_COL4; SDPo_t_COL5; SDPo_t_COL6; SDPo_t_COL7)
	C_TEXT:C284(SDPo_t_COL8; SDPo_t_COL9; SDPo_t_HED1; SDPo_t_HED2; SDPo_t_HED3; SDPo_t_HED4; SDPo_t_HED5; SDPo_t_HED6; SDPo_t_HED7; SDPo_t_HED8; SDPo_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_DiaryLinks"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//```Testing
		SD2_t_InvoiceCode:=""
		SD2_S255_PurchaseCode:=""
		SD2_S255_PIcode:=""
		SD2_S255_CostingJobCode:=""
		SD2_S255_StockCode:=""
		SD2_t_CompanyName:=""
		SD2_S255_ContactName:=""
		SD2_S255_orderName:=""
		SD2_S255_costingJobName:=""
		SD2_S255_StageName:=""
		SD2_S255_CallName:=""
		SD2_S255_ProductName:=""
		
		SD2_bo_RandomEffect:=False:C215
		SD2_l_HideContacts:=1
		
		//ARRAY STRING(55;SD2_at_RelatedProductCodes;0)
		
		If (Not:C34(SD2_bo_LinksInited))
			//These arrays are not set up in SD2_LoadDiary. The Links are in on group of arrays. For this form we want them seperate out... we will maintain the combined array when this form is closed...
			
			//ARRAY STRING(55;SD2_at_RelatedCompanyCodes;0)
			// ARRAY STRING(55;SD2_at_RelatedContactsCodes;0)
			ARRAY TEXT:C222(SD2_at_RelatedOrderCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedOrderNames; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedOrderIDs; 0)
			
			ARRAY TEXT:C222(SD2_at_RelatedDocCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedDocNames; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedDocIDs; 0)
			ARRAY TEXT:C222(SD2_at_RelatedInvoiceCodes; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedInvoiceIDs; 0)
			
			ARRAY TEXT:C222(SD2_at_RelatedcostingJobCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedcostinJobNames; 0)  //Dropped the g from this because of the length
			ARRAY LONGINT:C221(SD2_al_RelatedcostingJobIDs; 0)
			
			ARRAY TEXT:C222(SD2_at_RelatedStageCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedStageNames; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedStageIDs; 0)
			ARRAY TEXT:C222(SD2_at_RelatedPurchorderCodes; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedPurchorderIDs; 0)
			ARRAY TEXT:C222(SD2_at_RelatedPICodes; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedPIIDs; 0)
			ARRAY TEXT:C222(SD2_at_RelatedcallCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedCallNames; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedCaLLIDs; 0)
			ARRAY TEXT:C222(SD2_at_RelatedstockCodes; 0)
			ARRAY TEXT:C222(SD2_at_RELATEDSTOCKNAMES; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedStockIDs; 0)
			
			ARRAY TEXT:C222(SD2_at_RelatedProductCodes; 0)
			ARRAY TEXT:C222(SD2_at_RelatedProductNames; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedProductlDs; 0)
			
			SD2_bo_LinksInited:=True:C214
			For ($_l_Index; 1; Size of array:C274(SD2_al_RelatedRecordTableNum))
				Case of 
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[ORDERS:24]))
						APPEND TO ARRAY:C911(SD2_at_RelatedOrderCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_at_RelatedOrderNames; SD2_at_RelatedRecordName{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedOrderIDs; SD2_al_RelatedRecordID{$_l_Index})
						
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[DOCUMENTS:7]))
						APPEND TO ARRAY:C911(SD2_at_RelatedDocCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_at_RelatedDocNames; SD2_at_RelatedRecordName{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedDocIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911(SD2_at_RelatedInvoiceCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedInvoiceIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOBS:26]))
						$_bo_Unload:=False:C215
						If ([JOBS:26]Job_Code:1#SD2_at_RelatedRecordCode{$_l_Index})
							QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=SD2_at_RelatedRecordCode{$_l_Index})
							
							APPEND TO ARRAY:C911(SD2_at_RelatedcostingJobCodes; SD2_at_RelatedRecordCode{$_l_Index})
							APPEND TO ARRAY:C911(SD2_at_RelatedcostinJobNames; SD2_at_RelatedRecordName{$_l_Index})
							APPEND TO ARRAY:C911(SD2_al_RelatedcostingJobIDs; SD2_al_RelatedRecordID{$_l_Index})
							
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([JOBS:26])
						End if 
						
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOB_STAGES:47]))
						APPEND TO ARRAY:C911(SD2_at_RelatedStageCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_at_RelatedStageNames; SD2_at_RelatedRecordName{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedStageIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57]))
						APPEND TO ARRAY:C911(SD2_at_RelatedPurchorderCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedPurchorderIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37]))
						APPEND TO ARRAY:C911(SD2_at_RelatedPICodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedPIIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
						APPEND TO ARRAY:C911(SD2_at_RelatedCallCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_at_RelatedCallNames; SD2_at_RelatedRecordName{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedCallIDs; SD2_al_RelatedRecordID{$_l_Index})
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
						APPEND TO ARRAY:C911(SD2_at_RelatedStockCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedStockIDs; SD2_al_RelatedRecordID{$_l_Index})
						
					: (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PRODUCTS:9]))
						APPEND TO ARRAY:C911(SD2_at_RelatedProductCodes; SD2_at_RelatedRecordCode{$_l_Index})
						APPEND TO ARRAY:C911(SD2_at_RelatedProductNames; SD2_at_RelatedRecordName{$_l_Index})
						APPEND TO ARRAY:C911(SD2_al_RelatedProductlDs; SD2_al_RelatedRecordID{$_l_Index})
					Else 
						//ERROR
				End case 
			End for 
			SD2_bo_LinksInited:=True:C214
			
			
		End if 
		//``
		
		//Companies-Do these regardless of whether they are visible
		LB_SetupListbox(->SD2_lb_DiaryCoRelations; "SDco_t"; "SDCo_L"; 1; ->SD2_at_RelatedCompanyCodes; ->SD2_at_RelatedCompanyNames; ->SD2_al_RelatedCompanyIDs)
		LB_SetColumnHeaders(->SD2_lb_DiaryCoRelations; "SDCo_L"; 1; "Code"; "Name"; "")
		LB_SetColumnWidths(->SD2_lb_DiaryCoRelations; "SDco_t"; 1; 80; 95; 0)
		LB_SetEnterable(->SD2_lb_DiaryCoRelations; False:C215; 0)
		LB_SetScroll(->SD2_lb_DiaryCoRelations; -3; -2)
		LB_SETENTRYOPTIONS
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
		LB_StyleSettings(->SD2_lb_DiaryInvoiceRelations; "Black"; 9; "SDPo_t"; ->[DIARY:12])
		
		//``
		
		
		
		
		//``
		SD_DiaryLinksSetInterface
		SET TIMER:C645(60)
		
	: ($_l_event=On Timer:K2:25)
		SD_DiaryLinksSetInterface
	: ($_l_event=On Data Change:K2:15)
		SD2_OndataChangeMethod
		SD_DiaryLinksSetInterface
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_DiaryLinks"; $_t_oldMethodName)
