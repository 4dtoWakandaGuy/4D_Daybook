//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Page_10
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

$_t_oldMethodName:=ERR_MethodTracker("Page_10")

Menu_Record("Page_10"; "Page_10")
FORM GOTO PAGE:C247(10)
WS_GoPage:=10
ERR_MethodTrackerReturn("Page_10"; $_t_oldMethodName)