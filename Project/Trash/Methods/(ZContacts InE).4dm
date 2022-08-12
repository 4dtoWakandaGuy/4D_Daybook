//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZContacts_InE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2010 04:24
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

$_t_oldMethodName:=ERR_MethodTracker("ZContacts_InE")
ZProc("Contacts_In"; DB_ProcessMemoryinit(3); Term_OrdWT("Enter Enquirers"))
ERR_MethodTrackerReturn("ZContacts_InE"; $_t_oldMethodName)