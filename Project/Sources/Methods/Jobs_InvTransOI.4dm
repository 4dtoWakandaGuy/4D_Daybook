//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InvTransOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_LONGINT:C283($Check; ch1; vAct2)
	C_REAL:C285(vTotal)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InvTransOI")
//Project Method Jobs_InvTransOI/3/2(ID 13633-2900)
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
READ WRITE:C146([ORDER_ITEMS:25])
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	CREATE RECORD:C68([INVOICES_ITEMS:161])
	[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
	[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
	
	[INVOICES_ITEMS:161]Price_Per:16:=[ORDER_ITEMS:25]Price_Per:50
	If ([INVOICES_ITEMS:161]Price_Per:16=0)
		[INVOICES_ITEMS:161]Price_Per:16:=1
	End if 
	[INVOICES_ITEMS:161]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
	[INVOICES_ITEMS:161]Product_Name:2:=("    "*vAct2)+[ORDER_ITEMS:25]Product_Name:13
	[INVOICES_ITEMS:161]Print_Description:14:=[ORDER_ITEMS:25]Print_Description:45
	[INVOICES_ITEMS:161]Description:13:=[ORDER_ITEMS:25]Description:44
	[INVOICES_ITEMS:161]Quantity:3:=[ORDER_ITEMS:25]Quantity:3
	[INVOICES_ITEMS:161]Tax_Code:6:=[ORDER_ITEMS:25]Tax_Code:12
	If ([INVOICES_ITEMS:161]Tax_Code:6="")
		[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
	End if 
	If (ch1=1)
		[INVOICES_ITEMS:161]Sales_Price:4:=[ORDER_ITEMS:25]Sales_Price:4
		[INVOICES_ITEMS:161]Amount:5:=[ORDER_ITEMS:25]Sales_Amount:7
		[INVOICES_ITEMS:161]Tax_Amount:7:=[ORDER_ITEMS:25]TAX_Amount:8
		[INVOICES_ITEMS:161]Total_Amount:8:=[ORDER_ITEMS:25]Total_Amount:9
	Else 
		//NG August 2003 this is fine for the currency conversion of stock
		//as it does not relate to products
		[INVOICES_ITEMS:161]Sales_Price:4:=[ORDER_ITEMS:25]Cost_Price:5
		[INVOICES_ITEMS:161]Amount:5:=Round:C94((([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)*[INVOICES_ITEMS:161]Sales_Price:4); 2)
		[INVOICES_ITEMS:161]Tax_Amount:7:=Round:C94(([INVOICES_ITEMS:161]Amount:5*([TAX_CODES:35]Tax_Rate:3/100)); 2)
		[INVOICES_ITEMS:161]Total_Amount:8:=Round:C94(([INVOICES_ITEMS:161]Amount:5+[INVOICES_ITEMS:161]Tax_Amount:7); 2)
	End if 
	RELATE ONE:C42([INVOICES_ITEMS:161]Product_Code:1)
	If ([PRODUCTS:9]Sales_Account:7#"")
		RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
		If (Records in selection:C76([ACCOUNTS:32])>0)
			[INVOICES_ITEMS:161]Sales_Account:9:=[PRODUCTS:9]Sales_Account:7
		Else 
			[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
		End if 
	Else 
		[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
		$check:=1
	End if 
	If ([JOBS:26]Analysis_Code:24#"")
		[INVOICES_ITEMS:161]Analysis_Code:10:=[JOBS:26]Analysis_Code:24
	Else 
		If (<>PersAnOver)
			[INVOICES_ITEMS:161]Analysis_Code:10:=<>Per_t_CurrentDefaultAnalCode
		Else 
			If ([PRODUCTS:9]Analysis_Code:18#"")
				RELATE ONE:C42([PRODUCTS:9]Analysis_Code:18)
				If (Records in selection:C76([ANALYSES:36])>0)
					[INVOICES_ITEMS:161]Analysis_Code:10:=[PRODUCTS:9]Analysis_Code:18
				Else 
					[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
				End if 
			Else 
				[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
			End if 
		End if 
	End if 
	If ([INVOICES:39]Analysis_Code:17="")
		[INVOICES:39]Analysis_Code:17:=[INVOICES_ITEMS:161]Analysis_Code:10
	End if 
	[INVOICES_ITEMS:161]Item_Number:12:=[ORDER_ITEMS:25]Item_Number:27
	
	vTotal:=vTotal+[INVOICES_ITEMS:161]Total_Amount:8
	[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
	[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
	If (DB_t_CurrentFormUsage="Invoice")
		[ORDER_ITEMS:25]Item_Locked:16:=True:C214
	End if 
	DB_SaveRecord(->[INVOICES_ITEMS:161])
	
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
ERR_MethodTrackerReturn("Jobs_InvTransOI"; $_t_oldMethodName)