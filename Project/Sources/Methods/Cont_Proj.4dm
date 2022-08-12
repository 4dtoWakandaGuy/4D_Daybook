//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_Proj
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

$_t_oldMethodName:=ERR_MethodTracker("Cont_Proj")
MESSAGES OFF:C175
Cont_SelFS($1)
If (Records in selection:C76([CONTACTS:1])>0)
	Project_SelFast(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; Table:C252(Table:C252($2)); $2)
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Cont_Proj"; $_t_oldMethodName)