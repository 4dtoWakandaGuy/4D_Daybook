//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Dup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 6:01 AM
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate; $_bo_CreditNote; $_bo_Repeat)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Index; $_l_invoiceState; $_l_PeriodID; $_l_position; $_l_RecordsinSelection)
	C_TEXT:C284($_t_InvoiceNumber; $_t_InvoiceNumberIS; $_t_InvoiceNumberWas; $_t_oldMethodName; $_t_Search; ACC_t_PeriodFrom; vInvNo; vPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Dup")
//Invoices_Dup
//TRACE
Menu_Record("Invoices_Dup"; "Copy Previous")
If ([INVOICES:39]State:10<1)
	$_l_invoiceState:=[INVOICES:39]State:10
	Gen_Confirm("This will erase current Invoice Details and copy from a previous one"; ""; "")
	If (OK=1)
		$_t_Search:=Check_QM(Substring:C12(Gen_Request("Invoice/Proforma No to copy:"); 1; 51))
		If (OK=1)
			If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1="")) & (False:C215)
				Inv_No
			End if 
			$_t_InvoiceNumber:=""
			DB_SaveRecord(->[INVOICES:39])
			COPY NAMED SELECTION:C331([INVOICES:39]; "Invoices")
			CREATE SET:C116([INVOICES:39]; "IMaster")
			
			vInvNo:=[INVOICES:39]Invoice_Number:1
			
			$_t_InvoiceNumber:=vInvNo
			vDate:=[INVOICES:39]Invoice_Date:4
			ACC_t_PeriodFrom:=[INVOICES:39]Period_Code:13
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_Search)
			If (Records in selection:C76([INVOICES:39])=1)
				If (($_l_invoiceState=0) & ([INVOICES:39]State:10=-1))
					Gen_Confirm("Do you want to replace the Proforma with this Invoice?"; "Replace"; "Keep it")
					If (OK=1)
						$_bo_Repeat:=True:C214
					Else 
						$_bo_Repeat:=False:C215
					End if 
				Else 
					$_bo_Repeat:=False:C215
				End if 
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vInvNo)
				DB_DeletionControl(->[INVOICES:39])
				
				DELETE RECORD:C58([INVOICES:39])
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_Search)
				$_bo_CreditNote:=False:C215
				If ($_bo_Repeat=False:C215)
					DUPLICATE RECORD:C225([INVOICES:39])
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)  //the allocations for the old one
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					[INVOICES:39]X_ID:49:=AA_GetNextID(->[INVOICES:39]X_ID:49)
					[INVOICES:39]Invoice_Number:1:=vInvNo
					If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1=""))
						Inv_No
					End if 
					[INVOICES:39]State:10:=$_l_invoiceState
					CREATE SET:C116([INVOICES_ITEMS:161]; "$set")
					$_l_RecordsinSelection:=Records in selection:C76([INVOICES_ITEMS:161])
					For ($_l_Index; 1; $_l_RecordsinSelection)
						USE SET:C118("$Set")
						GOTO SELECTED RECORD:C245([INVOICES_ITEMS:161]; $_l_Index)
						DUPLICATE RECORD:C225([INVOICES_ITEMS:161])
						[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
						[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
						DB_SaveRecord(->[INVOICES_ITEMS:161])
					End for 
					$_t_InvoiceNumberWas:=[INVOICES:39]Invoice_Number:1
					//CREATE SET([INVOICES_ALLOCATIONS];"$set")
					//$_l_RecordsinSelection:=Records in selection([INVOICES_ALLOCATIONS])
					//For ($_l_Index;1;$_l_RecordsinSelection)
					//USE SET("$Set")
					//GOTO SELECTED RECORD([INVOICES_ALLOCATIONS];$_l_Index)
					//DUPLICATE RECORD([INVOICES_ALLOCATIONS])
					//[INVOICES_ALLOCATIONS]id_added_by_converter:=AA_GetNextID (->[INVOICES_ALLOCATIONS]id_added_by_converter)
					//[INVOICES_ALLOCATIONS]parent_Record_Code:=vInvNo
					//DB_SaveRecord (->[INVOICES_ALLOCATIONS])
					//See down about 20 line where the subrecords get deleted
					//End for
					Gen_Confirm("Reverse the amounts (ie Credit an Invoice or Invoice a Credit)?"; "Same"; "Reverse")
					$_bo_CreditNote:=(OK=0)
					OK:=1
					If ($_bo_CreditNote)
						//Inv_No ($_bo_CreditNote)
						$_l_position:=Position:C15("C"; $_t_InvoiceNumber)
						If ($_l_position=0)
							Inv_No($_bo_CreditNote)
							vInvNo:=[INVOICES:39]Invoice_Number:1
						End if 
					Else 
						[INVOICES:39]Invoice_Number:1:=$_t_InvoiceNumber
					End if 
					
					If ($_t_InvoiceNumberWas#[INVOICES:39]Invoice_Number:1)
						$_t_InvoiceNumberIS:=[INVOICES:39]Invoice_Number:1
						
						READ WRITE:C146([INVOICES_ITEMS:161])
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=$_t_InvoiceNumberWas)
						APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18:=$_t_InvoiceNumberIS)
					End if 
					
				Else 
					
					[INVOICES:39]State:10:=$_l_invoiceState
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=$_t_Search)
					READ WRITE:C146([ORDER_ITEMS:25])
					While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
						If (Check_LockMess(->[ORDER_ITEMS:25]; "Order Item"))
							[ORDER_ITEMS:25]Invoice_Number:17:=vInvNo
							[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							
						End if 
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End while 
					UNLOAD RECORD:C212([ORDER_ITEMS:25])
				End if 
				If (<>SYS_bo_CopyPreviousDate)
					vDate:=[INVOICES:39]Invoice_Date:4
					$_l_PeriodID:=Check_Period
					Check_PerCloseI
					[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
					vPeriod:=[PERIODS:33]Period_Name:2
				Else 
					[INVOICES:39]Invoice_Date:4:=vDate
					[INVOICES:39]Period_Code:13:=ACC_t_PeriodFrom
				End if 
				[INVOICES:39]Total_Paid:6:=0
				[INVOICES:39]Total_Due:7:=0  //[INVOICES]Total Invoiced
				If (([INVOICES:39]State:10=-1) & ($_l_invoiceState=0) & ([INVOICES:39]Credit_Stage:22=""))
					RELATE ONE:C42([INVOICES:39]Company_Code:2)
					If ([COMPANIES:2]Default_Credit_Stage:42#"")
						[INVOICES:39]Credit_Stage:22:=[COMPANIES:2]Default_Credit_Stage:42
					Else 
						[INVOICES:39]Credit_Stage:22:=DB_GetLedgerInvoiceDefaultStage
					End if 
				End if 
				If ([INVOICES:39]Terms:11="Proforma")
					RELATE ONE:C42([INVOICES:39]Company_Code:2)
					If ([COMPANIES:2]SL_Terms:40#"")
						[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
					Else 
						[INVOICES:39]Terms:11:=DB_GetLedgerDefaultTerms
					End if 
					Invoices_DueDat
				End if 
				[INVOICES:39]Posted_Date:8:=!00-00-00!
				[INVOICES:39]Printed:37:=False:C215
				QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
				//Not needed because the records wont be duplicated
				//While (Not(End selection([INVOICES_ALLOCATIONS])))
				//`DELETE RECORD([INVOICES_ALLOCATIONS])
				//ALL SUBRECORDS([INVOICES]ALLOCATIONS)
				//End while
				//actually this should not find any!
				READ WRITE:C146([XInvoiceAllocation:126])
				INV_GetAllocations([INVOICES:39]Invoice_Number:1)
				If (Records in selection:C76([XInvoiceAllocation:126])>0)
					//TRACE
					DELETE SELECTION:C66([XInvoiceAllocation:126])
				End if 
				READ ONLY:C145([XInvoiceAllocation:126])
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
				
				While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
					[INVOICES_ITEMS:161]Item_Number:12:=0
					DB_SaveRecord(->[INVOICES_ITEMS:161])
					NEXT RECORD:C51([INVOICES_ITEMS:161])
				End while 
				
				//Gen_Confirm ("Reverse the amounts (ie Credit an Invoice or Invoice a Credit)?";"Same";"Reverse")
				If ($_bo_CreditNote)
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
						[INVOICES_ITEMS:161]Sales_Price:4:=Round:C94((0-[INVOICES_ITEMS:161]Sales_Price:4); 2)
						[INVOICES_ITEMS:161]Amount:5:=Round:C94((0-[INVOICES_ITEMS:161]Amount:5); 2)
						[INVOICES_ITEMS:161]Tax_Amount:7:=Round:C94((0-[INVOICES_ITEMS:161]Tax_Amount:7); 2)
						[INVOICES_ITEMS:161]Total_Amount:8:=Round:C94((0-[INVOICES_ITEMS:161]Total_Amount:8); 2)
						[INVOICES_ITEMS:161]Cost_Amount:15:=Round:C94((0-[INVOICES_ITEMS:161]Cost_Amount:15); 2)
						DB_SaveRecord(->[INVOICES_ITEMS:161])
						
						NEXT RECORD:C51([INVOICES_ITEMS:161])
					End while 
					[INVOICES:39]Total_Invoiced:5:=Round:C94((0-[INVOICES:39]Total_Invoiced:5); 2)
					[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Round:C94((0-[INVOICES:39]Total_Invoiced_Excluding_Tax:26); 2)
					[INVOICES:39]Total_Tax:35:=Round:C94((0-[INVOICES:39]Total_Tax:35); 2)
					// [INVOICES]Total Due:=Round((0-[INVOICES]Total Due);2)
				End if 
				//  DB_SaveRecord(->[INVOICES])
				ADD TO SET:C119([INVOICES:39]; "IMaster")
				RELATE ONE:C42([INVOICES:39]Company_Code:2)
				RELATE ONE:C42([INVOICES:39]Contact_Code:3)
				Invoices_InLPB
				Invoices_InLPß("S1")
			Else 
				Gen_Alert("Invoice No not found"; "Cancel")
				USE NAMED SELECTION:C332("Invoices")
			End if 
			CLEAR NAMED SELECTION:C333("Invoices")
		End if 
	End if 
	
Else 
	Gen_Alert("This Function can only be used for new Invoices"; "Cancel")
End if 
ERR_MethodTrackerReturn("Invoices_Dup"; $_t_oldMethodName)