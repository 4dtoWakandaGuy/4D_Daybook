//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InvJobs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2009 18:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(i)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InvJobs")
If ((OK=1) & ([PURCHASE_INVOICES:37]Allocate_to_Jobs:30=False:C215))
	Gen_Confirm("Do you want to allocate this Purchase Invoice to Job(s)?"; "Yes"; "No")
	If (OK=1)
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		ONE RECORD SELECT:C189([PURCHASE_INVOICES:37])
		[PURCHASE_INVOICES:37]Allocate_to_Jobs:30:=True:C214
		DB_SaveRecord(->[PURCHASE_INVOICES:37])
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
		
		FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
		CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Items")
		READ WRITE:C146([ORDER_ITEMS:25])
		i:=0
		OK:=1
		While ((Not:C34(End selection:C36([PURCHASE_INVOICE_ITEMS:158]))) & (OK=1))
			CREATE RECORD:C68([ORDER_ITEMS:25])
			OrderI_NoPJ
			[ORDER_ITEMS:25]Product_Code:2:=[PURCHASE_INVOICE_ITEMS:158]Product_Code:1
			[ORDER_ITEMS:25]Product_Name:13:=[PURCHASE_INVOICE_ITEMS:158]Description:13
			[ORDER_ITEMS:25]Quantity:3:=[PURCHASE_INVOICE_ITEMS:158]Quantity:2
			[ORDER_ITEMS:25]Cost_Price:5:=[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3
			[ORDER_ITEMS:25]Cost_Amount:15:=[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4
			RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
			[ORDER_ITEMS:25]Sales_Price:4:=[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15
			If ([PRODUCTS:9]Sales_Price:9#0)
				[ORDER_ITEMS:25]Retail_Price:38:=[PRODUCTS:9]Sales_Price:9
			Else 
				[ORDER_ITEMS:25]Retail_Price:38:=[ORDER_ITEMS:25]Sales_Price:4
			End if 
			[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
			[ORDER_ITEMS:25]Standard_Cost:41:=[PRODUCTS_SUPPLIERS:148]Standard_Cost:5
			[ORDER_ITEMS:25]Tax_Code:12:=[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5
			Calc_Item
			[ORDER_ITEMS:25]State:46:="A"
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
			ADD TO SET:C119([ORDER_ITEMS:25]; "Items")
			NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
		End while 
		
		
		Transact_End
		CLEAR SET:C117("Items")
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
	End if 
	OK:=1
End if 
ERR_MethodTrackerReturn("Purch_InvJobs"; $_t_oldMethodName)