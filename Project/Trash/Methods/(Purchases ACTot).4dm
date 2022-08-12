//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_ACTot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	C_DATE:C307(vDate)
	C_REAL:C285($4; vTotal)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; Acc_t_AccountCodeFrom; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_ACTot")

If (DB_t_CurrentFormUsage="AA")
	If (vDate<DB_GetSalesLedgerFromDate)
		If (Count parameters:C259=0)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=[PURCHASE_INVOICES:37]Company_Code:2; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=$1; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=$3; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
		End if 
		vTotal:=Round:C94((0-Gen_Add(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Total:17)); 2)
	Else 
		If ([PURCHASE_INVOICES:37]Invoice_Date:5<DB_GetSalesLedgerFromDate)
			If (Count parameters:C259=0)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=[PURCHASE_INVOICES:37]Company_Code:2; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<vDate; *)  //DB_GetSalesLedgerFromDate ;*)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3>=DB_GetSalesLedgerFromDate; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=$1; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=$3; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<vDate; *)  ///<DB_GetSalesLedgerFromDate ;*)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=$2; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3>=DB_GetSalesLedgerFromDate; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
			End if 
			vTotal:=Gen_Round(((0-Gen_Add(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Total:17))-Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)); 2; 2)
			
		Else 
			If (Count parameters:C259=0)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
			Else 
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=$2; *)
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159];  & ; [PURCHASE_INVOICE_ALLOCATIONS:159]Date:3<=vDate)
			End if 
			SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2; $_ar_AllocationAmounts)
			
			If ([PURCHASE_INVOICES:37]State:24=-2)
				vTotal:=Gen_Round(((0-[PURCHASE_INVOICES:37]Total_Paid:8)-Sum:C1($_ar_AllocationAmounts)); 2; 2)
			Else 
				vTotal:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-Sum:C1($_ar_AllocationAmounts)); 2; 2)
			End if 
		End if 
	End if 
Else 
	If (Count parameters:C259>=4)
		vTotal:=$4
	Else 
		Vtotal:=[PURCHASE_INVOICES:37]Total_Due:9
	End if 
End if 
ERR_MethodTrackerReturn("Purchases_ACTot"; $_t_oldMethodName)
