//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_Or
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
	C_LONGINT:C283(SRCH_l_or)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Or")
Menu_Record("Sel_Or"; "Or ...")
//SRCH_l_And:=2
SRCH_l_or:=1
ACCEPT:C269
ERR_MethodTrackerReturn("Sel_Or"; $_t_oldMethodName)