//%attributes = {}

If (False:C215)
	//Project Method Name:      Inv_PaySel2
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
	//C_UNKNOWN($4)
	//C_UNKNOWN(PRT_Count)
	//C_UNKNOWN(r1)
	//C_UNKNOWN(r2)
	//C_UNKNOWN(v31)
	//C_UNKNOWN(v61)
	//C_UNKNOWN(Vadd)
	//C_UNKNOWN(vAnalysis)
	//C_UNKNOWN(vBank)
	//C_UNKNOWN(vCompCode)
	//C_UNKNOWN(vCompName)
	//C_UNKNOWN(vCountry)
	//C_UNKNOWN(vDate)
	//C_UNKNOWN(vDelDate)
	//C_UNKNOWN(vDesc)
	//C_UNKNOWN(vLayer)
	//C_UNKNOWN(vMod3)
	//C_UNKNOWN(vPay2)
	//C_UNKNOWN(vPayment)
	//C_UNKNOWN(vSNo)
	//C_UNKNOWN(vTitle)
	//C_UNKNOWN(vTitle1)
	//C_UNKNOWN(vTitle2)
	//C_UNKNOWN(vTotal)
	ARRAY DATE:C224($_ad_AllocationDate; 0)
	ARRAY DATE:C224($_ad_InvoiceDate; 0)
	ARRAY LONGINT:C221($_al_ANTransactions; 0)
	ARRAY LONGINT:C221($_al_PriorAuthID; 0)
	ARRAY LONGINT:C221($_al_PriorAuthIDs; 0)
	ARRAY LONGINT:C221($_al_TestedNumbers; 0)
	//ARRAY LONGINT(INC_al_PriorAuthIDs;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY REAL:C219($_ar_AllocationAmount; 0)
	ARRAY REAL:C219($_ar_AnalysisAmount; 0)
	ARRAY REAL:C219($_ar_ANTransactionAmounts; 0)
	ARRAY REAL:C219($_ar_PriorAmounts; 0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(INC_ar_PriorAmounts;0)
	//ARRAY REAL(INV_ar_InvoiceAlocAmt;0)
	ARRAY TEXT:C222($_at_AllocationInvoice; 0)
	ARRAY TEXT:C222($_at_AnalysisCode; 0)
	ARRAY TEXT:C222($_at_AnalysisCompany; 0)
	ARRAY TEXT:C222($_at_ANTransactionInvoiceCodes; 0)
	ARRAY TEXT:C222($_at_Code; 0)
	ARRAY TEXT:C222($_at_InvoiceNumber; 0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(INV_at_InvContactCodes;0)
	//ARRAY TEXT(INV_at_InvoiceNumbers;0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; $_bo_AnalisDeposit; $_bo_Confirm; $_bo_Continue; $_bo_EndTransaction; $_bo_IsFromOrder; $_bo_IsOK; $_bo_NoCC; $_bo_OK; $_bo_ReportExists; $_bo_Selection)
	C_BOOLEAN:C305($_bo_SinSID; $_bo_Unlocked; $1; $5; $6; ACC_bo_CurrencyWriteOff; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; DB_bo_RecordModified; PAY_bo_CreateAuths; PRT_bo_AskPerIteration)
	C_BOOLEAN:C305(PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview; vMod3; WIN_bo_TrackerInited; <>PurchPayRem; <>SI_bo_AllocationValidationDisab; $_bo_AnalisDeposit; $_bo_Confirm; $_bo_Continue; $_bo_EndTransaction)
	C_BOOLEAN:C305($_bo_IsFromOrder; $_bo_IsOK; $_bo_NoCC; $_bo_OK; $_bo_ReportExists; $_bo_Selection; $_bo_SinSID; $_bo_Unlocked; $1; $5; $6)
	C_BOOLEAN:C305(ACC_bo_CurrencyWriteOff; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP; DB_bo_RecordModified; PAY_bo_CreateAuths; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_EntryDateTo; vDate; vDelDate; <>DB_d_CurrentDate; SRCH_d_EntryDateTo)
	C_LONGINT:C283($_l_AddMode; $_l_AllocationCreateIndex; $_l_AnalysisCodeRow; $_l_ArrayRow; $_l_ArraySIze; $_l_CCAuditID; $_l_CreateAuthIndex; $_l_Delay; $_l_Element; $_l_FilterIndex; $_l_Index)
	C_LONGINT:C283($_l_Insert; $_l_InvElement; $_l_InvoicePosition; $_l_invoices2Record; $_l_Invoices2Temp; $_l_InvoicesIndex; $_l_isUnique; $_l_OrdAuthID; $_l_OrderAuthID; $_l_PElement; $_l_RecordsInSelection)
	C_LONGINT:C283($_l_Repeats; $_l_TimeOut; $_l_TransPostStatus; $_l_ValuesIndex; $_l_VoidID; $_l_WindowReferenceRow; $3; CCM_l_CCAuditID; CCM_l_RejectedID; CM_l_CCauditID; DS_l_BATCHITEMRef)
	C_LONGINT:C283(INV_l_CCID; PAY_l_CARDID; PAY_l_TransactionID; PRT_Count; r1; r2; Vadd; vSNo; WIN_l_CurrentWinRef; $_l_AddMode; $_l_AllocationCreateIndex)
	C_LONGINT:C283($_l_AnalysisCodeRow; $_l_ArrayRow; $_l_ArraySIze; $_l_CCAuditID; $_l_CreateAuthIndex; $_l_Delay; $_l_Element; $_l_FilterIndex; $_l_Index; $_l_Insert; $_l_InvElement)
	C_LONGINT:C283($_l_InvoiceNumber; $_l_InvoicePosition; $_l_invoices2Record; $_l_Invoices2Temp; $_l_InvoicesIndex; $_l_isUnique; $_l_OrdAuthID; $_l_OrderAuthID; $_l_PElement; $_l_RecordsInSelection; $_l_Repeats)
	C_LONGINT:C283($_l_TimeOut; $_l_TransPostStatus; $_l_ValuesIndex; $_l_VoidID; $_l_WindowReferenceRow; $3; CCM_l_CCAuditID; CCM_l_RejectedID; CM_l_CCauditID; DS_l_BATCHITEMRef; i)
	C_LONGINT:C283(INV_l_CCID; PAY_l_CARDID; PAY_l_TransactionID; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount; $_r_AmountRow; $_r_AuthdAmount; $_r_DepositNegative; $_r_Negative; $_r_Pay2; $_r_PayAmount; $_r_SubTotal; $_r_Sum; $_r_TotalAmountPreAuthd; $_r_TotalAuthd)
	C_REAL:C285($_r_VATCSAmount; $2; v31; v61; vPay2; vPayment; vTotal; $_r_Amount; $_r_AmountRow; $_r_AuthdAmount; $_r_DepositNegative)
	C_REAL:C285($_r_Negative; $_r_Pay2; $_r_PayAmount; $_r_SubTotal; $_r_Sum; $_r_TotalAmountPreAuthd; $_r_TotalAuthd; $_r_VATCSAmount; $2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CompanyCode; $_t_ContactCode; $_t_CreditAccount; $_t_FindAnalysisCode; $_t_FirstInvoiceNumber; $_t_Invoice; $_t_InvoiceNumber; $_t_InvoiceTitle; $_t_INVPTransType)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $4; ACC_t_BadDebts; ACC_t_CurrencyCode; CC_t_AuthCode; CCM_t_ChequeNo; DB_t_CurrentFormUsage; PAY_t_AUTHCODE; PRT_t_pdfOutputFilePath; vAnalysis)
	C_TEXT:C284(vBank; vCompCode; vCompName; vCountry; vDesc; vLayer; vTitle; vTitle1; vTitle2; <>SYS_t_BaseCurrency; $_t_AnalysisCode)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_CreditAccount; $_t_FindAnalysisCode; $_t_FirstInvoiceNumber; $_t_Invoice; $_t_InvoiceNumber; $_t_InvoiceTitle; $_t_INVPTransType; $_t_oldMethodName; $_t_WindowTitle)
	C_TEXT:C284(ACC_t_BadDebts; ACC_t_CurrencyCode; CC_t_AuthCode; CCM_t_ChequeNo; DB_t_CurrentFormUsage; PAY_t_AUTHCODE; PRT_t_pdfOutputFilePath; vChequeNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv_PaySel2")

//TRACE
COPY NAMED SELECTION:C331([INVOICES:39]; "$toPost")
READ WRITE:C146([INVOICES:39])

USE NAMED SELECTION:C332("$ToPost")
FIRST RECORD:C50([INVOICES:39])
$_t_oldMethodName:=ERR_MethodTracker("Inv_PaySel2")  //Inv_PaySel2 - see also Invoices_ImpR

ARRAY LONGINT:C221($_al_ANTransactions; 0)
ARRAY REAL:C219($_ar_ANTransactionAmounts; 0)
ARRAY TEXT:C222($_at_ANTransactionInvoiceCodes; 0)



ARRAY REAL:C219($_ar_PriorAmounts; 0)
ARRAY LONGINT:C221($_al_PriorAuthID; 0)
ARRAY TEXT:C222($_at_AllocationInvoice; 0)
$_l_PElement:=0
ARRAY DATE:C224($_ad_AllocationDate; 0)
ARRAY REAL:C219(INC_ar_PriorAmounts; 0)  //This only gets setup when there are prior auths

ARRAY LONGINT:C221(INC_al_PriorAuthIDs; 0)
ARRAY REAL:C219($_ar_AllocationAmount; 0)






If (Count parameters:C259>=3)
	$_l_CCAuditID:=$3
Else 
	$_l_CCAuditID:=0
End if 
If ($_l_CCAuditID>0)
	$_t_INVPTransType:=CCM_GetCCTransType($_l_CCAuditID)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$_t_INVPTransType)
Else 
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
End if 

If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
	vBank:=[TRANSACTION_TYPES:31]Debit_Account:4
	vTotal:=Gen_Round(Sum:C1([INVOICES:39]Total_Due:7); 2; 2)
	If (vTotal<0)  //Increase it back to 0 if the negative comes from a deposit
		
		FIRST RECORD:C50([INVOICES:39])
		$_r_Negative:=0
		$_r_DepositNegative:=0
		$_l_InvoicePosition:=0
		
		While (Not:C34(End selection:C36([INVOICES:39])))
			If ([INVOICES:39]Total_Due:7<0)
				If (([INVOICES:39]Invoice_Number:1="*@") & ([INVOICES:39]Total_Invoiced:5=0))
					$_r_DepositNegative:=Round:C94(($_r_DepositNegative+[INVOICES:39]Total_Due:7); 2)
				End if 
			End if 
			NEXT RECORD:C51([INVOICES:39])
		End while 
		If ($_r_DepositNegative<vTotal)
			vTotal:=0
		End if 
		USE NAMED SELECTION:C332("$ToPost")
		FIRST RECORD:C50([INVOICES:39])
		
	End if 
	If (Count parameters:C259>=4)
		If ($4#"")
			vTitle:=$4
		Else 
			vTitle:="RECEIPT"
		End if 
	Else 
		vTitle:="RECEIPT"
	End if 
	If (Count parameters:C259>=5)
		$_bo_IsFromOrder:=$5
	Else 
		$_bo_IsFromOrder:=False:C215
	End if 
	If (Count parameters:C259>=6)
		$_bo_NoCC:=$6
	Else 
		$_bo_NoCC:=False:C215
	End if 
	// Check previous Statement printed date
	USE NAMED SELECTION:C332("$ToPost")
	FIRST RECORD:C50([INVOICES:39])
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
	CUT NAMED SELECTION:C334([INVOICES:39]; "$Sel")
	SRCH_d_EntryDateTo:=Invoices_SOADat
	USE NAMED SELECTION:C332("$Sel")
	SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Date:4; $_ad_InvoiceDate)  //Calc the last date in those selected
	
	SORT ARRAY:C229($_ad_InvoiceDate; >)
	vDelDate:=$_ad_InvoiceDate{Size of array:C274($_ad_InvoiceDate)}
	//Check none are locked
	OK:=1
	USE NAMED SELECTION:C332("$ToPost")
	FIRST RECORD:C50([INVOICES:39])
	vCompCode:=[INVOICES:39]Company_Code:2
	$_t_CompanyCode:=[INVOICES:39]Company_Code:2
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
	vCompName:=[COMPANIES:2]Company_Name:2
	If ([INVOICES:39]Analysis_Code:17#"")
		RELATE ONE:C42([INVOICES:39]Analysis_Code:17)
		If ([ANALYSES:36]Bank_Account_Code:9#"")
			vBank:=[ANALYSES:36]Bank_Account_Code:9
		End if 
	End if 
	vAnalysis:=[INVOICES:39]Analysis_Code:17
	vSNo:=1
	ARRAY TEXT:C222(INV_at_InvContactCodes; 0)
	//kmw v631b120l 12/12/08 - NOTE: I assume the following line is supposed to set array size to 0 and have changed it to that
	//...otherwise if we went in to do a second receipt we had the invoice numbers from previous receipt....
	//...doesn't look like it would have been a problem because it does resizes to correct size and then...
	//...when cycling through the invoices it resets the invoice to the correct invoice number....and then...
	//... does a final check to resize it to only be the same size as the invoice numbers that it had found with amounts due.
	//changed anyway, as better safe than sorry
	ARRAY TEXT:C222(INV_at_InvoiceNumbers; 0)
	//ARRAY STRING(20;INV_at_InvoiceNumbers;Records in selection([INVOICES]))
	ARRAY REAL:C219(INV_ar_InvoiceAlocAmt; 0)
	ARRAY TEXT:C222(INV_at_InvContactCodes; Records in selection:C76([INVOICES:39]))
	ARRAY TEXT:C222(INV_at_InvoiceNumbers; Records in selection:C76([INVOICES:39]))
	ARRAY REAL:C219(INV_ar_InvoiceAlocAmt; Records in selection:C76([INVOICES:39]))
	
	$_l_Element:=0
	$_l_InvElement:=0
	$_t_FirstInvoiceNumber:=[INVOICES:39]Invoice_Number:1
	
	While ((Not:C34(End selection:C36([INVOICES:39]))) & (OK=1))
		$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
		If (Not:C34($_bo_Unlocked))
			Invoices_InLPTi
			Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The Receipt cannot be posted."; "Wait"; "Stop")
			If (OK=0)
				$_bo_Unlocked:=False:C215
			Else 
				Repeat 
					$_l_TimeOut:=0
					Repeat 
						$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
						If (Not:C34($_bo_Unlocked))
							$_l_TimeOut:=$_l_TimeOut+1
						End if 
						DelayTicks(60)
					Until ($_bo_Unlocked=True:C214) | ($_l_TimeOut>100)
					If (Not:C34($_bo_Unlocked))
						Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is STILL locked by another user.  The Receipt cannot be posted."; "Wait"; "Stop")
					End if 
				Until ($_bo_Unlocked=True:C214) | (OK=0)
			End if 
		End if 
		If (Not:C34($_bo_Unlocked))
			//NG Change here
			Gen_Alert(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The Receipt cannot be posted."; "Cancel")
			OK:=0
		Else 
			If ([INVOICES:39]Company_Code:2#$_t_CompanyCode)
				$_t_CompanyCode:=[INVOICES:39]Company_Code:2
				vSNo:=vSNo+1
				vCompCode:=""
				vCompName:=String:C10(vSNo)+" Companies"
			End if 
			$_r_AmountRow:=Find in array:C230(INV_at_InvContactCodes; [INVOICES:39]Contact_Code:3)
			If ($_r_AmountRow<0)
				$_l_Element:=$_l_Element+1
				INV_at_InvContactCodes{$_l_Element}:=[INVOICES:39]Contact_Code:3
			End if 
			
			If (Not:C34($_bo_IsFromOrder)) & ($_l_CCAuditID=0) & (Not:C34($_bo_NoCC))
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=[INVOICES:39]Invoice_Number:1; *)
				QUERY:C277([CCM_PSPTransaction:136];  & ; [CCM_PSPTransaction:136]XTransactionStatus:15>=0)  // get set to -1 when and auth is used
				
				
				If (Records in selection:C76([CCM_PSPTransaction:136])>0)
					CREATE EMPTY SET:C140([CCM_PSPTransaction:136]; "PriorAuthorizations")
					For ($_l_Index; 1; Records in selection:C76([CCM_PSPTransaction:136]))
						If ([CCM_PSPTransaction:136]TRANSACTION_TYPE:3=CCM_GetSendString([CCM_PSPTransaction:136]PSPUSED:4; "AUTH_ONLY"))
							ADD TO SET:C119([CCM_PSPTransaction:136]; "PriorAuthorizations")
						End if 
						NEXT RECORD:C51([CCM_PSPTransaction:136])
					End for 
					USE SET:C118("PriorAuthorizations")
					SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_ID:1; $_al_PriorAuthIDs)
					ARRAY REAL:C219($_ar_PriorAmounts; Size of array:C274($_al_PriorAuthIDs))
					For ($_l_Index; 1; Size of array:C274($_al_PriorAuthIDs))
						QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_al_PriorAuthIDs{$_l_Index})
						$_ar_PriorAmounts{$_l_Index}:=CCM_GetAuthAmountFromTrans([CCM_PSPTransaction:136]x_ID:1)
						$_al_PriorAuthIDs{$_l_Index}:=-($_al_PriorAuthIDs{$_l_Index})
					End for 
					
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]Order_ID:2=[ORDERS:24]x_ID:58; *)
						QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xinvoiceCode:9=""; *)
						QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xAuthStatus:7=1)
						QUERY SELECTION:C341([CC_OrderAuths:133]; [CC_OrderAuths:133]AuthorizationDate:4>=Current date:C33(*)-30)
						SELECTION TO ARRAY:C260([CC_OrderAuths:133]AuthorizationAmount:5; $_ar_PriorAmounts; [CC_OrderAuths:133]x_ID:1; $_al_PriorAuthIDs)
					End if 
				End if 
				
			End if 
		End if 
		$_r_TotalAuthd:=0
		For ($_l_FilterIndex; 1; Size of array:C274($_ar_PriorAmounts))
			$_r_TotalAuthd:=$_r_TotalAuthd+$_ar_PriorAmounts{$_l_FilterIndex}
		End for 
		If ([INVOICES:39]Total_Due:7>0)
			If (([INVOICES:39]Total_Due:7-$_r_TotalAuthd)>0)
				$_l_InvElement:=$_l_InvElement+1
				INV_at_InvoiceNumbers{$_l_InvElement}:=[INVOICES:39]Invoice_Number:1
				INV_ar_InvoiceAlocAmt{$_l_InvElement}:=([INVOICES:39]Total_Due:7-$_r_TotalAuthd)
				
			End if 
		Else 
			//TRACE
			If (([INVOICES:39]Total_Due:7+$_r_TotalAuthd)<0)
				$_l_InvElement:=$_l_InvElement+1
				INV_at_InvoiceNumbers{$_l_InvElement}:=[INVOICES:39]Invoice_Number:1
				INV_ar_InvoiceAlocAmt{$_l_InvElement}:=([INVOICES:39]Total_Due:7+$_r_TotalAuthd)
				
			End if 
		End if 
		NEXT RECORD:C51([INVOICES:39])
		If (Size of array:C274($_ar_PriorAmounts)>0)
			$_l_ArraySIze:=Size of array:C274(INC_ar_PriorAmounts)
			$_l_Insert:=Size of array:C274($_ar_PriorAmounts)
			INSERT IN ARRAY:C227(INC_ar_PriorAmounts; $_l_ArraySIze+1; $_l_Insert)
			INSERT IN ARRAY:C227(INC_al_PriorAuthIDs; $_l_ArraySIze+1; $_l_Insert)
			For ($_l_Index; 1; Size of array:C274($_ar_PriorAmounts))
				INC_ar_PriorAmounts{$_l_ArraySIze+$_l_Index}:=$_ar_PriorAmounts{$_l_Index}
				INC_al_PriorAuthIDs{$_l_ArraySIze+$_l_Index}:=$_al_PriorAuthIDs{$_l_Index}
			End for 
		End if 
	End while 
	//the contact codes are for use if paying by credit card
	ARRAY TEXT:C222(INV_at_InvContactCodes; $_l_Element)
	ARRAY TEXT:C222(INV_at_InvoiceNumbers; $_l_InvElement)
	ARRAY REAL:C219(INV_ar_InvoiceAlocAmt; $_l_InvElement)
	
	$_r_TotalAmountPreAuthd:=0
	For ($_l_Index; 1; Size of array:C274(INC_al_PriorAuthIDs))
		$_r_TotalAmountPreAuthd:=$_r_TotalAmountPreAuthd+INC_ar_PriorAmounts{$_l_Index}
	End for 
	
	USE NAMED SELECTION:C332("$ToPost")
	FIRST RECORD:C50([INVOICES:39])
	If (OK=1)
		
		If (Count parameters:C259>=1)
			$_bo_Selection:=$1
		Else 
			$_bo_Selection:=True:C214
		End if 
		If (Count parameters:C259>=2)
			$_r_Amount:=$2
		Else 
			$_r_Amount:=0
		End if 
		If ($_r_Amount>0)
			If ($_r_DepositNegative#0)
				$_r_Amount:=0
				//because the allocation is a deposit!
			End if 
		End if 
		PAY_bo_CreateAuths:=False:C215
		//We only do that if a fresh amount is auth-payment taken in here
		//TRACE
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		Gen_PayDate("I"; $_bo_Selection; $_r_Amount; $_l_CCAuditID; $_t_FirstInvoiceNumber; $_t_CompanyCode; ->INC_al_PriorAuthIDs; $_r_TotalAmountPreAuthd; ->INV_at_InvoiceNumbers; ->INV_ar_InvoiceAlocAmt)
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//********************************************************************************************
		
		If (INV_l_CCID#0)  // this is only set when $_l_CCAuditID was passed to Gen_PayDate AND card was selected as the payment method
			
			Case of 
				: (INV_l_CCID<0)  //reference to a transaction NEVER HAPPENS
					
					//get the authorization number
					If (INV_l_CCID=-901)  // use the array created before
						
						//this is an array of either order auths or PSP transaction ID
						//mostly this would be one auth
						ARRAY LONGINT:C221($_al_ANTransactions; 0)
						ARRAY REAL:C219($_ar_ANTransactionAmounts; 0)
						ARRAY TEXT:C222($_at_ANTransactionInvoiceCodes; 0)
						For ($_l_Index; 1; Size of array:C274(INC_al_PriorAuthIDs))
							If (INC_al_PriorAuthIDs{$_l_Index}<0)
								READ ONLY:C145([CC_OrderAuths:133])
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=Abs:C99(INC_al_PriorAuthIDs{$_l_Index}))
								$_l_OrdAuthID:=[CC_OrderAuths:133]x_ID:1
								$_t_Invoice:=""
								If ([CC_OrderAuths:133]xinvoiceCode:9#"")  //Note this may NOT be known at this point
									
									$_t_Invoice:=[CC_OrderAuths:133]xinvoiceCode:9
								End if 
								CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
								If (CCM_l_CCAuditID>0)
									$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
									
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If (CC_t_AuthCode#"")
											UNLOAD RECORD:C212([CC_OrderAuths:133])
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
											$_bo_OK:=False:C215
											$_l_Repeats:=0
											$_l_Delay:=1
											Repeat 
												$_l_Repeats:=$_l_Repeats+1
												$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
												If (Not:C34($_bo_OK))
													If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
														//only increase every 10 tries
														$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
														
													End if 
													DelayTicks(2*$_l_Delay)
												End if 
											Until ($_bo_OK=True:C214)
											If ($_t_Invoice="*D@")
												[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
											Else 
												[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
											End if 
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											
											DB_SaveRecord(->[CCM_PSPTransaction:136])
											
											READ WRITE:C146([CC_OrderAuths:133])
											QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrdAuthID)
											[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
											[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
											[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
											
											DB_SaveRecord(->[CC_OrderAuths:133])
											APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
											APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
											APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
											UNLOAD RECORD:C212([CC_OrderAuths:133])
										End if 
									End if 
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
								Else 
									//````
									Case of 
										: (CCM_l_CCAuditID=-909)
											CCM_l_CCAuditID:=0
											//AVS rejection
											//record the FAILED  but the amount was authd'
											CCM_l_RejectedID:=0
											CCM_bo_DisableAVSTEMP:=True:C214
											CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
											If (CCM_l_CCAuditID>0)
												
												
												$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
												If ($_bo_IsOK)
													CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
													If (CC_t_AuthCode#"")
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
														
														$_bo_OK:=False:C215
														$_l_Repeats:=0
														$_l_Delay:=1
														Repeat 
															$_l_Repeats:=$_l_Repeats+1
															$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
															If (Not:C34($_bo_OK))
																If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
																	//only increase every 10 tries
																	$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
																	
																End if 
																DelayTicks(2*$_l_Delay)
															End if 
														Until ($_bo_OK=True:C214)
														If ($_t_Invoice="*D@")
															[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
														Else 
															[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
														End if 
														
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
														
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
														If ($_bo_IsOK)
															CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
															If (CC_t_AuthCode#"")
																READ WRITE:C146([CC_OrderAuths:133])
																QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrdAuthID)
																[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
																[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
																[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
																
																DB_SaveRecord(->[CC_OrderAuths:133])
																APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
																APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
																APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
																
																UNLOAD RECORD:C212([CC_OrderAuths:133])
															End if 
														End if 
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														
														
													End if 
												End if 
											End if 
											CCM_bo_DisableAVSTEMP:=False:C215
										: (CCM_l_CCAuditID=-907)  // reject AVS
											
											CCM_l_RejectedID:=0
											
										: (CCM_l_CCAuditID=-908)
											//CVV2 Failure
											CCM_l_CCAuditID:=0
											CCM_bo_CV2Retry:=True:C214
											//don't record this as an auth.
											
											CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
											If (CCM_l_CCAuditID>0)
												
												$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
												If ($_bo_IsOK)
													CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
													If (CC_t_AuthCode#"")
														UNLOAD RECORD:C212([CC_OrderAuths:133])
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
														$_bo_OK:=False:C215
														$_l_Repeats:=0
														$_l_Delay:=1
														Repeat 
															$_l_Repeats:=$_l_Repeats+1
															$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
															If (Not:C34($_bo_OK))
																If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
																	//only increase every 10 tries
																	$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
																	
																End if 
																DelayTicks(2*$_l_Delay)
															End if 
														Until ($_bo_OK=True:C214)
														If ($_t_Invoice="*D@")
															[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
														Else 
															[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
														End if 
														
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
														
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
														If ($_bo_IsOK)
															CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
															If (CC_t_AuthCode#"")
																READ WRITE:C146([CC_OrderAuths:133])
																QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrdAuthID)
																[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
																[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
																[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
																
																DB_SaveRecord(->[CC_OrderAuths:133])
																APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
																APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
																APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
																UNLOAD RECORD:C212([CC_OrderAuths:133])
															End if 
														End if 
														UNLOAD RECORD:C212([CCM_PSPTransaction:136])
														READ ONLY:C145([CCM_PSPTransaction:136])
														
														
													End if 
												End if 
												
												
											Else 
												Gen_Alert("You may not retry a CVV2 again")
												
											End if 
											CCM_bo_CV2Retry:=True:C214
									End case 
									
								End if 
								
							Else   // (INC_al_PriorAuthIDs{$_l_Index}>=0
								
								READ ONLY:C145([CC_OrderAuths:133])
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INC_al_PriorAuthIDs{$_l_Index})
								$_t_Invoice:=[CC_OrderAuths:133]xinvoiceCode:9  //Note this could be blank at this point-if the auth was against an order and never linked to teh invoice
								
								UNLOAD RECORD:C212([CC_OrderAuths:133])
								CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; INC_al_PriorAuthIDs{$_l_Index})
								If (CCM_l_CCauditID>0)
									$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
									If ($_bo_IsOK)
										CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If (CC_t_AuthCode#"")
											READ WRITE:C146([CCM_PSPTransaction:136])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
											$_bo_OK:=False:C215
											$_l_Repeats:=0
											$_l_Delay:=1
											Repeat 
												$_l_Repeats:=$_l_Repeats+1
												$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
												If (Not:C34($_bo_OK))
													If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
														//only increase every 10 tries
														$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
														
													End if 
													DelayTicks(2*$_l_Delay)
												End if 
											Until ($_bo_OK=True:C214)
											If ($_t_Invoice="*D@")
												[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
											Else 
												[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
											End if 
											[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
											
											DB_SaveRecord(->[CCM_PSPTransaction:136])
											READ WRITE:C146([CC_OrderAuths:133])
											QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INC_al_PriorAuthIDs{$_l_Index})
											[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
											[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
											[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
											
											DB_SaveRecord(->[CC_OrderAuths:133])
											APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
											APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
											APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
											
											UNLOAD RECORD:C212([CC_OrderAuths:133])
										End if 
									End if 
								Else 
									Case of 
										: (CCM_l_CCAuditID=-909)
											CCM_l_CCAuditID:=0
											//AVS rejection
											//record the FAILED  but the amount was authd'
											CCM_l_RejectedID:=0
											CCM_bo_DisableAVSTEMP:=True:C214
											CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; INC_al_PriorAuthIDs{$_l_Index})
											If (CCM_l_CCauditID>0)
												$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
												If ($_bo_IsOK)
													CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
													If (CC_t_AuthCode#"")
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
														$_bo_OK:=False:C215
														$_l_Repeats:=0
														$_l_Delay:=1
														Repeat 
															$_l_Repeats:=$_l_Repeats+1
															$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
															If (Not:C34($_bo_OK))
																If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
																	//only increase every 10 tries
																	$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
																	
																End if 
																DelayTicks(2*$_l_Delay)
															End if 
														Until ($_bo_OK=True:C214)
														If ($_t_Invoice="*D@")
															[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
														Else 
															[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
														End if 
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
														
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INC_al_PriorAuthIDs{$_l_Index})
														[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
														[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
														[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
														
														APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
														APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
														APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
														
														DB_SaveRecord(->[CC_OrderAuths:133])
														UNLOAD RECORD:C212([CC_OrderAuths:133])
													End if 
												End if 
											End if 
											CCM_bo_DisableAVSTEMP:=False:C215
										: (CCM_l_CCAuditID=-907)  // reject AVS
											
											CCM_l_RejectedID:=0
											
										: (CCM_l_CCAuditID=-908)
											//CVV2 Failure
											CCM_l_CCAuditID:=0
											CCM_bo_CV2Retry:=True:C214
											//don't record this as an auth.
											
											CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; INC_al_PriorAuthIDs{$_l_Index})
											If (CCM_l_CCauditID>0)
												$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
												If ($_bo_IsOK)
													CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
													If (CC_t_AuthCode#"")
														READ WRITE:C146([CCM_PSPTransaction:136])
														QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
														$_bo_OK:=False:C215
														$_l_Repeats:=0
														$_l_Delay:=1
														Repeat 
															$_l_Repeats:=$_l_Repeats+1
															$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
															If (Not:C34($_bo_OK))
																If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
																	//only increase every 10 tries
																	$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
																	
																End if 
																DelayTicks(2*$_l_Delay)
															End if 
														Until ($_bo_OK=True:C214)
														If ($_t_Invoice="*D@")
															[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
														Else 
															[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
														End if 
														[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
														
														DB_SaveRecord(->[CCM_PSPTransaction:136])
														
														READ WRITE:C146([CC_OrderAuths:133])
														QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=INC_al_PriorAuthIDs{$_l_Index})
														[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
														[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
														[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
														
														APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
														APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
														APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
														DB_SaveRecord(->[CC_OrderAuths:133])
														UNLOAD RECORD:C212([CC_OrderAuths:133])
													End if 
												End if 
											Else 
												Gen_Alert("You may not retry a CVV2 again")
												
											End if 
											CCM_bo_CV2Retry:=True:C214
									End case 
									
									
								End if 
								
							End if 
							
						End for 
					Else 
						//a new auth
						ARRAY LONGINT:C221($_al_ANTransactions; 0)
						ARRAY REAL:C219($_ar_ANTransactionAmounts; 0)
						ARRAY TEXT:C222($_at_ANTransactionInvoiceCodes; 0)
						READ ONLY:C145([CC_OrderAuths:133])
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=Abs:C99(INV_l_CCID))
						$_t_Invoice:=[CC_OrderAuths:133]xinvoiceCode:9  //This may be blank
						
						$_l_OrderAuthID:=[CC_OrderAuths:133]x_ID:1
						CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
						If (CCM_l_CCAuditID>0)
							$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
							If ($_bo_IsOK)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
								If (CC_t_AuthCode#"")
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
									$_bo_OK:=False:C215
									$_l_Repeats:=0
									$_l_Delay:=1
									Repeat 
										$_l_Repeats:=$_l_Repeats+1
										$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
										If (Not:C34($_bo_OK))
											If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
												//only increase every 10 tries
												$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
												
											End if 
											DelayTicks(2*$_l_Delay)
										End if 
									Until ($_bo_OK=True:C214)
									If ($_t_Invoice="*D@")
										[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
									Else 
										[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
									End if 
									[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
									
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									
									READ WRITE:C146([CC_OrderAuths:133])
									QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
									[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
									
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
									DB_SaveRecord(->[CC_OrderAuths:133])
									APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
									APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
									APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
									
									UNLOAD RECORD:C212([CC_OrderAuths:133])
								End if 
							End if 
						Else 
							Case of 
								: (CCM_l_CCAuditID=-909)
									CCM_l_CCAuditID:=0
									//AVS rejection
									//record the FAILED  but the amount was authd'
									CCM_l_RejectedID:=0
									CCM_bo_DisableAVSTEMP:=True:C214
									CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
									If (CCM_l_CCAuditID>0)
										$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If ($_bo_IsOK)
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
											If (CC_t_AuthCode#"")
												UNLOAD RECORD:C212([CC_OrderAuths:133])
												QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214)
												If ($_t_Invoice="*D@")
													[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
												Else 
													[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
												End if 
												[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
												
												DB_SaveRecord(->[CCM_PSPTransaction:136])
												
												READ WRITE:C146([CC_OrderAuths:133])
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
												[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
												[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
												[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
												
												APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
												APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
												APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
												
												DB_SaveRecord(->[CC_OrderAuths:133])
												UNLOAD RECORD:C212([CC_OrderAuths:133])
											End if 
										End if 
									End if 
									CCM_bo_DisableAVSTEMP:=False:C215
								: (CCM_l_CCAuditID=-907)  // reject AVS
									
									CCM_l_RejectedID:=0
									
								: (CCM_l_CCAuditID=-908)
									//CVV2 Failure
									CCM_l_CCAuditID:=0
									CCM_bo_CV2Retry:=True:C214
									//don't record this as an auth.
									
									CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
									If (CCM_l_CCAuditID>0)
										$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If ($_bo_IsOK)
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
											If (CC_t_AuthCode#"")
												UNLOAD RECORD:C212([CC_OrderAuths:133])
												QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214)
												If ($_t_Invoice="*D@")
													[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
												Else 
													[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
												End if 
												[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
												
												DB_SaveRecord(->[CCM_PSPTransaction:136])
												
												READ WRITE:C146([CC_OrderAuths:133])
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
												[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
												[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
												[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
												
												APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
												APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
												APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
												[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
												
												DB_SaveRecord(->[CC_OrderAuths:133])
												UNLOAD RECORD:C212([CC_OrderAuths:133])
											End if 
										End if 
									Else 
										Gen_Alert("You may not retry a CVV2 again")
										
									End if 
									CCM_bo_CV2Retry:=True:C214
							End case 
							
						End if 
						
					End if 
					
				: (INV_l_CCID>0)  // reference to an order auth Only THIS happens..which is a prior AUTH
					
					If (Size of array:C274(INC_ar_PriorAmounts)=0)
						//This will happen when refunding a receipt or deposit
						//and the repayment is via the cc provider
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=INV_l_CCID)
						$_l_OrderAuthID:=[CC_OrderAuths:133]x_ID:1
						
						$_l_VoidID:=CCM_VoidTransaction($_l_OrderAuthID; ACC_t_CurrencyCode; [CC_OrderAuths:133]AuthorizationDate:4)
						//get the authID and auth number
						If ($_l_VoidID>0)
							//the transaction is voided so set the record
							UNLOAD RECORD:C212([CC_OrderAuths:133])
							READ WRITE:C146([CC_OrderAuths:133])
							QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
							[CC_OrderAuths:133]xAuthStatus:7:=4
							DB_SaveRecord(->[CC_OrderAuths:133])
							READ WRITE:C146([CCM_PSPTransaction:136])
							QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214)
							[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
							DB_SaveRecord(->[CCM_PSPTransaction:136])
							
							UNLOAD RECORD:C212([CC_OrderAuths:133])
							UNLOAD RECORD:C212([CCM_PSPTransaction:136])
							READ ONLY:C145([CCM_PSPTransaction:136])
							READ ONLY:C145([CC_OrderAuths:133])
							
						End if 
						
					Else 
						READ ONLY:C145([CC_OrderAuths:133])
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=INV_l_CCID)
						$_l_OrderAuthID:=[CC_OrderAuths:133]x_ID:1
						CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; INV_l_CCID)
						If (CM_l_CCauditID>0)
							$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
							If ($_bo_IsOK)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
								If (CC_t_AuthCode#"")
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
									$_bo_OK:=False:C215
									$_l_Repeats:=0
									$_l_Delay:=1
									Repeat 
										$_l_Repeats:=$_l_Repeats+1
										$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
										If (Not:C34($_bo_OK))
											If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
												//only increase every 10 tries
												$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
												
											End if 
											DelayTicks(2*$_l_Delay)
										End if 
									Until ($_bo_OK=True:C214)
									If ($_t_Invoice="*D@")
										[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
									Else 
										[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
									End if 
									[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
									
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									
									READ WRITE:C146([CC_OrderAuths:133])
									QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
									[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
									
									[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
									APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
									APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
									APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
								End if 
								
							End if 
						Else 
							Case of 
								: (CCM_l_CCAuditID=-909)
									CCM_l_CCAuditID:=0
									//AVS rejection
									//record the FAILED  but the amount was authd'
									CCM_l_RejectedID:=0
									CCM_bo_DisableAVSTEMP:=True:C214
									CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; INV_l_CCID)
									If (CM_l_CCauditID>0)
										$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If ($_bo_IsOK)
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
											If (CC_t_AuthCode#"")
												UNLOAD RECORD:C212([CC_OrderAuths:133])
												QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214)
												If ($_t_Invoice="*D@")
													[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
												Else 
													[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
												End if 
												[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
												
												DB_SaveRecord(->[CCM_PSPTransaction:136])
												
												READ WRITE:C146([CC_OrderAuths:133])
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
												[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
												
												[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
												[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
												APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
												APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
												APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
												
												DB_SaveRecord(->[CC_OrderAuths:133])
												UNLOAD RECORD:C212([CC_OrderAuths:133])
											End if 
											
										End if 
									End if 
									CCM_bo_DisableAVSTEMP:=False:C215
								: (CCM_l_CCAuditID=-907)  // reject AVS
									
									CCM_l_RejectedID:=0
									
								: (CCM_l_CCAuditID=-908)
									//CVV2 Failure
									CCM_l_CCAuditID:=0
									CCM_bo_CV2Retry:=True:C214
									//don't record this as an auth.
									
									CCM_l_CCAuditID:=CCM_ProcessCard(ACC_t_CurrencyCode; INC_ar_PriorAmounts{$_l_Index}; [CC_OrderAuths:133]x_ID:1)
									//CCM_l_CCAuditID:=CCM_ProcessCard (ACC_t_CurrencyCode;INC_ar_PriorAmounts{$_l_Index};INV_l_CCID)
									If (CM_l_CCauditID>0)
										$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
										If ($_bo_IsOK)
											CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
											If (CC_t_AuthCode#"")
												UNLOAD RECORD:C212([CC_OrderAuths:133])
												QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
												$_bo_OK:=False:C215
												$_l_Repeats:=0
												$_l_Delay:=1
												Repeat 
													$_l_Repeats:=$_l_Repeats+1
													$_bo_OK:=Check_Locked(->[CCM_PSPTransaction:136]; 1)
													If (Not:C34($_bo_OK))
														If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
															//only increase every 10 tries
															$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
															
														End if 
														DelayTicks(2*$_l_Delay)
													End if 
												Until ($_bo_OK=True:C214)
												If ($_t_Invoice="*D@")
													[CCM_PSPTransaction:136]xDepositCode:12:=$_t_Invoice
												Else 
													[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_Invoice
												End if 
												[CCM_PSPTransaction:136]XTransactionStatus:15:=-1  // mark the auth so it does not get used again
												
												DB_SaveRecord(->[CCM_PSPTransaction:136])
												
												READ WRITE:C146([CC_OrderAuths:133])
												QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_l_OrderAuthID)
												[CC_OrderAuths:133]xAuthStatus:7:=3  //Money received
												
												[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
												[CC_OrderAuths:133]xinvoiceCode:9:=$_t_Invoice
												APPEND TO ARRAY:C911($_al_ANTransactions; CCM_l_CCAuditID)
												APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; INC_ar_PriorAmounts{$_l_Index})
												APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; $_t_Invoice)
												
												DB_SaveRecord(->[CC_OrderAuths:133])
												UNLOAD RECORD:C212([CC_OrderAuths:133])
											End if 
											
										End if 
									Else 
										Gen_Alert("You may not retry a CVV2 again")
										
									End if 
									CCM_bo_CV2Retry:=True:C214
							End case 
							
						End if 
					End if 
			End case 
			
			
			
			
		End if 
		
		If ((OK=1) & ([PERIODS:33]Period_Code:1#""))
			USE NAMED SELECTION:C332("$ToPost")
			FIRST RECORD:C50([INVOICES:39])
			$_r_Negative:=0
			$_r_DepositNegative:=0
			$_l_InvoicePosition:=0
			While (Not:C34(End selection:C36([INVOICES:39])))
				If ([INVOICES:39]Total_Due:7<0)
					$_r_Negative:=Round:C94(($_r_Negative+[INVOICES:39]Total_Due:7); 2)
					If (([INVOICES:39]Invoice_Number:1="*@") & ([INVOICES:39]Total_Invoiced:5=0))
						$_r_DepositNegative:=Round:C94(($_r_DepositNegative+[INVOICES:39]Total_Due:7); 2)
					End if 
				Else 
					$_l_InvoicePosition:=Round:C94(($_l_InvoicePosition+[INVOICES:39]Total_Due:7); 2)
				End if 
				NEXT RECORD:C51([INVOICES:39])
			End while 
			USE NAMED SELECTION:C332("$ToPost")
			FIRST RECORD:C50([INVOICES:39])
			i:=1
			$_r_PayAmount:=Round:C94((v31+Abs:C99($_r_Negative)); 2)
			vPay2:=0
			ARRAY TEXT:C222(GEN_at_Name; Records in selection:C76([INVOICES:39]))
			ARRAY TEXT:C222(GEN_at_RecordCode; Records in selection:C76([INVOICES:39]))
			ARRAY REAL:C219(GEN_ar_Value; Records in selection:C76([INVOICES:39]))
			While (Not:C34(End selection:C36([INVOICES:39])))
				
				GEN_at_Name{i}:=Substring:C12([INVOICES:39]Invoice_Number:1+"  "+[INVOICES:39]Company_Code:2; 1; 32)
				GEN_at_RecordCode{i}:=String:C10([INVOICES:39]Total_Due:7; "|Accounts")
				If (($_r_PayAmount>=[INVOICES:39]Total_Due:7) & ([INVOICES:39]Total_Due:7#0))
					GEN_ar_Value{i}:=[INVOICES:39]Total_Due:7
					If ([INVOICES:39]Total_Due:7>0)
						$_r_PayAmount:=Round:C94(($_r_PayAmount-[INVOICES:39]Total_Due:7); 2)
					End if 
				Else 
					GEN_ar_Value{i}:=$_r_PayAmount
					$_r_PayAmount:=0
				End if 
				
				NEXT RECORD:C51([INVOICES:39])
				If ((End selection:C36([INVOICES:39])) & ($_r_PayAmount#0))  // & (r1=0) & (r2=0))
					
					GEN_ar_Value{i}:=Round:C94((GEN_ar_Value{i}+$_r_PayAmount); 2)
				End if 
				vPay2:=Round:C94((vPay2+GEN_ar_Value{i}); 2)
				i:=i+1
			End while 
			//Check for overallocations where Deposits grab a large negative
			If ($_r_DepositNegative#0)
				$_r_Negative:=0
				$_l_Index:=i-1
				While ($_l_Index>0)
					IDLE:C311
					If ((GEN_at_Name{$_l_Index}#"*@") & (GEN_ar_Value{$_l_Index}>0) & (GEN_ar_Value{$_l_Index}>Num2(GEN_at_RecordCode{$_l_Index})) & ($_l_Index>1))
						$_r_Negative:=Round:C94(($_r_Negative+(Num2(GEN_at_RecordCode{$_l_Index})-GEN_ar_Value{$_l_Index})); 2)  //num2's are 4.0.038
						
						GEN_ar_Value{$_l_Index}:=Num2(GEN_at_RecordCode{$_l_Index})
					End if 
					If (GEN_at_Name{$_l_Index}="*@")
						GEN_ar_Value{$_l_Index}:=Round:C94((GEN_ar_Value{$_l_Index}-$_r_Negative); 2)
						$_l_Index:=0
					End if 
					$_l_Index:=$_l_Index-1
				End while 
			End if 
			$_r_Pay2:=99999999
			While ((OK=1) & ($_r_Pay2#v31))  //this should not happen with a CC
				
				$_bo_Confirm:=False:C215
				If (Count parameters:C259<3)
					$_bo_Confirm:=True:C214
				Else 
					If ($3=0)
						$_bo_Confirm:=True:C214
						
					End if 
				End if 
				If ($_bo_Confirm)
					$_r_SubTotal:=GEN_ar_Value{1}  // if we have more then one invoice to pay must select. and if we have one and it is not equal to the amount being allocated must select
					
					If (Size of array:C274(GEN_at_Name)>1) | ($_r_SubTotal#V31)
						Open_Any_Window(257; 457; 1984)
						vTitle:="RECEIPTS ALLOCATION"
						vTitle2:="To be"+Char:C90(13)+"Allocated"
						DIALOG:C40([INVOICES:39]; "dAllocation")
						CLOSE WINDOW:C154
						If (WIN_bo_TrackerInited)
							$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
							If ($_l_WindowReferenceRow>0)
								WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
							End if 
						End if 
						
						$_r_Pay2:=vPay2
					Else   //Not much point in confirming when there is only 1
						
						vPay2:=V31
						$_r_Pay2:=Vpay2
						OK:=1
					End if 
					If ((OK=1) & ($_r_Pay2#v31))
						Gen_Alert("Your allocations must equal the Receipt total"; "")
					End if 
				Else 
					vPay2:=V31
					$_r_Pay2:=Vpay2
				End if 
				
			End while 
			//NG TO TEST
			If (PAY_bo_CreateAuths)  //There were no auths passed to the method or relating to the order/company etc but an auth an payment was obtained within the method gen pay date
				
				//an amount was taken in Gen_PayDate
				//need to create the auth records for each of the invoices
				//PAY_t_AUTHCODE:=CC_t_AuthCode
				//PAY_l_CARDID:=CCM_l_cardIDtoAuth
				//PAY_l_TransactionID:=CC_l_AuthTransID
				//PAY_bo_CreateAuths:=True
				//NG JUne 2nd 2006--when we took a payment by card here we create the AUTH records related to the invoices for the amounts allocated to each invoice.
				For ($_l_CreateAuthIndex; 1; Size of array:C274(INV_at_InvoiceNumbers))
					$_r_AuthdAmount:=0
					For ($_l_ValuesIndex; 1; Size of array:C274(GEN_ar_Value))
						$_l_InvoicePosition:=Position:C15(INV_at_InvoiceNumbers{$_l_CreateAuthIndex}+"  "; GEN_at_Name{$_l_ValuesIndex})
						If ($_l_InvoicePosition>0)
							//THIS IS THE INVOICE
							$_r_AuthdAmount:=GEN_ar_Value{$_l_ValuesIndex}
							$_l_ValuesIndex:=Size of array:C274(GEN_ar_Value)
						End if 
					End for 
					If ($_r_AuthdAmount>0)
						CREATE RECORD:C68([CC_OrderAuths:133])
						[CC_OrderAuths:133]AuthorizationAmount:5:=$_r_AuthdAmount
						[CC_OrderAuths:133]AuthorizationCode:6:=PAY_t_AUTHCODE
						[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
						[CC_OrderAuths:133]CC_RecordID:3:=PAY_l_CARDID
						[CC_OrderAuths:133]TransactionID:10:=PAY_l_TransactionID
						[CC_OrderAuths:133]xAuthStatus:7:=3
						[CC_OrderAuths:133]xinvoiceCode:9:=INV_at_InvoiceNumbers{$_l_CreateAuthIndex}
						APPEND TO ARRAY:C911($_al_ANTransactions; PAY_l_TransactionID)
						APPEND TO ARRAY:C911($_ar_ANTransactionAmounts; $_r_AuthdAmount)
						APPEND TO ARRAY:C911($_at_ANTransactionInvoiceCodes; INV_at_InvoiceNumbers{$_l_CreateAuthIndex})
						[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
						DB_SaveRecord(->[CC_OrderAuths:133])
						//Note later down when we post the receipt we put the receipt number onto the transaction
						//NOTE THAT THE TRANSACTION THEY LINK TO IS FOR THE SUM OF THESE AMOUNTS!
					End if 
					
				End for 
			End if 
			
			If (OK=1)
				If ($_bo_Selection)
					If (Count parameters:C259<4)
						
						Gen_Confirm("Are you ready to post the Receipt?"; "Yes"; "No")
					Else 
						If ($4="")
							Gen_Confirm("Are you ready to post the Receipt?"; "Yes"; "No")
						Else 
							OK:=1
						End if 
						
					End if 
					
				Else 
					OK:=1
				End if 
				If (OK=1)
					READ WRITE:C146([TRANSACTION_BATCHES:30])
					If (DB_GetLedgerPostBatch=False:C215)
						If (Not:C34(In transaction:C397))
							StartTransaction
							$_bo_EndTransaction:=True:C214
						Else 
							$_bo_EndTransaction:=False:C215
						End if 
					Else 
						$_bo_EndTransaction:=False:C215
					End if 
					CREATE RECORD:C68([TRANSACTION_BATCHES:30])
					BatchNo
					$_l_TransPostStatus:=0
					If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
						OK:=0
					Else 
						[TRANSACTION_BATCHES:30]Batch_Date:1:=vDate
						[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
						[TRANSACTION_BATCHES:30]Description:12:="Invoice Receipt: "+vDesc
						USE NAMED SELECTION:C332("$ToPost")
						FIRST RECORD:C50([INVOICES:39])
						
						ARRAY TEXT:C222($_at_Code; vSNo)
						$_l_ArrayRow:=1
						If (Records in selection:C76([INVOICES:39])>1)  //if more than one will want a single-sided Bank trans
							
							$_bo_SinSID:=True:C214
							ARRAY TEXT:C222($_at_AnalysisCode; 0)  //Set up arrays to store the amts for each Analysis
							
							ARRAY REAL:C219($_ar_AnalysisAmount; 0)
							ARRAY TEXT:C222($_at_AnalysisCompany; 0)
						Else 
							$_bo_SinSID:=False:C215
						End if 
						$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
						COPY NAMED SELECTION:C331([INVOICES:39]; "$toPost")
						ARRAY LONGINT:C221($_al_TestedNumbers; 0)
						ARRAY LONGINT:C221($_al_TestedNumbers; ($_l_RecordsInSelection))
						For ($_l_InvoicesIndex; 1; $_l_RecordsInSelection)
							$_r_AmountRow:=Find in array:C230($_al_TestedNumbers; 0)
							If ($_r_AmountRow>0)
								$_l_invoices2Record:=$_r_AmountRow
								USE NAMED SELECTION:C332("$toPost")
								GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_invoices2Record)
								//While ((Not(End selection([INVOICES]))) & (OK=1))
								$_t_CompanyCode:=[INVOICES:39]Company_Code:2
								Repeat 
									$_t_InvoiceNumber:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)  //see also Invoices_ImpR
									
									//$_t_InvoiceNumber:=[INVOICES]Invoice No
									SET QUERY DESTINATION:C396(3; $_l_isUnique)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
									SET QUERY DESTINATION:C396(0)
								Until ($_l_isUnique=0)
								
								
								//$INP:=""
								//$IND:=""
								//$INA:=""
								If (OK=1)
									$_t_CompanyCode:=[INVOICES:39]Company_Code:2
									$_t_ContactCode:=[INVOICES:39]Contact_Code:3
									$_t_AnalysisCode:=[INVOICES:39]Analysis_Code:17
									//This sets the anal for the receipt based on the first invoice..if that is blank then it should be set to the
									//analysis of the first INVOICE
									$_bo_AnalisDeposit:=False:C215
									If ([INVOICES:39]Invoice_Number:1="*@")
										$_bo_AnalisDeposit:=True:C214
									End if 
									
									
									$_t_CreditAccount:=[TRANSACTION_TYPES:31]Credit_Account:5
									//$_l_RecordsInSelection:=Records in selection([INVOICES])
									//COPY NAMED SELECTION([INVOICES];"$toPost")
									//USE NAMED SELECTION("$ToPost")
									//TRACE
									For ($_l_InvoiceNumber; $_l_invoices2Record; $_l_RecordsInSelection)
										//While ((Not(End selection([INVOICES]))) & (OK=1) & ($_t_CompanyCode=[INVOICES]Company Code))
										If ($_l_InvoiceNumber<=$_l_RecordsInSelection)
											
											USE NAMED SELECTION:C332("$ToPost")
											GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_InvoiceNumber)
											If ($_t_CompanyCode=[INVOICES:39]Company_Code:2)
												
												If (Check_Locked(->[INVOICES:39]; 1))
													If (GEN_ar_Value{$_l_InvoiceNumber}#0)  //here is an error
														
														If ($_al_TestedNumbers{$_l_InvoiceNumber}=0)
															
															$_al_TestedNumbers{$_l_InvoiceNumber}:=$_l_InvoiceNumber
															If (([INVOICES:39]Invoice_Number:1="*@") & ([INVOICES:39]Total_Invoiced:5=0))  //& ([INVOICES]Total Due#0))`made negative deposits go wrong
																
																[INVOICES:39]Total_Due:7:=Round:C94(([INVOICES:39]Total_Due:7-GEN_ar_Value{$_l_InvoiceNumber}); 2)
																
																CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
																[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
																[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
																[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
																
																[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumber
																[INVOICES_ALLOCATIONS:162]Date:3:=vDate
																[INVOICES_ALLOCATIONS:162]Amount:2:=GEN_ar_Value{$_l_InvoiceNumber}
																DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
																
																// [INVOICES]Last Paid Date:=vDate
																$_l_PElement:=$_l_PElement+1
																If ($_l_PElement>Size of array:C274($_at_AllocationInvoice))
																	INSERT IN ARRAY:C227($_at_AllocationInvoice; Size of array:C274($_at_AllocationInvoice)+1; 100)
																	INSERT IN ARRAY:C227($_ad_AllocationDate; Size of array:C274($_ad_AllocationDate)+1; 100)
																	INSERT IN ARRAY:C227($_ar_AllocationAmount; Size of array:C274($_ar_AllocationAmount)+1; 100)
																End if 
																$_at_AllocationInvoice{$_l_PElement}:=[INVOICES:39]Invoice_Number:1
																$_ad_AllocationDate{$_l_PElement}:=[INVOICES_ALLOCATIONS:162]Date:3
																$_ar_AllocationAmount{$_l_PElement}:=GEN_ar_Value{$_l_InvoiceNumber}
																//$INP:=$INP+[INVOICES]Invoice_Number+Char(9)
																//$IND:=$IND+String([INVOICES]Invoice_Date)+Char(9)
																//$INA:=$INA+String(GEN_ar_Value{$_l_InvoiceNumber})+Char(9)
																
																
																//deposit?
																<>SI_bo_AllocationValidationDisab:=True:C214
																If (Application type:C494=4D Remote mode:K5:5)
																	
																	SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
																End if 
																DB_SaveRecord(->[INVOICES:39])
																<>SI_bo_AllocationValidationDisab:=False:C215
																If (Application type:C494=4D Remote mode:K5:5)
																	
																	SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
																End if 
																INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_InvoiceNumber; Vdate; GEN_ar_Value{$_l_InvoiceNumber}; ""; [PERIODS:33]Period_Code:1)
																CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
																[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
																[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
																[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTransDepositRec
																RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
																If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
																	Gen_Alert("The Deposit Reconciliation Transaction Type is not correctly defined"; "Cancel")
																	OK:=0
																Else 
																	If ([INVOICES:39]Debtors_Account:15#"")
																		[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[INVOICES:39]Debtors_Account:15
																		$_t_CreditAccount:=[INVOICES:39]Debtors_Account:15
																	Else 
																		[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
																	End if 
																	[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
																	TransB_DC
																	If (vMod3)  //If reconciling against Cash VAT Invoices
																		
																		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="OC"
																	End if 
																	[TRANSACTION_BATCH_ITEMS:155]Description:10:="Deposit "+[INVOICES:39]Invoice_Number:1+" Reconciliation"
																	[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((0-GEN_ar_Value{$_l_InvoiceNumber}); 2; 2)
																	[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round((0-GEN_ar_Value{$_l_InvoiceNumber}); 2; 2)
																	If ([INVOICES:39]Analysis_Code:17#"")
																		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
																	Else 
																		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
																	End if 
																	[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
																	[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
																	[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
																	
																	If (vChequeNo="")
																		If (CCM_t_ChequeNo#"")
																			vChequeNo:=CCM_t_ChequeNo
																		End if 
																	End if 
																	
																	[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
																	[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
																	Inv_PaySel3
																	DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
																	
																End if 
															Else 
																$_r_Amount:=GEN_ar_Value{$_l_InvoiceNumber}
																If (($_r_DepositNegative<0) & ($_r_Amount#0))  //was $_r_Amount>0 till 4.0.038
																	
																	If ($_r_Amount>=Abs:C99($_r_DepositNegative))
																		$_r_Amount:=Gen_Round(($_r_Amount+$_r_DepositNegative); 2; 2)
																		$_r_DepositNegative:=0
																	Else 
																		$_r_DepositNegative:=Gen_Round(($_r_DepositNegative+$_r_Amount); 2; 2)
																		$_r_Amount:=0
																	End if 
																End if 
																$_r_VATCSAmount:=0
																If ([INVOICES:39]Cash_TAX:41)
																	If ([INVOICES:39]Cash_TAX_Due:40#0)  //GEN_ar_Value{i}
																		
																		If (((GEN_ar_Value{$_l_InvoiceNumber}>=[INVOICES:39]Total_Due:7) & ([INVOICES:39]Total_Due:7>=0)) | ((GEN_ar_Value{$_l_InvoiceNumber}<=[INVOICES:39]Total_Due:7) & ([INVOICES:39]Total_Due:7<0)))
																			$_r_VATCSAmount:=[INVOICES:39]Cash_TAX_Due:40
																			[INVOICES:39]Cash_TAX_Due:40:=0
																		Else 
																			$_r_VATCSAmount:=Gen_Round(([INVOICES:39]Cash_TAX_Due:40*(GEN_ar_Value{$_l_InvoiceNumber}/[INVOICES:39]Total_Due:7)); 2; 2)
																			[INVOICES:39]Cash_TAX_Due:40:=Gen_Round(([INVOICES:39]Cash_TAX_Due:40-$_r_VATCSAmount); 2; 2)
																		End if 
																	End if 
																End if 
																If ($_bo_AnalisDeposit=True:C214)
																	If ([INVOICES:39]Analysis_Code:17#"")
																		$_t_AnalysisCode:=[INVOICES:39]Analysis_Code:17
																	End if 
																Else 
																	If ($_t_AnalysisCode="")
																		$_t_AnalysisCode:=[INVOICES:39]Analysis_Code:17
																	End if 
																	
																End if 
																[INVOICES:39]Total_Paid:6:=Gen_Round(([INVOICES:39]Total_Paid:6+GEN_ar_Value{$_l_InvoiceNumber}); 2; 2)
																[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Due:7-GEN_ar_Value{$_l_InvoiceNumber}); 2; 2)
																CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
																[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
																[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
																[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
																
																[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumber
																[INVOICES_ALLOCATIONS:162]Date:3:=vDate
																[INVOICES_ALLOCATIONS:162]Amount:2:=GEN_ar_Value{$_l_InvoiceNumber}
																$_l_PElement:=$_l_PElement+1
																If ($_l_PElement>Size of array:C274($_at_AllocationInvoice))
																	INSERT IN ARRAY:C227($_at_AllocationInvoice; Size of array:C274($_at_AllocationInvoice)+1; 100)
																	INSERT IN ARRAY:C227($_ad_AllocationDate; Size of array:C274($_ad_AllocationDate)+1; 100)
																	INSERT IN ARRAY:C227($_ar_AllocationAmount; Size of array:C274($_ar_AllocationAmount)+1; 100)
																End if 
																$_at_AllocationInvoice{$_l_PElement}:=[INVOICES:39]Invoice_Number:1
																$_ad_AllocationDate{$_l_PElement}:=[INVOICES:39]Invoice_Date:4
																$_ar_AllocationAmount{$_l_PElement}:=GEN_ar_Value{$_l_InvoiceNumber}
																//$INP:=$INP+[INVOICES]Invoice_Number+Char(9)
																//$IND:=$IND+String([INVOICES]Invoice_Date)+Char(9)
																//$INA:=$INA+String(GEN_ar_Value{$_l_InvoiceNumber})+Char(9)
																<>SI_bo_AllocationValidationDisab:=True:C214
																If (Application type:C494=4D Remote mode:K5:5)
																	
																	SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
																End if 
																DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
																DB_SaveRecord(->[INVOICES:39])
																INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_InvoiceNumber; Vdate; GEN_ar_Value{$_l_InvoiceNumber}; ""; [PERIODS:33]Period_Code:1)
																<>SI_bo_AllocationValidationDisab:=False:C215
																If (Application type:C494=4D Remote mode:K5:5)
																	
																	SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
																End if 
																//TRACE
																If (($_r_Amount#0) | ($_r_VATCSAmount#0))
																	CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
																	[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
																	[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
																	
																	[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSRECpost
																	RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
																	If ([INVOICES:39]Analysis_Code:17#"")
																		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
																	Else 
																		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
																	End if 
																	If (r1=1)
																		If (ACC_bo_CurrencyWriteOff)
																			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerExchangeControlACC
																		Else 
																			CUR_GetDebtPreference
																			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=ACC_t_BadDebts
																		End if 
																	Else 
																		If (r2=1)
																		Else 
																			If (($_bo_SinSID) & ($_r_Amount#0))  //If it's nought due to Cash VAT postings then make double-sided
																				
																				If (DB_GetLedgerByCompany)
																					$_t_FindAnalysisCode:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2+(" "*(5-Length:C16([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2)))+[INVOICES:39]Company_Code:2
																				Else 
																					$_t_FindAnalysisCode:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																				End if 
																				$_l_AnalysisCodeRow:=Find in array:C230($_at_AnalysisCode; $_t_FindAnalysisCode)
																				If ($_l_AnalysisCodeRow<1)
																					INSERT IN ARRAY:C227($_at_AnalysisCode; 9999; 1)
																					INSERT IN ARRAY:C227($_ar_AnalysisAmount; 9999; 1)
																					INSERT IN ARRAY:C227($_at_AnalysisCompany; 9999; 1)
																					$_l_AnalysisCodeRow:=Size of array:C274($_at_AnalysisCode)
																					$_at_AnalysisCode{$_l_AnalysisCodeRow}:=$_t_FindAnalysisCode
																				End if 
																				$_ar_AnalysisAmount{$_l_AnalysisCodeRow}:=Round:C94(($_ar_AnalysisAmount{$_l_AnalysisCodeRow}+$_r_Amount); 2)
																				If ($_at_AnalysisCompany{$_l_AnalysisCodeRow}="")
																					$_at_AnalysisCompany{$_l_AnalysisCodeRow}:=[INVOICES:39]Company_Code:2
																				Else 
																					If ($_at_AnalysisCompany{$_l_AnalysisCodeRow}#[INVOICES:39]Company_Code:2)  //Say multiple if >1 co within an Analysis
																						
																						$_at_AnalysisCompany{$_l_AnalysisCodeRow}:="Multiple"
																					End if 
																				End if 
																			Else 
																				[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=vBank
																			End if 
																			[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
																		End if 
																	End if 
																	If ([INVOICES:39]Debtors_Account:15#"")
																		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[INVOICES:39]Debtors_Account:15
																		$_t_CreditAccount:=[INVOICES:39]Debtors_Account:15
																	Else 
																		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
																	End if 
																	TransB_DC
																	[TRANSACTION_BATCH_ITEMS:155]Description:10:="Invoice "+[INVOICES:39]Invoice_Number:1+" Receipt"
																	[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round($_r_Amount; 2; 2)
																	[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round($_r_Amount; 2; 2)
																	If ([INVOICES:39]Cash_TAX:41)
																		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="OC"
																		If ($_r_VATCSAmount#0)
																			[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=$_r_VATCSAmount
																			[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
																			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6-$_r_VATCSAmount); 2; 2)
																		End if 
																	End if 
																	[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
																	[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
																	[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
																	[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
																	Inv_PaySel3
																	DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
																	
																End if 
															End if 
														End if 
													End if 
													NEXT RECORD:C51([INVOICES:39])
													//$_l_invoices2Record:=$_l_invoices2Record+1
												Else 
													Invoices_InLPTi
													Gen_Alert(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The Receipt cannot be posted."; "Cancel")
													OK:=0
												End if 
												$_l_Invoices2Temp:=$_l_InvoiceNumber
											Else 
												$_l_Invoices2Temp:=$_l_InvoiceNumber
												$_l_InvoiceNumber:=$_l_RecordsInSelection
											End if 
										Else 
											$_l_Invoices2Temp:=$_l_InvoiceNumber
											$_l_InvoiceNumber:=$_l_RecordsInSelection
										End if 
										//End while
									End for 
									//$_l_invoices2Record:=$_l_Invoices2Temp
									If (OK=1)
										CUT NAMED SELECTION:C334([INVOICES:39]; "$Sel")
										CREATE RECORD:C68([INVOICES:39])
										[INVOICES:39]Invoice_Number:1:=$_t_InvoiceNumber
										[INVOICES:39]State:10:=-3
										[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
										[INVOICES:39]Invoice_Date:4:=vDate
										[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
										[INVOICES:39]Company_Code:2:=$_t_CompanyCode
										[INVOICES:39]Contact_Code:3:=$_t_ContactCode
										[INVOICES:39]Debtors_Account:15:=$_t_CreditAccount
										[INVOICES:39]Bank_Account:16:=vBank
										[INVOICES:39]Comments:12:="Receipt Posting"+Char:C90(13)+("Description: "*(Num:C11(vDesc#"")))+vDesc
										If ((r1=1) | (r2=1))
											If (ACC_bo_CurrencyWriteOff)
												[INVOICES:39]Comments:12:=[INVOICES:39]Comments:12+Char:C90(13)+"Converted from "+ACC_t_CurrencyCode+" "+String:C10(vPayment; "|Accounts")
												
											Else 
												CUR_GetDebtPreference
												[INVOICES:39]Comments:12:=[INVOICES:39]Comments:12+Char:C90(13)+"Reconciled Debt"+""+String:C10(vPayment; " | Accounts")
											End if 
										End if 
										[INVOICES:39]Cheque_Number:36:=vChequeNo
										[INVOICES:39]Total_Due:7:=0
										[INVOICES:39]Analysis_Code:17:=$_t_AnalysisCode
										[INVOICES:39]Currency_Code:27:=vCountry
										If (ACC_t_CurrencyCode="")
											[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
										End if 
										[INVOICES:39]Layer_Code:38:=vLayer
										If ([INVOICES:39]Layer_Code:38="")
											[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
										End if 
										
										
										ARRAY TEXT:C222($_at_AllocationInvoice; $_l_PElement)
										ARRAY DATE:C224($_ad_AllocationDate; $_l_PElement)
										ARRAY REAL:C219($_ar_AllocationAmount; $_l_PElement)
										If (Size of array:C274($_at_AllocationInvoice)>0)  //($INP#"")
											
											For ($_l_AllocationCreateIndex; 1; Size of array:C274($_at_AllocationInvoice))
												IDLE:C311
												
												If ($_at_AllocationInvoice{$_l_AllocationCreateIndex}#"") | (True:C214)  //Modified NG October 2004
													
													CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
													[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
													[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
													[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
													
													[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationInvoice{$_l_AllocationCreateIndex}
													[INVOICES_ALLOCATIONS:162]Date:3:=Vdate
													
													//NG this was using the invoice date
													[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmount{$_l_AllocationCreateIndex}  //Num($INAT)
													
													DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
													INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_AllocationInvoice{$_l_AllocationCreateIndex}; vdate; $_ar_AllocationAmount{$_l_AllocationCreateIndex}; ""; [PERIODS:33]Period_Code:1)
													//NG Modified above line 29/5/2004
													
												End if 
											End for 
											$_l_PElement:=0
											ARRAY TEXT:C222($_at_AllocationInvoice; $_l_PElement)
											ARRAY DATE:C224($_ad_AllocationDate; $_l_PElement)
											ARRAY REAL:C219($_ar_AllocationAmount; $_l_PElement)
										End if 
										$_r_Sum:=Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2)  //NG OCtober 2004
										[INVOICES:39]Total_Paid:6:=Gen_Round(($_r_Sum); 2; 2)  //NG october 2004
										[INVOICES:39]Total_Due:7:=0  //NG October 2004
										
										
										
										
										<>SI_bo_AllocationValidationDisab:=True:C214
										If (Application type:C494=4D Remote mode:K5:5)
											
											SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
										End if 
										DB_SaveRecord(->[INVOICES:39])
										
										<>SI_bo_AllocationValidationDisab:=False:C215
										If (Application type:C494=4D Remote mode:K5:5)
											
											SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
										End if 
										If (Size of array:C274($_al_ANTransactions)>0)
											$_r_AmountRow:=Find in array:C230($_ar_ANTransactionAmounts; [INVOICES:39]Total_Paid:6)
											If ($_r_AmountRow>0)  //It should be
												
												If ($_at_ANTransactionInvoiceCodes{$_r_AmountRow}="")
													QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_InvoiceNumber)
													If ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
														$_at_ANTransactionInvoiceCodes{$_r_AmountRow}:=[XInvoiceAllocation:126]xInvoiceNumber:2
													Else 
														$_at_ANTransactionInvoiceCodes{$_r_AmountRow}:=[XInvoiceAllocation:126]xDepositNumber:5
													End if 
												End if 
												READ WRITE:C146([CCM_PSPTransaction:136])
												QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_al_ANTransactions{$_r_AmountRow})
												If ($_at_ANTransactionInvoiceCodes{$_r_AmountRow}="*D@")
													[CCM_PSPTransaction:136]xDepositCode:12:=$_at_ANTransactionInvoiceCodes{$_r_AmountRow}
												Else 
													[CCM_PSPTransaction:136]xInvoiceID:11:=$_at_ANTransactionInvoiceCodes{$_r_AmountRow}
												End if 
												[CCM_PSPTransaction:136]xReceiptID:13:=$_t_InvoiceNumber
												DB_SaveRecord(->[CCM_PSPTransaction:136])
												
											End if 
										End if 
										//ADD TO SET([INVOICES];"Master")
										If ($_l_ArrayRow<Size of array:C274($_at_Code))
											$_at_Code{$_l_ArrayRow}:=[INVOICES:39]Invoice_Number:1
										Else 
											APPEND TO ARRAY:C911($_at_Code; [INVOICES:39]Invoice_Number:1)
										End if 
										$_l_ArrayRow:=$_l_ArrayRow+1
										If (OK=1)
											USE NAMED SELECTION:C332("$Sel")
											NEXT RECORD:C51([INVOICES:39])
											
										End if 
									End if 
								End if 
							End if 
							//End while
						End for 
						If (OK=1)  //Post the Single Side if applicable
							
							If ($_bo_SinSID)
								If (Size of array:C274($_at_AnalysisCode)>0)
									FIRST RECORD:C50([INVOICES:39])
									For ($_l_Index; 1; Size of array:C274($_at_AnalysisCode))
										If ($_ar_AnalysisAmount{$_l_Index}#0)
											CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
											
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSRECpost
											RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
											If (DB_GetLedgerByCompany)
												[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=RemoveTrail2(Substring:C12($_at_AnalysisCode{$_l_Index}; 1; 5))
											Else 
												[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_AnalysisCode{$_l_Index}
											End if 
											[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=vBank
											[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
											TransB_DC
											[TRANSACTION_BATCH_ITEMS:155]Description:10:="Multiple Invoices_Receipt"
											[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_ar_AnalysisAmount{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_ar_AnalysisAmount{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_AnalysisCompany{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:="Multiple"
											[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=""
											
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
											Inv_PaySel3
											DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
											
										End if 
									End for 
								End if 
							End if 
						End if 
						If ((OK=1) & ((r1=1) | (r2=1)))  //Post extra Currency trans or debt write offs
							
							FIRST RECORD:C50([INVOICES:39])
							If (r2=1)  //If Bank Charge method, post a single-sided Bank Receipt trans
								
								CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
								[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
								
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSRECpost
								RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=vBank
								TransB_DC
								[TRANSACTION_BATCH_ITEMS:155]Description:10:="Bank Receipt "+ACC_t_CurrencyCode+" "+String:C10(vPayment)
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Round:C94((v31-v61); 2)
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94((v31-v61); 2)
								[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
								If ([INVOICES:39]Analysis_Code:17#"")
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
								Else 
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
								[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
								
								[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
								[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
								If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
									[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
								If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
									[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
								End if 
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							
							CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
							
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSRECpost
							RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
							If (r1=1)  //If Difference on exchange method or debt write off
								
								If (ACC_bo_CurrencyWriteOff)
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=vBank
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerExchangeControlACC
									TransB_DC
									[TRANSACTION_BATCH_ITEMS:155]Description:10:="Currency Adjustment"
									[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vPayment
									[TRANSACTION_BATCH_ITEMS:155]Total:9:=vPayment
									[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=ACC_t_CurrencyCode
									[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
								Else 
									CUR_GetDebtPreference
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=vBank
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=ACC_t_BadDebts
									TransB_DC
									[TRANSACTION_BATCH_ITEMS:155]Description:10:="Allocation Adjustment"
									[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vPayment
									[TRANSACTION_BATCH_ITEMS:155]Total:9:=vPayment
									[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=ACC_t_CurrencyCode
									[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
								End if 
							Else 
								//r2 so only currency exchange
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerExchangeACC
								TransB_DC
								[TRANSACTION_BATCH_ITEMS:155]Description:10:="Bank Charges"
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=v61
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=v61
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
							End if 
							If ([INVOICES:39]Analysis_Code:17#"")
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
							[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
							[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
							[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
							If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
							End if 
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (OK=1))
							
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
							If ($_l_CCAuditID>0)
								CCM_BatchAddCCCharging($_l_CCAuditID)
							End if 
							
							TransB_InLPTot
							DB_SaveRecord(->[TRANSACTION_BATCHES:30])
							$_l_AddMode:=Vadd
							vAdd:=0
							$_l_TransPostStatus:=TransactionBatch_Post
							Vadd:=$_l_AddMode
							UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
							
							
						End if 
					End if 
					If (DB_GetLedgerPostBatch)
						If (OK=1) & ($_l_TransPostStatus>=0)
							DB_bo_RecordModified:=True:C214
						Else 
							Gen_Alert("All postings made since opening the Receipts screen have been Cancelled")
							CANCEL:C270
							OK:=0
						End if 
					Else 
						If ($_bo_EndTransaction)
							If ($_l_TransPostStatus<0)
								Transact_End(False:C215)
								
							Else 
								Transact_End
							End if 
						End if 
					End if 
					If (OK=1)
						
						QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_Code)
						
						
						ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Number:1; >)
						If ((<>PurchPayRem) & (DB_GetModuleSettingByNUM(1)#5))
							
							Gen_Confirm("Do you want to print a Remittance Receipt Form"; "No"; "Yes")
							If (OK=0)
								$_bo_ReportExists:=SR_GetReport(->[INVOICES:39]; "Receipt Rem"; ""; "Invoice Receipt Remittance")
								If (Not:C34($_bo_ReportExists))
									
									FORM SET OUTPUT:C54([INVOICES:39]; "Receipt_Rem")
									PRINT SELECTION:C60([INVOICES:39])
									FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_Pay")
								Else 
									FIRST RECORD:C50([INVOICES:39])
									PRT_Count:=Records in selection:C76([INVOICES:39])
									PRT_bo_ToScreenPreview:=False:C215
									PRT_bo_ToPdf:=False:C215
									PRT_bo_AskPerIteration:=False:C215
									PRT_bo_AutoIteration:=False:C215
									PRT_t_pdfOutputFilePath:=""
									$_t_WindowTitle:=Get window title:C450
									For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
										$_t_InvoiceTitle:=[INVOICES:39]Invoice_Number:1
										
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; ":"; "")
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "/"; "_")
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "\\"; "_")
										
										SET WINDOW TITLE:C213($_t_InvoiceTitle)
										
										//******************************************************** Added  kmw 02/03/09 v631b120o ********************************************************
										
										//****************************************************************************************************************************************************************
										
										
										
										
										$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ALLOCATIONS:162]; "Receipt_Rem"; "Alloc_SubRec"; "Invoices_Out"; DB_t_CurrentFormUsage; "Inv Remittance"; "INV_ReceiptFormMethod"; 0; ->[INVOICES:39]State:10; "Receipt Remem"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index)
										
										
										
										
										NEXT RECORD:C51([INVOICES:39])
										If ($_bo_Continue=False:C215)
											$_l_Index:=Records in selection:C76([INVOICES:39])
										End if 
									End for 
									SET WINDOW TITLE:C213($_t_WindowTitle)
								End if 
							End if 
							OK:=1
							
						End if 
					End if 
				End if 
			End if 
		Else 
			//Gen_Alert("No Receipt will be posted on
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Inv_PaySel2"; $_t_oldMethodName)
