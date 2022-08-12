//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ItemCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2010 15:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MovementCode; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ItemCreate")
$_t_MovementCode:=$1
ERR_MethodTrackerReturn("STK_ItemCreate"; $_t_oldMethodName)