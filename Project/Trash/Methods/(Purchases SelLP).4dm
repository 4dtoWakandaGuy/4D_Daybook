//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_SelLP
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
	C_LONGINT:C283($0; $1; $2; $3; $mi; vC; vPu; vPuButt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Purchases_SelLP")
Else 
	If ($1>0)
		$Mi:=$1
	Else 
		$mi:=Sel_LPmi("Purchases_SelLP")
	End if 
	
End if 
$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Purch_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PURCHASE_INVOICES:37]Company_Code:2)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Purch_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PURCHASE_INVOICES:37]Company_Code:2; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "PuMaster"; "PuBig"; ->vPuButt; ->[COMPANIES:2]; ->vC; ->vPu; "Comp_SelP"; "Many"; "Purch_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PURCHASE_INVOICES:37]Company_Code:2; -1; $3; $4; $5)
				End if 
				
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("Purchases_SelLP"; $_t_oldMethodName)