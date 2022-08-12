//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 17:02:20If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $3; $mi; vC; vCalls; vD; vDButt; vJ; vO)
	C_LONGINT:C283(vOrd; vP)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName; $Layout; $_l_Mode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelLP")
If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Diary_SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
		
	Else 
		$mi:=Sel_LPmi("Diary_SelLP")
	End if 
	
End if 
$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[COMPANIES:2]; ->vC; ->vD; "Comp_SelP"; "Many"; "Diary_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[DIARY:12]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[COMPANIES:2]; ->vC; ->vD; "Comp_SelP"; "Many"; "Diary_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[DIARY:12]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[COMPANIES:2]; ->vC; ->vD; "Comp_SelP"; "Many"; "Diary_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[DIARY:12]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
		: ($mi=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[CONTACTS:1]; ->vO; ->vD; "Cont_SelP"; "Many"; "Diary_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[DIARY:12]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[CONTACTS:1]; ->vO; ->vD; "Cont_SelP"; "Many"; "Diary_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[DIARY:12]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[CONTACTS:1]; ->vO; ->vD; "Cont_SelP"; "Many"; "Diary_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[DIARY:12]Contact_Code:2; -1; $3; $4; $5)
				End if 
			End if 
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[PRODUCTS:9]; ->vP; ->vD; "Prod_SelP"; "Many"; "Diary_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[DIARY:12]Product_Code:13)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[PRODUCTS:9]; ->vP; ->vD; "Prod_SelP"; "Many"; "Diary_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[DIARY:12]Product_Code:13; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[PRODUCTS:9]; ->vP; ->vD; "Prod_SelP"; "Many"; "Diary_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[DIARY:12]Product_Code:13; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "DMaster"; "DBig"; ->vDButt; ->[ORDERS:24]; ->vOrd; ->vD; "Orders_SelP"; "Many"; "Diary_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[DIARY:12]Order_Code:26)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "DMaster"; "DBig"; ->vDButt; ->[ORDERS:24]; ->vOrd; ->vD; "Orders_SelP"; "Many"; "Diary_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[DIARY:12]Order_Code:26; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "DMaster"; "DBig"; ->vDButt; ->[ORDERS:24]; ->vOrd; ->vD; "Orders_SelP"; "Many"; "Diary_SelPvs"; ""; ->[ORDERS:24]Order_Code:3; ->[DIARY:12]Order_Code:26; -1; $3; $4; $5)
				End if 
			End if 
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(8; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vD; "Calls_SelP"; "Many"; "Diary_SelPvs"; ""; ->[SERVICE_CALLS:20]Call_Code:4; ->[DIARY:12]Call_Code:25)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(8; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vD; "Calls_SelP"; "Many"; "Diary_SelPvs"; ""; ->[SERVICE_CALLS:20]Call_Code:4; ->[DIARY:12]Call_Code:25; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(8; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[SERVICE_CALLS:20]; ->vCalls; ->vD; "Calls_SelP"; "Many"; "Diary_SelPvs"; ""; ->[SERVICE_CALLS:20]Call_Code:4; ->[DIARY:12]Call_Code:25; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($mi=6)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(9; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[JOBS:26]; ->vJ; ->vD; "Jobs_SelP"; "Many"; "Diary_SelPvs"; ""; ->[JOBS:26]Job_Code:1; ->[DIARY:12]Job_Code:19)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(9; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[JOBS:26]; ->vJ; ->vD; "Jobs_SelP"; "Many"; "Diary_SelPvs"; ""; ->[JOBS:26]Job_Code:1; ->[DIARY:12]Job_Code:19; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(9; 0; 0; "DMaster"; "DBig"; ->vDButt; ->[JOBS:26]; ->vJ; ->vD; "Jobs_SelP"; "Many"; "Diary_SelPvs"; ""; ->[JOBS:26]Job_Code:1; ->[DIARY:12]Job_Code:19; -1; $3; $4; $5)
				End if 
			End if 
			
			
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Diary_SelLP"; $_t_oldMethodName)