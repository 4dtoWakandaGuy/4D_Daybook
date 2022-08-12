//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_SelLP
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
	C_LONGINT:C283(vOrdi; vTButt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_SelLP")

$_l_Mode:=0
If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Calls_SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
	Else   // to allow this to be called with other parameters but not $1($1=-1)
		$mi:=Sel_LPmi("Calls_SelLP")
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
				$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vCalls; "Comp_SelP"; "Many"; "Calls_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[SERVICE_CALLS:20]Company_Code:1)
			Else 
				If ($2=0) | ($3=2)
					$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vCalls; "Comp_SelP"; "Many"; "Calls_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[SERVICE_CALLS:20]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vCalls; "Comp_SelP"; "Many"; "Calls_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[SERVICE_CALLS:20]Company_Code:1; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($mi=2)
			QV_bo_SearchDone:=False:C215
			QV_bo_KeepWindowsize:=True:C214
			CREATE EMPTY SET:C140([SERVICE_CALLS:20]; "QVTEMP")
			If (Count parameters:C259<3)
				QV_AdvancedSearch(Table:C252(->[SERVICE_CALLS:20]))
				//this returns a set
			Else 
				If ($2=0) | ($2=2)
					QV_AdvancedSearch(Table:C252(->[SERVICE_CALLS:20]); False:C215; $2; $4; $5)
				Else 
					QV_AdvancedSearch(Table:C252(->[SERVICE_CALLS:20]); False:C215; -1; $4; $5)
					
				End if 
				
			End if 
			If ($_l_Mode=0)
				USE SET:C118("QVTEMP")
				CLEAR SET:C117("QVTEMP")
				If (Records in selection:C76([SERVICE_CALLS:20])>0)
					$0:=1
					vAny:=1
					CREATE SET:C116([SERVICE_CALLS:20]; "Master")
				Else 
					If (QV_bo_SearchDone)
						If (Count parameters:C259<2)
							Gen_Alert("No Calls Found")
						End if 
					End if 
					
				End if 
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[CONTACTS:1]; ->vO; ->vCalls; "Cont_SelP"; "Many"; "Calls_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[SERVICE_CALLS:20]Contact_Code:2)
			Else 
				If ($2=0) | ($3=2)
					$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[CONTACTS:1]; ->vO; ->vCalls; "Cont_SelP"; "Many"; "Calls_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[SERVICE_CALLS:20]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "Master3"; "Big3"; ->vTButt; ->[CONTACTS:1]; ->vO; ->vCalls; "Cont_SelP"; "Many"; "Calls_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[SERVICE_CALLS:20]Contact_Code:2; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "Master3"; "Big3"; ->vTButt; ->[DIARY:12]; ->vD; ->vCalls; "Diary_SelP"; "One"; "Calls_SelPvs"; ""; ->[DIARY:12]Call_Code:25; ->[SERVICE_CALLS:20]Call_Code:4)
			Else 
				If ($2=0) | ($3=2)
					$0:=Sel_CrossTable(2; 0; 0; "Master3"; "Big3"; ->vTButt; ->[DIARY:12]; ->vD; ->vCalls; "Diary_SelP"; "One"; "Calls_SelPvs"; ""; ->[DIARY:12]Call_Code:25; ->[SERVICE_CALLS:20]Call_Code:4; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "Master3"; "Big3"; ->vTButt; ->[DIARY:12]; ->vD; ->vCalls; "Diary_SelP"; "One"; "Calls_SelPvs"; ""; ->[DIARY:12]Call_Code:25; ->[SERVICE_CALLS:20]Call_Code:4; -1; $3; $4; $5)
				End if 
			End if 
			
		: ($mi=5)
			If (Count parameters:C259<2)
				
				$0:=Sel_CrossTable(17; 13; 0; "Master3"; "Big3"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vCalls; "OrderI_SelP"; "One"; "Calls_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[SERVICE_CALLS:20]Call_Code:4)
			Else 
				If ($2=0) | ($3=2)
					$0:=Sel_CrossTable(17; 13; 0; "Master3"; "Big3"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vCalls; "OrderI_SelP"; "One"; "Calls_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[SERVICE_CALLS:20]Call_Code:4; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "Master3"; "Big3"; ->vTButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vCalls; "OrderI_SelP"; "One"; "Calls_SelPvs"; ""; ->[ORDER_ITEMS:25]Order_Code:1; ->[SERVICE_CALLS:20]Call_Code:4; -1; $3; $4; $5)
				End if 
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Calls_SelLP"; $_t_oldMethodName)