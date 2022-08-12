//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 16:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $3; $mi; vOrdI; vP; vPu; vSt; vTButt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Stock_SelLP")
Else 
	If ($1>0)
		$Mi:=$1
	Else 
		$mi:=Sel_LPmi("Stock_SelLP")
	End if 
	
End if 
$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vSt; "Prod_SelP"; "Many"; "Stock_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vSt; "Prod_SelP"; "Many"; "Stock_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vSt; "Prod_SelP"; "Many"; "Stock_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[STOCK_MOVEMENTS:40]; ->vPu; ->vSt; "Movements_SelP"; "One"; "Stock_SelPvs"; ""; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[STOCK_MOVEMENTS:40]; ->vPu; ->vSt; "Movements_SelP"; "One"; "Stock_SelPvs"; ""; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[STOCK_MOVEMENTS:40]; ->vPu; ->vSt; "Movements_SelP"; "One"; "Stock_SelPvs"; ""; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=3)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdI; ->vPu; "OrderI_SelP"; "many"; "Stock_SelPvs"; ""; ->[ORDER_ITEMS:25]Item_Number:27; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdI; ->vPu; "OrderI_SelP"; "many"; "Stock_SelPvs"; ""; ->[ORDER_ITEMS:25]Item_Number:27; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdI; ->vPu; "OrderI_SelP"; "many"; "Stock_SelPvs"; ""; ->[ORDER_ITEMS:25]Item_Number:27; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; -1; $3; $4; $5)
				End if 
			End if 
		: ($mi=4)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vPu; "PurchOrd_SelP"; "many"; "Stock_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
				
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vPu; "PurchOrd_SelP"; "many"; "Stock_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vPu; "PurchOrd_SelP"; "many"; "Stock_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; -1; $3; $4; $5)
					
				End if 
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("Stock_SelLP"; $_t_oldMethodName)