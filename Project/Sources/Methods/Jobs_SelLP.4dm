//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_SelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 16:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $3; $mi; vA; vC; vJ; vJButt; vO)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_SelLP")


If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Jobs_SelLP")
Else 
	If ($1>0)
		$Mi:=$1
		
	Else 
		$mi:=Sel_LPmi("Jobs_SelLP")
	End if 
End if 
$0:=0
If ($mi>0)
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vJ; "Comp_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[JOBS:26]Company_Code:3)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vJ; "Comp_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[JOBS:26]Company_Code:3; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[COMPANIES:2]; ->vC; ->vJ; "Comp_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[COMPANIES:2]Company_Code:1; ->[JOBS:26]Company_Code:3; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vJ; "Cont_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[JOBS:26]Contact_Code:4)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vJ; "Cont_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[JOBS:26]Contact_Code:4; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[CONTACTS:1]; ->vO; ->vJ; "Cont_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[CONTACTS:1]Contact_Code:2; ->[JOBS:26]Contact_Code:4; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[PROJECTS:89]; ->vA; ->vJ; "Projects_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[PROJECTS:89]Project_Code:1; ->[JOBS:26]Project_Code:27)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[PROJECTS:89]; ->vA; ->vJ; "Projects_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[PROJECTS:89]Project_Code:1; ->[JOBS:26]Project_Code:27; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "JMaster"; "JBig"; ->vJButt; ->[PROJECTS:89]; ->vA; ->vJ; "Projects_SelP"; "Many"; "Jobs_SelPvs"; ""; ->[PROJECTS:89]Project_Code:1; ->[JOBS:26]Project_Code:27; -1; $3; $4; $5)
				End if 
				
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Jobs_SelLP"; $_t_oldMethodName)