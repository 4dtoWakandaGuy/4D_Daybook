//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 15:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MovementCodes; 0)
	C_LONGINT:C283($_l_MenuItem; $0; $1; $2; $3; vC; vPu; vPuButt; vSt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements_SelLP")

If (Count parameters:C259=0)
	$_l_MenuItem:=Sel_LPmi("Movements_SelLP")
Else 
	If ($1>0)
		$_l_MenuItem:=$1
		
	Else 
		$_l_MenuItem:=Sel_LPmi("Movements_SelLP")
	End if 
End if 
$0:=0
If ($_l_MenuItem>0)
	Case of 
		: ($_l_MenuItem=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Movt_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[STOCK_MOVEMENTS:40]Company_From:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Movt_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[STOCK_MOVEMENTS:40]Company_From:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Movt_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[STOCK_MOVEMENTS:40]Company_From:2; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($_l_MenuItem=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vPu; "Stock_SelP"; "one"; "Movt_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vPu; "Stock_SelP"; "one"; "Movt_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]Movement_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[STOCK_MOVEMENT_ITEMS:27]; ->vSt; ->vPu; "Stock_SelP"; "one"; "Movt_SelPvs"; ""; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]Movement_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=3)  //Purchase orders
			If (Count parameters:C259<2)
				If (Records in set:C195("Big One")>0)
					USE SET:C118("Big One")
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$BIGONE")
				Else 
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$BIGONE")
				End if 
				CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Big One")
				
				$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[PURCHASE_ORDERS:57]; ->vSt; ->vPu; "PurchOrd_SelP"; "Many"; "Movt_SelPvs"; ""; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
				If (OK=1)
					USE SET:C118("Big One")
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
					QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$ReturnedSelection")
					If (Records in set:C195("$BIGONE")>0)
						USE SET:C118("$BIGONE")
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "Big One")
					Else 
						CREATE EMPTY SET:C140([STOCK_MOVEMENTS:40]; "Big One")
					End if 
					USE SET:C118("$ReturnedSelection")
				End if 
				
				
			Else 
				If ($2=0) | ($2=2)
					//$0:=Sel_CrossTable (0;0;0;"PuMaster";"PuBig";->vPuButt;->[PURCHASE ORDERS];->vSt;->vPu;"PurchOrd_SelP";"Many";"Movt_SelPvs";"";[PURCHASE ORDERS]Purch Ord No->[STOCK ITEMS]Purchase_Order_Code$2;$3;$4;$5)
				Else 
					//pass -1
					//$0:=Sel_CrossTable (0;0;0;"PuMaster";"PuBig";->vPuButt;->[PURCHASE ORDERS];->vSt;->vPu;"PurchOrd_SelP";"Many";"Movt_SelPvs";"";[PURCHASE ORDERS]Purch Ord No->[STOCK ITEMS]Purchase_Order_Code;-1;$3;$4;$5)
					
				End if 
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("Movements_SelLP"; $_t_oldMethodName)
