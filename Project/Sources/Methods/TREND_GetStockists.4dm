//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_GetStockists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_RecordSeen; 0)
	//ARRAY BOOLEAN(FUR_abo_2DShowasComment;0;0)
	//ARRAY INTEGER(aD;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	ARRAY LONGINT:C221($_al_Year; 0)
	//ARRAY LONGINT(CO_al_TermsIDS;0)
	//ARRAY LONGINT(FUR_al_FFTableRef;0)
	//ARRAY LONGINT(FUR_at_ParentTableNum;0)
	ARRAY REAL:C219($_ar_SalesAmount; 0)
	ARRAY REAL:C219($_ar_TotalCompanyValue; 0)
	ARRAY TEXT:C222($_at_CommentFDCode; 0)
	ARRAY TEXT:C222($_at_CommentLabel; 0)
	ARRAY TEXT:C222($_at_FurtherCommentIDS; 0)
	ARRAY TEXT:C222($_at_FurtherCommentLabels; 0)
	ARRAY TEXT:C222($_at_PeriodCode; 0)
	ARRAY TEXT:C222($_at_RecordsToDelete; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_Sales; 0)
	ARRAY TEXT:C222($_at_SalesAccount; 0)
	ARRAY TEXT:C222($_at_SalesAnalysis; 0)
	ARRAY TEXT:C222($_at_SalesAnalysist; 0)
	ARRAY TEXT:C222($_at_SalesB; 0)
	ARRAY TEXT:C222($_at_SQL_Result; 0; 0)
	ARRAY TEXT:C222($_at_StockistAccountnumbers; 0)
	ARRAY TEXT:C222($_at_TotalCompanyCode; 0)
	ARRAY TEXT:C222($_at_TotalsPeriodCodes; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	//ARRAY TEXT(CO_at_Terms;0)
	//ARRAY TEXT(COM_at_FurtherCommentIDS;0)
	//ARRAY TEXT(COM_at_FurtherCommentLabels;0)
	//ARRAY TEXT(FUR_at_2DCustomCommentList;0;0)
	//ARRAY TEXT(FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_2DCustomFieldNames;0)
	//ARRAY TEXT(FUR_at_2DCustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_COOfOrigin; $_bo_CUstRef; $_bo_FaxBack; $_bo_Hire; $_bo_ITC; $_bo_Leads; $_bo_Mail; $_bo_Modified; $_bo_OnStop; $_bo_OpenWIndow; $_bo_PC)
	C_BOOLEAN:C305($_bo_RecordModified; $_bo_Tarrif; $_bo_TSA; $_bo_TTCs; $_bo_VOUCHER; $_bo_Weight; $_bo_Ws; FUR_bo_Inited)
	C_DATE:C307($_d_EndOfYear; $_d_LastInvoice; $_d_LastInvoiceceDate; $_d_LastPeriodEnd; $_D_LastPeriodStart)
	C_LONGINT:C283($_i_CurrentYear; $_l_Columns; $_l_CommentNoteField; $_l_CreditInsuranceField; $_l_CurrentRow; $_l_FaxBackField; $_l_FindDeletions; $_l_FindRow; $_l_GetSalesByYear; $_l_GetYears; $_l_LastInvoiceField)
	C_LONGINT:C283($_l_ListID; $_l_Pos; $_l_RebateField; $_l_ReceiveRecords; $_l_Ref; $_l_SetSales; $_l_TableNumber; $_l_Y0Field; $_l_Y1Field; $_l_Y2Field; $_l_Y3Field)
	C_LONGINT:C283($_l_Y4Field; $_l_Y5Field; $_l_Y6Field; $_l_Y7Field; $_l_Year; $_l_Year0; $_l_Year1; $_l_Year2; $_l_Year3; $_l_Year4; $_l_Year5)
	C_LONGINT:C283($_l_Year6; $_l_Year7; $1; I; VAT)
	C_POINTER:C301($_ptr_ProductGroup; $_Ptr_SalesAccount; $_Ptr_SalesValue; $_Ptr_SalesYear; $3; $4; $5; $6)
	C_REAL:C285($_r_CredInsurance; $_r_CredInsuranceAmount; $_R_DISCOUNT; $_r_Sales; $_r_SalesYear; $_r_Sum; $_r_Sum2)
	C_TEXT:C284($_t_address1; $_t_address2; $_t_address3; $_t_address4; $_t_addressCountry; $_t_addressCounty; $_t_addressTown; $_t_after; $_t_Before; $_t_Call; $_t_COfO)
	C_TEXT:C284($_t_CoINvoiceType; $_t_Comment; $_t_CommentNote; $_t_CompanyEmail; $_t_CompanyList; $_t_CompanyStatementType; $_t_CompanyType; $_t_CompanyWebsite; $_t_Competitor; $_t_Country; $_t_County)
	C_TEXT:C284($_t_Credit; $_t_CredtLimit; $_t_CurrencyType; $_t_CustRef; $_t_DiscountGroup; $_T_DNOption; $_t_DNPreferenes; $_t_East; $_T_EASTINGS; $_t_Facilities; $_t_FaxBack)
	C_TEXT:C284($_t_Flags; $_t_Hire; $_T_INVOICECOMPANYCODE; $_T_INVOICESTATEMENTCODE; $_t_ITC; $_t_Label; $_t_Leads; $_t_Mail; $_t_NewCall; $_t_NewCompetitor; $_T_NewPriceOption)
	C_TEXT:C284($_t_North; $_T_NORTHINGS; $_t_oldMethodName; $_t_outaddress1; $_t_Outaddress2; $_t_Outaddress3; $_t_Outaddress4; $_t_OutaddressTown; $_t_OutCountry; $_t_OutCounty; $_t_OutPostcode)
	C_TEXT:C284($_t_OutTown; $_t_PaymentTerms; $_t_PC; $_t_Period; $_t_Postcode; $_t_PriceList; $_t_PriceOption; $_t_PrintOption; $_t_RebateCompany; $_t_SalesGroup; $_t_SCode)
	C_TEXT:C284($_t_SETTCode; $_t_SpecialList; $_t_SpecialPrices; $_t_SQLTableName; $_t_StatementCompany; $_t_Tab; $_t_Tarrif; $_t_Town; $_t_TSA; $_t_Vat; $_t_VOUCHER)
	C_TEXT:C284($_t_Weight; $_t_Ws; $_t_Year7Sales; $0; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_GetStockists")

ARRAY TEXT:C222($_at_SQL_Result; 0; 0)  //A 2 D array for the returned data.
ARRAY TEXT:C222($_at_Replacements; 0)
ARRAY TEXT:C222($_at_WhattoReplace; 0)
$_l_TableNumber:=Table:C252(->[COMPANIES:2])
If (Not:C34(FUR_bo_Inited))
	//SORT ARRAY($aSort;<>FUR_at_CustomFieldNames{$ref};<>FUR_at_2dCustomFieldFormat{$ref};<>FUR_at_CustomFieldTypes{$ref};$aFD;$_abo_DisplayasComment;>)
	ARRAY LONGINT:C221(FUR_at_ParentTableNum; 0)
	ARRAY TEXT:C222(FUR_at_2DCustomFieldNames; 0; 0)  //<>FUR_at_CustomFieldNames
	ARRAY TEXT:C222(FUR_at_2dCustomFieldFormat; 0; 0)  //<>FUR_at_2dCustomFieldFormat
	ARRAY TEXT:C222(FUR_at_2DCustomFieldTypes; 0; 0)  //<>FUR_at_CustomFieldTypes
	ARRAY BOOLEAN:C223(FUR_abo_2DShowasComment; 0; 0)
	ARRAY LONGINT:C221(FUR_al_FFTableRef; 0)
	ARRAY TEXT:C222(FUR_at_2DCustomCommentList; 0; 0)
	FUR_bo_Inited:=True:C214
End if 
$_l_Ref:=Find in array:C230(FUR_at_ParentTableNum; $_l_TableNumber)
If ($_l_Ref<0)
	APPEND TO ARRAY:C911(FUR_at_ParentTableNum; $_l_TableNumber)
	APPEND TO ARRAY:C911(FUR_al_FFTableRef; <>SYS_al_TableRecordNameField{$_l_TableNumber})
	$_l_Ref:=Size of array:C274(FUR_al_FFTableRef)
	INSERT IN ARRAY:C227(FUR_at_2DCustomFieldNames; Size of array:C274(FUR_at_2DCustomFieldNames)+1; 1)  //<>FUR_at_CustomFieldNames
	INSERT IN ARRAY:C227(FUR_at_2dCustomFieldFormat; Size of array:C274(FUR_at_2dCustomFieldFormat)+1; 1)  //<>FUR_at_2dCustomFieldFormat
	INSERT IN ARRAY:C227(FUR_at_2DCustomFieldTypes; Size of array:C274(FUR_at_2DCustomFieldTypes)+1; 1)  //<>FUR_at_2dCustomFieldFormat
	INSERT IN ARRAY:C227(FUR_abo_2DShowasComment; Size of array:C274(FUR_abo_2DShowasComment)+1; 1)  //<>FUR_at_2dCustomFieldFormat
	INSERT IN ARRAY:C227(FUR_at_2DCustomCommentList; Size of array:C274(FUR_abo_2DShowasComment)+1; 1)  //<>FUR_at_2dCustomFieldFormat
End if 
//tops get 7 years of sales history Y 7 is current year minus 7 6=6
$_l_Year7:=(Year of:C25(Current date:C33))-7
$_l_Year6:=(Year of:C25(Current date:C33))-6
$_l_Year5:=(Year of:C25(Current date:C33))-5
$_l_Year4:=(Year of:C25(Current date:C33))-4
$_l_Year3:=(Year of:C25(Current date:C33))-3
$_l_Year2:=(Year of:C25(Current date:C33))-2
$_l_Year1:=(Year of:C25(Current date:C33))-1
$_l_Year0:=(Year of:C25(Current date:C33))
FurthFld_Arr(Table:C252(->[COMPANIES:2]); ->FUR_al_FFTableRef; ->FUR_at_2DCustomFieldNames; ->FUR_at_2dCustomFieldFormat; ->FUR_at_2DCustomFieldTypes; ->FUR_abo_2DShowasComment; ->$_at_CommentFDCode; ->$_at_CommentLabel; ->FUR_at_ParentTableNum)
$_l_FindRow:=Find in array:C230(FUR_al_FFTableRef; $_l_TableNumber)  //dont assume
If ($_l_FindRow>0)
	$_l_Y7Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year7))
	If ($_l_Y7Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year7))
	End if 
	$_l_Y6Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year6))
	If ($_l_Y6Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year6))
	End if 
	$_l_Y5Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year5))
	If ($_l_Y5Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year5))
	End if 
	$_l_Y4Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year4))
	If ($_l_Y4Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year4))
	End if 
	$_l_Y3Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year3))
	If ($_l_Y3Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year3))
	End if 
	$_l_Y2Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year2))
	If ($_l_Y2Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year2))
	End if 
	$_l_Y1Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year1))
	
	If ($_l_Y1Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year1))
	End if 
	$_l_Y0Field:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Year "+String:C10($_l_Year0))
	If ($_l_Y1Field<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Year "+String:C10($_l_Year0))
	End if 
	$_l_RebateField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Rebate Company")
	If ($_l_RebateField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Rebate Company")
	End if 
	$_l_RebateField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Statement Company")
	If ($_l_RebateField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Statement Company")
	End if 
	$_l_CommentNoteField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Comment Note")
	If ($_l_RebateField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Comment Note")
	End if 
	$_l_LastInvoiceField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Last Invoice Date")
	If ($_l_LastInvoiceField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Last Invoice Date"; ""; "D")
		
	End if 
	$_l_CreditInsuranceField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Credit Insurance Amount")
	If ($_l_CreditInsuranceField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Credit Insurance Amount"; ""; "N")
		
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Fax Back Facility")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Fax Back Facility")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Hire Facilities")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Hire Facilities")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Industrial Tooling Centre")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "ITC")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Sales Leads")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Sales Leads")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Mail_Order Facilities")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Mail_Order Facilities")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Personalised Catalogues")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Personalised Catalogues")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Trend Service Agent")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "TSA")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Trend Tooling Centre")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "TTC")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "Voucher Facilities")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "Voucher Facilities")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "TSA Bus WEEE")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "TSA Bus WEE")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "DN Pref: IncCo of Origin")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "DN Pref: Co of Origin")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "DN Pref: Inc Weight")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "DN Pref: Inc Weight")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "DN Pref: Inc Customer Ref")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "DN Pref: Inc Customer Ref")
	End if 
	$_l_FaxBackField:=Find in array:C230(FUR_at_2DCustomFieldNames{$_l_FindRow}; "DN Pref: Inc Customer Ref")
	If ($_l_FaxBackField<0)
		$_bo_Modified:=True:C214
		$0:=FurthFld_Get2("Companies"; "DN Pref: Inc Tarrif Code")
	End if 
	If ($_bo_Modified)
	End if 
	ARRAY LONGINT:C221(FUR_at_ParentTableNum; 0)
	ARRAY TEXT:C222(FUR_at_2DCustomFieldNames; 0; 0)  //<>FUR_at_CustomFieldNames
	ARRAY TEXT:C222(FUR_at_2dCustomFieldFormat; 0; 0)  //<>FUR_at_2dCustomFieldFormat
	ARRAY TEXT:C222(FUR_at_2DCustomFieldTypes; 0; 0)  //<>FUR_at_CustomFieldTypes
	ARRAY BOOLEAN:C223(FUR_abo_2DShowasComment; 0; 0)
	ARRAY LONGINT:C221(FUR_al_FFTableRef; 0)
	ARRAY TEXT:C222(FUR_at_2DCustomCommentList; 0; 0)
	FUR_bo_Inited:=True:C214
	
	$_l_Ref:=Find in array:C230(FUR_at_ParentTableNum; $_l_TableNumber)
	If ($_l_Ref<0)
		APPEND TO ARRAY:C911(FUR_at_ParentTableNum; $_l_TableNumber)
		APPEND TO ARRAY:C911(FUR_al_FFTableRef; <>SYS_al_TableRecordNameField{$_l_TableNumber})
		$_l_Ref:=Size of array:C274(FUR_al_FFTableRef)
		INSERT IN ARRAY:C227(FUR_at_2DCustomFieldNames; Size of array:C274(FUR_at_2DCustomFieldNames)+1; 1)  //<>FUR_at_CustomFieldNames
		INSERT IN ARRAY:C227(FUR_at_2dCustomFieldFormat; Size of array:C274(FUR_at_2dCustomFieldFormat)+1; 1)  //<>FUR_at_2dCustomFieldFormat
		INSERT IN ARRAY:C227(FUR_at_2DCustomFieldTypes; Size of array:C274(FUR_at_2DCustomFieldTypes)+1; 1)  //<>FUR_at_2dCustomFieldFormat
		INSERT IN ARRAY:C227(FUR_abo_2DShowasComment; Size of array:C274(FUR_abo_2DShowasComment)+1; 1)  //<>FUR_at_2dCustomFieldFormat
		INSERT IN ARRAY:C227(FUR_at_2DCustomCommentList; Size of array:C274(FUR_abo_2DShowasComment)+1; 1)  //<>FUR_at_2dCustomFieldFormat
	End if 
	//tops get 7 years of sales history Y 7 is current year minus 7 6=6
	
	FurthFld_Arr(Table:C252(->[COMPANIES:2]); ->FUR_al_FFTableRef; ->FUR_at_2DCustomFieldNames; ->FUR_at_2dCustomFieldFormat; ->FUR_at_2DCustomFieldTypes; ->FUR_abo_2DShowasComment; ->$_at_CommentFDCode; ->$_at_CommentLabel; ->FUR_at_ParentTableNum)
	$_l_FindRow:=Find in array:C230(FUR_al_FFTableRef; $_l_TableNumber)  //dont assume
	
End if 

ARRAY TEXT:C222($_at_FurtherCommentIDS; 0)
ARRAY TEXT:C222($_at_FurtherCommentLabels; 0)
//$_l_Year7:=(Year of(Current date))-7
//$_l_Year6:=(Year of(Current date))-6
//$_l_Year5:=(Year of(Current date))-5
//$_l_Year4:=(Year of(Current date))-4
//$_l_Year3:=(Year of(Current date))-3
//$_l_Year2:=(Year of(Current date))-2
//$_l_Year1:=(Year of(Current date))-1
//$_l_Year0:=(Year of(Current date))

$_bo_OpenWIndow:=True:C214
If (False:C215)
	For ($_l_GetSalesByYear; 1; 8)
		
		$_l_Year:=(Year of:C25(Current date:C33))-($_l_GetSalesByYear-1)
		
		//Gen_Message ("Getting sales :"+String($_l_Year);$_bo_OpenWIndow;Palette form window)
		$_bo_OpenWIndow:=False:C215
		If ($_l_Year=Year of:C25(Current date:C33))
			$_t_SQLTableName:="scheme.opsahistm"
		Else 
			$_t_SQLTableName:="scheme.opsahist"+String:C10($_l_Year)+"m"  //e.g.scheme.opsahist2011m etc
		End if 
		ARRAY TEXT:C222($_at_SalesAccount; 0)
		ARRAY TEXT:C222($_at_SalesAnalysis; 0)
		ARRAY REAL:C219($_ar_SalesAmount; 0)
		//note that in this first one we get those with ALL groups-
		//note how we misuse the account by storing the account(company code) in the account code-which is not an 'account' in Ledger terms.
		TREND_SQL_GetDataToArrays("SalesByGroup"; TREND_SQLBuildReplacements($_t_SQLTableName; "TOPS_TableName"); ->$_at_SalesAccount; ->$_at_SalesAnalysis; ->$_ar_SalesAmount)
		$_d_EndOfYear:=((Date:C102("01/01/"+String:C10($_l_Year+1))))-1
		$_r_Sum:=Sum:C1($_ar_SalesAmount)
		
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear; *)
		QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_EndOfYear)
		If (Records in selection:C76([PERIODS:33])=0)
			//create missing periods
			//TRACE
			Repeat 
				//ALL RECORDS([PERIODS])
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
				$_D_LastPeriodStart:=[PERIODS:33]From_Date:3
				$_d_LastPeriodEnd:=[PERIODS:33]To_Date:4
				If (Records in selection:C76([PERIODS:33])=0)  //end of previous year
					$_d_LastPeriodEnd:=((Date:C102("01/01/"+String:C10($_l_Year))))-1
				End if 
				Period_Create($_d_LastPeriodEnd+1; 12; True:C214)
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_EndOfYear)
			Until (Records in selection:C76([PERIODS:33])>0)
		End if 
		$_t_Period:=[PERIODS:33]Period_Code:1
		QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1="XTotalB")
		If (Records in selection:C76([ANALYSES:36])=0)
			CREATE RECORD:C68([ANALYSES:36])
			[ANALYSES:36]Analysis_Code:1:="XTotalB"
			[ANALYSES:36]Analysis_Name:2:="Customer Account Year Total"
			SAVE RECORD:C53([ANALYSES:36])
		End if 
		$_t_Period:=[PERIODS:33]Period_Code:1
		QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1="XTotalA")
		If (Records in selection:C76([ANALYSES:36])=0)
			CREATE RECORD:C68([ANALYSES:36])
			[ANALYSES:36]Analysis_Code:1:="XTotalA"
			[ANALYSES:36]Analysis_Name:2:="Customer Account Year Total"
			SAVE RECORD:C53([ANALYSES:36])
		End if 
		READ WRITE:C146([ACCOUNT_BALANCES:34])
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1#"xtotalb")
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1#"xtotala")
		$_r_Sum2:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)
		
		
		If ($_r_Sum2#$_r_Sum)
			For ($_l_SetSales; 1; Size of array:C274($_at_SalesAccount))
				//Gen_Message ("Updating Sales Amount "+$_at_SalesAccount{$_l_SetSales}+" "+String($_l_Year)+" "+$_at_SalesAnalysis{$_l_SetSales}+" "+String($_l_SetSales)+" of "+String(Size of array($_at_SalesAccount));$_bo_OpenWIndow;Palette form window)
				
				$_at_SalesAnalysis{$_l_SetSales}:=Replace string:C233($_at_SalesAnalysis{$_l_SetSales}; "LIC@"; "TED")  //Change Licensefee etc to TED.
				
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_at_SalesAnalysis{$_l_SetSales})
				
				If (Records in selection:C76([ANALYSES:36])=0)
					CREATE RECORD:C68([ANALYSES:36])
					[ANALYSES:36]Analysis_Code:1:=$_at_SalesAnalysis{$_l_SetSales}
					[ANALYSES:36]Analysis_Name:2:="Customer Account Year Total"
					SAVE RECORD:C53([ANALYSES:36])
				End if 
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_at_SalesAccount{$_l_SetSales}; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_at_SalesAnalysis{$_l_SetSales})
				
				If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
					CREATE RECORD:C68([ACCOUNT_BALANCES:34])
					[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_Period
					[ACCOUNT_BALANCES:34]Account_Code:2:=$_at_SalesAccount{$_l_SetSales}
					[ACCOUNT_BALANCES:34]Analysis_Code:1:=$_at_SalesAnalysis{$_l_SetSales}
					[ACCOUNT_BALANCES:34]Layer_Code:5:="X"  //this makes sure the account stays out of view-because the layer does not exist
					[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1  //this makes sure the account balance is never checked
				End if 
				If ([ACCOUNT_BALANCES:34]Balance:3#$_ar_SalesAmount{$_l_SetSales})
					[ACCOUNT_BALANCES:34]Balance:3:=$_ar_SalesAmount{$_l_SetSales}
					SAVE RECORD:C53([ACCOUNT_BALANCES:34])
				End if 
			End for 
			
		End if 
		ARRAY TEXT:C222($_at_SalesAccount; 0)
		ARRAY TEXT:C222($_at_SalesAnalysis; 0)
		ARRAY REAL:C219($_ar_SalesAmount; 0)
		$_t_Label:="'xTOTALa'"
		TREND_SQL_GetDataToArrays("SalesTotals"; TREND_SQLBuildReplacements($_t_Label; "TOPS_TotalLabel"; $_t_SQLTableName; "TOPS_TableName"); ->$_at_SalesAccount; ->$_ar_SalesAmount; ->$_at_SalesAnalysis)
		$_r_Sum:=Sum:C1($_ar_SalesAmount)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1="xtotala")
		$_r_Sum2:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)
		If ($_r_Sum2#$_r_Sum)
			For ($_l_SetSales; 1; Size of array:C274($_at_SalesAccount))
				//Gen_Message ("Updating Sales Amount "+$_at_SalesAccount{$_l_SetSales}+" "+String($_l_Year)+" "+"Xtotala"+" "+String($_l_SetSales)+" of "+String(Size of array($_at_SalesAccount));$_bo_OpenWIndow;Palette form window)
				
				
				
				$_at_SalesAnalysis{$_l_SetSales}:=Replace string:C233($_at_SalesAnalysis{$_l_SetSales}; "LIC@"; "TED")  //Change Licensefee etc to TED.
				
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_at_SalesAccount{$_l_SetSales}; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1="XTOTALa")
				
				If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
					CREATE RECORD:C68([ACCOUNT_BALANCES:34])
					[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_Period
					[ACCOUNT_BALANCES:34]Account_Code:2:=$_at_SalesAccount{$_l_SetSales}
					[ACCOUNT_BALANCES:34]Analysis_Code:1:="xTotalA"
					[ACCOUNT_BALANCES:34]Layer_Code:5:="X"  //this makes sure the account stays out of view-because the layer does not exist
					[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1  //this makes sure the account balance is never checked
				End if 
				If ([ACCOUNT_BALANCES:34]Balance:3#$_ar_SalesAmount{$_l_SetSales})
					[ACCOUNT_BALANCES:34]Balance:3:=$_ar_SalesAmount{$_l_SetSales}
					SAVE RECORD:C53([ACCOUNT_BALANCES:34])
				End if 
			End for 
		End if 
		ARRAY TEXT:C222($_at_SalesAccount; 0)
		ARRAY TEXT:C222($_at_SalesAnalysis; 0)
		ARRAY REAL:C219($_ar_SalesAmount; 0)
		$_t_Label:="'xTOTALb'"
		TREND_SQL_GetDataToArrays("SalesTotalsB"; TREND_SQLBuildReplacements($_t_Label; "TOPS_TotalLabel"; $_t_SQLTableName; "TOPS_TableName"); ->$_at_SalesAccount; ->$_ar_SalesAmount; ->$_at_SalesAnalysis)
		$_r_Sum:=Sum:C1($_ar_SalesAmount)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1="xtotalb")
		$_r_Sum2:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)
		If ($_r_Sum2#$_r_Sum)
			
			
			For ($_l_SetSales; 1; Size of array:C274($_at_SalesAccount))
				//Gen_Message ("Updating Sales Amount "+$_at_SalesAccount{$_l_SetSales}+" "+String($_l_Year)+" "+"Xtotalb"+" "+String($_l_SetSales)+" of "+String(Size of array($_at_SalesAccount));$_bo_OpenWIndow;Palette form window)
				
				
				$_at_SalesAnalysis{$_l_SetSales}:=Replace string:C233($_at_SalesAnalysis{$_l_SetSales}; "LIC@"; "TED")  //Change Licensefee etc to TED.
				
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_at_SalesAccount{$_l_SetSales}; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1="XTOTALb")
				
				If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
					CREATE RECORD:C68([ACCOUNT_BALANCES:34])
					[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_Period
					[ACCOUNT_BALANCES:34]Analysis_Code:1:="xTotalb"
					[ACCOUNT_BALANCES:34]Account_Code:2:=$_at_SalesAccount{$_l_SetSales}
					[ACCOUNT_BALANCES:34]Layer_Code:5:="X"  //this makes sure the account stays out of view-because the layer does not exist
					[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1  //this makes sure the account balance is never checked
				End if 
				If ([ACCOUNT_BALANCES:34]Balance:3#$_ar_SalesAmount{$_l_SetSales})
					
					[ACCOUNT_BALANCES:34]Balance:3:=$_ar_SalesAmount{$_l_SetSales}
					SAVE RECORD:C53([ACCOUNT_BALANCES:34])
				End if 
			End for 
		End if 
		
	End for 
End if 




//On Tops although we have a field called REP(which is the sales area). this was never obtained from Sage it was populated by calculating the sales(from xtotalb) for all the stockists of of a rep.
//that is therefore calculatable on the fly(Rep-stockists-sales per year)
//on tops we also calculate the type-which is the customer types
//these are not filled by default though. So both of these are calculatable(we can write a function(GetSalesByArea(Year) GetSalesByCustomerType(Year) which can apply to a group of personnel/areas/customer types or a single record

//$_i_CurrentYear:=$1
//$_t_SalesGroup:=$2
//$_Ptr_SalesAccount:=$3
//$_ptr_ProductGroup:=$4
//$_Ptr_SalesValue:=$5
//$_Ptr_SalesYear:=$6

//$FURTHFIELDSEXIST:=FUR_FIELDSLOAD (->[COMPANIES];->C$_at_FurtherCommentIDS;->$_at_FurtherCommentLabels)  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN


TREND_SQLgetData("Stockists"; ->$_at_Replacements; ->$_at_WhattoReplace; ->$_at_SQL_Result)
//xTOTALb will go in account balances analysis code
//the period code will be the last period of the year(for all year)
//the account code will be the company account code
//rep
//type
//itc
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1="xTOTALb")
SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Account_Code:2; $_at_TotalCompanyCode; [ACCOUNT_BALANCES:34]Balance:3; $_ar_TotalCompanyValue; [ACCOUNT_BALANCES:34]Period_Code:4; $_at_TotalsPeriodCodes)
//get the year from the period codes

//to get the sales for the company stored in the same way as TOPS-where we bring them into a 'sales figures' table
//daybook will utilise the account balances table. with a period code a layer of -(the year) and a account code of the x... variaty.
//the accounts dont exist and the layers dont exist so these remain 'hidden' from view


READ WRITE:C146([COMPANIES:2])
If (Size of array:C274($_at_SQL_Result{1})>0)
	$_l_Columns:=Size of array:C274($_at_SQL_Result{1})
	ALL RECORDS:C47([COMPANIES:2])
	DISTINCT VALUES:C339([COMPANIES:2]Company_Code:1; $_at_StockistAccountnumbers)
	ARRAY BOOLEAN:C223($_aBo_RecordSeen; Size of array:C274($_at_StockistAccountnumbers))
	
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "Prospect")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "ENDUSER")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "COW")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "HOLIDAY")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "OTHER")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; "SHOW")
	If ($_l_Ref>0)
		$_aBo_RecordSeen{$_l_Ref}:=True:C214
	End if 
	$_bo_OpenWIndow:=True:C214
	
	For ($_l_ReceiveRecords; 1; Size of array:C274($_at_SQL_Result{1}))
		
		$_bo_RecordModified:=False:C215
		$_bo_OpenWIndow:=False:C215
		$_l_Ref:=Find in array:C230($_at_StockistAccountnumbers; $_at_SQL_Result{1}{$_l_ReceiveRecords})
		If ($_l_Ref<0)  //new record
			CREATE RECORD:C68([COMPANIES:2])
			[COMPANIES:2]Company_Code:1:=$_at_SQL_Result{1}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
			
		Else 
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_SQL_Result{1}{$_l_ReceiveRecords})
			$_abo_RecordSeen{$_l_Ref}:=True:C214
			$_bo_RecordModified:=False:C215
		End if 
		//Gen_Message ("Synch Companies From Sage :"+String($_l_ReceiveRecords)+" of "+String(Size of array($_at_SQL_Result{1}))+" "+$_at_SQL_Result{1}{$_l_ReceiveRecords};$_bo_OpenWIndow;Palette form window)
		
		
		
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1="Xtotalb"; *)
		QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=[COMPANIES:2]Company_Code:1)
		SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Balance:3; $_ar_SalesAmount; [ACCOUNT_BALANCES:34]Period_Code:4; $_at_PeriodCode)
		ARRAY LONGINT:C221($_al_Year; 0)
		ARRAY LONGINT:C221($_al_Year; Size of array:C274($_ar_SalesAmount))
		For ($_l_GetYears; 1; Size of array:C274($_ar_SalesAmount))
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCode{$_l_GetYears})
			$_al_Year{$_l_GetYears}:=Year of:C25([PERIODS:33]To_Date:4)
		End for 
		//
		//$FURTHFIELDSEXIST:=FUR_FIELDSLOAD (->[COMPANIES];->COM_at_FurtherCommentIDS;->COM_at_FurtherCommentLabels)  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
		
		
		//I  //f (Records in selection([CUSTOM_FIELDS])>0)
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year0)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year0)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year0); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year1)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year1)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year1); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year2)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year2)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year2); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year3)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year3)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year3); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year4)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year4)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year4); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year5)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year5)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year5); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year6)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year6)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year6); String:C10($_r_Sales))
				
			End if 
		End if 
		$_r_SalesYear:=Num:C11(FurthFld_Get("Companies"; "Sales Year "+String:C10($_l_Year7)))
		$_l_Ref:=Find in array:C230($_al_Year; $_l_Year7)
		If ($_l_Ref>0)
			$_r_Sales:=$_ar_SalesAmount{$_l_Ref}
			If ($_r_Sales#$_r_SalesYear)
				FurthFld_Set("Companies"; "Sales Year "+String:C10($_l_Year7); String:C10($_r_Sales))
				
			End if 
		End if 
		///End if 
		If ([COMPANIES:2]Company_Name:2#($_at_SQL_Result{2}{$_l_ReceiveRecords}))
			[COMPANIES:2]Company_Name:2:=$_at_SQL_Result{2}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		//actually here we need to use the address component to 'fix' the address
		$_t_address1:=$_at_SQL_Result{3}{$_l_ReceiveRecords}
		$_t_address2:=$_at_SQL_Result{4}{$_l_ReceiveRecords}
		$_t_address3:=$_at_SQL_Result{5}{$_l_ReceiveRecords}
		$_t_address4:=$_at_SQL_Result{6}{$_l_ReceiveRecords}
		$_t_addressTown:=$_at_SQL_Result{9}{$_l_ReceiveRecords}
		$_t_addressCounty:=$_at_SQL_Result{10}{$_l_ReceiveRecords}
		$_t_addressCountry:=$_at_SQL_Result{37}{$_l_ReceiveRecords}
		$_t_postCode:=""
		UTIL_SmartConstructAddress($_t_address1; $_t_address2; $_t_address3; $_t_address4; $_t_addressTown; $_t_addressCounty; $_t_addressCountry; ""; ->$_t_outaddress1; ->$_t_Outaddress2; ->$_t_Outaddress3; ->$_t_Outaddress4; ->$_t_OutTown; ->$_t_OutCounty; ->$_t_OutCountry; ->$_t_OutPostcode)
		//because of the 'cookie' formatting on TOPS we are going to put the address data into a group of vars first.
		//parse that using the address component
		//and then compare the results with the stored data.
		//what to do with address 3 and 4??
		If ($_t_outaddress3#"") | ($_t_outaddress4#"")
			If ($_t_outaddress4="")
				$_t_outaddress2:=$_t_outaddress2+", "+$_t_outaddress3
			Else 
				
				$_t_outaddress1:=$_t_outaddress1+", "+$_t_outaddress2
				$_t_outaddress2:=$_t_outaddress3+", "+$_t_outaddress4
			End if 
			
		End if 
		
		If ([COMPANIES:2]Address_Line_one:3#$_t_Outaddress1)
			[COMPANIES:2]Address_Line_one:3:=$_t_Outaddress1
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Address_Line_two:4#$_t_Outaddress2)
			[COMPANIES:2]Address_Line_two:4:=$_t_Outaddress2
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Town_or_City:5#$_t_OutTown)
			[COMPANIES:2]Town_or_City:5:=$_t_OutaddressTown
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Postal_Code:7#$_t_OutpostCode)
			[COMPANIES:2]Postal_Code:7:=$_t_OutpostCode
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]County_or_State:6#$_t_OutCounty)
			[COMPANIES:2]Postal_Code:7:=$_t_OutCounty
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Country:8#$_t_OutCountry)
			[COMPANIES:2]Postal_Code:7:=$_t_OutCountry
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Telephone:9#$_at_SQL_Result{7}{$_l_ReceiveRecords})
			[COMPANIES:2]Telephone:9:=$_at_SQL_Result{7}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Fax:10#$_at_SQL_Result{8}{$_l_ReceiveRecords})
			[COMPANIES:2]Fax:10:=$_at_SQL_Result{8}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		$_T_INVOICECOMPANYCODE:=$_at_SQL_Result{11}{$_l_ReceiveRecords}
		If ($_T_INVOICECOMPANYCODE#[COMPANIES:2]Company_Code:1)
			If ($_T_INVOICECOMPANYCODE#[COMPANIES:2]Superior:34)
				[COMPANIES:2]Superior:34:=$_T_INVOICECOMPANYCODE
				[COMPANIES:2]Invoice_Superior:57:=True:C214
				$_bo_RecordModified:=True:C214
			End if 
		Else 
			If ([COMPANIES:2]Invoice_Address_Line_One:18#[COMPANIES:2]Address_Line_one:3)
				[COMPANIES:2]Invoice_Address_Line_One:18:=[COMPANIES:2]Address_Line_one:3
				$_bo_RecordModified:=True:C214
			End if 
			If ([COMPANIES:2]Invoice_Address_Line_Two:19#[COMPANIES:2]Address_Line_two:4)
				[COMPANIES:2]Invoice_Address_Line_Two:19:=[COMPANIES:2]Address_Line_two:4
				$_bo_RecordModified:=True:C214
			End if 
			If ([COMPANIES:2]Invoice_Town:20#[COMPANIES:2]Town_or_City:5)
				[COMPANIES:2]Invoice_Town:20:=[COMPANIES:2]Town_or_City:5
				$_bo_RecordModified:=True:C214
			End if 
			If ([COMPANIES:2]Invoice_County:21#[COMPANIES:2]County_or_State:6)
				[COMPANIES:2]Invoice_County:21:=[COMPANIES:2]County_or_State:6
				$_bo_RecordModified:=True:C214
			End if 
			If ([COMPANIES:2]Invoice_Country:23#[COMPANIES:2]Country:8)
				[COMPANIES:2]Invoice_Country:23:=[COMPANIES:2]Country:8
				$_bo_RecordModified:=True:C214
			End if 
		End if 
		$_T_INVOICESTATEMENTCODE:=$_at_SQL_Result{12}{$_l_ReceiveRecords}
		///
		$_t_StatementCompany:=FurthFld_Get("Companies"; "Statement Company")
		
		If ($_T_INVOICESTATEMENTCODE#$_t_StatementCompany)
			FurthFld_Set("Companies"; "Statement Company"; $_T_INVOICESTATEMENTCODE)
			$_bo_RecordModified:=True:C214
		End if 
		
		///
		If ($_T_INVOICESTATEMENTCODE#[COMPANIES:2]Company_Code:1)
			If ($_T_INVOICESTATEMENTCODE#[COMPANIES:2]Superior:34)
				//TRACE
			End if 
			If ([COMPANIES:2]Superior:34="")
				[COMPANIES:2]Superior:34:=$_T_INVOICESTATEMENTCODE
				[COMPANIES:2]Invoice_Superior:57:=True:C214
				$_bo_RecordModified:=True:C214
			End if 
		Else 
			//[COMPANIES]Invoice_Address_Line_One:=[COMPANIES]Address_Line_one
			//[COMPANIES]Invoice_Address_Line_Two:=[COMPANIES]Address_Line_two
			//[COMPANIES]Invoice_Town:=[COMPANIES]Town_or_City
			//[COMPANIES]Invoice_County:=[COMPANIES]County_or_State
			//[COMPANIES]Invoice_Country:=[COMPANIES]Country
		End if 
		////
		//If ([COMPANIES]Invoice#Str_TrailSpaces(aK{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Invoice:=Str_TrailSpaces(aK{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Statement#Str_TrailSpaces(aL{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Statement:=Str_TrailSpaces(aL{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$_at_SQL_Result{13}{$_l_ReceiveRecords})
		
		If (Records in selection:C76([TYPES:5])=0)
			CREATE RECORD:C68([TYPES:5])
			[TYPES:5]Type_Code:1:=$_at_SQL_Result{13}{$_l_ReceiveRecords}
			[TYPES:5]Type_Name:2:=$_at_SQL_Result{13}{$_l_ReceiveRecords}
			SAVE RECORD:C53([TYPES:5])
			
			
		End if 
		If ([COMPANIES:2]Company_Type:13#$_at_SQL_Result{13}{$_l_ReceiveRecords})
			[COMPANIES:2]Company_Type:13:=$_at_SQL_Result{13}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$_at_SQL_Result{14}{$_l_ReceiveRecords})
		If (Records in selection:C76([AREAS:3])=0)
			CREATE RECORD:C68([AREAS:3])
			[AREAS:3]Area_Code:1:=$_at_SQL_Result{14}{$_l_ReceiveRecords}
			[AREAS:3]Area_Name:2:=[AREAS:3]Area_Code:1
			SAVE RECORD:C53([AREAS:3])
		End if 
		If ([COMPANIES:2]Area:11#$_at_SQL_Result{14}{$_l_ReceiveRecords})
			[COMPANIES:2]Area:11:=$_at_SQL_Result{14}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		//1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,37
		//,18,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38
		//$_R_DISCOUNT:=Num($_at_SQL_Result{15}{$_l_ReceiveRecords})
		$_t_DiscountGroup:=$_at_SQL_Result{15}{$_l_ReceiveRecords}
		QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_DiscountGroup)
		If (Records in selection:C76([PRICE_GROUPS:18])=0)
			CREATE RECORD:C68([PRICE_GROUPS:18])
			[PRICE_GROUPS:18]Price_Code:1:=$_t_DiscountGroup
			[PRICE_GROUPS:18]PriceGroupClass:9:=3
			[PRICE_GROUPS:18]Override:6:=True:C214
			SAVE RECORD:C53([PRICE_GROUPS:18])
		End if 
		//we dont need to create the price table entry for that group here-it is created when we bring in the discounts(and price table and special prices
		//we need to know what those groups are in terms of discount
		//we will now check there is a company discount pric table entry for the amount of discount
		If (False:C215)
			//$_R_DISCOUNT:= ?? ?00:00:00?
			If ($_R_DISCOUNT#0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=""; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Pricing_Basis:17=0; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=[COMPANIES:2]Company_Code:1; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRICE_GROUPS:18]Price_Code:1; *)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Discount:3=$_R_DISCOUNT)
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					CREATE RECORD:C68([PRICE_TABLE:28])
					[PRICE_TABLE:28]Price_Discount:3:=$_R_DISCOUNT
					[PRICE_TABLE:28]Group_Code:6:=[PRICE_GROUPS:18]Price_Code:1
					[PRICE_TABLE:28]Pricing_Basis:17:=0
				End if 
				
			End if 
			//we do not create a
			
			
			//need to know how these relate to each other-does a discount 
			
			//
			
			
			If ([COMPANIES:2]SO_Price_Group:44#$_t_DiscountGroup)
				[COMPANIES:2]SO_Price_Group:44:=$_t_DiscountGroup
				$_bo_RecordModified:=True:C214
			End if 
			$_t_SpecialPrices:=$_at_SQL_Result{38}{$_l_ReceiveRecords}
			If ($_t_SpecialPrices#"")
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_SpecialPrices)
				If (Records in selection:C76([PRICE_GROUPS:18])=0)
					CREATE RECORD:C68([PRICE_GROUPS:18])
					[PRICE_GROUPS:18]Price_Code:1:=$_t_SpecialPrices
					[PRICE_GROUPS:18]PriceGroupClass:9:=1
					[PRICE_GROUPS:18]Override:6:=True:C214
					SAVE RECORD:C53([PRICE_GROUPS:18])
				End if 
			End if 
			$_t_SpecialList:=FurthFld_Get("Companies"; "Special Price List")
			If (($_at_SQL_Result{38}{$_l_ReceiveRecords})#$_t_SpecialList)
				FurthFld_Set("Companies"; "Special Price List"; ($_at_SQL_Result{38}{$_l_ReceiveRecords}))
				$_bo_RecordModified:=True:C214
			End if 
			$_t_PriceList:=$_at_SQL_Result{32}{$_l_ReceiveRecords}
			If ($_t_PriceList#"")
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_t_PriceList)
				If (Records in selection:C76([PRICE_GROUPS:18])=0)
					CREATE RECORD:C68([PRICE_GROUPS:18])
					[PRICE_GROUPS:18]Price_Code:1:=$_t_PriceList
					[PRICE_GROUPS:18]PriceGroupClass:9:=1
					[PRICE_GROUPS:18]Override:6:=True:C214
					SAVE RECORD:C53([PRICE_GROUPS:18])
				End if 
			End if 
		End if 
		$_t_CompanyList:=FurthFld_Get("Companies"; "Price List")
		If (($_at_SQL_Result{32}{$_l_ReceiveRecords})#$_t_CompanyList)
			FurthFld_Set("Companies"; "Price List"; ($_at_SQL_Result{32}{$_l_ReceiveRecords}))
			$_bo_RecordModified:=True:C214
		End if 
		
		
		
		
		//as we do not have the concept of a 'rebate ' company on Daybook we will store this is an Custom field
		$_t_RebateCompany:=FurthFld_Get("Companies"; "Rebate Company")
		If (($_at_SQL_Result{16}{$_l_ReceiveRecords})#$_t_RebateCompany)
			FurthFld_Set("Companies"; "Statement Company"; ($_at_SQL_Result{16}{$_l_ReceiveRecords}))
			$_bo_RecordModified:=True:C214
		End if 
		$_bo_OnStop:=($_at_SQL_Result{17}{$_l_ReceiveRecords}="Y")
		//CREDIT STAGE
		If ($_bo_OnStop)
			QUERY:C277([CREDIT_STAGES:54]; [CREDIT_STAGES:54]Stage_Name:2="On Stop")
			If ([COMPANIES:2]Default_Credit_Stage:42#[CREDIT_STAGES:54]Stage_Code:1)
				[COMPANIES:2]Default_Credit_Stage:42:=[CREDIT_STAGES:54]Stage_Code:1
				$_bo_RecordModified:=True:C214
			End if 
		Else 
			If ([COMPANIES:2]Default_Credit_Stage:42#DB_GetLedgerInvoiceDefaultStage)
				[COMPANIES:2]Default_Credit_Stage:42:=DB_GetLedgerInvoiceDefaultStage
				$_bo_RecordModified:=True:C214
			End if 
		End if 
		$_t_Comment:=$_at_SQL_Result{18}{$_l_ReceiveRecords}
		//this is not really a comment-it some kind of not but just a single line-we 
		$_t_CommentNote:=FurthFld_Get("Companies"; "Comment Note")
		If ($_t_CommentNote#$_t_Comment)
			FurthFld_Set("Companies"; "Comment Note"; $_t_Comment)
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Entry_Date:16#Date:C102($_at_SQL_Result{20}{$_l_ReceiveRecords}))
			[COMPANIES:2]Entry_Date:16:=Date:C102($_at_SQL_Result{20}{$_l_ReceiveRecords})
			$_bo_RecordModified:=True:C214
		End if 
		$_d_LastInvoice:=Date:C102($_at_SQL_Result{19}{$_l_ReceiveRecords})
		//this is not really a comment-it some kind of not but just a single line-we 
		$_d_LastInvoiceceDate:=Date:C102(FurthFld_Get("Companies"; "Last Invoice Date"))
		If ($_d_LastInvoice#$_d_LastInvoiceceDate)
			FurthFld_Set("Companies"; "Last Invoice Date"; String:C10($_d_LastInvoice))
		End if 
		//"Credit Insurance Amount"
		$_r_CredInsurance:=Num:C11($_at_SQL_Result{21}{$_l_ReceiveRecords})
		//this is not really a comment-it some kind of not but just a single line-we 
		$_r_CredInsuranceAmount:=Num:C11(FurthFld_Get("Companies"; "Credit Insurance Amount"))
		
		If ($_r_CredInsuranceAmount#$_r_CredInsurance)
			FurthFld_Set("Companies"; "Credit Insurance Amount"; String:C10($_r_CredInsurance))
		End if 
		///
		
		
		
		
		
		
		
		
		///
		$_t_Facilities:=$_at_SQL_Result{22}{$_l_ReceiveRecords}
		$_bo_FaxBack:=($_t_Facilities="@6@")
		$_bo_Hire:=($_t_Facilities="@H@")
		$_bo_ITC:=($_t_Facilities="@I@")
		$_bo_Leads:=($_t_Facilities="@L@")
		$_bo_Mail:=($_t_Facilities="@M@")
		$_bo_PC:=($_t_Facilities="@PC@")
		$_bo_TSA:=($_t_Facilities="@S@")
		$_bo_TTCs:=($_t_Facilities="@T@")
		$_bo_VOUCHER:=($_t_Facilities="@V@")
		$_bo_Ws:=($_t_Facilities="@W@")
		$_t_FaxBack:=FurthFld_Get("Companies"; "Fax Back Facility")
		If ($_bo_FaxBack#($_t_FaxBack="Y"))
			If ($_bo_FaxBack)
				FurthFld_Set("Companies"; "Fax Back Facility"; "Y")
			Else 
				FurthFld_Set("Companies"; "Fax Back Facility"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_Hire:=FurthFld_Get("Companies"; "Hire Facilities")
		If ($_bo_Hire#($_t_Hire="Y"))
			If ($_bo_Hire)
				FurthFld_Set("Companies"; "Hire Facilities"; "Y")
			Else 
				FurthFld_Set("Companies"; "Hire Facilities"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_ITC:=FurthFld_Get("Companies"; "Industrial Tooling Centre")
		If ($_bo_ITC#($_t_ITC="Y"))
			If ($_bo_ITC)
				FurthFld_Set("Companies"; "Industrial Tooling Centre"; "Y")
			Else 
				FurthFld_Set("Companies"; "Industrial Tooling Centre"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_Leads:=FurthFld_Get("Companies"; "Sales Leads")
		If ($_bo_Leads#($_t_Leads="Y"))
			If ($_bo_Leads)
				FurthFld_Set("Companies"; "Sales Leads"; "Y")
			Else 
				FurthFld_Set("Companies"; "Sales Leads"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_Mail:=FurthFld_Get("Companies"; "Mail_Order Facilities")
		If ($_bo_Mail#($_t_Mail="Y"))
			If ($_bo_Mail)
				FurthFld_Set("Companies"; "Mail_Order Facilities"; "Y")
			Else 
				FurthFld_Set("Companies"; "Mail_Order Facilities"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_PC:=FurthFld_Get("Companies"; "Personalised Catalogues")
		If ($_bo_PC#($_t_PC="Y"))
			If ($_bo_PC)
				FurthFld_Set("Companies"; "Personalised Catalogues"; "Y")
			Else 
				FurthFld_Set("Companies"; "Personalised Catalogues"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_TSA:=FurthFld_Get("Companies"; "TSA")
		If ($_bo_TSA#($_t_TSA="Y"))
			If ($_bo_TSA)
				FurthFld_Set("Companies"; "Trend Service Agent"; "Y")
			Else 
				FurthFld_Set("Companies"; "Trend Service Agent"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_VOUCHER:=FurthFld_Get("Companies"; "TTC")
		If ($_bo_VOUCHER#($_t_VOUCHER="Y"))
			If ($_bo_VOUCHER)
				FurthFld_Set("Companies"; "Voucher Facilities"; "Y")
			Else 
				FurthFld_Set("Companies"; "Voucher Facilities"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		$_t_Ws:=FurthFld_Get("Companies"; "TTC")
		If ($_bo_Ws#($_t_Ws="Y"))
			If ($_bo_Ws)
				FurthFld_Set("Companies"; "TSA Bus WEEE"; "Y")
			Else 
				FurthFld_Set("Companies"; "TSA Bus WEEE"; "N")
				
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		//23=EASTINGS
		$_T_EASTINGS:=$_at_SQL_Result{23}{$_l_ReceiveRecords}
		$_T_NORTHINGS:=$_at_SQL_Result{24}{$_l_ReceiveRecords}
		$_t_East:=FurthFld_Get("Companies"; "Easting")
		If ($_T_EASTINGS#$_T_EAST)
			FurthFld_Set("Companies"; "Easting"; $_T_EASTINGS)
			$_bo_RecordModified:=True:C214
		End if 
		$_t_North:=FurthFld_Get("Companies"; "Northing")
		If ($_T_NORTHINGS#$_t_North)
			FurthFld_Set("Companies"; "Northing"; $_T_NORTHINGS)
			$_bo_RecordModified:=True:C214
		End if 
		$_T_DNOption:=$_at_SQL_Result{25}{$_l_ReceiveRecords}
		If ($_T_DNOption="BOTHPRINT")
			$_T_DNOption:="BOTH"
		End if 
		If ($_T_DNOption="PRNT")
			$_T_DNOption:="PRINT"
		End if 
		$_t_PrintOption:=FurthFld_Get("Companies"; "DN Option Print")
		If ($_T_DNOption#$_t_PrintOption)
			FurthFld_Set("Companies"; "DN Option Print"; $_T_DNOption)
			$_bo_RecordModified:=True:C214
		End if 
		$_T_NewPriceOption:=$_at_SQL_Result{26}{$_l_ReceiveRecords}
		$_t_PriceOption:=FurthFld_Get("Companies"; "DN Option Show Price")
		If ($_T_NewPriceOption#$_t_PriceOption)
			FurthFld_Set("Companies"; "DN Option Show Price"; $_T_NewPriceOption)
			$_bo_RecordModified:=True:C214
		End if 
		$_T_NewPriceOption:=$_at_SQL_Result{40}{$_l_ReceiveRecords}
		$_t_PrintOption:=FurthFld_Get("Companies"; "INV Option Show Price")
		If ($_T_DNOption#$_t_PrintOption)
			FurthFld_Set("Companies"; "INV Option Show Price"; $_T_DNOption)
			$_bo_RecordModified:=True:C214
		End if 
		$_t_CompanyStatementType:=$_at_SQL_Result{30}{$_l_ReceiveRecords}
		$_t_PrintOption:=FurthFld_Get("Companies"; "INV Option Print")
		If ($_t_CompanyStatementType#$_t_PrintOption)
			FurthFld_Set("Companies"; "INV Option Print"; $_T_DNOption)
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_CompanyStatementType:=$_at_SQL_Result{30}{$_l_ReceiveRecords}
		$_t_PrintOption:=FurthFld_Get("Companies"; "INV Statement Option Print")
		If ($_t_CompanyStatementType#$_t_PrintOption)
			FurthFld_Set("Companies"; "INV Statement Option Print"; $_t_CompanyStatementType)
			$_bo_RecordModified:=True:C214
		End if 
		$_t_CoINvoiceType:=$_at_SQL_Result{39}{$_l_ReceiveRecords}
		$_t_PrintOption:=FurthFld_Get("Companies"; "INV  Option Print")
		If ($_t_CoINvoiceType#$_t_PrintOption)
			FurthFld_Set("Companies"; "INV  Option Print"; $_t_CoINvoiceType)
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_Flags:=$_at_SQL_Result{27}{$_l_ReceiveRecords}
		If (Length:C16($_t_Flags)<4)
			$_t_Flags:=$_t_Flags+(" "*4)
		End if 
		$_bo_COOfOrigin:=($_t_Flags[[1]]="Y")
		$_bo_Weight:=($_t_Flags[[2]]="Y")
		$_bo_CUstRef:=($_t_Flags[[3]]="Y")
		$_bo_Tarrif:=($_t_Flags[[3]]="Y")
		//
		$_t_COfO:=FurthFld_Get("Companies"; "DN Pref: IncCo of Origin")
		If (($_t_COfO="Y")#$_bo_COOfOrigin)
			If ($_bo_COOfOrigin)
				FurthFld_Set("Companies"; "DN Pref: IncCo of Origin"; "Y")
			Else 
				FurthFld_Set("Companies"; "DN Pref: IncCo of Origin"; "N")
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_Weight:=FurthFld_Get("Companies"; "DN Pref: Inc Weight")
		If (($_t_Weight="Y")#$_bo_Weight)
			If ($_bo_Weight)
				FurthFld_Set("Companies"; "DN Pref: Inc Weight"; "Y")
			Else 
				FurthFld_Set("Companies"; "DN Pref: Inc Weight"; "N")
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_CustRef:=FurthFld_Get("Companies"; "DN Pref: Inc Customer Ref")
		If (($_t_CustRef="Y")#$_bo_CUstRef)
			If ($_bo_CUstRef)
				FurthFld_Set("Companies"; "DN Pref: Inc Customer Ref"; "Y")
			Else 
				FurthFld_Set("Companies"; "DN Pref: Inc Customer Ref"; "N")
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_Tarrif:=FurthFld_Get("Companies"; "DN Pref: Inc Tarrif Code")
		If (($_t_Tarrif="Y")#$_bo_Tarrif)
			If ($_bo_Tarrif)
				FurthFld_Set("Companies"; "DN Pref: Inc Tarrif Code"; "Y")
			Else 
				FurthFld_Set("Companies"; "DN Pref: Inc Tarrif Code"; "N")
			End if 
			$_bo_RecordModified:=True:C214
		End if 
		
		
		
		
		//
		
		$_t_NewCompetitor:=$_at_SQL_Result{28}{$_l_ReceiveRecords}
		$_t_Competitor:=FurthFld_Get("Companies"; "Competitor")
		If ($_t_Competitor#$_t_NewCompetitor)
			FurthFld_Set("Companies"; "Competitor"; $_t_NewCompetitor)
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_NewCall:=$_at_SQL_Result{29}{$_l_ReceiveRecords}
		$_t_Call:=FurthFld_Get("Companies"; "On Call Rota")
		If ($_t_Call#$_t_NewCall)
			FurthFld_Set("Companies"; "On Call Rota"; $_t_NewCall)
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Default_Currency:59#$_at_SQL_Result{31}{$_l_ReceiveRecords})
			If ($_at_SQL_Result{31}{$_l_ReceiveRecords}#"")
				If ($_at_SQL_Result{31}{$_l_ReceiveRecords}="GBP")
					$_at_SQL_Result{31}{$_l_ReceiveRecords}:="£"
				End if 
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_at_SQL_Result{31}{$_l_ReceiveRecords})
				If (Records in selection:C76([CURRENCIES:71])=0)
					CREATE RECORD:C68([CURRENCIES:71])
					[CURRENCIES:71]Currency_Code:1:=$_at_SQL_Result{31}{$_l_ReceiveRecords}
					SAVE RECORD:C53([CURRENCIES:71])
				End if 
				[COMPANIES:2]Default_Currency:59:=$_at_SQL_Result{31}{$_l_ReceiveRecords}
				$_bo_RecordModified:=True:C214
			End if 
			
		End if 
		If ([COMPANIES:2]Sales_Credit:35#Num:C11($_at_SQL_Result{33}{$_l_ReceiveRecords}))
			[COMPANIES:2]Sales_Credit:35:=Num:C11($_at_SQL_Result{33}{$_l_ReceiveRecords})
			$_bo_RecordModified:=True:C214
		End if 
		If ([COMPANIES:2]Home_Page_URL:56#$_at_SQL_Result{41}{$_l_ReceiveRecords})
			[COMPANIES:2]Home_Page_URL:56:=$_at_SQL_Result{41}{$_l_ReceiveRecords}
			$_bo_RecordModified:=True:C214
		End if 
		$_t_CompanyEmail:=$_at_SQL_Result{42}{$_l_ReceiveRecords}
		If ($_t_CompanyEmail#"")
			$_l_Pos:=Position:C15(Char:C90(64); $_t_CompanyEmail)
			$_t_Before:=Substring:C12($_t_CompanyEmail; 1; $_l_Pos-1)
			$_t_after:=Substring:C12($_t_CompanyEmail; $_l_Pos+1)
			If ($_t_Before#[COMPANIES:2]Email_Before_At:58)
				[COMPANIES:2]Email_Before_At:58:=$_t_Before
				$_bo_RecordModified:=True:C214
			End if 
			If ($_t_After#[COMPANIES:2]EMail_After_At:55)
				[COMPANIES:2]EMail_After_At:55:=$_t_After
				$_bo_RecordModified:=True:C214
			End if 
		End if 
		
		
		
		
		$_t_SCode:=FurthFld_Get("Companies"; "Sett Code")
		If ($_t_SETTCode#$_t_SCode)
			FurthFld_Set("Companies"; "Sett Code"; $_t_SETTCode)
			$_bo_RecordModified:=True:C214
		End if 
		
		$_t_Vat:=$_at_SQL_Result{35}{$_l_ReceiveRecords}
		If ($_t_Vat="")
			$_t_Vat:="S"
		End if 
		If ([COMPANIES:2]Default_TAX:41#$_t_Vat)
			[COMPANIES:2]Default_TAX:41:=$_t_Vat
			$_bo_RecordModified:=True:C214
		End if 
		
		
		$_t_PaymentTerms:=$_at_SQL_Result{36}{$_l_ReceiveRecords}
		//th
		Case of 
			: ($_t_PaymentTerms="A")
				$_t_PaymentTerms:="Pro Forma"
			: ($_t_PaymentTerms="Z")
				$_t_PaymentTerms:="Cash With Order"
			: ($_t_PaymentTerms="P")
				$_t_PaymentTerms:="30 Days"
			: ($_t_PaymentTerms="E")
				$_t_PaymentTerms:="60 Days"
			: ($_t_PaymentTerms="X")
				$_t_PaymentTerms:="90 Days"
			Else 
				$_t_PaymentTerms:="Cash With Order"
		End case 
		ARRAY TEXT:C222(CO_at_Terms; 0)
		ARRAY LONGINT:C221(CO_al_TermsIDS; 0)
		$_l_ListID:=AA_LoadListByName("Terms"; ->CO_at_Terms; ->CO_al_TermsIDS)
		
		$_l_Ref:=Find in array:C230(CO_at_Terms; $_t_PaymentTerms)
		If ($_l_Ref<0)
			$_l_ListID:=AA_ListAddItembyID($_l_ListID; $_t_PaymentTerms)
		End if 
		If ([COMPANIES:2]SL_Terms:40#$_t_PaymentTerms)
			[COMPANIES:2]SL_Terms:40:=$_t_PaymentTerms
			$_bo_RecordModified:=True:C214
		End if 
		
		
		//37 is country-already used
		
		
		
		
		
		//If ([COMPANIES]Call#Str_TrailSpaces(aAJ{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Call:=Str_TrailSpaces(aAJ{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		
		//If ([COMPANIES]Sales_Person#Str_TrailSpaces (aN{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Sales_Person:=Str_TrailSpaces (aN{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//this is their credit stage
		//If ([COMPANIES]DaysOver#aDO{$_l_ReceiveRecords})
		//[COMPANIES]DaysOver:=aDO{$_l_ReceiveRecords}
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Last_Visit_Date#aLVD{$_l_ReceiveRecords})
		//[COMPANIES]Last_Visit_Date:=aLVD{$_l_ReceiveRecords}
		//$_bo_RecordModified:=True
		//End if 
		
		//If ([COMPANIES]Xmas_Flags#Str_TrailSpaces (aAH{$_l_ReceiveRecords};"B";" "))//27
		//[COMPANIES]Xmas_Flags:=Str_TrailSpaces (aAH{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Type_INV#Str_TrailSpaces (aAX{$_l_ReceiveRecords};"B";" "))//2
		//[COMPANIES]Type_INV:=Str_TrailSpaces (aAX{$_l_ReceiveRecords};"B";" ")
		///$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Type_STA#Str_TrailSpaces (aAK{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Type_STA:=Str_TrailSpaces (aAK{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Currency_Code#Str_TrailSpaces (aAL{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Currency_Code:=Str_TrailSpaces (aAL{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Price_List#Str_TrailSpaces (aAM{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Price_List:=Str_TrailSpaces (aAM{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Credit_Limit#aAN{$_l_ReceiveRecords})
		//[COMPANIES]Credit_Limit:=aAN{$_l_ReceiveRecords}
		//$_bo_RecordModified:=True
		///End if 
		//If ([COMPANIES]SETT_Code#Str_TrailSpaces (aAO{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]SETT_Code:=Str_TrailSpaces (aAO{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]VAT#Str_TrailSpaces (aAP{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]VAT:=Str_TrailSpaces (aAP{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//f ([COMPANIES]CREDIT#Str_TrailSpaces (aAQ{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]CREDIT:=Str_TrailSpaces (aAQ{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Address_Country#Str_TrailSpaces (aAR{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Address_Country:=Str_TrailSpaces (aAR{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Special_price#Str_TrailSpaces (aAS{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Special_price:=Str_TrailSpaces (aAS{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Website#Str_TrailSpaces (aAZ{$_l_ReceiveRecords};"B";" "))
		//[COMPANIES]Website:=Str_TrailSpaces (aAZ{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		//If ([COMPANIES]Email#Str_TrailSpaces (aAZZ{$_l_ReceiveRecords};"B";" "))
		///[COMPANIES]Email:=Str_TrailSpaces (aAZZ{$_l_ReceiveRecords};"B";" ")
		//$_bo_RecordModified:=True
		//End if 
		If ($_bo_RecordModified)
			
			
			//UTIL_SmartConstructAddress ([COMPANIES]Address_Line1;[COMPANIES]Address_Line2;[COMPANIES]Address_Line3;[COMPANIES]Address_line4;[COMPANIES]Address_Town;[COMPANIES]Address_County;[COMPANIES]Address_Country;"";->$_t_address1;->$_t_address2;->$_t_address3;->$_t_address4;->$_t_Town;->$_t_County;->$_t_Country;->$_t_Postcode)
			//[COMPANIES]FormattedAddress:=UTIL_BuildFormattedAddress($_t_address1;$_t_address2;$_t_address3;$_t_address4;$_t_Town;$_t_County;$_t_Postcode;$_t_Country)
			
			SAVE RECORD:C53([COMPANIES:2])
			
			
		End if 
		
	End for 
	ARRAY TEXT:C222($_at_RecordsToDelete; 0)
	$_l_Ref:=Find in array:C230($_abo_RecordSeen; False:C215)
	If ($_l_Ref>0)
		For ($_l_FindDeletions; $_l_Ref; Size of array:C274($_abo_RecordSeen))
			APPEND TO ARRAY:C911($_at_RecordsToDelete; $_at_StockistAccountnumbers{$_l_Ref})
			$_l_Ref:=Find in array:C230($_abo_RecordSeen; False:C215; $_l_Ref+1)
			If ($_l_Ref<0)
				
				$_l_FindDeletions:=Size of array:C274($_abo_RecordSeen)
			Else 
				$_l_FindDeletions:=$_l_Ref-1
			End if 
		End for 
	End if 
	
	
	
	
	////SQL EXECUTE($txt_SQL;aA;aB;aC;aD;aE;aF;aG;aH;aI;aJ;aK;aL;aM;aN;aO;aP;aR;aS;aT;aV;aAB;aAC;aAD;aAE;aAF;aAG;aAH;aAI;aAJ;aAK;aAL;aAM;aAN;aAO;aAP;aAQ;aAR;aAS;aAX;aAGG;aAZ;aAZZ)
	//SQL EXECUTE($txt_SQL   ;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;aAZZ)
	
	If (Size of array:C274($_at_RecordsToDelete)>0)
		
		
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_RecordsToDelete)
		APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]Deleted:61:=1)
		
	End if 
	
	
	
	
End if 
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("TREND_GetStockists"; $_t_oldMethodName)
