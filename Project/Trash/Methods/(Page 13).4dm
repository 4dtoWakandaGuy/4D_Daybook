//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Page_13
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

$_t_oldMethodName:=ERR_MethodTracker("Page_13")
Menu_Record("Page_13"; "Page_13")
FORM GOTO PAGE:C247(13)
WS_GoPage:=13
ERR_MethodTrackerReturn("Page_13"; $_t_oldMethodName)