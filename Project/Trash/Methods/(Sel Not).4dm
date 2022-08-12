//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel Not
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
	C_LONGINT:C283(SRCH_l_Not)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel Not")
Menu_Record("Sel Not"; "Not ...")
//SRCH_l_And:=3
SRCH_l_Not:=1
ACCEPT:C269
ERR_MethodTrackerReturn("Sel Not"; $_t_oldMethodName)