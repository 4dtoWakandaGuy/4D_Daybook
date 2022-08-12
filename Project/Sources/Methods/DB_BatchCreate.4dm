//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BatchCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/03/2011 12:41 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BatchCreate")
Orders_InvB
ERR_MethodTrackerReturn("DB_BatchCreate"; $_t_oldMethodName)