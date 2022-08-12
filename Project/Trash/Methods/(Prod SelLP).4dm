//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 15:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(QV_bo_KeepWindowsize; QV_bo_SearchDone)
	C_LONGINT:C283($_l_Mode; $0; $1; $2; $3; $mi; vAButt; vAny; vC; vD; vOrdi)
	C_LONGINT:C283(vP; vPu; vSt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Prod_SelLP")
	
Else 
	
	If ($1>0)
		$Mi:=$1
	Else 
		$mi:=Sel_LPmi("Prod_SelLP")
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
				//Because the set 'bigone' is in products we must copy it and create one in product suppliers
				If (Records in set:C195("Big One")>0)
					USE SET:C118("Big One")
					CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
				Else 
					CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
				End if 
				CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "Big One")
				CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "ABigPCSup")
				$0:=Sel_CrossTable(0; 0; 0; "AMasterPC"; "ABigPCSup"; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; "Prod_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
				
				If (OK=1)
					USE SET:C118("Big One")
					SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					CREATE SET:C116([PRODUCTS:9]; "$ReturnedSelection")
					If (Records in set:C195("$BIGONE")>0)
						USE SET:C118("$BIGONE")
						CREATE SET:C116([PRODUCTS:9]; "Big One")
					Else 
						CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
					End if 
					USE SET:C118("$ReturnedSelection")
					
					Sel_SetAny3("ABig"; ->vAButt; ->[PRODUCTS:9])
				Else 
					If (Records in set:C195("$BIGONE")>0)
						USE SET:C118("$BIGONE")
						CREATE SET:C116([PRODUCTS:9]; "Big One")
					Else 
						CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
					End if 
				End if 
				
			Else 
				If ($2=0) | ($2=2)
					If (Records in set:C195("Big One")>0)
						USE SET:C118("Big One")
						CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
					Else 
						CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
					End if 
					CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "Big One")
					CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "ABigPCSup")
					$0:=Sel_CrossTable(0; 0; 0; "AMasterPC"; "ABigPCSup"; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; "Prod_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; $2; $3; $4; $5)
					If (OK=1)
						USE SET:C118("Big One")
						SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						CREATE SET:C116([PRODUCTS:9]; "$ReturnedSelection")
						If (Records in set:C195("$BIGONE")>0)
							USE SET:C118("$BIGONE")
							CREATE SET:C116([PRODUCTS:9]; "Big One")
						Else 
							CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
						End if 
						USE SET:C118("$ReturnedSelection")
						Sel_SetAny3("ABig"; ->vAButt; ->[PRODUCTS:9])
					Else 
						If (Records in set:C195("$BIGONE")>0)
							USE SET:C118("$BIGONE")
							CREATE SET:C116([PRODUCTS:9]; "Big One")
						Else 
							CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
						End if 
					End if 
				Else 
					//pass -1
					If (Records in set:C195("Big One")>0)
						USE SET:C118("Big One")
						CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
					Else 
						CREATE SET:C116([PRODUCTS:9]; "$BIGONE")
					End if 
					CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "Big One")
					CREATE EMPTY SET:C140([PRODUCTS_SUPPLIERS:148]; "ABigPCSup")
					$0:=Sel_CrossTable(0; 0; 0; "AMasterPC"; "ABigPCSup"; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; "Prod_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; -1; $3; $4; $5)
					If (OK=1)
						USE SET:C118("Big One")
						SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						CREATE SET:C116([PRODUCTS:9]; "$ReturnedSelection")
						If (Records in set:C195("$BIGONE")>0)
							USE SET:C118("$BIGONE")
							CREATE SET:C116([PRODUCTS:9]; "Big One")
						Else 
							CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
						End if 
						USE SET:C118("$ReturnedSelection")
						
						Sel_SetAny3("Abig"; ->vAButt; ->[PRODUCTS:9])
					Else 
						If (Records in set:C195("$BIGONE")>0)
							USE SET:C118("$BIGONE")
							CREATE SET:C116([PRODUCTS:9]; "Big One")
						Else 
							CREATE EMPTY SET:C140([PRODUCTS:9]; "Big One")
						End if 
						
					End if 
				End if 
				
			End if 
			
			
		: ($mi=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			CREATE EMPTY SET:C140([PRODUCTS:9]; "QVTEMP")
			If (Count parameters:C259<2)
				QV_AdvancedSearch(Table:C252(->[PRODUCTS:9]))
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[PRODUCTS:9]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[PRODUCTS:9]); False:C215; -1; $4; $5)
					
				End if 
			End if 
			//this returns a set
			If ($_l_Mode=0)
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([PRODUCTS:9])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([PRODUCTS:9]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							Gen_Alert("No Products Found")
						End if 
					End if 
				End if 
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; "Prod_SelPvs"; ""; ->[DIARY:12]Product_Code:13; ->[PRODUCTS:9]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; "Prod_SelPvs"; ""; ->[DIARY:12]Product_Code:13; ->[PRODUCTS:9]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; "Prod_SelPvs"; ""; ->[DIARY:12]Product_Code:13; ->[PRODUCTS:9]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "AMaster"; "ABig"; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; "Prod_SelPvs"; ""; ->[ORDER_ITEMS:25]Product_Code:2; ->[PRODUCTS:9]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; "ABig"; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; "Prod_SelPvs"; ""; ->[ORDER_ITEMS:25]Product_Code:2; ->[PRODUCTS:9]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; "ABig"; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; "Prod_SelPvs"; ""; ->[ORDER_ITEMS:25]Product_Code:2; ->[PRODUCTS:9]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vP; "Stock_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[PRODUCTS:9]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vP; "Stock_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vP; "Stock_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=6)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[CURRENT_STOCK:62]; ->vPu; ->vP; "StockCurr_SelP"; "One"; "Prod_SelPvs"; ""; ->[CURRENT_STOCK:62]Product_Code:1; ->[PRODUCTS:9]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[CURRENT_STOCK:62]; ->vPu; ->vP; "StockCurr_SelP"; "One"; "Prod_SelPvs"; ""; ->[CURRENT_STOCK:62]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[CURRENT_STOCK:62]; ->vPu; ->vP; "StockCurr_SelP"; "One"; "Prod_SelPvs"; ""; ->[CURRENT_STOCK:62]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_LEVELS:58]; ->vPu; ->vP; "StockLev_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_LEVELS:58]Product_Code:1; ->[PRODUCTS:9]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_LEVELS:58]; ->vPu; ->vP; "StockLev_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_LEVELS:58]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(7; 0; 0; "AMaster"; "ABig"; ->vAButt; ->[STOCK_LEVELS:58]; ->vPu; ->vP; "StockLev_SelP"; "One"; "Prod_SelPvs"; ""; ->[STOCK_LEVELS:58]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("Prod_SelLP"; $_t_oldMethodName)
