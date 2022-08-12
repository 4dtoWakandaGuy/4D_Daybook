//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_SelFCont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MultiCo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelFCont")
If (<>MultiCo)
	Comp_SelMCRel
	INTERSECTION:C121("Extra"; "CMaster"; "CMaster")
	CREATE SET:C116([COMPANIES:2]; "Master")
Else 
	Load_OneFast(->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "CMaster")
End if 
ERR_MethodTrackerReturn("Comp_SelFCont"; $_t_oldMethodName)