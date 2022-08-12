//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_And
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
	C_LONGINT:C283(SRCH_l_And)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_And")
Menu_Record("Sel_And"; "And ...")
SRCH_l_And:=1
ACCEPT:C269
ERR_MethodTrackerReturn("Sel_And"; $_t_oldMethodName)