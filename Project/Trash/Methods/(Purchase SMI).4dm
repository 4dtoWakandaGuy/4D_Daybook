//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchase SMI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 15:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_LONGINT:C283($No; vNo)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName; $_t_Search; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchase SMI")
//Project Method Purchase SMI 26/3/2(ID 20423-4048)
//Purchase Stock Movement items
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Purchase SMI"; "Copy a Stock Movement")
READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
$_t_Search:=Check_QM(Substring:C12(Gen_Request("Movement Code or Sales Order Code:"); 1; 11))
$No:=vNo
If ((OK=1) & ($_t_Search#""))
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_Search)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3=$_t_Search)
	End if 
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		//vNo:=Records in selection([STOCK ITEMS])
		
		//OUTPUT FORM([STOCK ITEMS];"Stock Out")
		//WIN_t_CurrentOutputform:="Stock Out"
		//DB_t_CurrentFormUsage:="Select"
		//Open_Pro_Window ("Select Stock Items";0;1;->[STOCK ITEMS];WIN_t_CurrentOutputform)
		//`FS_SetFormSort (WIN_t_CurrentOutputform)
		//WIn_SetFormSize (1;->[STOCK ITEMS];WIN_t_CurrentOutputform)
		//D`ISPLAY SELECTION([STOCK ITEMS];*)
		//DBI_MenuSelectRecords ("Stock items";True)
		DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])); True:C214)
		If ((OK=1) & (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0))
			Gen_Confirm("Add "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))+" Items to the Purchase Invoice?"; "Yes"; "No")
			If (OK=1)
				FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
				While (Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27])))
					RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					CREATE RECORD:C68([PURCHASE_INVOICE_ITEMS:158])
					[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
					[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
					[PURCHASE_INVOICE_ITEMS:158]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					[PURCHASE_INVOICE_ITEMS:158]Stock_Code:14:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
					[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
					[PURCHASE_INVOICE_ITEMS:158]Item_Number:12:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
					[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
					[PURCHASE_INVOICE_ITEMS:158]Quantity:2:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=1
					RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
					[PURCHASE_INVOICE_ITEMS:158]Description:13:=[PRODUCTS:9]Product_Name:2
					[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
					PurItems_ProdAc
					If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
						[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
					Else 
						If (<>PersAnOver)
							[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
						Else 
							If ([PRODUCTS:9]Analysis_Code:18#"")
								[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PRODUCTS:9]Analysis_Code:18
							Else 
								[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[TRANSACTION_TYPES:31]Analysis_Code:7
							End if 
						End if 
					End if 
					[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=DB_GetLedgerDefaultSalesTax
					//[purchases_items]Cost Price:=Gen_Round (([purchases_items]Cost Amount/
					//[purchases_items]Quantity);2;2)
					[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Gen_Round(DivideBy([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4; [PURCHASE_INVOICE_ITEMS:158]Quantity:2); 2; 2)  // 17/02/04 pb
					[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Quantity:2*[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2; 2)
					Purch_ItemCalc
					If ([STOCK_MOVEMENTS:40]Company_From:2#[PURCHASE_INVOICES:37]Company_Code:2)
						[PURCHASE_INVOICES:37]Company_Code:2:=[STOCK_MOVEMENTS:40]Company_From:2
						//`````DB_SaveRecord (->[STOCK MOVEMENTS])
					End if 
					DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End while 
			End if 
		End if 
		//DB_t_CurrentFormUsage:=""
		//Close_ProWin
	Else 
		Gen_Alert("No items found"; "Cancel")
	End if 
End if 
RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
vCompName:=[COMPANIES:2]Company_Name:2
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
Purch_InLPß("S1")
vTot:=1
vNo:=$No
ERR_MethodTrackerReturn("Purchase SMI"; $_t_oldMethodName)