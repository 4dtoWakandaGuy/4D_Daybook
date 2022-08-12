//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Invoices_PaySel
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
	C_BOOLEAN:C305($_bo_IsFromOrder; $_bo_Selection; $1; $4; vMod3)
	C_LONGINT:C283($_l_CCAuditID; $_l_RecordsinSelection; $3)
	C_REAL:C285($_r_Amount; $2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_CurrencyCode; vLayer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_PaySel")

//Invoices_Pay Select
$_t_oldMethodName:=ERR_MethodTracker("Invoices_PaySel")
//CREATE SET("Master")
COPY NAMED SELECTION:C331([INVOICES:39]; "$PaySel")
//If the parameters are passed the current selection is used

//USE SET("Userset")

USE NAMED SELECTION:C332("$PAYSEL")

If (Records in selection:C76([INVOICES:39])>0)
	$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
	ACC_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
	If ((ACC_t_CurrencyCode=<>SYS_t_BaseCurrency) | (ACC_t_CurrencyCode=""))
		ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
		If (Gen_SelbyForm(->[INVOICES:39]))
			QUERY SELECTION BY FORMULA:C207([INVOICES:39]; (([INVOICES:39]Currency_Code:27=ACC_t_CurrencyCode) | ([INVOICES:39]Currency_Code:27="")))
		Else 
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=ACC_t_CurrencyCode; *)
			QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
		End if 
	Else 
		If (Gen_SelbyForm(->[INVOICES:39]))
			QUERY SELECTION BY FORMULA:C207([INVOICES:39]; [INVOICES:39]Currency_Code:27=ACC_t_CurrencyCode)
		Else 
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=ACC_t_CurrencyCode)
		End if 
	End if 
	If ($_l_RecordsinSelection#Records in selection:C76([INVOICES:39]))
		Gen_Alert("Receipts must be entered for Invoices_In only one Currency: "+ACC_t_CurrencyCode; "")
	End if 
	$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
	vLayer:=[INVOICES:39]Layer_Code:38
	If ((vLayer=DB_GetLedgerActualLayer) | (vLayer=""))
		vLayer:=DB_GetLedgerActualLayer
		If (Gen_SelbyForm(->[INVOICES:39]))
			QUERY SELECTION BY FORMULA:C207([INVOICES:39]; (([INVOICES:39]Layer_Code:38=vLayer) | ([INVOICES:39]Layer_Code:38="")))
		Else 
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=vLayer; *)
			QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Layer_Code:38="")
		End if 
	Else 
		If (Gen_SelbyForm(->[INVOICES:39]))
			QUERY SELECTION BY FORMULA:C207([INVOICES:39]; [INVOICES:39]Layer_Code:38=vLayer)
		Else 
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Layer_Code:38=vLayer)
		End if 
	End if 
	If ($_l_RecordsinSelection#Records in selection:C76([INVOICES:39]))
		Gen_Alert("Receipts must be entered for Invoices_In only one Layer: "+vLayer; "")
	End if 
	
	OK:=1
	//check that no Receipts are included
	$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#-3)
	If ($_l_RecordsinSelection#Records in selection:C76([INVOICES:39]))
		Gen_Alert("You cannot allocate a Receipt against existing Receipts!"; "Cancel")
		OK:=0
	End if 
	
	If (OK=1)
		//Check that no deposit recs are attempted against both Cash VAT & Accrual Invs
		vMod3:=[INVOICES:39]Cash_TAX:41
		COPY NAMED SELECTION:C331([INVOICES:39]; "$VATCS")
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-2)  //Find a Deposit
		If (Records in selection:C76([INVOICES:39])>0)
			USE NAMED SELECTION:C332("$VATCS")
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#-2)
			ORDER BY:C49([INVOICES:39]; [INVOICES:39]Cash_TAX:41; >)
			FIRST RECORD:C50([INVOICES:39])
			vMod3:=[INVOICES:39]Cash_TAX:41
			LAST RECORD:C200([INVOICES:39])
			If (vMod3#[INVOICES:39]Cash_TAX:41)
				Gen_Alert("You cannot Reconcile Deposits against some Cash VAT"+" Invoices and some Accrual VAT Invoices"; "Cancel")
				OK:=0
			End if 
		End if 
		USE NAMED SELECTION:C332("$VATCS")
		CLEAR NAMED SELECTION:C333("$VATCS")
		
		If (OK=1)
			ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >; [INVOICES:39]Invoice_Number:1; >)
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
			If (Count parameters:C259>=3)
				
				$_l_CCAuditID:=$3
			Else 
				
				$_l_CCAuditID:=0
			End if 
			If (Count parameters:C259>=4)
				$_bo_IsFromOrder:=$4
			Else 
				$_bo_IsFromOrder:=False:C215
			End if 
			
			//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
			
			//*********************************************************************************************
			Inv_PaySel2($_bo_Selection; $_r_Amount; $_l_CCAuditID; ""; $_bo_IsFromOrder)
			//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
			
			//********************************************************************************************
			
		End if 
	End if 
End if 
//USE SET("Master")
//SORT SELECTION([INVOICES]Company Code;>;[INVOICES]Invoice Date;>)
USE NAMED SELECTION:C332("$PaySel")
ERR_MethodTrackerReturn("Invoices_PaySel"; $_t_oldMethodName)