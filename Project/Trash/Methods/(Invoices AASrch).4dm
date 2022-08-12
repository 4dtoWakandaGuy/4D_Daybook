//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices AASrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 10:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld; $0)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Dummy)
	C_REAL:C285($_r_AmountPaid; $_r_OutstandingBalance; $_r_Sum; $_r_Total; $_r_TotalDue; $_r_TotalDue2; $_r_TotalPaid; $_r_TotalPaid2; $_r_TransTotal; Vtotal)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices AASrch")
$0:=False:C215
$_bo_UseOld:=False:C215
//If (ACC_t_PeriodFrom="")
If ([INVOICES:39]Invoice_Date:4<=vDate)
	If ([INVOICES:39]Total_Due:7#0)
		$0:=True:C214
	Else 
		If (vDate<DB_GetSalesLedgerFromDate)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=[INVOICES:39]Invoice_Number:1; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
			$0:=(Round:C94((Sum:C1([TRANSACTIONS:29]Total:17)); 2)#0)
		Else 
			If ([INVOICES:39]Invoice_Date:4<DB_GetSalesLedgerFromDate)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=[INVOICES:39]Invoice_Number:1; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<DB_GetSalesLedgerFromDate; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
				If ($_bo_UseOld)
					
				Else 
					//    TRACE
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8>=DB_GetSalesLedgerFromDate; *)
					QUERY SELECTION:C341([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xTaxPointDate:8<=VDaTE)
					$_r_TransTotal:=Sum:C1([TRANSACTIONS:29]Total:17)  //Changed NG Septembe 2004
					$_r_AmountPaid:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215)
					$_r_OutstandingBalance:=Round:C94((Sum:C1([TRANSACTIONS:29]Total:17))-(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215)); 2)
					$0:=($_r_OutstandingBalance#0)
					
				End if 
			Else 
				If ($_bo_UseOld)
					
				Else 
					$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
					$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					$_r_Sum:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2))
					$_r_TotalPaid2:=Gen_Round(($_r_Sum); 2; 2)
					$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
					If ($_r_TotalPaid#$_r_TotalPaid2) | ($_r_TotalDue#$_r_TotalDue2)
						//use subrecords
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
						QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Date:3<=vDate)
						If ([INVOICES:39]State:10=-2)
							$_r_Total:=Round:C94((Gen_AddSub(->[INVOICES_ALLOCATIONS:162]; ->[INVOICES_ALLOCATIONS:162]Amount:2)); 2)
						Else 
							$_r_Total:=Round:C94((Gen_AddSub(->[INVOICES_ALLOCATIONS:162]; ->[INVOICES_ALLOCATIONS:162]Amount:2)); 2)
						End if 
						$_l_Dummy:=0
						ProcessServices_CreateRecord(->[INVOICES:39]; ->$_l_Dummy; [INVOICES:39]Invoice_Number:1)
					Else 
						
						INV_GetAllocations([INVOICES:39]Invoice_Number:1)
						QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8<=VDaTE)
						$_r_Total:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2))
						
					End if 
					
					If ([INVOICES:39]State:10=-2)
						vTotal:=Round:C94([INVOICES:39]Total_Paid:6+$_r_Total; 2)
					Else 
						vTotal:=Round:C94([INVOICES:39]Total_Invoiced:5-$_r_Total; 2)
					End if 
					
				End if 
				
				$0:=(vTotal#0)
				
			End if 
		End if 
	End if 
End if 
//Else
// SEARCH([TRANSACTIONS];[TRANSACTIONS]Invoice No=[INVOICES]Invoice No;*)
// SEARCH([TRANSACTIONS]; & ;[TRANSACTIONS]Period Code<=ACC_t_PeriodFrom;*)
// SEARCH([TRANSACTIONS]; & ;[TRANSACTIONS]Account Code=Acc_t_AccountCodeFrom)
// $0:=(Round(Sum([TRANSACTIONS]Total);2)#0)
//End if
ERR_MethodTrackerReturn("Invoices AASrch"; $_t_oldMethodName)