//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InLPTerm
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPTerm")
If ([JOBS:26]Terms:14="")
	[JOBS:26]Terms:14:=[COMPANIES:2]SL_Terms:40
Else 
	If ([COMPANIES:2]SL_Terms:40#"")
		Gen_Confirm("The Company's Terms are "+[COMPANIES:2]SL_Terms:40+".  Change to these Terms?"; "Yes"; "No")
		If (OK=1)
			[JOBS:26]Terms:14:=[COMPANIES:2]SL_Terms:40
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_InLPTerm"; $_t_oldMethodName)