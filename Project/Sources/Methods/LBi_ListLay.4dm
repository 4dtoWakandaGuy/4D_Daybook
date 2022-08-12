//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_ListLay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/02/2010 13:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(NextColumnNo)
	//ARRAY BOOLEAN(SD2_lb_Workflow;0)
	C_BOOLEAN:C305($_bo_CreateFromCode)
	C_DATE:C307($_d_StartDateLabel)
	C_LONGINT:C283($_l_Accounts; $_l_Actionstable; $_l_addressFormatTable; $_l_AnalTableNum; $_l_AreasTable; $_l_BrandsLabel; $_l_ContractsTable; $_l_ContractTypes; $_l_CountriesTable; $_l_CurrenciesTable; $_l_FTable)
	C_LONGINT:C283($_l_Headings; $_l_InvoiceItems; $_l_InvoiceNumber; $_l_Job; $_l_JobStages; $_l_JobStageTable; $_l_JobTypes; $_l_JournalTable; $_l_Layers; $_l_Macros; $_l_MovementTypes)
	C_LONGINT:C283($_l_NextColumnNumber; $_l_offset; $_l_OrderItemsTable; $_l_OrdersTable; $_l_PersonellTable; $_l_PersonGroupsTable; $_l_PersonnelTable; $_l_PicturesTable; $_l_PostCodesTable; $_l_POTable; $_l_PriceGroupsTable)
	C_LONGINT:C283($_l_ProductGroupsTable; $_l_ProductsTable; $_l_ProjectsTable; $_l_PublicationsTable; $_l_PurchaseOrdersTable; $_l_ResultsTable; $_l_Roles; $_l_SolutionsTable; $_l_SourcesTable; $_l_StagesTable; $_l_StatusTable)
	C_LONGINT:C283($_l_StockItemsTable; $_l_StockLevelsTable; $_l_StockMovementsTable; $_l_StockTypesTable; $_l_Table; $_l_TableNumber; $_l_TaxTableNum; $_l_Terminology; $_l_WFTable; $_l_AccountBalances; $_l_Accounts)
	C_LONGINT:C283($_l_Actionstable; $_l_addressFormatTable; $_l_AnalTableNum; $_l_AreasTable; $_l_BrandsLabel; $_l_ContractsTable; $_l_ContractTypes; $_l_CountriesTable; $_l_CurrenciesTable; $_l_DocumentsTable; $_l_FTable)
	C_LONGINT:C283($_l_Headings; $_l_InvoiceItems; $_l_InvoiceNumber; $_l_Job; $_l_JobStages; $_l_JobStageTable; $_l_JobTypes; $_l_JournalTable; $_l_Layers; $_l_locations; $_l_Macros)
	C_LONGINT:C283($_l_MovementTypes; $_l_NextColumnNumber; $_l_OrderItemsTable; $_l_OrdersTable; $_l_PersonellTable; $_l_PersonGroupsTable; $_l_PersonnelTable; $_l_PicturesTable; $_l_PITable; $_l_PostCodesTable; $_l_POTable)
	C_LONGINT:C283($_l_PriceGroupsTable; $_l_ProductGroupsTable; $_l_ProductsTable; $_l_ProjectsTable; $_l_PublicationsTable; $_l_PurchaseOrdersTable; $_l_ResultsTable; $_l_Roles; $_l_SCTable; $_l_SolutionsTable; $_l_SourcesTable)
	C_LONGINT:C283($_l_StagesTable; $_l_StatusTable; $_l_StockItemsTable; $_l_StockLevelsTable; $_l_StockMovementsTable; $_l_StockTypesTable; $_l_Table; $_l_TableNumber; $_l_TableNumView; $_l_TaxTableNum; $_l_Terminology)
	C_LONGINT:C283($_l_WFTable)
	C_REAL:C285($_r_BalanceLabel; NextColumnNo; $_r_Balance)
	C_TEXT:C284($_t_AAmountLLabel; $_t_AccountCodeLabel; $_t_AccountLabel; $_t_AccountNamelabel; $_t_ActionCode; $_t_ActionCodeLabel; $_t_actionNameLabel; $_t_AddressFormatCodeLabel; $_t_AddressFormatNameLabel; $_t_AddressNameLabel; $_t_alesAmountlabel)
	C_TEXT:C284($_t_AllocatedStockLabel; $_t_allowAllocationLabel; $_t_AmountLabel; $_t_AnalcodeLabel; $_t_AnalysisCodeLabel; $_t_AnalysisCodeName; $_t_AnalysisCodeNameLabel; $_t_AnalysisLabel; $_t_AnalysisNameLabel; $_t_AreasCodeLabel; $_t_AreasNameLabel)
	C_TEXT:C284($_t_AreasTaxRateLabel; $_t_ATimeUnitsLabel; $_t_AUNitsLabel; $_t_AUNitsLLabel; $_t_AutoPaynumLabel; $_t_BalanceLabel; $_t_BamountLabel; $_t_BatchdateLabel; $_t_BCostsLabel; $_t_BrandCodeLabel; $_t_BrandNameLabel)
	C_TEXT:C284($_t_BTimeUnitsLabel; $_t_BunitsLabel; $_t_CatagoryLabel; $_t_ChargeLabel; $_t_ChequeNoLabel; $_t_CirculationLabel; $_t_COaddress1Label; $_t_CoCOdeLabel; $_t_CoCOdeLLabel; $_t_CoCommentsLabel; $_t_CoCountryLabel)
	C_TEXT:C284($_t_CodeFromLabel; $_t_CodeLabel; $_t_CodeToLabel; $_t_CoEnteredDateLabel; $_t_comment1Label; $_t_comment2Label; $_t_CompanyCodeLabel; $_t_CompanyNameLabel; $_t_Con_CodeLabel; $_t_Con_NameLabel; $_t_Con_NameLabelLabel)
	C_TEXT:C284($_t_CoNameLabel; $_t_CoNameLLabel; $_t_ContractCodeLabel; $_t_ContractCompanyCodeLabel; $_t_ContractTypeCodeLabel; $_t_ContractTypeNameLabel; $_t_CoPostalLabel; $_t_CoSalesLabel; $_t_CoSIzeLabel; $_t_CoSourceLabel; $_t_CostAllocatedLabel)
	C_TEXT:C284($_t_CostAmountlabel; $_t_CoStatusLabel; $_t_CostFreeLabel; $_t_CostLabel; $_t_CostPriceLabelsLabel; $_t_CostTotalLabel; $_t_CoTakenByLabel; $_t_CoTelephoneLabel; $_t_COTownLabel; $_t_CoTypeLabel; $_t_CountriesFormatLabel)
	C_TEXT:C284($_t_CountriesNameLabel; $_t_CrangFromLabel; $_t_CrangToLabel; $_t_CreditStageLabel; $_t_currencyCodeLabel; $_t_CurrencyLabel; $_t_currencyNameLabel; $_t_CurrentDefinitionsName; $_t_CustomerOrderRefLabel; $_t_DateFromLabel; $_t_DateLabel)
	C_TEXT:C284($_t_DateReceivedLabel; $_t_DateShippedLabel; $_t_DaysLabel; $_t_DebitAccCodeLabel; $_t_DefaultAnalysisLabel; $_t_DepartmentLabel; $_t_DescriptionLabel; $_t_DialingCodeLabel; $_t_DiaryCodeLabel; $_t_DiscountBasedLabel; $_t_Discountlabel)
	C_TEXT:C284($_t_DocumentClassLabel; $_t_DocumentDateLabel; $_t_DocumentHeadingLabel; $_t_documentLabel; $_t_DocumentPersonLabel; $_t_DocumentTextLabel; $_t_DocumentTypeLabel; $_t_drangFromLabel; $_t_drangToLabel; $_t_DueDateLabel; $_t_emailAddressLabel)
	C_TEXT:C284($_t_EndDateLabel; $_t_EndDateLLabel; $_t_EngineerLabel; $_t_EntrydateLabel; $_t_ExtensionLabel; $_t_FCodeLabel; $_t_FDCodeLabel; $_t_FDCodeLLabel; $_t_FDFormatLabel; $_t_FDFormatLLabel; $_t_FDNameLLabel)
	C_TEXT:C284($_t_FDSortLabel; $_t_FDSortLLabel; $_t_FDTableNumLabel; $_t_FDTableNumLLabel; $_t_FDTypeLabel; $_t_FDTypeLLabel; $_t_FIeldNameLabel; $_t_FIeldNameLLabel; $_t_FieldValueLLabel; $_t_FNamelabel; $_t_FormatLabel)
	C_TEXT:C284($_t_Formula; $_t_FrequencyLabel; $_t_FullAccessLabel; $_t_GroupCodeLabel; $_t_GroupCodeLLabel; $_t_GroupLabel; $_t_GroupLLabel; $_t_GroupNameLabel; $_t_GroupNotesLabel; $_t_GroupNotestLabel; $_t_GroupsLabel)
	C_TEXT:C284($_t_HeadingCodeLabel; $_t_HeadingCodeLLabel; $_t_HeadingLevelLabel; $_t_HeadingLevelLLabel; $_t_HeadingNameLabel; $_t_HeadingNameLLabel; $_t_IDLabel; $_t_includeinreorderLabel; $_t_InvoicedAmountLabel; $_t_InvoiceDateLabel; $_t_InvoicedLabel)
	C_TEXT:C284($_t_InvoiceNumberLabel; $_t_InvoiceState; $_t_InvoiceStateLabel; $_t_ISOcurrencyNameLabel; $_t_ISOLabel; $_t_JobCodeLabel; $_t_JobNameLabel; $_t_JobPersonLabel; $_t_JobPostLabel; $_t_JobProjectCodeLabel; $_t_JobStageCodeLabel)
	C_TEXT:C284($_t_JobStageLabel; $_t_JobStatusLabel; $_t_JobTitleLabel; $_t_JobtStatusLabel; $_t_JobTypeLabel; $_t_JournalsCompanyLabel; $_t_JournalsCopyBatchLabel; $_t_JournalsDateStartedLabel; $_t_JournalsDescLabel; $_t_JournalsNextDateLabel; $_t_JournalsTypeLabel)
	C_TEXT:C284($_t_JTCodesLabel; $_t_JTermsLabel; $_t_JTNameLabel; $_t_LayerCodeLabel; $_t_LayerNameLabel; $_t_LayerPeriodControlsLabel; $_t_LayoutID; $_t_LayoutName; $_t_LevelAllocatedLabel; $_t_LevelFreeLabel; $_t_LevelProductCodeLabel)
	C_TEXT:C284($_t_LevelStockTypeLabel; $_t_LevelTotalLabel; $_t_LevelUpLabel; $_t_LocationCodeLabel; $_t_LocationNameLabel; $_t_LoginLabel; $_t_MacroCodeLabel; $_t_MacrofKeyLabel; $_t_MacroGroupLabel; $_t_MacroModifiedLabel; $_t_MacroNameLabel)
	C_TEXT:C284($_t_MacroPersonLabel; $_t_ManagerLabel; $_t_MaxStockLabel; $_t_MinStockLabel; $_t_MobileLabel; $_t_ModifiableLabel; $_t_modifiedDateLabel; $_t_MovementCodeLabel; $_t_MovementDateLabel; $_t_MovementDateRefLabel; $_t_MovementSourceRefLabel)
	C_TEXT:C284($_t_MovementTypeLabel; $_t_MovementTypeNoLabel; $_t_NameLabel; $_t_NotesLabel; $_t_NumberLabel; $_t_OfficeCodeLabel; $_t_oldMethodName; $_t_OmitLabel; $_t_OpenEndedLabel; $_t_OrdeForcastPCLabel; $_t_OrdeMarginLabel)
	C_TEXT:C284($_t_OrderAmountLabel; $_t_orderCodeLabel; $_t_OrderCostAmountLabel; $_t_OrderCurrencyLabel; $_t_OrderCusordNoLabel; $_t_OrderDateLabel; $_t_OrderDeliveryMethodLabel; $_t_OrderForcastLabel; $_t_orderForcastPCLabel; $_t_OrderItemLabel; $_t_OrderItemRefLabel)
	C_TEXT:C284($_t_orderMarginLabel; $_t_orderMarginPCLabel; $_t_OrderPeriodLabel; $_t_OrderRequiredDateLabel; $_t_OrderSourceLabel; $_t_OrderSPabel; $_t_OrderSPLabel; $_t_OrderStateLabel; $_t_OrderTaxAmountLabel; $_t_OrdertypeLabel; $_t_OriginalCostlabel)
	C_TEXT:C284($_t_OtherSIdeLabel; $_t_OverdueLabel; $_t_PCoCodeLabel; $_t_PCodeLabel; $_t_PContCodeLabel; $_t_PeriodCodelabel; $_t_PeriodLabel; $_t_PersonInitialsLabel; $_t_PersonLLabel; $_t_PersonNameLabel; $_t_PhantomLabel)
	C_TEXT:C284($_t_PIAnalysisCodeLabel; $_t_PICostAmountLabel; $_t_PICostPrice; $_t_PICostPriceLabel; $_t_PictureCodeLabel; $_t_PictureNameLabel; $_t_PicturePictureLabel; $_t_PINumberLabel; $_t_PInvoiceNoLabel; $_t_PIPiCodeLabel; $_t_PIPOCodeLabel)
	C_TEXT:C284($_t_PIProductCodeLabel; $_t_PIProductNameLabel; $_t_PIPurchAccLabel; $_t_PIQuantity; $_t_PIQuantityLabel; $_t_PISalesPriceLabel; $_t_PITaxCodeLabel; $_t_PITotalAmountLabel; $_t_POCodeLabel; $_t_PODateLabel; $_t_PostedDateLabel)
	C_TEXT:C284($_t_PostedDateRefLabel; $_t_PostedtDateLabel; $_t_PreventDeliveryLabel; $_t_PreventInvoicingLabel; $_t_PreventPurchasePaymentLabel; $_t_priceBasedLabel; $_t_PriceCatalogueLabel; $_t_PriceCodeLabel; $_t_PriceCodeLLabel; $_t_PriceGroupLabel; $_t_PriceLabel)
	C_TEXT:C284($_t_PriorityLabel; $_t_ProblemCodeLabel; $_t_ProblemDescriptionLabel; $_t_ProblemNameLabel; $_t_ProductBrandNameLabel; $_t_ProductCodelabel; $_t_ProductDescriptionLabel; $_t_ProductGroupLabel; $_t_ProductGroupNameLabel; $_t_ProductNameLabel; $_t_ProductShortCodeLabel)
	C_TEXT:C284($_t_ProjectCodeLabel; $_t_ProjectCodeLLabel; $_t_ProjectNameLabel; $_t_ProjStateLabel; $_t_ProjStateLLabel; $_t_ProjTypeLabel; $_t_ProjTypeLLabel; $_t_PubCodeLabel; $_t_PubCodeNameLabel; $_t_PubNameLabel; $_t_PubTypeLabel)
	C_TEXT:C284($_t_PurchaseAccountLabel; $_t_PurchaseCreditLabel; $_t_PurchasesCodeLabel; $_t_QualificationsLabel; $_t_QuantityLabel; $_t_QuotedAmountLabel; $_t_QuotedCostsLabel; $_t_RateLabel; $_t_ReceivedDateLabel; $_t_RecipientLabel; $_t_ReconcilledLabel)
	C_TEXT:C284($_t_ReconcilRefLabel; $_t_RequiredDateLabel; $_t_ResponseLabel; $_t_ResultsCodeLabel; $_t_ResultsNameLabel; $_t_RoleLabel; $_t_RolesCodeLabel; $_t_RolesCodeLLabel; $_t_RolesNameLabel; $_t_RolesNameLLabel; $_t_SalePersonLabel)
	C_TEXT:C284($_t_SalesAmountLabel; $_t_SalesCreditLabel; $_t_SalesFactorLabel; $_t_SalesNoLabel; $_t_SalesPersonLabel; $_t_SalesPriceGroupLabel; $_t_SalesPriceLabel; $_t_SalesStageLabel; $_t_SalestermsLabel; $_t_SalutationLabel; $_t_ScriptsLabel)
	C_TEXT:C284($_t_SerialNoLabel; $_t_SerialNumLabel; $_t_showasAllocatedLabel; $_t_ShowCalendarLabel; $_t_ShowRemindersLabel; $_t_ShowWorkflowLabel; $_t_SolutionCodeLabel; $_t_SolutionDescLabel; $_t_SourceCodeLabel; $_t_SourceCostLabel; $_t_SourcedateLabel)
	C_TEXT:C284($_t_SourceFormatLabel; $_t_sourceLabel; $_t_SourceNameLabel; $_t_SourcePersonLabel; $_t_SourcePositionLabel; $_t_SourceProdCodeLabel; $_t_SourcePubCodeLabel; $_t_SourceTargetLabel; $_t_StageDaysLabel; $_t_StageDocumentLabel; $_t_StageLabel)
	C_TEXT:C284($_t_StageNameLabel; $_t_StageNextLabel; $_t_StartDateLabel; $_t_StartDateLLabel; $_t_StatusCodeLabel; $_t_StatusLabel; $_t_StatusNameLabel; $_t_STDPriceLabel; $_t_StkCompanyLabel; $_t_StkLocationLabel; $_t_StkLocationNameLabel)
	C_TEXT:C284($_t_StkNoLabel; $_t_StkPOILabel; $_t_StkPOLabel; $_t_StkQuantityLabel; $_t_StkSerialLabel; $_t_StkSOILabel; $_t_StkValueLabel; $_t_StockAccountLabel; $_t_StockMinusLabel; $_t_StockMovementCodeLabel; $_t_StockNoLabel)
	C_TEXT:C284($_t_StockNumberLabel; $_t_StockPLusLabel; $_t_StockProductCodeLabel; $_t_StockTypeCodeLabel; $_t_StockTypeLabel; $_t_SuperiorLabel; $_t_SupervisorLabel; $_t_SupplierCodeLabel; $_t_SupplierCompanyLabel; $_t_T30daysLabel; $_t_T60daysLabel)
	C_TEXT:C284($_t_T90daysLabel; $_t_tableNumberSTRING; $_t_TakenByLabel; $_t_TaxAmountLabel; $_t_TaxCodeLabelLabel; $_t_taxIOLabel; $_t_TaxNameLabel; $_t_TaxPeriodLabel; $_t_TaxRateLabel; $_t_taxUKECLabel; $_t_TdaysLabel)
	C_TEXT:C284($_t_TelephoneLabel; $_t_TelextnLabel; $_t_TermCodeLabel; $_t_TheirAccNumLabel; $_t_TimeLabel; $_t_TimeRecordLabel; $_t_TotalAmountLabel; $_t_TotalCostName; $_t_TotalCostNameLabel; $_t_TotalDueLabel; $_t_TotalInvoicedLabel)
	C_TEXT:C284($_t_TotalLabel; $_t_TotalPaidLabel; $_t_TransNameLabel; $_t_TypeCodeLabel; $_t_TypeCodeLLabel; $_t_TypeNameLabel; $_t_TypeNameLLabel; $_t_UniqueReferenceLabel; $_t_UniqueReferenceLLabel; $_t_UserOwnedLabel; $_t_WarnNegativeLabel)
	C_TEXT:C284($_t_WDDescriptionNameLabel; $_t_WFAfterTimeNameLabel; $_t_WFCodeLabel; $_t_WFNameLabel; $_t_WFNextActionNameLabel; $_t_WFResultNameLabel; $_t_WorkGroupLabel; $1; $2; DB_t_Address1Label; DB_t_CountryLabel)
	C_TEXT:C284(LB_t_LayoutRef; $_t_AAmountLabel; $_t_AAmountLLabel; $_t_AccountCodeLabel; $_t_AccountLabel; $_t_AccountNamelabel; $_t_ActionCodeLabel; $_t_actionNameLabel; $_t_AddressFormatCodeLabel; $_t_AddressFormatNameLabel; $_t_AddressNameLabel)
	C_TEXT:C284($_t_ageLabel; $_t_alesAmountlabel; $_t_AllocatedStockLabel; $_t_allowAllocationLabel; $_t_AmountLabel; $_t_AnalcodeLabel; $_t_AnalysisCodeLabel; $_t_AnalysisCodeName; $_t_AnalysisCodeNameLabel; $_t_AnalysisLabel; $_t_AnalysisNameLabel)
	C_TEXT:C284($_t_AreaCodeLabel; $_t_AreasCodeLabel; $_t_AreasNameLabel; $_t_AreasTaxRateLabel; $_t_ATimeUnitsLabel; $_t_AUNitsLabel; $_t_AUNitsLLabel; $_t_AutoPaynumLabel; $_t_BalanceLabel; $_t_BamountLabel; $_t_BatchdateLabel)
	C_TEXT:C284($_t_BatchNoLabel; $_t_BCostsLabel; $_t_BrandCodeLabel; $_t_BrandNameLabel; $_t_BTimeUnitsLabel; $_t_BunitsLabel; $_t_CatagoryLabel; $_t_ChargeLabel; $_t_ChequeNoLabel; $_t_CirculationLabel; $_t_COaddress1Label)
	C_TEXT:C284($_t_CoAreaLabel; $_t_CoCOdeLabel; $_t_CoCOdeLLabel; $_t_CoCommentsLabel; $_t_CoCountryLabel; $_t_CodeFromLabel; $_t_CodeLabel; $_t_CodeToLabel; $_t_CoEnteredDateLabel; $_t_Comment1Label; $_t_Comment2Label)
	C_TEXT:C284($_t_CommentsLabel; $_t_CompanyCodeLabel; $_t_CompanyNameLabel; $_t_Con_CodeLabel; $_t_Con_NameLabel; $_t_Con_NameLabelLabel; $_t_CoNameLabel; $_t_CoNameLLabel; $_t_ContractCodeLabel; $_t_ContractCompanyCodeLabel; $_t_ContractTypeCodeLabel)
	C_TEXT:C284($_t_ContractTypeLabel; $_t_ContractTypeNameLabel; $_t_CoPostalLabel; $_t_CoSalesLabel; $_t_CoSIzeLabel; $_t_CoSourceLabel; $_t_CostAllocatedLabel; $_t_CostAmountlabel; $_t_CoStatusLabel; $_t_CostFreeLabel; $_t_CostLabel)
	C_TEXT:C284($_t_CostPriceLabel; $_t_CostPriceLabelsLabel; $_t_CostTotalLabel; $_t_CoTakenByLabel; $_t_CoTelephoneLabel; $_t_COTownLabel; $_t_CoTypeLabel; $_t_CountriesFormatLabel; $_t_CountriesNameLabel; $_t_CrangFromLabel; $_t_CrangToLabel)
	C_TEXT:C284($_t_CreditAccCodeLabel; $_t_CreditStageLabel; $_t_currencyCodeLabel; $_t_CurrencyLabel; $_t_currencyNameLabel; $_t_CurrentDefinitionsName; $_t_CustomerOrderRefLabel; $_t_DateFromLabel; $_t_dateLabel; $_t_DateReceivedLabel; $_t_DateShippedLabel)
	C_TEXT:C284($_t_DatetoLabel; $_t_DaysLabel; $_t_DebitAccCodeLabel; $_t_DefaultAnalysisLabel; $_t_DepartmentLabel; $_t_descriptionLabel; $_t_DialingCodeLabel; $_t_DiaryCodeLabel; $_t_DiscountBasedLabel; $_t_Discountlabel; $_t_DocumentClassLabel)
	C_TEXT:C284($_t_DocumentCodeLabel; $_t_DocumentDateLabel; $_t_DocumentHeadingLabel; $_t_documentLabel; $_t_DocumentPersonLabel; $_t_DocumentTextLabel; $_t_DocumentTypeLabel; $_t_drangFromLabel; $_t_drangToLabel; $_t_DueDateLabel; $_t_emailAddressLabel)
	C_TEXT:C284($_t_EnclosuresLabel; $_t_EndDateLabel; $_t_EndDateLLabel; $_t_EngineerLabel; $_t_EntryDateLabel; $_t_ExtensionLabel; $_t_FCodeLabel; $_t_FDCodeLabel; $_t_FDCodeLLabel; $_t_FDFormatLabel; $_t_FDFormatLLabel)
	C_TEXT:C284($_t_FDNameLabel; $_t_FDNameLLabel; $_t_FDSortLabel; $_t_FDSortLLabel; $_t_FDTableNumLabel; $_t_FDTableNumLLabel; $_t_FDTypeLabel; $_t_FDTypeLLabel; $_t_FIeldNameLabel; $_t_FIeldNameLLabel; $_t_FieldValueLLabel)
	C_TEXT:C284($_t_filtercurrentLabel; $_t_FNamelabel; $_t_FormatLabel; $_t_Formula; $_t_FrequencyLabel; $_t_FullAccessLabel; $_t_GroupCodeLabel; $_t_GroupCodeLLabel; $_t_GroupLabel; $_t_GroupLLabel; $_t_GroupNameLabel)
	C_TEXT:C284($_t_GroupNameLLabel; $_t_GroupNotesLabel; $_t_GroupNotestLabel; $_t_GroupsLabel; $_t_HeadingCodeLabel; $_t_HeadingCodeLLabel; $_t_HeadingLevelLabel; $_t_HeadingLevelLLabel; $_t_HeadingNameLabel; $_t_HeadingNameLLabel; $_t_IDLabel)
	C_TEXT:C284($_t_IgnoreLocationsLabel; $_t_includeinreorderLabel; $_t_InvoicedAmountLabel; $_t_InvoiceDateLabel; $_t_InvoicedLabel; $_t_InvoiceNumberLabel; $_t_InvoiceState; $_t_InvoiceStateLabel; $_t_ISOcurrencyNameLabel; $_t_ISOLabel; $_t_JobCodeLabel)
	C_TEXT:C284($_t_JobCompanyCodeLabel; $_t_JobNameLabel; $_t_JobPersonLabel; $_t_JobPostLabel; $_t_JobProjectCodeLabel; $_t_JobStageCodeLabel; $_t_JobStageLabel; $_t_JobStatusLabel; $_t_JobTitleLabel; $_t_JobtStatusLabel; $_t_JobTypeLabel)
	C_TEXT:C284($_t_JournalsAmountLabel; $_t_JournalsCompanyLabel; $_t_JournalsCopyBatchLabel; $_t_JournalsDateStartedLabel; $_t_JournalsDescLabel; $_t_JournalsNextDateLabel; $_t_JournalsTypeLabel; $_t_JTCodesLabel; $_t_JTermsLabel; $_t_JTNameLabel; $_t_LayerCodeLabel)
	C_TEXT:C284($_t_LayerLabel; $_t_LayerNameLabel; $_t_LayerPeriodControlsLabel; $_t_LayoutID; $_t_LayoutName; $_t_LevelAllocatedLabel; $_t_LevelFreeLabel; $_t_LevelProductCodeLabel; $_t_LevelStockTypeLabel; $_t_LevelTotalLabel; $_t_LevelUpLabel)
	C_TEXT:C284($_t_LevelUpLLabel; $_t_LocationCodeLabel; $_t_LocationNameLabel; $_t_LoginLabel; $_t_MacroCodeLabel; $_t_MacrofKeyLabel; $_t_MacroGroupLabel; $_t_MacroModifiedLabel; $_t_MacroNameLabel; $_t_MacroPersonLabel; $_t_ManagerLabel)
	C_TEXT:C284($_t_MarginAmountLabel; $_t_MaxStockLabel; $_t_MinStockLabel; $_t_MobileLabel; $_t_ModifiableLabel; $_t_modifiedDateLabel; $_t_MovementCodeLabel; $_t_MovementDateLabel; $_t_MovementDateRefLabel; $_t_MovementSourceRefLabel; $_t_MovementTypeLabel)
	C_TEXT:C284($_t_MovementTypeNameLabel; $_t_MovementTypeNoLabel; $_t_NameLabel; $_t_NotesLabel; $_t_NumberLabel; $_t_OfficeCodeLabel; $_t_oldMethodName; $_t_OmitLabel; $_t_OpenEndedLabel; $_t_OrdeForcastPCLabel; $_t_OrdeMarginLabel)
	C_TEXT:C284($_t_OrdeMarginPCLabel; $_t_OrderAmountLabel; $_t_orderCodeLabel; $_t_OrderCostAmountLabel; $_t_OrderCurrencyLabel; $_t_OrderCusordNoLabel; $_t_OrderDateLabel; $_t_OrderDeliveryMethodLabel; $_t_OrderForcastLabel; $_t_orderForcastPCLabel; $_t_OrderItemLabel)
	C_TEXT:C284($_t_OrderItemNumberLabel; $_t_OrderItemRefLabel; $_t_orderMarginLabel; $_t_orderMarginPCLabel; $_t_OrderPeriodLabel; $_t_OrderRequiredDateLabel; $_t_OrderSourceLabel; $_t_OrderSPabel; $_t_OrderSPLabel; $_t_OrderStateLabel; $_t_OrderTaxAmountLabel)
	C_TEXT:C284($_t_OrderTotalAmountLabel; $_t_OrdertypeLabel; $_t_OriginalCostlabel; $_t_OtherSIdeLabel; $_t_OverdueLabel; $_t_PCoCodeLabel; $_t_PCodeLabel; $_t_PContCodeLabel; $_t_PeriodCodelabel; $_t_PeriodLabel; $_t_PersonInitialsLabel)
	C_TEXT:C284($_t_PersonLabel; $_t_PersonLLabel; $_t_PersonNameLabel; $_t_PhantomLabel; $_t_PIAnalysisCodeLabel; $_t_PICostAmountLabel; $_t_PICostPrice; $_t_PICostPriceLabel; $_t_PictureCodeLabel; $_t_PictureNameLabel; $_t_PicturePictureLabel)
	C_TEXT:C284($_t_PicturePictureLLabel; $_t_PINumberLabel; $_t_PInvoiceNoLabel; $_t_PIPiCodeLabel; $_t_PIPOCodeLabel; $_t_PIProductCodeLabel; $_t_PIProductNameLabel; $_t_PIPurchAccLabel; $_t_PIQuantity; $_t_PIQuantityLabel; $_t_PISalesPriceLabel)
	C_TEXT:C284($_t_PITaxAmountLabel; $_t_PITaxCodeLabel; $_t_PITotalAmountLabel; $_t_POCodeLabel; $_t_PODateLabel; $_t_PostedDateLabel; $_t_PostedDateRefLabel; $_t_PostedtDateLabel; $_t_PreventDeliveryLabel; $_t_PreventInvoicingLabel; $_t_PreventPurchasePaymentLabel)
	C_TEXT:C284($_t_PreventStageChangeLabel; $_t_priceBasedLabel; $_t_PriceCatalogueLabel; $_t_PriceCodeLabel; $_t_PriceCodeLLabel; $_t_PriceGroupLabel; $_t_PriceLabel; $_t_PriorityLabel; $_t_ProblemCodeLabel; $_t_ProblemDescriptionLabel; $_t_ProblemNameLabel)
	C_TEXT:C284($_t_ProductBrandLabel; $_t_ProductBrandNameLabel; $_t_ProductCodelabel; $_t_ProductDescriptionLabel; $_t_ProductGroupLabel; $_t_ProductGroupNameLabel; $_t_ProductNameLabel; $_t_ProductShortCodeLabel; $_t_ProjectCodeLabel; $_t_ProjectCodeLLabel; $_t_ProjectNameLabel)
	C_TEXT:C284($_t_ProjectNameLLabel; $_t_ProjStateLabel; $_t_ProjStateLLabel; $_t_ProjTypeLabel; $_t_ProjTypeLLabel; $_t_PubCodeLabel; $_t_PubCodeNameLabel; $_t_PubNameLabel; $_t_PubTypeLabel; $_t_PurchaseAccountLabel; $_t_PurchaseCreditLabel)
	C_TEXT:C284($_t_PurchaseInvoiceLabel; $_t_PurchasesCodeLabel; $_t_QualificationsLabel; $_t_QuantityLabel; $_t_QuotedAmountLabel; $_t_QuotedCostsLabel; $_t_RateLabel; $_t_ReceivedDateLabel; $_t_RecipientLabel; $_t_ReconcilledLabel; $_t_ReconcilRefLabel)
	C_TEXT:C284($_t_ReconilledLabel; $_t_RequiredDateLabel; $_t_ResponseLabel; $_t_ResultsCodeLabel; $_t_ResultsNameLabel; $_t_RoleLabel; $_t_RolesCodeLabel; $_t_RolesCodeLLabel; $_t_RolesNameLabel; $_t_RolesNameLLabel; $_t_SalePersonLabel)
	C_TEXT:C284($_t_SalesAccountLabel; $_t_SalesAmountLabel; $_t_SalesCreditLabel; $_t_SalesFactorLabel; $_t_SalesNoLabel; $_t_SalesPersonLabel; $_t_SalesPriceGroupLabel; $_t_SalesPriceLabel; $_t_SalesStageLabel; $_t_SalestermsLabel; $_t_SalutationLabel)
	C_TEXT:C284($_t_Scriptsabel; $_t_ScriptsLabel; $_t_SerialNoLabel; $_t_SerialNumLabel; $_t_showasAllocatedLabel; $_t_ShowCalendarLabel; $_t_ShowRemindersLabel; $_t_ShowWorkflowLabel; $_t_SolutionCodeLabel; $_t_SolutionDescLabel; $_t_SourceCodeLabel)
	C_TEXT:C284($_t_SourcecolourLabel; $_t_SourceCostLabel; $_t_SourcedateLabel; $_t_SourceFormatLabel; $_t_sourceLabel; $_t_SourceNameLabel; $_t_SourcePersonLabel; $_t_SourcePositionLabel; $_t_SourceProdCodeLabel; $_t_SourcePubCodeLabel; $_t_SourceTargetLabel)
	C_TEXT:C284($_t_StageCodeLabel; $_t_StageDaysLabel; $_t_StageDocumentLabel; $_t_StageLabel; $_t_StageNameLabel; $_t_StageNextLabel; $_t_StartDateLabel; $_t_StartDateLLabel; $_t_StatusCodeLabel; $_t_StatusLabel; $_t_StatusNameLabel)
	C_TEXT:C284($_t_StatusUsageLabel; $_t_STDPriceLabel; $_t_StkCompanyLabel; $_t_StkLocationLabel; $_t_StkLocationNameLabel; $_t_StkNoLabel; $_t_StkPOILabel; $_t_StkPOLabel; $_t_StkQuantityLabel; $_t_StkSerialLabel; $_t_StkSOILabel)
	C_TEXT:C284($_t_StkSOLabel; $_t_StkValueLabel; $_t_StockAccountLabel; $_t_StockMinusLabel; $_t_StockMovementCodeLabel; $_t_StockNoLabel; $_t_StockNumberLabel; $_t_StockPLusLabel; $_t_StockProductCodeLabel; $_t_StockTypeCodeLabel; $_t_StockTypeLabel)
	C_TEXT:C284($_t_StockTypenameLabel; $_t_SuperiorLabel; $_t_SupervisorLabel; $_t_SupplierCodeLabel; $_t_SupplierCompanyLabel; $_t_T30daysLabel; $_t_T60daysLabel; $_t_T90daysLabel; $_t_tableNumberSTRING; $_t_TakenByLabel; $_t_TaxAmountLabel)
	C_TEXT:C284($_t_TaxCodeLabel; $_t_TaxCodeLabelLabel; $_t_taxIOLabel; $_t_TaxNameLabel; $_t_TaxPeriodLabel; $_t_TaxRateLabel; $_t_taxUKECLabel; $_t_TdaysLabel; $_t_TelephoneLabel; $_t_TelextnLabel; $_t_TermCodeLabel)
	C_TEXT:C284($_t_TermNameLabel; $_t_TheirAccNumLabel; $_t_TimeLabel; $_t_TimeRecordLabel; $_t_TotalAmountLabel; $_t_TotalCostNameLabel; $_t_TotalDueLabel; $_t_TotalInvoicedLabel; $_t_TotalLabel; $_t_TotalPaidLabel; $_t_TransCodeLabel)
	C_TEXT:C284($_t_TransNameLabel; $_t_TypeCodeLabel; $_t_TypeCodeLLabel; $_t_TypeNameLabel; $_t_TypeNameLLabel; $_t_UniqueReferenceLabel; $_t_UniqueReferenceLLabel; $_t_UserOwnedLabel; $_t_WarnNegativeLabel; $_t_WDDescriptionNameLabel; $_t_WFActionNameLabel)
	C_TEXT:C284($_t_WFAfterTimeNameLabel; $_t_WFCodeLabel; $_t_WFNameLabel; $_t_WFNextActionNameLabel; $_t_WFResultNameLabel; $_t_WorkGroupLabel; $1; $2; DB_t_Address1Label; DB_t_CountryLabel; DB_t_TownLabel)
	C_TEXT:C284(LB_t_LayoutRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_ListLay")

//NG this method replaced a number of list layout methods. these methods setup default layouts. Call this one with a parameter of set the variable LB_S55_LayoutRef before the call
//TRACE
$_t_oldMethodName:=ERR_MethodTracker("LBi_ListLay"; Form event code:C388)

Case of 
	: (Count parameters:C259>=1)
		$_t_CurrentDefinitionsName:=$1
		LB_t_LayoutRef:=$_t_CurrentDefinitionsName
	Else 
		$_t_CurrentDefinitionsName:=LB_t_LayoutRef
End case 
While (Semaphore:C143("Create"+$_t_CurrentDefinitionsName))
	//just to make sure we only do once
	DelayTicks
End while 

READ WRITE:C146([LIST_LAYOUTS:96])
$_bo_CreateFromCode:=LB_ImportDefault($_t_CurrentDefinitionsName)

//NG modified June 2008 to use $_t_CurrentDefinitionsName in the call to Layouts_Create..makes maintainance easier
//NG modified Match 2009 to use $_l_NextColumnNumber(mods also to Layouts_Create)
$_l_NextColumnNumber:=1
$_t_tableNumberSTRING:=Substring:C12($_t_CurrentDefinitionsName; 1; 3)
$_t_LayoutID:=Substring:C12($_t_CurrentDefinitionsName; 4; Length:C16($_t_CurrentDefinitionsName))
$_l_TableNumber:=Num:C11($_t_tableNumberSTRING)
$_t_LayoutName:=""
If (Count parameters:C259>=2)
	
	$_t_LayoutName:=$2
	LB_CheckLayouts($_l_TableNumber; Num:C11($_t_LayoutID); $_t_LayoutName)
End if 
If ($_bo_CreateFromCode)
	Case of 
		: ($_t_CurrentDefinitionsName="00103")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Contacts_Incl"
			End if 
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; Field:C253(->[CONTACTS:1]Contact_Name:31); "Name"; ""; 225; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; 6; "Job Title"; ""; 100; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; 7; "Salutation"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; 9; "Extension"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; 11; "Role"; ""; 30; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="00104")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA Contacts_Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; Field:C253(->[CONTACTS:1]Contact_Name:31); "Name"; ""; 225; $_l_NextColumnNumber; True:C214)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;1;3;"Title";"";35;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;1;4;"Forename";"";90;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;1;5;"Surname";"";100;$_l_NextColumnNumber;true)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 1; 6; "Job Title"; ""; 120; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="00105")
			If (Count parameters:C259<2)
				$_t_LayoutName:="List Contacts"
			End if 
			$_t_CoCOdeLLabel:=Get localized string:C991("CompanyFieldNames_Code")
			$_t_Con_CodeLabel:=Get localized string:C991("ContactFieldNames_Code")
			$_t_Con_NameLabelLabel:=Get localized string:C991("ContactFieldNames_Name")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_TelephoneLabel:=Get localized string:C991("CompanyFieldNames_Telephone")
			$_t_RoleLabel:=Get localized string:C991("ContactFieldNames_Role")
			$_t_MobileLabel:=Get localized string:C991("ContactFieldNames_Mobile")
			$_t_ExtensionLabel:=Get localized string:C991("ContactFieldNames_Ext")
			$_t_emailAddressLabel:=Get localized string:C991("ContactFieldNames_Emailaddress")
			$_t_JobTitleLabel:=Get localized string:C991("ContactFieldNames_JobTitle")
			$_t_DepartmentLabel:=Get localized string:C991("ContactFieldNames_Department")
			$_t_SalePersonLabel:=Get localized string:C991("ContactFieldNames_SalesPerson")
			$_t_TakenByLabel:=Get localized string:C991("ContactFieldNames_TakenBy")
			$_t_StatusLabel:=Get localized string:C991("ContactFieldNames_Status")
			$_t_ProjTypeLLabel:=Get localized string:C991("ContactFieldNames_Type")
			$_t_CommentsLabel:=Get localized string:C991("ContactFieldNames_Comments")
			$_t_EntryDateLabel:=Get localized string:C991("ContactFieldNames_EntryDate")
			$_t_sourceLabel:=Get localized string:C991("CompanyFieldNames_Source")
			$_t_OmitLabel:=Get localized string:C991("ContactFieldNames_Omit")
			$_t_SalutationLabel:=Get localized string:C991("ContactFieldNames_Salutation")
			$_t_QualificationsLabel:=Get localized string:C991("ContactFieldNames_Qualifications")
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Code:2); $_t_Con_CodeLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); $_t_Con_NameLabel; ""; 113; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Company_Code:1); $_t_CoCOdeLabel; ""; 75; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Role:11); $_t_RoleLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Telephone:9); $_t_TelephoneLabel; ""; 72; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Extn:9); $_t_ExtensionLabel; ""; 78; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Mobile:12); $_t_MobileLabel; ""; 84; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Email_Address:35); $_t_EmailAddressLabel; ""; 142; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Job_Title:6); $_t_JobTitleLabel; ""; 98; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Dept:8); $_t_DepartmentLabel; ""; 79; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Sales_Person:25); $_t_SalePersonLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Taken_by:29); $_t_TakenByLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Status:14); $_t_StatusLabel; ""; 48; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Type:15); $_t_ProjTypeLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Source:16); $_t_SourceLabel; ""; 88; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Omit:20); $_t_OmitLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Salutation:7); $_t_SalutationLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Qualifications:13); $_t_QualificationsLabel; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Entry_Date:17); $_t_EntrydateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Comments:10); $_t_CommentsLabel; ""; 156; $_l_NextColumnNumber; False:C215)
			
			
			
		: ($_t_CurrentDefinitionsName="14405")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 144; Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3); "Record"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 144; Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]ID:2); "ID"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]); Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1); "Code"; ""; 80; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 53; 2; "Name"; ""; 135; $_l_NextColumnNumber; False:C215; False:C215; "RELATE ONE ([CONTACTS_RECORD_ANALYSIS]Analysis_Code)")
		: ($_t_CurrentDefinitionsName="00201")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Companies"
			End if 
			Companies_vAT  //nothing to do with tax
			
			
			
			$_t_CoCOdeLLabel:=Get localized string:C991("CompanyFieldNames_Code")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_CoTelephoneLabel:=Get localized string:C991("CompanyFieldNames_Telephone")
			$_t_COaddress1Label:=Get localized string:C991("CompanyFieldNames_Address1")
			If (DB_t_Address1Label#"")
				$_t_COaddress1Label:=DB_t_Address1Label
			End if 
			$_t_COTownLabel:=Get localized string:C991("CompanyFieldNames_Town")
			If (DB_t_TownLabel#"")
				$_t_COTownLabel:=DB_t_TownLabel
			End if 
			$_t_CoPostalLabel:=Get localized string:C991("CompanyFieldNames_Postcode")
			$_t_CoPostallabel:=Term_PCWT($_t_CoPostallabel)
			$_t_CoSalesLabel:=Get localized string:C991("CompanyFieldNames_SalesPerson")
			$_t_CoTakenByLabel:=Get localized string:C991("CompanyFieldNames_Takenby")
			$_t_CoAreaLabel:=Get localized string:C991("CompanyFieldNames_Area")
			$_t_CoStatusLabel:=Get localized string:C991("CompanyFieldNames_Status")
			$_t_CoTypeLabel:=Get localized string:C991("CompanyFieldNames_Type")
			$_t_CoSourceLabel:=Get localized string:C991("CompanyFieldNames_Source")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Code:1); $_t_CoCOdeLabel; ""; 75; 1; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Telephone:9); $_t_CoTelephoneLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Address_Line_one:3); $_t_COaddress1Label; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Town_or_City:5); $_t_COTownLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Postal_Code:7); $_t_CoPostallabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Person:29); $_t_CoSaleslabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Taken_By:26); $_t_CoTakenByLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Area:11); $_t_CoAreaLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Status:12); $_t_CoStatusLabel; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Type:13); $_t_CoTypeLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Source:14); $_t_CoSourceLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			
			
			
		: ($_t_CurrentDefinitionsName="00202")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA View Companies"
			End if 
			Companies_vAT  //nothing to do with tax
			
			
			
			$_t_CoCOdeLLabel:=Get localized string:C991("CompanyFieldNames_Code")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_CoTelephoneLabel:=Get localized string:C991("CompanyFieldNames_Telephone")
			$_t_COaddress1Label:=Get localized string:C991("CompanyFieldNames_Address1")
			If (DB_t_Address1Label#"")
				$_t_COaddress1Label:=DB_t_Address1Label
			End if 
			$_t_COTownLabel:=Get localized string:C991("CompanyFieldNames_Town")
			If (DB_t_TownLabel#"")
				$_t_COTownLabel:=DB_t_TownLabel
			End if 
			$_t_CoPostalLabel:=Get localized string:C991("CompanyFieldNames_Postcode")
			$_t_CoPostallabel:=Term_PCWT($_t_CoPostallabel)
			$_t_CoSalesLabel:=Get localized string:C991("CompanyFieldNames_SalesPerson")
			$_t_CoTakenByLabel:=Get localized string:C991("CompanyFieldNames_Takenby")
			$_t_CoAreaLabel:=Get localized string:C991("CompanyFieldNames_Area")
			$_t_CoStatusLabel:=Get localized string:C991("CompanyFieldNames_Status")
			$_t_CoTypeLabel:=Get localized string:C991("CompanyFieldNames_Type")
			$_t_CoSourceLabel:=Get localized string:C991("CompanyFieldNames_Source")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Code:1); $_t_CoCOdeLabel; ""; 75; 1; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Telephone:9); $_t_CoTelephoneLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Address_Line_one:3); $_t_COaddress1Label; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Town_or_City:5); $_t_COTownLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Postal_Code:7); $_t_CoPostallabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Status:12); $_t_CoStatusLabel; ""; 50; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="00203")
			If (Count parameters:C259<2)
				$_t_LayoutName:="List Companies"
			End if 
			Companies_vAT  //nothing to do with tax
			
			
			
			$_t_CoCOdeLLabel:=Get localized string:C991("CompanyFieldNames_Code")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_CoTelephoneLabel:=Get localized string:C991("CompanyFieldNames_Telephone")
			$_t_COaddress1Label:=Get localized string:C991("CompanyFieldNames_Address1")
			If (DB_t_Address1Label#"")
				$_t_COaddress1Label:=DB_t_Address1Label
			End if 
			$_t_COTownLabel:=Get localized string:C991("CompanyFieldNames_Town")
			If (DB_t_TownLabel#"")
				$_t_COTownLabel:=DB_t_TownLabel
			End if 
			$_t_CoPostalLabel:=Get localized string:C991("CompanyFieldNames_Postcode")
			$_t_CoPostallabel:=Term_PCWT($_t_CoPostallabel)
			$_t_CoCountryLabel:=Get localized string:C991("CompanyFieldNames_Country")
			If (DB_t_CountryLabel#"")
				$_t_CoCountryLabel:=DB_t_CountryLabel
			End if 
			$_t_CoSalesLabel:=Get localized string:C991("CompanyFieldNames_SalesPerson")
			$_t_CoTakenByLabel:=Get localized string:C991("CompanyFieldNames_Takenby")
			$_t_CoAreaLabel:=Get localized string:C991("CompanyFieldNames_Area")
			$_t_CoStatusLabel:=Get localized string:C991("CompanyFieldNames_Status")
			$_t_CoTypeLabel:=Get localized string:C991("CompanyFieldNames_Type")
			$_t_CoSourceLabel:=Get localized string:C991("CompanyFieldNames_Source")
			$_t_CoSIzeLabel:=Get localized string:C991("CompanyFieldNames_Size")
			$_t_CoEnteredDateLabel:=Get localized string:C991("CompanyFieldNames_EntryDate")
			$_t_CoCommentsLabel:=Get localized string:C991("CompanyFieldNames_Comments")
			$_t_SalesCreditLabel:=Get localized string:C991("CompanyFieldNames_SalesCredit")
			$_t_PurchaseCreditLabel:=Get localized string:C991("CompanyFieldNames_PurchCredit")
			$_t_SalestermsLabel:=Get localized string:C991("CompanyFieldNames_SLTerms")
			$_t_SalesStageLabel:=Get localized string:C991("CompanyFieldNames_SLStage")
			
			$_t_SalesPriceGroupLabel:=Get localized string:C991("CompanyFieldNames_SLPriceGroup")
			$_t_SalesFactorLabel:=Get localized string:C991("CompanyFieldNames_FactorNumber")
			$_t_AutoPaynumLabel:=Get localized string:C991("CompanyFieldNames_AutoPaynumber")
			$_t_TheirAccNumLabel:=Get localized string:C991("CompanyFieldNames_TheirAccNumber")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Code:1); $_t_CoCOdeLabel; ""; 75; 1; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Telephone:9); $_t_CoTelephoneLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Address_Line_one:3); $_t_COaddress1Label; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Town_or_City:5); $_t_COTownLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Postal_Code:7); $_t_CoPostallabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Person:29); $_t_CoSaleslabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Taken_By:26); $_t_CoTakenByLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Area:11); $_t_CoAreaLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Status:12); $_t_CoStatusLabel; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Type:13); $_t_CoTypeLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Source:14); $_t_CoSourceLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Size:15); $_t_CoSizeLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Entry_Date:16); $_t_CoENteredDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Comments:30); $_t_CoCommentsLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_SalesCreditLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Purchase_Credit:36); $_t_PurchaseCreditLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]SL_Terms:40); $_t_SalestermsLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Default_Credit_Stage:42); $_t_SalesStageLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]SO_Price_Group:44); $_t_SalesPriceGroupLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Factor_Number:46); $_t_SalesFactorLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Autopay_Number:47); $_t_AutoPaynumLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Their_Account_Number:48); $_t_TheirAccNumLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			
			
			
			
			
		: ($_t_CurrentDefinitionsName="00204")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Creditor Companies"
			End if 
			Companies_vAT  //nothing to do with tax
			
			
			
			$_t_CoCOdeLLabel:=Get localized string:C991("CompanyFieldNames_Code")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_CoTelephoneLabel:=Get localized string:C991("CompanyFieldNames_Telephone")
			$_t_COaddress1Label:=Get localized string:C991("CompanyFieldNames_Address1")
			If (DB_t_Address1Label#"")
				$_t_COaddress1Label:=DB_t_Address1Label
			End if 
			$_t_COTownLabel:=Get localized string:C991("CompanyFieldNames_Town")
			If (DB_t_TownLabel#"")
				$_t_COTownLabel:=DB_t_TownLabel
			End if 
			$_t_CoPostalLabel:=Get localized string:C991("CompanyFieldNames_Postcode")
			$_t_CoPostalLabel:=Term_PCWT($_t_CoPostalLabel)
			$_t_CoCountryLabel:=Get localized string:C991("CompanyFieldNames_Country")
			If (DB_t_CountryLabel#"")
				$_t_CoCountryLabel:=DB_t_CountryLabel
			End if 
			$_t_CoSalesLabel:=Get localized string:C991("CompanyFieldNames_SalesPerson")
			$_t_CoTakenByLabel:=Get localized string:C991("CompanyFieldNames_Takenby")
			$_t_CoAreaLabel:=Get localized string:C991("CompanyFieldNames_Area")
			$_t_CoStatusLabel:=Get localized string:C991("CompanyFieldNames_Status")
			$_t_CoTypeLabel:=Get localized string:C991("CompanyFieldNames_Type")
			$_t_CoSourceLabel:=Get localized string:C991("CompanyFieldNames_Source")
			$_t_CoSIzeLabel:=Get localized string:C991("CompanyFieldNames_Size")
			$_t_CoEnteredDateLabel:=Get localized string:C991("CompanyFieldNames_EntryDate")
			$_t_CoCommentsLabel:=Get localized string:C991("CompanyFieldNames_Comments")
			$_t_SalesCreditLabel:=Get localized string:C991("CompanyFieldNames_SalesCredit")
			$_t_PurchaseCreditLabel:=Get localized string:C991("CompanyFieldNames_PurchCredit")
			$_t_SalestermsLabel:=Get localized string:C991("CompanyFieldNames_SLTerms")
			$_t_SalesStageLabel:=Get localized string:C991("CompanyFieldNames_SLStage")
			
			$_t_SalesPriceGroupLabel:=Get localized string:C991("CompanyFieldNames_SLPriceGroup")
			$_t_SalesFactorLabel:=Get localized string:C991("CompanyFieldNames_FactorNumber")
			$_t_AutoPaynumLabel:=Get localized string:C991("CompanyFieldNames_AutoPaynumber")
			$_t_TheirAccNumLabel:=Get localized string:C991("CompanyFieldNames_TheirAccNumber")
			
			$_t_TotalDueLabel:=Get localized string:C991("PurchasesFieldNames_TotalDue")
			$_t_T30daysLabel:=Get localized string:C991("PurchasesFieldNames_To30Days")
			$_t_T60daysLabel:=Get localized string:C991("PurchasesFieldNames_To60Days")
			$_t_T90daysLabel:=Get localized string:C991("PurchasesFieldNames_To90Days")
			$_t_TdaysLabel:=Get localized string:C991("PurchasesFieldNames_GT90Days")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Code:1); $_t_CoCOdeLabel; ""; 75; 1; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_SalesCreditLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_TotalDueLabel; ""; 180; $_l_NextColumnNumber; False:C215; False:C215; "PUR_SetTotalDue")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_T30daysLabel; ""; 180; $_l_NextColumnNumber; False:C215; False:C215; "PUR_SetTotalDue30")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_T60daysLabel; ""; 180; $_l_NextColumnNumber; False:C215; False:C215; "PUR_SetTotalDue60")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_T90daysLabel; ""; 180; $_l_NextColumnNumber; False:C215; False:C215; "PUR_SetTotalDue90")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Sales_Credit:35); $_t_TdaysLabel; ""; 180; $_l_NextColumnNumber; False:C215; False:C215; "PUR_SetTotalDueg90")
			
			
			
			
		: ($_t_CurrentDefinitionsName="14601")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Companies Additional Analysis"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4); "Record"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]ID:2); "ID"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1); "Further Code"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 53; 2; "Name"; ""; 135; NextColumnNo; False:C215; False:C215; "RELATE ONE([COMPANIES_RECORD_ANALYSIS]Analysis_Code)")
			
		: ($_t_CurrentDefinitionsName="14803")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Product Suppliers"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]Product_Code:8); "Record"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7); "ID"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Company_Code:1); "Supplier"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[PRODUCTS_SUPPLIERS]);Field(->[PRODUCTS_SUPPLIERS]Company Code);"Supplier";"";85;$_l_NextColumnNumber;True;True)
			
			//Layouts_Create ("14803";Table(->[PRODUCTS_SUPPLIERS]);Field(->[PRODUCTS_SUPPLIERS]Company Code);"Supplier";"";85;$_l_NextColumnNumber;True;True)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); 2; "Company Name"; ""; 170; $_l_NextColumnNumber; False:C215; False:C215; "RELATE ONE ([PRODUCTS_SUPPLIERS]Company Code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); 9; "Telephone"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4); "Their Code"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Lead_Days:6); "Days"; ""; 35; $_l_NextColumnNumber; True:C214; False:C215; "")
			
			If ((DB_GetModuleSettingByNUM(1))=5)
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Margin:3); "Margin"; "|Percent"; 70; $_l_NextColumnNumber; True:C214; False:C215)
			Else 
				$_l_NextColumnNumber:=Layouts_Create("14803"; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215)
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2); "Actual Cost"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Standard_Cost:5); "Standard"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS_SUPPLIERS:148]); Field:C253(->[PRODUCTS_SUPPLIERS:148]Margin:3); "Margin"; "|Percent"; 70; $_l_NextColumnNumber; True:C214; False:C215)
				
			End if 
		: ($_t_CurrentDefinitionsName="00301")  //areas
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Areas Table View"
			End if 
			$_l_AreasTable:=Table:C252(->[AREAS:3])
			$_t_AreasCodeLabel:=Get localized string:C991("AreasFieldNames_AreaCode")
			$_t_AreasNameLabel:=Get localized string:C991("AreasFieldNames_AreaName")
			$_t_AreasTaxRateLabel:=Get localized string:C991("AreasFieldNames_TaxRate")
			$_t_SalesPersonLabel:=Get localized string:C991("AreasFieldNames_DefaultSalesPerson")
			$_t_NotesLabel:=Get localized string:C991("AreasFieldNames_Description")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AreasTable; Field:C253(->[AREAS:3]Area_Code:1); $_t_AreasCodeLabel; ""; 67; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AreasTable; Field:C253(->[AREAS:3]Area_Name:2); $_t_AreasNameLabel; ""; 295; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AreasTable; Field:C253(->[AREAS:3]Tax_Rate:4); $_t_AreasTaxRateLabel; ""; 51; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AreasTable; Field:C253(->[AREAS:3]Person:5); $_t_SalesPersonLabel; ""; 51; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AreasTable; Field:C253(->[AREAS:3]Description:6); $_t_NotesLabel; ""; 51; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="00401")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Status View"
			End if 
			//Status code
			//status name
			//status usage(calculated column)
			$_t_StatusCodeLabel:=Get localized string:C991("StatusFieldNames_Code")
			$_t_StatusNameLabel:=Get localized string:C991("StatusFieldNames_Name")
			$_t_StatusUsageLabel:=Get localized string:C991("StatusFieldNames_Usage")
			$_l_StatusTable:=Table:C252(->[STATUS:4])
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StatusTable; Field:C253(->[STATUS:4]Status_Code:1); $_t_StatusCodeLabel; ""; 53; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StatusTable; Field:C253(->[STATUS:4]Status_Name:2); $_t_StatusNameLabel; ""; 185; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StatusTable; Field:C253(->[STATUS:4]Status_Name:2); $_t_StatusUsageLabel; ""; 85; $_l_NextColumnNumber; True:C214; False:C215; "STATUS_usagetoText")
		: ($_t_CurrentDefinitionsName="00601")  //Sources
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Sources Table View"
			End if 
			
			$_l_SourcesTable:=Table:C252(->[SOURCES:6])
			//$SourcePubNameLabel:=Get localized string("PublicationsFieldNames_PublicationName")
			$_t_SourceCodeLabel:=Get localized string:C991("SourcesFieldNames_Code")
			$_t_SourceNameLabel:=Get localized string:C991("SourcesFieldNames_Name")
			$_t_SourcePubCodeLabel:=Get localized string:C991("SourcesFieldNames_PublicationCode")
			$_t_SourceProdCodeLabel:=Get localized string:C991("SourcesFieldNames_ProductCode")
			$_t_SourceFormatLabel:=Get localized string:C991("SourcesFieldNames_Format")
			$_t_SourcecolourLabel:=Get localized string:C991("SourcesFieldNames_Colour")
			$_t_SourcePositionLabel:=Get localized string:C991("SourcesFieldNames_Position")
			
			$_t_SourcedateLabel:=Get localized string:C991("SourcesFieldNames_Date")
			$_t_SourceCostLabel:=Get localized string:C991("SourcesFieldNames_Cost")
			$_t_SourcePersonLabel:=Get localized string:C991("SourcesFieldNames_Person")
			$_t_SourceTargetLabel:=Get localized string:C991("SourcesFieldNames_Target")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Source_Code:1); $_t_SourceCodeLabel; ""; 102; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Source_Name:2); $_t_SourceNameLabel; ""; 172; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Publication_Code:12); $_t_SourcePubCodeLabel; ""; 66; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Product_Code:6); $_t_SourceProdCodeLabel; ""; 135; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Format:7); $_t_SourceFormatLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Colour:8); $_t_SourcecolourLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Source_Position:10); $_t_SourcePositionLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Source_Date:3); $_t_SourcedateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Cost:4); $_t_SourceCostLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Person:9); $_t_SourcePersonLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SourcesTable; Field:C253(->[SOURCES:6]Target_Leads:11); $_t_SourceTargetLabel; ""; 56; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="00701")  //701Sources
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Document Templates Table"
			End if 
			
			$_l_DocumentsTable:=Table:C252(->[DOCUMENTS:7])
			
			$_t_DocumentCodeLabel:=Get localized string:C991("DocumentFieldNames_DocumentCode")
			$_t_DocumentClassLabel:=Get localized string:C991("DocumentFieldNames_DocumentClass")
			$_t_DocumentHeadingLabel:=Get localized string:C991("DocumentFieldNames_DocumentHeading")
			$_t_DocumentPersonLabel:=Get localized string:C991("DocumentFieldNames_DocumentPerson")
			$_t_DocumentTypeLabel:=Get localized string:C991("DocumentFieldNames_DocumentType")
			$_t_DocumentTextLabel:=Get localized string:C991("DocumentFieldNames_DocumentText")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Document_Code:1); $_t_DocumentCodeLabel; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Text:3); $_t_DocumentClassLabel; ""; 80; $_l_NextColumnNumber; False:C215; False:C215; "DOC_GetDocumentClass")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Heading:2); $_t_DocumentHeadingLabel; ""; 80; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Person:10); $_t_DocumentPersonLabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Document_Type:13); $_t_DocumentTypeLabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_DocumentsTable; Field:C253(->[DOCUMENTS:7]Text:3); $_t_DocumentTextLabel; ""; 238; $_l_NextColumnNumber; False:C215; False:C215; "DOC_GetDocumentText")
		: ($_t_CurrentDefinitionsName="00801")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Brands Table"
			End if 
			
			$_l_BrandsLabel:=Table:C252(->[PRODUCT_BRANDS:8])
			$_t_BrandCodeLabel:=Get localized string:C991("BrandsFieldNames_BrandsCode")  //68
			$_t_BrandNameLabel:=Get localized string:C991("BrandsFieldNames_BrandsName")  //295
			
			
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_BrandsLabel; Field:C253(->[PRODUCT_BRANDS:8]Brand_Code:1); $_t_BrandCodeLabel; ""; 68; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_BrandsLabel; Field:C253(->[PRODUCT_BRANDS:8]Brand_Name:2); $_t_BrandNameLabel; ""; 295; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="00904")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Products"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Code:1); "Product Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 185; $_l_NextColumnNumber; False:C215; True:C214; "")
		: ($_t_CurrentDefinitionsName="00905")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Products Table View"
			End if 
			//Product Code194
			//Short code103
			//product name182
			//sales price70
			//standard price70
			//description220
			//sales account 35
			//purchase account
			//analysis code
			//minimum stock35
			//maximum stock 35
			//superior 135
			//modified code 67
			$_l_ProductsTable:=Table:C252(->[PRODUCTS:9])
			$_t_ProductCodelabel:=Get localized string:C991("ProductFieldNames_ProductCode")
			$_t_ProductNameLabel:=Get localized string:C991("ProductFieldNames_ProductName")
			$_t_ProductShortCodeLabel:=Get localized string:C991("ProductFieldNames_ShortCode")
			$_t_SalesPriceLabel:=Get localized string:C991("ProductFieldNames_SalesPrice")
			$_t_STDPriceLabel:=Get localized string:C991("ProductFieldNames_StandardPrice")
			$_t_descriptionLabel:=Get localized string:C991("ProductFieldNames_Description")
			$_t_SalesAccountLabel:=Get localized string:C991("ProductFieldNames_SalesAccount")
			$_t_PurchaseAccountLabel:=Get localized string:C991("ProductFieldNames_PurchaseAccount")
			$_t_AnalysisCodeLabel:=Get localized string:C991("ProductFieldNames_AnalysisCode")
			$_t_MinStockLabel:=Get localized string:C991("ProductFieldNames_MinimumStock")
			$_t_MaxStockLabel:=Get localized string:C991("ProductFieldNames_MaximumStock")
			$_t_SuperiorLabel:=Get localized string:C991("ProductFieldNames_Superior")
			$_t_modifiedDateLabel:=Get localized string:C991("ProductFieldNames_ModifiedDate")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Product_Code:1); $_t_ProductCodeLabel; ""; 194; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Short_Code:19); $_t_ProductShortCodeLabel; ""; 103; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Product_Name:2); $_t_ProductNameLabel; ""; 182; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Sales_Price:9); $_t_SalesPriceLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Standard_Price:16); $_t_STDPriceLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Description:6); $_t_DescriptionLabel; ""; 220; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Sales_Account:7); $_t_SalesAccountLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Purchase_Account:13); $_t_PurchaseAccountLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Analysis_Code:18); $_t_AnalysisCodeLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Minimum:11); $_t_MinStockLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Maximum:12); $_t_MaxStockLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Superior:15); $_t_SuperiorLabel; ""; 194; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductsTable; Field:C253(->[PRODUCTS:9]Modified_Date:10); $_t_ModifiedDateLabel; ""; 67; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="01001")  //groups(product groups)
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Product Groups View"
			End if 
			$_l_ProductGroupsTable:=Table:C252(->[PRODUCT_GROUPS:10])
			
			$_t_GroupCodeLLabel:=Get localized string:C991("GroupFieldNames_GroupCode")
			$_t_GroupNameLLabel:=Get localized string:C991("GroupFieldNames_GroupName")
			$_t_GroupNotesLabel:=Get localized string:C991("GroupFieldNames_GroupNotes")
			$_t_SalesAccountLabel:=Get localized string:C991("GroupFieldNames_SalesAccount")
			$_t_PurchaseAccountLabel:=Get localized string:C991("GroupFieldNames_PurchaseAccount")
			$_t_StockAccountLabel:=Get localized string:C991("GroupFieldNames_StockAccount")
			$_t_DefaultAnalysisLabel:=Get localized string:C991("GroupFieldNames_DefaultAnalysis")
			$_t_AccountNamelabel:=Get localized string:C991("AccountsFieldNames_AccountName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Code:1); $_t_GroupCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Name:2); $_t_GroupNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Comments:3); $_t_GroupNotestLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Analysis_Code:6); $_t_DefaultAnalysisLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Sales_Account:4); $_t_SalesAccountLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Comments:3); $_t_AccountNameLabel; ""; 128; $_l_NextColumnNumber; False:C215; False:C215; "GRP_GetSalesAccount")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Sales_Account:4); $_t_PurchaseAccountLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Comments:3); $_t_AccountNameLabel; ""; 128; $_l_NextColumnNumber; False:C215; False:C215; "GRP_GetPurchaseAccount")
			If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Stock_Account:8); $_t_StockAccountLabel; ""; 56; $_l_NextColumnNumber; False:C215)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProductGroupsTable; Field:C253(->[PRODUCT_GROUPS:10]Group_Comments:3); $_t_AccountNameLabel; ""; 128; $_l_NextColumnNumber; False:C215; False:C215; "GRP_GetStockAccount")
			End if 
			
		: ($_t_CurrentDefinitionsName="01101")  //Personnel
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Personnel Table"
			End if 
			$_l_PersonellTable:=Table:C252(->[PERSONNEL:11])
			$_t_PersonInitialsLabel:=Get localized string:C991("PersonnelFieldNames_Initials")
			$_t_PersonNameLabel:=Get localized string:C991("PersonnelFieldNames_Name")
			$_t_JobTitleLabel:=Get localized string:C991("PersonnelFieldNames_JobTItle")
			$_t_WorkGroupLabel:=Get localized string:C991("PersonnelFieldNames_WorkGroup")
			$_t_SupervisorLabel:=Get localized string:C991("PersonnelFieldNames_Supervisor")
			$_t_TelextnLabel:=Get localized string:C991("PersonnelFieldNames_TelephoneExtension")
			$_t_emailAddressLabel:=Get localized string:C991("PersonnelFieldNames_EmailAddress")
			$_t_CatagoryLabel:=Get localized string:C991("PersonnelFieldNames_Catagory")
			$_t_RateLabel:=Get localized string:C991("PersonnelFieldNames_Rate")
			$_t_CostLabel:=Get localized string:C991("PersonnelFieldNames_Cost")
			$_t_LoginLabel:=Get localized string:C991("PersonnelFieldNames_InLoginList")
			$_t_ShowCalendarLabel:=Get localized string:C991("PersonnelFieldNames_ShowCalendar")
			$_t_ShowWorkflowLabel:=Get localized string:C991("PersonnelFieldNames_ShowWorkflow")
			$_t_ShowRemindersLabel:=Get localized string:C991("PersonnelFieldNames_ShowReminders")
			$_t_OfficeCodeLabel:=Get localized string:C991("PersonnelFieldNames_OfficeCode")
			$_t_DefaultAnalysisLabel:=Get localized string:C991("PersonnelFieldNames_DefaultAnalysis")
			$_t_ScriptsLabel:=Get localized string:C991("PersonnelFieldNames_ExecuteScriptAttachments")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Initials:1); $_t_PersonInitialsLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Name:2); $_t_PersonNameLabel; ""; 139; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Job_Title:35); $_t_JobTitleLabel; ""; 139; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Group_Code:28); $_t_WorkGroupLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Supervisor:4); $_t_SupervisorLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Extension:26); $_t_TelextnLabel; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Email_Address:36); $_t_EmailAddressLabel; ""; 125; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Category_Code:6); $_t_CatagoryLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Sales_Rate:5); $_t_RateLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Cost_Rate:30); $_t_CostLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Startup_List:15); $_t_LoginLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Startup_List:15); $_t_ShowCalendarLabel; ""; 52; $_l_NextColumnNumber; False:C215; False:C215; "PER_ShowSchedule")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Startup_List:15); $_t_ShowWorkflowLabel; ""; 52; $_l_NextColumnNumber; False:C215; False:C215; "PER_ShowWorkflow")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Startup_List:15); $_t_ShowRemindersLabel; ""; 52; $_l_NextColumnNumber; False:C215; False:C215; "PER_ShowReminders")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Office_Code:17); $_t_OfficeCodeLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]Analysis_Code:20); $_t_DefaultAnalysisLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonellTable; Field:C253(->[PERSONNEL:11]DM_Additions:21); $_t_Scriptsabel; ""; 52; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="01203")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Enquirers Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 4; "Date Do"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 9; "Action"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 10; "Action Desc"; ""; 100; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 5; "Date Done"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 11; "Result"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 12; "Result Desc"; ""; 100; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="01208")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Diary"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 4; "Date Do"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 9; "Action"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 10; "Action Desc"; ""; 100; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 5; "Date Done"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 11; "Result"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 12; "Result Desc"; ""; 100; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="01209")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Documents"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Date_Done_From:5); "Date Sent"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 9; "Action"; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Document_Code:15); "Document Code"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Document_Heading:32); "Document Title"; ""; 180; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="01210")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Jobs"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Job_Code:19); "Job"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Stage_Code:21); "Stage"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Done:14); "Done"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Date_Do_From:4); "Date Do From"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Date_Do_To:33); "-To"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Time_Do_From:6); "Time Do From"; "&/2"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Time_Do_To:35); "- To"; "&/2"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Date_Done_From:5); "Date Done From"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Date_Done_To:34); "- To"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Time_Done_From:7); "Time Done From"; "&/2"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Time_Done_To:36); "-To"; "&/2"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Person:8); "Person"; ""; 42; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Result_Code:11); "Charge Type"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Result_Description:12); "Description"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Charge_Rate:22); "Sales Rate"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Units:20); "Units"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Value:16); "Value"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Diary_Code:3); "Code"; ""; 1; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Order_Code:26); "Order"; ""; 1; $_l_NextColumnNumber; False:C215; True:C214)
		: ($_t_CurrentDefinitionsName="01211")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Diary"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Date_From:51); "Date"; "##/##/##"; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Time_From:53); "Time"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Company_Code:1); "Company"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Contact_Code:2); "Contact"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); "Name"; ""; 55; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Description:55); "Detail"; ""; 400; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Diary_Code:3); "Diary Code"; ""; 30; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="01213")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Workflow"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Diary_Code:3); "Diary Code"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Action_Code:9); "Task"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ACTIONS:13]); Field:C253(->[ACTIONS:13]Action_Name:2); "Task"; ""; 130; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([ACTIONS];[ACTIONS]Action Code=[DIARY]Action_Code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Date_From:51); "Date"; "##/##/##"; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Time_From:53); "Time"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PERSONNEL:11]); Field:C253(->[PERSONNEL:11]Name:2); "Person"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([PERSONNEL];[PERSONNEL]Initials=[DIARY]Person)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Company_Code:1); "Company"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 110; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([COMPANIES];[COMPANIES]Company Code=[DIARY]Company Code)")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Contact_Code:2); "Contact"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); "Name"; ""; 55; $_l_NextColumnNumber; False:C215; False:C215; "Query([contacts];[contacts]contact code=[diary]contact code)")
			$_t_Formula:="Replace string([diary]displaydescription;char(13);"+Char:C90(34)+" "+Char:C90(34)+")"
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Description:55); "Detail"; ""; 400; $_l_NextColumnNumber; False:C215; False:C215; $_t_Formula)
		: ($_t_CurrentDefinitionsName="01214")  //diaray documents out put
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Letters Table"
			End if 
			$_l_Table:=Table:C252(->[DIARY:12])
			$_t_DiaryCodeLabel:=Get localized string:C991("DiaryFieldNames_DiaryCode")
			
			$_t_RecipientLabel:=Get localized string:C991("DiaryFieldNames_Recipient")
			$_t_DocumentCodeLabel:=Get localized string:C991("DiaryFieldNames_DocumentCode")
			$_t_DocumentDateLabel:=Get localized string:C991("DiaryFieldNames_DocumentDate")
			$_t_DocumentHeadingLabel:=Get localized string:C991("DocumentFieldNames_DocumentHeading")
			$_t_DocumentClassLabel:=Get localized string:C991("DocumentFieldNames_DocumentClass")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[DIARY:12]Diary_Code:3); $_t_DiaryCodeLabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[DIARY:12]Display_Description:55); $_t_RecipientLabel; ""; 182; $_l_NextColumnNumber; False:C215; False:C215; "DIA_GetDocRecipient")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[DIARY:12]Document_Code:15); $_t_DocumentCodeLabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[DIARY:12]Date_Done_To:34); $_t_DocumentDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[DOCUMENTS:7]); Field:C253(->[DOCUMENTS:7]Heading:2); $_t_DocumentHeadingLabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[DOCUMENTS:7]); Field:C253(->[DOCUMENTS:7]Text:3); $_t_DocumentClassLabel; ""; 80; $_l_NextColumnNumber; False:C215; False:C215; "DOC_GetDocumentClass")
		: ($_t_CurrentDefinitionsName="01215")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Workflow"
			End if 
			LB_SetColumnHeaders(->SD2_lb_Workflow; "SD3_L"; 1; "info"; "Done"; "•"; "Code"; "Action"; "Name"; "Status"; "Date"; "Time"; "Subject"; "Source Table"; "Notes"; "ThreadID"; "is Thread"; "Open parent")
			$_t_DiaryCodeLabel:=Get localized string:C991("DiaryFieldNames_DiaryCode")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PICTURES:85]); Field:C253(->[PICTURES:85]Picture:3); $_t_DiaryCodeLabel; ""; 42; $_l_NextColumnNumber; False:C215; False:C215; "SD3_SetInfoIcon")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[DIARY:12]Done:14); "Done"; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PICTURES:85]); Field:C253(->[PICTURES:85]Picture:3); "•"; ""; 42; $_l_NextColumnNumber; False:C215; False:C215; "SD2_SetDiaryStatus")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Diary_Code:3); "Diary Code"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Action_Code:9); "Task"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ACTIONS:13]); Field:C253(->[ACTIONS:13]Action_Name:2); "Task"; ""; 130; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([ACTIONS];[ACTIONS]Action Code=[DIARY]Action_Code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Date_From:51); "Date"; "##/##/##"; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Time_From:53); "Time"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Subject:63); "Time"; ""; 55; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; 8; "Person"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PERSONNEL:11]); Field:C253(->[PERSONNEL:11]Name:2); "Person"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([PERSONNEL];[PERSONNEL]Initials=[DIARY]Person)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Company_Code:1); "Company"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 110; $_l_NextColumnNumber; False:C215; False:C215; "QUERY([COMPANIES];[COMPANIES]Company Code=[DIARY]Company Code)")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Contact_Code:2); "Contact"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); "Name"; ""; 55; $_l_NextColumnNumber; False:C215; False:C215; "Query([contacts];[contacts]contact code=[diary]contact code)")
			$_t_Formula:="Replace string([diary]displaydescription;char(13);"+Char:C90(34)+" "+Char:C90(34)+")"
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 12; Field:C253(->[DIARY:12]Display_Description:55); "Detail"; ""; 400; $_l_NextColumnNumber; False:C215; False:C215; $_t_Formula)
			
			
		: ($_t_CurrentDefinitionsName="01301")  //actions
			
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Actions Table"
			End if 
			$_l_Actionstable:=Table:C252(->[ACTIONS:13])
			$_t_ActionCodeLabel:=Get localized string:C991("ActionsFieldNames_ActionCode")
			$_t_actionNameLabel:=Get localized string:C991("ActionsFieldNames_ActionName")
			$_t_PriorityLabel:=Get localized string:C991("ActionsFieldNames_Priority")
			$_t_documentLabel:=Get localized string:C991("ActionsFieldNames_Document")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Actionstable; Field:C253(->[ACTIONS:13]Action_Code:1); $_t_ActionCodeLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Actionstable; Field:C253(->[ACTIONS:13]Action_Name:2); $_t_actionNameLabel; ""; 107; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Actionstable; Field:C253(->[ACTIONS:13]Priority:5); $_t_PriorityLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Actionstable; Field:C253(->[ACTIONS:13]Document_Code:4); $_t_DocumentLabel; ""; 120; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="01401")  //results
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Results Table"
			End if 
			$_l_ResultsTable:=Table:C252(->[RESULTS:14])
			
			$_t_ResultsCodeLabel:=Get localized string:C991("ResultsFieldNames_ResultsCode")
			$_t_ResultsNameLabel:=Get localized string:C991("ResultsFieldNames_ResultsName")
			$_t_TimeRecordLabel:=Get localized string:C991("ResultsFieldNames_TimeRecording")
			$_t_JobPostLabel:=Get localized string:C991("ResultsFieldNames_PosttoJobs")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ResultsTable; Field:C253(->[RESULTS:14]Result_Code:1); $_t_ResultsCodeLabel; ""; 72; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ResultsTable; Field:C253(->[RESULTS:14]Result_Name:2); $_t_ResultsNameLabel; ""; 296; $_l_NextColumnNumber; True:C214)
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ResultsTable; Field:C253(->[RESULTS:14]Time_Result:3); $_t_TimeRecordLabel; ""; 25; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ResultsTable; Field:C253(->[RESULTS:14]Time_Post:5); $_t_JobPostLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			End if 
		: ($_t_CurrentDefinitionsName="01702")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Contracts"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 17; Field:C253(->[CONTRACTS:17]Contact_Code:2); "Contract Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 17; Field:C253(->[CONTRACTS:17]Start_Date:5); "Start Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 17; Field:C253(->[CONTRACTS:17]End_Date:6); "End Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 17; Field:C253(->[CONTRACTS:17]Contract_Type_Code:4); "Type"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="01703")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Contracts Table"
			End if 
			
			$_l_ContractsTable:=Table:C252(->[CONTRACTS:17])
			$_t_ContractCodeLabel:=Get localized string:C991("ContractsFieldNames_ContractCode")
			$_t_ContractCompanyCodeLabel:=Get localized string:C991("ContractsFieldNames_CompanyCode")
			$_t_ContractTypeLabel:=Get localized string:C991("ContractsFieldNames_ContractType")
			$_t_StartDateLabel:=Get localized string:C991("ContractsFieldNames_StartDate")
			$_t_EndDateLabel:=Get localized string:C991("ContractsFieldNames_EndDate")
			$_t_OpenEndedLabel:=Get localized string:C991("ContractsFieldNames_OpenEnded")
			$_t_SupplierCompanyLabel:=Get localized string:C991("ContractsFieldNames_SupplierCompany")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]Contract_Code:3); $_t_ContractCodeLabel; ""; 84; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]Company_Code:1); $_t_ContractCompanyCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]Contract_Type_Code:4); $_t_ContractTypeLabel; ""; 84; $_l_NextColumnNumber; False:C215)
			$_t_ContractTypeLabel:=Get localized string:C991("ContractTypeFieldNames_TypeName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTRACT_TYPES:19]); Field:C253(->[CONTRACT_TYPES:19]Contract_Type_Name:2); $_t_ContractTypeLabel; ""; 184; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]Start_Date:5); $_t_StartDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]End_Date:6); $_t_EndDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTRACT_TYPES:19]); Field:C253(->[CONTRACT_TYPES:19]Cont_Type_active:11); $_t_OpenEndedLabel; ""; 57; $_l_NextColumnNumber; False:C215; False:C215; "CONTR_GetStatus")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractsTable; Field:C253(->[CONTRACTS:17]Supplier_Company:9); $_t_SupplierCompanyLabel; ""; 70; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="01801")  //price groups
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Price Groups"
			End if 
			$_l_PriceGroupsTable:=Table:C252(->[PRICE_GROUPS:18])
			
			$_t_GroupCodeLLabel:=Get localized string:C991("PriceGroupFieldNames_GroupCode")
			$_t_GroupNameLLabel:=Get localized string:C991("PriceGroupFieldNames_GroupName")
			$_t_DiscountBasedLabel:=Get localized string:C991("PriceGroupFieldNames_DiscountBased")
			$_t_priceBasedLabel:=Get localized string:C991("PriceGroupFieldNames_PriceBased")
			$_t_CostPriceLabelsLabel:=Get localized string:C991("PriceGroupFieldNames_CostBased")
			$_t_CurrencyLabel:=Get localized string:C991("PriceGroupFieldNames_Currency")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Price_Code:1); $_t_GroupCodeLabel; ""; 68; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Price_Name:2); $_t_GroupNameLabel; ""; 241; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Price_Code:1); $_t_priceBasedlabel; ""; 80; $_l_NextColumnNumber; False:C215; False:C215; "PG_isPriceBased")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Price_Code:1); $_t_DiscountBasedlabel; ""; 80; $_l_NextColumnNumber; False:C215; False:C215; "PG_isDiscountBased")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Cost_Prices:4); $_t_CostPriceLabel; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PriceGroupsTable; Field:C253(->[PRICE_GROUPS:18]Currency_Code:8); $_t_CurrencyLabel; ""; 40; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="01901")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Contract Type Table"
			End if 
			$_l_ContractTypes:=Table:C252(->[CONTRACT_TYPES:19])
			$_t_ContractTypeCodeLabel:=Get localized string:C991("ContractTypeFieldNames_TypeCode")
			$_t_ContractTypeNameLabel:=Get localized string:C991("ContractTypeFieldNames_TypeName")
			$_t_ResponseLabel:=Get localized string:C991("ContractTypeFieldNames_Response")
			$_t_DaysLabel:=Get localized string:C991("ContractTypeFieldNames_Days")
			$_t_PriorityLabel:=Get localized string:C991("ContractTypeFieldNames_Priority")
			$_t_PriceGroupLabel:=Get localized string:C991("ContractTypeFieldNames_PriceGroup")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Contract_Type_Code:1); $_t_ContractTypeCodeLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Contract_Type_Name:2); $_t_ContractTypeNameLabel; ""; 294; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Response:3); $_t_ResponseLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Days:4); $_t_DaysLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Priority:5); $_t_PriorityLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ContractTypes; Field:C253(->[CONTRACT_TYPES:19]Price_Group:7); $_t_PriceGroupLabel; ""; 84; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02002")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Service Calls"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 20; Field:C253(->[SERVICE_CALLS:20]Call_Code:4); "Call Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 20; Field:C253(->[SERVICE_CALLS:20]Call_Date:5); "Call Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			//Time string"+Char(40)+"[SERVICE CALLS]Call Time*1"+Char(40)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 20; Field:C253(->[SERVICE_CALLS:20]Call_Time:6); "Time"; ""; 42; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 20; Field:C253(->[SERVICE_CALLS:20]Your_Order_Number:25); "Resolved"; ""; 52; $_l_NextColumnNumber; False:C215; False:C215; "SC_Resolved")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 20; Field:C253(->[SERVICE_CALLS:20]Problem_Code:14); "Problem Code"; ""; 100; $_l_NextColumnNumber; False:C215; False:C215)
			
		: ($_t_CurrentDefinitionsName="02003")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Service Calls View"
			End if 
			
			$_l_SCTable:=Table:C252(->[SERVICE_CALLS:20])
			
			$_t_CoCOdeLLabel:=Get localized string:C991("ServiceFieldNames_CompanyCode")
			$_t_PriorityLabel:=Get localized string:C991("ServiceFieldNames_Priority")
			$_t_StatusLabel:=Get localized string:C991("ServiceFieldNames_CallStatus")
			$_t_EngineerLabel:=Get localized string:C991("ServiceFieldNames_CallEngineer")
			$_t_ManagerLabel:=Get localized string:C991("ServiceFieldNames_CallManager")
			$_t_dateLabel:=Get localized string:C991("ServiceFieldNames_CallDate")
			$_t_TimeLabel:=Get localized string:C991("ServiceFieldNames_CallTime")
			$_t_CodeLabel:=Get localized string:C991("ServiceFieldNames_CallCode")
			$_t_ChargeLabel:=Get localized string:C991("ServiceFieldNames_CallCharge")
			$_t_ProblemCodeLabel:=Get localized string:C991("ServiceFieldNames_ProblemCode")
			$_t_ProblemDescriptionLabel:=Get localized string:C991("ServiceFieldNames_CallDescription")
			$_t_SolutionCodeLabel:=Get localized string:C991("ServiceFieldNames_SolutionCode")
			$_t_SolutionDescLabel:=Get localized string:C991("ServiceFieldNames_ResolutionDescription")
			$_t_CustomerOrderRefLabel:=Get localized string:C991("ServiceFieldNames_CustomerOrderReference")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Company_Code:1); $_t_CoCOdeLabel; ""; 68; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 131; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Priority:10); $_t_PriorityLabel; ""; 13; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Solution_Description:17); $_t_StatusLabel; ""; 128; $_l_NextColumnNumber; False:C215; False:C215; "SVS_GetStateName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Person:11); $_t_EngineerLabel; ""; 48; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Supervisor:13); $_t_ManagerLabel; ""; 48; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Call_Date:5); $_t_DateLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Call_Time:6); $_t_timeLabel; ""; 54; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Call_Code:4); $_t_CodeLabel; ""; 55; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Charge:8); $_t_ChargeLabel; ""; 25; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Problem_Code:14); $_t_ProblemCodeLabel; ""; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Problem_Description:15); $_t_ProblemDescriptionLabel; ""; 237; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Solution_Code:16); $_t_SolutionCodeLabel; ""; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Solution_Description:17); $_t_solutionDescLabel; ""; 237; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SCTable; Field:C253(->[SERVICE_CALLS:20]Your_Order_Number:25); $_t_CustomerOrderRefLabel; ""; 99; $_l_NextColumnNumber; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="02301")
			
			//solutions
			If (Count parameters:C259<2)
				$_t_LayoutName:="Solutions View"
			End if 
			$_l_SolutionsTable:=Table:C252(->[SOLUTIONS:23])
			$_t_CodeLabel:=Get localized string:C991("SolutionsFieldNames_Code")
			$_t_NameLabel:=Get localized string:C991("SolutionsFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SolutionsTable; Field:C253(->[SOLUTIONS:23]Solution_Code:1); $_t_CodeLabel; ""; 63; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_SolutionsTable; Field:C253(->[SOLUTIONS:23]Solution_Name:2); $_t_NameLabel; ""; 296; $_l_NextColumnNumber; True:C214; False:C215)
		: ($_t_CurrentDefinitionsName="02403")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Enquirers Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 3; "Code"; ""; 48; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 4; "Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "Date(String(Orders_Date)+"+Char:C90(34)+"["+Char:C90(34)+")")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "State"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 6; "Amount"; "|Accounts"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 5; "Person"; ""; 40; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02408")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Enquiries"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 3; "Order Code"; ""; 48; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 4; "Date"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215; "Date(String(Orders_Date)+"+Char:C90(34)+"["+Char:C90(34)+")")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 6; "Amount"; "|Accounts"; 65; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 5; "Person"; ""; 30; $_l_NextColumnNumber; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="02409")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Orders"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 3; "Order Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 4; "Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "Date(String(Orders_Date)+"+Char:C90(34)+"["+Char:C90(34)+")")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 6; "Amount"; "|Accounts"; 65; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; 5; "Person"; ""; 30; $_l_NextColumnNumber; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="02410")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Orders Table"
			End if 
			$_l_OrdersTable:=Table:C252(->[ORDERS:24])
			$_t_orderCodeLabel:=Get localized string:C991("OrdersFieldNames_OrderCode")  //57
			
			
			$_t_CompanyCodeLabel:=Get localized string:C991("OrdersFieldNames_CompanyCode")
			//company name
			$_t_OrdertypeLabel:=Get localized string:C991("OrdersFieldNames_OrderType")
			$_t_OrderPeriodLabel:=Get localized string:C991("OrdersFieldNames_Period")
			$_t_OrderDateLabel:=Get localized string:C991("OrdersFieldNames_OrderDate")
			$_t_OrderStateLabel:=Get localized string:C991("OrdersFieldNames_OrderState")
			$_t_OrderCurrencyLabel:=Get localized string:C991("OrdersFieldNames_Currency")
			$_t_OrderAmountLabel:=Get localized string:C991("OrdersFieldNames_Amount")
			$_t_OrderTaxAmountLabel:=Get localized string:C991("OrdersFieldNames_TaxAmount")
			$_t_OrderTotalAmountLabel:=Get localized string:C991("OrdersFieldNames_TotalAmount")
			$_t_OrderCostAmountLabel:=Get localized string:C991("OrdersFieldNames_CostAmount")
			$_t_OrdeMarginLabel:=Get localized string:C991("OrdersFieldNames_MarginAmount")
			$_t_OrdeMarginPCLabel:=Get localized string:C991("OrdersFieldNames_Marginpercent")
			$_t_OrderForcastLabel:=Get localized string:C991("OrdersFieldNames_ForecastDate")
			$_t_OrdeForcastPCLabel:=Get localized string:C991("OrdersFieldNames_ForecastPercent")
			$_t_OrderRequiredDateLabel:=Get localized string:C991("OrdersFieldNames_RequiredDate")
			$_t_OrderCusordNoLabel:=Get localized string:C991("OrdersFieldNames_CustomerOrderNumber")
			$_t_OrderDeliveryMethodLabel:=Get localized string:C991("OrdersFieldNames_DeliveryMethod")
			$_t_OrderSourceLabel:=Get localized string:C991("OrdersFieldNames_Source")
			$_t_OrderSPLabel:=Get localized string:C991("OrdersFieldNames_SalesPerson")
			$_t_AnalysisCodeNameLabel:=Get localized string:C991("OrdersFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("OrdersFieldNames_LayerCode")
			$_t_Comment1Label:=Get localized string:C991("OrdersFieldNames_Notes")
			$_t_Comment2Label:=Get localized string:C991("OrdersFieldNames_Notes2")
			$_t_EnclosuresLabel:=Get localized string:C991("OrdersFieldNames_Enclosures")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Code:3); $_t_orderCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Company_Code:1); $_t_CompanyCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[COMPANIES]);Field(->[COMPANIES]Company Code);$_t_CompanyCodeLabel;"";0;$_l_NextColumnNumber;False;False;"LB_GetRelation")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Type:43); $_t_orderTypeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Period:42); $_t_orderPeriodLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]SORT_Date:57); $_t_orderDateLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_orderStateLabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Currency_Code:32); $_t_orderCurrencyLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Amount:6); $_t_orderAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_TAX:7); $_t_orderTaxAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Total:8); $_t_orderTotalAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Cost:11); $_t_orderCostAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin:12); $_t_orderMarginLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin_PC:13); $_t_orderMarginPCLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Comments);$_t_orderForcastLabel;"";85;$_l_NextColumnNumber;False;False;"ORD_GetforecastDate")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Comments);$_t_orderForcastPCLabel;"";85;$_l_NextColumnNumber;False;False;"ORD_GetforecastPercent")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Required Date);$OrderRequiredDate;"";85;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Your_Order_Number:10); $_t_OrderCusordNoLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Delivery_Method:19); $_t_OrderDeliveryMethodLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Source:18); $_t_OrderSourceLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Person:5); $_t_OrderSPabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Analysis_Code:33); $_t_AnalysisCodeName; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Layer_Code:47); $_t_LayerLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_comment1Label; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments_2:40); $_t_comment2Label; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Enclosures:21); $_t_EnclosuresLabel; ""; 85; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02411")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Enquiries Table"
			End if 
			$_l_OrdersTable:=Table:C252(->[ORDERS:24])
			$_t_OrderCodeLabel:=Get localized string:C991("OrdersFieldNames_EnquiryCode")  //57
			
			
			$_t_CompanyCodeLabel:=Get localized string:C991("OrdersFieldNames_CompanyCode")
			//company name
			$_t_OrdertypeLabel:=Get localized string:C991("OrdersFieldNames_OrderType")
			$_t_OrderPeriodLabel:=Get localized string:C991("OrdersFieldNames_Period")
			$_t_OrderDateLabel:=Get localized string:C991("OrdersFieldNames_EnquiryDate")
			$_t_OrderStateLabel:=Get localized string:C991("OrdersFieldNames_OrderState")
			$_t_OrderCurrencyLabel:=Get localized string:C991("OrdersFieldNames_Currency")
			$_t_OrderAmountLabel:=Get localized string:C991("OrdersFieldNames_Amount")
			$_t_OrderTaxAmountLabel:=Get localized string:C991("OrdersFieldNames_TaxAmount")
			$_t_OrderTotalAmountLabel:=Get localized string:C991("OrdersFieldNames_TotalAmount")
			$_t_OrderCostAmountLabel:=Get localized string:C991("OrdersFieldNames_CostAmount")
			$_t_OrderMarginLabel:=Get localized string:C991("OrdersFieldNames_MarginAmount")
			$_t_OrdeMarginPCLabel:=Get localized string:C991("OrdersFieldNames_Marginpercent")
			$_t_OrderForcastLabel:=Get localized string:C991("OrdersFieldNames_ForecastDate")
			$_t_OrdeForcastPCLabel:=Get localized string:C991("OrdersFieldNames_ForecastPercent")
			//$OrderRequiredDateLabel:=Get localized string("OrdersFieldNames_RequiredDate")
			$_t_OrderCusordNoLabel:=Get localized string:C991("OrdersFieldNames_CustomerOrderNumber")
			//$OrderDeliveryMethodLabel:=Get localized string("OrdersFieldNames_DeliveryMethod")
			$_t_OrderSourceLabel:=Get localized string:C991("OrdersFieldNames_Source")
			$_t_OrderSPLabel:=Get localized string:C991("OrdersFieldNames_SalesPerson")
			$_t_AnalysisCodeNameLabel:=Get localized string:C991("OrdersFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("OrdersFieldNames_LayerCode")
			$_t_Comment1Label:=Get localized string:C991("OrdersFieldNames_Notes")
			$_t_Comment2Label:=Get localized string:C991("OrdersFieldNames_Notes2")
			$_t_EnclosuresLabel:=Get localized string:C991("OrdersFieldNames_Enclosures")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Code:3); $_t_orderCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Company_Code:1); $_t_CompanyCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[COMPANIES]);Field(->[COMPANIES]Company Code);$_t_CompanyCodeLabel;"";0;$_l_NextColumnNumber;False;False;"LB_GetRelation")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Type:43); $_t_orderTypeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Period:42); $_t_orderPeriodLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Enquiry_Date:25); $_t_orderDateLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_orderStateLabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Currency_Code:32); $_t_orderCurrencyLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Amount:6); $_t_orderAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_TAX:7); $_t_orderTaxAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Total:8); $_t_orderTotalAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Cost:11); $_t_orderCostAmountLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin:12); $_t_orderMarginLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin_PC:13); $_t_orderMarginPCLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_orderForcastLabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetforecastDate")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_orderForcastPCLabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetforecastPercent")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Required Date);$OrderRequiredDate;"";85;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Your_Order_Number:10); $_t_OrderCusordNoLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Delivery Method);$_t_OrderDeliveryMethodLabel;"";85;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Source:18); $_t_OrderSourceLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Person:5); $_t_OrderSPabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Analysis_Code:33); $_t_AnalysisCodeName; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Layer_Code:47); $_t_LayerLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_comment1Label; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments_2:40); $_t_comment2Label; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Enclosures);$_t_EnclosuresLabel;"";85;$_l_NextColumnNumber;False)
			
		: ($_t_CurrentDefinitionsName="02412")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Quotations Table"
			End if 
			$_l_OrdersTable:=Table:C252(->[ORDERS:24])
			$_t_orderCodeLabel:=Get localized string:C991("OrdersFieldNames_QuotationCode")  //57
			
			
			$_t_CompanyCodeLabel:=Get localized string:C991("OrdersFieldNames_CompanyCode")
			//company name
			$_t_OrdertypeLabel:=Get localized string:C991("OrdersFieldNames_OrderType")
			$_t_OrderPeriodLabel:=Get localized string:C991("OrdersFieldNames_Period")
			$_t_OrderDateLabel:=Get localized string:C991("OrdersFieldNames_QuotationDate")
			$_t_OrderStateLabel:=Get localized string:C991("OrdersFieldNames_OrderState")
			$_t_OrderCurrencyLabel:=Get localized string:C991("OrdersFieldNames_Currency")
			$_t_OrderAmountLabel:=Get localized string:C991("OrdersFieldNames_Amount")
			$_t_OrderTaxAmountLabel:=Get localized string:C991("OrdersFieldNames_TaxAmount")
			$_t_OrderTotalAmountLabel:=Get localized string:C991("OrdersFieldNames_TotalAmount")
			$_t_OrderCostAmountLabel:=Get localized string:C991("OrdersFieldNames_CostAmount")
			$_t_OrdeMarginLabel:=Get localized string:C991("OrdersFieldNames_MarginAmount")
			$_t_OrdeMarginPCLabel:=Get localized string:C991("OrdersFieldNames_Marginpercent")
			$_t_OrderForcastLabel:=Get localized string:C991("OrdersFieldNames_ForecastDate")
			$_t_OrdeForcastPCLabel:=Get localized string:C991("OrdersFieldNames_ForecastPercent")
			$_t_OrderRequiredDateLabel:=Get localized string:C991("OrdersFieldNames_RequiredDate")
			$_t_OrderCusordNoLabel:=Get localized string:C991("OrdersFieldNames_CustomerOrderNumber")
			//$OrderDeliveryMethodLabel:=Get localized string("OrdersFieldNames_DeliveryMethod")
			$_t_OrderSourceLabel:=Get localized string:C991("OrdersFieldNames_Source")
			$_t_OrderSPLabel:=Get localized string:C991("OrdersFieldNames_SalesPerson")
			$_t_AnalysisCodeNameLabel:=Get localized string:C991("OrdersFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("OrdersFieldNames_LayerCode")
			$_t_Comment1Label:=Get localized string:C991("OrdersFieldNames_Notes")
			$_t_Comment2Label:=Get localized string:C991("OrdersFieldNames_Notes2")
			$_t_EnclosuresLabel:=Get localized string:C991("OrdersFieldNames_Enclosures")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Code:3); $_t_orderCodelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Company_Code:1); $_t_CompanyCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[COMPANIES]);Field(->[COMPANIES]Company Code);$_t_CompanyCodeLabel;"";0;$_l_NextColumnNumber;False;False;"LB_GetRelation")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Type:43); $_t_Ordertypelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Order_Period:42); $_t_OrderPeriodlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Enquiry_Date:25); $_t_OrderDatelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_OrderStatelabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Currency_Code:32); $_t_OrderCurrencylabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Amount:6); $_t_OrderAmountlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_TAX:7); $_t_OrderTaxAmountlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Total:8); $_t_OrderTotalAmountlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Cost:11); $_t_OrderCostAmountlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin:12); $_t_OrdeMarginlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Total_Margin_PC:13); $_t_OrdeMarginPClabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_OrderForcastLabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetforecastDate")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_OrdeForcastPClabel; ""; 85; $_l_NextColumnNumber; False:C215; False:C215; "ORD_GetforecastPercent")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Required_Date:9); $_t_OrderRequiredDatelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Your_Order_Number:10); $_t_OrderCusordNolabel; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Delivery Method);$_t_OrderDeliveryMethodLabel;"";85;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Source:18); $_t_OrderSourcelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Person:5); $_t_OrderSPlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Analysis_Code:33); $_t_AnalysisCodeNamelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Layer_Code:47); $_t_layerlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments:14); $_t_Comment1label; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrdersTable; Field:C253(->[ORDERS:24]Comments_2:40); $_t_comment2label; ""; 85; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_OrdersTable;Field(->[ORDERS]Enclosures);$_t_EnclosuresLabel;"";85;$_l_NextColumnNumber;False)
			
			
		: ($_t_CurrentDefinitionsName="02503")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 36; "Price Gr"; ""; 50; $_l_NextColumnNumber; True:C214)
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Disc"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 38; "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 5; "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 6; "Margin"; "|Percent"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 4)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 12; "Tax"; ""; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 8; "Tax Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 9; "Total Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 18; "PO No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 19; "PO Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 20; "Supplier"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 49; "Del No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 24; "Serial No"; ""; 120; $_l_NextColumnNumber; True:C214)
			End if 
		: ($_t_CurrentDefinitionsName="02504")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA Order Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 175; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 5; "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 12; "Tax"; ""; 27; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 8; "Tax Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 9; "Total Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 18; "PO No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="02505")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Enquiry Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 36; "Price Gr"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Disc"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 38; "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 24; "Serial No"; ""; 120; $_l_NextColumnNumber; False:C215)
			End if 
		: ($_t_CurrentDefinitionsName="02506")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA Enq Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 38; "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
		: ($_t_CurrentDefinitionsName="02507")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Enquirers Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 36; "Price Gr"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Disc"; "|Percent"; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 38; "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 24; "Serial No"; ""; 120; $_l_NextColumnNumber; False:C215)
			End if 
		: ($_t_CurrentDefinitionsName="02508")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Price_Per:50); "Price Per"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
			
			
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 36; "Price Gr"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Disc"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 7; "Sales Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); "Serial No"; ""; 70; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			
			
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			
			
		: ($_t_CurrentDefinitionsName="02509")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); "Order Code"; ""; 75; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			
			
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;Field(->[ORDER ITEMS]Price Per);"Price Per";"#####0";30;$_l_NextColumnNumber;true)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Contract_Cost:30); "Contract Cost"; "|Accounts"; 45; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
			
			
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;36;"Price Gr";"";45;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;37;"Disc";"|Percent";35;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;Field(->[ORDER ITEMS]Job Stage);"System";"";35;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;4;"Sales Price";"|Accounts";70;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;7;"Sales Amt";"|Accounts";70;$_l_NextColumnNumber;true)  `;False;"";0;"";3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); "Serial No"; ""; 70; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			
			
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;25;"Inv Date";"";60;$_l_NextColumnNumber;true)
			//$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName;25;11;"Del Date";"";60;$_l_NextColumnNumber;true)
			
		: ($_t_CurrentDefinitionsName="02510")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Description:44); "Description"; ""; 137; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sort_Order:26); "Sort Order"; ""; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Job_Stage:35); "Job Stage"; ""; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";6)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Allocated:28); "Allocated"; "#####0"; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]State:46); "State"; ""; 12; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Price_Code:36); "Price Code"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Discount"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Retail_Price:38); "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Cost_Price:5); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Margin:6); "Margin"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sales_Amount:7); "Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Tax_Code:12); "Tax"; ""; 10; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]TAX_Amount:8); "Tax Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Total_Amount:9); "Total"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 18; "PO No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 19; "PO Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 20; "Supplier"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); "Serial No"; ""; 70; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Item_Number:27); "Item No"; ""; 1; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="02511")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Description:44); "Description"; ""; 137; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sort_Order:26); "Sort Order"; ""; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Job_Code:34); "Job"; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";6)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Allocated:28); "Allocated"; "#####0"; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]State:46); "State"; ""; 22; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Price_Code:36); "Price Code"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Discount"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Retail_Price:38); "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Cost_Price:5); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Margin:6); "Margin"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sales_Amount:7); "Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Tax_Code:12); "Tax"; ""; 15; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]TAX_Amount:8); "Tax Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Total_Amount:9); "Total"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 18; "PO No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 19; "PO Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 20; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); "Serial No"; ""; 70; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Item_Number:27); "Item No"; ""; 1; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02512")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items"
			End if 
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); "Order"; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 24; Field:C253(->[ORDERS:24]Company_Code:1); "Client"; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";6)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Allocated:28); "Allocated"; "#####0"; 35; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;25;Field(->[ORDER ITEMS]State);"State";"";22;$_l_NextColumnNumber;True)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Price_Code:36); "Price Code"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Discount"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Retail_Price:38); "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Cost_Price:5); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Margin:6); "Margin"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sales_Amount:7); "Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Tax_Code:12); "Tax"; ""; 15; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]TAX_Amount:8); "Tax Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Total_Amount:9); "Total"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 18; "PO No"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 19; "PO Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 20; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); "Serial No"; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Item_Number:27); "Item No"; ""; 1; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02520")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Order items, Jobs"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Job_Code:34); "Job"; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Job_Stage:35); "Stage"; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]State:46); "State"; ""; 22; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 75; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 117; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Quantity:3); "Description"; ""; 137; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 37; "Discount"; "|Percent"; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Retail_Price:38); "Retail Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 4; "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Cost_Price:5); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Margin:6); "Margin"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Sales_Amount:7); "Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]Tax_Code:12); "Tax"; ""; 15; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; Field:C253(->[ORDER_ITEMS:25]TAX_Amount:8); "Tax Amount"; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02521")
			If (Count parameters:C259<2)
				$_t_LayoutName:="VIew Orders Items"
			End if 
			$_l_OrderItemsTable:=Table:C252(->[ORDER_ITEMS:25])
			$_t_OrderItemLabel:=Get localized string:C991("OrderItemsFieldNames_ItemNumber")
			$_t_OrderCodeLabel:=Get localized string:C991("OrderItemsFieldNames_OrderCode")
			$_t_CompanyCodeLabel:=Get localized string:C991("OrderItemsFieldNames_CompanyCode")
			$_t_ProductCodelabel:=Get localized string:C991("OrderItemsFieldNames_ProductCode")
			$_t_ProductNameLabel:=Get localized string:C991("OrderItemsFieldNames_ProductName")
			$_t_ProductDescriptionLabel:=Get localized string:C991("OrderItemsFieldNames_ProductDescription")
			$_t_QuantityLabel:=Get localized string:C991("OrderItemsFieldNames_Quantity")
			$_t_currencyCodeLabel:=Get localized string:C991("OrderItemsFieldNames_CurrencyCode")
			$_t_SalesAmountLabel:=Get localized string:C991("OrderItemsFieldNames_SalesAmount")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("OrderItemsFieldNames_TaxCode")
			$_t_TaxAmountLabel:=Get localized string:C991("OrderItemsFieldNames_TaxAmount")
			$_t_TotalAmountLabel:=Get localized string:C991("OrderItemsFieldNames_TotalAmount")
			$_t_CostAmountlabel:=Get localized string:C991("OrderItemsFieldNames_CostAmount")
			
			$_t_MarginAmountLabel:=Get localized string:C991("OrderItemsFieldNames_MarginAmount")
			//$MarginPercentLabel:=Get localized string("OrderItemsFieldNames_MarginPercent")
			$_t_SerialNumLabel:=Get localized string:C991("OrderItemsFieldNames_SerialNumber")
			$_t_AllocatedStockLabel:=Get localized string:C991("OrderItemsFieldNames_Allocated")
			$_t_InvoicedLabel:=Get localized string:C991("OrderItemsFieldNames_Invoiced")
			$_t_InvoiceNumberLabel:=Get localized string:C991("OrderItemsFieldNames_InvoiceNumber")
			$_t_OrderStateLabel:=Get localized string:C991("OrderItemsFieldNames_OrderState")
			$_t_RequiredDateLabel:=Get localized string:C991("OrderItemsFieldNames_RequiredDate")
			$_t_ReceivedDateLabel:=Get localized string:C991("OrderItemsFieldNames_ReceivedDate")
			$_t_SupplierCodeLabel:=Get localized string:C991("OrderItemsFieldNames_SupplierCode")
			$_t_ContractCodeLabel:=Get localized string:C991("OrderItemsFieldNames_ContractCode")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Item_Number:27); $_t_OrderItemLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); $_t_OrderCodelabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Company_Code:1); $_t_CompanyCodeLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 189; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); $_t_ProductCodelabel; ""; 121; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Product_Name:13); $_t_ProductNamelabel; ""; 189; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Description:44); $_t_ProductDescriptionlabel; ""; 121; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Quantity:3); $_t_Quantitylabel; "###,##0.00"; 51; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Currency_Code:32); $_t_CurrencyCodeLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Sales_Amount:7); $_t_alesAmountlabel; "|Accounts"; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Tax_Code:12); $_t_TaxCodeLabel; ""; 35; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]TAX_Amount:8); $_t_TaxAmountlabel; "|Accounts"; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Total_Amount:9); $_t_TotalAmountlabel; "|Accounts"; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Cost_Amount:15); $_t_CostAmountlabel; "|Accounts"; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Margin:6); $_t_MarginAmountlabel; "|Accounts"; 61; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Serial_Number:24); $_t_SerialNumlabel; ""; 85; $_l_NextColumnNumber; False:C215)
			End if 
			If (DB_GetModuleSettingByNUM(Module_StockControl)>=0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Allocated:28); $_t_AllocatedStocklabel; ""; 25; $_l_NextColumnNumber; False:C215)
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Invoiced:53); $_t_Invoicedlabel; ""; 25; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Invoice_Number:17); $_t_InvoiceNumberLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[TABLE_RECORD_STATES:90]); Field:C253(->[TABLE_RECORD_STATES:90]Listing_Name:2); $_t_OrderStatelabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Required_Date:10); $_t_RequiredDatelabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Received_Date:21); $_t_ReceivedDatelabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Supplier_Code:20); $_t_SupplierCodelabel; ""; 61; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_OrderItemsTable; Field:C253(->[ORDER_ITEMS:25]Contract_Code:29); $_t_ContractCodelabel; ""; 61; $_l_NextColumnNumber; False:C215)
			End if 
		: ($_t_CurrentDefinitionsName="02522")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Publication Bookings"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); "Item No"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Order_Code:1); "Order Code"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Product_Code:2); "Booked Ad"; ""; 108; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Product_Name:13); "Name"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Description:44); "Details"; ""; 168; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Job_Stage:35); "Copy Status"; ""; 38; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[STAGES:45]); Field:C253(->[STAGES:45]Stage_Name:2); "Status Name"; ""; 68; $_l_NextColumnNumber; False:C215; False:C215; "Query([stages];[Stages]Stage code=[order items]job stage)")
			
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[ORDER ITEMS]);Field(->[ORDER ITEMS]Invoiced);"Invoiced";"";28;$_l_NextColumnNumber;False;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Invoice_Number:17); "Invoice"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Company_Code:1); "Company"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215; "Query([orders];[orders]order code=[order items]order code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "Query([companies];[companies]company code=[orders]company code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Client if agency"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "FurthFld_Get("+Char:C90(34)+"ORDER ITEMS"+Char:C90(34)+";"+Char:C90(34)+"Adagency Client"+Char:C90(34)+")")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); "Contact Name"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "Query([contacts];[contacts]contact code=[orders]contact code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Size:39); "SIze"; ""; 45; $_l_NextColumnNumber; False:C215; False:C215; "Query([PRODUCTS];[PRODUCTS]product code=[order items]product code)")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[COMPANIES]);Field(->[COMPANIES]Company Name);"Client if agency";"";55;$_l_NextColumnNumber;False;False;"FurthFld_Get("+Char(34)+"ORDER ITEMS"+Char(34)+";"+Char(34)+"Adagency Client"+Char(34)+")")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Person:14); "Person"; ""; 35; $_l_NextColumnNumber; False:C215; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[ORDER ITEMS]);Field(->[ORDER ITEMS]Person);"Person";"";0;$_l_NextColumnNumber;False;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "Order State"; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "Query([TABLE_Record_States];[TABLE_Record_States]state_reference=[orders]state)")
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Quantity:3); "Quantity"; ""; 30; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Sales_Price:4); "Price"; ""; 50; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Cost_Price:5); "Costs"; ""; 50; $_l_NextColumnNumber; False:C215; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[ORDER ITEMS]);Field(->[ORDER ITEMS]Cost Price);"Costs";"";0;$_l_NextColumnNumber;False;False)
		: ($_t_CurrentDefinitionsName="02523")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Publication Subscriptions"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); "Item No"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Order_Code:1); "Order Code"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Product_Code:2); "Subscribed Product"; ""; 108; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Product_Name:13); "Name"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Description:44); "Details"; ""; 168; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Company_Code:1); "Company"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215; "Query([orders];[orders]order code=[order items]order code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "Query([companies];[companies]company code=[orders]company code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); "Contact Name"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "Query([contacts];[contacts]contact code=[orders]contact code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Size:39); "SIze"; ""; 45; $_l_NextColumnNumber; False:C215; False:C215; "Query([PRODUCTS];[PRODUCTS]product code=[order items]product code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Person:14); "Person"; ""; 35; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "Order State"; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "Query([table_record_states];[table_record_states]state_reference=[orders]state)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Quantity:3); "Quantity"; ""; 30; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Sales_Price:4); "Price"; ""; 50; $_l_NextColumnNumber; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="02524")  //purchase order sales order items
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Company_Code:1); "Company"; ""; 98; $_l_NextColumnNumber; False:C215; False:C215; "Query([orders];[orders]order code=[order items]order code)")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 155; $_l_NextColumnNumber; False:C215; False:C215; "Query([companies];[companies]company code=[orders]company code)")
			
			
			
			
			
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 2; "Product Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 13; "Product Name"; ""; 170; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 3; "Qty"; "#####0"; 30; $_l_NextColumnNumber; False:C215; False:C215; ""; 0; ""; 3)
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 36; "Price Gr"; ""; 50; $_l_NextColumnNumber; False:C215)
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 17; "Inv_No"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 25; "Inv Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 49; "Del No"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 11; "Del Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 25; 24; "Serial No"; ""; 120; $_l_NextColumnNumber; True:C214)
			End if 
		: ($_t_CurrentDefinitionsName="02602")
			If (Count parameters:C259<2)
				$_t_LayoutName:="VIew Jobs"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Job_Code:1); "Job Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Job_Name:2); "Job Name"; ""; 170; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Your_Order_Number:5); "Client Order Nº"; ""; 40; $_l_NextColumnNumber; False:C215; False:C215)  //;False;"";0;"";3)"
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Start_Date:6); "Start Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]End_Date:7); "End Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "State"; ""; 35; 6; False:C215; False:C215)
		: ($_t_CurrentDefinitionsName="02603")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Jobs"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Job_Code:1); "Job Code"; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Job_Name:2); "Job Name"; ""; 170; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Start_Date:6); "Start Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]End_Date:7); "End Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 90; 2; "State"; ""; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]AS_Quoted_Amount:11); "Total Quoted"; "|Accounts"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 26; Field:C253(->[JOBS:26]Project_Code:27); "Project Code"; ""; 1; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02604")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Jobs Table"
			End if 
			$_l_Job:=Table:C252(->[JOBS:26])
			$_t_JobCodeLabel:=Get localized string:C991("JobsFieldNames_JobCode")  //57
			$_t_JobNameLabel:=Get localized string:C991("JobsFieldNames_JobName")  //128
			$_t_JobCompanyCodeLabel:=Get localized string:C991("JobsFieldNames_JobCompany")  //54
			
			
			
			
			
			
			//company name
			$_t_JobStatusLabel:=Get localized string:C991("JobsFieldNames_JobStatus")  //35
			$_t_JobProjectCodeLabel:=Get localized string:C991("JobsFieldNames_JobProjectCode")  //54
			$_t_JobPersonLabel:=Get localized string:C991("JobsFieldNames_JobPerson")  //36
			$_t_JobTypeLabel:=Get localized string:C991("JobsFieldNames_Jobtype")  //35
			$_t_JobtStatusLabel:=Get localized string:C991("JobsFieldNames_JobState")  //35
			$_t_JobStageLabel:=Get localized string:C991("JobsFieldNames_JobStage")  //35
			$_t_StartDateLabel:=Get localized string:C991("JobsFieldNames_JobStartDate")  //57
			$_t_EndDateLabel:=Get localized string:C991("JobsFieldNames_JobEndDate")  //57
			$_t_RequiredDateLabel:=Get localized string:C991("JobsFieldNames_RequiredDate")  //57
			$_t_QuotedAmountLabel:=Get localized string:C991("JobsFieldNames_QuotedAmount")  //57
			$_t_CostAmountlabel:=Get localized string:C991("JobsFieldNames_CostAmount")  //57
			$_t_InvoicedAmountLabel:=Get localized string:C991("JobsFieldNames_InvoicedAmount")  //57
			$_t_AnalysisCodeLabel:=Get localized string:C991("JobsFieldNames_AnalysisCode")  //57
			$_t_currencyCodeLabel:=Get localized string:C991("JobsFieldNames_CurrencyCode")  //57
			$_t_AnalysisCodeLabel:=Get localized string:C991("JobsFieldNames_AnalysisCode")  //57
			$_t_LayerCodeLabel:=Get localized string:C991("JobsFieldNames_LayerCode")  //57
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Job_Code:1); $_t_JobCodeLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Job_Name:2); $_t_JobNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Company_Code:3); $_t_JobCompanyCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 180; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Job_Name:2); $_t_JobtStatuslabel; ""; 35; $_l_NextColumnNumber; False:C215; False:C215; "JOB_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Project_Code:27); $_t_JobProjectCodelabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Person:19); $_t_JobPersonlabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Job_Type:21); $_t_JobTypelabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Stage_Code:18); $_t_JobStagelabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Start_Date:6); $_t_StartDatelabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]End_Date:7); $_t_EndDatelabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Required_Date:8); $_t_RequiredDatelabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]AS_Quoted_Amount:11); $_t_QuotedAmountlabel; "#####0"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]AC_Actual_Cost_Amount:10); $_t_CostAmountlabel; "#####0"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]AS_Invoice_Including_Tax:13); $_t_InvoicedAmountlabel; "#####0"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Analysis_Code:24); $_t_AnalysisCodeLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Job; Field:C253(->[JOBS:26]Layer_Code:26); $_t_LayerCodeLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02701")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12); "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
		: ($_t_CurrentDefinitionsName="02702")  //use only for POs
			
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Ordered"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Ordered Qty"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18); "Received Qty"; "#####0"; 37; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37); "Outstanding Qty"; "#####0"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20); "Purch ord No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21); "Purch Ord Item"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43); "Delivery Reference"; ""; 90; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44); "Expected Date"; ""; 90; $_l_NextColumnNumber; True:C214)
			
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
		: ($_t_CurrentDefinitionsName="02714")  //the default view for stock items-NOW
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12); "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18); "Qty moved"; "#####0"; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18); "Qty Remaining"; "#####0"; 30; $_l_NextColumnNumber; False:C215; False:C215; "[STOCK ITEMS]Quantity-[STOCK ITEMS]CalledOffQuantity")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
			
		: ($_t_CurrentDefinitionsName="02703")  //iSO(Stock receipts)
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Receipt"
			End if 
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Receipt"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Received Qty"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37); "Remaining Stock"; "#####0"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20); "Purchase order No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21); "Purchase Order Item"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
		: ($_t_CurrentDefinitionsName="02704")  //Allocations
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Allocation"
			End if 
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Allocated Qty"; "#####0"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37); "Undelivered Stock"; "#####0"; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
			
			
			
		: ($_t_CurrentDefinitionsName="02705")  //Deliveies
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Deliveries"
			End if 
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45); "Delivery Reference"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Delivered Qty"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
		: ($_t_CurrentDefinitionsName="02706")  //Stock Analysis change
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Analysis Change"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Quantity to Change"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42); "Previous Analysis"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28); "Current Analysis"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02707")  //Stock Layer change
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Layer Change"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Quantity to Change"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41); "Previous Layer"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27); "Current Layer"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02708")  //Stock Layer change
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Layer Change"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Quantity to Change"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41); "Previous Layer"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27); "Current Layer"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			
			
		: ($_t_CurrentDefinitionsName="02709")  //Currency change
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Currency Change"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Quantity to Change"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36); "Previous Currency"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35); "Previous Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Current Currency"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Current Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			
			
		: ($_t_CurrentDefinitionsName="02710")  //Value Adjustments
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock Adjustment Items"
			End if 
			If (Count parameters:C259<2)
				$_t_LayoutName:="Currency Change"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Quantity to Change"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35); "Previous Unit Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); "Total  Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215; False:C215; "STRING([STOCK ITEMS]Quantity*[STOCK ITEMS]xCostOnPrevious)"; 0; ""; 3)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); " Currency"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "New Unit Value"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); "Total New  Value"; "|Accounts"; 50; $_l_NextColumnNumber; False:C215; False:C215; "STRING([STOCK ITEMS]Quantity*[STOCK ITEMS]cost price)"; 0; ""; 3)
			
			
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02711")  //Purchase cancellation
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Purchase Cancellation"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); "Product Code"; ""; 110; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 9; Field:C253(->[PRODUCTS:9]Product_Name:2); "Product Name"; ""; 200; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40); "Cancel Qty"; "#####0"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20); "Purch ord No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21); "Purch Ord Item"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29); "Currency"; ""; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10); "Cost Price"; "|Accounts"; 50; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43); "Delivery Reference"; ""; 90; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44); "Expected Date"; ""; 90; $_l_NextColumnNumber; True:C214)
			
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>=2)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); "Serial No"; ""; 90; $_l_NextColumnNumber; True:C214)  //;False;"";0;"";3)"
				
				
				
				
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); "Location"; ""; 45; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); "Name"; ""; 80; $_l_NextColumnNumber; False:C215)
			//The next four columns should hide unless any of the PO'd quantity is allocated
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); "SO Number"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); "SO Item "; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 27; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2); "Company"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); "Name"; ""; 250; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			
			
		: ($_t_CurrentDefinitionsName="02714")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Stock items view"
			End if 
			$_l_StockItemsTable:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
			
			$_t_StockMovementCodeLabel:=Get localized string:C991("StockItemFieldNames_MovementCode")
			$_t_StockProductCodeLabel:=Get localized string:C991("StockItemFieldNames_ProductsCode")
			$_t_StkQuantityLabel:=Get localized string:C991("StockItemFieldNames_Quantity")
			$_t_StkValueLabel:=Get localized string:C991("StockItemFieldNames_TotalValue")
			$_t_StkSerialLabel:=Get localized string:C991("StockItemFieldNames_Serial")
			$_t_StkQuantityLabel:=Get localized string:C991("StockItemFieldNames_Quantity")
			$_t_StkCompanyLabel:=Get localized string:C991("StockItemFieldNames_CompanySales")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			
			$_t_StkSOLabel:=Get localized string:C991("StockItemFieldNames_OrderCodeSales")
			$_t_StkSOILabel:=Get localized string:C991("StockItemFieldNames_OrderitemSales")
			
			$_t_StkPOLabel:=Get localized string:C991("StockItemFieldNames_OrderCodePurchase")
			$_t_StkPOILabel:=Get localized string:C991("StockItemFieldNames_OrderitemPurchase")
			
			$_t_StkNoLabel:=Get localized string:C991("StockItemFieldNames_StockReference")
			$_t_StkLocationLabel:=Get localized string:C991("StockItemFieldNames_StockLocationCode")
			$_t_StkLocationNameLabel:=Get localized string:C991("LocationFieldNames_LocationName")
			$_t_DateReceivedLabel:=Get localized string:C991("StockItemFieldNames_DateRecieved")
			$_t_DateShippedLabel:=Get localized string:C991("StockItemFieldNames_DateShipped")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11); $_t_StockMovementCodeLabel; ""; 78; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1); $_t_StockProductCodeLabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_t_ProductNameLabel:=Get localized string:C991("ProductsFieldNames_ProductName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Name:2); $_t_ProductNameLabel; ""; 144; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12); $_t_StkQuantityLabel; ""; 51; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); $_t_StkValueLabel; "|accounts"; 51; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3); $_t_StkSOLabel; ""; 58; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8); $_t_StkSOILabel; ""; 58; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20); $_t_StkPOLabel; ""; 58; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21); $_t_StkPOILabel; ""; 58; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9); $_t_StkNoLabel; ""; 46; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7); $_t_StkLocationLabel; ""; 46; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); $_t_StkLocationNameLabel; ""; 100; $_l_NextColumnNumber; False:C215)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4); $_t_StkSerialLabel; ""; 110; $_l_NextColumnNumber; False:C215)
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Received:5); $_t_DateReceivedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockItemsTable; Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6); $_t_DateShippedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="14301")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Product Stock Count"
			End if 
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS10_StockTypes"; "Stock Type"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_apic_ExpandedLocations"; "Location Display Level"; ""; 150; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_ExpandedLocationLevel"; "Exp level"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS255_LocationCode"; "Location"; ""; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_LocationID"; "Location ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS10_STKLayerCode"; "Layer Code"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS10_STKAnalCode"; "Analysis Code"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_at_SerialNumber"; "Serial Number"; ""; 150; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_at_StockBatchRef"; "Batch Reference"; ""; 150; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_StockQuantity"; "Quantity "; "#####0.00"; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS10_STKCurrencyCode"; "Currency"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_UnitValue"; "Unit Cost"; "#####0.00"; 80; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_ThreadRowIndex"; "2D Row NUm"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_ThreadRowIndex"; "2D Row NUm"; ""; 0; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="02201")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Problems Table"
			End if 
			$_l_TableNumView:=Table:C252(->[PROBLEMS:22])  //
			
			
			$_t_ProblemCodeLabel:=Get localized string:C991("ProblemFieldNames_Code")
			$_t_ProblemNameLabel:=Get localized string:C991("ProblemFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PROBLEMS:22]Problem_Code:1); $_t_ProblemCodeLabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PROBLEMS:22]Problem_Name:2); $_t_ProblemNameLabel; ""; 296; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02807")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Price Table"
			End if 
			$_l_TableNumView:=Table:C252(->[PRICE_TABLE:28])
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Product_Code:1); "Product Code"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Group_Code:6); "Group  Code"; ""; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Brand_Code:7); "Brand Code"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Price_Code:2); "Price Group"; ""; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Price_Discount:3); "Price/DIscount"; ""; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Company_Code:8); "For Company"; ""; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Currency_Code:13); "For Currency"; ""; 80; $_l_NextColumnNumber; True:C214)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_TableNumView;Field(->[PRICE TABLE]DateFrom);"Valid From";"";80;$_l_NextColumnNumber;True)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_TableNumView;Field(->[PRICE TABLE]DateTo);"Valid to";"";80;$_l_NextColumnNumber;True)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Quantity_From:9); "Quantity from"; ""; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Quantity_To:10); "Quantity to"; ""; 80; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="02809")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Price Table"
			End if 
			//TRACE
			$_l_TableNumView:=Table:C252(->[PRICE_TABLE:28])
			$_t_PriceCodeLLabel:=Get localized string:C991("PriceTableFieldNames_PriceCode")  //59
			$_t_PriceGroupLabel:=Get localized string:C991("PriceTableFieldNames_PriceGroup")  //36
			$_t_PriceCatalogueLabel:=Get localized string:C991("PriceTableFieldNames_PriceCatalogue")  //
			$_t_ProductGroupLabel:=Get localized string:C991("PriceTableFieldNames_ProductGroup")  //37
			$_t_ProductBrandLabel:=Get localized string:C991("PriceTableFieldNames_ProductBrand")  //37
			$_t_ProductCodelabel:=Get localized string:C991("PriceTableFieldNames_ProductCode")  //57
			$_t_CompanyCodeLabel:=Get localized string:C991("PriceTableFieldNames_CompanyCode")  //57
			$_t_currencyCodeLabel:=Get localized string:C991("PriceTableFieldNames_Currency")  //34
			$_t_PriceLabel:=Get localized string:C991("PriceTableFieldNames_Price")  //64 `use a calculation
			$_t_Discountlabel:=Get localized string:C991("PriceTableFieldNames_Discount")  //34
			$_t_DateFromLabel:=Get localized string:C991("PriceTableFieldNames_DateFrom")  //34
			$_t_DatetoLabel:=Get localized string:C991("PriceTableFieldNames_DateTo")  //34
			$_t_GroupsLabel:=Get localized string:C991("PriceGroupFieldNames_GroupName")  //59
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			//table
			$_t_ProductGroupNameLabel:=Get localized string:C991("ProductGroupFieldNames_GroupName")  //170
			$_t_ProductBrandNameLabel:=Get localized string:C991("ProductBrandFieldNames_BrandName")  //170
			
			
			
			
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")  //170
			
			
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;Table(->[COMPANIES]);Field(->[COMPANIES]Company Name);$_t_CoNameLabel;"";106;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Table_Code:12); $_t_PriceCodeLabel; ""; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Price_Code:2); $_t_PriceGroupLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRICE_GROUPS:18]); Field:C253(->[PRICE_GROUPS:18]Price_Name:2); $_t_GroupsLabel; ""; 106; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Group_Code:6); $_t_ProductGroupLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCT_GROUPS:10]); Field:C253(->[PRODUCT_GROUPS:10]Group_Name:2); $_t_ProductGroupNameLabel; ""; 176; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Brand_Code:7); $_t_ProductBrandLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCT_BRANDS:8]); Field:C253(->[PRODUCT_BRANDS:8]Brand_Name:2); $_t_ProductBrandNameLabel; ""; 176; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Product_Code:1); $_t_ProductGroupLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_t_ProductNameLabel:=Get localized string:C991("ProductsFieldNames_ProductName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Name:2); $_t_ProductNameLabel; ""; 144; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Company_Code:8); $_t_CompanyCodeLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Currency_Code:13); $_t_CurrencyCodeLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Price_Discount:3); $_t_PriceLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "PT_Price")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[PRICE_TABLE:28]Price_Discount:3); $_t_DiscountLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "PT_Discount")
			
		: ($_t_CurrentDefinitionsName="02901")  //Transactions
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Transactions Table"
			End if 
			$_l_TableNumView:=Table:C252(->[TRANSACTIONS:29])
			
			
			$_t_BatchNoLabel:=Get localized string:C991("TransactionFieldNames_BatchNo")
			$_t_TransCodeLabel:=Get localized string:C991("TransactionFieldNames_TransCode")
			$_t_AccountCodeLabel:=Get localized string:C991("TransactionFieldNames_AccountCode")
			$_t_AnalysisCodeLabel:=Get localized string:C991("TransactionFieldNames_AnalysisCode")
			$_t_CompanyCodeLabel:=Get localized string:C991("TransactionFieldNames_CompanyCode")
			$_t_ChequeNoLabel:=Get localized string:C991("TransactionFieldNames_ChequeNo")
			$_t_LayerCodeLabel:=Get localized string:C991("TransactionFieldNames_LayerCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("TransactionFieldNames_CurrencyCode")
			$_t_dateLabel:=Get localized string:C991("TransactionFieldNames_Date")
			$_t_PeriodCodelabel:=Get localized string:C991("TransactionFieldNames_PeriodCode")
			$_t_AmountLabel:=Get localized string:C991("TransactionFieldNames_Amount")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("TransactionFieldNames_TaxCode")
			$_t_taxIOLabel:=Get localized string:C991("TransactionFieldNames_TaxIO")
			$_t_taxUKECLabel:=Get localized string:C991("TransactionFieldNames_UKEC")
			$_t_TaxAmountLabel:=Get localized string:C991("TransactionFieldNames_TaxAmount")
			$_t_TotalLabel:=Get localized string:C991("TransactionFieldNames_Total")
			$_t_DescriptionLabel:=Get localized string:C991("TransactionFieldNames_Description")
			$_t_invoiceNumberLabel:=Get localized string:C991("TransactionFieldNames_InvoiceNo")
			$_t_PCodeLabel:=Get localized string:C991("TransactionFieldNames_PurchaseCode")
			$_t_JobCodeLabel:=Get localized string:C991("TransactionFieldNames_JobCode")
			$_t_PInvoiceNoLabel:=Get localized string:C991("TransactionFieldNames_PurchInvoiceNo")
			$_t_OtherSIdeLabel:=Get localized string:C991("TransactionFieldNames_OtherSideNote")
			$_t_TaxPeriodLabel:=Get localized string:C991("TransactionFieldNames_TaxPeriod")
			$_t_ReconcilledLabel:=Get localized string:C991("TransactionFieldNames_Reconciled")
			$_t_ReconcilRefLabel:=Get localized string:C991("TransactionFieldNames_ReconciliationReference")
			$_t_CompanyNameLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_AccountNamelabel:=Get localized string:C991("AccountsFieldNames_AccountName")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Batch_Number:7); $_t_BatchNoLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Transaction_Type_Code:1); $_t_TransCodeLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Account_Code:3); $_t_AccountCodeLabel; ""; 43; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ACCOUNTS:32]); Field:C253(->[ACCOUNTS:32]Account_Name:3); $_t_AccountNameLabel; ""; 94; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Analysis_Code:2); $_t_AnalysisCodeLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Company_Code:9); $_t_CompanyCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CompanyNameLabel; ""; 111; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Cheque_Number:13); $_t_ChequeNoLabel; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Layer_Code:23); $_t_LayerCodeLabel; ""; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Currency_Code:22); $_t_CurrencyCodeLabel; ""; 29; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Trans_Date:5); $_t_DateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Period_Code:12); $_t_PeriodCOdeLabel; ""; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Amount:6); $_t_AmountLabel; "|Accounts"; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Code:20); $_t_TaxCodeLabel; ""; 1; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]IO:18); $_t_TaxIOLabel; ""; 15; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]UK_EC:21); $_t_taxUKECLabel; ""; 11; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Amount:16); $_t_TaxAmountLabel; "|Accounts"; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Total:17); $_t_TotalLabel; "|Accounts"; 79; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Total:17); $_t_TotalLabel; "|Accounts"; 79; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Description:8); $_t_DescriptionLabel; ""; 145; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Invoice_Number:4); $_t_InvoiceNumberLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Purchase_invoice_number:19); $_t_PInvoiceNoLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Purchase_Code:24); $_t_PCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Job_Code:25); $_t_JobCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Other_Side:15); $_t_OtherSIdeLabel; ""; 167; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Period:27); $_t_TaxPeriodLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Reconciled:14); $_t_ReconilledLabel; ""; 39; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Reconciliation_Reference:33); $_t_ReconcilRefLabel; ""; 187; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="02902")  //Transactions
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Unreconcilled Transactions "
			End if 
			$_l_TableNumView:=Table:C252(->[TRANSACTIONS:29])
			
			
			$_t_BatchNoLabel:=Get localized string:C991("TransactionFieldNames_BatchNo")
			$_t_TransCodeLabel:=Get localized string:C991("TransactionFieldNames_TransCode")
			$_t_AccountCodeLabel:=Get localized string:C991("TransactionFieldNames_AccountCode")
			$_t_AnalysisCodeLabel:=Get localized string:C991("TransactionFieldNames_AnalysisCode")
			$_t_CompanyCodeLabel:=Get localized string:C991("TransactionFieldNames_CompanyCode")
			$_t_ChequeNoLabel:=Get localized string:C991("TransactionFieldNames_ChequeNo")
			$_t_LayerCodeLabel:=Get localized string:C991("TransactionFieldNames_LayerCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("TransactionFieldNames_CurrencyCode")
			$_t_dateLabel:=Get localized string:C991("TransactionFieldNames_Date")
			$_t_PeriodCodelabel:=Get localized string:C991("TransactionFieldNames_PeriodCode")
			$_t_AmountLabel:=Get localized string:C991("TransactionFieldNames_Amount")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("TransactionFieldNames_TaxCode")
			$_t_taxIOLabel:=Get localized string:C991("TransactionFieldNames_TaxIO")
			$_t_taxUKECLabel:=Get localized string:C991("TransactionFieldNames_UKEC")
			$_t_TaxAmountLabel:=Get localized string:C991("TransactionFieldNames_TaxAmount")
			$_t_TotalLabel:=Get localized string:C991("TransactionFieldNames_Total")
			$_t_DescriptionLabel:=Get localized string:C991("TransactionFieldNames_Description")
			$_t_invoiceNumberLabel:=Get localized string:C991("TransactionFieldNames_InvoiceNo")
			$_t_PCodeLabel:=Get localized string:C991("TransactionFieldNames_PurchaseCode")
			$_t_JobCodeLabel:=Get localized string:C991("TransactionFieldNames_JobCode")
			$_t_PInvoiceNoLabel:=Get localized string:C991("TransactionFieldNames_PurchInvoiceNo")
			$_t_OtherSIdeLabel:=Get localized string:C991("TransactionFieldNames_OtherSideNote")
			$_t_TaxPeriodLabel:=Get localized string:C991("TransactionFieldNames_TaxPeriod")
			$_t_ReconcilledLabel:=Get localized string:C991("TransactionFieldNames_Reconciled")
			$_t_ReconcilRefLabel:=Get localized string:C991("TransactionFieldNames_ReconciliationReference")
			$_t_CompanyNameLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_AccountNamelabel:=Get localized string:C991("AccountsFieldNames_AccountName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Reconciled:14); $_t_ReconilledLabel; ""; 39; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Reconciliation_Reference:33); $_t_ReconcilRefLabel; ""; 187; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Batch_Number:7); $_t_BatchNoLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Transaction_Type_Code:1); $_t_TransCodeLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Account_Code:3); $_t_AccountCodeLabel; ""; 43; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ACCOUNTS:32]); Field:C253(->[ACCOUNTS:32]Account_Name:3); $_t_AccountNameLabel; ""; 94; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Analysis_Code:2); $_t_AnalysisCodeLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Company_Code:9); $_t_CompanyCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CompanyNameLabel; ""; 111; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Cheque_Number:13); $_t_ChequeNoLabel; ""; 45; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Layer_Code:23); $_t_LayerCodeLabel; ""; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Currency_Code:22); $_t_CurrencyCodeLabel; ""; 29; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Trans_Date:5); $_t_DateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Period_Code:12); $_t_PeriodCOdeLabel; ""; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Amount:6); $_t_AmountLabel; "|Accounts"; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Code:20); $_t_TaxCodeLabel; ""; 1; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]IO:18); $_t_TaxIOLabel; ""; 15; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]UK_EC:21); $_t_taxUKECLabel; ""; 11; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Amount:16); $_t_TaxAmountLabel; "|Accounts"; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Total:17); $_t_TotalLabel; "|Accounts"; 79; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Total:17); $_t_TotalLabel; "|Accounts"; 79; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Description:8); $_t_DescriptionLabel; ""; 145; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Invoice_Number:4); $_t_InvoiceNumberLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Purchase_invoice_number:19); $_t_PInvoiceNoLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Purchase_Code:24); $_t_PCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Job_Code:25); $_t_JobCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Other_Side:15); $_t_OtherSIdeLabel; ""; 167; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumView; Field:C253(->[TRANSACTIONS:29]Tax_Period:27); $_t_TaxPeriodLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="03003")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Trans Journal Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Type"; ""; 40; $_l_NextColumnNumber; True:C214; True:C214; "Trans Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Description"; ""; 115; $_l_NextColumnNumber; True:C214; True:C214; "Desc")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Debit"; ""; 40; $_l_NextColumnNumber; True:C214; False:C215; "Debit Acc")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Credit"; ""; 40; $_l_NextColumnNumber; True:C214; False:C215; "Credit Acc")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Amount"; "|Accounts"; 80; $_l_NextColumnNumber; True:C214; False:C215; "Amount"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Tax"; ""; 26; $_l_NextColumnNumber; True:C214; False:C215; "Tax Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Tax Amount"; "|Accounts"; 80; $_l_NextColumnNumber; True:C214; False:C215; "Tax Amount"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Total"; "|Accounts"; 80; $_l_NextColumnNumber; True:C214; False:C215; "Total"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Date"; ""; 64; $_l_NextColumnNumber; True:C214; False:C215; "Trans_Date")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Period"; ""; 45; $_l_NextColumnNumber; True:C214; False:C215; "Period Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Cheque No"; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "Cheque No")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Analysis"; ""; 47; $_l_NextColumnNumber; True:C214; False:C215; "Analysis Code")
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Curr"; ""; 35; $_l_NextColumnNumber; True:C214; False:C215; "Currency Code")
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Layer"; ""; 35; $_l_NextColumnNumber; True:C214; False:C215; "Layer Code")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "DB IO"; ""; 25; $_l_NextColumnNumber; True:C214; False:C215; "Debit IO")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "CR IO"; ""; 25; $_l_NextColumnNumber; True:C214; False:C215; "Credit IO")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "UE"; ""; 20; $_l_NextColumnNumber; True:C214; False:C215; "UK EC")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Company"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215; "Company Code")
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 30; 2; "Job"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215; "Job Code")
			End if 
		: ($_t_CurrentDefinitionsName="03004")  //Transaction batches out
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Transaction Batches"
			End if 
			$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
			$_t_BatchNoLabel:=Get localized string:C991("TransInFieldNames_BatchNo")
			$_t_StatusLabel:=Get localized string:C991("TransInFieldNames_BatchStatus")
			$_t_BatchdateLabel:=Get localized string:C991("TransInFieldNames_BatchDate")
			$_t_EntrydateLabel:=Get localized string:C991("TransInFieldNames_EntryDate")
			$_t_PostedDateLabel:=Get localized string:C991("TransInFieldNames_PostedDate")
			$_t_AmountLabel:=Get localized string:C991("TransInFieldNames_BatchAmount")
			$_t_TaxAmountLabel:=Get localized string:C991("TransInFieldNames_BatchTaxAmount")
			$_t_TotalAmountLabel:=Get localized string:C991("TransInFieldNames_BatchTotalAmount")
			$_t_DescriptionLabel:=Get localized string:C991("TransInFieldNames_BatchDescription")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10); $_t_BatchNoLabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Description:12); $_t_StatusLabel; ""; 65; $_l_NextColumnNumber; False:C215; False:C215; "SetTransinStatus")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Batch_Date:1); $_t_BatchdateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Entry_Date:6); $_t_EntrydateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Posted_Date:16); $_t_PostedDateRefLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Batch_Amount:3); $_t_AmountLabel; "|Accounts"; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Batch_Tax:4); $_t_TaxAmountLabel; "|Accounts"; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Batch_Total:5); $_t_TotalAmountLabel; "|Accounts"; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_BATCHES:30]Description:12); $_t_DescriptionLabel; ""; 286; $_l_NextColumnNumber; False:C215)
			
			
			
		: ($_t_CurrentDefinitionsName="03101")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Transaction Types"
			End if 
			
			$_l_TableNumber:=Table:C252(->[TRANSACTION_TYPES:31])
			$_t_TransCodeLabel:=Get localized string:C991("TransTypeFieldNames_TransactionTypeCode")
			$_t_TransNameLabel:=Get localized string:C991("TransTypeFieldNames_TransactionTypeName")
			$_t_DebitAccCodeLabel:=Get localized string:C991("TransTypeFieldNames_DebitAccCode")
			$_t_CreditAccCodeLabel:=Get localized string:C991("TransTypeFieldNames_CreditAccCode")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("TransTypeFieldNames_TaxCode")
			$_t_AnalcodeLabel:=Get localized string:C991("TransTypeFieldNames_AnalCode")
			$_t_LayerCodeLabel:=Get localized string:C991("TransTypeFieldNames_LayerCode")
			$_t_currencyCodeLabel:=Get localized string:C991("TransTypeFieldNames_CurrencyCode")
			$_t_drangFromLabel:=Get localized string:C991("TransTypeFieldNames_DebitRangeFrom")
			$_t_drangToLabel:=Get localized string:C991("TransTypeFieldNames_DebitRangeTo")
			$_t_CrangFromLabel:=Get localized string:C991("TransTypeFieldNames_CreditRangeFrom")
			$_t_CrangToLabel:=Get localized string:C991("TransTypeFieldNames_CreditRangeTo")
			$_t_FullAccessLabel:=Get localized string:C991("TransTypeFieldNames_FullAccess")
			$_t_PhantomLabel:=Get localized string:C991("TransTypeFieldNames_PhantomTransactionType")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1); $_t_TransCodeLabel; ""; 43; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Name:2); $_t_TransNameLabel; ""; 172; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Debit_Account:4); $_t_DebitAccCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Credit_Account:5); $_t_CreditAccCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Tax_Code:6); $_t_TaxCodeLabel; ""; 27; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Analysis_Code:7); $_t_AnalcodeLabel; ""; 39; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Layer_Code:16); $_t_LayerCodeLabel; ""; 39; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Currency_Code:17); $_t_CurrencyCodeLabel; ""; 39; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]D_Range_F:9); $_t_drangFromLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]D_Range_T:10); $_t_drangToLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]C_Range_F:11); $_t_crangFromLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]C_Range_T:12); $_t_crangToLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Full_Access:15); $_t_FullAccessLabel; ""; 25; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TRANSACTION_TYPES:31]Full_Access:15); $_t_PhantomLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03301")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Accounting Periods"
			End if 
			$_l_TaxTableNum:=Table:C252(->[TAX_CODES:35])
		: ($_t_CurrentDefinitionsName="03401")  //account balances
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View account Balances"
			End if 
			$_l_AccountBalances:=Table:C252(->[ACCOUNT_BALANCES:34])
			$_l_Accounts:=Table:C252(->[ACCOUNTS:32])
			
			//Account code
			//Account name
			//analysis code
			//period code
			//layer code
			//currency
			//balance
			
			
			$_t_AccountCodeLabel:=Get localized string:C991("AccountBalancesFieldNames_AccountCode")
			$_t_AccountNamelabel:=Get localized string:C991("AccountsFieldNames_AccountName")
			$_t_AnalysisCodeLabel:=Get localized string:C991("AccountBalancesFieldNames_AnalysisCode")
			
			$_t_PeriodCodelabel:=Get localized string:C991("AccountBalancesFieldNames_PeriodCode")
			$_t_LayerCodeLabel:=Get localized string:C991("AccountBalancesFieldNames_LayerCode")
			$_t_currencyCodeLabel:=Get localized string:C991("AccountBalancesFieldNames_CurrencyCode")
			$_t_BalanceLabel:=Get localized string:C991("AccountBalancesFieldNames_Balance")
			$_t_IDLabel:=Get localized string:C991("AccountBalancesFieldNames_ID")
			//tax code 54
			//tax name 242
			//tax rate 62
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]x_ID:7); $_t_IDlabel; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Account_Code:2); $_t_AccountCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Accounts; Field:C253(->[ACCOUNTS:32]Account_Name:3); $_t_AccountNamelabel; ""; 242; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Analysis_Code:1); $_t_AnalysisCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Period_Code:4); $_t_PeriodCodelabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Layer_Code:5); $_t_LayerCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Currency_Code:6); $_t_CurrencyCodeLabel; ""; 62; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AccountBalances; Field:C253(->[ACCOUNT_BALANCES:34]Balance:3); $_t_BalanceLabel; "|accounts"; 150; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03501")  //tax codes
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Tax Codes"
			End if 
			$_l_TaxTableNum:=Table:C252(->[TAX_CODES:35])
			
			$_t_TaxCodeLabelLabel:=Get localized string:C991("TaxCodesFieldNames_TaxCode")
			$_t_TaxNameLabel:=Get localized string:C991("TaxCodesFieldNames_TaxName")
			$_t_TaxRateLabel:=Get localized string:C991("TaxCodesFieldNames_TaxRate")
			//tax code 54
			//tax name 242
			//tax rate 62
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TaxTableNum; Field:C253(->[TAX_CODES:35]Tax_Code:1); $_t_TaxCodeLabel; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TaxTableNum; Field:C253(->[TAX_CODES:35]Tax_Name:2); $_t_TaxNameLabel; ""; 242; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TaxTableNum; Field:C253(->[TAX_CODES:35]Tax_Rate:3); $_t_TaxRateLabel; "###,##0.00%"; 62; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="03601")  //analyss codes
			
			
			//analysis code
			//analysis name
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Analysis Codes"
			End if 
			$_l_AnalTableNum:=Table:C252(->[ANALYSES:36])
			
			$_t_AnalysisCodeLabel:=Get localized string:C991("AnalysisFieldNames_AnalysisCode")
			$_t_AnalysisNameLabel:=Get localized string:C991("AnalysisFieldNames_AnalysisName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AnalTableNum; Field:C253(->[ANALYSES:36]Analysis_Code:1); $_t_AnalysisCodeLabel; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_AnalTableNum; Field:C253(->[ANALYSES:36]Analysis_Name:2); $_t_AnalysisNameLabel; ""; 242; $_l_NextColumnNumber; True:C214)
			
			
		: ($_t_CurrentDefinitionsName="03703")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Qty"; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Price 2"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Cost Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "C"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Tax"; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "Tax Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Tax Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "Tax Amount"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Total Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "Total Amount"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Purch Acc"; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "Purchase Acc")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Analysis"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "Analysis Code")
			If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; 11; "Purch Ord"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "Our Order No")
			End if 
		: ($_t_CurrentDefinitionsName="03704")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA PL Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); "Purchase Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4); "Supplier Inv_No"; ""; 85; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Invoice_Date:5); "Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Invoiced:7); "Amount"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Paid:8); "Paid"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Due:9); "Due"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Due_Date:17); "Due Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]State:24); "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)  //"PI_States")
			
			
		: ($_t_CurrentDefinitionsName="03706")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Purchase Invoice Items"
			End if 
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_AS20_PISupplierCode"; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PIcodes"; "PI Code"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PINumber"; "PI Number"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_PIDate"; "PI Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PiCostAmount"; "Original Amount"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PiCostPrice"; "Cost Price"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS5_PITaxCode"; "Tax Code"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PITaxamount"; "Tax Amount"; "#####0.00"; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PITotalAmount"; "Total Amount"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PIQuantity"; "Quantity"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PIPricePer"; "Price Per"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PiPONUmber"; "Purchase order No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PiOIItemNUmber"; "Sales Order item No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PiIDS"; "Purchase Item ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PIItemID"; "Item ID Date"; ""; 0; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="03707")
			//
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_AS20_PISupplierCode"; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PIcodes"; "PI Code"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PINumber"; "PI Number"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_PIDate"; "PO Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PiCostPrice"; "Cost Price"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PiCostAmount"; "Cost Amount"; "#####0.00"; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS5_PITaxCode"; "Tax Code"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PITaxamount"; "Tax Amount"; "#####0.00"; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PITotalAmount"; "Total Amount"; "#####0.00"; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PIQuantity"; "Invoiced Quantity"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PIPricePer"; "Price per Quantity"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PiOIItemNUmber"; "Order Item No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_PiPONUmber"; "Purchase Ord No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PIItemID"; "PO item ID"; ""; 0; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_PiIDS"; "PO ID"; ""; 0; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="03708")  //purchases view
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Purchase Invoice Table"
			End if 
			$_l_JournalTable:=Table:C252(->[PURCHASE_INVOICES:37])
			
			
			$_t_CompanyCodeLabel:=Get localized string:C991("PurchasesFieldNames_CompanyCode")
			$_t_PurchasesCodeLabel:=Get localized string:C991("PurchasesFieldNames_PurchaseCode")
			$_t_PINumberLabel:=Get localized string:C991("PurchasesFieldNames_InvoiceNo")
			$_t_StatusLabel:=Get localized string:C991("PurchasesFieldNames_Status")
			$_t_DateLabel:=Get localized string:C991("PurchasesFieldNames_Date")
			$_t_PeriodLabel:=Get localized string:C991("PurchasesFieldNames_Period")
			$_t_CurrencyLabel:=Get localized string:C991("PurchasesFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("PurchasesFieldNames_TotalInvoiced")
			$_t_TotalPaidLabel:=Get localized string:C991("PurchasesFieldNames_TotalPaid")
			$_t_TotalDueLabel:=Get localized string:C991("PurchasesFieldNames_TotalDue")
			$_t_DueDateLabel:=Get localized string:C991("PurchasesFieldNames_DueDate")
			$_t_AgeLabel:=Get localized string:C991("PurchasesFieldNames_Age")
			$_t_OverdueLabel:=Get localized string:C991("PurchasesFieldNames_Overdue")
			$_t_AnalysisLabel:=Get localized string:C991("PurchasesFieldNames_Analysis")
			$_t_LayerLabel:=Get localized string:C991("PurchasesFieldNames_Layer")
			$_t_CreditStageLabel:=Get localized string:C991("PurchasesFieldNames_CreditStage")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); $_t_PurchasesCodeLabel; ""; 59; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Company_Code:2); $_t_CompanyCodeLabel; ""; 68; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 106; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4); $_t_PINumberLabel; ""; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); $_t_StatusLabel; ""; 56; $_l_NextColumnNumber; False:C215; False:C215; "PI_GetStatus")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Invoice_Date:5); $_t_DateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Period_Code:3); $_t_PeriodLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Currency_Code:23); $_t_CurrencyLabel; ""; 26; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Total_Invoiced:7); $_t_TotalInvoicedLabel; "#####0.00"; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Total_Paid:8); $_t_TotalPaidLabel; "#####0.00"; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Total_Due:9); $_t_TotalDueLabel; "#####0.00"; 56; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Due_Date:17); $_t_DueDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Company_Code:2); $_t_ageLabel; ""; 50; $_l_NextColumnNumber; False:C215; False:C215; "PI_GetAge")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Company_Code:2); $_t_ageLabel; ""; 50; $_l_NextColumnNumber; False:C215; False:C215; "PI_GetOverdue")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Analysis_Code:15); $_t_AnalysisLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Layer_Code:28); $_t_LayerLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[PURCHASE_INVOICES:37]Credit_Stage:34); $_t_CreditStageLabel; ""; 53; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="03801")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Recurring Jounals table"
			End if 
			$_l_JournalTable:=Table:C252(->[RECURRING_JOURNALS:38])
			
			$_t_JournalsTypeLabel:=Get localized string:C991("JournalsFieldNames_TransCode")
			$_t_JournalsDescLabel:=Get localized string:C991("JournalsFieldNames_Descriptions")
			$_t_JournalsCompanyLabel:=Get localized string:C991("JournalsFieldNames_CompanyCode")
			$_t_JournalsAmountLabel:=Get localized string:C991("JournalsFieldNames_Amount")
			
			$_t_JournalsCopyBatchLabel:=Get localized string:C991("JournalsFieldNames_Copybatch")
			$_t_JournalsDateStartedLabel:=Get localized string:C991("JournalsFieldNames_DateStarted")
			$_t_JournalsNextDateLabel:=Get localized string:C991("JournalsFieldNames_NextDate")
			
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_DebitAccCodeLabel:=Get localized string:C991("TransTypeFieldNames_DebitAccCode")
			$_t_CreditAccCodeLabel:=Get localized string:C991("TransTypeFieldNames_CreditAccCode")
			
			$_t_AnalcodeLabel:=Get localized string:C991("TransTypeFieldNames_AnalCode")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Transaction_Type_Code:2); $_t_JournalsTypeLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Description:5); $_t_JournalsDescLabel; ""; 103; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Company_Code:1); $_t_JournalsCompanyLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 107; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Amount:6); $_t_JournalsAmountLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[TRANSACTION_TYPES:31]); Field:C253(->[TRANSACTION_TYPES:31]Debit_Account:4); $_t_DebitAccCodeLabel; ""; 29; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[TRANSACTION_TYPES:31]); Field:C253(->[TRANSACTION_TYPES:31]Credit_Account:5); $_t_CreditAccCodeLabel; ""; 29; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[TRANSACTION_TYPES:31]); Field:C253(->[TRANSACTION_TYPES:31]Analysis_Code:7); $_t_AnalcodeLabel; ""; 29; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Copy_Batch:13); $_t_JournalsCopyBatchLabel; ""; 63; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Date_Started:3); $_t_JournalsDateStartedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JournalTable; Field:C253(->[RECURRING_JOURNALS:38]Date_Started:3); $_t_JournalsDateStartedLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "TRANS_GetNextJournalDate")
		: ($_t_CurrentDefinitionsName="04001")  //stock movements
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Stock Movements_List"
			End if 
			$_l_StockMovementsTable:=Table:C252(->[STOCK_MOVEMENTS:40])
			$_t_MovementTypeLabel:=Get localized string:C991("StockMoveFieldNames_Type")
			$_t_MovementTypeNameLabel:=Get localized string:C991("MovementTypesFieldNames_TypeName")
			$_t_MovementTypeNoLabel:=Get localized string:C991("StockMoveFieldNames_TypeNo")
			$_t_MovementSourceRefLabel:=Get localized string:C991("StockMoveFieldNames_SourceRef")
			$_t_MovementDateLabel:=Get localized string:C991("StockMoveFieldNames_MovementDate")
			$_t_PostedtDateLabel:=Get localized string:C991("StockMoveFieldNames_PostedDate")
			$_t_MovementCodeLabel:=Get localized string:C991("StockMoveFieldNames_MovementCode")
			$_t_CompanyCodeLabel:=Get localized string:C991("StockMoveFieldNames_CompanyCode")
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_t_LayerCodeLabel:=Get localized string:C991("StockMoveFieldNames_LayerCode")
			$_t_AnalysisCodeLabel:=Get localized string:C991("StockMoveFieldNames_AnalysisCode")
			$_t_currencyCodeLabel:=Get localized string:C991("StockMoveFieldNames_CurrencyCode")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Type:6); $_t_MovementTypeLabel; ""; 41; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[MOVEMENT_TYPES:60]); Field:C253(->[MOVEMENT_TYPES:60]Type_Name:2); $_t_MovementTypeNameLabel; ""; 168; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Type_Number:4); $_t_MovementTypeNoLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]MovementSourceReference:18); $_t_MovementSourceRefLabel; ""; 49; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Date:5); $_t_MovementDateRefLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Posted_Date:7); $_t_PostedDateRefLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1); $_t_MovementCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Company_From:2); $_t_CompanyCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 141; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Analysis_Code:9); $_t_AnalysisCodeLabel; ""; 49; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Currency_Code:10); $_t_CurrencyCodeLabel; ""; 49; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockMovementsTable; Field:C253(->[STOCK_MOVEMENTS:40]Layer_Code:11); $_t_LayerCodeLabel; ""; 49; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="04501")  //stages(job stages)
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Stage View"
			End if 
			$_t_StageCodeLabel:=Get localized string:C991("StageFieldNames_Code")
			$_t_StageNameLabel:=Get localized string:C991("StageFieldNames_Name")
			$_t_AccountLabel:=Get localized string:C991("StageFieldNames_Account")
			$_t_AnalysisLabel:=Get localized string:C991("StageFieldNames_Analysis")
			$_l_JobStageTable:=Table:C252(->[STAGES:45])
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStageTable; Field:C253(->[STAGES:45]Stage_Code:1); $_t_StageCodeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStageTable; Field:C253(->[STAGES:45]Stage_Name:2); $_t_StageNameLabel; ""; 262; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStageTable; Field:C253(->[STAGES:45]Sales_Account:3); $_t_AccountLabel; ""; 90; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStageTable; Field:C253(->[STAGES:45]Analysis_Code:4); $_t_AnalysisLabel; ""; 90; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="15803")
			If (Count parameters:C259<2)
				$_t_LayoutName:="purchase`invoice Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17); "Product Code"; ""; 0; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16); "Product Name"; ""; 0; $_l_NextColumnNumber; True:C214; False:C215; "")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1); "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Description:13); "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2); "Qty"; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15); "Price 2"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); "Cost Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5); "Tax"; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "Tax Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); "Tax Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); "Total Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8); "Purch Acc"; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9); "Analysis"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "")
			If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11); "Purch Ord"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
		: ($_t_CurrentDefinitionsName="15804")
			//there is no current output form for purchase items
			//Purchase code
			//Purchase invoice number
			//`product code
			//product descripton
			//quantity
			$_l_PITable:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			$_t_PIPiCodeLabel:=Get localized string:C991("PurchInvItemsFieldNames_PurchaseCode")
			$_t_PIProductCodeLabel:=Get localized string:C991("PurchInvItemsFieldNames_ProductCode")
			$_t_PIProductNameLabel:=Get localized string:C991("PurchInvItemsFieldNames_ProductName")
			$_t_PIQuantityLabel:=Get localized string:C991("PurchInvItemsFieldNames_Qty")
			$_t_PICostPriceLabel:=Get localized string:C991("PurchInvItemsFieldNames_CostPrice")
			$_t_PICostAmountLabel:=Get localized string:C991("PurchInvItemsFieldNames_CostAmount")
			$_t_PITaxAmountLabel:=Get localized string:C991("PurchInvItemsFieldNames_TaxAmount")
			$_t_PITotalAmountLabel:=Get localized string:C991("PurchInvItemsFieldNames_TotalAmount")
			$_t_PISalesPriceLabel:=Get localized string:C991("PurchInvItemsFieldNames_SalesPrice")
			$_t_PITaxCodeLabel:=Get localized string:C991("PurchInvItemsFieldNames_TaxCode")
			$_t_PIPurchAccLabel:=Get localized string:C991("PurchInvItemsFieldNames_PurchaseAccount")
			$_t_PIAnalysisCodeLabel:=Get localized string:C991("PurchInvItemsFieldNames_AnalysisCode")
			$_t_PIPOCodeLabel:=Get localized string:C991("PurchInvItemsFieldNames_POCode")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Purchase`Invoice View"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16); "PIItemID"; ""; 0; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17); $_t_PIPiCodeLabel; ""; 40; $_l_NextColumnNumber; True:C214; True:C214; "")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1); $_t_PIProductCodeLabel; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Description:13); $_t_PIProductNameLabel; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2); $_t_PIQuantity; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); $_t_PICostPrice; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15); $_t_PISalesPriceLabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); $_t_PICostAmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5); $_t_PITotalAmountLabel; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "Tax Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); $_t_PITotalAmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); $_t_PITotalAmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8); $_t_PIPurchAccLabel; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9); $_t_PIAnalysisCodeLabel; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "")
			If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PITable; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11); $_t_PIPOCodeLabel; ""; 50; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
		: ($_t_CurrentDefinitionsName="03704")
			If (Count parameters:C259<2)
				$_t_LayoutName:="QA PL Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); "Purchase Code"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4); "Supplier Inv_No"; ""; 85; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Invoice_Date:5); "Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Invoiced:7); "Amount"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Paid:8); "Paid"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Total_Due:9); "Due"; "|Accounts"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]Due_Date:17); "Due Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 37; Field:C253(->[PURCHASE_INVOICES:37]State:24); "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)  //"PI_States")
			
			
			
			
		: ($_t_CurrentDefinitionsName="16103")  //Invoices Items
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoice Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18); "Key"; ""; 0; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]ID:17); "ID"; ""; 0; $_l_NextColumnNumber; True:C214; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Product_Code:1); "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Product_Name:2); "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Quantity:3); "Qty"; "#####0"; 30; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4); "Sales Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Amount:5); "Amount"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Tax_Code:6); "Tax"; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7); "Tax Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Total_Amount:8); "Total Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Sales_Account:9); "Sales"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 161; Field:C253(->[INVOICES_ITEMS:161]Analysis_Code:10); "Analysis"; ""; 50; $_l_NextColumnNumber; True:C214; False:C215)
		: ($_t_CurrentDefinitionsName="16104")  //Invoices Items
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoice Items VIew"
			End if 
			$_l_InvoiceItems:=Table:C252(->[INVOICES_ITEMS:161])
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceItemsFieldNames_InvoiceNumber")
			$_t_ProductCodelabel:=Get localized string:C991("InvoiceItemsFieldNames_ProductCode")
			$_t_ProductNameLabel:=Get localized string:C991("InvoiceItemsFieldNames_ProductName")
			$_t_QuantityLabel:=Get localized string:C991("InvoiceItemsFieldNames_Quantity")
			
			$_t_SalesPriceLabel:=Get localized string:C991("InvoiceItemsFieldNames_SalesPrice")
			$_t_AmountLabel:=Get localized string:C991("InvoiceItemsFieldNames_Amount")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("InvoiceItemsFieldNames_TaxCode")
			$_t_TaxAmountLabel:=Get localized string:C991("InvoiceItemsFieldNames_TaxAmount")
			$_t_TotalAmountLabel:=Get localized string:C991("InvoiceItemsFieldNames_TotalAmount")
			$_t_SalesAccountLabel:=Get localized string:C991("InvoiceItemsFieldNames_SalesAccount")
			$_t_AnalysisCodeLabel:=Get localized string:C991("InvoiceItemsFieldNames_AnalysisCode")
			
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]ID:17); "ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18); $_t_InvoiceNumberLabel; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Product_Code:1); $_t_ProductCodelabel; ""; 85; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Product_Name:2); $_t_ProductNamelabel; ""; 170; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Quantity:3); $_t_quantitylabel; "#####0.00"; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4); $_t_SalesPriceLabel; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Amount:5); $_t_AmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Tax_Code:6); $_t_TaxCodeLabel; ""; 30; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7); $_t_TaxAmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Total_Amount:8); $_t_TotalAmountLabel; "|Accounts"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Sales_Account:9); $_t_SalesAccountLabel; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceItems; Field:C253(->[INVOICES_ITEMS:161]Analysis_Code:10); $_t_AnalysisCodeLabel; ""; 50; $_l_NextColumnNumber; False:C215)
			
			
			
		: ($_t_CurrentDefinitionsName="03906")  //invoices
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoice Items"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Invoice_Number:1); "Invoice Number"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Invoice_Date:4); "Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Total_Invoiced:5); "Amount"; "#####0"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Total_Paid:6); "Paid"; "#####0"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Total_Due:7); "Due"; "#####0"; 60; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]Terms:11); "Terms"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 39; Field:C253(->[INVOICES:39]State:10); "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215)
			
		: ($_t_CurrentDefinitionsName="03907")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoice  Items"
			End if 
			//`
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_SIcustomercodes"; "Customer"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_SINumber"; "Invoice"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_SIDate"; "Inv  Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SISalesPrice"; "Sales Price"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SIamount"; "Sales Amount"; ""; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SITaxamount"; "Tax Amount"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS10_SiTaxCode"; "Tax Code"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SIQuantity"; "Quantity"; "#####0.00"; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SIPricePer"; "Price Per"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_SITotalAmount"; "Total Amount"; "#####0.00"; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_SIOIItemNUmber"; "Order Item No"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_SIOrderNUmber"; "Ordered No"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_SIIDS"; "InvoiceID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_SIItemID"; "Invoice Item ID"; ""; 0; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="03908")  //INVIOICES
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoices Table View"
			End if 
			$_l_InvoiceNumber:=Table:C252(->[INVOICES:39])
			
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceFieldNames_InvoiceNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("InvoiceFieldNames_CompanyCode")
			$_t_InvoiceStateLabel:=Get localized string:C991("InvoiceFieldNames_State")
			$_t_InvoiceDateLabel:=Get localized string:C991("InvoiceFieldNames_InvoicedDate")
			$_t_PeriodLabel:=Get localized string:C991("InvoiceFieldNames_PeriodCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("InvoiceFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("InvoiceFieldNames_Totalinvoiced")
			$_t_totalPaidLabel:=Get localized string:C991("InvoiceFieldNames_TotalPaid")
			$_t_TotalDueLabel:=Get localized string:C991("InvoiceFieldNames_TotalDue")
			$_t_DueDateLabel:=Get localized string:C991("InvoiceFieldNames_DueDate")
			$_t_AgeLabel:=Get localized string:C991("InvoiceFieldNames_Age")
			$_t_OverdueLabel:=Get localized string:C991("InvoiceFieldNames_Overdue")
			$_t_StageLabel:=Get localized string:C991("InvoiceFieldNames_CreditStage")
			$_t_AnalysisLabel:=Get localized string:C991("InvoiceFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("InvoiceFieldNames_LayerCode")
			$_t_PersonLLabel:=Get localized string:C991("InvoiceFieldNames_Person")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Number:1); $_t_InvoiceNumberLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Company_Code:2); $_t_CompanyCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]State:10); $_t_InvoiceState; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Date:4); $_t_InvoiceDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Period_Code:13); $_t_PeriodLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Currency_Code:27); $_t_CurrencyCodeLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Invoiced:5); $_t_TotalInvoicedLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Paid:6); $_t_TotalPaidLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Due:7); $_t_TotalDueLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Due_Date:18); $_t_DueDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Comments:12); $_t_ageLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetAge")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Comments:12); $_t_OverdueLabel; ""; 57; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetOverdue")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Credit_Stage:22); $_t_StageLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Analysis_Code:17); $_t_AnalysisLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Layer_Code:38); $_t_LayerLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Person:42); $_t_PersonLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03909")  //INVIOICES
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Credits Table View"
			End if 
			$_l_InvoiceNumber:=Table:C252(->[INVOICES:39])
			
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceFieldNames_CreditNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("InvoiceFieldNames_CompanyCode")
			$_t_InvoiceStateLabel:=Get localized string:C991("InvoiceFieldNames_State")
			$_t_InvoiceDateLabel:=Get localized string:C991("InvoiceFieldNames_CreditDate")
			$_t_PeriodLabel:=Get localized string:C991("InvoiceFieldNames_PeriodCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("InvoiceFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("InvoiceFieldNames_Totalcredited")
			$_t_totalPaidLabel:=Get localized string:C991("InvoiceFieldNames_TotalPaid")
			$_t_TotalDueLabel:=Get localized string:C991("InvoiceFieldNames_TotalDue")
			//$DueDateLabel:=Get localized string("InvoiceFieldNames_DueDate")
			//$AgeLabel:=Get localized string("InvoiceFieldNames_Age")
			//$OverdueLabel:=Get localized string("InvoiceFieldNames_Overdue")
			//$StageLabel:=Get localized string("InvoiceFieldNames_CreditStage")
			$_t_AnalysisLabel:=Get localized string:C991("InvoiceFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("InvoiceFieldNames_LayerCode")
			$_t_PersonLLabel:=Get localized string:C991("InvoiceFieldNames_Person")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Number:1); $_t_InvoiceNumberLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Company_Code:2); $_t_CompanyCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]State:10); $_t_InvoiceState; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Date:4); $_t_InvoiceDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Period_Code:13); $_t_PeriodLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Currency_Code:27); $_t_CurrencyCodeLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Invoiced:5); $_t_TotalInvoicedLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Paid:6); $_t_TotalPaidLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Due:7); $_t_TotalDueLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Due Date);$_t_ageLabel;"";64;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_DueDateLabel;"";64;$_l_NextColumnNumber;False;False;"INV_GetAge")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_OverdueLabel;"";57;$_l_NextColumnNumber;False;False;"INV_GetOverdue")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Credit Stage);$_t_StageLabel;"";57;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Analysis_Code:17); $_t_AnalysisLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Layer_Code:38); $_t_LayerLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Person:42); $_t_PersonLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03910")  //INVIOICES
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Deposits Table View"
			End if 
			$_l_InvoiceNumber:=Table:C252(->[INVOICES:39])
			
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceFieldNames_DepositNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("InvoiceFieldNames_CompanyCode")
			$_t_InvoiceStateLabel:=Get localized string:C991("InvoiceFieldNames_State")
			$_t_InvoiceDateLabel:=Get localized string:C991("InvoiceFieldNames_DepositDate")
			$_t_PeriodLabel:=Get localized string:C991("InvoiceFieldNames_PeriodCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("InvoiceFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("InvoiceFieldNames_TotalDeposited")
			$_t_totalPaidLabel:=Get localized string:C991("InvoiceFieldNames_TotalAllocated")
			$_t_TotalDueLabel:=Get localized string:C991("InvoiceFieldNames_TotalHeld")
			//$DueDateLabel:=Get localized string("InvoiceFieldNames_DueDate")
			//$AgeLabel:=Get localized string("InvoiceFieldNames_Age")
			//$OverdueLabel:=Get localized string("InvoiceFieldNames_Overdue")
			//$StageLabel:=Get localized string("InvoiceFieldNames_CreditStage")
			$_t_AnalysisLabel:=Get localized string:C991("InvoiceFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("InvoiceFieldNames_LayerCode")
			$_t_PersonLLabel:=Get localized string:C991("InvoiceFieldNames_Person")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Number:1); $_t_InvoiceNumberLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Company_Code:2); $_t_CompanyCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]State:10); $_t_InvoiceState; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Date:4); $_t_InvoiceDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Period_Code:13); $_t_PeriodLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Currency_Code:27); $_t_CurrencyCodeLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Paid:6); $_t_TotalInvoicedLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Total Paid);$_t_TotalPaidLabel;"";57;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Due:7); $_t_TotalDueLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Due Date);$_t_ageLabel;"";64;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_DueDateLabel;"";64;$_l_NextColumnNumber;False;False;"INV_GetAge")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_OverdueLabel;"";57;$_l_NextColumnNumber;False;False;"INV_GetOverdue")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Credit Stage);$_t_StageLabel;"";57;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Analysis_Code:17); $_t_AnalysisLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Layer_Code:38); $_t_LayerLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Person:42); $_t_PersonLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03911")  //INVIOICES
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Receipts Table View"
			End if 
			$_l_InvoiceNumber:=Table:C252(->[INVOICES:39])
			
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceFieldNames_ReceiptNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("InvoiceFieldNames_CompanyCode")
			$_t_InvoiceStateLabel:=Get localized string:C991("InvoiceFieldNames_State")
			$_t_InvoiceDateLabel:=Get localized string:C991("InvoiceFieldNames_ReceiptDate")
			$_t_PeriodLabel:=Get localized string:C991("InvoiceFieldNames_PeriodCode")
			
			$_t_currencyCodeLabel:=Get localized string:C991("InvoiceFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("InvoiceFieldNames_TotalReceived")
			//$totalPaidLabel:=Get localized string("InvoiceFieldNames_TotalAllocated")
			//$TotalDueLabel:=Get localized string("InvoiceFieldNames_TotalHeld")
			//$DueDateLabel:=Get localized string("InvoiceFieldNames_DueDate")
			//$AgeLabel:=Get localized string("InvoiceFieldNames_Age")
			//$OverdueLabel:=Get localized string("InvoiceFieldNames_Overdue")
			//$StageLabel:=Get localized string("InvoiceFieldNames_CreditStage")
			$_t_AnalysisLabel:=Get localized string:C991("InvoiceFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("InvoiceFieldNames_LayerCode")
			$_t_PersonLLabel:=Get localized string:C991("InvoiceFieldNames_Person")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Number:1); $_t_InvoiceNumberLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Company_Code:2); $_t_CompanyCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]State:10); $_t_InvoiceState; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Date:4); $_t_InvoiceDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Period_Code:13); $_t_PeriodLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Currency_Code:27); $_t_CurrencyCodeLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Paid:6); $_t_TotalInvoicedLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Total Paid);$_t_TotalPaidLabel;"";57;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Total Due);$_t_TotalDueLabel;"";57;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Due Date);$_t_ageLabel;"";64;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_DueDateLabel;"";64;$_l_NextColumnNumber;False;False;"INV_GetAge")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_OverdueLabel;"";57;$_l_NextColumnNumber;False;False;"INV_GetOverdue")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Credit Stage);$_t_StageLabel;"";57;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Analysis_Code:17); $_t_AnalysisLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Layer_Code:38); $_t_LayerLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Person:42); $_t_PersonLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03912")  //Proformas
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Proformas Table View"
			End if 
			$_l_InvoiceNumber:=Table:C252(->[INVOICES:39])
			
			$_t_InvoiceNumberLabel:=Get localized string:C991("InvoiceFieldNames_ProformaNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("InvoiceFieldNames_CompanyCode")
			$_t_InvoiceStateLabel:=Get localized string:C991("InvoiceFieldNames_State")
			$_t_InvoiceDateLabel:=Get localized string:C991("InvoiceFieldNames_InvoicedDate")
			$_t_PeriodLabel:=Get localized string:C991("InvoiceFieldNames_PeriodCode")
			$_t_currencyCodeLabel:=Get localized string:C991("InvoiceFieldNames_Currency")
			$_t_TotalInvoicedLabel:=Get localized string:C991("InvoiceFieldNames_Totalinvoiced")
			//$totalPaidLabel:=Get localized string("InvoiceFieldNames_TotalPaid")
			//$TotalDueLabel:=Get localized string("InvoiceFieldNames_TotalDue")
			//$DueDateLabel:=Get localized string("InvoiceFieldNames_DueDate")
			//$AgeLabel:=Get localized string("InvoiceFieldNames_Age")
			//$OverdueLabel:=Get localized string("InvoiceFieldNames_Overdue")
			//$StageLabel:=Get localized string("InvoiceFieldNames_CreditStage")
			$_t_AnalysisLabel:=Get localized string:C991("InvoiceFieldNames_AnalysisCode")
			$_t_LayerLabel:=Get localized string:C991("InvoiceFieldNames_LayerCode")
			$_t_PersonLLabel:=Get localized string:C991("InvoiceFieldNames_Person")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Number:1); $_t_InvoiceNumberLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Company_Code:2); $_t_CompanyCodeLabel; ""; 56; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]State:10); $_t_InvoiceStatelabel; ""; 54; $_l_NextColumnNumber; False:C215; False:C215; "INV_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Invoice_Date:4); $_t_InvoiceDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Period_Code:13); $_t_PeriodLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Currency_Code:27); $_t_CurrencyCodeLabel; ""; 28; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Total_Invoiced:5); $_t_TotalInvoicedLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Total Paid);$_t_TotalPaidLabel;"";57;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Total Due);$_t_TotalDueLabel;"";57;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Due Date);$_t_ageLabel;"";64;$_l_NextColumnNumber;False)
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_DueDateLabel;"";64;$_l_NextColumnNumber;False;False;"INV_GetAge")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Comments);$_t_OverdueLabel;"";57;$_l_NextColumnNumber;False;False;"INV_GetOverdue")
			//$_l_NextColumnNumber:=Layouts_Create ($_t_CurrentDefinitionsName;$_l_InvoiceNumber;Field(->[INVOICES]Credit Stage);$_t_StageLabel;"";57;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Analysis_Code:17); $_t_AnalysisLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Layer_Code:38); $_t_LayerLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_InvoiceNumber; Field:C253(->[INVOICES:39]Person:42); $_t_PersonLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="03999")  // this is rubbish
			
			
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_AS20_POSupplierCode"; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POcodes"; "PO Number"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_POOrderedDate"; "PO Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_POExpectedDate"; "Expected  Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_at_PODescription"; "Description"; ""; 150; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POOriginalCost"; " Normal Cost Price"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POCostPrice"; "Cost Price"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POCostAmount"; "Cost Amount"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PODisccount"; "DIscount"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POPricecode"; "Price Code"; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS5_POTaxCode"; "Tax Code"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POQuantity"; "Quantity"; "#####0.00"; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POPricePer"; "Price Per"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POPurchInvno"; "PI Number"; ""; 60; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POOIItemNUmber"; "Order Item No"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POIDS"; "POID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POItemID"; "Invoice Item ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="04601")  //catagories
			
			
			//TRACE
			If (Count parameters:C259<2)
				$_t_LayoutName:="Personnel Categories"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 46; Field:C253(->[TIME_BILLING_CATEGORIES:46]Category_Code:1); "Code"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 46; Field:C253(->[TIME_BILLING_CATEGORIES:46]Category_Name:2); "Name"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 46; Field:C253(->[TIME_BILLING_CATEGORIES:46]Sales_Rate:3); "Rate"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 46; Field:C253(->[TIME_BILLING_CATEGORIES:46]Cost_Rate:4); "Cost"; ""; 55; $_l_NextColumnNumber; True:C214)
			
			//code
			//name 281
			//sales rate 64
			//cost rate
		: ($_t_CurrentDefinitionsName="04704")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Stages"
			End if 
			If (False:C215)  //blocked out 02/04/07 -kmw (added new defaults below)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Code:2); "Stage"; ""; 55; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Name:3); "Name"; ""; 95; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Quoted_Qty:46); "Quoted Qty"; "####0.00"; 55; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Quoted_Price:47); "Quoted price"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Quoted_Amount:7); "Amount"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Budget_Units:4); "Budget"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8); "Budget Sales"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Budget_Cost_Amount:30); "Cost Total"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Actual_Units:5); "Actual Units"; ""; 60; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6); "Actual Sales Amount"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Actual_Cost_Amount:29); " Actual Cost Amount"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Invoice_Number:10); "Invoice No"; ""; 70; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9); "Invoice Ecxl Tax"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]TAX_Code:14); "Vat Code"; ""; 30; $_l_NextColumnNumber; True:C214)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Code:1); "Job Code"; ""; 0; $_l_NextColumnNumber; False:C215)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); "Job Code"; ""; 0; $_l_NextColumnNumber; False:C215)
			End if 
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); "Job Stage Code"; ""; 0; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Code:2); "Stage Type"; ""; 55; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Name:3); "Name"; ""; 95; $_l_NextColumnNumber; True:C214)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Quoted_Qty:46); "Quoted TR Qty"; "####0.00"; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Quoted_Price:47); "Quoted Price"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Quoted_Amount:7); "Quoted Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Budget_Units:4); "Budget TR Qty"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8); "Budget Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Budget_Cost_Amount:30); "Budget Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Actual_Units:5); "Actual TR Qty"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6); "Actual Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_Actual_Cost_Amount:29); " Actual Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_WIP_Units:55); "WIP TR Qty"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_WIP_Sales_Amount:56); "WIP Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JT_WIP_Cost_Amount:43); " WIP Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Budget_Sales_Amount:37); "Bud. Sales Tot"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_Actual_Sales_Amount:35); "Act. Sales Tot"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]JS_WIP_Sales_Amount:58); "WIP Sales Tot"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9); "Inv. Excl. Tax"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Invoice_Including_Tax:28); "Inv. Incl. Tax"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Invoice_Number:10); "Invoice No"; ""; 70; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]TAX_Code:14); "Vat Code"; ""; 30; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Code:1); "Job Code"; ""; 0; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="04705")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Stages"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Code:2); "Charge"; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Stage_Name:3); "ChargeName"; ""; 190; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]X_Actual_Hours_Entry:51); "Hours"; "####0.00"; 47; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Actual_Units:5); "Qty"; "####0.00"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]B_Client_Rate:12); "Client Rate"; "|currency"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AS_Quoted_Amount:7); "Client Amt"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]B_Applicant_Rate:13); "Applicant Rate"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8); "Applicant Amt"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]TAX_Code:14); "Vat Code"; ""; 30; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); "Stage Ident"; ""; 1; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 47; Field:C253(->[JOB_STAGES:47]Job_Code:1); "Job Code"; ""; 1; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="04706")  //job stages
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Stages View"
			End if 
			$_l_JobStages:=Table:C252(->[JOB_STAGES:47])
			$_t_JobStageCodeLabel:=Get localized string:C991("JobStageFieldNames_JobStageCode")
			$_t_JobCodeLabel:=Get localized string:C991("JobStageFieldNames_JobCode")
			$_t_StageCodeLabel:=Get localized string:C991("JobStageFieldNames_StageCode")
			$_t_SalesAmountLabel:=Get localized string:C991("JobStageFieldNames_SalesAmount")
			$_t_QuotedCostsLabel:=Get localized string:C991("JobStageFieldNames_QuotedCosts")
			$_t_InvoicedAmountLabel:=Get localized string:C991("JobStageFieldNames_InvoicedAmount")
			$_t_SalesNoLabel:=Get localized string:C991("JobStageFieldNames_InvoiceNumber")
			$_t_BTimeUnitsLabel:=Get localized string:C991("JobStageFieldNames_BudgetedTimeUnits")
			$_t_ATimeUnitsLabel:=Get localized string:C991("JobStageFieldNames_ActualTimeUnits")
			$_t_AAmountLLabel:=Get localized string:C991("JobStageFieldNames_TimeValue")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); $_t_JobStageCodeLabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]Job_Code:1); $_t_JobCodeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_t_JobNameLabel:=Get localized string:C991("JobsFieldNames_JobName")  //128
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[JOBS:26]); Field:C253(->[JOBS:26]Job_Name:2); $_t_JobNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]Stage_Code:2); $_t_StageCodeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_t_StageNameLabel:=Get localized string:C991("StageFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[STAGES:45]); Field:C253(->[STAGES:45]Stage_Name:2); $_t_StageNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8); $_t_SalesAmountLabel; "###.###0.00"; 47; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9); $_t_InvoicedAmountLabel; "###.###0.00"; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]AS_Quoted_Amount:7); $_t_QuotedCostslabel; "###.###0.00"; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]Invoice_Number:10); $_t_SalesNolabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]JT_Budget_Units:4); $_t_BTimeUnitslabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]AT_Actual_Units:5); $_t_ATimeUnitslabel; ""; 47; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobStages; Field:C253(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6); $_t_AAmountLabel; ""; 47; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="04801")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Personnel"
			End if 
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]Person:3); "Personnel"; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]X_Job_Person_Name:12); "Name"; ""; 70; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Sales_Rate:7); "Sales Rate"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Cost_Rate:9); "Cost Rate"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Units:4); "Budget TR Qty"; "####0.00"; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8); "Budget Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11); "Budget Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Actual_Units:5); "Actual TR Qty"; ""; 60; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6); "Actual Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10); " Actual Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_WIP_Units:21); "WIP TR Qty"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_WIP_Sales_Amount:20); "WIP Sales TR"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]JT_WIP_Cost_Amount:19); " WIP Cost TR"; "####0.00"; 65; $_l_NextColumnNumber; False:C215)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]Job_Code:1); "Job Code"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]Stage_Code:2); "Stage Type"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 48; Field:C253(->[JOB PERSONNEL:48]Job_stage_Code:17); "Job Stage Code"; ""; 0; $_l_NextColumnNumber; False:C215)
			
	End case 
	Case of 
		: ($_t_CurrentDefinitionsName="04802")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Job Personnel Table"
			End if   //
			
			
			$_l_PersonnelTable:=Table:C252(->[JOB PERSONNEL:48])
			$_t_JobCodeLabel:=Get localized string:C991("JobPersonnelFieldNames_JobCode")
			$_t_JobStageCodeLabel:=Get localized string:C991("JobPersonnelFieldNames_JobStageCode")
			$_t_JobStageLabel:=Get localized string:C991("JobPersonnelFieldNames_Stage")
			$_t_PersonLLabel:=Get localized string:C991("JobPersonnelFieldNames_PersonnelCode")
			$_t_PersonNameLabel:=Get localized string:C991("JobPersonnelFieldNames_PersonnelName")
			$_t_BunitsLabel:=Get localized string:C991("JobPersonnelFieldNames_BudgetUnits")
			$_t_BamountLabel:=Get localized string:C991("JobPersonnelFieldNames_BudgetSalesAmount")
			$_t_BCostsLabel:=Get localized string:C991("JobPersonnelFieldNames_BudgetCostAmount")
			$_t_AUNitsLLabel:=Get localized string:C991("JobPersonnelFieldNames_ActualUnits")
			$_t_AAmountLLabel:=Get localized string:C991("JobPersonnelFieldNames_ActualSalesAmount")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]Job_Code:1); $_t_JobCodeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_t_JobNameLabel:=Get localized string:C991("JobsFieldNames_JobName")  //128
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[JOBS:26]); Field:C253(->[JOBS:26]Job_Name:2); $_t_JobNamelabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]Job_stage_Code:17); $_t_JobStageCodelabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]Stage_Code:2); $_t_JobStagelabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_t_StageNameLabel:=Get localized string:C991("StageFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[STAGES:45]); Field:C253(->[STAGES:45]Stage_Name:2); $_t_StageNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]X_Job_Person_Name:12); $_t_PersonLabel; ""; 128; $_l_NextColumnNumber; False:C215; False:C215; "JobPers_GetPersonName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Units:4); $_t_Bunitslabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8); $_t_Bamountlabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11); $_t_BCostsLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]JT_Actual_Units:5); $_t_AUNitsLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonnelTable; Field:C253(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6); $_t_AUNitsLabel; ""; 64; $_l_NextColumnNumber; False:C215)
	End case 
	Case of 
		: ($_t_CurrentDefinitionsName="05001")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Post Codes Table"
			End if   //
			
			
			$_l_PostCodesTable:=Table:C252(->[POSTAL_CODES:50])
			
			
			$_t_AreaCodeLabel:=Get localized string:C991("PostcodesFieldNames_AreaCode")
			$_t_CodeFromLabel:=Get localized string:C991("PostcodesFieldNames_CodeFrom")
			$_t_CodeToLabel:=Get localized string:C991("PostcodesFieldNames_CodeTo")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PostCodesTable; Field:C253(->[POSTAL_CODES:50]xRec_ID:5); "ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PostCodesTable; Field:C253(->[POSTAL_CODES:50]Area_Code:2); $_t_AreaCodeLabel; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PostCodesTable; Field:C253(->[POSTAL_CODES:50]Postal_Code_From:1); $_t_CodeFromLabel; ""; 0; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PostCodesTable; Field:C253(->[POSTAL_CODES:50]Postal_Code_To:4); $_t_CodeToLabel; ""; 0; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="05101")  // workflow
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View workflow"
			End if 
			$_l_WFTable:=Table:C252(->[WORKFLOW_CONTROL:51])
			$_t_WFCodeLabel:=Get localized string:C991("WorkflowFieldNames_Code")
			$_t_WFNameLabel:=Get localized string:C991("WorkFlowFieldNames_Name")
			$_t_WFActionNameLabel:=Get localized string:C991("WorkFlowFieldNames_ActionCode")
			$_t_WFResultNameLabel:=Get localized string:C991("WorkFlowFieldNames_ResultCode")
			$_t_WFNextActionNameLabel:=Get localized string:C991("WorkFlowFieldNames_NextAction")
			$_t_WFAfterTimeNameLabel:=Get localized string:C991("WorkFlowFieldNames_AfterTime")
			$_t_WDDescriptionNameLabel:=Get localized string:C991("WorkFlowFieldNames_Description")
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]WFControl_Code:10); $_t_WFCodelabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Workflow_name:18); $_t_WFNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Action_Code:1); $_t_WFActionNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Result_Code:2); $_t_WFResultNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Next_Action:3); $_t_WFNextActionNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Days:4); $_t_WFAfterTimeNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_WFTable; Field:C253(->[WORKFLOW_CONTROL:51]Description:5); $_t_WDDescriptionNamelabel; ""; 82; $_l_NextColumnNumber; False:C215)
			
			
			
		: ($_t_CurrentDefinitionsName="05201")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Publications Table"
			End if   //
			
			
			$_l_PublicationsTable:=Table:C252(->[PUBLICATIONS:52])
			
			
			$_t_PubCodeLabel:=Get localized string:C991("PublicationFieldNames_PublicationCode")
			$_t_PubNameLabel:=Get localized string:C991("PublicationFieldNames_PublicationName")
			$_t_PCoCodeLabel:=Get localized string:C991("PublicationFieldNames_CompanyCode")
			$_t_PContCodeLabel:=Get localized string:C991("PublicationFieldNames_ContactCode")
			$_t_PubTypeLabel:=Get localized string:C991("PublicationFieldNames_PublicationType")
			$_t_FormatLabel:=Get localized string:C991("PublicationFieldNames_Format")
			$_t_FrequencyLabel:=Get localized string:C991("PublicationFieldNames_Frequency")
			$_t_CirculationLabel:=Get localized string:C991("PublicationFieldNames_Circulation")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Publication_Code:1); $_t_PubCodeLabel; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Publication_Name:2); $_t_PubCodeNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Company_Code:3); $_t_PCoCodeLabel; ""; 64; $_l_NextColumnNumber; True:C214)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Contact_Code:4); $_t_PContCodeLabel; ""; 64; $_l_NextColumnNumber; True:C214)
			$_t_Con_NameLabelLabel:=Get localized string:C991("ContactFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Name:31); $_t_Con_NameLabel; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Publication_Type:7); $_t_PubTypeLabel; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Format:6); $_t_FormatLabel; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Frequency:8); $_t_FrequencyLabel; ""; 70; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PublicationsTable; Field:C253(->[PUBLICATIONS:52]Circulation:5); $_t_Circulationlabel; ""; 70; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="05303")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Furhter Analysis Table"
			End if   //
			
			
			$_l_FTable:=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53])
			
			$_t_FCodeLabel:=Get localized string:C991("FurtherAnalysisFieldNames_Code")
			$_t_FNamelabel:=Get localized string:C991("FurtherAnalysisFieldNames_Name")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_FTable; Field:C253(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1); $_t_FCodeLabel; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_FTable; Field:C253(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2); $_t_FNamelabel; ""; 64; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="05401")  //credit stages
			
			
			
			//prevent purchase paymetn
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Credit Stages Table"
			End if   //
			
			
			$_l_StagesTable:=Table:C252(->[CREDIT_STAGES:54])
			
			
			$_t_StageCodeLabel:=Get localized string:C991("CreditStageFieldNames_StageCode")
			$_t_StageNameLabel:=Get localized string:C991("CreditStageFieldNames_StageName")
			$_t_StageDaysLabel:=Get localized string:C991("CreditStageFieldNames_LetterDays")
			$_t_StageNextLabel:=Get localized string:C991("CreditStageFieldNames_NextStage")
			$_t_StageDocumentLabel:=Get localized string:C991("CreditStageFieldNames_Document")
			$_t_PreventStageChangeLabel:=Get localized string:C991("CreditStageFieldNames_PreventConfirmation")
			$_t_PreventDeliveryLabel:=Get localized string:C991("CreditStageFieldNames_PreventDelivery")
			$_t_PreventInvoicingLabel:=Get localized string:C991("CreditStageFieldNames_PreventInvoicing")
			$_t_PreventPurchasePaymentLabel:=Get localized string:C991("CreditStageFieldNames_PreventPayment")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Stage_Code:1); $_t_StageCodelabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Stage_Name:2); $_t_StageNamelabel; ""; 265; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Letter_Days:3); $_t_StageDayslabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Next_Stage:6); $_t_StageNextlabel; ""; 42; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Document_Code:5); $_t_StageDocumentLabel; ""; 101; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Prevent_Confirmation:9); $_t_PreventStageChangeLabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Prevent_Deliver:8); $_t_PreventDeliverylabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Prevent_Invoice:7); $_t_PreventInvoicinglabel; ""; 55; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StagesTable; Field:C253(->[CREDIT_STAGES:54]Prevent_Payment:10); $_t_PreventPurchasePaymentLabel; ""; 55; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="05502")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Companies_Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 2; "Group"; ""; 100; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 6; "Subgroup"; ""; 100; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 3; "Description"; ""; 195; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 4; "Level"; "###,##0"; 40; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 8; "Date"; ""; 64; 5; True:C214; False:C215; ""; 9)
			
		: ($_t_CurrentDefinitionsName="05503")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Applic Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 2; "Group"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 6; "Subgroup"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 3; "Description"; ""; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 4; "Level"; "###,##0"; 40; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 55; 8; "Date"; ""; 64; $_l_NextColumnNumber; True:C214; False:C215; ""; 9)
			
		: ($_t_CurrentDefinitionsName="05703")
			If (Count parameters:C259<2)
				$_t_LayoutName:="PO Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "Product Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "Product Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Qty"; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; "Quantity"; 0; ""; 3)
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Pr Grp"; ""; 40; $_l_NextColumnNumber; True:C214; False:C215; "Price Code")
			End if 
			If ((DB_GetModuleSettingByNUM(1))#5)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Disc"; "|Percent"; 35; $_l_NextColumnNumber; True:C214; False:C215; "Discount")
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Orig Cost"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "Original Cost")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "Cost Price")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Cost Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "Cost Amount"; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Tax"; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "Tax Code")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Ord Item No"; ""; 60; $_l_NextColumnNumber; False:C215; False:C215; "Item Number")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; 9; "Purch Inv_No"; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "Purch Inv_No")
			
		: ($_t_CurrentDefinitionsName="16903")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18); "Key"; ""; 0; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17); "ID"; ""; 0; $_l_NextColumnNumber; True:C214; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1); "Product Code"; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2); "Product Name"; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3); "Qty"; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; "Quantity"; 0; ""; 3)
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9); "Pr Grp"; ""; 40; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			If ((DB_GetModuleSettingByNUM(1))#5)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Discount:10); "Disc"; "|Percent"; 35; $_l_NextColumnNumber; True:C214; False:C215; "")
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11); "Orig Cost"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4); "Cost Price"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); "Cost Amt"; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7); "Tax"; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6); "Ord Item No"; ""; 60; $_l_NextColumnNumber; False:C215; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8); "Purch Inv_No"; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "")
		: ($_t_CurrentDefinitionsName="16904")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Purchase Items Table"
			End if   //
			
			
			$_l_POTable:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			
			$_t_POCodeLabel:=Get localized string:C991("POItemFieldNames_POCode")
			$_t_ProductCodelabel:=Get localized string:C991("POItemFieldNames_ProductCode")
			$_t_ProductNameLabel:=Get localized string:C991("POItemFieldNames_ProductName")
			$_t_QuantityLabel:=Get localized string:C991("POItemFieldNames_Quantity")
			$_t_PriceCodeLLabel:=Get localized string:C991("POItemFieldNames_PriceCode")
			$_t_Discountlabel:=Get localized string:C991("POItemFieldNames_Discount")
			$_t_OriginalCostlabel:=Get localized string:C991("POItemFieldNames_OriginalCost")
			$_t_CostPriceLabel:=Get localized string:C991("POItemFieldNames_CostPrice")
			$_t_CostAmountlabel:=Get localized string:C991("POItemFieldNames_CostAmount")
			$_t_OrderItemRefLabel:=Get localized string:C991("POItemFieldNames_OrderItemNumber")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("POItemFieldNames_TaxCode")
			$_t_PurchaseInvoiceLabel:=Get localized string:C991("POItemFieldNames_PurchaseInvoice")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18); $_t_POCodelabel; ""; 49; $_l_NextColumnNumber; True:C214; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17); "ID"; ""; 0; $_l_NextColumnNumber; True:C214; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1); $_t_ProductCodelabel; ""; 85; $_l_NextColumnNumber; True:C214; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2); $_t_ProductNamelabel; ""; 170; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3); $_t_Quantitylabel; "#####0"; 35; $_l_NextColumnNumber; True:C214; False:C215; "Quantity"; 0; ""; 3)
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_POTable; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9); $_t_PriceCodeLabel; ""; 40; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			If ((DB_GetModuleSettingByNUM(1))#5)
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Discount:10); $_t_Discountlabel; "|Percent"; 35; $_l_NextColumnNumber; True:C214; False:C215; "")
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11); $_t_OriginalCostlabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4); $_t_CostPriceLabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); $_t_CostAmountlabel; "|Accounts"; 70; $_l_NextColumnNumber; True:C214; False:C215; ""; 0; ""; 3)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7); $_t_TaxCodeLabel; ""; 30; $_l_NextColumnNumber; True:C214; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6); $_t_OrderItemRefLabel; ""; 60; $_l_NextColumnNumber; False:C215; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 169; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8); $_t_PurchaseInvoiceLabel; ""; 60; $_l_NextColumnNumber; True:C214; False:C215; "")
			
		: ($_t_CurrentDefinitionsName="05705")
			If (Count parameters:C259<2)
				$_t_LayoutName:="PO Items Incl"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); "Purchase  Order"; ""; 85; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Date:3); "Purchase Date"; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; Field:C253(->[PURCHASE_ORDERS:57]Total_Cost:4); "Total Cost"; "#####0"; 65; $_l_NextColumnNumber; False:C215; False:C215; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 57; Field:C253(->[PURCHASE_ORDERS:57]State:14); "State"; ""; 65; $_l_NextColumnNumber; False:C215; False:C215; "")
			
		: ($_t_CurrentDefinitionsName="05706")
			//
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_AS20_POSupplierCode"; "Supplier"; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POcodes"; "PO Code"; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_POOrderedDate"; "PO Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POOriginalCost"; "Original Cost"; "#####0.00"; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POPricecode"; "Price Code"; ""; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_PODisccount"; "Discount"; ""; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POCostPrice"; "Cost Price"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POCostAmount"; "Cost Amount"; "#####0.00"; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POPricePer"; "Cost Per"; ""; 200; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_POQuantity"; "Ordered Quantity"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ar_QtyReceived"; "Qty received"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_ad_POExpectedDate"; "Expected Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS20_POPurchInvno"; "Purchase Inv "; ""; 80; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_aS5_POTaxCode"; "Tax Code"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POOIItemNUmber"; "Order Item No"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POItemID"; "PO item ID"; ""; 0; $_l_NextColumnNumber; False:C215)  //;False;"";0;"";3)
			
			
			$_l_NextColumnNumber:=LAY_CreateArrayBased($_t_CurrentDefinitionsName; "PRD_al_POIDS"; "PO ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			//``
			
		: ($_t_CurrentDefinitionsName="05707")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Purchase Orders Table"
				
			End if 
			$_l_PurchaseOrdersTable:=Table:C252(->[PURCHASE_ORDERS:57])
			
			$_t_POCodeLabel:=Get localized string:C991("POFieldNames_OrderNumber")
			$_t_CompanyCodeLabel:=Get localized string:C991("POFieldNames_CompanyCode")
			$_t_StatusLabel:=Get localized string:C991("POFieldNames_Status")
			$_t_PODateLabel:=Get localized string:C991("POFieldNames_PurchOrdDate")
			$_t_CostLabel:=Get localized string:C991("POFieldNames_TotalCost")
			$_t_PostedDateLabel:=Get localized string:C991("POFieldNames_PostedDate")
			$_t_AnalysisLabel:=Get localized string:C991("POFieldNames_AnalysisCode")
			$_t_CurrencyLabel:=Get localized string:C991("POFieldNames_CurrencyCode")
			$_t_LayerLabel:=Get localized string:C991("POFieldNames_LayerCode")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); $_t_POCodeLabel; ""; 70; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Company_Code:1); $_t_CompanyCodeLabel; ""; 79; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Comments:8); $_t_StatusLabel; ""; 61; $_l_NextColumnNumber; False:C215; False:C215; "PUR_GetFileState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Date:3); $_t_PODateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Total_Cost:4); $_t_CostLabel; ""; 68; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Posted_Date:13); $_t_PostedDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Analysis_Code:15); $_t_AnalysisLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Currency_Code:16); $_t_CurrencyLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PurchaseOrdersTable; Field:C253(->[PURCHASE_ORDERS:57]Layer_Code:17); $_t_LayerLabel; ""; 53; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="05801")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Stock Levels Table"
			End if 
			
			$_l_StockLevelsTable:=Table:C252(->[STOCK_LEVELS:58])
			
			$_t_LevelProductCodeLabel:=Get localized string:C991("StockLevelFieldNames_ProductCode")
			$_t_LevelStockTypeLabel:=Get localized string:C991("StockLevelFieldNames_StockType")
			$_t_StockTypenameLabel:=Get localized string:C991("StockTypeFieldNames_TypeName")
			$_t_LevelFreeLabel:=Get localized string:C991("StockLevelFieldNames_FreeLevel")
			$_t_CostFreeLabel:=Get localized string:C991("StockLevelFieldNames_FreeCost")
			$_t_LevelAllocatedLabel:=Get localized string:C991("StockLevelFieldNames_AllocatedLevel")
			$_t_CostAllocatedLabel:=Get localized string:C991("StockLevelFieldNames_AllocatedCost")
			$_t_LevelTotalLabel:=Get localized string:C991("StockLevelFieldNames_TotalLevel")
			$_t_CostTotalLabel:=Get localized string:C991("StockLevelFieldNames_TotalCost")
			$_t_AnalysisLabel:=Get localized string:C991("StockLevelFieldNames_Analysis")
			$_t_CurrencyLabel:=Get localized string:C991("StockLevelFieldNames_Currency")
			$_t_LayerLabel:=Get localized string:C991("StockLevelFieldNames_Layer")
			$_t_ProductNameLabel:=Get localized string:C991("ProductsFieldNames_ProductName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Product_Code:1); $_t_LevelProductCodeLabel; ""; 197; $_l_NextColumnNumber; False:C215)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Name:2); $_t_ProductNameLabel; ""; 197; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Stock_Type:2); $_t_LevelStockTypeLabel; ""; 78; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[STOCK_TYPES:59]); Field:C253(->[STOCK_TYPES:59]Type_Name:2); $_t_StockTypenameLabel; ""; 78; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Free_Level:3); $_t_LevelFreeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Free_Cost:5); $_t_CostFreeLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Allocated_Level:4); $_t_LevelAllocatedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Allocated_Cost:6); $_t_CostAllocatedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Free_Level:3); $_t_LevelTotalLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "STK_SumLevels")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Free_Cost:5); $_t_CostTotalLabel; ""; 64; $_l_NextColumnNumber; False:C215; False:C215; "STK_SumCosts")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Analysis_Code:7); $_t_AnalysisLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Currency_Code:8); $_t_CurrencyLabel; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockLevelsTable; Field:C253(->[STOCK_LEVELS:58]Layer_Code:9); $_t_LayerLabel; ""; 40; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="05901")
			//stock types
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Stock Types Table"
			End if 
			$_l_StockTypesTable:=Table:C252(->[STOCK_TYPES:59])
			$_t_StockTypeCodeLabel:=Get localized string:C991("StockTypeFieldNames_TypeCode")
			$_t_StockTypenameLabel:=Get localized string:C991("StockTypeFieldNames_TypeName")
			$_t_IgnoreLocationsLabel:=Get localized string:C991("StockTypeFieldNames_ignoreLocations")
			$_t_UserOwnedLabel:=Get localized string:C991("StockTypeFieldNames_HasValue")
			$_t_includeinreorderLabel:=Get localized string:C991("StockTypeFieldNames_includereordering")
			$_t_WarnNegativeLabel:=Get localized string:C991("StockTypeFieldNames_warnifnegative")
			$_t_allowAllocationLabel:=Get localized string:C991("StockTypeFieldNames_allowallocation")
			$_t_showasAllocatedLabel:=Get localized string:C991("StockTypeFieldNames_countasallocated")
			$_t_filtercurrentLabel:=Get localized string:C991("StockTypeFieldNames_filtercurrent")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]Type_Code:1); $_t_StockTypeCodeLabel; ""; 54; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]Type_Name:2); $_t_StockTypenameLabel; ""; 296; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]No_Locations:3); $_t_IgnoreLocationsLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]User_Owned:4); $_t_UserOwnedLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]ReOrdering:5); $_t_includeinreorderLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]Minus_Warning:7); $_t_WarnNegativeLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]Allocation_Allowed:8); $_t_allowAllocationLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]Allocated:6); $_t_showasAllocatedLabel; ""; 25; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_StockTypesTable; Field:C253(->[STOCK_TYPES:59]FilterOut:9); $_t_filtercurrentLabel; ""; 25; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="06001")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Movement Types Table"
			End if 
			
			
			$_l_MovementTypes:=Table:C252(->[MOVEMENT_TYPES:60])
			$_t_TypeCodeLLabel:=Get localized string:C991("MovementTypesFieldNames_TypeCode")
			$_t_TypeNameLLabel:=Get localized string:C991("MovementTypesFieldNames_TypeName")
			$_t_StockPLusLabel:=Get localized string:C991("MovementTypesFieldNames_TypePlus")
			$_t_StockMinusLabel:=Get localized string:C991("MovementTypesFieldNames_TypeMinus")
			$_t_StockNumberLabel:=Get localized string:C991("MovementTypesFieldNames_NumberName")
			$_t_NumberLabel:=Get localized string:C991("MovementTypesFieldNames_Number")
			$_t_ModifiableLabel:=Get localized string:C991("MovementTypesFieldNames_Modifiable")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Type_Code:1); $_t_TypeCodeLabel; ""; 41; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Type_Name:2); $_t_TypeNameLabel; ""; 181; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Stock_Plus:3); $_t_StockPLusLabel; ""; 41; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Stock_Minus:4); $_t_StockMinusLabel; ""; 41; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Number_Name:5); $_t_StockNumberLabel; ""; 84; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Number:6); $_t_NumberLabel; ""; 52; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_MovementTypes; Field:C253(->[MOVEMENT_TYPES:60]Number_Mod:8); $_t_ModifiableLabel; ""; 58; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="06101")  // locations
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Locations Table"
			End if 
			//terminology code 72
			//terminology name 296
			$_l_locations:=Table:C252(->[LOCATIONS:61])
			$_t_LocationCodeLabel:=Get localized string:C991("LocationFieldNames_LocationCode")
			$_t_LocationNameLabel:=Get localized string:C991("LocationFieldNames_LocationName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_locations; Field:C253(->[LOCATIONS:61]Location_Code:1); $_t_LocationCodeLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_locations; Field:C253(->[LOCATIONS:61]Location_Name:2); $_t_LocationNameLabel; ""; 296; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="06201")  // Current stock
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Current Stock Table"
			End if 
			$_l_Table:=Table:C252(->[CURRENT_STOCK:62])
			
			$_t_StockNoLabel:=Get localized string:C991("CurrentStockFieldNames_StockNumber")
			$_t_ProductCodelabel:=Get localized string:C991("CurrentStockFieldNames_ProductCode")
			
			//Product name
			$_t_SerialNoLabel:=Get localized string:C991("CurrentStockFieldNames_SerialNumber")
			$_t_StockTypeLabel:=Get localized string:C991("CurrentStockFieldNames_StockType")
			//stock type name
			$_t_LocationCodeLabel:=Get localized string:C991("CurrentStockFieldNames_LocationCode")
			//location name
			$_t_QuantityLabel:=Get localized string:C991("CurrentStockFieldNames_Quantity")
			$_t_CostPriceLabel:=Get localized string:C991("CurrentStockFieldNames_CostPrice")
			$_t_TotalCostNameLabel:=Get localized string:C991("CurrentStockFieldNames_TotalCost")
			$_t_OrderItemNumberLabel:=Get localized string:C991("CurrentStockFieldNames_OrderItemNumber")
			$_t_currencyCodeLabel:=Get localized string:C991("CurrentStockFieldNames_CurrencyCode")
			$_t_AnalysisCodeLabel:=Get localized string:C991("CurrentStockFieldNames_AnalysisCode")
			$_t_LayerCodeLabel:=Get localized string:C991("CurrentStockFieldNames_LayerCode")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Stock_Number:7); $_t_StockNoLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Product_Code:1); $_t_ProductCodelabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_t_ProductNameLabel:=Get localized string:C991("ProductsFieldNames_ProductName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Name:2); $_t_ProductNameLabel; ""; 197; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Quantity:4); $_t_QuantityLabel; ""; 34; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Stock_Type:3); $_t_StockTypeLabel; ""; 34; $_l_NextColumnNumber; False:C215)
			$_t_StockTypenameLabel:=Get localized string:C991("StockTypeFieldNames_TypeName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[STOCK_TYPES:59]); Field:C253(->[STOCK_TYPES:59]Type_Name:2); $_t_StockTypenameLabel; ""; 82; $_l_NextColumnNumber; True:C214)
			If (DB_GetModuleSettingByNUM(Module_SerialNos)>0)
				
				
				$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Serial_Number:2); $_t_SerialNoLabel; ""; 101; $_l_NextColumnNumber; False:C215)
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Location:8); $_t_LocationCodeLabel; ""; 48; $_l_NextColumnNumber; False:C215)
			$_t_LocationNameLabel:=Get localized string:C991("LocationFieldNames_LocationName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[LOCATIONS:61]); Field:C253(->[LOCATIONS:61]Location_Name:2); $_t_LocationNameLabel; ""; 183; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Currency_Code:11); $_t_CurrencyCodeLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Cost_Price:6); $_t_CostPriceLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Total_Cost:9); $_t_TotalCostNameLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Item_Number:5); $_t_OrderItemNumberLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Analysis_Code:10); $_t_AnalysisCodeLabel; ""; 67; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Table; Field:C253(->[CURRENT_STOCK:62]Layer_Code:12); $_t_LayerCodeLabel; ""; 67; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="06202")
			//
			If (Count parameters:C259<2)
				$_t_LayoutName:="Current Stcok"
			End if 
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]X_ID:13); "Record ID"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Product_Code:1); "Product Code"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Quantity:4); "Quantity"; ""; 35; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Currency_Code:11); "Currency"; ""; 35; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Cost_Price:6); "Value"; ""; 55; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Total_Cost:9); "Total Value"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Location:8); "Location"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Stock_Type:3); "Type"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Stock_Type:3); "Type"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Layer_Code:12); "Layer"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 62; Field:C253(->[CURRENT_STOCK:62]Item_Number:5); "SO Item"; ""; 65; $_l_NextColumnNumber; False:C215; True:C214; "")
			
			
			
	End case 
	Case of 
		: ($_t_CurrentDefinitionsName="06501")  // Job types
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View JobTypes Table"
			End if 
			//terminology code 72
			//terminology name 296
			$_l_JobTypes:=Table:C252(->[JOB_TYPES:65])
			$_t_JTCodesLabel:=Get localized string:C991("JobTypeFieldNames_JobTypeCode")
			$_t_JTNameLabel:=Get localized string:C991("JobTypeFieldNames_JobTypeName")
			$_t_JTermsLabel:=Get localized string:C991("JobTypeFieldNames_JobTypeTerms")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobTypes; Field:C253(->[JOB_TYPES:65]Type_Code:1); $_t_JTCodesLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobTypes; Field:C253(->[JOB_TYPES:65]Type_Name:2); $_t_JTNameLabel; ""; 296; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_JobTypes; Field:C253(->[JOB_TYPES:65]Terms:6); $_t_JTermsLabel; ""; 78; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="07101")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Currencies Table"
				
			End if 
			$_l_CurrenciesTable:=Table:C252(->[CURRENCIES:71])
			
			$_t_currencyCodeLabel:=Get localized string:C991("CurrenciesFieldNames_CurrencyCode")
			$_t_currencyNameLabel:=Get localized string:C991("CurrenciesFieldNames_CurrencyName")
			$_t_ISOcurrencyNameLabel:=Get localized string:C991("CurrenciesFieldNames_ISOName")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CurrenciesTable; Field:C253(->[CURRENCIES:71]Currency_Code:1); $_t_currencyCodeLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CurrenciesTable; Field:C253(->[CURRENCIES:71]Currency_Name:2); $_t_currencyNameLabel; ""; 250; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CurrenciesTable; Field:C253(->[CURRENCIES:71]ISO_Currency_Code:8); $_t_ISOcurrencyNameLabel; ""; 60; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="07301")  // Countries
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Countries Table"
			End if 
			
			$_l_CountriesTable:=Table:C252(->[COUNTRIES:73])
			
			$_t_CountriesNameLabel:=Get localized string:C991("CountriesFieldNames_CountryName")
			$_t_CountriesFormatLabel:=Get localized string:C991("CountriesFieldNames_AddressFormat")
			$_t_ISOLabel:=Get localized string:C991("CountriesFieldNames_ISOCode")
			$_t_TaxCodeLabelLabel:=Get localized string:C991("CountriesFieldNames_TaxCode")
			$_t_DialingCodeLabel:=Get localized string:C991("CountriesFieldNames_DiallingCode")
			$_t_TaxCodeLabel:=Term_VATWT($_t_TaxCodeLabel)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CountriesTable; Field:C253(->[COUNTRIES:73]COUNTRY_CODE:1); $_t_CountriesNameLabel; ""; 222; $_l_NextColumnNumber; True:C214)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CountriesTable; Field:C253(->[COUNTRIES:73]Address_Format:2); $_t_CountriesFormatLabel; ""; 45; $_l_NextColumnNumber; True:C214)
			$_t_AddressNameLabel:=Get localized string:C991("AddressFormatFieldNames_FormatName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[ADDRESS_FORMATS:74]); Field:C253(->[ADDRESS_FORMATS:74]Format_Name:2); $_t_AddressNameLabel; ""; 137; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CountriesTable; Field:C253(->[COUNTRIES:73]ISO_Code:6); $_t_ISOLabel; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CountriesTable; Field:C253(->[COUNTRIES:73]Default_TAX:4); $_t_TaxCodeLabel; ""; 55; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_CountriesTable; Field:C253(->[COUNTRIES:73]Dialling_Code:5); $_t_DialingCodeLabel; ""; 55; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="07401")  // address format
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Address Format Table"
			End if 
			$_l_addressFormatTable:=Table:C252(->[ADDRESS_FORMATS:74])
			$_t_AddressFormatCodeLabel:=Get localized string:C991("AddressFormatFieldNames_FormatCode")
			$_t_AddressFormatNameLabel:=Get localized string:C991("AddressFormatFieldNames_FormatName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_addressFormatTable; Field:C253(->[ADDRESS_FORMATS:74]Format_Code:1); $_t_AddressFormatCodeLabel; ""; 72; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_addressFormatTable; Field:C253(->[ADDRESS_FORMATS:74]Format_Name:2); $_t_AddressFormatNameLabel; ""; 296; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="07501")  // Terminology
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View terminology Table"
			End if 
			//terminology code 72
			//terminology name 296
			$_l_Terminology:=Table:C252(->[TERMINOLOGY:75])
			$_t_TermCodeLabel:=Get localized string:C991("TerminologyFieldNames_TermCode")
			$_t_TermNameLabel:=Get localized string:C991("TerminologyFieldNames_TermName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Terminology; Field:C253(->[TERMINOLOGY:75]Terminology_Code:1); $_t_TermCodeLabel; ""; 72; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Terminology; Field:C253(->[TERMINOLOGY:75]Terminology_Name:2); $_t_TermNameLabel; ""; 296; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="07601")  // layers
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Layers Table"
			End if 
			
			$_l_Layers:=Table:C252(->[LAYERS:76])
			$_t_LayerCodeLabel:=Get localized string:C991("LayersFieldNames_LayerCode")
			$_t_LayerNameLabel:=Get localized string:C991("LayersFieldNames_LayerName")
			$_t_LayerPeriodControlsLabel:=Get localized string:C991("LayersFieldNames_PeriodControls")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Layers; Field:C253(->[LAYERS:76]Layer_Code:1); $_t_LayerCodeLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Layers; Field:C253(->[LAYERS:76]Layer_Name:2); $_t_LayerNameLabel; ""; 242; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Layers; Field:C253(->[LAYERS:76]Period_Controls:3); $_t_LayerPeriodControlsLabel; ""; 38; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="08001")  // Macros
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Macros Table"
			End if 
			$_l_Macros:=Table:C252(->[SCRIPTS:80])
			$_t_MacroModifiedLabel:=Get localized string:C991("MacroFieldNames_MacroModified")
			$_t_MacroPersonLabel:=Get localized string:C991("MacroFieldNames_MacroPerson")
			$_t_MacrofKeyLabel:=Get localized string:C991("MacroFieldNames_MacroFkey")
			$_t_MacroNameLabel:=Get localized string:C991("MacroFieldNames_MacroName")
			$_t_MacroGroupLabel:=Get localized string:C991("MacroFieldNames_MacroGroup")
			$_t_MacroCodeLabel:=Get localized string:C991("MacroFieldNames_MacroCode")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Script_Code:1); $_t_MacroCodeLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Script_Group:9); $_t_MacroGroupLabel; ""; 123; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Script_Name:2); $_t_MacroNameLabel; ""; 173; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Keystroke:3); $_t_MacrofKeyLabel; ""; 27; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Person:5); $_t_MacroPersonLabel; ""; 44; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Macros; Field:C253(->[SCRIPTS:80]Modified_Date:10); $_t_MacroModifiedLabel; ""; 64; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="08501")  // Pictures
			
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Pictures Table"
			End if 
			$_l_PicturesTable:=Table:C252(->[PICTURES:85])
			$_t_PictureCodeLabel:=Get localized string:C991("PicturesFieldNames_PictureCode")
			$_t_PictureNameLabel:=Get localized string:C991("PicturesFieldNames_PictureName")
			$_t_PicturePictureLLabel:=Get localized string:C991("PicturesFieldNames_Picture")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PicturesTable; Field:C253(->[PICTURES:85]Picture_Code:1); $_t_PictureCodeLabel; ""; 72; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PicturesTable; Field:C253(->[PICTURES:85]Picture_Name:2); $_t_PictureNameLabel; ""; 189; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PicturesTable; Field:C253(->[PICTURES:85]Picture:3); $_t_PicturePictureLabel; ""; 189; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="08401")  // HEADINGS
			
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Headings Table"
			End if 
			$_l_Headings:=Table:C252(->[HEADINGS:84])
			//[HEADINGS]Heading Code
			//[HEADINGS]Heading Name
			//[HEADINGS]Heading Level
			//[HEADINGS]Level Up Code
			//[HEADINGS]Group Code
			$_t_HeadingCodeLLabel:=Get localized string:C991("HeadingsFieldNames_HeadingCode")
			$_t_HeadingNameLLabel:=Get localized string:C991("HeadingsFieldNames_HeadingName")
			$_t_HeadingLevelLLabel:=Get localized string:C991("HeadingsFieldNames_HeadingLevel")
			$_t_LevelUpLLabel:=Get localized string:C991("HeadingsFieldNames_Levelupcode")
			$_t_GroupLLabel:=Get localized string:C991("HeadingsFieldNames_GroupCode")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Headings; Field:C253(->[HEADINGS:84]Heading_Code:1); $_t_HeadingCodeLabel; ""; 72; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Headings; Field:C253(->[HEADINGS:84]Heading_Name:2); $_t_HeadingNameLabel; ""; 189; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Headings; Field:C253(->[HEADINGS:84]Heading_Level:3); $_t_HeadingLevelLabel; ""; 89; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Headings; Field:C253(->[HEADINGS:84]Level_Up_Code:4); $_t_LevelUpLabel; ""; 89; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Headings; Field:C253(->[HEADINGS:84]Group_Code:5); $_t_GroupLabel; ""; 89; $_l_NextColumnNumber; False:C215)
			
			
		: ($_t_CurrentDefinitionsName="08701")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Roles Table"
			End if 
			$_l_Roles:=Table:C252(->[ROLES:87])
			
			$_t_RolesCodeLLabel:=Get localized string:C991("RolesFieldNames_RoleCode")
			$_t_RolesNameLLabel:=Get localized string:C991("RolesFieldNames_RoleName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Roles; Field:C253(->[ROLES:87]Role_Code:1); $_t_RolesCodeLabel; ""; 72; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_Roles; Field:C253(->[ROLES:87]Role_Name:2); $_t_RolesNameLabel; ""; 296; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="08901")  //projects
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Projects Table"
			End if 
			$_l_ProjectsTable:=Table:C252(->[PROJECTS:89])
			$_t_ProjectCodeLLabel:=Get localized string:C991("ProjectFieldNames_ProjectCode")
			$_t_ProjectNameLLabel:=Get localized string:C991("ProjectFieldNames_ProjectName")
			$_t_CompanyCodeLabel:=Get localized string:C991("ProjectFieldNames_CompanyCode")
			$_t_ProjStateLLabel:=Get localized string:C991("ProjectFieldNames_ProjectState")
			$_t_PersonLLabel:=Get localized string:C991("ProjectFieldNames_Person")
			$_t_ProjTypeLLabel:=Get localized string:C991("ProjectFieldNames_Type")
			$_t_StartDateLLabel:=Get localized string:C991("ProjectFieldNames_StartDate")
			$_t_EndDateLLabel:=Get localized string:C991("ProjectFieldNames_EndDate")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Project_Code:1); $_t_ProjectCodeLabel; ""; 61; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Project_Name:2); $_t_ProjectNameLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Company_Code:3); $_t_CompanyCodeLabel; ""; 128; $_l_NextColumnNumber; False:C215)
			$_t_CoNameLLabel:=Get localized string:C991("CompanyFieldNames_Name")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[COMPANIES:2]); Field:C253(->[COMPANIES:2]Company_Name:2); $_t_CoNameLabel; ""; 170; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Project_Name:2); $_t_ProjStateLabel; ""; 61; $_l_NextColumnNumber; False:C215; False:C215; "PRJ_GetState")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Project_Code:1); $_t_ProjStateLabel; ""; 94; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Person:8); $_t_PersonLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Project_Type:7); $_t_ProjTypeLabel; ""; 57; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Person:8); $_t_PersonLabel; ""; 36; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]Start_Date:5); $_t_StartDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_ProjectsTable; Field:C253(->[PROJECTS:89]End_Date:6); $_t_EndDateLabel; ""; 64; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="09201")  //Person groups
			
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Groups Table"
			End if 
			$_l_PersonGroupsTable:=Table:C252(->[PERSONNEL_GROUPS:92])
			$_t_GroupCodeLLabel:=Get localized string:C991("PersonGroupsFieldNames_GroupCode")
			$_t_GroupNameLLabel:=Get localized string:C991("PersonGroupsFieldNames_GroupName")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonGroupsTable; Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1); $_t_GroupCodeLabel; ""; 54; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_PersonGroupsTable; Field:C253(->[PERSONNEL_GROUPS:92]Group_Name:2); $_t_GroupNameLabel; ""; 307; $_l_NextColumnNumber; False:C215)
		: ($_t_CurrentDefinitionsName="09301")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Subscription_Date:3); "Date"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]X_Dayname:14); "Day"; ""; 55; $_l_NextColumnNumber; False:C215; False:C215; "DayName ([SUBSCRIPTIONS]Subs Date)")
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]After_Number:5); "After"; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Unit_Number:6); "No of "; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]X_Units_Type:13); ""; ""; 40; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Type:7); "Type"; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8); "Amt(ex Tax)"; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Product_Name:2); "Name(Optional)"; ""; 40; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Date_Done:9); "Date Done"; ""; 64; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 93; Field:C253(->[SUBSCRIPTIONS:93]Invoice_Number:10); "Invoice No"; ""; 40; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="09801")  //Further Fields
			
			
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Further Fields Table"
			End if 
			//unique code
			//field name
			//Value-calculate from the field use a text field type
			
			//alpha value
			$_l_TableNumber:=Table:C252(->[CUSTOM_FIELDS:98])
			
			$_t_UniqueReferenceLLabel:=Get localized string:C991("FurtherFieldsFieldNames_UniqueCode")
			$_t_FIeldNameLLabel:=Get localized string:C991("FurtherFieldsFieldNames_FIeldName")
			$_t_FieldValueLLabel:=Get localized string:C991("FurtherFieldsFieldNames_FieldValue")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELDS:98]Unique_Code:2); $_t_UniqueReferenceLabel; ""; 116; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELDS:98]Field_Name:3); $_t_FIeldNameLabel; ""; 116; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELDS:98]Text_Field:6); $_t_FIeldNameLabel; ""; 116; $_l_NextColumnNumber; False:C215; False:C215; "FF_GetData")
			
		: ($_t_CurrentDefinitionsName="09903")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 99; 2; "Field Name"; ""; 170; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 99; 6; "Type"; ""; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; 99; 5; "List or Format"; ""; 170; $_l_NextColumnNumber; True:C214)
			
		: ($_t_CurrentDefinitionsName="09904")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Field Definitions Table"
			End if 
			$_l_TableNumber:=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99])
			
			$_t_FDCodeLLabel:=Get localized string:C991("FieldDefinitionFieldNames_FDCode")
			$_t_FDTableNumLLabel:=Get localized string:C991("FieldDefinitionFieldNames_FDTableNum")
			$_t_FDNameLLabel:=Get localized string:C991("FieldDefinitionFieldNames_FDName")
			$_t_FDTypeLLabel:=Get localized string:C991("FieldDefinitionFieldNames_Type")
			$_t_FDFormatLLabel:=Get localized string:C991("FieldDefinitionFieldNames_FDFormat")
			$_t_FDSortLLabel:=Get localized string:C991("FieldDefinitionFieldNames_FDSortOrder")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1); $_t_FDCodeLabel; ""; 94; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3); $_t_FDTableNumLabel; ""; 35; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2); $_t_FDNameLabel; ""; 150; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]Type:6); $_t_FDTypeLabel; ""; 28; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5); $_t_FDFormatLabel; ""; 150; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4); $_t_FDSortLabel; ""; 38; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="00501")
			If (Count parameters:C259<2)
				$_t_LayoutName:="View Types Table"
			End if 
			//type code 68
			//type name 295
			//price group 66
			$_l_TableNumber:=Table:C252(->[TYPES:5])
			$_t_TypeCodeLLabel:=Get localized string:C991("TypeFieldNames_TypeCode")
			$_t_TypeNameLLabel:=Get localized string:C991("TypeFieldNames_TypeName")
			$_t_PriceCodeLLabel:=Get localized string:C991("TypeFieldNames_PriceGroup")
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TYPES:5]Type_Code:1); $_t_TypeCodeLabel; ""; 68; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TYPES:5]Type_Name:2); $_t_TypeNameLabel; ""; 295; $_l_NextColumnNumber; True:C214)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[TYPES:5]SO_Price_Group:4); $_t_PriceCodeLabel; ""; 66; $_l_NextColumnNumber; True:C214)
		: ($_t_CurrentDefinitionsName="19801")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Bank Statements"
			End if 
			//type code 68
			//type name 295
			//price group 66
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_Account_Number:2); "Account Code"; ""; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_TransactionDate:5); "Date"; ""; 80; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_TransactionType:6); "Type"; ""; 50; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_Transaction_Details:7); "Description"; ""; 350; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_DebitAmount:8); "Debit Amount"; "|Accounts"; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_CreditAmount:9); "Credit Amount"; "|Accounts"; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_Balance:10); "Account Balance"; "|Accounts"; 100; $_l_NextColumnNumber; False:C215)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[ACC_Bank_Statements:198]Bank_ReconciledAmount:11); "Reconcilled Amount"; "|AccountsNZ"; 100; $_l_NextColumnNumber; False:C215)
			
		: ($_t_CurrentDefinitionsName="16107")
			If (Count parameters:C259<2)
				$_t_LayoutName:="Invoice  Items"
			End if 
			//`
			$_l_TableNumber:=Table:C252(->[INVOICES_ITEMS:161])
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Company_Code:2); "Customer"; ""; 70; $_l_NextColumnNumber; False:C215)
			//"PRD_aS20_SIcustomercodes";"Customer";"";70;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Invoice_Number:1); "Invoice"; ""; 60; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_aS20_SINumber";"Invoice";"";60;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Invoice_Date:4); "Date"; ""; 64; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ad_SIDate";"Inv  Date";"";64;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4); "Sales Price"; ""; 700; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SISalesPrice";"Sales Price";"#####0.00";70;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Amount:5); "Sales Amount"; ""; 100; $_l_NextColumnNumber; False:C215)
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SIamount";"Sales Amount";"";100;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7); "Tax Amount"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SITaxamount";"Tax Amount";"#####0.00";60;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Tax_Code:6); "Tax Amount"; ""; 200; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_aS10_SiTaxCode";"Tax Code";"";200;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Quantity:3); "Quantity"; "#####0.00"; 100; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SIQuantity";"Quantity";"#####0.00";100;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Price_Per:16); "Price Per"; "#####0.00"; 60; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SIPricePer";"Price Per";"#####0.00";60;$_l_NextColumnNumber;False)
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Total_Amount:8); "Total Amount"; "#####0.00"; 200; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_ar_SITotalAmount";"Total Amount";"#####0.00";200;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Item_Number:12); "Order Item No"; ""; 200; $_l_NextColumnNumber; False:C215)
			
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_al_SIOIItemNUmber";"Order Item No";"";200;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]Order_Code:11); "Order No"; ""; 60; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_aS20_SIOrderNUmber";"Ordered No";"#####0.00";60;$_l_NextColumnNumber;False)
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18); "Invoice No"; ""; 0; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_al_SIIDS";"InvoiceID";"";0;$_l_NextColumnNumber;False)
			
			
			$_l_NextColumnNumber:=Layouts_Create($_t_CurrentDefinitionsName; $_l_TableNumber; Field:C253(->[INVOICES_ITEMS:161]ID:17); "Invoice Item ID"; ""; 0; $_l_NextColumnNumber; False:C215)
			
			//$_l_NextColumnNumber:=LAY_CreateArrayBased ($_t_CurrentDefinitionsName;"PRD_al_SIItemID";"Invoice Item ID";"";0;$_l_NextColumnNumber;False)
			
	End case 
	If ($_t_LayoutName#"")
		LBI_saveLayoutName($_t_CurrentDefinitionsName; $_t_LayoutName)
	End if 
Else 
	LBI_saveLayoutName($_t_CurrentDefinitionsName)
End if 
CLEAR SEMAPHORE:C144("Create"+$_t_CurrentDefinitionsName)

UNLOAD RECORD:C212([LIST_LAYOUTS:96])
READ ONLY:C145([LIST_LAYOUTS:96])
ERR_MethodTrackerReturn("LBi_ListLay"; $_t_oldMethodName)
