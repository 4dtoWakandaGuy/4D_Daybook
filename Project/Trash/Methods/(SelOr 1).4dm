//%attributes = {}
If (False:C215)
	//Project Method Name:      SelOr 1
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
	C_BOOLEAN:C305(<>SelOr; vAutoFind)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SelOr 1")
If ((<>SelOr) & (vAutoFind=False:C215))
	
	CREATE SET:C116($1->; "Master2")
End if 
ERR_MethodTrackerReturn("SelOr 1"; $_t_oldMethodName)
