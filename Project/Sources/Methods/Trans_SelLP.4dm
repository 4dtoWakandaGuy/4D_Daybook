//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $3; $mi; vC; vIn; vTButt; vTr)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Trans_SelLP")
Else 
	If ($1>0)
		$Mi:=$1
	Else 
		$mi:=Sel_LPmi("Trans_SelLP")
	End if 
End if 

$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vTr; "Comp_SelP"; "Many"; "Trans_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[TRANSACTIONS:29]Company_Code:9)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vTr; "Comp_SelP"; "Many"; "Trans_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[TRANSACTIONS:29]Company_Code:9; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[COMPANIES:2]; ->vC; ->vTr; "Comp_SelP"; "Many"; "Trans_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[TRANSACTIONS:29]Company_Code:9; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(4; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[INVOICES:39]; ->vIn; ->vTr; "Invoices_SelP"; "Many"; "Trans_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[TRANSACTIONS:29]Invoice_Number:4)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(4; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[INVOICES:39]; ->vIn; ->vTr; "Invoices_SelP"; "Many"; "Trans_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[TRANSACTIONS:29]Invoice_Number:4; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(4; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[INVOICES:39]; ->vIn; ->vTr; "Invoices_SelP"; "Many"; "Trans_SelPvs"; ""; ->[INVOICES:39]Invoice_Number:1; ->[TRANSACTIONS:29]Invoice_Number:4; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ACCOUNTS:32]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[ACCOUNTS:32]Account_Code:2; ->[TRANSACTIONS:29]Account_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ACCOUNTS:32]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[ACCOUNTS:32]Account_Code:2; ->[TRANSACTIONS:29]Account_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ACCOUNTS:32]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[ACCOUNTS:32]Account_Code:2; ->[TRANSACTIONS:29]Account_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PERIODS:33]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[PERIODS:33]Period_Code:1; ->[TRANSACTIONS:29]Period_Code:12)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PERIODS:33]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[PERIODS:33]Period_Code:1; ->[TRANSACTIONS:29]Period_Code:12; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PERIODS:33]; ->OK; ->vTr; "Search"; "Many"; "Trans_SelPvs"; ""; ->[PERIODS:33]Period_Code:1; ->[TRANSACTIONS:29]Period_Code:12; -1; $3; $4; $5)
				End if 
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("Trans_SelLP"; $_t_oldMethodName)