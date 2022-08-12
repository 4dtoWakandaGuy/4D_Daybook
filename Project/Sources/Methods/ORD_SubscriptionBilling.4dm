//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SubscriptionBilling
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   10/11/2010 23:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_LONGINT:C283($_l_Index; $_l_SIzeofarray; DB_l_CurrentDisplayedForm; DB_l_MaxRecords; vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_SubscriptionBilling")
CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([ORDER_ITEMS:25])>=1)
	Subscript_OrdRe
	vNo:=Records in selection:C76([ORDERS:24])
	Gen_Confirm("Create "+String:C10(vNo)+" Invoice"+("s"*(Num:C11(vNo#1)))+" / Credit Note"+("s"*(Num:C11(vNo#1)))+" ?"; "Yes"; "No")
	If (OK=1)
		
		READ WRITE:C146([ORDER_ITEMS:25])
		CREATE EMPTY SET:C140([INVOICES:39]; "IMaster")
		CREATE SET:C116([ORDER_ITEMS:25]; "OMaster")
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
				Subscript_OIFin
				If (OK=1)
					CUT NAMED SELECTION:C334([ORDERS:24]; "$Sel")
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[ORDER_ITEMS:25])
						APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					Else 
						
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
							[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					End if 
					USE NAMED SELECTION:C332("$Sel")
					Orders_InvBP2
				End if 
			End if 
			NEXT RECORD:C51([ORDERS:24])
		End while 
		
		If (OK=1)
			Invoices_Check
			SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
		End if 
		
		Transact_End
		
		If (OK=1)
			$_l_SIzeofarray:=Size of array:C274($_at_InvoiceNumbers)
			QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
			
			If ((Records in selection:C76([INVOICES:39])>0) & ([INVOICES:39]State:10#1))
				Gen_Confirm("Do you want to post Receipts against any of these Invoices?"; "Yes"; "No")
				If (OK=1)
					Invoices_Pay2
				End if 
			End if 
			
		End if 
		ALL RECORDS:C47([SUBSCRIPTIONS:93])
		RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
		DB_l_MaxRecords:=Records in selection:C76([ORDER_ITEMS:25])
		CREATE SET:C116([ORDER_ITEMS:25]; "$ALL")
		INTERSECTION:C121("$Temp"; "$ALL"; "$Temp")
		
	Else 
		
	End if 
	
Else 
	
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_SubscriptionBilling"; $_t_oldMethodName)