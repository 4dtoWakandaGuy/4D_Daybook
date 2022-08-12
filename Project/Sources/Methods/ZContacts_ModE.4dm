//%attributes = {}
If (False:C215)
	//Project Method Name:      ZContacts_ModE
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

$_t_oldMethodName:=ERR_MethodTracker("ZContacts_ModE")
ZProc("Contacts_ModE"; DB_ProcessMemoryinit(3); Term_OrdWT("View Enquirers"))
ERR_MethodTrackerReturn("ZContacts_ModE"; $_t_oldMethodName)