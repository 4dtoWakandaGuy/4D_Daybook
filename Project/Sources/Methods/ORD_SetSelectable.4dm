//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SetSelectable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ORD_SetSelectable")

//ORD_SetSelectable
//sets the order line to selectable
$_t_oldMethodName:=ERR_MethodTracker("ORD_SetSelectable"; Form event code:C388)
If (False:C215)  // not required now
	
End if 
ERR_MethodTrackerReturn("ORD_SetSelectable"; $_t_oldMethodName)