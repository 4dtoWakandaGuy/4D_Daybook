//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menus Find
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
	C_BOOLEAN:C305(<>AutoFind)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menus Find")
//If (◊SinProc=False)
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
BRING TO FRONT:C326(<>MenuProc)
<>AutoFind:=True:C214
//End if
ERR_MethodTrackerReturn("Menus Find"; $_t_oldMethodName)