//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PaySelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    31/10/2010 17:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vMod3)
	C_LONGINT:C283($_l_RecordsinSelection; DB_l_CurrentDisplayedForm)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_CurrencyCode; DB_t_CurrentContext; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PaySelected")

//USE SET("Userset")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
If ($_l_RecordsinSelection>0)
	ACC_t_CurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
	If ((ACC_t_CurrencyCode=<>SYS_t_BaseCurrency) | (ACC_t_CurrencyCode=""))
		ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
		If (Gen_SelbyForm(->[PURCHASE_INVOICES:37]))
			QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; (([PURCHASE_INVOICES:37]Currency_Code:23=ACC_t_CurrencyCode) | ([PURCHASE_INVOICES:37]Currency_Code:23="")))
		Else 
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=ACC_t_CurrencyCode; *)
			QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Currency_Code:23="")
		End if 
	Else 
		If (Gen_SelbyForm(->[PURCHASE_INVOICES:37]))
			QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=ACC_t_CurrencyCode)
		Else 
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=ACC_t_CurrencyCode)
		End if 
	End if 
	If ($_l_RecordsinSelection#Records in selection:C76([PURCHASE_INVOICES:37]))
		Gen_Alert("Payments must be entered for Purchases_In only one Currency: "+ACC_t_CurrencyCode; "")
	End if 
	$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
	vLayer:=[PURCHASE_INVOICES:37]Layer_Code:28
	If ((vLayer=DB_GetLedgerActualLayer) | (vLayer=""))
		vLayer:=DB_GetLedgerActualLayer
		If (Gen_SelbyForm(->[PURCHASE_INVOICES:37]))
			QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; (([PURCHASE_INVOICES:37]Layer_Code:28=vLayer) | ([PURCHASE_INVOICES:37]Layer_Code:28="")))
		Else 
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=vLayer; *)
			QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Layer_Code:28="")
		End if 
	Else 
		If (Gen_SelbyForm(->[PURCHASE_INVOICES:37]))
			QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=vLayer)
		Else 
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=vLayer)
		End if 
	End if 
	If ($_l_RecordsinSelection#Records in selection:C76([PURCHASE_INVOICES:37]))
		Gen_Alert("Payments must be entered for Purchases_In only one Layer: "+vLayer; "")
	End if 
	
	OK:=1
	//check that no Payments are included
	$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
	QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24#-3)
	If ($_l_RecordsinSelection#Records in selection:C76([PURCHASE_INVOICES:37]))
		Gen_Alert("You cannot allocate a Payment against existing Payments!"; "Cancel")
		OK:=0
	End if 
	
	If (OK=1)
		//Check that no Prepay recs are attempted against both Cash VAT & Accrual Invs
		vMod3:=[PURCHASE_INVOICES:37]Cash_TAX:33
		COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$VATCS")
		QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-2)  //Find a Deposit
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			USE NAMED SELECTION:C332("$VATCS")
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24#-2)
			ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Cash_TAX:33; >)
			FIRST RECORD:C50([PURCHASE_INVOICES:37])
			vMod3:=[PURCHASE_INVOICES:37]Cash_TAX:33
			LAST RECORD:C200([PURCHASE_INVOICES:37])
			If (vMod3#[PURCHASE_INVOICES:37]Cash_TAX:33)
				Gen_Alert("You cannot Reconcile Prepayments against some Cash VAT"+" Invoices and some Accrual VAT Invoices"; "Cancel")
				OK:=0
			End if 
		End if 
		USE NAMED SELECTION:C332("$VATCS")
		CLEAR NAMED SELECTION:C333("$VATCS")
		
		If (OK=1)
			ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; >)
			Purch_PaySel2
		End if 
	End if 
End if 
USE SET:C118("$temp")
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=2; *)
QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)

SEL_UpdateRecordCache(Table:C252(->[PURCHASE_INVOICES:37]))
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PUR_PaySelected"; $_t_oldMethodName)
