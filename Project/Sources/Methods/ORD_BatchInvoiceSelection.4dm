//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_BatchInvoiceSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:        16/10/2010 02:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_OrderStates; 0)
	ARRAY TEXT:C222($_at_ValidStates; 0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_InvoicesPrinted; $_bo_ReturnToOrders)
	C_LONGINT:C283($_l_InvoicableIndex; DB_l_CurrentDisplayedForm; DB_l_MaxRecords)
	C_TEXT:C284($_t_oldMethodName; $_t_State1; $_t_State2; $_t_ThisState; $_t_UsageCode; DB_t_CurrentContext; vInvNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_BatchInvoiceSelection")
CREATE SET:C116([ORDERS:24]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([ORDERS:24])>0)
	If (Records in selection:C76([ORDERS:24])>1)
		Gen_Confirm("Create relevant Invoices for "+String:C10(Records in selection:C76([ORDERS:24]))+" Orders?"; "Yes"; "No")
		$_bo_Continue:=(OK=1)
	Else 
		Gen_Confirm("Create relevant Invoices for "+String:C10(Records in selection:C76([ORDERS:24]))+" Order?"; "Yes"; "No")
		$_bo_Continue:=(OK=1)
	End if 
	If ($_bo_Continue)
		CREATE EMPTY SET:C140([INVOICES:39]; "IMaster")
		CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "$Items")
		CREATE SET:C116([ORDERS:24]; "$Orders")
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			If (Orders_InvSrch)
				If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
					
					vInvNo:=""
					CREATE SET:C116([ORDER_ITEMS:25]; "$Extra")
					UNION:C120("$Extra"; "$Items"; "$Items")
					Orders_InvBP2
				End if 
			End if 
			NEXT RECORD:C51([ORDERS:24])
		End while 
		$_bo_ReturnToOrders:=True:C214
		If (OK=1)
			$_bo_InvoicesPrinted:=Invoices_Check
			If ($_bo_InvoicesPrinted)
				Transact_End
				Orders_InvBSP  //make sure this happens if we print the invoices
			Else 
				$_bo_ReturnToOrders:=False:C215
			End if 
		Else 
			Transact_End
		End if 
		CLEAR SET:C117("$Items")
		CLEAR SET:C117("$Orders")
		If ($_bo_ReturnToOrders)
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
				$_t_State1:=<>SYS_at_RecStateCodes{24}{1}
				$_t_State2:=<>SYS_at_RecStateCodes{24}{2}
				QUERY:C277([ORDERS:24]; [ORDERS:24]State:15#$_t_State1)
				QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15#$_t_State2)
				
				DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
				ARRAY TEXT:C222($_at_ValidStates; 0)
				For ($_l_InvoicableIndex; 1; Size of array:C274($_at_OrderStates))
					$_t_ThisState:=$_at_OrderStates{$_l_InvoicableIndex}
					$_t_UsageCode:="090"+$_t_ThisState
					QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UsageCode; *)
					QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
					If (Records in selection:C76([CODE_USES:91])>0)
						APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_InvoicableIndex})
						
					End if 
				End for 
				QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
				RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
				
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
				QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
			Else 
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
				QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
				RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
				DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
				ARRAY TEXT:C222($_at_ValidStates; 0)
				For ($_l_InvoicableIndex; 1; Size of array:C274($_at_OrderStates))
					$_t_ThisState:=$_at_OrderStates{$_l_InvoicableIndex}
					$_t_UsageCode:="090"+$_t_ThisState
					QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UsageCode; *)
					QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
					If (Records in selection:C76([CODE_USES:91])>0)
						APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_InvoicableIndex})
						
					End if 
				End for 
				QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
				
				QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
				
			End if 
			DB_l_MaxRecords:=Records in selection:C76([ORDERS:24])
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
		End if 
	Else 
		USE SET:C118("$temp")
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
	End if 
Else 
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("ORD_BatchInvoiceSelection"; $_t_oldMethodName)
