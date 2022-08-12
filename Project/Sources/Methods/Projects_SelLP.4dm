//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_SelLP
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
	C_LONGINT:C283($_l_MenuItem; $0; $1; vA; vC; vJButt; vO)
	C_POINTER:C301($4; $5)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_SelLP")

If (Count parameters:C259=0)
	
Else 
	
	If ($1>0)
		$_l_MenuItem:=$1
	Else 
		$_l_MenuItem:=Sel_LPmi("Projects_SelLP")
		
	End if 
End if 
$0:=0
If ($_l_MenuItem>0)
	Case of 
		: ($_l_MenuItem=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vA; "Comp_SelP"; "Many"; "Projects_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PROJECTS:89]Company_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vA; "Comp_SelP"; "Many"; "Projects_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PROJECTS:89]Company_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vA; "Comp_SelP"; "Many"; "Projects_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[PROJECTS:89]Company_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($_l_MenuItem=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vA; "Cont_SelP"; "Many"; "Projects_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[PROJECTS:89]Contact_Code:4)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vA; "Cont_SelP"; "Many"; "Projects_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[PROJECTS:89]Contact_Code:4; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; "ABig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vA; "Cont_SelP"; "Many"; "Projects_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[PROJECTS:89]Contact_Code:4; -1; $3; $4; $5)
				End if 
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("Projects_SelLP"; $_t_oldMethodName)
