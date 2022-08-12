//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/08/2012 09:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(QV_bo_KeepWindowsize; QV_bo_SearchDone; QV_bo_SearchDone)
	C_LONGINT:C283($0; $1; $2; $3; $mi; $_l_Mode; vAny; vCalls; vIn; vOIButt; vOrd)
	C_LONGINT:C283(vOrdI; vP; vPu)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("OrderI_SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
		If ($mi=6)
			$mi:=7
		End if 
		
	Else 
		$mi:=Sel_LPmi("Jobs_SelLP")
	End if 
End if 
If (Count parameters:C259>1)
	$_l_Mode:=$2
End if 

$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PRODUCTS:9]; ->vP; ->vOrdI; "Prod_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[ORDER_ITEMS:25]Product_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PRODUCTS:9]; ->vP; ->vOrdI; "Prod_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[ORDER_ITEMS:25]Product_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PRODUCTS:9]; ->vP; ->vOrdI; "Prod_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[ORDER_ITEMS:25]Product_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "QVTEMP")
			If (Count parameters:C259<2)
				QV_AdvancedSearch(Table:C252(->[ORDER_ITEMS:25]))
				//this returns a set
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[ORDER_ITEMS:25]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[ORDER_ITEMS:25]); False:C215; -1; $4; $5)
					
				End if 
			End if 
			If ($_l_Mode=0)
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([ORDER_ITEMS:25]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							Gen_Alert("No Order items Found")
						End if 
					End if 
				End if 
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(17; 13; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[ORDERS:24]; ->vOrd; ->vOrdI; "Orders_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]Order_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[ORDERS:24]; ->vOrd; ->vOrdI; "Orders_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]Order_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[ORDERS:24]; ->vOrd; ->vOrdI; "Orders_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]Order_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[INVOICES:39]; ->vIn; ->vOrdI; "Invoices_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[ORDER_ITEMS:25]Invoice_Number:17)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[INVOICES:39]; ->vIn; ->vOrdI; "Invoices_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[ORDER_ITEMS:25]Invoice_Number:17; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[INVOICES:39]; ->vIn; ->vOrdI; "Invoices_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[ORDER_ITEMS:25]Invoice_Number:17; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vOrdI; "PurchOrd_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[ORDER_ITEMS:25]Purchase_Order_Number:18)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vOrdI; "PurchOrd_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[ORDER_ITEMS:25]Purchase_Order_Number:18; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vOrdI; "PurchOrd_SelP"; "Many"; "OrderI_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[ORDER_ITEMS:25]Purchase_Order_Number:18; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(36; 0; 0; "OIMaster"; "OIBig"; ->vOIButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrdI; "Subscript_SelP"; "One"; "OrderI_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDER_ITEMS:25]Item_Number:27; -1; $3; $4; $5)
				End if 
				
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("OrderI_SelLP"; $_t_oldMethodName)