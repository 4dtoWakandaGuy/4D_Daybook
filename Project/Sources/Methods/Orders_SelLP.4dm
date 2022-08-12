//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_SelLP
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
	C_LONGINT:C283($0; $1; $2; $3; $mi; $_l_Mode; vAny; vC; vCalls; vD; vO)
	C_LONGINT:C283(vOrButt; vOrd; vOrdi)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Orders_SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
		If ($mi=6)
			$mi:=7
		End if 
	Else 
		$mi:=Sel_LPmi("Orders_SelLP")
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
				$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[COMPANIES:2]; ->vC; ->vOrd; "Comp_SelP"; "Many"; "Orders_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[ORDERS:24]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[COMPANIES:2]; ->vC; ->vOrd; "Comp_SelP"; "Many"; "Orders_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[ORDERS:24]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[COMPANIES:2]; ->vC; ->vOrd; "Comp_SelP"; "Many"; "Orders_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[ORDERS:24]Company_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			CREATE EMPTY SET:C140([ORDERS:24]; "QVTEMP")
			If (Count parameters:C259<2)
				QV_AdvancedSearch(Table:C252(->[ORDERS:24]))
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[ORDERS:24]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[ORDERS:24]); False:C215; -1; $4; $5)
					
				End if 
			End if 
			
			//this returns a set
			If ($_l_Mode=0)
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([ORDERS:24])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([ORDERS:24]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							Gen_Alert("No Orders Found")
						End if 
					End if 
				End if 
			End if 
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[CONTACTS:1]; ->vO; ->vOrd; "Cont_SelP"; "Many"; "Orders_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[ORDERS:24]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[CONTACTS:1]; ->vO; ->vOrd; "Cont_SelP"; "Many"; "Orders_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[ORDERS:24]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[CONTACTS:1]; ->vO; ->vOrd; "Cont_SelP"; "Many"; "Orders_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[ORDERS:24]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[DIARY:12]; ->vD; ->vOrd; "Diary_SelP"; "One"; "Orders_SelPvs"; ""; ->[DIARY:12]Order_Code:26; ->[ORDERS:24]Order_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[DIARY:12]; ->vD; ->vOrd; "Diary_SelP"; "One"; "Orders_SelPvs"; ""; ->[DIARY:12]Order_Code:26; ->[ORDERS:24]Order_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[DIARY:12]; ->vD; ->vOrd; "Diary_SelP"; "One"; "Orders_SelPvs"; ""; ->[DIARY:12]Order_Code:26; ->[ORDERS:24]Order_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vOrd; "OrderI_SelP"; "One"; "Orders_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]Order_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vOrd; "OrderI_SelP"; "One"; "Orders_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]Order_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vOrd; "OrderI_SelP"; "One"; "Orders_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]Order_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(36; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrd; "Subscript_SelP"; "Orders_SelSub"; "Orders_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDERS:24]Order_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(36; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrd; "Subscript_SelP"; "Orders_SelSub"; "Orders_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDERS:24]Order_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(36; 0; 0; "OrMaster"; "OrBig"; ->vOrButt; ->[SUBSCRIPTIONS:93]; ->vCalls; ->vOrd; "Subscript_SelP"; "Orders_SelSub"; "Orders_SelPvs"; ""; ->[SUBSCRIPTIONS:93]Order_Item_Number:4; ->[ORDERS:24]Order_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Orders_SelLP"; $_t_oldMethodName)