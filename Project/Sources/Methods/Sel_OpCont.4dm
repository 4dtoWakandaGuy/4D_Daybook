//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_OpCont
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

$_t_oldMethodName:=ERR_MethodTracker("Sel_OpCont")
Menu_Record("Sel_OpCont"; "Contains")
Sel_OpGen("@")
ERR_MethodTrackerReturn("Sel_OpCont"; $_t_oldMethodName)