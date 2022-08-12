//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Page 4
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
	C_LONGINT:C283(WS_GoPage)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Page 4")
Menu_Record("Page 4"; "Page 4")
FORM GOTO PAGE:C247(4)
WS_GoPage:=4
ERR_MethodTrackerReturn("Page 4"; $_t_oldMethodName)