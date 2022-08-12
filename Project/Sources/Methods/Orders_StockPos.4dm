//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_StockPos
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>StockPostOr; ORD_bo_IsRevision)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_t_RecordNumber; vAB)
	C_TEXT:C284($_t_CurrentFOrmUsage2; $_t_InvoiceNumber; $_t_oldMethodName; $1; $2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_StockPos")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		$_t_CurrentFOrmUsage2:=DB_t_CurrentFormUsage2
		If (Count parameters:C259>=1)
			$_t_InvoiceNumber:=$1
		Else 
			$_t_InvoiceNumber:=""
		End if 
		Menu_Record("Orders_StockPos"; "Delivery-Type Stock Movt")
		If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
			DB_t_CurrentFormUsage:="ID"
			READ WRITE:C146([ORDERS:24])
			READ WRITE:C146([ORDER_ITEMS:25])
			READ WRITE:C146([STOCK_MOVEMENTS:40])
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			READ WRITE:C146([CURRENT_STOCK:62])
			READ WRITE:C146([STOCK_LEVELS:58])
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			READ WRITE:C146([TRANSACTIONS:29])
			READ WRITE:C146([ACCOUNT_BALANCES:34])
			If ((DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostOr))
				Gen_Confirm("Do you want to post Items as a Delivery-Type Stock Movement?"; "Yes"; "No")
				If (OK=1)
					If ($_t_InvoiceNumber="")
						$_t_InvoiceNumber:=Substring:C12(Gen_Request("Invoice No/Delivery Date to repost:"); 1; 11)
					End if 
					If ((OK=1) & ($_t_InvoiceNumber#"00/00/00") & ($_t_InvoiceNumber#""))
						//DB_t_CurrentFormUsage2:="NC"
						DB_t_CurrentFormUsage2:=""
						DB_SaveRecord(->[ORDERS:24])
						AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
						$_t_RecordNumber:=Record number:C243([ORDERS:24])
						CUT NAMED SELECTION:C334([ORDERS:24]; "$Orders")
						GOTO RECORD:C242([ORDERS:24]; $_t_RecordNumber)
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=$_t_InvoiceNumber)
						If (Count parameters:C259>=2)  //use a subselection
							CREATE SET:C116([ORDER_ITEMS:25]; "Temp")
							USE SET:C118($2)
							INTERSECTION:C121($2; "Temp"; "Temp")
							USE SET:C118("Temp")
						End if 
						If (Records in selection:C76([ORDER_ITEMS:25])=0)
							$_d_Date:=Date:C102($_t_InvoiceNumber)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Delivery_Date:11=$_d_Date)
						End if 
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
							QUERY SELECTION BY FORMULA:C207([STOCK_MOVEMENT_ITEMS:27]; Orders_StockSel)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
								OrdDel_StockP
							Else 
								Gen_Alert("Those items have already been posted"; "Cancel")
							End if 
						Else 
							Gen_Alert("No Order Items found"; "Cancel")
						End if 
						// DB_t_CurrentFormUsage2:=""
						USE NAMED SELECTION:C332("$Orders")
						Orders_InLPOI(vAB)
					End if 
				End if 
			End if 
		End if 
		DB_t_CurrentFormUsage2:=$_t_CurrentFOrmUsage2
	Else 
		Gen_Alert("This function can only be used when viewing order items")
		
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_StockPos"; $_t_oldMethodName)
