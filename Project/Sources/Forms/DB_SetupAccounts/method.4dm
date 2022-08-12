If (False:C215)
	//Project Form Method Name: DB_SetupAccounts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2013 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_AccountDefault; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY BOOLEAN:C223($_abo_NoNominalLedgerPostings; 0)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	//ARRAY BOOLEAN(DB_ab_LineEdit;0)
	//ARRAY BOOLEAN(DB_abo_AccountDefault;0)
	//ARRAY BOOLEAN(DB_abo_NoNominalLedgerPostings;0)
	ARRAY INTEGER:C220($_ai_HeadingLevel2; 0)
	ARRAY INTEGER:C220($_ai_HeadingLevel3; 0)
	ARRAY INTEGER:C220($_ai_HeadingLevel4; 0)
	ARRAY INTEGER:C220($_aI_HeadingLevel5; 0)
	ARRAY INTEGER:C220($DB_aI_HeadingLevel2; 0)
	ARRAY INTEGER:C220($DB_aI_HeadingLevel3; 0)
	ARRAY INTEGER:C220($DB_aI_HeadingLevel4; 0)
	//ARRAY INTEGER(DB_aI_ALLHeadingLevels;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel1;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel2;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel3;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel4;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel5;0)
	//ARRAY INTEGER(DB_ai_RowLevel;0)
	ARRAY LONGINT:C221($_al_HeadingEnforce2; 0)
	ARRAY LONGINT:C221($_al_HeadingEnforce3; 0)
	ARRAY LONGINT:C221($_al_HeadingEnforce4; 0)
	ARRAY LONGINT:C221($_al_HeadingEnforce5; 0)
	ARRAY LONGINT:C221($_al_MultiCurrencyValuation; 0)
	//ARRAY LONGINT(DB_al_HeadingEnforce1;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce2;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce3;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce4;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce5;0)
	//ARRAY LONGINT(DB_al_MultiCurrencyValuation;0)
	//ARRAY LONGINT(DB_al_NextRowIndex;0)
	//ARRAY PICTURE(DB_api_AddAccount;0)
	//ARRAY PICTURE(DB_api_AddSubHeading;0)
	//ARRAY PICTURE(DB_apic_AddAccount;0)
	//ARRAY PICTURE(DB_apic_AddSubHeading;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ACCHHeadings2; 0)
	ARRAY TEXT:C222($_at_ACCHHeadings3; 0)
	ARRAY TEXT:C222($_at_ACCHHeadings4; 0)
	ARRAY TEXT:C222($_at_ACCHHeadings5; 0)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	ARRAY TEXT:C222($_at_AccountHeadings; 0)
	ARRAY TEXT:C222($_at_AccountIO; 0)
	ARRAY TEXT:C222($_at_AccountNames; 0)
	ARRAY TEXT:C222($_at_AccountPreferenceGroups; 0)
	ARRAY TEXT:C222($_at_AnalysisCodes; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeFrom2; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeFrom3; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeFrom4; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeFrom5; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeTO2; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeTO3; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeTO4; 0)
	ARRAY TEXT:C222($_at_HeadingAccCodeTO5; 0)
	ARRAY TEXT:C222($_at_HeadingGroup2; 0)
	ARRAY TEXT:C222($_at_HeadingGroup3; 0)
	ARRAY TEXT:C222($_at_HeadingGroup4; 0)
	ARRAY TEXT:C222($_at_HeadingGroup5; 0)
	ARRAY TEXT:C222($_at_HeadingLevelup2; 0)
	ARRAY TEXT:C222($_at_HeadingLevelup3; 0)
	ARRAY TEXT:C222($_at_HeadingLevelup4; 0)
	ARRAY TEXT:C222($_at_HeadingLevelup5; 0)
	ARRAY TEXT:C222($_at_HeadingNames2; 0)
	ARRAY TEXT:C222($_at_HeadingNames3; 0)
	ARRAY TEXT:C222($_at_HeadingNames4; 0)
	ARRAY TEXT:C222($_at_HeadingNames5; 0)
	ARRAY TEXT:C222($_at_LayerCodes; 0)
	ARRAY TEXT:C222($_at_MultiCurrencyValuation; 0)
	ARRAY TEXT:C222($_at_ProfitBalance; 0)
	ARRAY TEXT:C222($_at_ReportHeadings; 0)
	//ARRAY TEXT(DB_at_ACCHHeadings1;0)
	//ARRAY TEXT(DB_at_ACCHHeadings2;0)
	//ARRAY TEXT(DB_at_ACCHHeadings3;0)
	//ARRAY TEXT(DB_at_ACCHHeadings4;0)
	//ARRAY TEXT(DB_at_ACCHHeadings5;0)
	//ARRAY TEXT(DB_at_AccountCodes;0)
	//ARRAY TEXT(DB_at_AccountGroups;0)
	//ARRAY TEXT(DB_at_AccountHeadings;0)
	//ARRAY TEXT(DB_at_AccountIO;0)
	//ARRAY TEXT(DB_at_AccountNames;0)
	//ARRAY TEXT(DB_at_AccountPreferenceGroups;0)
	//ARRAY TEXT(DB_at_AnalysisCodes;0)
	//ARRAY TEXT(DB_at_Dummy;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom1;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom2;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom3;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom4;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom5;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTO1;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo2;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo3;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo4;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo5;0)
	//ARRAY TEXT(DB_at_HeadingACCRange;0)
	//ARRAY TEXT(DB_at_HeadingGroup1;0)
	//ARRAY TEXT(DB_at_HeadingGroup2;0)
	//ARRAY TEXT(DB_at_HeadingGroup3;0)
	//ARRAY TEXT(DB_at_HeadingGroup4;0)
	//ARRAY TEXT(DB_at_HeadingGroup5;0)
	//ARRAY TEXT(DB_at_HeadingLevelup1;0)
	//ARRAY TEXT(DB_at_HeadingLevelup2;0)
	//ARRAY TEXT(DB_at_HeadingLevelup3;0)
	//ARRAY TEXT(DB_at_HeadingLevelup4;0)
	//ARRAY TEXT(DB_at_HeadingLevelup5;0)
	//ARRAY TEXT(DB_At_headingNames;0)
	//ARRAY TEXT(DB_at_HeadingNames1;0)
	//ARRAY TEXT(DB_at_HeadingNames2;0)
	//ARRAY TEXT(DB_at_HeadingNames3;0)
	//ARRAY TEXT(DB_at_HeadingNames4;0)
	//ARRAY TEXT(DB_at_HeadingNames5;0)
	//ARRAY TEXT(DB_at_Headings;0)
	//ARRAY TEXT(DB_at_LayerCodes;0)
	//ARRAY TEXT(DB_at_MultiCurrencyValuation;0)
	//ARRAY TEXT(DB_at_ProfitBalance;0)
	//ARRAY TEXT(DB_at_ReportHeadings;0)
	//ARRAY TEXT(DB_At_SubHeadingLevel;0)
	//ARRAY TEXT(DB_at_SubHeadings;0)
	C_BOOLEAN:C305($_bo_AccountsDisplayed; $_bo_Analysis1Found; $_bo_Analysis2Found; $_bo_AnalysisFound; $_bo_AnalysisIndex1Found; $_bo_AnalysisIndex2Found; $_bo_AnalysisIndex3Found; $_bo_ShowAnalysis; DB_bo_NoLoad)
	C_LONGINT:C283($_l_AccountCodeRow; $_l_AccountsIndex; $_l_AdjustmentsRow; $_l_AnalysisIndex; $_l_AnalysisIndexarent; $_l_AnalysisIndexarent1Found; $_l_AnalysisIndexarent2Found; $_l_AnalysisIndexarent3Found; $_l_AnalysisIndexictureNoCHildre; $_l_AnalysisIndexositionofInsert; $_l_ArraySIze)
	C_LONGINT:C283($_l_BankFromRow; $_l_ChargesRow; $_l_CopyRow; $_l_CopyRow2; $_l_DummyWidth; $_l_event; $_l_ExchangeFromRow; $_l_FromRow; $_l_HeadingIndex; $_l_LastColumn; $_l_LineEditWidth)
	C_LONGINT:C283($_l_NilWidth; $_l_NomVatRow; $_l_NumberofRows; $_l_ProfitYTDRow; $_l_Row; $_l_Row2; $_l_SubRowsAdded; ACH_l_BUT1; ACH_l_BUT10; ACH_l_BUT11; ACH_l_BUT12)
	C_LONGINT:C283(ACH_l_BUT13; ACH_l_BUT14; ACH_l_BUT15; ACH_l_BUT16; ACH_l_BUT17; ACH_l_BUT18; ACH_l_BUT19; ACH_l_BUT2; ACH_l_BUT20; ACH_l_BUT21; ACH_l_BUT22)
	C_LONGINT:C283(ACH_l_BUT23; ACH_l_BUT24; ACH_l_BUT25; ACH_l_BUT26; ACH_l_BUT27; ACH_l_BUT28; ACH_l_BUT29; ACH_l_BUT3; ACH_l_BUT30; ACH_l_BUT4; ACH_l_BUT5)
	C_LONGINT:C283(ACH_l_BUT6; ACH_l_BUT7; ACH_l_BUT8; ACH_l_BUT9; DB_l_Refresh)
	C_PICTURE:C286($_pic_AddSubHeading; $_pic_AddSubHeadingWidth)
	C_TEXT:C284($_t_ActualFrom; $_t_ActualTo; $_t_oldMethodName; $_t_Space; $_t_VatPayment; $_t_VatReturn; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo)
	C_TEXT:C284(DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_BankAccTo; DM_T_nomVatInput; DM_T_nomVatOutput; oACH_COL1; oACH_COL10; oACH_COL11; oACH_COL12; oACH_COL13)
	C_TEXT:C284(oACH_COL14; oACH_COL15; oACH_COL16; oACH_COL17; oACH_COL19; oACH_COL2; oACH_COL20; oACH_COL21; oACH_COL22; oACH_COL23; oACH_COL24)
	C_TEXT:C284(oACH_COL25; oACH_COL26; oACH_COL27; oACH_COL28; oACH_COL29; oACH_COL3; oACH_COL30; oACH_COL31; oACH_COL32; oACH_COL33; oACH_COL34)
	C_TEXT:C284(oACH_COL35; oACH_COL36; oACH_COL4; oACH_COL5; oACH_COL6; oACH_COL7; oACH_COL8; oACH_COL9; oACH_HED1; oACH_HED10; oACH_HED11)
	C_TEXT:C284(oACH_HED12; oACH_HED13; oACH_HED14; oACH_HED16; oACH_HED17; oACH_HED18; oACH_HED19; oACH_HED2; oACH_HED20; oACH_HED21; oACH_HED22)
	C_TEXT:C284(oACH_HED23; oACH_HED24; oACH_HED26; oACH_HED27; oACH_HED28; oACH_HED29; oACH_HED3; oACH_HED30; oACH_HED4; oACH_HED6; oACH_HED7)
	C_TEXT:C284(oACH_HED8; oACH_HED9; oRE_HED15; oRE_HED25; oRE_HED5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DB_SetupAccounts"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		//GET PICTURE FROM LIBRARY(417; $_pic_AddSubHeadingWidth)
		$_pic_AddSubHeadingWidth:=Get_Picture(417)
		//GET PICTURE FROM LIBRARY(22563; $_pic_AddSubHeading)
		$_pic_AddSubHeading:=Get_Picture(22563)
		TRANSFORM PICTURE:C988($_pic_AddSubHeading; Translate:K61:3; 3; 3)
		
		DB_LoadLedgerPreferences
		$_t_VatReturn:="VAT Return"
		$_t_VatPayment:="VAT Payment"
		//This window is (Normally)ONLY called when there are no accounts records in the data
		ARRAY TEXT:C222(DB_at_AccountGroups; 0)  //These are the preferences-if no accounts are setup then no preferences are setup either
		
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Bank Accounts")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Currency Exchange Control")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Currency Bank Charges")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Cash Accounts")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; $_t_VatReturn)
		APPEND TO ARRAY:C911(DB_at_AccountGroups; $_t_VatPayment)
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "EC Creditors")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Balance Sheet Profit Brought Forward Account")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Balance Sheet Profit Year to Date Account")
		APPEND TO ARRAY:C911(DB_at_AccountGroups; "Balance Sheet Adjusment Account")
		//``
		ARRAY TEXT:C222(DB_at_AccountCodes; 0)  //[ACCOUNTS]Account_Code
		ARRAY TEXT:C222(DB_at_AccountNames; 0)  //[ACCOUNTS]Account_Name
		ARRAY TEXT:C222(DB_at_AccountHeadings; 0)  //[ACCOUNTS]Group_Heading
		
		
		
		//ARRAY TEXT(DB_at_AccountHeadingNames;0)
		ARRAY TEXT:C222(DB_at_ReportHeadings; 0)  //[ACCOUNTS]Report_Heading
		
		//ARRAY TEXT(DB_at_ReportHeadingNames;0)
		ARRAY TEXT:C222(DB_at_AccountPreferenceGroups; 0)  //[ACCOUNTS]xinternalAccountGroup
		ARRAY BOOLEAN:C223(DB_abo_AccountDefault; 0)  //[ACCOUNTS]xDefaultAccountWithinGroup
		ARRAY TEXT:C222(DB_at_AccountIO; 0)  //[ACCOUNTS]IO
		ARRAY LONGINT:C221(DB_al_MultiCurrencyValuation; 0)  //[ACCOUNTS]Multicurrency_Valuation
		
		
		
		
		ARRAY TEXT:C222(DB_at_MultiCurrencyValuation; 0)
		ARRAY BOOLEAN:C223(DB_abo_NoNominalLedgerPostings; 0)  //[ACCOUNTS]No_NL_Postings
		ARRAY TEXT:C222(DB_at_ProfitBalance; 0)  //[ACCOUNTS]PB
		ARRAY TEXT:C222(DB_at_AnalysisCodes; 0)  //Bssed on [ACCOUNTS]xAnalysisCodes
		ARRAY TEXT:C222(DB_at_LayerCodes; 0)  // based on [ACCOUNTS]xLayerCodes
		
		
		
		
		//`
		ARRAY INTEGER:C220(DB_ai_RowLevel; 0)
		
		ARRAY INTEGER:C220(DB_aI_HeadingLevel1; 0)  //[HEADINGS]Heading_Level
		
		ARRAY INTEGER:C220(DB_aI_HeadingLevel2; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel3; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel4; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel5; 0)
		
		ARRAY INTEGER:C220(DB_aI_ALLHeadingLevels; 0)
		
		ARRAY TEXT:C222(DB_at_ACCHHeadings1; 0)  //[HEADINGS]Heading_Code
		
		ARRAY TEXT:C222(DB_at_ACCHHeadings2; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings3; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings4; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings5; 0)
		//```
		ARRAY TEXT:C222(DB_at_HeadingNames1; 0)  //[HEADINGS]Heading_Name
		
		ARRAY TEXT:C222(DB_at_HeadingNames2; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames3; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames4; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom1; 0)  //[HEADINGS]AccCodeRangeFrom
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom2; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom3; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom4; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTO1; 0)  //[HEADINGS][HEADINGS]AccCodeRangeTo
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo2; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo3; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo4; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo5; 0)
		
		ARRAY LONGINT:C221(DB_al_HeadingEnforce1; 0)  //[HEADINGS]EnforceRange
		
		ARRAY LONGINT:C221(DB_al_HeadingEnforce2; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce3; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce4; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingGroup1; 0)  //[HEADINGS]Group_Code
		
		ARRAY TEXT:C222(DB_at_HeadingGroup2; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup3; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup4; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingLevelup1; 0)  //[HEADINGS]Level_Up_Code
		
		ARRAY TEXT:C222(DB_at_HeadingLevelup2; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup3; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup4; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup5; 0)
		
		
		
		
		ARRAY TEXT:C222(DB_at_SubHeadings; 0)
		
		QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5="")
		SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; DB_at_ACCHHeadings1; [HEADINGS:84]Heading_Level:3; DB_aI_HeadingLevel1; [HEADINGS:84]Heading_Name:2; DB_at_HeadingNames1; [HEADINGS:84]AccCodeRangeFrom:6; DB_at_HeadingAccCodeFrom1; [HEADINGS:84]AccCodeRangeTo:7; DB_at_HeadingAccCodeTO1; [HEADINGS:84]EnforceRange:8; DB_al_HeadingEnforce1; [HEADINGS:84]Group_Code:5; DB_at_HeadingGroup1; [HEADINGS:84]Level_Up_Code:4; DB_at_HeadingLevelup1)
		SORT ARRAY:C229(DB_at_ACCHHeadings1; DB_aI_HeadingLevel1; DB_at_HeadingNames1; DB_at_HeadingLevelup1; DB_at_HeadingGroup1; DB_al_HeadingEnforce1; DB_at_HeadingAccCodeTO1; DB_at_HeadingAccCodeFrom1; >)
		$_l_NumberofRows:=Size of array:C274(DB_at_ACCHHeadings1)
		ARRAY INTEGER:C220(DB_ai_RowLevel; $_l_NumberofRows)
		For ($_l_CopyRow; 1; $_l_NumberofRows)
			DB_ai_RowLevel{$_l_CopyRow}:=DB_aI_HeadingLevel1{$_l_CopyRow}
		End for 
		
		
		
		ARRAY TEXT:C222(DB_at_SubHeadings; $_l_NumberofRows)
		
		ARRAY TEXT:C222(DB_at_ACCHHeadings1; $_l_NumberofRows)  //[HEADINGS]Heading_Code
		
		ARRAY TEXT:C222(DB_at_ACCHHeadings2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_ACCHHeadings3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_ACCHHeadings4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_ACCHHeadings5; $_l_NumberofRows)
		
		
		ARRAY TEXT:C222(DB_at_HeadingNames1; $_l_NumberofRows)  //[HEADINGS]Heading_Name
		
		ARRAY TEXT:C222(DB_at_HeadingNames2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingNames3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingNames4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingNames5; $_l_NumberofRows)
		
		ARRAY INTEGER:C220(DB_aI_HeadingLevel1; $_l_NumberofRows)  //[HEADINGS]Heading_Level
		
		ARRAY INTEGER:C220(DB_aI_HeadingLevel2; $_l_NumberofRows)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel3; $_l_NumberofRows)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel4; $_l_NumberofRows)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel5; $_l_NumberofRows)
		
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom1; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom5; $_l_NumberofRows)
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTO1; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo5; $_l_NumberofRows)
		
		ARRAY LONGINT:C221(DB_al_HeadingEnforce1; $_l_NumberofRows)  //[HEADINGS]EnforceRange
		
		ARRAY LONGINT:C221(DB_al_HeadingEnforce2; $_l_NumberofRows)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce3; $_l_NumberofRows)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce4; $_l_NumberofRows)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce5; $_l_NumberofRows)
		
		ARRAY TEXT:C222(DB_at_HeadingGroup1; $_l_NumberofRows)  //[HEADINGS]Group_Code
		
		ARRAY TEXT:C222(DB_at_HeadingGroup2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingGroup3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingGroup4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingGroup5; $_l_NumberofRows)
		
		ARRAY TEXT:C222(DB_at_HeadingLevelup1; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
		
		ARRAY TEXT:C222(DB_at_HeadingLevelup2; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingLevelup3; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingLevelup4; $_l_NumberofRows)
		ARRAY TEXT:C222(DB_at_HeadingLevelup5; $_l_NumberofRows)
		
		
		
		//````````````````````````````````````````````````````
		If (Size of array:C274(DB_at_ACCHHeadings1)>0)
			$_l_HeadingIndex:=1
			$_l_NumberofRows:=0
			Repeat 
				//For ($_l_HeadingIndex;1;Size of array(DB_at_ACCHHeadings1))
				
				
				QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5=DB_at_ACCHHeadings1{$_l_HeadingIndex}; *)
				QUERY:C277([HEADINGS:84];  & ; [HEADINGS:84]Level_Up_Code:4="")
				SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_ACCHHeadings2; [HEADINGS:84]Heading_Level:3; $_ai_HeadingLevel2; [HEADINGS:84]Heading_Name:2; $_at_HeadingNames2; [HEADINGS:84]AccCodeRangeFrom:6; $_at_HeadingAccCodeFrom2; [HEADINGS:84]AccCodeRangeTo:7; $_at_HeadingAccCodeTO2; [HEADINGS:84]EnforceRange:8; $_al_HeadingEnforce2; [HEADINGS:84]Group_Code:5; $_at_HeadingGroup2; [HEADINGS:84]Level_Up_Code:4; $_at_HeadingLevelup2)
				
				//Check the integrity"
				SORT ARRAY:C229($_at_ACCHHeadings2; $_ai_HeadingLevel2; $_at_HeadingNames2; $_at_HeadingAccCodeFrom2; $_at_HeadingAccCodeTO2; $_al_HeadingEnforce2; $_at_HeadingGroup2; $_at_HeadingLevelup2)
				$_l_NumberofRows:=Size of array:C274($_at_ACCHHeadings2)
				$_l_AnalysisIndexositionofInsert:=$_l_HeadingIndex+1
				//````
				
				
				//````
				
				
				INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_ai_RowLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_at_ACCHHeadings1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Code
				
				INSERT IN ARRAY:C227(DB_at_ACCHHeadings2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_ACCHHeadings3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_ACCHHeadings4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_ACCHHeadings5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_aI_HeadingLevel1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Level
				
				INSERT IN ARRAY:C227(DB_aI_HeadingLevel2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_aI_HeadingLevel3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_aI_HeadingLevel4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_aI_HeadingLevel5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				
				INSERT IN ARRAY:C227(DB_at_HeadingNames1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Name
				
				INSERT IN ARRAY:C227(DB_at_HeadingNames2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingNames3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingNames4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingNames5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
				
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTO1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
				
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_al_HeadingEnforce1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]EnforceRange
				
				INSERT IN ARRAY:C227(DB_al_HeadingEnforce2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_al_HeadingEnforce3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_al_HeadingEnforce4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_al_HeadingEnforce5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_at_HeadingGroup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Group_Code
				
				INSERT IN ARRAY:C227(DB_at_HeadingGroup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingGroup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingGroup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingGroup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				INSERT IN ARRAY:C227(DB_at_HeadingLevelup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
				
				INSERT IN ARRAY:C227(DB_at_HeadingLevelup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingLevelup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingLevelup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				INSERT IN ARRAY:C227(DB_at_HeadingLevelup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
				
				
				
				$_l_CopyRow:=1
				$_l_Row:=$_l_HeadingIndex
				$_l_Row2:=$_l_Row+1
				$_l_SubRowsAdded:=0
				//Repeat
				For ($_l_Row2; $_l_Row+1; $_l_Row+$_l_NumberofRows)
					
					DB_ai_RowLevel{$_l_Row2}:=$_ai_HeadingLevel2{$_l_CopyRow}
					DB_ai_HeadingLevel1{$_l_Row2}:=0
					DB_ai_HeadingLevel2{$_l_Row2}:=$_ai_HeadingLevel2{$_l_CopyRow}
					DB_ai_HeadingLevel3{$_l_Row2}:=0
					DB_ai_HeadingLevel4{$_l_Row2}:=0
					DB_ai_HeadingLevel5{$_l_Row2}:=0
					
					DB_at_ACCHHeadings1{$_l_Row2}:=""
					DB_at_ACCHHeadings2{$_l_Row2}:=$_at_ACCHHeadings2{$_l_CopyRow}
					DB_at_ACCHHeadings3{$_l_Row2}:=""
					DB_at_ACCHHeadings4{$_l_Row2}:=""
					DB_at_ACCHHeadings5{$_l_Row2}:=""
					DB_at_SubHeadings{$_l_HeadingIndex}:=DB_at_SubHeadings{$_l_HeadingIndex}+$_at_ACCHHeadings2{$_l_CopyRow}+","
					DB_at_HeadingNames1{$_l_Row2}:=""
					DB_at_HeadingNames2{$_l_Row2}:=$_at_HeadingNames2{$_l_CopyRow}
					DB_at_HeadingNames3{$_l_Row2}:=""
					DB_at_HeadingNames4{$_l_Row2}:=""
					DB_at_HeadingNames5{$_l_Row2}:=""
					
					DB_at_HeadingAccCodeFrom1{$_l_Row2}:=""
					DB_at_HeadingAccCodeFrom2{$_l_Row2}:=$_at_HeadingAccCodeFrom2{$_l_CopyRow}
					DB_at_HeadingAccCodeFrom3{$_l_Row2}:=""
					DB_at_HeadingAccCodeFrom4{$_l_Row2}:=""
					DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
					
					DB_at_HeadingAccCodeTO1{$_l_Row2}:=""
					DB_at_HeadingAccCodeTO2{$_l_Row2}:=$_at_HeadingAccCodeTO2{$_l_CopyRow}
					DB_at_HeadingAccCodeTO3{$_l_Row2}:=""
					DB_at_HeadingAccCodeTO4{$_l_Row2}:=""
					DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
					
					DB_al_HeadingEnforce1{$_l_Row2}:=0
					DB_al_HeadingEnforce2{$_l_Row2}:=$_al_HeadingEnforce2{$_l_CopyRow}
					DB_al_HeadingEnforce3{$_l_Row2}:=0
					DB_al_HeadingEnforce4{$_l_Row2}:=0
					DB_al_HeadingEnforce5{$_l_Row2}:=0
					
					DB_at_HeadingGroup1{$_l_Row2}:=""
					DB_at_HeadingGroup2{$_l_Row2}:=$_at_HeadingGroup2{$_l_CopyRow}
					DB_at_HeadingGroup3{$_l_Row2}:=""
					DB_at_HeadingGroup4{$_l_Row2}:=""
					DB_at_HeadingGroup5{$_l_Row2}:=""
					
					DB_at_HeadingLevelup1{$_l_Row2}:=""
					DB_at_HeadingLevelup2{$_l_Row2}:=$_at_HeadingLevelup2{$_l_CopyRow}
					DB_at_HeadingLevelup3{$_l_Row2}:=""
					DB_at_HeadingLevelup4{$_l_Row2}:=""
					DB_at_HeadingLevelup5{$_l_Row2}:=""
					
					//DB_api_ACCHaddSubheadings{$_l_Row2}:=$_pic_AddSubHeading
					//DB_api_AddAccount2{$_l_Row2}:=$_pic_AddSubHeading
					$_l_CopyRow:=$_l_CopyRow+1
					
					
					
				End for 
				
				
				$_l_HeadingIndex:=$_l_HeadingIndex+1+$_l_NumberofRows+$_l_SubRowsAdded
				
			Until ($_l_HeadingIndex>(Size of array:C274(DB_at_ACCHHeadings1)))
			
			If (Size of array:C274(DB_at_ACCHHeadings2)>0)
				$_l_HeadingIndex:=1
				$_l_NumberofRows:=0
				Repeat 
					//For ($_l_HeadingIndex;1;Size of array(DB_at_ACCHHeadings1))
					$_l_NumberofRows:=0
					If (DB_at_ACCHHeadings2{$_l_HeadingIndex}#"")  //& (DB_at_ACCHHasChildren2{$_l_HeadingIndex})
						
						
						QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=DB_at_ACCHHeadings2{$_l_HeadingIndex})
						$_l_NumberofRows:=0
						
						SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_ACCHHeadings3; [HEADINGS:84]Heading_Level:3; $_ai_HeadingLevel3; [HEADINGS:84]Heading_Name:2; $_at_HeadingNames3; [HEADINGS:84]AccCodeRangeFrom:6; $_at_HeadingAccCodeFrom3; [HEADINGS:84]AccCodeRangeTo:7; $_at_HeadingAccCodeTO3; [HEADINGS:84]EnforceRange:8; $_al_HeadingEnforce3; [HEADINGS:84]Group_Code:5; $_at_HeadingGroup3; [HEADINGS:84]Level_Up_Code:4; $_at_HeadingLevelup3)
						SORT ARRAY:C229($_at_ACCHHeadings3; $_ai_HeadingLevel3; $_at_HeadingNames3; $_at_HeadingAccCodeFrom3; $_at_HeadingAccCodeTO3; $_al_HeadingEnforce3; $_at_HeadingGroup3; $_at_HeadingLevelup3)
						
						$_l_NumberofRows:=Size of array:C274($_at_ACCHHeadings3)
						$_l_AnalysisIndexositionofInsert:=$_l_HeadingIndex+1
						
						//``
						//``
						INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_ai_RowLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_ACCHHeadings1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Code
						
						INSERT IN ARRAY:C227(DB_at_ACCHHeadings2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_ACCHHeadings3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_ACCHHeadings4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_ACCHHeadings5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_aI_HeadingLevel1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Level
						
						INSERT IN ARRAY:C227(DB_aI_HeadingLevel2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_aI_HeadingLevel3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_aI_HeadingLevel4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_aI_HeadingLevel5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						
						INSERT IN ARRAY:C227(DB_at_HeadingNames1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Name
						
						INSERT IN ARRAY:C227(DB_at_HeadingNames2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingNames3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingNames4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingNames5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
						
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTO1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
						
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_al_HeadingEnforce1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]EnforceRange
						
						INSERT IN ARRAY:C227(DB_al_HeadingEnforce2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_al_HeadingEnforce3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_al_HeadingEnforce4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_al_HeadingEnforce5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_HeadingGroup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Group_Code
						
						INSERT IN ARRAY:C227(DB_at_HeadingGroup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingGroup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingGroup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingGroup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						INSERT IN ARRAY:C227(DB_at_HeadingLevelup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
						
						INSERT IN ARRAY:C227(DB_at_HeadingLevelup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingLevelup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingLevelup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						INSERT IN ARRAY:C227(DB_at_HeadingLevelup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
						
						
						$_l_CopyRow:=1
						$_l_Row:=$_l_HeadingIndex
						$_l_Row2:=$_l_Row+1
						$_l_SubRowsAdded:=0
						//Repeat
						For ($_l_Row2; $_l_Row+1; $_l_Row+$_l_NumberofRows)
							//DB_ab_HeadersExpanded{$_l_Row2}:=False
							DB_ai_RowLevel{$_l_Row2}:=$_ai_HeadingLevel3{$_l_CopyRow}
							DB_ai_HeadingLevel1{$_l_Row2}:=0
							DB_ai_HeadingLevel2{$_l_Row2}:=0
							DB_ai_HeadingLevel3{$_l_Row2}:=$_ai_HeadingLevel3{$_l_CopyRow}
							DB_ai_HeadingLevel4{$_l_Row2}:=0
							DB_ai_HeadingLevel5{$_l_Row2}:=0
							
							DB_at_ACCHHeadings1{$_l_Row2}:=""
							DB_at_ACCHHeadings2{$_l_Row2}:=""
							DB_at_ACCHHeadings3{$_l_Row2}:=$_at_ACCHHeadings3{$_l_CopyRow}
							DB_at_ACCHHeadings4{$_l_Row2}:=""
							DB_at_ACCHHeadings5{$_l_Row2}:=""
							DB_at_SubHeadings{$_l_HeadingIndex}:=DB_at_SubHeadings{$_l_HeadingIndex}+$_at_ACCHHeadings3{$_l_CopyRow}+","
							$_bo_AnalysisFound:=False:C215
							For ($_l_AnalysisIndex; $_l_HeadingIndex; 1; -1)
								Case of 
									: ((DB_at_ACCHHeadings1{$_l_AnalysisIndex}#"") & (Not:C34($_bo_AnalysisFound)))
										DB_at_SubHeadings{$_l_AnalysisIndex}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings3{$_l_CopyRow}+","
										$_bo_AnalysisFound:=True:C214
								End case 
							End for 
							
							DB_at_HeadingNames1{$_l_Row2}:=""
							DB_at_HeadingNames2{$_l_Row2}:=""
							DB_at_HeadingNames3{$_l_Row2}:=$_at_HeadingNames3{$_l_CopyRow}
							DB_at_HeadingNames4{$_l_Row2}:=""
							DB_at_HeadingNames5{$_l_Row2}:=""
							
							DB_at_HeadingAccCodeFrom1{$_l_Row2}:=""
							DB_at_HeadingAccCodeFrom2{$_l_Row2}:=""
							DB_at_HeadingAccCodeFrom3{$_l_Row2}:=$_at_HeadingAccCodeFrom3{$_l_CopyRow}
							DB_at_HeadingAccCodeFrom4{$_l_Row2}:=""
							DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
							
							DB_at_HeadingAccCodeTO1{$_l_Row2}:=""
							DB_at_HeadingAccCodeTO2{$_l_Row2}:=""
							DB_at_HeadingAccCodeTO3{$_l_Row2}:=$_at_HeadingAccCodeTO3{$_l_CopyRow}
							DB_at_HeadingAccCodeTO4{$_l_Row2}:=""
							DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
							
							DB_al_HeadingEnforce1{$_l_Row2}:=0
							DB_al_HeadingEnforce2{$_l_Row2}:=0
							DB_al_HeadingEnforce3{$_l_Row2}:=$_al_HeadingEnforce3{$_l_CopyRow}
							DB_al_HeadingEnforce4{$_l_Row2}:=0
							DB_al_HeadingEnforce5{$_l_Row2}:=0
							
							DB_at_HeadingGroup1{$_l_Row2}:=""
							DB_at_HeadingGroup2{$_l_Row2}:=""
							DB_at_HeadingGroup3{$_l_Row2}:=$_at_HeadingGroup3{$_l_CopyRow}
							DB_at_HeadingGroup4{$_l_Row2}:=""
							DB_at_HeadingGroup5{$_l_Row2}:=""
							
							DB_at_HeadingLevelup1{$_l_Row2}:=""
							DB_at_HeadingLevelup2{$_l_Row2}:=""
							DB_at_HeadingLevelup3{$_l_Row2}:=$_at_HeadingLevelup3{$_l_CopyRow}
							DB_at_HeadingLevelup4{$_l_Row2}:=""
							DB_at_HeadingLevelup5{$_l_Row2}:=""
							
							//DB_api_ACCHaddSubheadings3{$_l_Row2}:=$_pic_AddSubHeading
							//DB_api_AddAccount3{$_l_Row2}:=$_pic_AddSubHeading
							
							$_l_CopyRow:=$_l_CopyRow+1
							
							
							
							
						End for 
						
						
					End if 
					$_l_HeadingIndex:=$_l_HeadingIndex+1+$_l_NumberofRows
					
				Until ($_l_HeadingIndex>(Size of array:C274(DB_at_ACCHHeadings2)))
				//```
				If (Size of array:C274(DB_at_ACCHHeadings3)>0)
					$_l_HeadingIndex:=1
					$_l_NumberofRows:=0
					Repeat 
						
						
						$_l_NumberofRows:=0
						If (DB_at_ACCHHeadings3{$_l_HeadingIndex}#"")  //& (DB_at_ACCHHasChildren3{$_l_HeadingIndex})
							
							
							QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=DB_at_ACCHHeadings3{$_l_HeadingIndex})
							
							
							
							SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_ACCHHeadings4; [HEADINGS:84]Heading_Level:3; $_ai_HeadingLevel4; [HEADINGS:84]Heading_Name:2; $_at_HeadingNames4; [HEADINGS:84]AccCodeRangeFrom:6; $_at_HeadingAccCodeFrom4; [HEADINGS:84]AccCodeRangeTo:7; $_at_HeadingAccCodeTO4; [HEADINGS:84]EnforceRange:8; $_al_HeadingEnforce4; [HEADINGS:84]Group_Code:5; $_at_HeadingGroup4; [HEADINGS:84]Level_Up_Code:4; $_at_HeadingLevelup4)
							SORT ARRAY:C229($_at_ACCHHeadings4; $_ai_HeadingLevel4; $_at_HeadingNames4; $_at_HeadingAccCodeFrom4; $_at_HeadingAccCodeTO4; $_al_HeadingEnforce4; $_at_HeadingGroup4; $_at_HeadingLevelup4)
							
							$_l_NumberofRows:=Size of array:C274($_at_ACCHHeadings4)
							$_l_AnalysisIndexositionofInsert:=$_l_HeadingIndex+1
							
							//``
							
							INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_ai_RowLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_at_ACCHHeadings1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Code
							
							INSERT IN ARRAY:C227(DB_at_ACCHHeadings2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_ACCHHeadings3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_ACCHHeadings4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_ACCHHeadings5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_aI_HeadingLevel1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Level
							
							INSERT IN ARRAY:C227(DB_aI_HeadingLevel2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_aI_HeadingLevel3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_aI_HeadingLevel4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_aI_HeadingLevel5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							
							INSERT IN ARRAY:C227(DB_at_HeadingNames1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Name
							
							INSERT IN ARRAY:C227(DB_at_HeadingNames2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingNames3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingNames4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingNames5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
							
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTO1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
							
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_al_HeadingEnforce1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]EnforceRange
							
							INSERT IN ARRAY:C227(DB_al_HeadingEnforce2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_al_HeadingEnforce3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_al_HeadingEnforce4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_al_HeadingEnforce5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_at_HeadingGroup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Group_Code
							
							INSERT IN ARRAY:C227(DB_at_HeadingGroup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingGroup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingGroup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingGroup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							INSERT IN ARRAY:C227(DB_at_HeadingLevelup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
							
							INSERT IN ARRAY:C227(DB_at_HeadingLevelup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingLevelup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingLevelup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							INSERT IN ARRAY:C227(DB_at_HeadingLevelup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
							
							
							
							$_l_CopyRow:=1
							$_l_Row:=$_l_HeadingIndex
							$_l_Row2:=$_l_Row+1
							$_l_SubRowsAdded:=0
							
							For ($_l_Row2; $_l_Row+1; $_l_Row+$_l_NumberofRows)
								
								DB_ai_RowLevel{$_l_Row2}:=$_ai_HeadingLevel4{$_l_CopyRow}
								DB_ai_HeadingLevel1{$_l_Row2}:=0
								DB_ai_HeadingLevel2{$_l_Row2}:=0
								DB_ai_HeadingLevel3{$_l_Row2}:=0
								DB_ai_HeadingLevel4{$_l_Row2}:=$_ai_HeadingLevel4{$_l_CopyRow}
								DB_ai_HeadingLevel5{$_l_Row2}:=0
								
								DB_at_ACCHHeadings1{$_l_Row2}:=""
								DB_at_ACCHHeadings2{$_l_Row2}:=""
								DB_at_ACCHHeadings3{$_l_Row2}:=""
								DB_at_ACCHHeadings4{$_l_Row2}:=$_at_ACCHHeadings4{$_l_CopyRow}
								DB_at_ACCHHeadings5{$_l_Row2}:=""
								DB_at_SubHeadings{$_l_HeadingIndex}:=DB_at_SubHeadings{$_l_HeadingIndex}+$_at_ACCHHeadings4{$_l_CopyRow}+","
								
								$_bo_Analysis1Found:=False:C215
								$_bo_Analysis1Found:=False:C215
								For ($_l_AnalysisIndex; $_l_HeadingIndex; 1; -1)
									Case of 
										: ((DB_at_ACCHHeadings2{$_l_AnalysisIndex}#"") & (Not:C34($_bo_Analysis1Found)))
											DB_at_SubHeadings{$_l_AnalysisIndex}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings4{$_l_CopyRow}+","
											$_bo_Analysis1Found:=True:C214
										: ((DB_at_ACCHHeadings1{$_l_AnalysisIndex}#"") & (Not:C34($_bo_Analysis1Found)))
											DB_at_SubHeadings{$_l_AnalysisIndex}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings4{$_l_CopyRow}+","
											$_bo_Analysis2Found:=True:C214
											
									End case 
								End for 
								DB_at_HeadingNames1{$_l_Row2}:=""
								DB_at_HeadingNames2{$_l_Row2}:=""
								DB_at_HeadingNames3{$_l_Row2}:=""
								DB_at_HeadingNames4{$_l_Row2}:=$_at_HeadingNames4{$_l_CopyRow}
								DB_at_HeadingNames5{$_l_Row2}:=""
								
								DB_at_HeadingAccCodeFrom1{$_l_Row2}:=""
								DB_at_HeadingAccCodeFrom2{$_l_Row2}:=""
								DB_at_HeadingAccCodeFrom3{$_l_Row2}:=""
								DB_at_HeadingAccCodeFrom4{$_l_Row2}:=$_at_HeadingAccCodeFrom4{$_l_CopyRow}
								DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
								
								DB_at_HeadingAccCodeTO1{$_l_Row2}:=""
								DB_at_HeadingAccCodeTO2{$_l_Row2}:=""
								DB_at_HeadingAccCodeTO3{$_l_Row2}:=""
								DB_at_HeadingAccCodeTO4{$_l_Row2}:=$_at_HeadingAccCodeTO4{$_l_CopyRow}
								DB_at_HeadingAccCodeFrom5{$_l_Row2}:=""
								
								DB_al_HeadingEnforce1{$_l_Row2}:=0
								DB_al_HeadingEnforce2{$_l_Row2}:=0
								DB_al_HeadingEnforce3{$_l_Row2}:=0
								DB_al_HeadingEnforce4{$_l_Row2}:=$_al_HeadingEnforce4{$_l_CopyRow}
								DB_al_HeadingEnforce5{$_l_Row2}:=0
								
								DB_at_HeadingGroup1{$_l_Row2}:=""
								DB_at_HeadingGroup2{$_l_Row2}:=""
								DB_at_HeadingGroup3{$_l_Row2}:=""
								DB_at_HeadingGroup4{$_l_Row2}:=$_at_HeadingGroup4{$_l_CopyRow}
								DB_at_HeadingGroup5{$_l_Row2}:=""
								
								DB_at_HeadingLevelup1{$_l_Row2}:=""
								DB_at_HeadingLevelup2{$_l_Row2}:=""
								DB_at_HeadingLevelup3{$_l_Row2}:=""
								DB_at_HeadingLevelup4{$_l_Row2}:=$_at_HeadingLevelup4{$_l_CopyRow}
								DB_at_HeadingLevelup5{$_l_Row2}:=""
								
								//DB_api_ACCHaddSubheadings4{$_l_Row2}:=$_pic_AddSubHeading
								//DB_api_AddAccount4{$_l_Row2}:=$_pic_AddSubHeading
								$_l_CopyRow:=$_l_CopyRow+1
								
								
								
								
							End for 
							
							
						End if 
						$_l_HeadingIndex:=$_l_HeadingIndex+1+$_l_NumberofRows
						
					Until ($_l_HeadingIndex>(Size of array:C274(DB_at_ACCHHeadings3)))
					
					
					If (Size of array:C274(DB_at_ACCHHeadings4)>0)
						$_l_HeadingIndex:=1
						$_l_NumberofRows:=0
						Repeat 
							
							$_l_NumberofRows:=0
							If (DB_at_ACCHHeadings4{$_l_HeadingIndex}#"")  // & (DB_at_ACCHHasChildren4{$_l_HeadingIndex})
								
								
								QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=DB_at_ACCHHeadings4{$_l_HeadingIndex})
								
								
								
								SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_ACCHHeadings5; [HEADINGS:84]Heading_Level:3; $_aI_HeadingLevel5; [HEADINGS:84]Heading_Name:2; $_at_HeadingNames5; [HEADINGS:84]AccCodeRangeFrom:6; $_at_HeadingAccCodeFrom5; [HEADINGS:84]AccCodeRangeTo:7; $_at_HeadingAccCodeTO5; [HEADINGS:84]EnforceRange:8; $_al_HeadingEnforce5; [HEADINGS:84]Group_Code:5; $_at_HeadingGroup5; [HEADINGS:84]Level_Up_Code:4; $_at_HeadingLevelup5)
								SORT ARRAY:C229($_at_ACCHHeadings5; $_aI_HeadingLevel5; $_at_HeadingNames5; $_at_HeadingAccCodeFrom5; $_at_HeadingAccCodeTO5; $_al_HeadingEnforce5; $_at_HeadingGroup5; $_at_HeadingLevelup5)
								
								$_l_NumberofRows:=Size of array:C274($_at_ACCHHeadings5)
								$_l_AnalysisIndexositionofInsert:=$_l_HeadingIndex+1
								
								//``
								
								INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_ai_RowLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Code
								
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Level
								
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								
								INSERT IN ARRAY:C227(DB_at_HeadingNames1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Name
								
								INSERT IN ARRAY:C227(DB_at_HeadingNames2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTO1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]EnforceRange
								
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingGroup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Group_Code
								
								INSERT IN ARRAY:C227(DB_at_HeadingGroup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
								
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								
								
								
								
								$_l_CopyRow:=1
								$_l_Row:=$_l_HeadingIndex
								$_l_Row2:=$_l_Row+1
								$_l_SubRowsAdded:=0
								//Repeat
								For ($_l_Row2; $_l_Row+1; $_l_Row+$_l_NumberofRows)
									//DB_ab_HeadersExpanded{$_l_Row2}:=False
									DB_ai_RowLevel{$_l_Row2}:=$_aI_HeadingLevel5{$_l_CopyRow}
									DB_ai_HeadingLevel1{$_l_Row2}:=0
									DB_ai_HeadingLevel2{$_l_Row2}:=0
									DB_ai_HeadingLevel3{$_l_Row2}:=0
									DB_ai_HeadingLevel4{$_l_Row2}:=0
									DB_ai_HeadingLevel5{$_l_Row2}:=$_aI_HeadingLevel5{$_l_CopyRow}
									
									DB_at_ACCHHeadings1{$_l_Row2}:=""
									DB_at_ACCHHeadings2{$_l_Row2}:=""
									DB_at_ACCHHeadings3{$_l_Row2}:=""
									DB_at_ACCHHeadings4{$_l_Row2}:=""
									DB_at_ACCHHeadings5{$_l_Row2}:=$_at_ACCHHeadings5{$_l_CopyRow}
									DB_at_SubHeadings{$_l_HeadingIndex}:=DB_at_SubHeadings{$_l_HeadingIndex}+$_at_ACCHHeadings5{$_l_CopyRow}+","
									//$LEVEL1:=$_ai_HeadingLevel3{$_l_CopyRow}
									$_bo_AnalysisIndex1Found:=False:C215
									$_bo_AnalysisIndex2Found:=False:C215
									$_bo_AnalysisIndex3Found:=False:C215
									For ($_l_AnalysisIndex; $_l_HeadingIndex; 1; -1)
										Case of 
											: ((DB_at_ACCHHeadings2{$_l_AnalysisIndex}#"") & (Not:C34($_bo_AnalysisIndex1Found)))
												DB_at_SubHeadings{$_l_AnalysisIndexarent}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings5{$_l_CopyRow}+","
												$_bo_AnalysisIndex1Found:=True:C214
											: ((DB_at_ACCHHeadings1{$_l_AnalysisIndex}#"") & (Not:C34($_bo_AnalysisIndex2Found)))
												DB_at_SubHeadings{$_l_AnalysisIndexarent}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings5{$_l_CopyRow}+","
												$_bo_AnalysisIndex2Found:=True:C214
											: ((DB_at_ACCHHeadings1{$_l_AnalysisIndex}#"") & (Not:C34($_bo_AnalysisIndex3Found)))
												DB_at_SubHeadings{$_l_AnalysisIndex}:=DB_at_SubHeadings{$_l_AnalysisIndex}+$_at_ACCHHeadings5{$_l_CopyRow}+","
												$_bo_AnalysisIndex3Found:=True:C214
												
										End case 
									End for 
									
									DB_at_HeadingNames1{$_l_Row2}:=""
									DB_at_HeadingNames2{$_l_Row2}:=""
									DB_at_HeadingNames3{$_l_Row2}:=""
									DB_at_HeadingNames4{$_l_Row2}:=""
									DB_at_HeadingNames5{$_l_Row2}:=$_at_HeadingNames5{$_l_CopyRow}
									
									DB_at_HeadingAccCodeFrom1{$_l_Row2}:=""
									DB_at_HeadingAccCodeFrom2{$_l_Row2}:=""
									DB_at_HeadingAccCodeFrom3{$_l_Row2}:=""
									DB_at_HeadingAccCodeFrom4{$_l_Row2}:=""
									DB_at_HeadingAccCodeFrom5{$_l_Row2}:=$_at_HeadingAccCodeFrom5{$_l_CopyRow}
									
									DB_at_HeadingAccCodeTO1{$_l_Row2}:=""
									DB_at_HeadingAccCodeTO2{$_l_Row2}:=""
									DB_at_HeadingAccCodeTO3{$_l_Row2}:=""
									DB_at_HeadingAccCodeTO4{$_l_Row2}:=""
									DB_at_HeadingAccCodeFrom5{$_l_Row2}:=$_at_HeadingAccCodeTO5{$_l_CopyRow}
									
									DB_al_HeadingEnforce1{$_l_Row2}:=0
									DB_al_HeadingEnforce2{$_l_Row2}:=0
									DB_al_HeadingEnforce3{$_l_Row2}:=0
									DB_al_HeadingEnforce4{$_l_Row2}:=0
									DB_al_HeadingEnforce5{$_l_Row2}:=$_al_HeadingEnforce5{$_l_CopyRow}
									
									DB_at_HeadingGroup1{$_l_Row2}:=""
									DB_at_HeadingGroup2{$_l_Row2}:=""
									DB_at_HeadingGroup3{$_l_Row2}:=""
									DB_at_HeadingGroup4{$_l_Row2}:=""
									DB_at_HeadingGroup5{$_l_Row2}:=$_at_HeadingGroup5{$_l_CopyRow}
									
									
									DB_at_HeadingLevelup1{$_l_Row2}:=""
									DB_at_HeadingLevelup2{$_l_Row2}:=""
									DB_at_HeadingLevelup3{$_l_Row2}:=""
									DB_at_HeadingLevelup4{$_l_Row2}:=""
									DB_at_HeadingLevelup5{$_l_Row2}:=$_at_HeadingLevelup5{$_l_CopyRow}
									//DB_api_ACCHaddSubheadings4{$_l_Row2}:=$_pic_AddSubHeading
									DB_apic_AddAccount{$_l_Row2}:=$_pic_AddSubHeading
									$_l_CopyRow:=$_l_CopyRow+1
									
									
									
									
								End for 
								
								
							End if 
							$_l_HeadingIndex:=$_l_HeadingIndex+1+$_l_NumberofRows
							
						Until ($_l_HeadingIndex>(Size of array:C274(DB_at_ACCHHeadings3)))
						
						
					End if 
					ARRAY TEXT:C222(DB_at_Headings; 0)
					ARRAY TEXT:C222(DB_At_headingNames; 0)
					ARRAY TEXT:C222(DB_At_SubHeadingLevel; 0)
					ARRAY PICTURE:C279(DB_apic_AddSubHeading; 0)
					ARRAY PICTURE:C279(DB_apic_AddAccount; 0)
					ARRAY TEXT:C222(DB_at_HeadingACCRange; 0)
					
					//`````
					ARRAY TEXT:C222(DB_at_Headings; Size of array:C274(DB_at_ACCHHeadings5))
					ARRAY TEXT:C222(DB_At_headingNames; Size of array:C274(DB_at_ACCHHeadings5))
					ARRAY TEXT:C222(DB_At_SubHeadingLevel; Size of array:C274(DB_at_ACCHHeadings5))
					ARRAY PICTURE:C279(DB_apic_AddSubHeading; Size of array:C274(DB_at_ACCHHeadings5))
					ARRAY PICTURE:C279(DB_apic_AddAccount; Size of array:C274(DB_at_ACCHHeadings5))
					ARRAY TEXT:C222(DB_at_HeadingACCRange; Size of array:C274(DB_at_ACCHHeadings5))
					//TRACE
					$_t_Space:="    "
					For ($_l_CopyRow; 1; Size of array:C274(DB_at_Headings))
						
						Case of 
								
							: (DB_at_ACCHHeadings1{$_l_CopyRow}#"")
								
								DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings1{$_l_CopyRow}
								DB_At_headingNames{$_l_CopyRow}:=DB_at_HeadingNames1{$_l_CopyRow}
								DB_At_SubHeadingLevel{$_l_CopyRow}:=""
								If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
									If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom1{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO1{$_l_CopyRow}
									Else 
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom1{$_l_CopyRow}
									End if 
								End if 
								
							: (DB_at_ACCHHeadings2{$_l_CopyRow}#"")
								
								DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings2{$_l_CopyRow}
								DB_At_headingNames{$_l_CopyRow}:=($_t_Space*2)+DB_at_HeadingNames2{$_l_CopyRow}
								DB_At_SubHeadingLevel{$_l_CopyRow}:="One"
								If (DB_at_HeadingAccCodeFrom2{$_l_CopyRow}#"")
									If (DB_at_HeadingAccCodeTO2{$_l_CopyRow}#"")
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO2{$_l_CopyRow}
									Else 
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow}
									End if 
								End if 
							: (DB_at_ACCHHeadings3{$_l_CopyRow}#"")
								
								DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings3{$_l_CopyRow}
								DB_At_headingNames{$_l_CopyRow}:=($_t_Space*4)+DB_at_HeadingNames3{$_l_CopyRow}
								DB_At_SubHeadingLevel{$_l_CopyRow}:="Two"
								If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
									If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO3{$_l_CopyRow}
									Else 
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow}
									End if 
								End if 
								
							: (DB_at_ACCHHeadings4{$_l_CopyRow}#"")
								
								DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings4{$_l_CopyRow}
								DB_At_headingNames{$_l_CopyRow}:=($_t_Space*6)+DB_at_HeadingNames4{$_l_CopyRow}
								DB_At_SubHeadingLevel{$_l_CopyRow}:="Three"
								
								If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
									If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO4{$_l_CopyRow}
									Else 
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow}
									End if 
								End if 
							: (DB_at_ACCHHeadings5{$_l_CopyRow}#"")
								
								DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings5{$_l_CopyRow}
								DB_At_headingNames{$_l_CopyRow}:=($_t_Space*8)+DB_at_HeadingNames5{$_l_CopyRow}
								DB_At_SubHeadingLevel{$_l_CopyRow}:="Four"
								If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
									If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO5{$_l_CopyRow}
									Else 
										DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow}
									End if 
								End if 
								
						End case 
						
						DB_apic_AddSubHeading{$_l_CopyRow}:=$_pic_AddSubHeading
						DB_apic_AddAccount{$_l_CopyRow}:=$_pic_AddSubHeading
						
					End for 
					
					//````````````
					If (Size of array:C274(DB_at_ACCHHeadings5)>0)  //Here we attach the accounts
						
						$_l_ArraySIze:=Size of array:C274(DB_at_ACCHHeadings5)
						
						
						
						
						ARRAY TEXT:C222(DB_at_AccountCodes; $_l_ArraySIze)  //[ACCOUNTS]Account_Code
						ARRAY TEXT:C222(DB_at_AccountNames; $_l_ArraySIze)  //[ACCOUNTS]Account_Name
						ARRAY TEXT:C222(DB_at_AccountHeadings; $_l_ArraySIze)  //[ACCOUNTS]Group_Heading
						
						
						
						//ARRAY TEXT(DB_at_AccountHeadingNames;$_l_ArraySIze)
						ARRAY TEXT:C222(DB_at_ReportHeadings; $_l_ArraySIze)  //[ACCOUNTS]Report_Heading
						
						//ARRAY TEXT(DB_at_ReportHeadingNames;$_l_ArraySIze)
						ARRAY TEXT:C222(DB_at_AccountPreferenceGroups; $_l_ArraySIze)  //[ACCOUNTS]xinternalAccountGroup
						ARRAY BOOLEAN:C223(DB_abo_AccountDefault; $_l_ArraySIze)  //[ACCOUNTS]xDefaultAccountWithinGroup<<<<
						ARRAY TEXT:C222(DB_at_AccountIO; $_l_ArraySIze)  //[ACCOUNTS]IO
						ARRAY LONGINT:C221(DB_al_MultiCurrencyValuation; $_l_ArraySIze)  //[ACCOUNTS]Multicurrency_Valuation
						
						
						
						
						ARRAY TEXT:C222(DB_at_MultiCurrencyValuation; $_l_ArraySIze)
						ARRAY BOOLEAN:C223(DB_abo_NoNominalLedgerPostings; $_l_ArraySIze)  //[ACCOUNTS]No_NL_Postings
						ARRAY TEXT:C222(DB_at_ProfitBalance; $_l_ArraySIze)  //[ACCOUNTS]PB
						ARRAY TEXT:C222(DB_at_AnalysisCodes; $_l_ArraySIze)  //Bssed on [ACCOUNTS]xAnalysisCodes
						ARRAY TEXT:C222(DB_at_LayerCodes; $_l_ArraySIze)  // based on [ACCOUNTS]xLayerCodes
						
						
						
						
						
						
						//```
						$_l_HeadingIndex:=1
						
						$_l_NumberofRows:=0
						Repeat 
							
							Case of 
								: (DB_at_ACCHHeadings5{$_l_HeadingIndex}#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=DB_at_ACCHHeadings5{$_l_HeadingIndex})
									
								: (DB_at_ACCHHeadings4{$_l_HeadingIndex}#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=DB_at_ACCHHeadings4{$_l_HeadingIndex})
									
								: (DB_at_ACCHHeadings3{$_l_HeadingIndex}#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=DB_at_ACCHHeadings3{$_l_HeadingIndex})
									
								: (DB_at_ACCHHeadings2{$_l_HeadingIndex}#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=DB_at_ACCHHeadings2{$_l_HeadingIndex})
								: (DB_at_ACCHHeadings1{$_l_HeadingIndex}#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=DB_at_ACCHHeadings1{$_l_HeadingIndex})
							End case 
							$_l_NumberofRows:=0
							
							If (Records in selection:C76([ACCOUNTS:32])>0)
								//DB_api_ACCHExpand5{$_l_HeadingIndex}:=$_l_AnalysisIndexictureExpanded
								//DB_ab_HeadersExpanded{$_l_HeadingIndex}:=True
								$_bo_AccountsDisplayed:=True:C214
								//````````````
								SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; $_at_AccountCodes; [ACCOUNTS:32]Account_Name:3; $_at_AccountNames; *)
								SELECTION TO ARRAY:C260([ACCOUNTS:32]Group_Heading:6; $_at_AccountHeadings; [ACCOUNTS:32]Report_Heading:1; $_at_ReportHeadings; *)
								SELECTION TO ARRAY:C260([ACCOUNTS:32]IO:5; $_at_AccountIO; [ACCOUNTS:32]Multicurrency_Valuation:10; $_al_MultiCurrencyValuation; *)
								SELECTION TO ARRAY:C260([ACCOUNTS:32]No_NL_Postings:9; $_abo_NoNominalLedgerPostings; [ACCOUNTS:32]PB:4; $_at_ProfitBalance; *)
								SELECTION TO ARRAY:C260([ACCOUNTS:32]xinternalAccountGroup:7; $_at_AccountPreferenceGroups; [ACCOUNTS:32]xDefaultAccountWithinGroup:8; $_abo_AccountDefault)
								
								SORT ARRAY:C229($_at_AccountCodes; $_at_AccountNames; $_at_AccountHeadings; $_at_ReportHeadings; $_at_AccountIO; $_al_MultiCurrencyValuation; $_abo_NoNominalLedgerPostings; $_at_ProfitBalance; $_at_AccountPreferenceGroups; $_abo_AccountDefault)
								
								ARRAY TEXT:C222($_at_MultiCurrencyValuation; Size of array:C274($_at_AccountCodes))
								ARRAY TEXT:C222($_at_AnalysisCodes; Size of array:C274($_at_AccountCodes))
								ARRAY TEXT:C222($_at_LayerCodes; Size of array:C274($_at_AccountCodes))
								
								If (DM_T_BankAccFrom#"")
									$_l_BankFromRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccFrom)
									If ($_l_BankFromRow>0)
										If ($_at_AccountPreferenceGroups{$_l_BankFromRow}="")
											$_at_AccountPreferenceGroups{$_l_BankFromRow}:="Bank Accounts"
											If (DM_T_BankAccTo#"")
												For ($_l_AccountsIndex; $_l_BankFromRow+1; Size of array:C274($_at_AccountCodes))
													If (DM_T_BankAccTo>=$_at_AccountCodes{$_l_AccountsIndex})
														If ($_at_AccountPreferenceGroups{$_l_AccountsIndex}="")
															$_at_AccountPreferenceGroups{$_l_AccountsIndex}:="Bank Accounts"
														End if 
													Else 
														$_l_AccountsIndex:=Size of array:C274($_at_AccountCodes)
														
													End if 
												End for 
											End if 
										End if 
									End if 
								End if 
								If (DM_T_BankAccCurrencyExchange#"")
									$_l_ExchangeFromRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccCurrencyExchange)
									If ($_l_ExchangeFromRow>0)
										If ($_at_AccountPreferenceGroups{$_l_ExchangeFromRow}="")
											$_at_AccountPreferenceGroups{$_l_ExchangeFromRow}:="Currency Exchange Control"
										End if 
									End if 
								End if 
								If (DM_T_BankAccCurrencyCharges#"")
									$_l_ChargesRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccCurrencyCharges)
									If ($_l_ChargesRow>0)
										If ($_at_AccountPreferenceGroups{$_l_ChargesRow}="")
											$_at_AccountPreferenceGroups{$_l_ChargesRow}:="Currency Bank Charges"
										End if 
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitBFWD#"")
									$_l_FromRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccBalanceProfitBFWD)
									If ($_l_FromRow>0)
										If ($_at_AccountPreferenceGroups{$_l_FromRow}="")
											$_at_AccountPreferenceGroups{$_l_FromRow}:="Balance Sheet Profit Brought Forward Account"
										End if 
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitYTD#"")
									$_l_ProfitYTDRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccBalanceProfitYTD)
									If ($_l_ProfitYTDRow>0)
										If ($_at_AccountPreferenceGroups{$_l_ProfitYTDRow}="")
											$_at_AccountPreferenceGroups{$_l_ProfitYTDRow}:="Balance Sheet Profit Year to Date Account"
										End if 
									End if 
								End if 
								If (DM_T_BankAccBalanceAdjustments#"")
									$_l_AdjustmentsRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccBalanceAdjustments)
									If ($_l_AdjustmentsRow>0)
										If ($_at_AccountPreferenceGroups{$_l_AdjustmentsRow}="")
											$_at_AccountPreferenceGroups{$_l_AdjustmentsRow}:="Balance Sheet Adjusment Account"
										End if 
									End if 
								End if 
								
								If (DM_T_nomVatInput#"")
									$_l_NomVatRow:=Find in array:C230($_at_AccountCodes; DM_T_nomVatInput)
									If ($_l_NomVatRow>0)
										If ($_at_AccountPreferenceGroups{$_l_NomVatRow}="")
											$_at_AccountPreferenceGroups{$_l_NomVatRow}:=$_t_VatReturn
										End if 
									End if 
								End if 
								If (DM_T_nomVatOutput#"")
									$_l_AccountCodeRow:=Find in array:C230($_at_AccountCodes; DM_T_nomVatOutput)
									If ($_l_AccountCodeRow>0)
										If ($_at_AccountPreferenceGroups{$_l_AccountCodeRow}="")
											$_at_AccountPreferenceGroups{$_l_AccountCodeRow}:=$_t_VatPayment
										End if 
									End if 
								End if 
								
								If (DM_T_BankAccCashFrom#"")
									$_l_AccountCodeRow:=Find in array:C230($_at_AccountCodes; DM_T_BankAccCashFrom)
									If ($_l_AccountCodeRow>0)
										If ($_at_AccountPreferenceGroups{$_l_AccountCodeRow}="")
											$_at_AccountPreferenceGroups{$_l_AccountCodeRow}:="Cash Accounts"
											If (DM_T_BankAccCashTo#"")
												For ($_l_AccountsIndex; $_l_AccountCodeRow+1; Size of array:C274($_at_AccountCodes))
													If (DM_T_BankAccCashTo>=$_at_AccountCodes{$_l_AccountsIndex})
														If ($_at_AccountPreferenceGroups{$_l_AccountsIndex}="")
															$_at_AccountPreferenceGroups{$_l_AccountsIndex}:="Cash Accounts"
														End if 
													Else 
														$_l_AccountsIndex:=Size of array:C274($_at_AccountCodes)
													End if 
												End for 
											End if 
										End if 
									End if 
									
								End if 
								For ($_l_AccountsIndex; 1; Size of array:C274($_at_MultiCurrencyValuation))
									Case of 
										: ($_al_MultiCurrencyValuation{$_l_AccountsIndex}=2)
											$_at_MultiCurrencyValuation{$_l_AccountsIndex}:="Historical Rate"
										: ($_al_MultiCurrencyValuation{$_l_AccountsIndex}=1)
											$_at_MultiCurrencyValuation{$_l_AccountsIndex}:="Current Rate"
										Else 
											If ($_at_ProfitBalance{$_l_AccountsIndex}="P")
												$_at_MultiCurrencyValuation{$_l_AccountsIndex}:="Historical Rate"
											Else 
												$_at_MultiCurrencyValuation{$_l_AccountsIndex}:="Current Rate"
											End if 
									End case 
									QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=$_at_AccountCodes{$_l_AccountsIndex})
									If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_AnalysisIndex; 1; Size of array:C274($_at_LayerCodes))
											If ($_l_AnalysisIndex=1)
												$_at_LayerCodes{$_l_AccountsIndex}:=$_at_LayerCodes{$_l_AnalysisIndex}
											Else 
												$_at_LayerCodes{$_l_AccountsIndex}:=$_at_LayerCodes{$_l_AccountsIndex}+", "+$_at_LayerCodes{$_l_AnalysisIndex}
											End if 
										End for 
										
									End if 
									QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=$_at_AccountCodes{$_l_AccountsIndex})
									If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysisCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysisCodes))
											If ($_l_AnalysisIndex=1)
												$_at_AnalysisCodes{$_l_AccountsIndex}:=$_at_AnalysisCodes{$_l_AnalysisIndex}
											Else 
												$_at_AnalysisCodes{$_l_AccountsIndex}:=$_at_AnalysisCodes{$_l_AccountsIndex}+", "+$_at_AnalysisCodes{$_l_AnalysisIndex}
											End if 
										End for 
										
									End if 
									
									
									
								End for 
								
								
								$_l_NumberofRows:=Size of array:C274($_at_AccountCodes)
								$_l_AnalysisIndexositionofInsert:=$_l_HeadingIndex+1
								
								//``
								INSERT IN ARRAY:C227(DB_at_AccountCodes; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_AccountNames; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_AccountPreferenceGroups; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_AccountIO; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_MultiCurrencyValuation; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_MultiCurrencyValuation; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_abo_NoNominalLedgerPostings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ProfitBalance; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_AnalysisCodes; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_LayerCodes; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_abo_AccountDefault; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								//``
								INSERT IN ARRAY:C227(DB_at_AccountHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[ACCOUNTS]Group_Heading
								
								//INSERT IN ARRAY(DB_at_AccountHeadingNames;$_l_AnalysisIndexositionofInsert;$_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ReportHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[ACCOUNTS]Report_Heading
								
								//INSERT IN ARRAY(DB_at_ReportHeadingNames;$_l_AnalysisIndexositionofInsert;$_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_abo_AccountDefault; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[ACCOUNTS]xDefaultAccountWithinGroup<<<<
								
								
								
								INSERT IN ARRAY:C227(DB_at_Headings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_At_headingNames; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_At_SubHeadingLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_apic_AddSubHeading; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_apic_AddAccount; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingACCRange; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								
								INSERT IN ARRAY:C227(DB_at_SubHeadings; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_ai_RowLevel; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Code
								
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_ACCHHeadings5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Level
								
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_aI_HeadingLevel5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								
								INSERT IN ARRAY:C227(DB_at_HeadingNames1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Heading_Name
								
								INSERT IN ARRAY:C227(DB_at_HeadingNames2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingNames5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]AccCodeRangeFrom
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeFrom5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTO1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS][HEADINGS]AccCodeRangeTo
								
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingAccCodeTo5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]EnforceRange
								
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_al_HeadingEnforce5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingGroup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Group_Code
								
								INSERT IN ARRAY:C227(DB_at_HeadingGroup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingGroup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup1; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)  //[HEADINGS]Level_Up_Code
								
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup2; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup3; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup4; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								INSERT IN ARRAY:C227(DB_at_HeadingLevelup5; $_l_AnalysisIndexositionofInsert; $_l_NumberofRows)
								
								
								
								
								
								$_l_CopyRow:=1
								$_l_Row:=$_l_HeadingIndex
								$_l_Row2:=$_l_Row+1
								$_l_SubRowsAdded:=0
								//Repeat
								For ($_l_Row2; $_l_Row+1; $_l_Row+$_l_NumberofRows)
									//DB_ab_HeadersExpanded{$_l_Row2}:=False
									DB_ai_RowLevel{$_l_Row2}:=-1
									
									
									DB_at_AccountCodes{$_l_Row2}:=$_at_AccountCodes{$_l_CopyRow}
									DB_at_AccountNames{$_l_Row2}:=$_at_AccountNames{$_l_CopyRow}
									DB_at_AccountPreferenceGroups{$_l_Row2}:=$_at_AccountPreferenceGroups{$_l_CopyRow}
									DB_at_AccountIO{$_l_Row2}:=$_at_AccountIO{$_l_CopyRow}
									DB_al_MultiCurrencyValuation{$_l_Row2}:=$_al_MultiCurrencyValuation{$_l_CopyRow}
									DB_at_MultiCurrencyValuation{$_l_Row2}:=$_at_MultiCurrencyValuation{$_l_CopyRow}
									DB_abo_NoNominalLedgerPostings{$_l_Row2}:=$_abo_NoNominalLedgerPostings{$_l_CopyRow}
									DB_at_ProfitBalance{$_l_Row2}:=$_at_ProfitBalance{$_l_CopyRow}
									DB_at_AnalysisCodes{$_l_Row2}:=$_at_AnalysisCodes{$_l_CopyRow}
									DB_at_LayerCodes{$_l_Row2}:=$_at_LayerCodes{$_l_CopyRow}
									DB_abo_AccountDefault{$_l_Row2}:=$_abo_AccountDefault{$_l_CopyRow}
									DB_at_AccountHeadings{$_l_Row2}:=$_at_AccountHeadings{$_l_CopyRow}
									DB_at_ReportHeadings{$_l_Row2}:=$_at_ReportHeadings{$_l_CopyRow}
									
									
									$_l_CopyRow:=$_l_CopyRow+1
									
									
									
								End for 
								
								//$TotalRowsAdded:=
							End if 
							$_l_HeadingIndex:=$_l_HeadingIndex+1+$_l_NumberofRows
							//$RowIndex:=$RowIndex+1
						Until ($_l_HeadingIndex>(Size of array:C274(DB_at_ACCHHeadings3)))
						
						
					End if 
					
					//``````````````
				End if 
				
				//````
			End if 
			//TRACE
			
			For ($_l_CopyRow; Size of array:C274(DB_at_Headings); 1; -1)
				
				Case of 
						
					: (DB_at_ACCHHeadings1{$_l_CopyRow}#"")
						
						DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings1{$_l_CopyRow}
						DB_At_headingNames{$_l_CopyRow}:=DB_at_HeadingNames1{$_l_CopyRow}
						DB_At_SubHeadingLevel{$_l_CopyRow}:=""
						If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
							If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom1{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO1{$_l_CopyRow}
							Else 
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom1{$_l_CopyRow}
							End if 
						End if 
						$_t_ActualFrom:=""
						$_t_ActualTo:=""
						If ($_l_CopyRow<Size of array:C274(DB_at_Headings))
							For ($_l_CopyRow2; $_l_CopyRow+1; Size of array:C274(DB_at_Headings))
								If (DB_at_AccountCodes{$_l_CopyRow2}#"") & (DB_at_ReportHeadings{$_l_CopyRow2}=DB_at_ACCHHeadings1{$_l_CopyRow})
									
									If ($_t_ActualFrom="")
										$_t_ActualFrom:=DB_at_AccountCodes{$_l_CopyRow2}
									Else 
										$_t_ActualTo:=DB_at_AccountCodes{$_l_CopyRow2}
									End if 
								Else 
									If (DB_at_ACCHHeadings2{$_l_CopyRow2}#"") & (DB_at_HeadingLevelup2{$_l_CopyRow2}="") & (DB_at_HeadingGroup2{$_l_CopyRow2}=DB_at_ACCHHeadings1{$_l_CopyRow})
										
										If (DB_at_HeadingAccCodeFrom2{$_l_CopyRow2}#"")
											If ($_t_ActualFrom="")
												$_t_ActualFrom:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow2}
											Else 
												If ($_t_ActualFrom>DB_at_HeadingAccCodeFrom2{$_l_CopyRow2})
													$_t_ActualFrom:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow2}
												End if 
											End if 
											If ($_t_ActualTo="")
												$_t_ActualTo:=DB_at_HeadingAccCodeTO2{$_l_CopyRow2}
											Else 
												If ($_t_ActualTo<DB_at_HeadingAccCodeTO2{$_l_CopyRow2})
													$_t_ActualTo:=DB_at_HeadingAccCodeTO2{$_l_CopyRow2}
												End if 
											End if 
										Else 
											$_l_CopyRow2:=Size of array:C274(DB_at_Headings)
										End if 
									End if 
								End if 
							End for 
							
							If (Position:C15("-"; DB_at_HeadingACCRange{$_l_CopyRow})=0)
								If (DB_at_HeadingACCRange{$_l_CopyRow}="")
									Case of 
										: ($_t_ActualFrom#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom+"-"+$_t_ActualTo
										: ($_t_ActualFrom#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom
										: ($_t_ActualFrom="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeFrom1{$_l_CopyRow}:=$_t_ActualFrom
									DB_at_HeadingAccCodeTO1{$_l_CopyRow}:=$_t_ActualTo
								Else 
									Case of 
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}
										: (DB_at_HeadingACCRange{$_l_CopyRow}="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeTO1{$_l_CopyRow}:=$_t_ActualTo
								End if 
							Else 
								
							End if 
						End if 
						
					: (DB_at_ACCHHeadings2{$_l_CopyRow}#"")
						
						DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings2{$_l_CopyRow}
						DB_At_headingNames{$_l_CopyRow}:=($_t_Space*2)+DB_at_HeadingNames2{$_l_CopyRow}
						DB_At_SubHeadingLevel{$_l_CopyRow}:="One"
						If (DB_at_HeadingAccCodeFrom2{$_l_CopyRow}#"")
							If (DB_at_HeadingAccCodeTO2{$_l_CopyRow}#"")
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO2{$_l_CopyRow}
							Else 
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom2{$_l_CopyRow}
							End if 
						End if 
						$_t_ActualFrom:=""
						$_t_ActualTo:=""
						If ($_l_CopyRow<Size of array:C274(DB_at_Headings))
							For ($_l_CopyRow2; $_l_CopyRow+1; Size of array:C274(DB_at_Headings))
								If (DB_at_AccountCodes{$_l_CopyRow2}#"") & (DB_at_ReportHeadings{$_l_CopyRow2}=DB_at_ACCHHeadings2{$_l_CopyRow})
									
									If ($_t_ActualFrom="")
										$_t_ActualFrom:=DB_at_AccountCodes{$_l_CopyRow2}
									Else 
										$_t_ActualTo:=DB_at_AccountCodes{$_l_CopyRow2}
									End if 
								Else 
									If (DB_at_ACCHHeadings3{$_l_CopyRow2}#"") & (DB_at_HeadingLevelup3{$_l_CopyRow2}=DB_at_ACCHHeadings2{$_l_CopyRow})
										If (DB_at_HeadingAccCodeFrom3{$_l_CopyRow2}#"")
											If ($_t_ActualFrom="")
												$_t_ActualFrom:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow2}
											Else 
												If ($_t_ActualFrom>DB_at_HeadingAccCodeFrom3{$_l_CopyRow2})
													$_t_ActualFrom:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow2}
												End if 
											End if 
											If ($_t_ActualTo="")
												$_t_ActualTo:=DB_at_HeadingAccCodeTO3{$_l_CopyRow2}
											Else 
												If ($_t_ActualTo<DB_at_HeadingAccCodeTO3{$_l_CopyRow2})
													$_t_ActualTo:=DB_at_HeadingAccCodeTO3{$_l_CopyRow2}
												End if 
											End if 
										Else 
											$_l_CopyRow2:=Size of array:C274(DB_at_Headings)
										End if 
									End if 
									
								End if 
							End for 
							If (Position:C15("-"; DB_at_HeadingACCRange{$_l_CopyRow})=0)
								If (DB_at_HeadingACCRange{$_l_CopyRow}="")
									Case of 
										: ($_t_ActualFrom#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom+"-"+$_t_ActualTo
										: ($_t_ActualFrom#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom
										: ($_t_ActualFrom="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeFrom2{$_l_CopyRow}:=$_t_ActualFrom
									DB_at_HeadingAccCodeTO2{$_l_CopyRow}:=$_t_ActualTo
								Else 
									Case of 
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}
										: (DB_at_HeadingACCRange{$_l_CopyRow}="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeTO2{$_l_CopyRow}:=$_t_ActualTo
								End if 
							Else 
								
							End if 
						End if 
						
					: (DB_at_ACCHHeadings3{$_l_CopyRow}#"")
						
						DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings3{$_l_CopyRow}
						DB_At_headingNames{$_l_CopyRow}:=($_t_Space*4)+DB_at_HeadingNames3{$_l_CopyRow}
						DB_At_SubHeadingLevel{$_l_CopyRow}:="Two"
						If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
							If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO3{$_l_CopyRow}
							Else 
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom3{$_l_CopyRow}
							End if 
						End if 
						$_t_ActualFrom:=""
						$_t_ActualTo:=""
						If ($_l_CopyRow<Size of array:C274(DB_at_Headings))
							For ($_l_CopyRow2; $_l_CopyRow+1; Size of array:C274(DB_at_Headings))
								If (DB_at_AccountCodes{$_l_CopyRow2}#"") & (DB_at_ReportHeadings{$_l_CopyRow2}=DB_at_ACCHHeadings3{$_l_CopyRow})
									
									If ($_t_ActualFrom="")
										$_t_ActualFrom:=DB_at_AccountCodes{$_l_CopyRow2}
									Else 
										$_t_ActualTo:=DB_at_AccountCodes{$_l_CopyRow2}
									End if 
								Else 
									If (DB_at_ACCHHeadings4{$_l_CopyRow2}#"") & (DB_at_HeadingLevelup4{$_l_CopyRow2}=DB_at_ACCHHeadings3{$_l_CopyRow})
										
										If (DB_at_HeadingAccCodeFrom4{$_l_CopyRow2}#"")
											If ($_t_ActualFrom="")
												$_t_ActualFrom:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow2}
											Else 
												If ($_t_ActualFrom>DB_at_HeadingAccCodeFrom4{$_l_CopyRow2})
													$_t_ActualFrom:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow2}
												End if 
											End if 
											If ($_t_ActualTo="")
												$_t_ActualTo:=DB_at_HeadingAccCodeTO4{$_l_CopyRow2}
											Else 
												If ($_t_ActualTo<DB_at_HeadingAccCodeTO4{$_l_CopyRow2})
													$_t_ActualTo:=DB_at_HeadingAccCodeTO4{$_l_CopyRow2}
												End if 
											End if 
										Else 
											$_l_CopyRow2:=Size of array:C274(DB_at_Headings)
										End if 
									End if 
									
								End if 
							End for 
							If (Position:C15("-"; DB_at_HeadingACCRange{$_l_CopyRow})=0)
								If (DB_at_HeadingACCRange{$_l_CopyRow}="")
									Case of 
										: ($_t_ActualFrom#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom+"-"+$_t_ActualTo
										: ($_t_ActualFrom#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom
										: ($_t_ActualFrom="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeFrom3{$_l_CopyRow}:=$_t_ActualFrom
									DB_at_HeadingAccCodeTO3{$_l_CopyRow}:=$_t_ActualTo
								Else 
									Case of 
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}
										: (DB_at_HeadingACCRange{$_l_CopyRow}="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeTO3{$_l_CopyRow}:=$_t_ActualTo
								End if 
							Else 
								
							End if 
						End if 
						
					: (DB_at_ACCHHeadings4{$_l_CopyRow}#"")
						
						DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings4{$_l_CopyRow}
						DB_At_headingNames{$_l_CopyRow}:=($_t_Space*6)+DB_at_HeadingNames4{$_l_CopyRow}
						DB_At_SubHeadingLevel{$_l_CopyRow}:="Three"
						
						If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
							If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO4{$_l_CopyRow}
							Else 
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom4{$_l_CopyRow}
							End if 
						End if 
						$_t_ActualFrom:=""
						$_t_ActualTo:=""
						If ($_l_CopyRow<Size of array:C274(DB_at_Headings))
							For ($_l_CopyRow2; $_l_CopyRow+1; Size of array:C274(DB_at_Headings))
								If (DB_at_AccountCodes{$_l_CopyRow2}#"") & (DB_at_ReportHeadings{$_l_CopyRow2}=DB_at_ACCHHeadings4{$_l_CopyRow})
									
									If ($_t_ActualFrom="")
										$_t_ActualFrom:=DB_at_AccountCodes{$_l_CopyRow2}
									Else 
										$_t_ActualTo:=DB_at_AccountCodes{$_l_CopyRow2}
									End if 
								Else 
									If (DB_at_ACCHHeadings5{$_l_CopyRow2}#"") & (DB_at_HeadingLevelup5{$_l_CopyRow2}=DB_at_ACCHHeadings4{$_l_CopyRow})
										If (DB_at_HeadingAccCodeFrom5{$_l_CopyRow2}#"")
											If ($_t_ActualFrom="")
												$_t_ActualFrom:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow2}
											Else 
												If ($_t_ActualFrom>DB_at_HeadingAccCodeFrom5{$_l_CopyRow2})
													$_t_ActualFrom:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow2}
												End if 
											End if 
											If ($_t_ActualTo="")
												$_t_ActualTo:=DB_at_HeadingAccCodeTO5{$_l_CopyRow2}
											Else 
												If ($_t_ActualTo<DB_at_HeadingAccCodeTO5{$_l_CopyRow2})
													$_t_ActualTo:=DB_at_HeadingAccCodeTO5{$_l_CopyRow2}
												End if 
											End if 
										Else 
											$_l_CopyRow2:=Size of array:C274(DB_at_Headings)
										End if 
									End if 
									
								End if 
							End for 
							If (Position:C15("-"; DB_at_HeadingACCRange{$_l_CopyRow})=0)
								If (DB_at_HeadingACCRange{$_l_CopyRow}="")
									Case of 
										: ($_t_ActualFrom#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom+"-"+$_t_ActualTo
										: ($_t_ActualFrom#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom
										: ($_t_ActualFrom="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeFrom4{$_l_CopyRow}:=$_t_ActualFrom
									DB_at_HeadingAccCodeTO4{$_l_CopyRow}:=$_t_ActualTo
								Else 
									Case of 
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}
										: (DB_at_HeadingACCRange{$_l_CopyRow}="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeTO4{$_l_CopyRow}:=$_t_ActualTo
								End if 
							Else 
								
							End if 
						End if 
					: (DB_at_ACCHHeadings5{$_l_CopyRow}#"")
						
						DB_at_Headings{$_l_CopyRow}:=DB_at_ACCHHeadings5{$_l_CopyRow}
						DB_At_headingNames{$_l_CopyRow}:=($_t_Space*8)+DB_at_HeadingNames5{$_l_CopyRow}
						DB_At_SubHeadingLevel{$_l_CopyRow}:="Four"
						If (DB_at_HeadingAccCodeFrom1{$_l_CopyRow}#"")
							If (DB_at_HeadingAccCodeTO1{$_l_CopyRow}#"")
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow}+"-"+DB_at_HeadingAccCodeTO5{$_l_CopyRow}
							Else 
								DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingAccCodeFrom5{$_l_CopyRow}
							End if 
						End if 
						$_t_ActualFrom:=""
						$_t_ActualTo:=""
						If ($_l_CopyRow<Size of array:C274(DB_at_Headings))
							For ($_l_CopyRow2; $_l_CopyRow+1; Size of array:C274(DB_at_Headings))
								If (DB_at_AccountCodes{$_l_CopyRow2}#"") & (DB_at_ReportHeadings{$_l_CopyRow2}=DB_at_ACCHHeadings5{$_l_CopyRow})
									
									If ($_t_ActualFrom="")
										$_t_ActualFrom:=DB_at_AccountCodes{$_l_CopyRow2}
									Else 
										$_t_ActualTo:=DB_at_AccountCodes{$_l_CopyRow2}
									End if 
								Else 
									$_l_CopyRow2:=Size of array:C274(DB_at_Headings)
								End if 
							End for 
							If (Position:C15("-"; DB_at_HeadingACCRange{$_l_CopyRow})=0)
								If (DB_at_HeadingACCRange{$_l_CopyRow}="")
									Case of 
										: ($_t_ActualFrom#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom+"-"+$_t_ActualTo
										: ($_t_ActualFrom#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualFrom
										: ($_t_ActualFrom="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									DB_at_HeadingAccCodeFrom5{$_l_CopyRow}:=$_t_ActualFrom
									DB_at_HeadingAccCodeTO5{$_l_CopyRow}:=$_t_ActualTo
								Else 
									Case of 
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
										: (DB_at_HeadingACCRange{$_l_CopyRow}#"") & ($_t_ActualTo="")
											DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}
										: (DB_at_HeadingACCRange{$_l_CopyRow}="") & ($_t_ActualTo#"")
											DB_at_HeadingACCRange{$_l_CopyRow}:=$_t_ActualTo
									End case 
									//DB_at_HeadingACCRange{$_l_CopyRow}:=DB_at_HeadingACCRange{$_l_CopyRow}+"-"+$_t_ActualTo
									DB_at_HeadingAccCodeTO5{$_l_CopyRow}:=$_t_ActualTo
								End if 
							Else 
								
							End if 
						End if 
				End case 
				
				DB_apic_AddSubHeading{$_l_CopyRow}:=$_pic_AddSubHeading
				DB_apic_AddAccount{$_l_CopyRow}:=$_pic_AddSubHeading
				
			End for 
			
			
			DB_al_NextRowIndex:=Size of array:C274(DB_at_HeadingLevelup5)+1
			//
			//```
			
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			
			
			
			
			
			ARRAY TEXT:C222(DB_at_Dummy; Size of array:C274(DB_at_HeadingNames5))
			ARRAY BOOLEAN:C223(DB_ab_LineEdit; 0)
			ARRAY BOOLEAN:C223(DB_ab_LineEdit; Size of array:C274(DB_at_HeadingNames5))
			//``````
			
			$_l_NilWidth:=0
			
			$_l_LineEditWidth:=$_l_NilWidth
			$_l_DummyWidth:=10
			
			//``
			
			
			ARRAY TEXT:C222(DB_at_Dummy; Size of array:C274(DB_at_HeadingNames5))
			ARRAY BOOLEAN:C223(DB_ab_LineEdit; 0)
			ARRAY BOOLEAN:C223(DB_ab_LineEdit; Size of array:C274(DB_at_HeadingNames5))
			
			//```
			//TRACE
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; 1; ->DB_At_SubHeadingLevel; ->DB_at_Headings; ->DB_At_headingNames; ->DB_at_HeadingACCRange; ->DB_apic_AddSubHeading; ->DB_apic_AddAccount; ->DB_ai_RowLevel)
			//Because i want to keep this simple making a little change here
			
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_ACCHHeadings1; ->DB_aI_HeadingLevel1; ->DB_at_HeadingNames1; ->DB_at_HeadingAccCodeFrom1; ->DB_at_HeadingAccCodeTO1; ->DB_al_HeadingEnforce1; ->DB_at_HeadingGroup1; ->DB_at_HeadingLevelup1)
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_ACCHHeadings2; ->DB_aI_HeadingLevel2; ->DB_at_HeadingNames2; ->DB_at_HeadingAccCodeFrom2; ->DB_at_HeadingAccCodeTO2; ->DB_al_HeadingEnforce2; ->DB_at_HeadingGroup2; ->DB_at_HeadingLevelup2)
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_ACCHHeadings3; ->DB_aI_HeadingLevel3; ->DB_at_HeadingNames3; ->DB_at_HeadingAccCodeFrom3; ->DB_at_HeadingAccCodeTO3; ->DB_al_HeadingEnforce3; ->DB_at_HeadingGroup3; ->DB_at_HeadingLevelup3)
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_ACCHHeadings4; ->DB_aI_HeadingLevel4; ->DB_at_HeadingNames4; ->DB_at_HeadingAccCodeFrom4; ->DB_at_HeadingAccCodeTO4; ->DB_al_HeadingEnforce4; ->DB_at_HeadingGroup4; ->DB_at_HeadingLevelup4)
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_ACCHHeadings5; ->DB_aI_HeadingLevel5; ->DB_at_HeadingNames5; ->DB_at_HeadingAccCodeFrom5; ->DB_at_HeadingAccCodeTO5; ->DB_al_HeadingEnforce5; ->DB_at_HeadingGroup5; ->DB_at_HeadingLevelup5)
			
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_AccountCodes; ->DB_at_AccountNames; ->DB_at_AccountPreferenceGroups; ->DB_at_AccountIO; ->DB_al_MultiCurrencyValuation; ->DB_at_MultiCurrencyValuation; ->DB_abo_NoNominalLedgerPostings; ->DB_at_ProfitBalance; ->DB_at_AnalysisCodes; ->DB_at_LayerCodes; ->DB_abo_AccountDefault; ->DB_at_AccountHeadings; ->DB_at_ReportHeadings)
			
			LB_SetupListbox(->ACC_lb_Headings; "oACH"; "ACH_L"; -99; ->DB_at_Dummy)
			
			
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; 1; "Sub Heading Level"; "Heading Code"; "Heading Name"; "Account Code Range"; "Add Sub Heading"; "Add Account"; "Row Level")
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Level"; "Heading Name"; "Range From"; "Range To"; "Enforced Range"; "Group"; "Level up COde")
			
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Level"; "Heading Name"; "Range From"; "Range To"; "Enforced Range"; "Group"; "Level up COde")
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Level"; "Heading Name"; "Range From"; "Range To"; "Enforced Range"; "Group"; "Level up COde")
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Level"; "Heading Name"; "Range From"; "Range To"; "Enforced Range"; "Group"; "Level up COde")
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Level"; "Heading Name"; "Range From"; "Range To"; "Enforced Range"; "Group"; "Level up COde")
			
			$_l_LastColumn:=LB_SetColumnHeaders(->ACC_lb_Headings; "ACH_L"; $_l_LastColumn+1; "Code"; "Name"; "Preference Setting"; "IO"; ""; "Currency Conversion"; "No Manual Postings"; "Profit or Balance Sheet"; "Analysis Codes"; "Layer Codes"; "Default"; "Heading"; "Report Heading")
			
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; 1; 110; 100; 250; 120; 110; 80; 0)
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 0; 0; 0; 0; 0; 0; 0; 0)
			
			
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 0; 0; 0; 0; 0; 0; 0; 0)
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 0; 0; 0; 0; 0; 0; 0; 0)
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 0; 0; 0; 0; 0; 0; 0; 0)
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 0; 0; 0; 0; 0; 0; 0; 0)
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 80; 210; 260; 60; 0; 140; 140; 100; 100; 100; 0; 0; 0)
			
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))=0) | (True:C214)
				
				//LISTBOX GET ARRAYS(ACC_lb_Headings;$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles)
				
				LB_SetColumnWidths(->ACC_lb_Headings; "oACC"; $_l_LastColumn-4; 0)
			End if 
			$_bo_ShowAnalysis:=False:C215
			For ($_l_AnalysisIndex; 1; Size of array:C274(DB_at_AnalysisCodes))
				If (DB_at_AnalysisCodes{$_l_AnalysisIndex}#"")
					$_bo_ShowAnalysis:=True:C214
					$_l_AnalysisIndex:=9999999
				End if 
			End for 
			If (Not:C34($_bo_ShowAnalysis))
				//LISTBOX GET ARRAYS(ACC_lb_Headings;$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles)
				
				LB_SetColumnWidths(->ACC_lb_Headings; "oACC"; $_l_LastColumn-5; 0)
			End if 
			$_l_LastColumn:=LB_SetColumnWidths(->ACC_lb_Headings; "oACH"; $_l_LastColumn; 99)
			LB_SetScroll(->ACC_lb_Headings; -2; -2)
			LB_SetEnterable(->ACC_lb_Headings; False:C215; 0; "")
			//LBi_InclSetupJustStyle (->ACC_lb_Headings)
			LISTBOX GET ARRAYS:C832(ACC_lb_Headings; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			
			
			OBJECT SET VERTICAL ALIGNMENT:C1187(*; $_at_ColumnNames{5}; Align center:K42:3)  //Add subheading
			OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{5}; Align right:K42:4)
			
			
			
			OBJECT SET VERTICAL ALIGNMENT:C1187(*; $_at_ColumnNames{6}; Align center:K42:3)
			OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{6}; Align right:K42:4)
			
			
			
			
			//Here testing collapsing.
			//2, 9,14,,20.26
			//8,15,21,27
			
			
			
		Else 
			//There are no Headings so show the + button to add the first heading or put a row in for the first heading
		End if 
		//```````````````````
		
		DB_l_Refresh:=0
	: ($_l_event=On Outside Call:K2:11)
		
		
		DB_l_Refresh:=0
		
		
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM DB_SetupAccounts"; $_t_oldMethodName)
