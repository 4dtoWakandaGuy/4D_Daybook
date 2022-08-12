//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2011 17:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(QV_bo_KeepWindowsize; QV_bo_SearchDone)
	C_LONGINT:C283($_l_MenuItem; $_l_Mode; $0; $1; $2; vAny; vC; vCalls; vCButt; vContr; vD)
	C_LONGINT:C283(vIn; vJ; vO; vOrd; vOrdi; vP; vPu; vTr)
	C_POINTER:C301($4; $5)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelLP")
//This needs to not use the absolut menu item number but get the menu..

$0:=0
If (Count parameters:C259=0)
	$_l_MenuItem:=Sel_LPmi("Comp_SelLP")
Else 
	If ($1>0)
		$_l_MenuItem:=$1
	Else 
		$_l_MenuItem:=Sel_LPmi("Comp_SelLP")
	End if 
	
End if 
If (Count parameters:C259>=2)
	$_l_Mode:=$2
End if 

If ($_l_MenuItem>0)
	Case of 
		: ($_l_MenuItem=1)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTACTS:1]; ->vO; ->vC; "Cont_SelP"; "Comp_SelFCont"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTACTS:1]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTACTS:1]; ->vO; ->vC; "Cont_SelP"; "Comp_SelFCont"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTACTS:1]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTACTS:1]; ->vO; ->vC; "Cont_SelP"; "Comp_SelFCont"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTACTS:1]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($_l_MenuItem=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMP")
			If (Count parameters:C259<2)
				QV_AdvancedSearch(Table:C252(->[COMPANIES:2]))
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[COMPANIES:2]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[COMPANIES:2]); False:C215; -1; $4; $5)
					
				End if 
			End if 
			//this returns a set
			If ($_l_Mode=0)
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([COMPANIES:2])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([COMPANIES:2]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)  // more parameters means we are running an auto search
							Gen_Alert("No Companies Found")
						End if 
					End if 
				End if 
			End if 
			
			// If (Check_ModMess (14))
			// NEXT PAGE
			//GOTO AREA(vDesc1)
			//  End if
		: ($_l_MenuItem=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[DIARY:12]; ->vD; ->vC; "Diary_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[DIARY:12]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[DIARY:12]; ->vD; ->vC; "Diary_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[DIARY:12]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[DIARY:12]; ->vD; ->vC; "Diary_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[DIARY:12]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($_l_MenuItem=4)
			If (Count parameters:C259<2)
				SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
				QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
				
				$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PRODUCTS_SUPPLIERS:148]; ->vP; ->vC; "Prod_SelP"; "Comp_SelFProd"; "Comp_SelPvs"; "Comp_SelSec"; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
				
			Else 
				If ($2=0) | ($2=2)
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
					
					$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PRODUCTS_SUPPLIERS:148]; ->vP; ->vC; "Prod_SelP"; "Comp_SelFProd"; "Comp_SelPvs"; "Comp_SelSec"; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
					
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PRODUCTS_SUPPLIERS:148]; ->vP; ->vC; "Prod_SelP"; "Comp_SelFProd"; "Comp_SelPvs"; "Comp_SelSec"; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDERS:24]; ->vOrd; ->vC; "Orders_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDERS:24]; ->vOrd; ->vC; "Orders_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDERS:24]; ->vOrd; ->vC; "Orders_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=6)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vC; "OrderI_SelP"; "Comp_SelFOI"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vC; "OrderI_SelP"; "Comp_SelFOI"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "CMaster"; "CBig"; ->vCButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vC; "OrderI_SelP"; "Comp_SelFOI"; "Comp_SelPvs"; "Comp_SelSec"; ->[ORDERS:24]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(18; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vC; "PurchOrd_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_ORDERS:57]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(18; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vC; "PurchOrd_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_ORDERS:57]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(18; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_ORDERS:57]; ->vPu; ->vC; "PurchOrd_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_ORDERS:57]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=8)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(4; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[INVOICES:39]; ->vIn; ->vC; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[INVOICES:39]Company_Code:2; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(4; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[INVOICES:39]; ->vIn; ->vC; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[INVOICES:39]Company_Code:2; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(4; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[INVOICES:39]; ->vIn; ->vC; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[INVOICES:39]Company_Code:2; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=9)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(5; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_INVOICES:37]; ->vPu; ->vC; "Purchases_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(5; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_INVOICES:37]; ->vPu; ->vC; "Purchases_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(5; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[PURCHASE_INVOICES:37]; ->vPu; ->vC; "Purchases_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=10)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(6; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[TRANSACTIONS:29]; ->vTr; ->vC; "Trans_Sel"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[TRANSACTIONS:29]Company_Code:9; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(6; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[TRANSACTIONS:29]; ->vTr; ->vC; "Trans_Sel"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[TRANSACTIONS:29]Company_Code:9; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(6; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[TRANSACTIONS:29]; ->vTr; ->vC; "Trans_Sel"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[TRANSACTIONS:29]Company_Code:9; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=11)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTRACTS:17]; ->vContr; ->vC; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTRACTS:17]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTRACTS:17]; ->vContr; ->vC; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTRACTS:17]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[CONTRACTS:17]; ->vContr; ->vC; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[CONTRACTS:17]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($_l_MenuItem=12)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vC; "Calls_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[SERVICE_CALLS:20]Company_Code:1; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vC; "Calls_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[SERVICE_CALLS:20]Company_Code:1; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(8; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vC; "Calls_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[SERVICE_CALLS:20]Company_Code:1; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($_l_MenuItem=13)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(9; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[JOBS:26]; ->vJ; ->vC; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[JOBS:26]Company_Code:3; ->[COMPANIES:2]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(9; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[JOBS:26]; ->vJ; ->vC; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[JOBS:26]Company_Code:3; ->[COMPANIES:2]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(9; 0; 0; "CMaster"; "CBig"; ->vCButt; ->[JOBS:26]; ->vJ; ->vC; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Comp_SelSec"; ->[JOBS:26]Company_Code:3; ->[COMPANIES:2]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Comp_SelLP"; $_t_oldMethodName)