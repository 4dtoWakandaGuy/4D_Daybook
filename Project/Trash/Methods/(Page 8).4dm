//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Page 8
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

$_t_oldMethodName:=ERR_MethodTracker("Page 8")
Menu_Record("Page 8"; "Page 8")
FORM GOTO PAGE:C247(8)
WS_GoPage:=8
ERR_MethodTrackerReturn("Page 8"; $_t_oldMethodName)