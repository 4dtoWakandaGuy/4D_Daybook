//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InE
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

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InE")
ERR_MethodTrackerReturn("Contacts_InE"; $_t_oldMethodName)