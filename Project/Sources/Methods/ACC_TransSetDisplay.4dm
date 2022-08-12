//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransSetDisplay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY DATE(ACC_ad_aTransDate2;0)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchitemCompanion;0;0)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY REAL(ACC_ar_BatchItemDebitAmount2;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt2;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY REAL(ACC_ar_TransCAmount2;0)
	//ARRAY REAL(ACC_ar_TransRealAmount2;0)
	//ARRAY TEXT(ACC_at_AccountNames2;0)
	//ARRAY TEXT(ACC_at_AnalysisNames;0)
	//ARRAY TEXT(ACC_at_AnalysisNames2;0)
	//ARRAY TEXT(ACC_at_BatchItemAcc2;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo2;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemConstructIdent;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditIO;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitIO;0)
	//ARRAY TEXT(ACC_at_BatchItemDescription;0)
	//ARRAY TEXT(ACC_at_BatchItemEventCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo2;0)
	//ARRAY TEXT(ACC_at_BatchItemIO2;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemlayerCode;0)
	//ARRAY TEXT(ACC_at_BatchItemLayerCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchinvno;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchInvNo2;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxCode;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxUKEC;0)
	//ARRAY TEXT(ACC_at_BatchItemTransCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemTransTypeCode;0)
	//ARRAY TEXT(ACC_at_BatchItemType;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesCode;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesname;0)
	//ARRAY TEXT(ACC_at_CompanyNames;0)
	//ARRAY TEXT(ACC_at_CompanyNames2;0)
	//ARRAY TEXT(ACC_at_CreditAcc;0)
	//ARRAY TEXT(ACC_at_CreditAccountNames;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME2;0)
	//ARRAY TEXT(ACC_at_DC;0)
	//ARRAY TEXT(ACC_at_DebitAcc;0)
	//ARRAY TEXT(ACC_at_DebitAccountNames;0)
	//ARRAY TEXT(ACC_at_IOValues;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	//ARRAY TEXT(ACC_at_LayerNames2;0)
	//ARRAY TEXT(ACC_at_ModeTransIn;0)
	//ARRAY TEXT(ACC_at_TAnalysisCode;0)
	//ARRAY TEXT(ACC_at_TCurrencyCode;0)
	//ARRAY TEXT(ACC_at_TLayerCode;0)
	//ARRAY TEXT(ACC_at_TransDescription2;0)
	//ARRAY TEXT(ACC_at_TransPurchCode2;0)
	//ARRAY TEXT(ACC_at_TTaxCode;0)
	C_BOOLEAN:C305($_bo_ShowCheque; $_bo_ShowCompany; $_bo_ShowEvent; $_bo_ShowInvoice; $_bo_ShowJob; $_bo_ShowPI; $_bo_ShowPO; ACC_bo_ConsilidatedView)
	C_LONGINT:C283($_l_ArraySize; $_l_ColumnOffset; $_l_DeletedRow; $_l_Element; $_l_IdentRow; $_l_Index; $_l_NormalFontSize; ACC_l_ColumnAnalysis; ACC_l_ColumnCheque; ACC_l_ColumnCompanyCode; ACC_l_ColumnCurrencyCode)
	C_LONGINT:C283(ACC_l_ColumnJobCode; ACC_l_ColumnLayerCode; ACC_l_ColumnPICode; ACC_l_ColumnPoCode; ACC_l_ConsilidatedView; ACC_l_ItemEntryProcess; AL_l_ColumnSInvNumber; MOD_l_CurrentModuleAccess; TRANS_l_BUT1; TRANS_l_BUT10; TRANS_l_BUT11)
	C_LONGINT:C283(TRANS_l_BUT12; TRANS_l_BUT13; TRANS_l_BUT14; TRANS_l_BUT15; TRANS_l_BUT16; TRANS_l_BUT17; TRANS_l_BUT18; TRANS_l_BUT19; TRANS_l_BUT2; TRANS_l_BUT20; TRANS_l_BUT21)
	C_LONGINT:C283(TRANS_l_BUT22; TRANS_l_BUT23; TRANS_l_BUT24; TRANS_l_BUT25; TRANS_l_BUT26; TRANS_l_BUT3; TRANS_l_BUT4; TRANS_l_BUT5; TRANS_l_BUT6; TRANS_l_BUT7; TRANS_l_BUT8)
	C_LONGINT:C283(TRANS_l_BUT9)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_REAL:C285($_r_Credit; $_r_CreditShow; $_r_CreditTotal; $_r_CreditVAT; $_r_CreditVATShow; $_r_DebitAmount; $_r_DebitShow; $_r_DebitTotal; $_r_DebitVat; $_r_DebitVatShow; $2)
	C_REAL:C285(ACC_R_BATCHCREDITTOTAL; ACC_R_BATCHDEBITTOTAL)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_ChequeReferenceCode; $_t_CompanyCode; $_t_ConstructedIdent; $_t_CurrencyCode; $_t_DC; $_t_InvoiceNumber; $_t_IO; $_t_JobCode; $_t_LayerCode)
	C_TEXT:C284($_t_oldMethodName; $_t_OldMethodName2; $_t_PeriodCode; $_t_PurchaseInvoiceCode; $_t_PurchaseOrderCode; $_t_TaxCode; $_t_TaxCountry; $_t_TransactionType; $_t_TransDateString; $1; oTRANS_COL1)
	C_TEXT:C284(oTRANS_COL10; oTRANS_COL11; oTRANS_COL12; oTRANS_COL13; oTRANS_COL14; oTRANS_COL15; oTRANS_COL16; oTRANS_COL17; oTRANS_COL18; oTRANS_COL19; oTRANS_COL2)
	C_TEXT:C284(oTRANS_COL20; oTRANS_COL21; oTRANS_COL22; oTRANS_COL23; oTRANS_COL24; oTRANS_COL25; oTRANS_COL26; oTRANS_COL27; oTRANS_COL28; oTRANS_COL29; oTRANS_COL3)
	C_TEXT:C284(oTRANS_COL30; oTRANS_COL31; oTRANS_COL33; oTRANS_COL34; oTRANS_COL35; oTRANS_COL36; oTRANS_COL37; oTRANS_COL38; oTRANS_COL5; oTRANS_COL6; oTRANS_COL7)
	C_TEXT:C284(oTRANS_COL8; oTRANS_COL9; oTRANS_HED1; oTRANS_HED10; oTRANS_HED11; oTRANS_HED12; oTRANS_HED13; oTRANS_HED14; oTRANS_HED15; oTRANS_HED16; oTRANS_HED17)
	C_TEXT:C284(oTRANS_HED18; oTRANS_HED19; oTRANS_HED2; oTRANS_HED20; oTRANS_HED21; oTRANS_HED22; oTRANS_HED23; oTRANS_HED24; oTRANS_HED25; oTRANS_HED26; oTRANS_HED3)
	C_TEXT:C284(oTRANS_HED4; oTRANS_HED5; oTRANS_HED6; oTRANS_HED7; oTRANS_HED8; oTRANS_HED9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_TransSetDisplay")

//`NG --Here consilidate and split
ACC_l_ConsilidatedView:=Num:C11(ACC_bo_ConsilidatedView)
ARRAY REAL:C219(ACC_ar_BatchItemDebitAmount2; 0)
ARRAY REAL:C219(ACC_ar_TransCAmount2; 0)
ARRAY REAL:C219(ACC_ar_TransRealAmount2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemAnalysisCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemChequeNo2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemCoCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemCurrencyCode2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemAcc2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemIO2; 0)

ARRAY TEXT:C222(ACC_at_TransDescription2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemEventCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemInvoiceNo2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemJobCode2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemLayerCode2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemPeriodCode2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemPurchInvNo2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemPurchCode2; 0)
ARRAY REAL:C219(ACC_ar_BatchItemSecondAmt2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemTransCode2; 0)
ARRAY DATE:C224(ACC_ad_aTransDate2; 0)


ARRAY TEXT:C222(ACC_at_CURRENCYNAME2; 0)
ARRAY TEXT:C222(ACC_at_AccountNames2; 0)  //²

ARRAY TEXT:C222(ACC_at_CompanyNames2; 0)  //²
ARRAY TEXT:C222(ACC_at_AnalysisNames2; 0)  //²
ARRAY TEXT:C222(ACC_at_LayerNames2; 0)  //)²
ARRAY TEXT:C222(ACC_at_BatchItemConstructIdent; 0)
ARRAY LONGINT:C221(ACC_al_BatchitemCompanion; 0; 0)
ARRAY TEXT:C222(ACC_at_BatchItemType; 0)

// these are for the listbox area 10/07/06 pb


If (Count parameters:C259=2)
	If ($1="Trans_SetDisplay")  //this is to prevent invalid calls!)
		$_l_ArraySize:=$2
		ARRAY REAL:C219(ACC_ar_BatchItemDebitAmount2; $_l_ArraySize)
		ARRAY REAL:C219(ACC_ar_TransCAmount2; $_l_ArraySize)
		ARRAY REAL:C219(ACC_ar_TransRealAmount2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemAnalysisCode2; $_l_ArraySize)
		
		ARRAY TEXT:C222(ACC_at_BatchItemChequeNo2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemCoCode2; $_l_ArraySize)
		
		ARRAY TEXT:C222(ACC_at_BatchItemCurrencyCode2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemAcc2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemIO2; $_l_ArraySize)
		
		ARRAY TEXT:C222(ACC_at_TransDescription2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemEventCode2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemInvoiceNo2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemJobCode2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemLayerCode2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemPeriodCode2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemPurchInvNo2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemPurchCode2; $_l_ArraySize)
		ARRAY REAL:C219(ACC_ar_BatchItemSecondAmt2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_BatchItemTransCode2; $_l_ArraySize)
		ARRAY DATE:C224(ACC_ad_aTransDate2; $_l_ArraySize)
		
		
		ARRAY TEXT:C222(ACC_at_CURRENCYNAME2; $_l_ArraySize)
		ARRAY TEXT:C222(ACC_at_AccountNames2; $_l_ArraySize)  //²
		
		ARRAY TEXT:C222(ACC_at_CompanyNames2; $_l_ArraySize)  //²
		ARRAY TEXT:C222(ACC_at_AnalysisNames2; $_l_ArraySize)  //²
		ARRAY TEXT:C222(ACC_at_LayerNames2; $_l_ArraySize)  //)²
		ARRAY TEXT:C222(ACC_at_BatchItemConstructIdent; $_l_ArraySize)
		ARRAY LONGINT:C221(ACC_al_BatchitemCompanion; $_l_ArraySize; 0)
		ARRAY TEXT:C222(ACC_at_BatchItemType; $_l_ArraySize)
		$_l_Element:=0
		For ($_l_Index; 1; Size of array:C274(ACC_al_BatchItemID))
			$_l_DeletedRow:=Find in array:C230(ACC_al_BatchItemDelete; ACC_al_BatchItemID{$_l_Index})
			If ($_l_DeletedRow<0)  //else it is 'deleted'
				Case of 
					: ((ACC_at_BatchItemDebitIO{$_l_Index}#"N") & (ACC_at_BatchItemCreditIO{$_l_Index}="N"))
						$_r_DebitAmount:=Gen_Round(ACC_ar_BatchItemAmounts{$_l_Index}; 2; 2)
						$_r_DebitShow:=$_r_DebitAmount
						$_r_DebitVat:=Gen_Round(ACC_ar_BatchItemTaxAmt{$_l_Index}; 2; 2)
						$_r_DebitVatShow:=$_r_DebitVat
						$_r_DebitTotal:=Gen_Round(ACC_ar_BatchItemTotal{$_l_Index}; 2; 2)
						$_r_Credit:=Gen_Round((0-ACC_ar_BatchItemTotal{$_l_Index}); 2; 2)
						$_r_CreditShow:=ACC_ar_BatchItemTotal{$_l_Index}
						$_r_CreditVAT:=0
						$_r_CreditVATShow:=0
						$_r_CreditTotal:=$_r_Credit
						
					: ((ACC_at_BatchItemDebitIO{$_l_Index}="N") & (ACC_at_BatchItemCreditIO{$_l_Index}#"N"))
						$_r_Credit:=Gen_Round((0-ACC_ar_BatchItemAmounts{$_l_Index}); 2; 2)
						$_r_CreditShow:=ACC_ar_BatchItemAmounts{$_l_Index}
						$_r_CreditVAT:=Gen_Round((0-ACC_ar_BatchItemTaxAmt{$_l_Index}); 2; 2)
						$_r_CreditVATShow:=ACC_ar_BatchItemTaxAmt{$_l_Index}
						$_r_CreditTotal:=Gen_Round((0-ACC_ar_BatchItemTotal{$_l_Index}); 2; 2)
						$_r_DebitAmount:=Gen_Round(ACC_ar_BatchItemTotal{$_l_Index}; 2; 2)
						$_r_DebitShow:=ACC_ar_BatchItemTotal{$_l_Index}
						$_r_DebitVat:=0
						$_r_DebitVatShow:=0
						$_r_DebitTotal:=$_r_DebitAmount
						
					Else 
						$_r_Credit:=Gen_Round((0-ACC_ar_BatchItemAmounts{$_l_Index}); 2; 2)
						$_r_CreditShow:=ACC_ar_BatchItemAmounts{$_l_Index}
						$_r_CreditVAT:=Gen_Round((0-ACC_ar_BatchItemTaxAmt{$_l_Index}); 2; 2)
						$_r_CreditVATShow:=ACC_ar_BatchItemTaxAmt{$_l_Index}
						$_r_CreditTotal:=Gen_Round((0-ACC_ar_BatchItemTotal{$_l_Index}); 2; 2)
						
						$_r_DebitAmount:=Gen_Round(ACC_ar_BatchItemAmounts{$_l_Index}; 2; 2)
						$_r_DebitShow:=ACC_ar_BatchItemAmounts{$_l_Index}
						$_r_DebitVat:=Gen_Round(ACC_ar_BatchItemTaxAmt{$_l_Index}; 2; 2)
						$_r_DebitVatShow:=ACC_ar_BatchItemTaxAmt{$_l_Index}
						$_r_DebitTotal:=Gen_Round(ACC_ar_BatchItemTotal{$_l_Index}; 2; 2)
						
				End case 
				If (ACC_at_BatchItemDebitAcc{$_l_Index}#"")
					//Build identifier
					//Trans_Type
					$_t_TransactionType:=" "*(10-Length:C16(ACC_at_BatchItemTransTypeCode{$_l_Index}))+ACC_at_BatchItemTransTypeCode{$_l_Index}
					//Debit
					$_t_DC:="D"
					//Account code
					$_t_AccountCode:=" "*(10-Length:C16(ACC_at_BatchItemDebitAcc{$_l_Index}))+ACC_at_BatchItemDebitAcc{$_l_Index}
					//Currency Code
					$_t_CurrencyCode:=" "*(10-Length:C16(ACC_at_BatchItemCurrencyCode{$_l_Index}))+ACC_at_BatchItemCurrencyCode{$_l_Index}
					//Analysis code
					$_t_AnalysisCode:=" "*(10-Length:C16(ACC_at_BatchItemAnalysisCode{$_l_Index}))+ACC_at_BatchItemAnalysisCode{$_l_Index}
					//Layer code
					$_t_LayerCode:=" "*(10-Length:C16(ACC_at_BatchItemlayerCode{$_l_Index}))+ACC_at_BatchItemlayerCode{$_l_Index}
					//IO
					$_t_CompanyCode:=" "*(21-Length:C16(ACC_at_BatchItemCoCode{$_l_Index}))+ACC_at_BatchItemCoCode{$_l_Index}
					$_t_ChequeReferenceCode:=" "*(21-Length:C16(ACC_at_BatchItemChequeNo{$_l_Index}))+ACC_at_BatchItemChequeNo{$_l_Index}
					
					$_t_InvoiceNumber:=" "*(21-Length:C16(ACC_at_BatchItemInvoiceNo{$_l_Index}))+ACC_at_BatchItemInvoiceNo{$_l_Index}
					$_t_JobCode:=" "*(21-Length:C16(ACC_at_BatchItemJobCode{$_l_Index}))+ACC_at_BatchItemJobCode{$_l_Index}
					$_t_PeriodCode:=" "*(15-Length:C16(ACC_at_BatchItemPeriodCode{$_l_Index}))+ACC_at_BatchItemPeriodCode{$_l_Index}
					$_t_PurchaseInvoiceCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchinvno{$_l_Index}))+ACC_at_BatchItemPurchinvno{$_l_Index}
					$_t_PurchaseOrderCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchCode{$_l_Index}))+ACC_at_BatchItemPurchCode{$_l_Index}
					$_t_TransDateString:=String:C10(ACC_ad_BatchItemTransDate{$_l_Index})
					$_t_TransDateString:=" "*(13-Length:C16($_t_TransDateString))+$_t_TransDateString
					$_t_IO:=ACC_at_BatchItemDebitIO{$_l_Index}
					$_t_ConstructedIdent:=$_t_TransactionType+$_t_DC+$_t_AccountCode+$_t_CurrencyCode+$_t_AnalysisCode+$_t_LayerCode+$_t_IO+$_t_CompanyCode+$_t_ChequeReferenceCode+$_t_InvoiceNumber+$_t_JobCode+$_t_PeriodCode+$_t_PurchaseInvoiceCode+$_t_PurchaseOrderCode+$_t_TransDateString
					$_l_IdentRow:=Find in array:C230(ACC_at_BatchItemConstructIdent; $_t_ConstructedIdent)
					If ($_l_IdentRow<0) | (ACC_bo_ConsilidatedView=False:C215)
						//first item of this identidy
						$_l_Element:=$_l_Element+1
						If ($_l_Element>Size of array:C274(ACC_at_BatchItemConstructIdent))
							INSERT IN ARRAY:C227(ACC_at_BatchItemConstructIdent; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemDebitAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransCAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransRealAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemAnalysisCode2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_BatchItemChequeNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCoCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCurrencyCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemAcc2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemIO2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_TransDescription2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemInvoiceNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemJobCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemLayerCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPeriodCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchInvNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemSecondAmt2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemTransCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ad_aTransDate2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_CURRENCYNAME2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_AccountNames2; $_l_Element; 10)  //²
							
							INSERT IN ARRAY:C227(ACC_at_CompanyNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_AnalysisNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_LayerNames2; $_l_Element; 10)  //)²
							INSERT IN ARRAY:C227(ACC_at_BatchItemType; $_l_Element; 10)
							$_l_IdentRow:=$_l_Element
						End if 
						$_l_IdentRow:=$_l_Element
					End if 
					ACC_at_BatchItemConstructIdent{$_l_IdentRow}:=$_t_ConstructedIdent
					ACC_at_BatchItemType{$_l_IdentRow}:="Debit"
					ACC_ar_BatchItemDebitAmount2{$_l_IdentRow}:=ACC_ar_BatchItemDebitAmount2{$_l_IdentRow}+$_r_DebitShow
					ACC_ar_TransCAmount2{$_l_IdentRow}:=0
					ACC_ar_TransRealAmount2{$_l_IdentRow}:=ACC_ar_TransRealAmount2{$_l_IdentRow}+$_r_DebitAmount
					
					ACC_at_BatchItemAnalysisCode2{$_l_IdentRow}:=ACC_at_BatchItemAnalysisCode{$_l_Index}
					ACC_at_BatchItemChequeNo2{$_l_IdentRow}:=ACC_at_BatchItemChequeNo{$_l_Index}
					ACC_at_BatchItemCoCode2{$_l_IdentRow}:=ACC_at_BatchItemCoCode{$_l_Index}
					ACC_at_BatchItemCurrencyCode2{$_l_IdentRow}:=ACC_at_BatchItemCurrencyCode{$_l_Index}
					ACC_at_BatchItemAcc2{$_l_IdentRow}:=ACC_at_BatchItemDebitAcc{$_l_Index}
					ACC_at_BatchItemIO2{$_l_IdentRow}:=ACC_at_BatchItemDebitIO{$_l_Index}
					ACC_at_TransDescription2{$_l_IdentRow}:=ACC_at_BatchItemDescription{$_l_Index}
					ACC_at_BatchItemInvoiceNo2{$_l_IdentRow}:=ACC_at_BatchItemInvoiceNo{$_l_Index}
					ACC_at_BatchItemJobCode2{$_l_IdentRow}:=ACC_at_BatchItemJobCode{$_l_Index}
					ACC_at_BatchItemLayerCode2{$_l_IdentRow}:=ACC_at_BatchItemlayerCode{$_l_Index}
					ACC_at_BatchItemPeriodCode2{$_l_IdentRow}:=ACC_at_BatchItemPeriodCode{$_l_Index}
					ACC_at_BatchItemPurchInvNo2{$_l_IdentRow}:=ACC_at_BatchItemPurchinvno{$_l_Index}
					ACC_at_BatchItemPurchCode2{$_l_IdentRow}:=ACC_at_BatchItemPurchCode{$_l_Index}
					ACC_ar_BatchItemSecondAmt2{$_l_IdentRow}:=ACC_ar_BatchItemSecondAmt2{$_l_IdentRow}+ACC_ar_BatchItemSecondAmt{$_l_Index}
					ACC_at_BatchItemTransCode2{$_l_IdentRow}:=ACC_at_BatchItemTransTypeCode{$_l_Index}
					ACC_ad_aTransDate2{$_l_IdentRow}:=ACC_ad_BatchItemTransDate{$_l_Index}
					ACC_at_AccountNames2{$_l_IdentRow}:=ACC_at_DebitAccountNames{$_l_Index}
					ACC_at_CURRENCYNAME2{$_l_IdentRow}:=ACC_at_CURRENCYNAME{$_l_Index}
					ACC_at_CompanyNames2{$_l_IdentRow}:=ACC_at_CompanyNames{$_l_Index}
					ACC_at_AnalysisNames2{$_l_IdentRow}:=ACC_at_AnalysisNames{$_l_Index}
					ACC_at_LayerNames2{$_l_IdentRow}:=ACC_at_LayerNames{$_l_Index}
					INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion{$_l_IdentRow}; Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})+1; 1)
					ACC_al_BatchitemCompanion{$_l_IdentRow}{Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})}:=$_l_Index
				End if 
				If (ACC_at_BatchItemCreditAcc{$_l_Index}#"")
					//Build identifier
					//Trans_Type
					$_t_TransactionType:=" "*(10-Length:C16(ACC_at_BatchItemTransTypeCode{$_l_Index}))+ACC_at_BatchItemTransTypeCode{$_l_Index}
					//Credit
					$_t_DC:="C"
					//Account code
					$_t_AccountCode:=" "*(10-Length:C16(ACC_at_BatchItemCreditAcc{$_l_Index}))+ACC_at_BatchItemCreditAcc{$_l_Index}
					//Currency Code
					$_t_CurrencyCode:=" "*(10-Length:C16(ACC_at_BatchItemCurrencyCode{$_l_Index}))+ACC_at_BatchItemCurrencyCode{$_l_Index}
					//Analysis code
					$_t_AnalysisCode:=" "*(10-Length:C16(ACC_at_BatchItemAnalysisCode{$_l_Index}))+ACC_at_BatchItemAnalysisCode{$_l_Index}
					//Layer code
					$_t_LayerCode:=" "*(10-Length:C16(ACC_at_BatchItemlayerCode{$_l_Index}))+ACC_at_BatchItemlayerCode{$_l_Index}
					//IO
					$_t_CompanyCode:=" "*(21-Length:C16(ACC_at_BatchItemCoCode{$_l_Index}))+ACC_at_BatchItemCoCode{$_l_Index}
					$_t_ChequeReferenceCode:=" "*(21-Length:C16(ACC_at_BatchItemChequeNo{$_l_Index}))+ACC_at_BatchItemChequeNo{$_l_Index}
					
					$_t_InvoiceNumber:=" "*(21-Length:C16(ACC_at_BatchItemInvoiceNo{$_l_Index}))+ACC_at_BatchItemInvoiceNo{$_l_Index}
					$_t_JobCode:=" "*(21-Length:C16(ACC_at_BatchItemJobCode{$_l_Index}))+ACC_at_BatchItemJobCode{$_l_Index}
					$_t_PeriodCode:=" "*(15-Length:C16(ACC_at_BatchItemPeriodCode{$_l_Index}))+ACC_at_BatchItemPeriodCode{$_l_Index}
					$_t_PurchaseInvoiceCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchinvno{$_l_Index}))+ACC_at_BatchItemPurchinvno{$_l_Index}
					$_t_PurchaseOrderCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchCode{$_l_Index}))+ACC_at_BatchItemPurchCode{$_l_Index}
					$_t_TransDateString:=String:C10(ACC_ad_BatchItemTransDate{$_l_Index})
					$_t_TransDateString:=" "*(13-Length:C16($_t_TransDateString))+$_t_TransDateString
					$_t_IO:=ACC_at_BatchItemCreditIO{$_l_Index}
					$_t_ConstructedIdent:=$_t_TransactionType+$_t_DC+$_t_AccountCode+$_t_CurrencyCode+$_t_AnalysisCode+$_t_LayerCode+$_t_IO+$_t_CompanyCode+$_t_ChequeReferenceCode+$_t_InvoiceNumber+$_t_JobCode+$_t_PeriodCode+$_t_PurchaseInvoiceCode+$_t_PurchaseOrderCode+$_t_TransDateString
					$_l_IdentRow:=Find in array:C230(ACC_at_BatchItemConstructIdent; $_t_ConstructedIdent)
					If ($_l_IdentRow<0) | (ACC_bo_ConsilidatedView=False:C215)
						//first item of this identidy
						$_l_Element:=$_l_Element+1
						If ($_l_Element>Size of array:C274(ACC_at_BatchItemConstructIdent))
							INSERT IN ARRAY:C227(ACC_at_BatchItemConstructIdent; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemDebitAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransCAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransRealAmount2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_BatchItemAnalysisCode2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_BatchItemChequeNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCoCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCurrencyCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemAcc2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemIO2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_TransDescription2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemInvoiceNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemJobCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemLayerCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPeriodCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchInvNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemSecondAmt2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemTransCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ad_aTransDate2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_CURRENCYNAME2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_AccountNames2; $_l_Element; 10)  //²
							
							INSERT IN ARRAY:C227(ACC_at_CompanyNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_AnalysisNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_LayerNames2; $_l_Element; 10)  //)²
							INSERT IN ARRAY:C227(ACC_at_BatchItemType; $_l_Element; 10)
							
							$_l_IdentRow:=$_l_Element
						End if 
						$_l_IdentRow:=$_l_Element
					End if 
					ACC_at_BatchItemConstructIdent{$_l_IdentRow}:=$_t_ConstructedIdent
					ACC_at_BatchItemType{$_l_IdentRow}:="Credit"
					ACC_ar_BatchItemDebitAmount2{$_l_IdentRow}:=0
					ACC_ar_TransCAmount2{$_l_IdentRow}:=ACC_ar_TransCAmount2{$_l_IdentRow}+$_r_CreditShow
					ACC_ar_TransRealAmount2{$_l_IdentRow}:=ACC_ar_TransRealAmount2{$_l_IdentRow}+$_r_Credit
					
					ACC_at_BatchItemAnalysisCode2{$_l_IdentRow}:=ACC_at_BatchItemAnalysisCode{$_l_Index}
					ACC_at_BatchItemChequeNo2{$_l_IdentRow}:=ACC_at_BatchItemChequeNo{$_l_Index}
					ACC_at_BatchItemCoCode2{$_l_IdentRow}:=ACC_at_BatchItemCoCode{$_l_Index}
					ACC_at_BatchItemCurrencyCode2{$_l_IdentRow}:=ACC_at_BatchItemCurrencyCode{$_l_Index}
					ACC_at_BatchItemAcc2{$_l_IdentRow}:=ACC_at_BatchItemCreditAcc{$_l_Index}
					ACC_at_BatchItemIO2{$_l_IdentRow}:=ACC_at_BatchItemCreditIO{$_l_Index}
					ACC_at_TransDescription2{$_l_IdentRow}:=ACC_at_BatchItemDescription{$_l_Index}
					
					ACC_at_BatchItemInvoiceNo2{$_l_IdentRow}:=ACC_at_BatchItemInvoiceNo{$_l_Index}
					ACC_at_BatchItemJobCode2{$_l_IdentRow}:=ACC_at_BatchItemJobCode{$_l_Index}
					ACC_at_BatchItemLayerCode2{$_l_IdentRow}:=ACC_at_BatchItemlayerCode{$_l_Index}
					ACC_at_BatchItemPeriodCode2{$_l_IdentRow}:=ACC_at_BatchItemPeriodCode{$_l_Index}
					ACC_at_BatchItemPurchInvNo2{$_l_IdentRow}:=ACC_at_BatchItemPurchinvno{$_l_Index}
					ACC_at_BatchItemPurchCode2{$_l_IdentRow}:=ACC_at_BatchItemPurchCode{$_l_Index}
					ACC_ar_BatchItemSecondAmt2{$_l_IdentRow}:=ACC_ar_BatchItemSecondAmt2{$_l_IdentRow}+ACC_ar_BatchItemSecondAmt{$_l_Index}
					ACC_at_BatchItemTransCode2{$_l_IdentRow}:=ACC_at_BatchItemTransTypeCode{$_l_Index}
					ACC_ad_aTransDate2{$_l_IdentRow}:=ACC_ad_BatchItemTransDate{$_l_Index}
					ACC_at_AccountNames2{$_l_IdentRow}:=ACC_at_CreditAccountNames{$_l_Index}
					ACC_at_CURRENCYNAME2{$_l_IdentRow}:=ACC_at_CURRENCYNAME{$_l_Index}
					ACC_at_CompanyNames2{$_l_IdentRow}:=ACC_at_CompanyNames{$_l_Index}
					ACC_at_AnalysisNames2{$_l_IdentRow}:=ACC_at_AnalysisNames{$_l_Index}
					ACC_at_LayerNames2{$_l_IdentRow}:=ACC_at_LayerNames{$_l_Index}
					INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion{$_l_IdentRow}; Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})+1; 1)
					ACC_al_BatchitemCompanion{$_l_IdentRow}{Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})}:=$_l_Index
				End if 
				If (ACC_ar_BatchItemTaxAmt{$_l_Index}#0)
					$_t_TransactionType:=" "*(10-Length:C16(ACC_at_BatchItemTransTypeCode{$_l_Index}))+ACC_at_BatchItemTransTypeCode{$_l_Index}
					//Credit
					$_t_DC:="T"
					//Account code
					$_t_AccountCode:=" "*(10-Length:C16(ACC_at_BatchItemCreditAcc{$_l_Index}))+ACC_at_BatchItemCreditAcc{$_l_Index}
					//Currency Code
					$_t_CurrencyCode:=" "*(10-Length:C16(ACC_at_BatchItemCurrencyCode{$_l_Index}))+ACC_at_BatchItemCurrencyCode{$_l_Index}
					//Analysis code
					$_t_AnalysisCode:=" "*(10-Length:C16(ACC_at_BatchItemAnalysisCode{$_l_Index}))+ACC_at_BatchItemAnalysisCode{$_l_Index}
					//Layer code
					$_t_LayerCode:=" "*(10-Length:C16(ACC_at_BatchItemlayerCode{$_l_Index}))+ACC_at_BatchItemlayerCode{$_l_Index}
					//IO
					$_t_CompanyCode:=" "*(21-Length:C16(ACC_at_BatchItemCoCode{$_l_Index}))+ACC_at_BatchItemCoCode{$_l_Index}
					$_t_ChequeReferenceCode:=" "*(21-Length:C16(ACC_at_BatchItemChequeNo{$_l_Index}))+ACC_at_BatchItemChequeNo{$_l_Index}
					$_t_InvoiceNumber:=" "*(21-Length:C16(ACC_at_BatchItemInvoiceNo{$_l_Index}))+ACC_at_BatchItemInvoiceNo{$_l_Index}
					$_t_JobCode:=" "*(21-Length:C16(ACC_at_BatchItemJobCode{$_l_Index}))+ACC_at_BatchItemJobCode{$_l_Index}
					$_t_PeriodCode:=" "*(15-Length:C16(ACC_at_BatchItemPeriodCode{$_l_Index}))+ACC_at_BatchItemPeriodCode{$_l_Index}
					$_t_PurchaseInvoiceCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchinvno{$_l_Index}))+ACC_at_BatchItemPurchinvno{$_l_Index}
					$_t_PurchaseOrderCode:=" "*(21-Length:C16(ACC_at_BatchItemPurchCode{$_l_Index}))+ACC_at_BatchItemPurchCode{$_l_Index}
					$_t_TransDateString:=String:C10(ACC_ad_BatchItemTransDate{$_l_Index})
					$_t_TransDateString:=" "*(13-Length:C16($_t_TransDateString))+$_t_TransDateString
					$_t_IO:=ACC_at_BatchItemCreditIO{$_l_Index}
					$_t_ConstructedIdent:=$_t_TransactionType+$_t_DC+$_t_CurrencyCode+$_t_AnalysisCode+$_t_LayerCode+$_t_IO+$_t_CompanyCode+$_t_ChequeReferenceCode+$_t_InvoiceNumber+$_t_JobCode+$_t_PeriodCode+$_t_PurchaseInvoiceCode+$_t_PurchaseOrderCode+$_t_TransDateString
					
					$_t_TaxCode:=" "*(10-Length:C16(ACC_at_BatchItemTaxCode{$_l_Index}))+ACC_at_BatchItemTaxCode{$_l_Index}
					$_t_TaxCountry:=" "*(10-Length:C16(ACC_at_BatchItemTaxUKEC{$_l_Index}))+ACC_at_BatchItemTaxUKEC{$_l_Index}
					$_t_ConstructedIdent:=$_t_ConstructedIdent+$_t_TaxCode+$_t_TaxCountry
					$_l_IdentRow:=Find in array:C230(ACC_at_BatchItemConstructIdent; $_t_ConstructedIdent)
					If ($_l_IdentRow<0) | (ACC_bo_ConsilidatedView=False:C215)
						//first item of this identidy
						$_l_Element:=$_l_Element+1
						If ($_l_Element>Size of array:C274(ACC_at_BatchItemConstructIdent))
							INSERT IN ARRAY:C227(ACC_at_BatchItemConstructIdent; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemDebitAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransCAmount2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_TransRealAmount2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_BatchItemAnalysisCode2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_BatchItemChequeNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCoCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemCurrencyCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemAcc2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemIO2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_TransDescription2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemEventCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemInvoiceNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemJobCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemLayerCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPeriodCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchInvNo2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemPurchCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ar_BatchItemSecondAmt2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_BatchItemTransCode2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_ad_aTransDate2; $_l_Element; 10)
							
							INSERT IN ARRAY:C227(ACC_at_CURRENCYNAME2; $_l_Element; 10)
							INSERT IN ARRAY:C227(ACC_at_AccountNames2; $_l_Element; 10)  //²
							
							INSERT IN ARRAY:C227(ACC_at_CompanyNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_AnalysisNames2; $_l_Element; 10)  //²
							INSERT IN ARRAY:C227(ACC_at_LayerNames2; $_l_Element; 10)  //)²
							INSERT IN ARRAY:C227(ACC_at_BatchItemType; $_l_Element; 10)
							$_l_IdentRow:=$_l_Element
						End if 
						$_l_IdentRow:=$_l_Element
					End if 
					ACC_at_BatchItemConstructIdent{$_l_IdentRow}:=$_t_ConstructedIdent
					ACC_at_BatchItemType{$_l_IdentRow}:="TAX"
					ACC_ar_BatchItemDebitAmount2{$_l_IdentRow}:=ACC_ar_BatchItemDebitAmount2{$_l_IdentRow}+$_r_DebitVatShow
					ACC_ar_TransCAmount2{$_l_IdentRow}:=ACC_ar_TransCAmount2{$_l_IdentRow}+$_r_CreditVATShow
					ACC_ar_TransRealAmount2{$_l_IdentRow}:=ACC_ar_TransRealAmount2{$_l_IdentRow}+$_r_DebitVat+$_r_CreditVAT
					
					ACC_at_BatchItemAnalysisCode2{$_l_IdentRow}:=ACC_at_BatchItemAnalysisCode{$_l_Index}
					ACC_at_BatchItemChequeNo2{$_l_IdentRow}:=ACC_at_BatchItemChequeNo{$_l_Index}
					ACC_at_BatchItemCoCode2{$_l_IdentRow}:=ACC_at_BatchItemCoCode{$_l_Index}
					ACC_at_BatchItemCurrencyCode2{$_l_IdentRow}:=ACC_at_BatchItemCurrencyCode{$_l_Index}
					
					ACC_at_BatchItemAcc2{$_l_IdentRow}:=Uppercase:C13(Term_VATWT("VAT"))
					ACC_at_BatchItemIO2{$_l_IdentRow}:=""
					ACC_at_TransDescription2{$_l_IdentRow}:=""
					
					ACC_at_BatchItemInvoiceNo2{$_l_IdentRow}:=ACC_at_BatchItemInvoiceNo{$_l_Index}
					ACC_at_BatchItemJobCode2{$_l_IdentRow}:=ACC_at_BatchItemJobCode{$_l_Index}
					ACC_at_BatchItemLayerCode2{$_l_IdentRow}:=ACC_at_BatchItemlayerCode{$_l_Index}
					ACC_at_BatchItemPeriodCode2{$_l_IdentRow}:=ACC_at_BatchItemPeriodCode{$_l_Index}
					ACC_at_BatchItemPurchInvNo2{$_l_IdentRow}:=ACC_at_BatchItemPurchinvno{$_l_Index}
					ACC_at_BatchItemPurchCode2{$_l_IdentRow}:=ACC_at_BatchItemPurchCode{$_l_Index}
					ACC_ar_BatchItemSecondAmt2{$_l_IdentRow}:=0
					ACC_at_BatchItemTransCode2{$_l_IdentRow}:=ACC_at_BatchItemTransTypeCode{$_l_Index}
					ACC_ad_aTransDate2{$_l_IdentRow}:=ACC_ad_BatchItemTransDate{$_l_Index}
					ACC_at_AccountNames2{$_l_IdentRow}:=ACC_at_BatchItemTaxCode{$_l_Index}+" "+ACC_at_BatchItemTaxUKEC{$_l_Index}
					ACC_at_CURRENCYNAME2{$_l_IdentRow}:=ACC_at_CURRENCYNAME{$_l_Index}
					ACC_at_CompanyNames2{$_l_IdentRow}:=ACC_at_CompanyNames{$_l_Index}
					ACC_at_AnalysisNames2{$_l_IdentRow}:=ACC_at_AnalysisNames{$_l_Index}
					ACC_at_LayerNames2{$_l_IdentRow}:=ACC_at_LayerNames{$_l_Index}
					INSERT IN ARRAY:C227(ACC_al_BatchitemCompanion{$_l_IdentRow}; Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})+1; 1)
					ACC_al_BatchitemCompanion{$_l_IdentRow}{Size of array:C274(ACC_al_BatchitemCompanion{$_l_IdentRow})}:=$_l_Index
					
					
				End if 
			End if 
			
		End for 
		ARRAY REAL:C219(ACC_ar_BatchItemDebitAmount2; $_l_Element)
		ARRAY REAL:C219(ACC_ar_TransCAmount2; $_l_Element)
		ARRAY REAL:C219(ACC_ar_TransRealAmount2; $_l_Element)
		
		ARRAY TEXT:C222(ACC_at_BatchItemAnalysisCode2; $_l_Element)
		
		ARRAY TEXT:C222(ACC_at_BatchItemChequeNo2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemCoCode2; $_l_Element)
		
		ARRAY TEXT:C222(ACC_at_BatchItemCurrencyCode2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemAcc2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemIO2; $_l_Element)
		
		ARRAY TEXT:C222(ACC_at_TransDescription2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemEventCode2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemInvoiceNo2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemJobCode2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemLayerCode2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemPeriodCode2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemPurchInvNo2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemPurchCode2; $_l_Element)
		ARRAY REAL:C219(ACC_ar_BatchItemSecondAmt2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_BatchItemTransCode2; $_l_Element)
		ARRAY DATE:C224(ACC_ad_aTransDate2; $_l_Element)
		
		
		ARRAY TEXT:C222(ACC_at_CURRENCYNAME2; $_l_Element)
		ARRAY TEXT:C222(ACC_at_AccountNames2; $_l_Element)  //²
		
		ARRAY TEXT:C222(ACC_at_CompanyNames2; $_l_Element)  //²
		ARRAY TEXT:C222(ACC_at_AnalysisNames2; $_l_Element)  //²
		ARRAY TEXT:C222(ACC_at_LayerNames2; $_l_Element)  //)²
		
		ARRAY TEXT:C222(ACC_at_BatchItemConstructIdent; $_l_Element)
		
		ARRAY TEXT:C222(ACC_at_BatchItemType; $_l_Element)
		$_t_OldMethodName2:=ERR_MethodTracker("Acc_transSetDisplay"+"2")
		LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; 1; ->ACC_at_BatchItemTransCode2; ->ACC_at_TransDescription2; ->ACC_at_BatchItemAcc2; ->ACC_at_AccountNames2; ->ACC_at_BatchItemIO2)
		LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; 1; "Trans"; "Desc"; "Account"; "Name"; "IO")
		LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; 1; 60; 150; 50; 150; 15)  // dont need to worry about the invisible ones
		LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; 6; ->ACC_ad_aTransDate2; ->ACC_at_BatchItemPeriodCode2; ->ACC_at_BatchItemType; ->ACC_ar_BatchItemDebitAmount2; ->ACC_ar_TransCAmount2)
		LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; 6; "Date"; "Period"; "Type"; " Debit Amount"; " Credit Amount")
		LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; 6; 45; 47; 50; 150; 150)  // dont need to worry about the invisible ones
		$_l_ColumnOffset:=11
		$_t_OldMethodName2:=ERR_MethodTracker("ACC_TransSetDisplay"+"2")
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
			
			ACC_l_ColumnCurrencyCode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnCurrencyCode; ->ACC_at_BatchItemCurrencyCode2; ->ACC_at_CURRENCYNAME2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnCurrencyCode;2;"Currency Code";"Name")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnCurrencyCode; "Currency Code"; "Name")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnCurrencyCode;2;30;60)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnCurrencyCode; 30; 60)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+2
		Else 
			ACC_l_ColumnCurrencyCode:=-1
		End if 
		$_t_OldMethodName2:=ERR_MethodTracker("ACC_TransSetDisplay"+"3")
		ACC_l_ColumnAnalysis:=$_l_ColumnOffset
		LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnAnalysis; ->ACC_at_BatchItemAnalysisCode2; ->ACC_at_AnalysisNames2)
		//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnAnalysis;2;"Anal";"Name")
		LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnAnalysis; "Anal"; "Name")
		//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnAnalysis;2;25;80)
		LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnAnalysis; 25; 80)  // dont need to worry about the invisible ones
		$_l_ColumnOffset:=$_l_ColumnOffset+2
		$_t_OldMethodName2:=ERR_MethodTracker("ACC_TransSetDisplay"+"4")
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
			//Multi Layer
			ACC_l_ColumnLayerCode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnLayerCode; ->ACC_at_BatchItemLayerCode2; ->ACC_at_LayerNames2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnLayerCode;2;"Layer";"Name")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnLayerCode; "Layer"; "Name")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnLayerCode;2;29;80)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnLayerCode; 29; 80)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+2
		Else 
			ACC_l_ColumnLayerCode:=-1
			
		End if 
		$_bo_ShowCompany:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowCompany:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemCoCode))
				If (ACC_at_BatchItemCoCode{$_l_Index}#"")
					$_bo_ShowCompany:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		If ($_bo_ShowCompany)
			ACC_l_ColumnCompanyCode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnCompanyCode; ->ACC_at_BatchItemCoCode2; ->ACC_at_CompanyNames2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnCompanyCode;2;"Company";"Name")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnCompanyCode; "Company"; "Name")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnCompanyCode;2;50;128)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnCompanyCode; 50; 128)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+2
		Else 
			ACC_l_ColumnCompanyCode:=-1
		End if 
		$_t_OldMethodName2:=ERR_MethodTracker("ACC_TransSetDisplay"+"5")
		$_bo_ShowInvoice:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowInvoice:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemInvoiceNo))
				If (ACC_at_BatchItemInvoiceNo{$_l_Index}#"")
					$_bo_ShowInvoice:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2) & ($_bo_ShowInvoice)  //Sales ledger
			AL_l_ColumnSInvNumber:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; $_l_ColumnOffset; ->ACC_at_BatchItemInvoiceNo2)
			//AL_SetHeaders (ACC_l_SubItems;$_l_ColumnOffset;1;"Sales Inv")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; $_l_ColumnOffset; "Sales Inv")
			//AL_SetWidths (ACC_l_SubItems;$_l_ColumnOffset;1;40)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; $_l_ColumnOffset; 40)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+1
		Else 
			AL_l_ColumnSInvNumber:=-1
		End if 
		$_bo_ShowJob:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowJob:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemInvoiceNo))
				If (ACC_at_BatchItemJobCode{$_l_Index}#"")
					$_bo_ShowJob:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		If (((DB_GetModuleSettingByNUM(Module_JobCosting))>=2) & ($_bo_ShowJob))
			
			
			
			
			ACC_l_ColumnJobCode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnJobCode; ->ACC_at_BatchItemJobCode2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnJobCode;1;"Job Code")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnJobCode; "Job Code")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnJobCode;1;40)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnJobCode; 40)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+1
		Else 
			ACC_l_ColumnJobCode:=-1
		End if 
		$_bo_ShowEvent:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			
			
		End if 
		
		$_bo_ShowPI:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowPI:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemInvoiceNo))
				If (ACC_at_BatchItemPurchinvno{$_l_Index}#"")
					$_bo_ShowPI:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2) & ($_bo_ShowPI)  // Purchase invoice
			
			ACC_l_ColumnPICode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnPICode; ->ACC_at_BatchItemPurchInvNo2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnPICode;1;"Purchse Inv")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnPICode; "Purchse Inv")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnPICode;1;40)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnPICode; 40)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+1
		Else 
			ACC_l_ColumnPICode:=-1
		End if 
		$_bo_ShowPO:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowPO:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemInvoiceNo))
				If (ACC_at_BatchItemPurchCode{$_l_Index}#"")
					$_bo_ShowPO:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>=2) & ($_bo_ShowPO)  // Purchase orders
			// Purchase invoice
			ACC_l_ColumnPoCode:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnPoCode; ->ACC_at_BatchItemPurchCode2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnPoCode;1;"Purch_Code")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnPoCode; "Purch_Code")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnPoCode;1;40)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnPoCode; 40)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+1
		Else 
			ACC_l_ColumnPoCode:=-1
		End if 
		$_bo_ShowCheque:=True:C214
		If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
			$_bo_ShowCheque:=False:C215  //No point showing empty column
			For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemInvoiceNo))
				If (ACC_at_BatchItemChequeNo{$_l_Index}#"")
					$_bo_ShowCheque:=True:C214
					$_l_Index:=99999
				End if 
				
			End for 
			
		End if 
		If ($_bo_ShowCheque)
			ACC_l_ColumnCheque:=$_l_ColumnOffset
			LB_SetupListbox(->ACC_LB_SubItems; "oTRANS"; "TRANS_L"; ACC_l_ColumnCheque; ->ACC_at_BatchItemChequeNo2)
			//AL_SetHeaders (ACC_l_SubItems;ACC_l_ColumnCheque;1;"Cheque")
			LB_SetColumnHeaders(->ACC_LB_SubItems; "TRANS_L"; ACC_l_ColumnCheque; "Cheque")
			//AL_SetWidths (ACC_l_SubItems;ACC_l_ColumnCheque;160)
			LB_SetColumnWidths(->ACC_LB_SubItems; "oTRANS"; ACC_l_ColumnCheque; 160)  // dont need to worry about the invisible ones
			$_l_ColumnOffset:=$_l_ColumnOffset+1
		Else 
			
			ACC_l_ColumnCheque:=-1  //```
			
		End if 
		
		//```
		
		
		//AL_SetSortOpts (ACC_l_SubItems;0;2;0;"";0;1)
		//`AL_SetScroll (ACC_l_SubItems;-2;-2)
		LB_SetScroll(->ACC_LB_SubItems; -2; -2)
		//AL_SetEntryOpts (ACC_l_SubItems;2;2;0;1;2;".";1)
		//AL_SetEntryOpts (ACC_l_SubItems;1;0;0;0;0)
		READ ONLY:C145([TRANSACTION_TYPES:31])
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]No_NL_Postings:23=False:C215)
		If (MOD_l_CurrentModuleAccess#2)
			QUERY SELECTION:C341([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Full_Access:15=False:C215)
		End if 
		
		ARRAY TEXT:C222(ACC_at_BatchTransTypesCode; 0)
		ARRAY TEXT:C222(ACC_at_BatchTransTypesname; 0)
		ARRAY TEXT:C222(ACC_at_DC; 0)
		ARRAY TEXT:C222(ACC_at_DebitAcc; 0)
		ARRAY TEXT:C222(ACC_at_CreditAcc; 0)
		ARRAY TEXT:C222(ACC_at_TAnalysisCode; 0)
		SELECTION TO ARRAY:C260([TRANSACTION_TYPES:31]Transaction_Type_Code:1; ACC_at_BatchTransTypesCode; [TRANSACTION_TYPES:31]Transaction_Type_Name:2; ACC_at_BatchTransTypesname; [TRANSACTION_TYPES:31]DC:3; ACC_at_DC; [TRANSACTION_TYPES:31]Debit_Account:4; ACC_at_DebitAcc; [TRANSACTION_TYPES:31]Credit_Account:5; ACC_at_CreditAcc; [TRANSACTION_TYPES:31]Analysis_Code:7; ACC_at_TAnalysisCode)
		SELECTION TO ARRAY:C260([TRANSACTION_TYPES:31]Tax_Code:6; ACC_at_TTaxCode; [TRANSACTION_TYPES:31]Layer_Code:16; ACC_at_TLayerCode; [TRANSACTION_TYPES:31]Currency_Code:17; ACC_at_TCurrencyCode)
		SORT ARRAY:C229(ACC_at_BatchTransTypesname; ACC_at_BatchTransTypesCode; ACC_at_DC; ACC_at_DebitAcc; ACC_at_CreditAcc; ACC_at_TAnalysisCode)
		LB_SetEnterable(->ACC_LB_SubItems; False:C215; 0; "")
		
		If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!) & (False:C215)  // this section if you wanted on screen editing
			
			If (ACC_l_ColumnCurrencyCode>0)
			End if 
			If (ACC_l_ColumnCompanyCode>0)
			End if 
			
			If (AL_l_ColumnSInvNumber>0)
				
			End if 
			If (ACC_l_ColumnJobCode>0)
			End if 
			
			If (ACC_l_ColumnPICode>0)
			End if 
			If (ACC_l_ColumnPoCode>0)
			End if 
			If (ACC_l_ColumnCheque>0)
			End if 
			If (ACC_l_ColumnLayerCode>0)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(<>LB_pic_ModePicture; False:C215)
			OBJECT SET VISIBLE:C603(ACC_at_ModeTransIn; False:C215)
		End if 
		
		LB_StyleSettings(->ACC_LB_SubItems; "Black"; 9; "TRANS"; ->[ACCOUNTS:32])
		If (False:C215)
			$_l_NormalFontSize:=9
			LB_SetColours(->ACC_at_BatchItemTransCode2; Black:K11:16; 242)
			LB_SetColours(->ACC_at_TransDescription2; Black:K11:16; 242)
			LB_SetColours(->ACC_at_BatchItemAcc2; Black:K11:16; 242)
			LB_SetColours(->ACC_at_AccountNames2; Black:K11:16; 243)
			LB_SetColours(->ACC_at_BatchItemIO2; Black:K11:16; 242)
			LB_SetColours(->ACC_ad_aTransDate2; Black:K11:16; 241)
			LB_SetColours(->ACC_at_BatchItemPeriodCode2; Black:K11:16; 242)
			LB_SetColours(->ACC_at_BatchItemType; Black:K11:16; 243)
			LB_SetColours(->ACC_ar_BatchItemDebitAmount2; Black:K11:16; 242)
			LB_SetColours(->ACC_ar_TransCAmount2; Black:K11:16; 242)
			If (ACC_l_ColumnCurrencyCode>0)
				LB_SetColours(->ACC_at_BatchItemCurrencyCode2; Black:K11:16; 225)
				LB_SetColours(->ACC_at_CURRENCYNAME2; Black:K11:16; 226)
				
			End if 
			LB_SetColours(->ACC_at_BatchItemAnalysisCode2; Blue:K11:7; 243)
			
			LB_SetColours(->ACC_at_AnalysisNames2; Blue:K11:7; 242)
			
			If (ACC_l_ColumnLayerCode>0)  //LAYERS
				LB_SetColours(->ACC_at_BatchItemLayerCode2; Blue:K11:7; 243)
				LB_SetColours(->ACC_at_LayerNames2; Blue:K11:7; 242)
				
			End if 
			If (ACC_l_ColumnCompanyCode>0)
				LB_SetColours(->ACC_at_BatchItemCoCode2; Black:K11:16; 209)
				LB_SetColours(->ACC_at_CompanyNames2; Blue:K11:7; 210)
			End if 
			
			If (AL_l_ColumnSInvNumber>0)
				LB_SetColours(->ACC_at_BatchItemInvoiceNo2; Black:K11:16; 178)
			End if 
			If (ACC_l_ColumnPICode>0)
				LB_SetColours(->ACC_at_BatchItemPurchInvNo2; Black:K11:16; 146)
				
			End if 
			If (ACC_l_ColumnPoCode>0)
				LB_SetColours(->ACC_at_BatchItemPurchCode2; Black:K11:16; 146)
			End if 
			
			If (ACC_l_ColumnCheque>0)
				LB_SetColours(->ACC_at_BatchItemChequeNo2; Black:K11:16; 146)
			End if 
			If (ACC_l_ColumnJobCode>0)
				LB_SetColours(->ACC_at_BatchItemJobCode2; Black:K11:16; 178)
			End if 
		End if 
		//AL_UpdateArrays (ACC_l_SubItems;-2)
		ARRAY TEXT:C222(ACC_at_IOValues; 3)
		ACC_at_IOValues{1}:="I"
		ACC_at_IOValues{2}:="O"
		ACC_at_IOValues{3}:="N"
	End if 
End if 
//HERE CALCULATE THE BATCH DEBIT AND CREDIT TOTALS
ACC_R_BATCHDEBITTOTAL:=0

ACC_R_BATCHCREDITTOTAL:=0
For ($_l_Index; 1; Size of array:C274(ACC_ar_BatchItemDebitAmount2))
	ACC_R_BATCHDEBITTOTAL:=ACC_R_BATCHDEBITTOTAL+ACC_ar_BatchItemDebitAmount2{$_l_Index}
	ACC_R_BATCHCREDITTOTAL:=ACC_R_BATCHCREDITTOTAL+ACC_ar_TransCAmount2{$_l_Index}
	If (ACC_l_ItemEntryProcess>0)
		SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_BATCHDEBITTOTAL; ACC_R_BATCHDEBITTOTAL)
		SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_BATCHCREDITTOTAL; ACC_R_BATCHCREDITTOTAL)
		POST OUTSIDE CALL:C329(ACC_l_ItemEntryProcess)
	End if 
	
End for 
ERR_MethodTrackerReturn("ACC_TransSetDisplay"; $_t_oldMethodName)
