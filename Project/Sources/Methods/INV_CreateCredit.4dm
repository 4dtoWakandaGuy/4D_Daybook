//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CreateCredit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 21:35`Method: INV_CreateCredit
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ShowCredit)
	C_LONGINT:C283($_l_CreditProcessID; $_l_Index; $_l_InvoiceItemID; $_l_PeriodID; $_l_RecordsInSelection; INV_l_ItemId)
	C_TEXT:C284($_t_CreditNumber; $_t_InvoiceNumber; $_t_NewParentInvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CreateCredit")

//This method is called from the menu of an invoice to create a credit for that invoice.
//it is effectively the reverse of Invoices_Dup.except that if does not offer the option to do anything other than reverse the invoice
If ([INVOICES:39]State:10=0) | ([INVOICES:39]State:10=1) | ([INVOICES:39]State:10=2)
	If ([INVOICES:39]Posted_Date:8#!00-00-00!)
		If ([INVOICES:39]Total_Invoiced:5>=0)
			$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
			
			
			DUPLICATE RECORD:C225([INVOICES:39])
			$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
			Inv_No(True:C214)
			$_t_NewParentInvoiceNumber:=[INVOICES:39]Invoice_Number:1
			[INVOICES:39]X_ID:49:=AA_GetNextID(->[INVOICES:39]X_ID:49)
			QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=$_t_InvoiceNumber)
			
			CREATE SET:C116([INVOICES_ITEMS:161]; "$toDuplicate")
			$_l_RecordsInSelection:=Records in selection:C76([INVOICES_ITEMS:161])
			READ WRITE:C146([INVOICES_ITEMS:161])
			$_l_InvoiceItemID:=0
			$_l_InvoiceItemID:=(AA_GetNextID(->[INVOICES_ITEMS:161]ID:17; -$_l_RecordsInSelection))-$_l_RecordsInSelection
			
			For ($_l_Index; 1; $_l_RecordsInSelection)
				USE SET:C118("$toDuplicate")
				GOTO SELECTED RECORD:C245([INVOICES_ITEMS:161]; $_l_Index)
				[INVOICES_ITEMS:161]xReferredtoitemid:19:=[INVOICES_ITEMS:161]ID:17
				DB_SaveRecord(->[INVOICES_ITEMS:161])
				
				DUPLICATE RECORD:C225([INVOICES_ITEMS:161])
				
				INV_l_ItemId:=0
				[INVOICES_ITEMS:161]Item_Number:12:=0
				If ($_l_InvoiceItemID>0)
					[INVOICES_ITEMS:161]ID:17:=$_l_InvoiceItemID
					$_l_InvoiceItemID:=$_l_InvoiceItemID+1
				Else 
					[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
				End if 
				[INVOICES_ITEMS:161]xReferredtoitemid:19:=0
				[INVOICES_ITEMS:161]INVOICES_CODE:18:=$_t_NewParentInvoiceNumber
				DB_SaveRecord(->[INVOICES_ITEMS:161])
				
			End for 
			$_l_PeriodID:=Check_Period
			Check_PerCloseI
			[INVOICES:39]State:10:=0
			[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
			[INVOICES:39]Total_Paid:6:=0
			[INVOICES:39]Total_Due:7:=0  //[INVOICES]Total Invoiced
			[INVOICES:39]Posted_Date:8:=!00-00-00!
			[INVOICES:39]Printed:37:=False:C215
			//TRACE
			
			READ ONLY:C145([XInvoiceAllocation:126])
			QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
			APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round((0-[INVOICES_ITEMS:161]Sales_Price:4); 2; 2))
			APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Amount:5:=Gen_Round((0-[INVOICES_ITEMS:161]Amount:5); 2; 2))
			APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round((0-[INVOICES_ITEMS:161]Tax_Amount:7); 2; 2))
			APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round((0-[INVOICES_ITEMS:161]Total_Amount:8); 2; 2))
			APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Cost_Amount:15:=Gen_Round((0-[INVOICES_ITEMS:161]Cost_Amount:15); 2; 2))
			If (False:C215)
				
				While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
					[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round((0-[INVOICES_ITEMS:161]Sales_Price:4); 2; 2)
					[INVOICES_ITEMS:161]Amount:5:=Gen_Round((0-[INVOICES_ITEMS:161]Amount:5); 2; 2)
					[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round((0-[INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
					
					[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round((0-[INVOICES_ITEMS:161]Total_Amount:8); 2; 2)
					[INVOICES_ITEMS:161]Cost_Amount:15:=Gen_Round((0-[INVOICES_ITEMS:161]Cost_Amount:15); 2; 2)
					DB_SaveRecord(->[INVOICES_ITEMS:161])
					NEXT RECORD:C51([INVOICES_ITEMS:161])
				End while 
			End if 
			[INVOICES:39]Total_Invoiced:5:=Gen_Round((0-[INVOICES:39]Total_Invoiced:5); 2; 2)
			[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round((0-[INVOICES:39]Total_Invoiced_Excluding_Tax:26); 2; 2)
			[INVOICES:39]Total_Tax:35:=Gen_Round((0-[INVOICES:39]Total_Tax:35); 2; 2)
			DB_SaveRecord(->[INVOICES:39])
			
			Gen_Confirm("Do you wish to see the created credit note? ("+[INVOICES:39]Invoice_Number:1+")"; "Yes"; "No")
			$_bo_ShowCredit:=False:C215
			
			If (OK=1)
				$_t_CreditNumber:=[INVOICES:39]Invoice_Number:1
				$_bo_ShowCredit:=True:C214
			End if 
			OK:=1
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
			If ($_bo_ShowCredit)
				ZInvoices_Mod($_t_CreditNumber; "TRUE"; ->$_l_CreditProcessID)
				
			End if 
			
			
			
		Else 
			Gen_Alert("Sorry you may not issue a credit note for a credit")
		End if 
		
		//it does not matter if the invoice is paid/unpaid etc
	Else 
		Gen_Alert("Sorry, you may only create a credit for a posted invoice!")
	End if 
Else 
	Gen_Alert("You may only issue a credit note for an invoice")
End if 
ERR_MethodTrackerReturn("INV_CreateCredit"; $_t_oldMethodName)