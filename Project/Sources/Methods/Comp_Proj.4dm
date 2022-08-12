//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Proj
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
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_Proj")
//SEARCH([COMPANIES];[COMPANIES]Company Name=$1;*)
//SEARCH([COMPANIES]; | ;[COMPANIES]Also Known As=$1)
Comp_Sel3($1)
If (Records in selection:C76([COMPANIES:2])>0)
	MESSAGES OFF:C175
	// PROJECT SELECTION($2»)
	Project_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; Table:C252(Table:C252($2)); $2)
	MESSAGES ON:C181
End if 
ERR_MethodTrackerReturn("Comp_Proj"; $_t_oldMethodName)