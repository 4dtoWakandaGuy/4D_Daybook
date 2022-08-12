//%attributes = {}
If (False:C215)
	//Project Method Name:      Userset
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Userset")
If (Records in set:C195("Userset")>0)
	USE SET:C118("Userset")
End if 
ERR_MethodTrackerReturn("Userset"; $_t_oldMethodName)