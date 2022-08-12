//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_Beginning2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo; vPage)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Beginning2")
vPage:=vPage+1
If (Count parameters:C259>=2)
	vNo:=Records in table:C83($2->)
	Sel_Beginning3($2)
Else 
	Gen_Alert("This method(Sel_Beginning2) has been modified and requres 2  parameters")
	
End if 
ERR_MethodTrackerReturn("Sel_Beginning2"; $_t_oldMethodName)
