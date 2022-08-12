//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contracts_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $3; $mi; vC; vContr; vJButt; vO)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_SelLP")



If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Contracts_SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
		If ($mi=2)  //2 on the menu is information contacts are 3
			$Mi:=3
		End if 
	Else 
		$mi:=Sel_LPmi("Contracts_SelLP")
	End if 
End if 
$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vContr; "Comp_SelP"; "Many"; "Contracts_SelPv"; ""; ->[COMPANIES:2]Company_Code:1; ->[CONTRACTS:17]Company_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vContr; "Comp_SelP"; "Many"; "Contracts_SelPv"; ""; ->[COMPANIES:2]Company_Code:1; ->[CONTRACTS:17]Company_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vContr; "Comp_SelP"; "Many"; "Contracts_SelPv"; ""; ->[COMPANIES:2]Company_Code:1; ->[CONTRACTS:17]Company_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vContr; "Cont_SelP"; "Many"; "Contracts_SelPv"; ""; ->[CONTACTS:1]Contact_Code:2; ->[CONTRACTS:17]Contact_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vContr; "Cont_SelP"; "Many"; "Contracts_SelPv"; ""; ->[CONTACTS:1]Contact_Code:2; ->[CONTRACTS:17]Contact_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vContr; "Cont_SelP"; "Many"; "Contracts_SelPv"; ""; ->[CONTACTS:1]Contact_Code:2; ->[CONTRACTS:17]Contact_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("Contracts_SelLP"; $_t_oldMethodName)