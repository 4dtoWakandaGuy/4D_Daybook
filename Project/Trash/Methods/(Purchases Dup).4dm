//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases Dup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2010 15:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Index; $_l_PeriodID; $_l_PIItemsCount; $_l_PIState)
	C_TEXT:C284($_t_CopyPurchInvoiceCode; $_t_oldMethodName; $_t_PurchInvNumber; $_t_PurchInvoiceCode; ACC_t_PeriodFrom; vInvNo; vPeriod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases Dup")

//Purchases Dup
Menu_Record("Purchases Dup"; "Copy Previous")
If ([PURCHASE_INVOICES:37]State:24<1)
	$_l_PIState:=[PURCHASE_INVOICES:37]State:24
	Gen_Confirm("This will erase current Purchase Invoice Details and copy from a previous one"; ""; "")
	If (OK=1)
		$_t_CopyPurchInvoiceCode:=Check_QM(Substring:C12(Gen_Request("Purchase Code to copy:"); 1; 51))
		If (OK=1)
			
			If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
				[PURCHASE_INVOICES:37]Purchase_Code:1:="*P"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "*P")
			End if 
			$_t_PurchInvoiceCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
			DB_SaveRecord(->[PURCHASE_INVOICES:37])
			If ($_t_PurchInvoiceCode="")
				[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_PurchInvoiceCode
			End if 
			
			COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "Purchases")
			vInvNo:=[PURCHASE_INVOICES:37]Purchase_Code:1
			
			$_t_PurchInvNumber:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
			vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
			ACC_t_PeriodFrom:=[PURCHASE_INVOICES:37]Period_Code:3
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_CopyPurchInvoiceCode)
			If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=vInvNo)
				DELETE RECORD:C58([PURCHASE_INVOICES:37])
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_CopyPurchInvoiceCode)
				QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=$_t_CopyPurchInvoiceCode)
				
				DUPLICATE RECORD:C225([PURCHASE_INVOICES:37])
				[PURCHASE_INVOICES:37]x_ID:35:=AA_GetNextID(->[PURCHASE_INVOICES:37]x_ID:35)
				[PURCHASE_INVOICES:37]Purchase_Code:1:=vInvNo
				[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=$_t_PurchInvNumber
				If (<>SYS_bo_CopyPreviousDate)
					vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
					$_l_PeriodID:=Check_Period
					Check_PerCloseI
					[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
					vPeriod:=[PERIODS:33]Period_Name:2
				Else 
					[PURCHASE_INVOICES:37]Invoice_Date:5:=vDate
					[PURCHASE_INVOICES:37]Period_Code:3:=ACC_t_PeriodFrom
				End if 
				CREATE SET:C116([PURCHASE_INVOICE_ITEMS:158]; "$PurchaseItems")
				$_l_PIItemsCount:=Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])
				
				For ($_l_Index; 1; $_l_PIItemsCount)
					USE SET:C118("$PurchaseItems")
					GOTO SELECTED RECORD:C245([PURCHASE_INVOICE_ITEMS:158]; $_l_Index)
					
					//While (Not(End selection([PURCHASES_ITEMS])))
					DUPLICATE RECORD:C225([PURCHASE_INVOICE_ITEMS:158])
					[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
					[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
					DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
				End for 
				
				[PURCHASE_INVOICES:37]Total_Paid:8:=0
				[PURCHASE_INVOICES:37]Total_Due:9:=0  //[PURCHASES]Total Invoiced
				If (([PURCHASE_INVOICES:37]State:24=-1) & ($_l_PIState=0))
					RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
					Purchases_DueDt
				End if 
				[PURCHASE_INVOICES:37]State:24:=$_l_PIState
				[PURCHASE_INVOICES:37]Posted_Date:12:=!00-00-00!
				[PURCHASE_INVOICES:37]Printed:27:=False:C215
				If (False:C215)  //this wont be needed now
					QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
					
					While (Not:C34(End selection:C36([PURCHASE_INVOICE_ALLOCATIONS:159])))
						DELETE RECORD:C58([PURCHASE_INVOICE_ALLOCATIONS:159])
						QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
						
					End while 
				End if 
				
				
				Gen_Confirm("Reverse the amounts (ie Credit an Invoice or Invoice a Credit)?"; "Same"; "Reverse")
				If (OK=0)
					QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
					
					While (Not:C34(End selection:C36([PURCHASE_INVOICE_ITEMS:158])))
						[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2)
						[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15); 2)
						[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2)
						[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2)
						[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=Round:C94((0-[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2)
						DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
						//DB_SaveRecord (->[PURCHASES])
						
						NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
					End while 
					[PURCHASE_INVOICES:37]Total_Invoiced:7:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Invoiced:7); 2)
					[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19); 2)
					[PURCHASE_INVOICES:37]Total_Tax:25:=Round:C94((0-[PURCHASE_INVOICES:37]Total_Tax:25); 2)
					//      [PURCHASES]Total Due:=Round((0-[PURCHASES]Total Due);2)
				End if 
				DB_SaveRecord(->[PURCHASE_INVOICES:37])
				
				//ADD TO SET([PURCHASE_INVOICES];"Master")
				RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
				Purch_InLPB
			Else 
				Gen_Alert("Purchase Code not found"; "Cancel")
				USE NAMED SELECTION:C332("Purchases")
			End if 
			CLEAR NAMED SELECTION:C333("Purchases")
		End if 
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
		
		Purch_InLPß("S1")
	End if 
Else 
	Gen_Alert("This Function can only be used for new Purchase Invoices"; "Cancel")
End if 
ERR_MethodTrackerReturn("Purchases Dup"; $_t_oldMethodName)
