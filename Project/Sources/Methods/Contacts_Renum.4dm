//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_Renum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:27
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

$_t_oldMethodName:=ERR_MethodTracker("Contacts_Renum")
//Contacts_Renum
DBI_MenuDisplayRecords("ContactsRenum")
ERR_MethodTrackerReturn("Contacts_Renum"; $_t_oldMethodName)