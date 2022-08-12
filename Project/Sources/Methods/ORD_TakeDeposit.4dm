//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_TakeDeposit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2010 14:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_BOOLEAN:C305($_bo_InRecordListing; DB_bo_InRecordListing)
	C_LONGINT:C283($_l_CurrentProcess; $_l_CurrentRow; $_l_InvoiceNumbersIndex; $_l_InvoiceRow; $_l_OrdersTableNumber)
	C_REAL:C285($_r_InviocedTotalAmount; $_r_OrderAmount; $_r_TotalOrderValue)
	C_TEXT:C284($_t_Nul; $_t_oldMethodName; $_t_OrderIDSTRING)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ORD_TakeDeposit")

//This method will take a deposit against the order

$_t_oldMethodName:=ERR_MethodTracker("ORD_TakeDeposit"; Form event code:C388)
If (Gen_PPChkStSing(->[ORDERS:24]State:15; 2))
	If ([ORDERS:24]x_ID:58=0)
		[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
	End if 
	If ([ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		DB_SaveRecord(->[ORDER_ITEMS:25])
	End if 
	
	
	
	FIRST RECORD:C50([ORDER_ITEMS:25])
	ARRAY TEXT:C222($_at_InvoiceNumbers; Records in selection:C76([ORDER_ITEMS:25]))
	$_l_CurrentRow:=0
	For ($_l_InvoiceNumbersIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
		If ([ORDER_ITEMS:25]Invoice_Number:17#"")
			$_l_InvoiceRow:=Find in array:C230($_at_InvoiceNumbers; [ORDER_ITEMS:25]Invoice_Number:17)
			If ($_l_InvoiceRow<0)
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_at_InvoiceNumbers{$_l_CurrentRow}:=[ORDER_ITEMS:25]Invoice_Number:17
				
			End if 
		End if 
		NEXT RECORD:C51([ORDER_ITEMS:25])
		
	End for 
	
	ARRAY TEXT:C222($_at_InvoiceNumbers; $_l_CurrentRow)
	If ($_l_CurrentRow>0)
		$_r_InviocedTotalAmount:=0
		For ($_l_InvoiceNumbersIndex; 1; Size of array:C274($_at_InvoiceNumbers))
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_InvoiceNumbersIndex})
			$_r_InviocedTotalAmount:=$_r_InviocedTotalAmount+[INVOICES:39]Total_Invoiced:5
		End for 
	Else 
		$_r_InviocedTotalAmount:=0
	End if 
	
	
	$_r_TotalOrderValue:=([ORDERS:24]Total_Total:8-$_r_InviocedTotalAmount)
	If ($_r_TotalOrderValue>0)
		
		$_l_OrdersTableNumber:=(Table:C252(->[ORDERS:24]))
		$_t_OrderIDSTRING:=String:C10([ORDERS:24]x_ID:58)
		$_r_OrderAmount:=($_r_TotalOrderValue)
		$_l_CurrentProcess:=Current process:C322
		$_bo_InRecordListing:=DB_bo_InRecordListing
		DB_bo_InRecordListing:=False:C215
		$_t_Nul:=""
		$_l_CurrentProcess:=Current process:C322
		//TRACE
		DB_MenuNewRecord("invoicesDeposit"; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2; ->$_t_Nul; ->[ORDERS:24]Order_Code:3; ->$_l_OrdersTableNumber; ->[ORDERS:24]x_ID:58; ->$_r_OrderAmount; ->$_l_CurrentProcess)
		
		//$_l_Process:=New Process("Invoices_InP";◊K2;"Deposit Receipt";$OrdersTable;$_t_OrderIDSTRING;$_r_OrderAmount;$_l_CurrentProcess;[ORDERS]Order Code;[ORDERS]Company Code)
		
	Else 
		Gen_Alert("There is no outstanding amount on this order to take a deposit against!")
	End if 
End if 
ERR_MethodTrackerReturn("ORD_TakeDeposit"; $_t_oldMethodName)
