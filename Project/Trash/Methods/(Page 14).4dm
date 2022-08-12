//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Page_14
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

$_t_oldMethodName:=ERR_MethodTracker("Page_14")
Menu_Record("Page_14"; "Page_14")
FORM GOTO PAGE:C247(14)
WS_GoPage:=14
ERR_MethodTrackerReturn("Page_14"; $_t_oldMethodName)