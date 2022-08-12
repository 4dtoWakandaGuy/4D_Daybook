//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_SelLP
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
	C_LONGINT:C283($0; $1; $2; $3; $mi; $_l_Mode; vAny; vC; vCalls; vContr; vD)
	C_LONGINT:C283(vIn; vJ; vO; vOButt; vOrd; vOrdi)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Cont_SelLP")
	
Else 
	
	If ($1>0)
		$Mi:=$1
	Else 
		$mi:=Sel_LPmi("Cont_SelLP")
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
				$0:=Sel_CrossTable(0; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[COMPANIES:2]; ->vC; ->vO; "Comp_SelP"; "Cont_SelFComp"; "Comp_SelPvs"; "Cont_SelPvs"; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[COMPANIES:2]; ->vC; ->vO; "Comp_SelP"; "Cont_SelFComp"; "Comp_SelPvs"; "Cont_SelPvs"; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[COMPANIES:2]; ->vC; ->vO; "Comp_SelP"; "Cont_SelFComp"; "Comp_SelPvs"; "Cont_SelPvs"; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]Company_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			
			CREATE EMPTY SET:C140([CONTACTS:1]; "QVTEMP")
			If (Count parameters:C259<2)
				QV_AdvancedSearch(Table:C252(->[CONTACTS:1]))
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[CONTACTS:1]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[CONTACTS:1]); False:C215; -1; $4; $5)
					
				End if 
			End if 
			If ($_l_Mode=0)
				//this returns a set
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([CONTACTS:1])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([CONTACTS:1]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							Gen_Alert("No Contacts Found")
						End if 
					End if 
				End if 
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[DIARY:12]; ->vD; ->vO; "Diary_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[DIARY:12]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[DIARY:12]; ->vD; ->vO; "Diary_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[DIARY:12]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[DIARY:12]; ->vD; ->vO; "Diary_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[DIARY:12]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDERS:24]; ->vOrd; ->vO; "Orders_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDERS:24]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDERS:24]; ->vOrd; ->vO; "Orders_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDERS:24]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDERS:24]; ->vOrd; ->vO; "Orders_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDERS:24]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vO; "OrderI_SelP"; "Cont_SelFOI"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDER_ITEMS:25]Order_Code:1; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vO; "OrderI_SelP"; "Cont_SelFOI"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDER_ITEMS:25]Order_Code:1; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "OMaster"; "OBig"; ->vOButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vO; "OrderI_SelP"; "Cont_SelFOI"; "Comp_SelPvs"; "Cont_SelPvs"; ->[ORDER_ITEMS:25]Order_Code:1; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
		: ($mi=6)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(4; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[INVOICES:39]; ->vIn; ->vO; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[INVOICES:39]Contact_Code:3; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(4; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[INVOICES:39]; ->vIn; ->vO; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[INVOICES:39]Contact_Code:3; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(4; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[INVOICES:39]; ->vIn; ->vO; "Invoices_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[INVOICES:39]Contact_Code:3; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
		: ($mi=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[CONTRACTS:17]; ->vContr; ->vO; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[CONTRACTS:17]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[CONTRACTS:17]; ->vContr; ->vO; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[CONTRACTS:17]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[CONTRACTS:17]; ->vContr; ->vO; "Contracts_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[CONTRACTS:17]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
		: ($mi=8)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vO; "Calls_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[SERVICE_CALLS:20]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vO; "Calls_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[SERVICE_CALLS:20]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(8; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vO; "Calls_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[SERVICE_CALLS:20]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=9)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(9; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[JOBS:26]; ->vJ; ->vO; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[JOBS:26]Contact_Code:4; ->[CONTACTS:1]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(9; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[JOBS:26]; ->vJ; ->vO; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[JOBS:26]Contact_Code:4; ->[CONTACTS:1]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(9; 0; 0; "OMaster"; "OBig"; ->vOButt; ->[JOBS:26]; ->vJ; ->vO; "Jobs_SelP"; "One"; "Comp_SelPvs"; "Cont_SelPvs"; ->[JOBS:26]Contact_Code:4; ->[CONTACTS:1]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Cont_SelLP"; $_t_oldMethodName)