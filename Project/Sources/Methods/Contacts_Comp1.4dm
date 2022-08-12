//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_Comp1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
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

$_t_oldMethodName:=ERR_MethodTracker("Contacts_Comp1")
ERR_MethodTrackerReturn("Contacts_Comp1"; $_t_oldMethodName)