If (False:C215)
	//Table Form Method Name: [INVOICES]Inv_StateOA_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld; DB_bo_NoLoad)
	C_DATE:C307(SRCH_d_EntryDateTo)
	C_LONGINT:C283(<>DataSize; $_l_AllocationIndex)
	C_REAL:C285($_r_Total; vAmount; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; vDesc)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Inv_StateOA_Sub"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Date:4; ->[INVOICES:39]Your_Order_Number:14; ->vDesc; ->vAmount)
	
	
	//Set_Fonts ("[INVOICES]Invoice No+[INVOICES]Invoice Date+[INVOICES]Your Order No";◊DataSize)
	//Set_Fonts ("vDesc+vAmount";◊DataSize)
	$_bo_UseOld:=False:C215
	If ($_bo_UseOld)
		
	Else 
		INV_GetAllocations([INVOICES:39]Invoice_Number:1)
		vDesc:=""
		For ($_l_AllocationIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
			vDesc:=vDesc+[INVOICES:39]Invoice_Number:1+" "
			
			Case of 
				: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#[INVOICES:39]Invoice_Number:1)
					vDesc:=vDesc+[XInvoiceAllocation:126]xInvoiceNumber:2+" "
				: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#[INVOICES:39]Invoice_Number:1)
					vDesc:=vDesc+[XInvoiceAllocation:126]xCreditNumber:3+" "
				: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#[INVOICES:39]Invoice_Number:1)
					vDesc:=vDesc+[XInvoiceAllocation:126]xReceiptNumber:4+" "
				: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#[INVOICES:39]Invoice_Number:1)
					vDesc:=vDesc+[XInvoiceAllocation:126]xDepositNumber:5+" "
			End case 
			NEXT RECORD:C51([XInvoiceAllocation:126])
		End for 
		
	End if 
	
	If ([INVOICES:39]State:10<-1)
		vAmount:=Round:C94((0-[INVOICES:39]Total_Paid:6); 2)
		vVAT:=vVAT+vAmount
	Else 
		vAmount:=[INVOICES:39]Total_Invoiced:5
		$_bo_UseOld:=False:C215
		If ($_bo_UseOld)
		Else 
			QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6<=SRCH_d_EntryDateTo)
			$_r_Total:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2))
			vAmount:=vAmount-$_r_Total
		End if 
		
		vSubtotal:=vSubtotal+vAmount
	End if 
	vTotal:=vTotal+vAmount
	Invoices_ADCalc([INVOICES:39]Total_Due:7)
End if 
ERR_MethodTrackerReturn("FM [INVOICES].Inv_StateOA_Sub"; $_t_oldMethodName)
