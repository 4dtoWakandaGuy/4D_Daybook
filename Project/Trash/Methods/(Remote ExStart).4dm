//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExStart
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
	C_LONGINT:C283(<>Process)
	C_TEXT:C284($_t_oldMethodName; vCompCode; vFld; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExStart")
READ ONLY:C145(*)
vFld:=Char:C90(200)
vRec:=Char:C90(201)
<>Process:=Current process:C322
vCompCode:=[PERSONNEL:11]Last_Export:10
ERR_MethodTrackerReturn("Remote ExStart"; $_t_oldMethodName)